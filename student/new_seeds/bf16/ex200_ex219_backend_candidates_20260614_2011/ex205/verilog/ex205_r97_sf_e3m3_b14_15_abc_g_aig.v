module ex205_r97_sf_e3m3_b14_15_abc_g_aig(in, out);
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
    out_sign = 1'h0;
    casez (sign_exp)
      9'b000??????: out_sign = 1'h1;
      9'b0010?????: out_sign = 1'h1;
      9'b00110????: out_sign = 1'h1;
      9'b001110???: out_sign = 1'h1;
      9'b0011110??: out_sign = 1'h1;
      9'b00111110?: out_sign = 1'h1;
      9'b001111110: out_sign = 1'h1;
      9'b100000000: out_sign = 1'h1;
      default: begin end
    endcase
  end
  always @* begin
    out_exp = 8'hff;
    casez (sign_exp)
      9'b001111100: out_exp = 8'h7e;
      9'b010000001: out_exp = 8'h7e;
      9'b001111001: out_exp = 8'h7f;
      9'b001111010: out_exp = 8'h7f;
      9'b010000011: out_exp = 8'h7f;
      9'b010000100: out_exp = 8'h7f;
      9'b00111001?: out_exp = 8'h80;
      9'b0011101??: out_exp = 8'h80;
      9'b01000011?: out_exp = 8'h80;
      9'b0100010??: out_exp = 8'h80;
      9'b001100101: out_exp = 8'h81;
      9'b00110011?: out_exp = 8'h81;
      9'b001101???: out_exp = 8'h81;
      9'b001110000: out_exp = 8'h81;
      9'b010001101: out_exp = 8'h81;
      9'b01000111?: out_exp = 8'h81;
      9'b010010???: out_exp = 8'h81;
      9'b010011000: out_exp = 8'h81;
      9'b00100101?: out_exp = 8'h82;
      9'b0010011??: out_exp = 8'h82;
      9'b00101????: out_exp = 8'h82;
      9'b0011000??: out_exp = 8'h82;
      9'b01001101?: out_exp = 8'h82;
      9'b0100111??: out_exp = 8'h82;
      9'b01010????: out_exp = 8'h82;
      9'b0101100??: out_exp = 8'h82;
      9'b000010101: out_exp = 8'h83;
      9'b00001011?: out_exp = 8'h83;
      9'b000011???: out_exp = 8'h83;
      9'b0001?????: out_exp = 8'h83;
      9'b001000???: out_exp = 8'h83;
      9'b001001000: out_exp = 8'h83;
      9'b010110101: out_exp = 8'h83;
      9'b01011011?: out_exp = 8'h83;
      9'b010111???: out_exp = 8'h83;
      9'b0110?????: out_exp = 8'h83;
      9'b011100???: out_exp = 8'h83;
      9'b011101000: out_exp = 8'h83;
      9'b000000001: out_exp = 8'h84;
      9'b00000001?: out_exp = 8'h84;
      9'b0000001??: out_exp = 8'h84;
      9'b000001???: out_exp = 8'h84;
      9'b0000100??: out_exp = 8'h84;
      9'b01110101?: out_exp = 8'h84;
      9'b0111011??: out_exp = 8'h84;
      9'b011110???: out_exp = 8'h84;
      9'b0111110??: out_exp = 8'h84;
      9'b01111110?: out_exp = 8'h84;
      9'b011111110: out_exp = 8'h84;
      9'h014: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h84;
          end
          3'h1: begin
            out_exp = 8'h84;
          end
          3'h2: begin
            out_exp = 8'h84;
          end
          3'h3: begin
            out_exp = 8'h84;
          end
          3'h4: begin
            out_exp = 8'h84;
          end
          3'h5: begin
            out_exp = 8'h84;
          end
          3'h6: begin
            out_exp = 8'h84;
          end
          3'h7: begin
            out_exp = 8'h83;
          end
          default: begin end
        endcase
      end
      9'h049: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h83;
          end
          3'h1: begin
            out_exp = 8'h83;
          end
          3'h2: begin
            out_exp = 8'h83;
          end
          3'h3: begin
            out_exp = 8'h83;
          end
          3'h4: begin
            out_exp = 8'h83;
          end
          3'h5: begin
            out_exp = 8'h83;
          end
          3'h6: begin
            out_exp = 8'h83;
          end
          3'h7: begin
            out_exp = 8'h83;
            case (mant_lo4)
              4'h8: out_exp = 8'h82;
              4'h9: out_exp = 8'h82;
              4'ha: out_exp = 8'h82;
              4'hb: out_exp = 8'h82;
              4'hc: out_exp = 8'h82;
              4'hd: out_exp = 8'h82;
              4'he: out_exp = 8'h82;
              4'hf: out_exp = 8'h82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h064: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h82;
          end
          3'h1: begin
            out_exp = 8'h82;
          end
          3'h2: begin
            out_exp = 8'h82;
          end
          3'h3: begin
            out_exp = 8'h81;
            case (mant_lo4)
              4'h0: out_exp = 8'h82;
              4'h1: out_exp = 8'h82;
              4'h2: out_exp = 8'h82;
              default: begin end
            endcase
          end
          3'h4: begin
            out_exp = 8'h81;
          end
          3'h5: begin
            out_exp = 8'h81;
          end
          3'h6: begin
            out_exp = 8'h81;
          end
          3'h7: begin
            out_exp = 8'h81;
          end
          default: begin end
        endcase
      end
      9'h071: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h81;
          end
          3'h1: begin
            out_exp = 8'h81;
          end
          3'h2: begin
            out_exp = 8'h81;
          end
          3'h3: begin
            out_exp = 8'h81;
          end
          3'h4: begin
            out_exp = 8'h81;
          end
          3'h5: begin
            out_exp = 8'h80;
            case (mant_lo4)
              4'h0: out_exp = 8'h81;
              4'h1: out_exp = 8'h81;
              4'h2: out_exp = 8'h81;
              4'h3: out_exp = 8'h81;
              4'h4: out_exp = 8'h81;
              4'h5: out_exp = 8'h81;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h80;
          end
          3'h7: begin
            out_exp = 8'h80;
          end
          default: begin end
        endcase
      end
      9'h078: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h80;
          end
          3'h1: begin
            out_exp = 8'h80;
          end
          3'h2: begin
            out_exp = 8'h7f;
            case (mant_lo4)
              4'h0: out_exp = 8'h80;
              4'h1: out_exp = 8'h80;
              4'h2: out_exp = 8'h80;
              4'h3: out_exp = 8'h80;
              4'h4: out_exp = 8'h80;
              4'h5: out_exp = 8'h80;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h7f;
          end
          3'h4: begin
            out_exp = 8'h7f;
          end
          3'h5: begin
            out_exp = 8'h7f;
          end
          3'h6: begin
            out_exp = 8'h7f;
          end
          3'h7: begin
            out_exp = 8'h7f;
          end
          default: begin end
        endcase
      end
      9'h07b: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7f;
          end
          3'h1: begin
            out_exp = 8'h7f;
          end
          3'h2: begin
            out_exp = 8'h7f;
          end
          3'h3: begin
            out_exp = 8'h7f;
          end
          3'h4: begin
            out_exp = 8'h7f;
            case (mant_lo4)
              4'he: out_exp = 8'h7e;
              4'hf: out_exp = 8'h7e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h7e;
          end
          3'h6: begin
            out_exp = 8'h7e;
          end
          3'h7: begin
            out_exp = 8'h7e;
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7e;
          end
          3'h1: begin
            out_exp = 8'h7e;
          end
          3'h2: begin
            out_exp = 8'h7d;
            case (mant_lo4)
              4'h0: out_exp = 8'h7e;
              4'h1: out_exp = 8'h7e;
              4'h2: out_exp = 8'h7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h7d;
          end
          3'h4: begin
            out_exp = 8'h7d;
          end
          3'h5: begin
            out_exp = 8'h7d;
          end
          3'h6: begin
            out_exp = 8'h7d;
          end
          3'h7: begin
            out_exp = 8'h7d;
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7d;
          end
          3'h1: begin
            out_exp = 8'h7c;
            case (mant_lo4)
              4'h0: out_exp = 8'h7d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h7c;
          end
          3'h3: begin
            out_exp = 8'h7c;
          end
          3'h4: begin
            out_exp = 8'h7b;
            case (mant_lo4)
              4'h0: out_exp = 8'h7c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h7b;
            case (mant_lo4)
              4'he: out_exp = 8'h7a;
              4'hf: out_exp = 8'h7a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h7a;
            case (mant_lo4)
              4'hf: out_exp = 8'h79;
              default: begin end
            endcase
          end
          3'h7: begin
            out_exp = 8'h79;
            case (mant_lo4)
              4'h7: out_exp = 8'h78;
              4'h8: out_exp = 8'h78;
              4'h9: out_exp = 8'h78;
              4'ha: out_exp = 8'h78;
              4'hb: out_exp = 8'h78;
              4'hc: out_exp = 8'h77;
              4'hd: out_exp = 8'h77;
              4'he: out_exp = 8'h76;
              4'hf: out_exp = 8'h75;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7a;
            case (mant_lo4)
              4'h0: out_exp = 8'h00;
              4'h1: out_exp = 8'h76;
              4'h2: out_exp = 8'h77;
              4'h3: out_exp = 8'h78;
              4'h4: out_exp = 8'h78;
              4'h5: out_exp = 8'h79;
              4'h6: out_exp = 8'h79;
              4'h7: out_exp = 8'h79;
              4'h8: out_exp = 8'h79;
              4'h9: out_exp = 8'h79;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h7b;
            case (mant_lo4)
              4'h0: out_exp = 8'h7a;
              4'h1: out_exp = 8'h7a;
              4'h2: out_exp = 8'h7a;
              4'h3: out_exp = 8'h7a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h7b;
            case (mant_lo4)
              4'hb: out_exp = 8'h7c;
              4'hc: out_exp = 8'h7c;
              4'hd: out_exp = 8'h7c;
              4'he: out_exp = 8'h7c;
              4'hf: out_exp = 8'h7c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h7c;
          end
          3'h4: begin
            out_exp = 8'h7c;
          end
          3'h5: begin
            out_exp = 8'h7c;
          end
          3'h6: begin
            out_exp = 8'h7d;
            case (mant_lo4)
              4'h0: out_exp = 8'h7c;
              4'h1: out_exp = 8'h7c;
              4'h2: out_exp = 8'h7c;
              4'h3: out_exp = 8'h7c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_exp = 8'h7d;
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7d;
          end
          3'h1: begin
            out_exp = 8'h7d;
          end
          3'h2: begin
            out_exp = 8'h7d;
          end
          3'h3: begin
            out_exp = 8'h7d;
          end
          3'h4: begin
            out_exp = 8'h7d;
            case (mant_lo4)
              4'ha: out_exp = 8'h7e;
              4'hb: out_exp = 8'h7e;
              4'hc: out_exp = 8'h7e;
              4'hd: out_exp = 8'h7e;
              4'he: out_exp = 8'h7e;
              4'hf: out_exp = 8'h7e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h7e;
          end
          3'h6: begin
            out_exp = 8'h7e;
          end
          3'h7: begin
            out_exp = 8'h7e;
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7e;
          end
          3'h1: begin
            out_exp = 8'h7e;
          end
          3'h2: begin
            out_exp = 8'h7f;
          end
          3'h3: begin
            out_exp = 8'h7f;
          end
          3'h4: begin
            out_exp = 8'h7f;
          end
          3'h5: begin
            out_exp = 8'h7f;
          end
          3'h6: begin
            out_exp = 8'h7f;
          end
          3'h7: begin
            out_exp = 8'h7f;
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7f;
          end
          3'h1: begin
            out_exp = 8'h7f;
          end
          3'h2: begin
            out_exp = 8'h7f;
          end
          3'h3: begin
            out_exp = 8'h7f;
          end
          3'h4: begin
            out_exp = 8'h80;
            case (mant_lo4)
              4'h0: out_exp = 8'h7f;
              4'h1: out_exp = 8'h7f;
              4'h2: out_exp = 8'h7f;
              4'h3: out_exp = 8'h7f;
              4'h4: out_exp = 8'h7f;
              4'h5: out_exp = 8'h7f;
              4'h6: out_exp = 8'h7f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h80;
          end
          3'h6: begin
            out_exp = 8'h80;
          end
          3'h7: begin
            out_exp = 8'h80;
          end
          default: begin end
        endcase
      end
      9'h08c: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h80;
          end
          3'h1: begin
            out_exp = 8'h80;
            case (mant_lo4)
              4'ha: out_exp = 8'h81;
              4'hb: out_exp = 8'h81;
              4'hc: out_exp = 8'h81;
              4'hd: out_exp = 8'h81;
              4'he: out_exp = 8'h81;
              4'hf: out_exp = 8'h81;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h81;
          end
          3'h3: begin
            out_exp = 8'h81;
          end
          3'h4: begin
            out_exp = 8'h81;
          end
          3'h5: begin
            out_exp = 8'h81;
          end
          3'h6: begin
            out_exp = 8'h81;
          end
          3'h7: begin
            out_exp = 8'h81;
          end
          default: begin end
        endcase
      end
      9'h099: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h81;
          end
          3'h1: begin
            out_exp = 8'h81;
          end
          3'h2: begin
            out_exp = 8'h81;
          end
          3'h3: begin
            out_exp = 8'h81;
            case (mant_lo4)
              4'h8: out_exp = 8'h82;
              4'h9: out_exp = 8'h82;
              4'ha: out_exp = 8'h82;
              4'hb: out_exp = 8'h82;
              4'hc: out_exp = 8'h82;
              4'hd: out_exp = 8'h82;
              4'he: out_exp = 8'h82;
              4'hf: out_exp = 8'h82;
              default: begin end
            endcase
          end
          3'h4: begin
            out_exp = 8'h82;
          end
          3'h5: begin
            out_exp = 8'h82;
          end
          3'h6: begin
            out_exp = 8'h82;
          end
          3'h7: begin
            out_exp = 8'h82;
          end
          default: begin end
        endcase
      end
      9'h0b4: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h83;
            case (mant_lo4)
              4'h0: out_exp = 8'h82;
              4'h1: out_exp = 8'h82;
              4'h2: out_exp = 8'h82;
              4'h3: out_exp = 8'h82;
              4'h4: out_exp = 8'h82;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h83;
          end
          3'h2: begin
            out_exp = 8'h83;
          end
          3'h3: begin
            out_exp = 8'h83;
          end
          3'h4: begin
            out_exp = 8'h83;
          end
          3'h5: begin
            out_exp = 8'h83;
          end
          3'h6: begin
            out_exp = 8'h83;
          end
          3'h7: begin
            out_exp = 8'h83;
          end
          default: begin end
        endcase
      end
      9'h0e9: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h83;
            case (mant_lo4)
              4'h9: out_exp = 8'h84;
              4'ha: out_exp = 8'h84;
              4'hb: out_exp = 8'h84;
              4'hc: out_exp = 8'h84;
              4'hd: out_exp = 8'h84;
              4'he: out_exp = 8'h84;
              4'hf: out_exp = 8'h84;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h84;
          end
          3'h2: begin
            out_exp = 8'h84;
          end
          3'h3: begin
            out_exp = 8'h84;
          end
          3'h4: begin
            out_exp = 8'h84;
          end
          3'h5: begin
            out_exp = 8'h84;
          end
          3'h6: begin
            out_exp = 8'h84;
          end
          3'h7: begin
            out_exp = 8'h84;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  always @* begin
    out_mant = 7'h40;
    casez (sign_exp)
      9'b000000000: out_mant = 7'h00;
      9'b100000000: out_mant = 7'h00;
      9'h001: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h18;
          end
          3'h1: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h18;
              4'h1: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h17;
          end
          3'h3: begin
            out_mant = 7'h17;
          end
          3'h4: begin
            out_mant = 7'h17;
          end
          3'h5: begin
            out_mant = 7'h17;
          end
          3'h6: begin
            out_mant = 7'h17;
          end
          3'h7: begin
            out_mant = 7'h17;
          end
          default: begin end
        endcase
      end
      9'h002: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h16;
          end
          3'h2: begin
            out_mant = 7'h16;
          end
          3'h3: begin
            out_mant = 7'h16;
          end
          3'h4: begin
            out_mant = 7'h16;
          end
          3'h5: begin
            out_mant = 7'h16;
          end
          3'h6: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h16;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h15;
          end
          default: begin end
        endcase
      end
      9'h003: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h15;
          end
          3'h1: begin
            out_mant = 7'h15;
          end
          3'h2: begin
            out_mant = 7'h15;
          end
          3'h3: begin
            out_mant = 7'h15;
          end
          3'h4: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h14;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h14;
          end
          3'h6: begin
            out_mant = 7'h14;
          end
          3'h7: begin
            out_mant = 7'h14;
          end
          default: begin end
        endcase
      end
      9'h004: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h14;
          end
          3'h1: begin
            out_mant = 7'h14;
          end
          3'h2: begin
            out_mant = 7'h14;
          end
          3'h3: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h14;
              4'h2: out_mant = 7'h14;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h13;
          end
          3'h5: begin
            out_mant = 7'h13;
          end
          3'h6: begin
            out_mant = 7'h13;
          end
          3'h7: begin
            out_mant = 7'h13;
          end
          default: begin end
        endcase
      end
      9'h005: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h13;
          end
          3'h1: begin
            out_mant = 7'h13;
          end
          3'h2: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'h0: out_mant = 7'h13;
              4'h1: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h12;
          end
          3'h4: begin
            out_mant = 7'h12;
          end
          3'h5: begin
            out_mant = 7'h12;
          end
          3'h6: begin
            out_mant = 7'h12;
          end
          3'h7: begin
            out_mant = 7'h12;
          end
          default: begin end
        endcase
      end
      9'h006: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h12;
          end
          3'h1: begin
            out_mant = 7'h11;
          end
          3'h2: begin
            out_mant = 7'h11;
          end
          3'h3: begin
            out_mant = 7'h11;
          end
          3'h4: begin
            out_mant = 7'h11;
          end
          3'h5: begin
            out_mant = 7'h11;
          end
          3'h6: begin
            out_mant = 7'h11;
          end
          3'h7: begin
            out_mant = 7'h11;
          end
          default: begin end
        endcase
      end
      9'h007: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h10;
          end
          3'h1: begin
            out_mant = 7'h10;
          end
          3'h2: begin
            out_mant = 7'h10;
          end
          3'h3: begin
            out_mant = 7'h10;
          end
          3'h4: begin
            out_mant = 7'h10;
          end
          3'h5: begin
            out_mant = 7'h10;
          end
          3'h6: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              4'h1: out_mant = 7'h10;
              4'h2: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h0f;
          end
          default: begin end
        endcase
      end
      9'h008: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0f;
          end
          3'h1: begin
            out_mant = 7'h0f;
          end
          3'h2: begin
            out_mant = 7'h0f;
          end
          3'h3: begin
            out_mant = 7'h0f;
          end
          3'h4: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'ha: out_mant = 7'h0e;
              4'hb: out_mant = 7'h0e;
              4'hc: out_mant = 7'h0e;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0e;
          end
          3'h6: begin
            out_mant = 7'h0e;
          end
          3'h7: begin
            out_mant = 7'h0e;
          end
          default: begin end
        endcase
      end
      9'h009: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0e;
          end
          3'h1: begin
            out_mant = 7'h0e;
          end
          3'h2: begin
            out_mant = 7'h0e;
          end
          3'h3: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h0: out_mant = 7'h0e;
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h0e;
              4'h3: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0d;
          end
          3'h5: begin
            out_mant = 7'h0d;
          end
          3'h6: begin
            out_mant = 7'h0d;
          end
          3'h7: begin
            out_mant = 7'h0d;
          end
          default: begin end
        endcase
      end
      9'h00a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0d;
          end
          3'h1: begin
            out_mant = 7'h0d;
          end
          3'h2: begin
            out_mant = 7'h0c;
          end
          3'h3: begin
            out_mant = 7'h0c;
          end
          3'h4: begin
            out_mant = 7'h0c;
          end
          3'h5: begin
            out_mant = 7'h0c;
          end
          3'h6: begin
            out_mant = 7'h0c;
          end
          3'h7: begin
            out_mant = 7'h0c;
          end
          default: begin end
        endcase
      end
      9'h00b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'he: out_mant = 7'h0b;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0b;
          end
          3'h2: begin
            out_mant = 7'h0b;
          end
          3'h3: begin
            out_mant = 7'h0b;
          end
          3'h4: begin
            out_mant = 7'h0b;
          end
          3'h5: begin
            out_mant = 7'h0b;
          end
          3'h6: begin
            out_mant = 7'h0b;
          end
          3'h7: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h00c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0a;
          end
          3'h1: begin
            out_mant = 7'h0a;
          end
          3'h2: begin
            out_mant = 7'h0a;
          end
          3'h3: begin
            out_mant = 7'h0a;
          end
          3'h4: begin
            out_mant = 7'h0a;
          end
          3'h5: begin
            out_mant = 7'h0a;
          end
          3'h6: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h09;
          end
          default: begin end
        endcase
      end
      9'h00d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h09;
          end
          3'h1: begin
            out_mant = 7'h09;
          end
          3'h2: begin
            out_mant = 7'h09;
          end
          3'h3: begin
            out_mant = 7'h09;
          end
          3'h4: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h8: out_mant = 7'h08;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h08;
              4'hc: out_mant = 7'h08;
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h08;
              4'hf: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h08;
          end
          3'h6: begin
            out_mant = 7'h08;
          end
          3'h7: begin
            out_mant = 7'h08;
          end
          default: begin end
        endcase
      end
      9'h00e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h08;
          end
          3'h1: begin
            out_mant = 7'h08;
          end
          3'h2: begin
            out_mant = 7'h08;
          end
          3'h3: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h07;
          end
          3'h5: begin
            out_mant = 7'h07;
          end
          3'h6: begin
            out_mant = 7'h07;
          end
          3'h7: begin
            out_mant = 7'h07;
          end
          default: begin end
        endcase
      end
      9'h00f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h07;
          end
          3'h1: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h06;
          end
          3'h3: begin
            out_mant = 7'h06;
          end
          3'h4: begin
            out_mant = 7'h06;
          end
          3'h5: begin
            out_mant = 7'h06;
          end
          3'h6: begin
            out_mant = 7'h06;
          end
          3'h7: begin
            out_mant = 7'h06;
          end
          default: begin end
        endcase
      end
      9'h010: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'hd: out_mant = 7'h05;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h05;
          end
          3'h2: begin
            out_mant = 7'h05;
          end
          3'h3: begin
            out_mant = 7'h05;
          end
          3'h4: begin
            out_mant = 7'h05;
          end
          3'h5: begin
            out_mant = 7'h05;
          end
          3'h6: begin
            out_mant = 7'h05;
          end
          3'h7: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'ha: out_mant = 7'h04;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h011: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h04;
          end
          3'h1: begin
            out_mant = 7'h04;
          end
          3'h2: begin
            out_mant = 7'h04;
          end
          3'h3: begin
            out_mant = 7'h04;
          end
          3'h4: begin
            out_mant = 7'h04;
          end
          3'h5: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h03;
          end
          3'h7: begin
            out_mant = 7'h03;
          end
          default: begin end
        endcase
      end
      9'h012: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h03;
          end
          3'h1: begin
            out_mant = 7'h03;
          end
          3'h2: begin
            out_mant = 7'h03;
          end
          3'h3: begin
            out_mant = 7'h03;
          end
          3'h4: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h03;
              4'h3: out_mant = 7'h03;
              4'h4: out_mant = 7'h03;
              4'h5: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h02;
          end
          3'h6: begin
            out_mant = 7'h02;
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h013: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
          end
          3'h1: begin
            out_mant = 7'h02;
          end
          3'h2: begin
            out_mant = 7'h02;
          end
          3'h3: begin
            out_mant = 7'h01;
          end
          3'h4: begin
            out_mant = 7'h01;
          end
          3'h5: begin
            out_mant = 7'h01;
          end
          3'h6: begin
            out_mant = 7'h01;
          end
          3'h7: begin
            out_mant = 7'h01;
          end
          default: begin end
        endcase
      end
      9'h014: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h01;
          end
          3'h1: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h00;
              4'he: out_mant = 7'h00;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h00;
          end
          3'h3: begin
            out_mant = 7'h00;
          end
          3'h4: begin
            out_mant = 7'h00;
          end
          3'h5: begin
            out_mant = 7'h00;
          end
          3'h6: begin
            out_mant = 7'h00;
          end
          3'h7: begin
            out_mant = 7'h7f;
          end
          default: begin end
        endcase
      end
      9'h015: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
          end
          3'h1: begin
            out_mant = 7'h7f;
          end
          3'h2: begin
            out_mant = 7'h7e;
          end
          3'h3: begin
            out_mant = 7'h7e;
          end
          3'h4: begin
            out_mant = 7'h7e;
          end
          3'h5: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7e;
              4'h5: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h7d;
          end
          3'h7: begin
            out_mant = 7'h7d;
          end
          default: begin end
        endcase
      end
      9'h016: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7c;
          end
          3'h2: begin
            out_mant = 7'h7c;
          end
          3'h3: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'he: out_mant = 7'h7b;
              4'hf: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h7b;
          end
          3'h5: begin
            out_mant = 7'h7b;
          end
          3'h6: begin
            out_mant = 7'h7b;
          end
          3'h7: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'hd: out_mant = 7'h7a;
              4'he: out_mant = 7'h7a;
              4'hf: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h017: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7a;
          end
          3'h1: begin
            out_mant = 7'h7a;
          end
          3'h2: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h9: out_mant = 7'h79;
              4'ha: out_mant = 7'h79;
              4'hb: out_mant = 7'h79;
              4'hc: out_mant = 7'h79;
              4'hd: out_mant = 7'h79;
              4'he: out_mant = 7'h79;
              4'hf: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h79;
          end
          3'h4: begin
            out_mant = 7'h79;
          end
          3'h5: begin
            out_mant = 7'h79;
          end
          3'h6: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h78;
          end
          default: begin end
        endcase
      end
      9'h018: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h78;
          end
          3'h1: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h0: out_mant = 7'h78;
              4'h1: out_mant = 7'h78;
              4'h2: out_mant = 7'h78;
              4'h3: out_mant = 7'h78;
              4'h4: out_mant = 7'h78;
              4'h5: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h77;
          end
          3'h3: begin
            out_mant = 7'h77;
          end
          3'h4: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h8: out_mant = 7'h76;
              4'h9: out_mant = 7'h76;
              4'ha: out_mant = 7'h76;
              4'hb: out_mant = 7'h76;
              4'hc: out_mant = 7'h76;
              4'hd: out_mant = 7'h76;
              4'he: out_mant = 7'h76;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h76;
          end
          3'h6: begin
            out_mant = 7'h76;
          end
          3'h7: begin
            out_mant = 7'h76;
          end
          default: begin end
        endcase
      end
      9'h019: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              4'h1: out_mant = 7'h76;
              4'h2: out_mant = 7'h76;
              4'h3: out_mant = 7'h76;
              4'h4: out_mant = 7'h76;
              4'h5: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h75;
          end
          3'h2: begin
            out_mant = 7'h75;
          end
          3'h3: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h0: out_mant = 7'h75;
              4'h1: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h74;
          end
          3'h5: begin
            out_mant = 7'h74;
          end
          3'h6: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h73;
          end
          default: begin end
        endcase
      end
      9'h01a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h73;
          end
          3'h1: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h72;
          end
          3'h3: begin
            out_mant = 7'h72;
          end
          3'h4: begin
            out_mant = 7'h72;
          end
          3'h5: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'h1: out_mant = 7'h72;
              4'h2: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h71;
          end
          3'h7: begin
            out_mant = 7'h71;
          end
          default: begin end
        endcase
      end
      9'h01b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'hd: out_mant = 7'h70;
              4'he: out_mant = 7'h70;
              4'hf: out_mant = 7'h70;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h70;
          end
          3'h2: begin
            out_mant = 7'h70;
          end
          3'h3: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6f;
          end
          3'h5: begin
            out_mant = 7'h6f;
          end
          3'h6: begin
            out_mant = 7'h6f;
          end
          3'h7: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'ha: out_mant = 7'h6e;
              4'hb: out_mant = 7'h6e;
              4'hc: out_mant = 7'h6e;
              4'hd: out_mant = 7'h6e;
              4'he: out_mant = 7'h6e;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h01c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6e;
          end
          3'h1: begin
            out_mant = 7'h6e;
          end
          3'h2: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h0: out_mant = 7'h6e;
              4'h1: out_mant = 7'h6e;
              4'h2: out_mant = 7'h6e;
              4'h3: out_mant = 7'h6e;
              4'h4: out_mant = 7'h6e;
              4'h5: out_mant = 7'h6e;
              4'h6: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6d;
          end
          3'h4: begin
            out_mant = 7'h6d;
          end
          3'h5: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6c;
          end
          3'h7: begin
            out_mant = 7'h6c;
          end
          default: begin end
        endcase
      end
      9'h01d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6c;
          end
          3'h1: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h6c;
              4'h1: out_mant = 7'h6c;
              4'h2: out_mant = 7'h6c;
              4'h3: out_mant = 7'h6c;
              4'h4: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6b;
          end
          3'h3: begin
            out_mant = 7'h6b;
          end
          3'h4: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h0: out_mant = 7'h6b;
              4'h1: out_mant = 7'h6b;
              4'h2: out_mant = 7'h6b;
              4'h3: out_mant = 7'h6b;
              4'h4: out_mant = 7'h6b;
              4'h5: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6a;
          end
          3'h6: begin
            out_mant = 7'h6a;
          end
          3'h7: begin
            out_mant = 7'h6a;
          end
          default: begin end
        endcase
      end
      9'h01e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h0: out_mant = 7'h6a;
              4'h1: out_mant = 7'h6a;
              4'h2: out_mant = 7'h6a;
              4'h3: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h69;
          end
          3'h2: begin
            out_mant = 7'h69;
          end
          3'h3: begin
            out_mant = 7'h68;
          end
          3'h4: begin
            out_mant = 7'h68;
          end
          3'h5: begin
            out_mant = 7'h68;
          end
          3'h6: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'hb: out_mant = 7'h67;
              4'hc: out_mant = 7'h67;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h67;
          end
          default: begin end
        endcase
      end
      9'h01f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h67;
          end
          3'h1: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h66;
          end
          3'h3: begin
            out_mant = 7'h66;
          end
          3'h4: begin
            out_mant = 7'h66;
          end
          3'h5: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h65;
          end
          3'h7: begin
            out_mant = 7'h65;
          end
          default: begin end
        endcase
      end
      9'h020: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'hb: out_mant = 7'h64;
              4'hc: out_mant = 7'h64;
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h64;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h64;
          end
          3'h2: begin
            out_mant = 7'h64;
          end
          3'h3: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'ha: out_mant = 7'h63;
              4'hb: out_mant = 7'h63;
              4'hc: out_mant = 7'h63;
              4'hd: out_mant = 7'h63;
              4'he: out_mant = 7'h63;
              4'hf: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h63;
          end
          3'h5: begin
            out_mant = 7'h63;
          end
          3'h6: begin
            out_mant = 7'h63;
          end
          3'h7: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              4'h1: out_mant = 7'h63;
              4'h2: out_mant = 7'h63;
              4'h3: out_mant = 7'h63;
              4'h4: out_mant = 7'h63;
              4'h5: out_mant = 7'h63;
              4'h6: out_mant = 7'h63;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h021: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h62;
          end
          3'h1: begin
            out_mant = 7'h62;
          end
          3'h2: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h62;
              4'h3: out_mant = 7'h62;
              4'h4: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h61;
          end
          3'h4: begin
            out_mant = 7'h61;
          end
          3'h5: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'hc: out_mant = 7'h60;
              4'hd: out_mant = 7'h60;
              4'he: out_mant = 7'h60;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h60;
          end
          3'h7: begin
            out_mant = 7'h60;
          end
          default: begin end
        endcase
      end
      9'h022: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h60;
          end
          3'h1: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5f;
          end
          3'h3: begin
            out_mant = 7'h5f;
          end
          3'h4: begin
            out_mant = 7'h5e;
            case (mant_lo4)
              4'h0: out_mant = 7'h5f;
              4'h1: out_mant = 7'h5f;
              4'h2: out_mant = 7'h5f;
              4'h3: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h5e;
          end
          3'h6: begin
            out_mant = 7'h5e;
          end
          3'h7: begin
            out_mant = 7'h5e;
          end
          default: begin end
        endcase
      end
      9'h023: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h0: out_mant = 7'h5e;
              4'h1: out_mant = 7'h5e;
              4'h2: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5d;
          end
          3'h2: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h5c;
          end
          3'h4: begin
            out_mant = 7'h5c;
          end
          3'h5: begin
            out_mant = 7'h5c;
          end
          3'h6: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'h8: out_mant = 7'h5b;
              4'h9: out_mant = 7'h5b;
              4'ha: out_mant = 7'h5b;
              4'hb: out_mant = 7'h5b;
              4'hc: out_mant = 7'h5b;
              4'hd: out_mant = 7'h5b;
              4'he: out_mant = 7'h5b;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h5b;
          end
          default: begin end
        endcase
      end
      9'h024: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5b;
          end
          3'h1: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'hb: out_mant = 7'h5a;
              4'hc: out_mant = 7'h5a;
              4'hd: out_mant = 7'h5a;
              4'he: out_mant = 7'h5a;
              4'hf: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5a;
          end
          3'h3: begin
            out_mant = 7'h5a;
          end
          3'h4: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'he: out_mant = 7'h59;
              4'hf: out_mant = 7'h59;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h59;
          end
          3'h6: begin
            out_mant = 7'h59;
          end
          3'h7: begin
            out_mant = 7'h59;
          end
          default: begin end
        endcase
      end
      9'h025: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'ha: out_mant = 7'h58;
              4'hb: out_mant = 7'h58;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h58;
          end
          3'h2: begin
            out_mant = 7'h58;
          end
          3'h3: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h1: out_mant = 7'h58;
              4'h2: out_mant = 7'h58;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h58;
              4'h5: out_mant = 7'h58;
              4'h6: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h57;
          end
          3'h5: begin
            out_mant = 7'h57;
          end
          3'h6: begin
            out_mant = 7'h57;
          end
          3'h7: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h57;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h57;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h026: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h56;
          end
          3'h1: begin
            out_mant = 7'h56;
          end
          3'h2: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h0: out_mant = 7'h56;
              4'h1: out_mant = 7'h56;
              4'h2: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h55;
          end
          3'h4: begin
            out_mant = 7'h55;
          end
          3'h5: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h9: out_mant = 7'h54;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h54;
              4'hc: out_mant = 7'h54;
              4'hd: out_mant = 7'h54;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h54;
          end
          3'h7: begin
            out_mant = 7'h54;
          end
          default: begin end
        endcase
      end
      9'h027: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h54;
          end
          3'h1: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h53;
          end
          3'h3: begin
            out_mant = 7'h53;
          end
          3'h4: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h0: out_mant = 7'h53;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h52;
          end
          3'h6: begin
            out_mant = 7'h52;
          end
          3'h7: begin
            out_mant = 7'h52;
          end
          default: begin end
        endcase
      end
      9'h028: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h0: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h51;
          end
          3'h2: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'hc: out_mant = 7'h50;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h50;
          end
          3'h4: begin
            out_mant = 7'h50;
          end
          3'h5: begin
            out_mant = 7'h50;
          end
          3'h6: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h0: out_mant = 7'h50;
              4'h1: out_mant = 7'h50;
              4'h2: out_mant = 7'h50;
              4'h3: out_mant = 7'h50;
              4'h4: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4f;
          end
          default: begin end
        endcase
      end
      9'h029: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4f;
          end
          3'h1: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h9: out_mant = 7'h4e;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4e;
          end
          3'h3: begin
            out_mant = 7'h4e;
          end
          3'h4: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'hc: out_mant = 7'h4d;
              4'hd: out_mant = 7'h4d;
              4'he: out_mant = 7'h4d;
              4'hf: out_mant = 7'h4d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4d;
          end
          3'h6: begin
            out_mant = 7'h4d;
          end
          3'h7: begin
            out_mant = 7'h4d;
          end
          default: begin end
        endcase
      end
      9'h02a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h8: out_mant = 7'h4c;
              4'h9: out_mant = 7'h4c;
              4'ha: out_mant = 7'h4c;
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h4c;
          end
          3'h2: begin
            out_mant = 7'h4c;
          end
          3'h3: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h0: out_mant = 7'h4c;
              4'h1: out_mant = 7'h4c;
              4'h2: out_mant = 7'h4c;
              4'h3: out_mant = 7'h4c;
              4'h4: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4b;
          end
          3'h5: begin
            out_mant = 7'h4b;
          end
          3'h6: begin
            out_mant = 7'h4b;
          end
          3'h7: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h0: out_mant = 7'h4b;
              4'h1: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h02b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4a;
          end
          3'h1: begin
            out_mant = 7'h4a;
          end
          3'h2: begin
            out_mant = 7'h49;
            case (mant_lo4)
              4'h0: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h49;
          end
          3'h4: begin
            out_mant = 7'h49;
          end
          3'h5: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              4'h2: out_mant = 7'h49;
              4'h3: out_mant = 7'h49;
              4'h4: out_mant = 7'h49;
              4'h5: out_mant = 7'h49;
              4'h6: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h48;
          end
          3'h7: begin
            out_mant = 7'h48;
          end
          default: begin end
        endcase
      end
      9'h02c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h47;
          end
          3'h2: begin
            out_mant = 7'h47;
          end
          3'h3: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'hf: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h46;
          end
          3'h5: begin
            out_mant = 7'h46;
          end
          3'h6: begin
            out_mant = 7'h46;
          end
          3'h7: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'hf: out_mant = 7'h45;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h02d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h45;
          end
          3'h1: begin
            out_mant = 7'h45;
          end
          3'h2: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'ha: out_mant = 7'h44;
              4'hb: out_mant = 7'h44;
              4'hc: out_mant = 7'h44;
              4'hd: out_mant = 7'h44;
              4'he: out_mant = 7'h44;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h44;
          end
          3'h4: begin
            out_mant = 7'h44;
          end
          3'h5: begin
            out_mant = 7'h44;
          end
          3'h6: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h0: out_mant = 7'h44;
              4'h1: out_mant = 7'h44;
              4'h2: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h43;
          end
          default: begin end
        endcase
      end
      9'h02e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h43;
          end
          3'h1: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h43;
              4'h1: out_mant = 7'h43;
              4'h2: out_mant = 7'h43;
              4'h3: out_mant = 7'h43;
              4'h4: out_mant = 7'h43;
              4'h5: out_mant = 7'h43;
              4'h6: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h42;
          end
          3'h3: begin
            out_mant = 7'h42;
          end
          3'h4: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h9: out_mant = 7'h41;
              4'ha: out_mant = 7'h41;
              4'hb: out_mant = 7'h41;
              4'hc: out_mant = 7'h41;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h41;
          end
          3'h6: begin
            out_mant = 7'h41;
          end
          3'h7: begin
            out_mant = 7'h41;
          end
          default: begin end
        endcase
      end
      9'h02f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h41;
              4'h3: out_mant = 7'h41;
              4'h4: out_mant = 7'h41;
              4'h5: out_mant = 7'h41;
              4'h6: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h40;
          end
          3'h2: begin
            out_mant = 7'h40;
          end
          3'h3: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'h0: out_mant = 7'h40;
              4'h1: out_mant = 7'h40;
              4'h2: out_mant = 7'h40;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3f;
          end
          3'h5: begin
            out_mant = 7'h3f;
          end
          3'h6: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h3e;
          end
          default: begin end
        endcase
      end
      9'h030: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3e;
          end
          3'h1: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3d;
          end
          3'h3: begin
            out_mant = 7'h3d;
          end
          3'h4: begin
            out_mant = 7'h3d;
          end
          3'h5: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h0: out_mant = 7'h3d;
              4'h1: out_mant = 7'h3d;
              4'h2: out_mant = 7'h3d;
              4'h3: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h3c;
          end
          3'h7: begin
            out_mant = 7'h3c;
          end
          default: begin end
        endcase
      end
      9'h031: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3b;
          end
          3'h2: begin
            out_mant = 7'h3b;
          end
          3'h3: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'hd: out_mant = 7'h3a;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3a;
          end
          3'h5: begin
            out_mant = 7'h3a;
          end
          3'h6: begin
            out_mant = 7'h3a;
          end
          3'h7: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'hc: out_mant = 7'h39;
              4'hd: out_mant = 7'h39;
              4'he: out_mant = 7'h39;
              4'hf: out_mant = 7'h39;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h032: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h39;
          end
          3'h1: begin
            out_mant = 7'h39;
          end
          3'h2: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h8: out_mant = 7'h38;
              4'h9: out_mant = 7'h38;
              4'ha: out_mant = 7'h38;
              4'hb: out_mant = 7'h38;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h38;
              4'hf: out_mant = 7'h38;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h38;
          end
          3'h4: begin
            out_mant = 7'h38;
          end
          3'h5: begin
            out_mant = 7'h38;
          end
          3'h6: begin
            out_mant = 7'h37;
          end
          3'h7: begin
            out_mant = 7'h37;
          end
          default: begin end
        endcase
      end
      9'h033: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h37;
          end
          3'h1: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h0: out_mant = 7'h37;
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h37;
              4'h3: out_mant = 7'h37;
              4'h4: out_mant = 7'h37;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h36;
          end
          3'h3: begin
            out_mant = 7'h36;
          end
          3'h4: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'h0: out_mant = 7'h36;
              4'h1: out_mant = 7'h36;
              4'h2: out_mant = 7'h36;
              4'h3: out_mant = 7'h36;
              4'h4: out_mant = 7'h36;
              4'h5: out_mant = 7'h36;
              4'h6: out_mant = 7'h36;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h35;
          end
          3'h6: begin
            out_mant = 7'h35;
          end
          3'h7: begin
            out_mant = 7'h35;
          end
          default: begin end
        endcase
      end
      9'h034: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h0: out_mant = 7'h35;
              4'h1: out_mant = 7'h35;
              4'h2: out_mant = 7'h35;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h35;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h34;
          end
          3'h2: begin
            out_mant = 7'h34;
          end
          3'h3: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'h0: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h33;
          end
          3'h5: begin
            out_mant = 7'h33;
          end
          3'h6: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'hc: out_mant = 7'h32;
              4'hd: out_mant = 7'h32;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h32;
          end
          default: begin end
        endcase
      end
      9'h035: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h32;
          end
          3'h1: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h31;
          end
          3'h3: begin
            out_mant = 7'h31;
          end
          3'h4: begin
            out_mant = 7'h31;
          end
          3'h5: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              4'h1: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h30;
          end
          3'h7: begin
            out_mant = 7'h30;
          end
          default: begin end
        endcase
      end
      9'h036: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'hc: out_mant = 7'h2f;
              4'hd: out_mant = 7'h2f;
              4'he: out_mant = 7'h2f;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h2f;
          end
          3'h2: begin
            out_mant = 7'h2f;
          end
          3'h3: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'hb: out_mant = 7'h2e;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h2e;
              4'he: out_mant = 7'h2e;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h2e;
          end
          3'h5: begin
            out_mant = 7'h2e;
          end
          3'h6: begin
            out_mant = 7'h2e;
          end
          3'h7: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h2d;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2d;
              4'hd: out_mant = 7'h2d;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h037: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2d;
          end
          3'h1: begin
            out_mant = 7'h2d;
          end
          3'h2: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h0: out_mant = 7'h2d;
              4'h1: out_mant = 7'h2d;
              4'h2: out_mant = 7'h2d;
              4'h3: out_mant = 7'h2d;
              4'h4: out_mant = 7'h2d;
              4'h5: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2c;
          end
          3'h4: begin
            out_mant = 7'h2c;
          end
          3'h5: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h2b;
          end
          3'h7: begin
            out_mant = 7'h2b;
          end
          default: begin end
        endcase
      end
      9'h038: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2b;
          end
          3'h1: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h2b;
              4'h1: out_mant = 7'h2b;
              4'h2: out_mant = 7'h2b;
              4'h3: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2a;
          end
          3'h3: begin
            out_mant = 7'h2a;
          end
          3'h4: begin
            out_mant = 7'h29;
            case (mant_lo4)
              4'h0: out_mant = 7'h2a;
              4'h1: out_mant = 7'h2a;
              4'h2: out_mant = 7'h2a;
              4'h3: out_mant = 7'h2a;
              4'h4: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h29;
          end
          3'h6: begin
            out_mant = 7'h29;
          end
          3'h7: begin
            out_mant = 7'h29;
          end
          default: begin end
        endcase
      end
      9'h039: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h28;
          end
          3'h2: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h27;
          end
          3'h4: begin
            out_mant = 7'h27;
          end
          3'h5: begin
            out_mant = 7'h27;
          end
          3'h6: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h9: out_mant = 7'h26;
              4'ha: out_mant = 7'h26;
              4'hb: out_mant = 7'h26;
              4'hc: out_mant = 7'h26;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h26;
          end
          default: begin end
        endcase
      end
      9'h03a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h26;
          end
          3'h1: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'hc: out_mant = 7'h25;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h25;
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h25;
          end
          3'h3: begin
            out_mant = 7'h25;
          end
          3'h4: begin
            out_mant = 7'h25;
            case (mant_lo4)
              4'hf: out_mant = 7'h24;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h24;
          end
          3'h6: begin
            out_mant = 7'h24;
          end
          3'h7: begin
            out_mant = 7'h24;
          end
          default: begin end
        endcase
      end
      9'h03b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'ha: out_mant = 7'h23;
              4'hb: out_mant = 7'h23;
              4'hc: out_mant = 7'h23;
              4'hd: out_mant = 7'h23;
              4'he: out_mant = 7'h23;
              4'hf: out_mant = 7'h23;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h23;
          end
          3'h2: begin
            out_mant = 7'h23;
          end
          3'h3: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h8: out_mant = 7'h22;
              4'h9: out_mant = 7'h22;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h22;
          end
          3'h5: begin
            out_mant = 7'h22;
          end
          3'h6: begin
            out_mant = 7'h22;
          end
          3'h7: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h22;
              4'h5: out_mant = 7'h22;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h03c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h21;
          end
          3'h1: begin
            out_mant = 7'h21;
          end
          3'h2: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'h0: out_mant = 7'h21;
              4'h1: out_mant = 7'h21;
              4'h2: out_mant = 7'h21;
              4'h3: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h20;
          end
          3'h4: begin
            out_mant = 7'h20;
          end
          3'h5: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h1f;
          end
          3'h7: begin
            out_mant = 7'h1f;
          end
          default: begin end
        endcase
      end
      9'h03d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1f;
          end
          3'h1: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'h0: out_mant = 7'h1f;
              4'h1: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1e;
          end
          3'h3: begin
            out_mant = 7'h1e;
          end
          3'h4: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h0: out_mant = 7'h1e;
              4'h1: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h1d;
          end
          3'h6: begin
            out_mant = 7'h1d;
          end
          3'h7: begin
            out_mant = 7'h1d;
          end
          default: begin end
        endcase
      end
      9'h03e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'h0: out_mant = 7'h1d;
              4'h1: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h1c;
          end
          3'h2: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'hd: out_mant = 7'h1b;
              4'he: out_mant = 7'h1b;
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h1b;
          end
          3'h4: begin
            out_mant = 7'h1b;
          end
          3'h5: begin
            out_mant = 7'h1b;
          end
          3'h6: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h0: out_mant = 7'h1b;
              4'h1: out_mant = 7'h1b;
              4'h2: out_mant = 7'h1b;
              4'h3: out_mant = 7'h1b;
              4'h4: out_mant = 7'h1b;
              4'h5: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1a;
          end
          default: begin end
        endcase
      end
      9'h03f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1a;
          end
          3'h1: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'ha: out_mant = 7'h19;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h19;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h19;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h19;
          end
          3'h3: begin
            out_mant = 7'h19;
          end
          3'h4: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h18;
          end
          3'h6: begin
            out_mant = 7'h18;
          end
          3'h7: begin
            out_mant = 7'h18;
          end
          default: begin end
        endcase
      end
      9'h040: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h9: out_mant = 7'h17;
              4'ha: out_mant = 7'h17;
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h17;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h17;
          end
          3'h2: begin
            out_mant = 7'h17;
          end
          3'h3: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h17;
              4'h2: out_mant = 7'h17;
              4'h3: out_mant = 7'h17;
              4'h4: out_mant = 7'h17;
              4'h5: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h16;
          end
          3'h5: begin
            out_mant = 7'h16;
          end
          3'h6: begin
            out_mant = 7'h16;
          end
          3'h7: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h041: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h15;
          end
          3'h1: begin
            out_mant = 7'h15;
          end
          3'h2: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h0: out_mant = 7'h15;
              4'h1: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h14;
          end
          3'h4: begin
            out_mant = 7'h14;
          end
          3'h5: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h8: out_mant = 7'h13;
              4'h9: out_mant = 7'h13;
              4'ha: out_mant = 7'h13;
              4'hb: out_mant = 7'h13;
              4'hc: out_mant = 7'h13;
              4'hd: out_mant = 7'h13;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h13;
          end
          3'h7: begin
            out_mant = 7'h13;
          end
          default: begin end
        endcase
      end
      9'h042: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h13;
          end
          3'h1: begin
            out_mant = 7'h12;
          end
          3'h2: begin
            out_mant = 7'h12;
          end
          3'h3: begin
            out_mant = 7'h12;
          end
          3'h4: begin
            out_mant = 7'h11;
          end
          3'h5: begin
            out_mant = 7'h11;
          end
          3'h6: begin
            out_mant = 7'h11;
          end
          3'h7: begin
            out_mant = 7'h11;
          end
          default: begin end
        endcase
      end
      9'h043: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h10;
          end
          3'h1: begin
            out_mant = 7'h10;
          end
          3'h2: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'hb: out_mant = 7'h0f;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0f;
          end
          3'h4: begin
            out_mant = 7'h0f;
          end
          3'h5: begin
            out_mant = 7'h0f;
          end
          3'h6: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h0f;
              4'h1: out_mant = 7'h0f;
              4'h2: out_mant = 7'h0f;
              4'h3: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h0e;
          end
          default: begin end
        endcase
      end
      9'h044: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0e;
          end
          3'h1: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h8: out_mant = 7'h0d;
              4'h9: out_mant = 7'h0d;
              4'ha: out_mant = 7'h0d;
              4'hb: out_mant = 7'h0d;
              4'hc: out_mant = 7'h0d;
              4'hd: out_mant = 7'h0d;
              4'he: out_mant = 7'h0d;
              4'hf: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0d;
          end
          3'h3: begin
            out_mant = 7'h0d;
          end
          3'h4: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h0c;
              4'he: out_mant = 7'h0c;
              4'hf: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0c;
          end
          3'h6: begin
            out_mant = 7'h0c;
          end
          3'h7: begin
            out_mant = 7'h0c;
          end
          default: begin end
        endcase
      end
      9'h045: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'h1: out_mant = 7'h0c;
              4'h2: out_mant = 7'h0c;
              4'h3: out_mant = 7'h0c;
              4'h4: out_mant = 7'h0c;
              4'h5: out_mant = 7'h0c;
              4'h6: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0b;
          end
          3'h2: begin
            out_mant = 7'h0b;
          end
          3'h3: begin
            out_mant = 7'h0a;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'h1: out_mant = 7'h0b;
              4'h2: out_mant = 7'h0b;
              4'h3: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0a;
          end
          3'h5: begin
            out_mant = 7'h0a;
          end
          3'h6: begin
            out_mant = 7'h0a;
          end
          3'h7: begin
            out_mant = 7'h09;
          end
          default: begin end
        endcase
      end
      9'h046: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h09;
          end
          3'h1: begin
            out_mant = 7'h09;
          end
          3'h2: begin
            out_mant = 7'h08;
          end
          3'h3: begin
            out_mant = 7'h08;
          end
          3'h4: begin
            out_mant = 7'h08;
          end
          3'h5: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h08;
              4'h3: out_mant = 7'h08;
              4'h4: out_mant = 7'h08;
              4'h5: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h07;
          end
          3'h7: begin
            out_mant = 7'h07;
          end
          default: begin end
        endcase
      end
      9'h047: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'hf: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h06;
          end
          3'h2: begin
            out_mant = 7'h06;
          end
          3'h3: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h05;
          end
          3'h5: begin
            out_mant = 7'h05;
          end
          3'h6: begin
            out_mant = 7'h05;
          end
          3'h7: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h048: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h04;
          end
          3'h1: begin
            out_mant = 7'h04;
          end
          3'h2: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h9: out_mant = 7'h03;
              4'ha: out_mant = 7'h03;
              4'hb: out_mant = 7'h03;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h03;
          end
          3'h4: begin
            out_mant = 7'h03;
          end
          3'h5: begin
            out_mant = 7'h03;
          end
          3'h6: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h049: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
          end
          3'h1: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h0: out_mant = 7'h02;
              4'h1: out_mant = 7'h02;
              4'h2: out_mant = 7'h02;
              4'h3: out_mant = 7'h02;
              4'h4: out_mant = 7'h02;
              4'h5: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h01;
          end
          3'h3: begin
            out_mant = 7'h01;
          end
          3'h4: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h8: out_mant = 7'h00;
              4'h9: out_mant = 7'h00;
              4'ha: out_mant = 7'h00;
              4'hb: out_mant = 7'h00;
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h00;
              4'he: out_mant = 7'h00;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h00;
          end
          3'h6: begin
            out_mant = 7'h00;
          end
          3'h7: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h8: out_mant = 7'h7f;
              4'h9: out_mant = 7'h7f;
              4'ha: out_mant = 7'h7f;
              4'hb: out_mant = 7'h7f;
              4'hc: out_mant = 7'h7f;
              4'hd: out_mant = 7'h7f;
              4'he: out_mant = 7'h7f;
              4'hf: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h04a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
          end
          3'h1: begin
            out_mant = 7'h7e;
          end
          3'h2: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7e;
              4'h5: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h7c;
          end
          3'h5: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'hd: out_mant = 7'h7b;
              4'he: out_mant = 7'h7b;
              4'hf: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h7b;
          end
          3'h7: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'hf: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h04b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7a;
          end
          3'h1: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              4'h1: out_mant = 7'h7a;
              4'h2: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'ha: out_mant = 7'h78;
              4'hb: out_mant = 7'h78;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h78;
          end
          3'h4: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h0: out_mant = 7'h78;
              4'h1: out_mant = 7'h78;
              4'h2: out_mant = 7'h78;
              4'h3: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h77;
          end
          3'h6: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'h0: out_mant = 7'h77;
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h76;
          end
          default: begin end
        endcase
      end
      9'h04c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              4'h1: out_mant = 7'h76;
              4'h2: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h0: out_mant = 7'h75;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h75;
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h75;
              4'h5: out_mant = 7'h75;
              4'h6: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h73;
          end
          3'h4: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'ha: out_mant = 7'h72;
              4'hb: out_mant = 7'h72;
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h72;
          end
          3'h6: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'h9: out_mant = 7'h71;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h71;
              4'hc: out_mant = 7'h71;
              4'hd: out_mant = 7'h71;
              4'he: out_mant = 7'h71;
              4'hf: out_mant = 7'h71;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h71;
          end
          default: begin end
        endcase
      end
      9'h04d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'h0: out_mant = 7'h71;
              4'h1: out_mant = 7'h71;
              4'h2: out_mant = 7'h71;
              4'h3: out_mant = 7'h71;
              4'h4: out_mant = 7'h71;
              4'h5: out_mant = 7'h71;
              4'h6: out_mant = 7'h71;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6f;
          end
          3'h3: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h0: out_mant = 7'h6f;
              4'h1: out_mant = 7'h6f;
              4'h2: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6d;
          end
          3'h6: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h6c;
          end
          default: begin end
        endcase
      end
      9'h04e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'ha: out_mant = 7'h6b;
              4'hb: out_mant = 7'h6b;
              4'hc: out_mant = 7'h6b;
              4'hd: out_mant = 7'h6b;
              4'he: out_mant = 7'h6b;
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6b;
          end
          3'h2: begin
            out_mant = 7'h6a;
          end
          3'h3: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h8: out_mant = 7'h69;
              4'h9: out_mant = 7'h69;
              4'ha: out_mant = 7'h69;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h69;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h69;
          end
          3'h5: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h69;
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h69;
              4'h3: out_mant = 7'h69;
              4'h4: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h68;
          end
          3'h7: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'h0: out_mant = 7'h68;
              4'h1: out_mant = 7'h68;
              4'h2: out_mant = 7'h68;
              4'h3: out_mant = 7'h68;
              4'h4: out_mant = 7'h68;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h04f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h66;
          end
          3'h2: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h66;
              4'h3: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h64;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h64;
          end
          3'h5: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'ha: out_mant = 7'h63;
              4'hb: out_mant = 7'h63;
              4'hc: out_mant = 7'h63;
              4'hd: out_mant = 7'h63;
              4'he: out_mant = 7'h63;
              4'hf: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h63;
          end
          3'h7: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'hc: out_mant = 7'h62;
              4'hd: out_mant = 7'h62;
              4'he: out_mant = 7'h62;
              4'hf: out_mant = 7'h62;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h050: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h62;
          end
          3'h1: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h8: out_mant = 7'h60;
              4'h9: out_mant = 7'h60;
              4'ha: out_mant = 7'h60;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h60;
              4'hd: out_mant = 7'h60;
              4'he: out_mant = 7'h60;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h60;
          end
          3'h4: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h5f;
          end
          3'h6: begin
            out_mant = 7'h5e;
          end
          3'h7: begin
            out_mant = 7'h5e;
          end
          default: begin end
        endcase
      end
      9'h051: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h0: out_mant = 7'h5e;
              4'h1: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'h0: out_mant = 7'h5d;
              4'h1: out_mant = 7'h5d;
              4'h2: out_mant = 7'h5d;
              4'h3: out_mant = 7'h5d;
              4'h4: out_mant = 7'h5d;
              4'h5: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'hd: out_mant = 7'h5b;
              4'he: out_mant = 7'h5b;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h5b;
          end
          3'h4: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'h0: out_mant = 7'h5b;
              4'h1: out_mant = 7'h5b;
              4'h2: out_mant = 7'h5b;
              4'h3: out_mant = 7'h5b;
              4'h4: out_mant = 7'h5b;
              4'h5: out_mant = 7'h5b;
              4'h6: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h5a;
          end
          3'h6: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h1: out_mant = 7'h5a;
              4'h2: out_mant = 7'h5a;
              4'h3: out_mant = 7'h5a;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h59;
          end
          default: begin end
        endcase
      end
      9'h052: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h0: out_mant = 7'h59;
              4'h1: out_mant = 7'h59;
              4'h2: out_mant = 7'h59;
              4'h3: out_mant = 7'h59;
              4'h4: out_mant = 7'h59;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'ha: out_mant = 7'h57;
              4'hb: out_mant = 7'h57;
              4'hc: out_mant = 7'h57;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h57;
          end
          3'h3: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'hd: out_mant = 7'h55;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h55;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h55;
          end
          3'h6: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'hc: out_mant = 7'h54;
              4'hd: out_mant = 7'h54;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h54;
          end
          default: begin end
        endcase
      end
      9'h053: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h54;
            case (mant_lo4)
              4'h9: out_mant = 7'h53;
              4'ha: out_mant = 7'h53;
              4'hb: out_mant = 7'h53;
              4'hc: out_mant = 7'h53;
              4'hd: out_mant = 7'h53;
              4'he: out_mant = 7'h53;
              4'hf: out_mant = 7'h53;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h52;
          end
          3'h3: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h0: out_mant = 7'h52;
              4'h1: out_mant = 7'h52;
              4'h2: out_mant = 7'h52;
              4'h3: out_mant = 7'h52;
              4'h4: out_mant = 7'h52;
              4'h5: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h51;
          end
          3'h5: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h1: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h50;
          end
          3'h7: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h0: out_mant = 7'h50;
              4'h1: out_mant = 7'h50;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h054: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h4e;
          end
          3'h2: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4c;
          end
          3'h5: begin
            out_mant = 7'h4c;
            case (mant_lo4)
              4'h8: out_mant = 7'h4b;
              4'h9: out_mant = 7'h4b;
              4'ha: out_mant = 7'h4b;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4b;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h4b;
          end
          3'h7: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h9: out_mant = 7'h4a;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h4a;
              4'hc: out_mant = 7'h4a;
              4'hd: out_mant = 7'h4a;
              4'he: out_mant = 7'h4a;
              4'hf: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h055: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4a;
          end
          3'h1: begin
            out_mant = 7'h49;
          end
          3'h2: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              4'h2: out_mant = 7'h49;
              4'h3: out_mant = 7'h49;
              4'h4: out_mant = 7'h49;
              4'h5: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h48;
          end
          3'h4: begin
            out_mant = 7'h47;
          end
          3'h5: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h46;
              4'hf: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h46;
          end
          3'h7: begin
            out_mant = 7'h46;
          end
          default: begin end
        endcase
      end
      9'h056: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h45;
          end
          3'h1: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'h0: out_mant = 7'h45;
              4'h1: out_mant = 7'h45;
              4'h2: out_mant = 7'h45;
              4'h3: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'hb: out_mant = 7'h43;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h43;
              4'he: out_mant = 7'h43;
              4'hf: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h43;
          end
          3'h4: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h43;
              4'h1: out_mant = 7'h43;
              4'h2: out_mant = 7'h43;
              4'h3: out_mant = 7'h43;
              4'h4: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h42;
          end
          3'h6: begin
            out_mant = 7'h41;
            case (mant_lo4)
              4'h0: out_mant = 7'h42;
              4'h1: out_mant = 7'h42;
              4'h2: out_mant = 7'h42;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h41;
          end
          default: begin end
        endcase
      end
      9'h057: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h8: out_mant = 7'h3f;
              4'h9: out_mant = 7'h3f;
              4'ha: out_mant = 7'h3f;
              4'hb: out_mant = 7'h3f;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h3e;
          end
          3'h4: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'ha: out_mant = 7'h3d;
              4'hb: out_mant = 7'h3d;
              4'hc: out_mant = 7'h3d;
              4'hd: out_mant = 7'h3d;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h3d;
          end
          3'h6: begin
            out_mant = 7'h3d;
            case (mant_lo4)
              4'h9: out_mant = 7'h3c;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3c;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h3c;
          end
          default: begin end
        endcase
      end
      9'h058: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h0: out_mant = 7'h3c;
              4'h1: out_mant = 7'h3c;
              4'h2: out_mant = 7'h3c;
              4'h3: out_mant = 7'h3c;
              4'h4: out_mant = 7'h3c;
              4'h5: out_mant = 7'h3c;
              4'h6: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'hc: out_mant = 7'h3a;
              4'hd: out_mant = 7'h3a;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3a;
          end
          3'h3: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h3a;
              4'h3: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h39;
          end
          3'h5: begin
            out_mant = 7'h38;
          end
          3'h6: begin
            out_mant = 7'h38;
          end
          3'h7: begin
            out_mant = 7'h37;
          end
          default: begin end
        endcase
      end
      9'h059: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h37;
            case (mant_lo4)
              4'hb: out_mant = 7'h36;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h36;
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h36;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h36;
          end
          3'h2: begin
            out_mant = 7'h35;
          end
          3'h3: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'h9: out_mant = 7'h34;
              4'ha: out_mant = 7'h34;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h34;
          end
          3'h5: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'h0: out_mant = 7'h34;
              4'h1: out_mant = 7'h34;
              4'h2: out_mant = 7'h34;
              4'h3: out_mant = 7'h34;
              4'h4: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h33;
          end
          3'h7: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h0: out_mant = 7'h33;
              4'h1: out_mant = 7'h33;
              4'h2: out_mant = 7'h33;
              4'h3: out_mant = 7'h33;
              4'h4: out_mant = 7'h33;
              4'h5: out_mant = 7'h33;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h05a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h31;
          end
          3'h2: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              4'h1: out_mant = 7'h31;
              4'h2: out_mant = 7'h31;
              4'h3: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'he: out_mant = 7'h2f;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h2f;
          end
          3'h5: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'hb: out_mant = 7'h2e;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h2e;
              4'he: out_mant = 7'h2e;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h2e;
          end
          3'h7: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'hd: out_mant = 7'h2d;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h05b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2d;
          end
          3'h1: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h0: out_mant = 7'h2d;
              4'h1: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h9: out_mant = 7'h2b;
              4'ha: out_mant = 7'h2b;
              4'hb: out_mant = 7'h2b;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2b;
          end
          3'h4: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h2b;
              4'h1: out_mant = 7'h2b;
              4'h2: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h2a;
          end
          3'h6: begin
            out_mant = 7'h29;
            case (mant_lo4)
              4'h0: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h29;
          end
          default: begin end
        endcase
      end
      9'h05c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h0: out_mant = 7'h28;
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h28;
              4'h3: out_mant = 7'h28;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h26;
          end
          3'h4: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h8: out_mant = 7'h25;
              4'h9: out_mant = 7'h25;
              4'ha: out_mant = 7'h25;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h25;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h25;
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h25;
          end
          3'h6: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h25;
              4'h3: out_mant = 7'h25;
              4'h4: out_mant = 7'h25;
              4'h5: out_mant = 7'h25;
              4'h6: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h24;
          end
          default: begin end
        endcase
      end
      9'h05d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h24;
              4'h1: out_mant = 7'h24;
              4'h2: out_mant = 7'h24;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h24;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h22;
          end
          3'h3: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h20;
          end
          3'h6: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1f;
          end
          default: begin end
        endcase
      end
      9'h05e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h9: out_mant = 7'h1e;
              4'ha: out_mant = 7'h1e;
              4'hb: out_mant = 7'h1e;
              4'hc: out_mant = 7'h1e;
              4'hd: out_mant = 7'h1e;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1d;
          end
          3'h3: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'h0: out_mant = 7'h1d;
              4'h1: out_mant = 7'h1d;
              4'h2: out_mant = 7'h1d;
              4'h3: out_mant = 7'h1d;
              4'h4: out_mant = 7'h1d;
              4'h5: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1c;
          end
          3'h5: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h0: out_mant = 7'h1c;
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h1b;
          end
          3'h7: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h0: out_mant = 7'h1b;
              4'h1: out_mant = 7'h1b;
              4'h2: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h05f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h19;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h19;
          end
          3'h2: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h0: out_mant = 7'h19;
              4'h1: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h17;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h17;
          end
          3'h5: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h8: out_mant = 7'h16;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h16;
              4'hc: out_mant = 7'h16;
              4'hd: out_mant = 7'h16;
              4'he: out_mant = 7'h16;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h16;
          end
          3'h7: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h15;
              4'hd: out_mant = 7'h15;
              4'he: out_mant = 7'h15;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h060: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h15;
          end
          3'h1: begin
            out_mant = 7'h14;
          end
          3'h2: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h14;
              4'h2: out_mant = 7'h14;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h14;
              4'h6: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h13;
          end
          3'h4: begin
            out_mant = 7'h12;
          end
          3'h5: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'he: out_mant = 7'h11;
              4'hf: out_mant = 7'h11;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h11;
          end
          3'h7: begin
            out_mant = 7'h11;
          end
          default: begin end
        endcase
      end
      9'h061: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h10;
          end
          3'h1: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              4'h1: out_mant = 7'h10;
              4'h2: out_mant = 7'h10;
              4'h3: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'hb: out_mant = 7'h0e;
              4'hc: out_mant = 7'h0e;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0e;
          end
          3'h4: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h0: out_mant = 7'h0e;
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h0e;
              4'h3: out_mant = 7'h0e;
              4'h4: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0d;
          end
          3'h6: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h0: out_mant = 7'h0d;
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h0d;
              4'h3: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h0c;
          end
          default: begin end
        endcase
      end
      9'h062: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'h1: out_mant = 7'h0c;
              4'h2: out_mant = 7'h0c;
              4'h3: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h8: out_mant = 7'h0a;
              4'h9: out_mant = 7'h0a;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h0a;
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0a;
          end
          3'h3: begin
            out_mant = 7'h09;
          end
          3'h4: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'hb: out_mant = 7'h08;
              4'hc: out_mant = 7'h08;
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h08;
              4'hf: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h08;
          end
          3'h6: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'ha: out_mant = 7'h07;
              4'hb: out_mant = 7'h07;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h07;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h07;
          end
          default: begin end
        endcase
      end
      9'h063: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h07;
              4'h3: out_mant = 7'h07;
              4'h4: out_mant = 7'h07;
              4'h5: out_mant = 7'h07;
              4'h6: out_mant = 7'h07;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'hc: out_mant = 7'h05;
              4'hd: out_mant = 7'h05;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h05;
          end
          3'h3: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h05;
              4'h1: out_mant = 7'h05;
              4'h2: out_mant = 7'h05;
              4'h3: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h04;
          end
          3'h5: begin
            out_mant = 7'h03;
          end
          3'h6: begin
            out_mant = 7'h03;
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h064: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'hb: out_mant = 7'h01;
              4'hc: out_mant = 7'h01;
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h01;
          end
          3'h2: begin
            out_mant = 7'h00;
          end
          3'h3: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h1: out_mant = 7'h00;
              4'h2: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'he: out_mant = 7'h7c;
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'he: out_mant = 7'h7b;
              4'hf: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7b;
          end
          default: begin end
        endcase
      end
      9'h065: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'ha: out_mant = 7'h79;
              4'hb: out_mant = 7'h79;
              4'hc: out_mant = 7'h79;
              4'hd: out_mant = 7'h79;
              4'he: out_mant = 7'h79;
              4'hf: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              4'h1: out_mant = 7'h79;
              4'h2: out_mant = 7'h79;
              4'h3: out_mant = 7'h79;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'hb: out_mant = 7'h76;
              4'hc: out_mant = 7'h76;
              4'hd: out_mant = 7'h76;
              4'he: out_mant = 7'h76;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              4'h1: out_mant = 7'h76;
              4'h2: out_mant = 7'h76;
              4'h3: out_mant = 7'h76;
              4'h4: out_mant = 7'h76;
              4'h5: out_mant = 7'h76;
              4'h6: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h0: out_mant = 7'h75;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h75;
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h0: out_mant = 7'h74;
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h74;
              4'h3: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'h0: out_mant = 7'h73;
              4'h1: out_mant = 7'h73;
              4'h2: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'h1: out_mant = 7'h72;
              4'h2: out_mant = 7'h72;
              4'h3: out_mant = 7'h72;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h066: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'h0: out_mant = 7'h71;
              4'h1: out_mant = 7'h71;
              4'h2: out_mant = 7'h71;
              4'h3: out_mant = 7'h71;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h8: out_mant = 7'h6e;
              4'h9: out_mant = 7'h6e;
              4'ha: out_mant = 7'h6e;
              4'hb: out_mant = 7'h6e;
              4'hc: out_mant = 7'h6e;
              4'hd: out_mant = 7'h6e;
              4'he: out_mant = 7'h6e;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h0: out_mant = 7'h6e;
              4'h1: out_mant = 7'h6e;
              4'h2: out_mant = 7'h6e;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'hc: out_mant = 7'h6b;
              4'hd: out_mant = 7'h6b;
              4'he: out_mant = 7'h6b;
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'ha: out_mant = 7'h6a;
              4'hb: out_mant = 7'h6a;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h6a;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h9: out_mant = 7'h69;
              4'ha: out_mant = 7'h69;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h69;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h9: out_mant = 7'h68;
              4'ha: out_mant = 7'h68;
              4'hb: out_mant = 7'h68;
              4'hc: out_mant = 7'h68;
              4'hd: out_mant = 7'h68;
              4'he: out_mant = 7'h68;
              4'hf: out_mant = 7'h68;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'hb: out_mant = 7'h67;
              4'hc: out_mant = 7'h67;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h067: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h66;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h67;
              4'h3: out_mant = 7'h67;
              4'h4: out_mant = 7'h67;
              4'h5: out_mant = 7'h67;
              4'h6: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              4'hc: out_mant = 7'h64;
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h64;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'h0: out_mant = 7'h64;
              4'h1: out_mant = 7'h64;
              4'h2: out_mant = 7'h64;
              4'h3: out_mant = 7'h64;
              4'h4: out_mant = 7'h64;
              4'h5: out_mant = 7'h64;
              4'h6: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              4'h1: out_mant = 7'h63;
              4'h2: out_mant = 7'h63;
              4'h3: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h60;
            case (mant_lo4)
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5f;
          end
          3'h7: begin
            out_mant = 7'h5e;
          end
          default: begin end
        endcase
      end
      9'h068: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h0: out_mant = 7'h5e;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h5c;
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'h0: out_mant = 7'h5c;
              4'h1: out_mant = 7'h5c;
              4'h2: out_mant = 7'h5c;
              4'h3: out_mant = 7'h5c;
              4'h4: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h59;
              4'he: out_mant = 7'h59;
              4'hf: out_mant = 7'h59;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h58;
              4'hb: out_mant = 7'h58;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h1: out_mant = 7'h58;
              4'h2: out_mant = 7'h58;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h58;
              4'h5: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h57;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h0: out_mant = 7'h56;
              4'h1: out_mant = 7'h56;
              4'h2: out_mant = 7'h56;
              4'h3: out_mant = 7'h56;
              4'h4: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h54;
            case (mant_lo4)
              4'h0: out_mant = 7'h55;
              4'h1: out_mant = 7'h55;
              4'h2: out_mant = 7'h55;
              4'h3: out_mant = 7'h55;
              4'h4: out_mant = 7'h55;
              4'h5: out_mant = 7'h55;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h069: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h54;
              4'h3: out_mant = 7'h54;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h9: out_mant = 7'h51;
              4'ha: out_mant = 7'h51;
              4'hb: out_mant = 7'h51;
              4'hc: out_mant = 7'h51;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h1: out_mant = 7'h51;
              4'h2: out_mant = 7'h51;
              4'h3: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'hc: out_mant = 7'h4d;
              4'hd: out_mant = 7'h4d;
              4'he: out_mant = 7'h4d;
              4'hf: out_mant = 7'h4d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h4c;
            case (mant_lo4)
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4b;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'hd: out_mant = 7'h4a;
              4'he: out_mant = 7'h4a;
              4'hf: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h06a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h8: out_mant = 7'h49;
              4'h9: out_mant = 7'h49;
              4'ha: out_mant = 7'h49;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h49;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              4'hd: out_mant = 7'h47;
              4'he: out_mant = 7'h47;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'h9: out_mant = 7'h46;
              4'ha: out_mant = 7'h46;
              4'hb: out_mant = 7'h46;
              4'hc: out_mant = 7'h46;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h46;
              4'hf: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h0: out_mant = 7'h46;
              4'h1: out_mant = 7'h46;
              4'h2: out_mant = 7'h46;
              4'h3: out_mant = 7'h46;
              4'h4: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'h0: out_mant = 7'h45;
              4'h1: out_mant = 7'h45;
              4'h2: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h0: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h41;
            case (mant_lo4)
              4'h0: out_mant = 7'h42;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h06b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h0: out_mant = 7'h3f;
              4'h1: out_mant = 7'h3f;
              4'h2: out_mant = 7'h3f;
              4'h3: out_mant = 7'h3f;
              4'h4: out_mant = 7'h3f;
              4'h5: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3d;
            case (mant_lo4)
              4'h0: out_mant = 7'h3e;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3c;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'ha: out_mant = 7'h3b;
              4'hb: out_mant = 7'h3b;
              4'hc: out_mant = 7'h3b;
              4'hd: out_mant = 7'h3b;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h8: out_mant = 7'h3a;
              4'h9: out_mant = 7'h3a;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h3a;
              4'hc: out_mant = 7'h3a;
              4'hd: out_mant = 7'h3a;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h3a;
              4'h3: out_mant = 7'h3a;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h3a;
              4'h6: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h0: out_mant = 7'h39;
              4'h1: out_mant = 7'h39;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h39;
              4'h5: out_mant = 7'h39;
              4'h6: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h8: out_mant = 7'h37;
              4'h9: out_mant = 7'h37;
              4'ha: out_mant = 7'h37;
              4'hb: out_mant = 7'h37;
              4'hc: out_mant = 7'h37;
              4'hd: out_mant = 7'h37;
              4'he: out_mant = 7'h37;
              4'hf: out_mant = 7'h37;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h06c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h0: out_mant = 7'h37;
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h37;
              4'h3: out_mant = 7'h37;
              4'h4: out_mant = 7'h37;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'ha: out_mant = 7'h34;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'h0: out_mant = 7'h34;
              4'h1: out_mant = 7'h34;
              4'h2: out_mant = 7'h34;
              4'h3: out_mant = 7'h34;
              4'h4: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h0: out_mant = 7'h33;
              4'h1: out_mant = 7'h33;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h31;
            case (mant_lo4)
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h30;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'hc: out_mant = 7'h2f;
              4'hd: out_mant = 7'h2f;
              4'he: out_mant = 7'h2f;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'hd: out_mant = 7'h2e;
              4'he: out_mant = 7'h2e;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'hf: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h06d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h9: out_mant = 7'h2c;
              4'ha: out_mant = 7'h2c;
              4'hb: out_mant = 7'h2c;
              4'hc: out_mant = 7'h2c;
              4'hd: out_mant = 7'h2c;
              4'he: out_mant = 7'h2c;
              4'hf: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h2b;
            case (mant_lo4)
              4'h0: out_mant = 7'h2c;
              4'h1: out_mant = 7'h2c;
              4'h2: out_mant = 7'h2c;
              4'he: out_mant = 7'h2a;
              4'hf: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'ha: out_mant = 7'h29;
              4'hb: out_mant = 7'h29;
              4'hc: out_mant = 7'h29;
              4'hd: out_mant = 7'h29;
              4'he: out_mant = 7'h29;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h29;
              4'h3: out_mant = 7'h29;
              4'h4: out_mant = 7'h29;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h0: out_mant = 7'h28;
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h28;
              4'h3: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h0: out_mant = 7'h27;
              4'h1: out_mant = 7'h27;
              4'h2: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h25;
            case (mant_lo4)
              4'h0: out_mant = 7'h26;
              4'h1: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h25;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h06e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h24;
              4'h1: out_mant = 7'h24;
              4'h2: out_mant = 7'h24;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h22;
              4'h5: out_mant = 7'h22;
              4'h6: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'h0: out_mant = 7'h21;
              4'h1: out_mant = 7'h21;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'hb: out_mant = 7'h1e;
              4'hc: out_mant = 7'h1e;
              4'hd: out_mant = 7'h1e;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'h9: out_mant = 7'h1d;
              4'ha: out_mant = 7'h1d;
              4'hb: out_mant = 7'h1d;
              4'hc: out_mant = 7'h1d;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h8: out_mant = 7'h1c;
              4'h9: out_mant = 7'h1c;
              4'ha: out_mant = 7'h1c;
              4'hb: out_mant = 7'h1c;
              4'hc: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'h8: out_mant = 7'h1b;
              4'h9: out_mant = 7'h1b;
              4'ha: out_mant = 7'h1b;
              4'hb: out_mant = 7'h1b;
              4'hc: out_mant = 7'h1b;
              4'hd: out_mant = 7'h1b;
              4'he: out_mant = 7'h1b;
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'ha: out_mant = 7'h1a;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h1a;
              4'hd: out_mant = 7'h1a;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h06f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h1a;
              4'h3: out_mant = 7'h1a;
              4'h4: out_mant = 7'h1a;
              4'h5: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h17;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h17;
              4'h2: out_mant = 7'h17;
              4'h3: out_mant = 7'h17;
              4'h4: out_mant = 7'h17;
              4'h5: out_mant = 7'h17;
              4'h6: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'hf: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'hf: out_mant = 7'h11;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h11;
          end
          default: begin end
        endcase
      end
      9'h070: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'ha: out_mant = 7'h0f;
              4'hb: out_mant = 7'h0f;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h0f;
              4'h1: out_mant = 7'h0f;
              4'h2: out_mant = 7'h0f;
              4'h3: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h0c;
              4'he: out_mant = 7'h0c;
              4'hf: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h8: out_mant = 7'h0b;
              4'h9: out_mant = 7'h0b;
              4'ha: out_mant = 7'h0b;
              4'hb: out_mant = 7'h0b;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h0b;
              4'he: out_mant = 7'h0b;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0a;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'h1: out_mant = 7'h0b;
              4'h2: out_mant = 7'h0b;
              4'h3: out_mant = 7'h0b;
              4'h4: out_mant = 7'h0b;
              4'h5: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              4'h2: out_mant = 7'h0a;
              4'h3: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h0: out_mant = 7'h09;
              4'h1: out_mant = 7'h09;
              4'h2: out_mant = 7'h09;
              4'h3: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h08;
              4'h3: out_mant = 7'h08;
              4'h4: out_mant = 7'h08;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h071: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h07;
              4'h3: out_mant = 7'h07;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h8: out_mant = 7'h04;
              4'h9: out_mant = 7'h04;
              4'ha: out_mant = 7'h04;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              4'h1: out_mant = 7'h04;
              4'h2: out_mant = 7'h04;
              4'h3: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'hb: out_mant = 7'h00;
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h00;
              4'he: out_mant = 7'h00;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h1: out_mant = 7'h00;
              4'h2: out_mant = 7'h00;
              4'h3: out_mant = 7'h00;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h00;
              4'he: out_mant = 7'h7e;
              4'hf: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7e;
              4'h5: out_mant = 7'h7e;
              4'he: out_mant = 7'h7c;
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7c;
              4'h1: out_mant = 7'h7c;
              4'h2: out_mant = 7'h7c;
              4'h3: out_mant = 7'h7c;
              4'h4: out_mant = 7'h7c;
              4'h5: out_mant = 7'h7c;
              4'h6: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h072: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h5: out_mant = 7'h79;
              4'h6: out_mant = 7'h79;
              4'h7: out_mant = 7'h79;
              4'h8: out_mant = 7'h79;
              4'h9: out_mant = 7'h79;
              4'ha: out_mant = 7'h78;
              4'hb: out_mant = 7'h78;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h77;
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h76;
              4'h5: out_mant = 7'h76;
              4'h6: out_mant = 7'h76;
              4'h7: out_mant = 7'h76;
              4'h8: out_mant = 7'h76;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h0: out_mant = 7'h74;
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h74;
              4'h3: out_mant = 7'h74;
              4'h4: out_mant = 7'h74;
              4'hb: out_mant = 7'h72;
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'h8: out_mant = 7'h70;
              4'h9: out_mant = 7'h70;
              4'ha: out_mant = 7'h70;
              4'hb: out_mant = 7'h70;
              4'hc: out_mant = 7'h70;
              4'hd: out_mant = 7'h70;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h0: out_mant = 7'h6f;
              4'h1: out_mant = 7'h6f;
              4'h2: out_mant = 7'h6f;
              4'h3: out_mant = 7'h6f;
              4'h4: out_mant = 7'h6f;
              4'hd: out_mant = 7'h6d;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'h0: out_mant = 7'h6d;
              4'h1: out_mant = 7'h6d;
              4'h2: out_mant = 7'h6d;
              4'h3: out_mant = 7'h6d;
              4'hc: out_mant = 7'h6b;
              4'hd: out_mant = 7'h6b;
              4'he: out_mant = 7'h6b;
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h0: out_mant = 7'h6b;
              4'h1: out_mant = 7'h6b;
              4'h2: out_mant = 7'h6b;
              4'h3: out_mant = 7'h6b;
              4'hc: out_mant = 7'h69;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h69;
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h69;
              4'h3: out_mant = 7'h69;
              4'h4: out_mant = 7'h69;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h073: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h66;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h67;
              4'h3: out_mant = 7'h67;
              4'h9: out_mant = 7'h65;
              4'ha: out_mant = 7'h65;
              4'hb: out_mant = 7'h65;
              4'hc: out_mant = 7'h65;
              4'hd: out_mant = 7'h65;
              4'he: out_mant = 7'h64;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h0: out_mant = 7'h64;
              4'h1: out_mant = 7'h64;
              4'h2: out_mant = 7'h64;
              4'h3: out_mant = 7'h63;
              4'h4: out_mant = 7'h63;
              4'h5: out_mant = 7'h63;
              4'h6: out_mant = 7'h63;
              4'h7: out_mant = 7'h63;
              4'he: out_mant = 7'h61;
              4'hf: out_mant = 7'h61;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h60;
            case (mant_lo4)
              4'h0: out_mant = 7'h61;
              4'h1: out_mant = 7'h61;
              4'h2: out_mant = 7'h61;
              4'h9: out_mant = 7'h5f;
              4'ha: out_mant = 7'h5f;
              4'hb: out_mant = 7'h5f;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h0: out_mant = 7'h5e;
              4'h1: out_mant = 7'h5e;
              4'h2: out_mant = 7'h5e;
              4'h3: out_mant = 7'h5e;
              4'h4: out_mant = 7'h5e;
              4'h5: out_mant = 7'h5e;
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'h0: out_mant = 7'h5c;
              4'h1: out_mant = 7'h5c;
              4'h2: out_mant = 7'h5c;
              4'hb: out_mant = 7'h5a;
              4'hc: out_mant = 7'h5a;
              4'hd: out_mant = 7'h5a;
              4'he: out_mant = 7'h5a;
              4'hf: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h1: out_mant = 7'h5a;
              4'ha: out_mant = 7'h58;
              4'hb: out_mant = 7'h58;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h1: out_mant = 7'h58;
              4'ha: out_mant = 7'h56;
              4'hb: out_mant = 7'h56;
              4'hc: out_mant = 7'h56;
              4'hd: out_mant = 7'h56;
              4'he: out_mant = 7'h56;
              4'hf: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h0: out_mant = 7'h56;
              4'h1: out_mant = 7'h56;
              4'hb: out_mant = 7'h54;
              4'hc: out_mant = 7'h54;
              4'hd: out_mant = 7'h54;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h074: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              4'h1: out_mant = 7'h54;
              4'h7: out_mant = 7'h52;
              4'h8: out_mant = 7'h52;
              4'h9: out_mant = 7'h52;
              4'ha: out_mant = 7'h52;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h51;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h7: out_mant = 7'h4f;
              4'h8: out_mant = 7'h4f;
              4'h9: out_mant = 7'h4f;
              4'ha: out_mant = 7'h4f;
              4'hb: out_mant = 7'h4f;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h4e;
              4'h8: out_mant = 7'h4c;
              4'h9: out_mant = 7'h4c;
              4'ha: out_mant = 7'h4c;
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4b;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h0: out_mant = 7'h4b;
              4'h1: out_mant = 7'h4b;
              4'h2: out_mant = 7'h4b;
              4'h3: out_mant = 7'h4b;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h49;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              4'h9: out_mant = 7'h47;
              4'ha: out_mant = 7'h47;
              4'hb: out_mant = 7'h47;
              4'hc: out_mant = 7'h47;
              4'hd: out_mant = 7'h47;
              4'he: out_mant = 7'h47;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'h8: out_mant = 7'h45;
              4'h9: out_mant = 7'h45;
              4'ha: out_mant = 7'h45;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h45;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'h8: out_mant = 7'h43;
              4'h9: out_mant = 7'h43;
              4'ha: out_mant = 7'h43;
              4'hb: out_mant = 7'h43;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h43;
              4'he: out_mant = 7'h43;
              4'hf: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h9: out_mant = 7'h41;
              4'ha: out_mant = 7'h41;
              4'hb: out_mant = 7'h41;
              4'hc: out_mant = 7'h41;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h075: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h6: out_mant = 7'h3f;
              4'h7: out_mant = 7'h3f;
              4'h8: out_mant = 7'h3f;
              4'h9: out_mant = 7'h3f;
              4'ha: out_mant = 7'h3f;
              4'hb: out_mant = 7'h3e;
              4'hc: out_mant = 7'h3e;
              4'hd: out_mant = 7'h3e;
              4'he: out_mant = 7'h3e;
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h0: out_mant = 7'h3d;
              4'h1: out_mant = 7'h3d;
              4'h2: out_mant = 7'h3d;
              4'h3: out_mant = 7'h3d;
              4'h4: out_mant = 7'h3d;
              4'hb: out_mant = 7'h3b;
              4'hc: out_mant = 7'h3b;
              4'hd: out_mant = 7'h3b;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h6: out_mant = 7'h39;
              4'h7: out_mant = 7'h39;
              4'h8: out_mant = 7'h39;
              4'h9: out_mant = 7'h39;
              4'ha: out_mant = 7'h39;
              4'hb: out_mant = 7'h39;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h38;
              4'hf: out_mant = 7'h38;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h37;
            case (mant_lo4)
              4'h0: out_mant = 7'h38;
              4'h1: out_mant = 7'h38;
              4'h9: out_mant = 7'h36;
              4'ha: out_mant = 7'h36;
              4'hb: out_mant = 7'h36;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h36;
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h36;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'h7: out_mant = 7'h34;
              4'h8: out_mant = 7'h34;
              4'h9: out_mant = 7'h34;
              4'ha: out_mant = 7'h34;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h33;
              4'hf: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h0: out_mant = 7'h33;
              4'h1: out_mant = 7'h33;
              4'h2: out_mant = 7'h33;
              4'h3: out_mant = 7'h33;
              4'h4: out_mant = 7'h33;
              4'h5: out_mant = 7'h33;
              4'hd: out_mant = 7'h31;
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              4'h1: out_mant = 7'h31;
              4'h2: out_mant = 7'h31;
              4'h3: out_mant = 7'h31;
              4'h4: out_mant = 7'h31;
              4'he: out_mant = 7'h2f;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h0: out_mant = 7'h2f;
              4'h1: out_mant = 7'h2f;
              4'h2: out_mant = 7'h2f;
              4'h3: out_mant = 7'h2f;
              4'h4: out_mant = 7'h2f;
              4'h5: out_mant = 7'h2f;
              4'h6: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h076: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h5: out_mant = 7'h2c;
              4'h6: out_mant = 7'h2c;
              4'h7: out_mant = 7'h2c;
              4'h8: out_mant = 7'h2c;
              4'h9: out_mant = 7'h2c;
              4'ha: out_mant = 7'h2b;
              4'hb: out_mant = 7'h2b;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h0: out_mant = 7'h2a;
              4'h1: out_mant = 7'h2a;
              4'h2: out_mant = 7'h2a;
              4'h3: out_mant = 7'h2a;
              4'h4: out_mant = 7'h29;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h29;
              4'h7: out_mant = 7'h29;
              4'h8: out_mant = 7'h29;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h0: out_mant = 7'h27;
              4'h1: out_mant = 7'h27;
              4'h2: out_mant = 7'h27;
              4'h3: out_mant = 7'h27;
              4'h4: out_mant = 7'h27;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h25;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h25;
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h24;
              4'h2: out_mant = 7'h24;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h24;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h24;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h22;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h0: out_mant = 7'h20;
              4'h1: out_mant = 7'h20;
              4'h2: out_mant = 7'h20;
              4'h3: out_mant = 7'h20;
              4'hb: out_mant = 7'h1e;
              4'hc: out_mant = 7'h1e;
              4'hd: out_mant = 7'h1e;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h0: out_mant = 7'h1e;
              4'h1: out_mant = 7'h1e;
              4'h2: out_mant = 7'h1e;
              4'hc: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h0: out_mant = 7'h1c;
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h1c;
              4'h3: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1a;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h077: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h1a;
              4'h8: out_mant = 7'h18;
              4'h9: out_mant = 7'h18;
              4'ha: out_mant = 7'h18;
              4'hb: out_mant = 7'h18;
              4'hc: out_mant = 7'h18;
              4'hd: out_mant = 7'h17;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h17;
              4'h8: out_mant = 7'h15;
              4'h9: out_mant = 7'h15;
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h15;
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h14;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h14;
              4'h2: out_mant = 7'h14;
              4'h9: out_mant = 7'h12;
              4'ha: out_mant = 7'h12;
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h11;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'h0: out_mant = 7'h11;
              4'h1: out_mant = 7'h11;
              4'h2: out_mant = 7'h11;
              4'h3: out_mant = 7'h11;
              4'h4: out_mant = 7'h11;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h0f;
              4'h1: out_mant = 7'h0f;
              4'h2: out_mant = 7'h0f;
              4'ha: out_mant = 7'h0d;
              4'hb: out_mant = 7'h0d;
              4'hc: out_mant = 7'h0d;
              4'hd: out_mant = 7'h0d;
              4'he: out_mant = 7'h0d;
              4'hf: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h0: out_mant = 7'h0d;
              4'h9: out_mant = 7'h0b;
              4'ha: out_mant = 7'h0b;
              4'hb: out_mant = 7'h0b;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h0b;
              4'he: out_mant = 7'h0b;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h0a;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'h9: out_mant = 7'h09;
              4'ha: out_mant = 7'h09;
              4'hb: out_mant = 7'h09;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h09;
              4'he: out_mant = 7'h09;
              4'hf: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h0: out_mant = 7'h09;
              4'h1: out_mant = 7'h09;
              4'hb: out_mant = 7'h07;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h07;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h078: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              4'h1: out_mant = 7'h07;
              4'h7: out_mant = 7'h05;
              4'h8: out_mant = 7'h05;
              4'h9: out_mant = 7'h05;
              4'ha: out_mant = 7'h05;
              4'hb: out_mant = 7'h05;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h03;
              4'h3: out_mant = 7'h03;
              4'h4: out_mant = 7'h03;
              4'h5: out_mant = 7'h03;
              4'hc: out_mant = 7'h01;
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h01;
              4'h6: out_mant = 7'h7f;
              4'h7: out_mant = 7'h7f;
              4'h8: out_mant = 7'h7f;
              4'h9: out_mant = 7'h7e;
              4'ha: out_mant = 7'h7e;
              4'hb: out_mant = 7'h7e;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h7d;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h0: out_mant = 7'h7c;
              4'h1: out_mant = 7'h7c;
              4'h2: out_mant = 7'h7b;
              4'h3: out_mant = 7'h7b;
              4'h4: out_mant = 7'h7b;
              4'h9: out_mant = 7'h79;
              4'ha: out_mant = 7'h79;
              4'hb: out_mant = 7'h79;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h77;
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h76;
              4'h4: out_mant = 7'h76;
              4'h5: out_mant = 7'h76;
              4'ha: out_mant = 7'h74;
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'h0: out_mant = 7'h73;
              4'h5: out_mant = 7'h71;
              4'h6: out_mant = 7'h71;
              4'h7: out_mant = 7'h71;
              4'h8: out_mant = 7'h71;
              4'h9: out_mant = 7'h70;
              4'ha: out_mant = 7'h70;
              4'hb: out_mant = 7'h70;
              4'hc: out_mant = 7'h70;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h0: out_mant = 7'h6f;
              4'h5: out_mant = 7'h6d;
              4'h6: out_mant = 7'h6d;
              4'h7: out_mant = 7'h6d;
              4'h8: out_mant = 7'h6d;
              4'h9: out_mant = 7'h6c;
              4'ha: out_mant = 7'h6c;
              4'hb: out_mant = 7'h6c;
              4'hc: out_mant = 7'h6c;
              4'hd: out_mant = 7'h6b;
              4'he: out_mant = 7'h6b;
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h0: out_mant = 7'h6b;
              4'h1: out_mant = 7'h6b;
              4'h2: out_mant = 7'h6a;
              4'h3: out_mant = 7'h6a;
              4'h4: out_mant = 7'h6a;
              4'h5: out_mant = 7'h6a;
              4'hb: out_mant = 7'h68;
              4'hc: out_mant = 7'h68;
              4'hd: out_mant = 7'h68;
              4'he: out_mant = 7'h68;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h079: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h66;
              4'h3: out_mant = 7'h66;
              4'h7: out_mant = 7'h64;
              4'h8: out_mant = 7'h64;
              4'h9: out_mant = 7'h63;
              4'ha: out_mant = 7'h63;
              4'hb: out_mant = 7'h63;
              4'hc: out_mant = 7'h62;
              4'hd: out_mant = 7'h62;
              4'he: out_mant = 7'h61;
              4'hf: out_mant = 7'h61;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h0: out_mant = 7'h61;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h60;
              4'h6: out_mant = 7'h5e;
              4'h7: out_mant = 7'h5e;
              4'h8: out_mant = 7'h5e;
              4'h9: out_mant = 7'h5d;
              4'ha: out_mant = 7'h5d;
              4'hb: out_mant = 7'h5d;
              4'hc: out_mant = 7'h5c;
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5b;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'h0: out_mant = 7'h5b;
              4'h4: out_mant = 7'h59;
              4'h5: out_mant = 7'h59;
              4'h6: out_mant = 7'h59;
              4'h7: out_mant = 7'h58;
              4'h8: out_mant = 7'h58;
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h57;
              4'hb: out_mant = 7'h57;
              4'hc: out_mant = 7'h57;
              4'hd: out_mant = 7'h56;
              4'he: out_mant = 7'h56;
              4'hf: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h4: out_mant = 7'h54;
              4'h5: out_mant = 7'h54;
              4'h6: out_mant = 7'h54;
              4'h7: out_mant = 7'h53;
              4'h8: out_mant = 7'h53;
              4'h9: out_mant = 7'h53;
              4'ha: out_mant = 7'h52;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h52;
              4'hd: out_mant = 7'h52;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h5: out_mant = 7'h4f;
              4'h6: out_mant = 7'h4f;
              4'h7: out_mant = 7'h4f;
              4'h8: out_mant = 7'h4e;
              4'h9: out_mant = 7'h4e;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h4d;
              4'hd: out_mant = 7'h4d;
              4'he: out_mant = 7'h4d;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h0: out_mant = 7'h4c;
              4'h1: out_mant = 7'h4c;
              4'h2: out_mant = 7'h4c;
              4'h7: out_mant = 7'h4a;
              4'h8: out_mant = 7'h4a;
              4'h9: out_mant = 7'h4a;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h49;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h48;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'h0: out_mant = 7'h48;
              4'h1: out_mant = 7'h48;
              4'h2: out_mant = 7'h48;
              4'h7: out_mant = 7'h46;
              4'h8: out_mant = 7'h46;
              4'h9: out_mant = 7'h46;
              4'ha: out_mant = 7'h46;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h45;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h44;
              4'h1: out_mant = 7'h44;
              4'h2: out_mant = 7'h44;
              4'h3: out_mant = 7'h44;
              4'h4: out_mant = 7'h43;
              4'h5: out_mant = 7'h43;
              4'h6: out_mant = 7'h43;
              4'h7: out_mant = 7'h43;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h40;
              4'h2: out_mant = 7'h40;
              4'h6: out_mant = 7'h3e;
              4'h7: out_mant = 7'h3e;
              4'h8: out_mant = 7'h3d;
              4'h9: out_mant = 7'h3d;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3b;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h1: out_mant = 7'h3a;
              4'h5: out_mant = 7'h38;
              4'h6: out_mant = 7'h38;
              4'h7: out_mant = 7'h37;
              4'h8: out_mant = 7'h37;
              4'h9: out_mant = 7'h37;
              4'ha: out_mant = 7'h36;
              4'hb: out_mant = 7'h36;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h35;
              4'he: out_mant = 7'h35;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h3: out_mant = 7'h33;
              4'h4: out_mant = 7'h33;
              4'h5: out_mant = 7'h33;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h32;
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h31;
              4'ha: out_mant = 7'h31;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h30;
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h0: out_mant = 7'h2f;
              4'h1: out_mant = 7'h2f;
              4'h2: out_mant = 7'h2e;
              4'h3: out_mant = 7'h2e;
              4'h4: out_mant = 7'h2e;
              4'h5: out_mant = 7'h2d;
              4'h6: out_mant = 7'h2d;
              4'h7: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h0: out_mant = 7'h2a;
              4'h1: out_mant = 7'h2a;
              4'h2: out_mant = 7'h2a;
              4'h3: out_mant = 7'h29;
              4'h4: out_mant = 7'h29;
              4'h5: out_mant = 7'h29;
              4'ha: out_mant = 7'h27;
              4'hb: out_mant = 7'h27;
              4'hc: out_mant = 7'h27;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h25;
            case (mant_lo4)
              4'h0: out_mant = 7'h26;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h24;
              4'h7: out_mant = 7'h24;
              4'h8: out_mant = 7'h24;
              4'h9: out_mant = 7'h23;
              4'ha: out_mant = 7'h23;
              4'hb: out_mant = 7'h23;
              4'hc: out_mant = 7'h23;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h5: out_mant = 7'h20;
              4'h6: out_mant = 7'h20;
              4'h7: out_mant = 7'h20;
              4'h8: out_mant = 7'h20;
              4'h9: out_mant = 7'h1f;
              4'ha: out_mant = 7'h1f;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h1e;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h0: out_mant = 7'h1e;
              4'h6: out_mant = 7'h1c;
              4'h7: out_mant = 7'h1c;
              4'h8: out_mant = 7'h1c;
              4'h9: out_mant = 7'h1c;
              4'ha: out_mant = 7'h1b;
              4'hb: out_mant = 7'h1b;
              4'hc: out_mant = 7'h1b;
              4'hd: out_mant = 7'h1b;
              4'he: out_mant = 7'h1b;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h19;
              4'h3: out_mant = 7'h19;
              4'h7: out_mant = 7'h17;
              4'h8: out_mant = 7'h17;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h16;
              4'hc: out_mant = 7'h15;
              4'hd: out_mant = 7'h15;
              4'he: out_mant = 7'h14;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h13;
              4'h2: out_mant = 7'h13;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h11;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h10;
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h0f;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h0: out_mant = 7'h0e;
              4'h4: out_mant = 7'h0c;
              4'h5: out_mant = 7'h0c;
              4'h6: out_mant = 7'h0c;
              4'h7: out_mant = 7'h0b;
              4'h8: out_mant = 7'h0b;
              4'h9: out_mant = 7'h0b;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h0a;
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h09;
              4'he: out_mant = 7'h09;
              4'hf: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h08;
              4'h7: out_mant = 7'h06;
              4'h8: out_mant = 7'h06;
              4'h9: out_mant = 7'h06;
              4'ha: out_mant = 7'h05;
              4'hb: out_mant = 7'h05;
              4'hc: out_mant = 7'h05;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h03;
              4'h3: out_mant = 7'h03;
              4'h8: out_mant = 7'h01;
              4'h9: out_mant = 7'h01;
              4'ha: out_mant = 7'h01;
              4'hb: out_mant = 7'h00;
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h00;
              4'he: out_mant = 7'h7f;
              4'hf: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'h2: out_mant = 7'h7d;
              4'h3: out_mant = 7'h7d;
              4'h4: out_mant = 7'h7c;
              4'h5: out_mant = 7'h7c;
              4'h6: out_mant = 7'h7b;
              4'h7: out_mant = 7'h7b;
              4'h8: out_mant = 7'h7a;
              4'h9: out_mant = 7'h7a;
              4'ha: out_mant = 7'h79;
              4'hb: out_mant = 7'h79;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h77;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'h2: out_mant = 7'h75;
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h74;
              4'h5: out_mant = 7'h74;
              4'h6: out_mant = 7'h73;
              4'h7: out_mant = 7'h73;
              4'h8: out_mant = 7'h72;
              4'h9: out_mant = 7'h72;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h71;
              4'hc: out_mant = 7'h70;
              4'hd: out_mant = 7'h70;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h0: out_mant = 7'h6e;
              4'h1: out_mant = 7'h6e;
              4'h5: out_mant = 7'h6c;
              4'h6: out_mant = 7'h6c;
              4'h7: out_mant = 7'h6b;
              4'h8: out_mant = 7'h6b;
              4'h9: out_mant = 7'h6a;
              4'ha: out_mant = 7'h6a;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h69;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h68;
              4'hf: out_mant = 7'h68;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h66;
              4'h4: out_mant = 7'h64;
              4'h5: out_mant = 7'h63;
              4'h6: out_mant = 7'h62;
              4'h7: out_mant = 7'h61;
              4'h8: out_mant = 7'h60;
              4'h9: out_mant = 7'h60;
              4'ha: out_mant = 7'h5f;
              4'hb: out_mant = 7'h5e;
              4'hc: out_mant = 7'h5d;
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h57;
              4'h5: out_mant = 7'h56;
              4'h6: out_mant = 7'h56;
              4'h7: out_mant = 7'h55;
              4'h8: out_mant = 7'h54;
              4'h9: out_mant = 7'h53;
              4'ha: out_mant = 7'h53;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h51;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h4f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'h2: out_mant = 7'h4d;
              4'h3: out_mant = 7'h4c;
              4'h4: out_mant = 7'h4c;
              4'h5: out_mant = 7'h4b;
              4'h6: out_mant = 7'h4a;
              4'h7: out_mant = 7'h4a;
              4'h8: out_mant = 7'h49;
              4'h9: out_mant = 7'h48;
              4'ha: out_mant = 7'h48;
              4'hb: out_mant = 7'h47;
              4'hc: out_mant = 7'h46;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h0: out_mant = 7'h44;
              4'h3: out_mant = 7'h42;
              4'h4: out_mant = 7'h41;
              4'h5: out_mant = 7'h41;
              4'h6: out_mant = 7'h40;
              4'h7: out_mant = 7'h3f;
              4'h8: out_mant = 7'h3f;
              4'h9: out_mant = 7'h3e;
              4'ha: out_mant = 7'h3e;
              4'hb: out_mant = 7'h3d;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h38;
              4'h4: out_mant = 7'h38;
              4'h5: out_mant = 7'h37;
              4'h6: out_mant = 7'h37;
              4'h7: out_mant = 7'h36;
              4'h8: out_mant = 7'h36;
              4'h9: out_mant = 7'h35;
              4'ha: out_mant = 7'h34;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h33;
              4'hd: out_mant = 7'h33;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h31;
            case (mant_lo4)
              4'h2: out_mant = 7'h30;
              4'h3: out_mant = 7'h30;
              4'h4: out_mant = 7'h2f;
              4'h5: out_mant = 7'h2f;
              4'h6: out_mant = 7'h2e;
              4'h7: out_mant = 7'h2e;
              4'h8: out_mant = 7'h2d;
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h2c;
              4'hb: out_mant = 7'h2b;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2a;
              4'he: out_mant = 7'h2a;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h28;
              4'h6: out_mant = 7'h26;
              4'h7: out_mant = 7'h26;
              4'h8: out_mant = 7'h25;
              4'h9: out_mant = 7'h25;
              4'ha: out_mant = 7'h24;
              4'hb: out_mant = 7'h24;
              4'hc: out_mant = 7'h23;
              4'hd: out_mant = 7'h23;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h0: out_mant = 7'h21;
              4'h1: out_mant = 7'h21;
              4'h2: out_mant = 7'h20;
              4'h3: out_mant = 7'h20;
              4'h7: out_mant = 7'h1e;
              4'h8: out_mant = 7'h1e;
              4'h9: out_mant = 7'h1d;
              4'ha: out_mant = 7'h1d;
              4'hb: out_mant = 7'h1c;
              4'hc: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1b;
              4'he: out_mant = 7'h1b;
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h19;
              4'h4: out_mant = 7'h17;
              4'h5: out_mant = 7'h16;
              4'h6: out_mant = 7'h15;
              4'h7: out_mant = 7'h14;
              4'h8: out_mant = 7'h13;
              4'h9: out_mant = 7'h13;
              4'ha: out_mant = 7'h12;
              4'hb: out_mant = 7'h11;
              4'hc: out_mant = 7'h10;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0d;
              4'h1: out_mant = 7'h0c;
              4'h4: out_mant = 7'h0a;
              4'h5: out_mant = 7'h09;
              4'h6: out_mant = 7'h08;
              4'h7: out_mant = 7'h08;
              4'h8: out_mant = 7'h07;
              4'h9: out_mant = 7'h06;
              4'ha: out_mant = 7'h06;
              4'hb: out_mant = 7'h05;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h2: out_mant = 7'h00;
              4'h3: out_mant = 7'h7f;
              4'h4: out_mant = 7'h7d;
              4'h5: out_mant = 7'h7c;
              4'h6: out_mant = 7'h7a;
              4'h7: out_mant = 7'h79;
              4'h8: out_mant = 7'h78;
              4'h9: out_mant = 7'h76;
              4'ha: out_mant = 7'h75;
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h73;
              4'hd: out_mant = 7'h71;
              4'he: out_mant = 7'h70;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h1: out_mant = 7'h6c;
              4'h2: out_mant = 7'h6b;
              4'h3: out_mant = 7'h6a;
              4'h4: out_mant = 7'h68;
              4'h5: out_mant = 7'h67;
              4'h6: out_mant = 7'h66;
              4'h7: out_mant = 7'h65;
              4'h8: out_mant = 7'h64;
              4'h9: out_mant = 7'h62;
              4'ha: out_mant = 7'h61;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5e;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'h1: out_mant = 7'h59;
              4'h2: out_mant = 7'h58;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h56;
              4'h5: out_mant = 7'h54;
              4'h6: out_mant = 7'h53;
              4'h7: out_mant = 7'h52;
              4'h8: out_mant = 7'h51;
              4'h9: out_mant = 7'h50;
              4'ha: out_mant = 7'h4f;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h4d;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4a;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h1: out_mant = 7'h47;
              4'h2: out_mant = 7'h46;
              4'h3: out_mant = 7'h45;
              4'h4: out_mant = 7'h44;
              4'h5: out_mant = 7'h43;
              4'h6: out_mant = 7'h42;
              4'h7: out_mant = 7'h41;
              4'h8: out_mant = 7'h40;
              4'h9: out_mant = 7'h3f;
              4'ha: out_mant = 7'h3e;
              4'hb: out_mant = 7'h3d;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3b;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h36;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h34;
              4'h5: out_mant = 7'h33;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h31;
              4'h8: out_mant = 7'h30;
              4'h9: out_mant = 7'h2f;
              4'ha: out_mant = 7'h2e;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2c;
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2a;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h2: out_mant = 7'h27;
              4'h3: out_mant = 7'h26;
              4'h4: out_mant = 7'h25;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h23;
              4'h7: out_mant = 7'h22;
              4'h8: out_mant = 7'h21;
              4'h9: out_mant = 7'h20;
              4'ha: out_mant = 7'h1f;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1e;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h1: out_mant = 7'h18;
              4'h2: out_mant = 7'h17;
              4'h3: out_mant = 7'h15;
              4'h4: out_mant = 7'h13;
              4'h5: out_mant = 7'h12;
              4'h6: out_mant = 7'h10;
              4'h7: out_mant = 7'h0e;
              4'h8: out_mant = 7'h0d;
              4'h9: out_mant = 7'h0b;
              4'ha: out_mant = 7'h09;
              4'hb: out_mant = 7'h08;
              4'hc: out_mant = 7'h06;
              4'hd: out_mant = 7'h05;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h1: out_mant = 7'h7d;
              4'h2: out_mant = 7'h7a;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h74;
              4'h5: out_mant = 7'h71;
              4'h6: out_mant = 7'h6e;
              4'h7: out_mant = 7'h6b;
              4'h8: out_mant = 7'h68;
              4'h9: out_mant = 7'h65;
              4'ha: out_mant = 7'h62;
              4'hb: out_mant = 7'h5f;
              4'hc: out_mant = 7'h5c;
              4'hd: out_mant = 7'h59;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h1: out_mant = 7'h4e;
              4'h2: out_mant = 7'h4b;
              4'h3: out_mant = 7'h49;
              4'h4: out_mant = 7'h46;
              4'h5: out_mant = 7'h43;
              4'h6: out_mant = 7'h41;
              4'h7: out_mant = 7'h3e;
              4'h8: out_mant = 7'h3b;
              4'h9: out_mant = 7'h39;
              4'ha: out_mant = 7'h36;
              4'hb: out_mant = 7'h33;
              4'hc: out_mant = 7'h31;
              4'hd: out_mant = 7'h2e;
              4'he: out_mant = 7'h2c;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h1: out_mant = 7'h24;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h1f;
              4'h4: out_mant = 7'h1d;
              4'h5: out_mant = 7'h1a;
              4'h6: out_mant = 7'h18;
              4'h7: out_mant = 7'h15;
              4'h8: out_mant = 7'h13;
              4'h9: out_mant = 7'h10;
              4'ha: out_mant = 7'h0e;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h1: out_mant = 7'h7b;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h72;
              4'h4: out_mant = 7'h6e;
              4'h5: out_mant = 7'h69;
              4'h6: out_mant = 7'h65;
              4'h7: out_mant = 7'h60;
              4'h8: out_mant = 7'h5c;
              4'h9: out_mant = 7'h57;
              4'ha: out_mant = 7'h53;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h4a;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h1: out_mant = 7'h34;
              4'h2: out_mant = 7'h30;
              4'h3: out_mant = 7'h2c;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h1f;
              4'h7: out_mant = 7'h1b;
              4'h8: out_mant = 7'h17;
              4'h9: out_mant = 7'h13;
              4'ha: out_mant = 7'h0f;
              4'hb: out_mant = 7'h0b;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h5e;
              4'h3: out_mant = 7'h56;
              4'h4: out_mant = 7'h4e;
              4'h5: out_mant = 7'h46;
              4'h6: out_mant = 7'h3f;
              4'h7: out_mant = 7'h37;
              4'h8: out_mant = 7'h2f;
              4'h9: out_mant = 7'h27;
              4'ha: out_mant = 7'h20;
              4'hb: out_mant = 7'h18;
              4'hc: out_mant = 7'h11;
              4'hd: out_mant = 7'h09;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h48;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h2b;
              4'h5: out_mant = 7'h1c;
              4'h6: out_mant = 7'h0e;
              4'h7: out_mant = 7'h7f;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h45;
              4'ha: out_mant = 7'h29;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h60;
              4'hd: out_mant = 7'h28;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h3: out_mant = 7'h25;
              4'h4: out_mant = 7'h5b;
              4'h5: out_mant = 7'h08;
              4'h6: out_mant = 7'h23;
              4'h7: out_mant = 7'h3d;
              4'h8: out_mant = 7'h58;
              4'h9: out_mant = 7'h72;
              4'ha: out_mant = 7'h06;
              4'hb: out_mant = 7'h13;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h2c;
              4'he: out_mant = 7'h39;
              4'hf: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h1: out_mant = 7'h5e;
              4'h2: out_mant = 7'h6a;
              4'h3: out_mant = 7'h76;
              4'h4: out_mant = 7'h01;
              4'h5: out_mant = 7'h07;
              4'h6: out_mant = 7'h0d;
              4'h7: out_mant = 7'h13;
              4'h8: out_mant = 7'h19;
              4'h9: out_mant = 7'h1f;
              4'ha: out_mant = 7'h24;
              4'hb: out_mant = 7'h2a;
              4'hc: out_mant = 7'h30;
              4'hd: out_mant = 7'h36;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'h1: out_mant = 7'h4c;
              4'h2: out_mant = 7'h52;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h5c;
              4'h5: out_mant = 7'h62;
              4'h6: out_mant = 7'h67;
              4'h7: out_mant = 7'h6d;
              4'h8: out_mant = 7'h72;
              4'h9: out_mant = 7'h77;
              4'ha: out_mant = 7'h7c;
              4'hb: out_mant = 7'h01;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h09;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h1: out_mant = 7'h10;
              4'h2: out_mant = 7'h13;
              4'h3: out_mant = 7'h15;
              4'h4: out_mant = 7'h18;
              4'h5: out_mant = 7'h1a;
              4'h6: out_mant = 7'h1d;
              4'h7: out_mant = 7'h1f;
              4'h8: out_mant = 7'h21;
              4'h9: out_mant = 7'h24;
              4'ha: out_mant = 7'h26;
              4'hb: out_mant = 7'h29;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2d;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h3b;
              4'h4: out_mant = 7'h3d;
              4'h5: out_mant = 7'h40;
              4'h6: out_mant = 7'h42;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h46;
              4'h9: out_mant = 7'h49;
              4'ha: out_mant = 7'h4b;
              4'hb: out_mant = 7'h4d;
              4'hc: out_mant = 7'h4f;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h1: out_mant = 7'h5a;
              4'h2: out_mant = 7'h5c;
              4'h3: out_mant = 7'h5e;
              4'h4: out_mant = 7'h60;
              4'h5: out_mant = 7'h62;
              4'h6: out_mant = 7'h65;
              4'h7: out_mant = 7'h67;
              4'h8: out_mant = 7'h69;
              4'h9: out_mant = 7'h6b;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h71;
              4'hd: out_mant = 7'h73;
              4'he: out_mant = 7'h75;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h1: out_mant = 7'h7b;
              4'h2: out_mant = 7'h7d;
              4'h3: out_mant = 7'h7f;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h01;
              4'h6: out_mant = 7'h02;
              4'h7: out_mant = 7'h03;
              4'h8: out_mant = 7'h04;
              4'h9: out_mant = 7'h05;
              4'ha: out_mant = 7'h06;
              4'hb: out_mant = 7'h07;
              4'hc: out_mant = 7'h08;
              4'hd: out_mant = 7'h09;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h0e;
              4'h5: out_mant = 7'h10;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h12;
              4'h8: out_mant = 7'h13;
              4'h9: out_mant = 7'h14;
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h16;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h1e;
              4'h3: out_mant = 7'h1f;
              4'h4: out_mant = 7'h21;
              4'h5: out_mant = 7'h23;
              4'h6: out_mant = 7'h24;
              4'h7: out_mant = 7'h26;
              4'h8: out_mant = 7'h28;
              4'h9: out_mant = 7'h29;
              4'ha: out_mant = 7'h2b;
              4'hb: out_mant = 7'h2c;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h1: out_mant = 7'h36;
              4'h2: out_mant = 7'h37;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h3c;
              4'h6: out_mant = 7'h3d;
              4'h7: out_mant = 7'h3f;
              4'h8: out_mant = 7'h40;
              4'h9: out_mant = 7'h42;
              4'ha: out_mant = 7'h43;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h46;
              4'hd: out_mant = 7'h48;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4c;
            case (mant_lo4)
              4'h1: out_mant = 7'h4d;
              4'h2: out_mant = 7'h4f;
              4'h3: out_mant = 7'h50;
              4'h4: out_mant = 7'h51;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h54;
              4'h7: out_mant = 7'h55;
              4'h8: out_mant = 7'h57;
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h59;
              4'hb: out_mant = 7'h5b;
              4'hc: out_mant = 7'h5c;
              4'hd: out_mant = 7'h5d;
              4'he: out_mant = 7'h5e;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h63;
              4'h3: out_mant = 7'h65;
              4'h4: out_mant = 7'h66;
              4'h5: out_mant = 7'h67;
              4'h6: out_mant = 7'h68;
              4'h7: out_mant = 7'h6a;
              4'h8: out_mant = 7'h6b;
              4'h9: out_mant = 7'h6c;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h6e;
              4'hc: out_mant = 7'h70;
              4'hd: out_mant = 7'h71;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h74;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h78;
              4'h4: out_mant = 7'h79;
              4'h5: out_mant = 7'h7a;
              4'h6: out_mant = 7'h7b;
              4'h7: out_mant = 7'h7c;
              4'h8: out_mant = 7'h7d;
              4'h9: out_mant = 7'h7e;
              4'hc: out_mant = 7'h01;
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              4'h3: out_mant = 7'h05;
              4'h4: out_mant = 7'h05;
              4'h5: out_mant = 7'h06;
              4'h6: out_mant = 7'h06;
              4'h7: out_mant = 7'h07;
              4'h8: out_mant = 7'h07;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h09;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'h1: out_mant = 7'h0c;
              4'h2: out_mant = 7'h0c;
              4'h3: out_mant = 7'h0d;
              4'h4: out_mant = 7'h0d;
              4'h5: out_mant = 7'h0e;
              4'h6: out_mant = 7'h0e;
              4'h7: out_mant = 7'h0f;
              4'h8: out_mant = 7'h0f;
              4'h9: out_mant = 7'h10;
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h11;
              4'hc: out_mant = 7'h11;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h13;
              4'h1: out_mant = 7'h13;
              4'h2: out_mant = 7'h14;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h15;
              4'h5: out_mant = 7'h15;
              4'h6: out_mant = 7'h16;
              4'h7: out_mant = 7'h16;
              4'hb: out_mant = 7'h18;
              4'hc: out_mant = 7'h18;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h19;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h1b;
              4'h2: out_mant = 7'h1c;
              4'h3: out_mant = 7'h1d;
              4'h6: out_mant = 7'h1f;
              4'h7: out_mant = 7'h20;
              4'h8: out_mant = 7'h21;
              4'h9: out_mant = 7'h22;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h23;
              4'hc: out_mant = 7'h24;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h27;
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h29;
              4'h5: out_mant = 7'h2b;
              4'h6: out_mant = 7'h2c;
              4'h7: out_mant = 7'h2c;
              4'h8: out_mant = 7'h2d;
              4'h9: out_mant = 7'h2e;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h2f;
              4'hc: out_mant = 7'h30;
              4'hd: out_mant = 7'h31;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h0: out_mant = 7'h33;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h36;
              4'h5: out_mant = 7'h36;
              4'h6: out_mant = 7'h37;
              4'h7: out_mant = 7'h38;
              4'h8: out_mant = 7'h38;
              4'h9: out_mant = 7'h39;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h3a;
              4'hc: out_mant = 7'h3b;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3c;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h2: out_mant = 7'h3f;
              4'h3: out_mant = 7'h3f;
              4'h4: out_mant = 7'h40;
              4'h5: out_mant = 7'h41;
              4'h6: out_mant = 7'h41;
              4'h7: out_mant = 7'h42;
              4'h8: out_mant = 7'h42;
              4'h9: out_mant = 7'h43;
              4'ha: out_mant = 7'h44;
              4'hb: out_mant = 7'h44;
              4'hc: out_mant = 7'h45;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h46;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h47;
              4'h3: out_mant = 7'h49;
              4'h4: out_mant = 7'h49;
              4'h5: out_mant = 7'h4a;
              4'h6: out_mant = 7'h4b;
              4'h7: out_mant = 7'h4b;
              4'h8: out_mant = 7'h4c;
              4'h9: out_mant = 7'h4c;
              4'ha: out_mant = 7'h4d;
              4'hb: out_mant = 7'h4d;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4f;
              4'hf: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h0: out_mant = 7'h50;
              4'h3: out_mant = 7'h52;
              4'h4: out_mant = 7'h52;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h53;
              4'h7: out_mant = 7'h54;
              4'h8: out_mant = 7'h54;
              4'h9: out_mant = 7'h55;
              4'ha: out_mant = 7'h55;
              4'hb: out_mant = 7'h56;
              4'hc: out_mant = 7'h56;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h3: out_mant = 7'h5a;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h5b;
              4'h6: out_mant = 7'h5b;
              4'h7: out_mant = 7'h5c;
              4'h8: out_mant = 7'h5c;
              4'h9: out_mant = 7'h5d;
              4'ha: out_mant = 7'h5d;
              4'hb: out_mant = 7'h5e;
              4'hc: out_mant = 7'h5e;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h61;
              4'h3: out_mant = 7'h61;
              4'h4: out_mant = 7'h62;
              4'h5: out_mant = 7'h62;
              4'h6: out_mant = 7'h63;
              4'h7: out_mant = 7'h63;
              4'h8: out_mant = 7'h64;
              4'h9: out_mant = 7'h64;
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h68;
              4'h2: out_mant = 7'h69;
              4'h3: out_mant = 7'h6a;
              4'h6: out_mant = 7'h6c;
              4'h7: out_mant = 7'h6d;
              4'h8: out_mant = 7'h6e;
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h70;
              4'hb: out_mant = 7'h70;
              4'hc: out_mant = 7'h71;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h0: out_mant = 7'h74;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h76;
              4'h5: out_mant = 7'h78;
              4'h6: out_mant = 7'h79;
              4'h7: out_mant = 7'h7a;
              4'h8: out_mant = 7'h7a;
              4'h9: out_mant = 7'h7b;
              4'ha: out_mant = 7'h7c;
              4'hb: out_mant = 7'h7c;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h7e;
              4'he: out_mant = 7'h7f;
              4'hf: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h1: out_mant = 7'h00;
              4'h5: out_mant = 7'h02;
              4'h6: out_mant = 7'h02;
              4'h7: out_mant = 7'h02;
              4'h8: out_mant = 7'h03;
              4'h9: out_mant = 7'h03;
              4'ha: out_mant = 7'h03;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h05;
              4'h1: out_mant = 7'h06;
              4'h2: out_mant = 7'h06;
              4'h3: out_mant = 7'h06;
              4'h8: out_mant = 7'h08;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h09;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h09;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              4'h2: out_mant = 7'h0b;
              4'h3: out_mant = 7'h0b;
              4'h4: out_mant = 7'h0b;
              4'h9: out_mant = 7'h0d;
              4'ha: out_mant = 7'h0d;
              4'hb: out_mant = 7'h0d;
              4'hc: out_mant = 7'h0e;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h4: out_mant = 7'h10;
              4'h5: out_mant = 7'h10;
              4'h6: out_mant = 7'h10;
              4'h7: out_mant = 7'h10;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h11;
              4'hb: out_mant = 7'h11;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h14;
              4'h6: out_mant = 7'h14;
              4'h7: out_mant = 7'h14;
              4'h8: out_mant = 7'h15;
              4'h9: out_mant = 7'h15;
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h16;
              4'hd: out_mant = 7'h16;
              4'he: out_mant = 7'h16;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h5: out_mant = 7'h18;
              4'h6: out_mant = 7'h18;
              4'h7: out_mant = 7'h18;
              4'h8: out_mant = 7'h18;
              4'h9: out_mant = 7'h19;
              4'ha: out_mant = 7'h19;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h19;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h083: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h4: out_mant = 7'h1c;
              4'h5: out_mant = 7'h1c;
              4'h6: out_mant = 7'h1d;
              4'h7: out_mant = 7'h1d;
              4'h8: out_mant = 7'h1d;
              4'h9: out_mant = 7'h1e;
              4'ha: out_mant = 7'h1e;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h22;
              4'h5: out_mant = 7'h23;
              4'h6: out_mant = 7'h23;
              4'h7: out_mant = 7'h23;
              4'h8: out_mant = 7'h24;
              4'h9: out_mant = 7'h24;
              4'ha: out_mant = 7'h24;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h25;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h3: out_mant = 7'h28;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h28;
              4'h6: out_mant = 7'h29;
              4'h7: out_mant = 7'h29;
              4'h8: out_mant = 7'h29;
              4'h9: out_mant = 7'h2a;
              4'ha: out_mant = 7'h2a;
              4'hb: out_mant = 7'h2a;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'h0: out_mant = 7'h2c;
              4'h1: out_mant = 7'h2c;
              4'h2: out_mant = 7'h2c;
              4'h3: out_mant = 7'h2d;
              4'h4: out_mant = 7'h2d;
              4'h5: out_mant = 7'h2d;
              4'h6: out_mant = 7'h2e;
              4'h7: out_mant = 7'h2e;
              4'h8: out_mant = 7'h2e;
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h30;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              4'h1: out_mant = 7'h31;
              4'h2: out_mant = 7'h31;
              4'h7: out_mant = 7'h33;
              4'h8: out_mant = 7'h33;
              4'h9: out_mant = 7'h33;
              4'ha: out_mant = 7'h33;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h35;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h0: out_mant = 7'h35;
              4'h1: out_mant = 7'h35;
              4'h6: out_mant = 7'h37;
              4'h7: out_mant = 7'h37;
              4'h8: out_mant = 7'h37;
              4'h9: out_mant = 7'h37;
              4'ha: out_mant = 7'h38;
              4'hb: out_mant = 7'h38;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h39;
              4'hf: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h0: out_mant = 7'h39;
              4'h1: out_mant = 7'h39;
              4'h6: out_mant = 7'h3b;
              4'h7: out_mant = 7'h3b;
              4'h8: out_mant = 7'h3b;
              4'h9: out_mant = 7'h3b;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h0: out_mant = 7'h3d;
              4'h1: out_mant = 7'h3d;
              4'h7: out_mant = 7'h3f;
              4'h8: out_mant = 7'h3f;
              4'h9: out_mant = 7'h3f;
              4'ha: out_mant = 7'h3f;
              4'hb: out_mant = 7'h40;
              4'hc: out_mant = 7'h40;
              4'hd: out_mant = 7'h40;
              4'he: out_mant = 7'h40;
              4'hf: out_mant = 7'h40;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h084: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h5: out_mant = 7'h43;
              4'h6: out_mant = 7'h43;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h44;
              4'h9: out_mant = 7'h44;
              4'ha: out_mant = 7'h45;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h46;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h46;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h47;
              4'h4: out_mant = 7'h49;
              4'h5: out_mant = 7'h49;
              4'h6: out_mant = 7'h49;
              4'h7: out_mant = 7'h4a;
              4'h8: out_mant = 7'h4a;
              4'h9: out_mant = 7'h4b;
              4'ha: out_mant = 7'h4b;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'h0: out_mant = 7'h4d;
              4'h1: out_mant = 7'h4d;
              4'h5: out_mant = 7'h4f;
              4'h6: out_mant = 7'h4f;
              4'h7: out_mant = 7'h4f;
              4'h8: out_mant = 7'h50;
              4'h9: out_mant = 7'h50;
              4'ha: out_mant = 7'h50;
              4'hb: out_mant = 7'h51;
              4'hc: out_mant = 7'h51;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h0: out_mant = 7'h52;
              4'h1: out_mant = 7'h53;
              4'h2: out_mant = 7'h53;
              4'h3: out_mant = 7'h53;
              4'h4: out_mant = 7'h54;
              4'h5: out_mant = 7'h54;
              4'h6: out_mant = 7'h54;
              4'hb: out_mant = 7'h56;
              4'hc: out_mant = 7'h56;
              4'hd: out_mant = 7'h56;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h58;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h58;
              4'h9: out_mant = 7'h5a;
              4'ha: out_mant = 7'h5a;
              4'hb: out_mant = 7'h5a;
              4'hc: out_mant = 7'h5b;
              4'hd: out_mant = 7'h5b;
              4'he: out_mant = 7'h5b;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'h4: out_mant = 7'h5d;
              4'h5: out_mant = 7'h5d;
              4'h6: out_mant = 7'h5d;
              4'h7: out_mant = 7'h5d;
              4'h8: out_mant = 7'h5e;
              4'h9: out_mant = 7'h5e;
              4'ha: out_mant = 7'h5e;
              4'hb: out_mant = 7'h5f;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h60;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h62;
              4'ha: out_mant = 7'h62;
              4'hb: out_mant = 7'h62;
              4'hc: out_mant = 7'h63;
              4'hd: out_mant = 7'h63;
              4'he: out_mant = 7'h63;
              4'hf: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h64;
              4'h1: out_mant = 7'h64;
              4'h2: out_mant = 7'h64;
              4'h3: out_mant = 7'h64;
              4'h9: out_mant = 7'h66;
              4'ha: out_mant = 7'h66;
              4'hb: out_mant = 7'h66;
              4'hc: out_mant = 7'h66;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h4: out_mant = 7'h69;
              4'h5: out_mant = 7'h69;
              4'h6: out_mant = 7'h6a;
              4'h7: out_mant = 7'h6a;
              4'h8: out_mant = 7'h6b;
              4'h9: out_mant = 7'h6b;
              4'ha: out_mant = 7'h6b;
              4'hb: out_mant = 7'h6c;
              4'hc: out_mant = 7'h6c;
              4'hd: out_mant = 7'h6d;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h0: out_mant = 7'h6e;
              4'h1: out_mant = 7'h6e;
              4'h5: out_mant = 7'h70;
              4'h6: out_mant = 7'h70;
              4'h7: out_mant = 7'h70;
              4'h8: out_mant = 7'h71;
              4'h9: out_mant = 7'h71;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h72;
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h73;
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h75;
              4'h5: out_mant = 7'h75;
              4'h6: out_mant = 7'h76;
              4'h7: out_mant = 7'h76;
              4'h8: out_mant = 7'h76;
              4'h9: out_mant = 7'h77;
              4'ha: out_mant = 7'h77;
              4'hb: out_mant = 7'h77;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              4'h1: out_mant = 7'h79;
              4'h6: out_mant = 7'h7b;
              4'h7: out_mant = 7'h7b;
              4'h8: out_mant = 7'h7b;
              4'h9: out_mant = 7'h7c;
              4'ha: out_mant = 7'h7c;
              4'hb: out_mant = 7'h7c;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h7d;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7f;
              4'h4: out_mant = 7'h7f;
              4'h5: out_mant = 7'h7f;
              4'h6: out_mant = 7'h7f;
              4'hc: out_mant = 7'h01;
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h01;
              4'h1: out_mant = 7'h01;
              4'h2: out_mant = 7'h01;
              4'h3: out_mant = 7'h01;
              4'hb: out_mant = 7'h03;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h03;
              4'hc: out_mant = 7'h05;
              4'hd: out_mant = 7'h05;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h0: out_mant = 7'h05;
              4'h1: out_mant = 7'h05;
              4'h2: out_mant = 7'h05;
              4'h3: out_mant = 7'h05;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h07;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h086: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h07;
              4'h8: out_mant = 7'h09;
              4'h9: out_mant = 7'h09;
              4'ha: out_mant = 7'h09;
              4'hb: out_mant = 7'h09;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              4'h8: out_mant = 7'h0c;
              4'h9: out_mant = 7'h0c;
              4'ha: out_mant = 7'h0c;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h0d;
              4'he: out_mant = 7'h0d;
              4'hf: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h0d;
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h0d;
              4'h9: out_mant = 7'h0f;
              4'ha: out_mant = 7'h0f;
              4'hb: out_mant = 7'h0f;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h11;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h11;
              4'hb: out_mant = 7'h11;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h0: out_mant = 7'h12;
              4'h1: out_mant = 7'h12;
              4'h2: out_mant = 7'h12;
              4'ha: out_mant = 7'h14;
              4'hb: out_mant = 7'h14;
              4'hc: out_mant = 7'h14;
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h14;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h14;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h16;
              4'hc: out_mant = 7'h16;
              4'hd: out_mant = 7'h16;
              4'he: out_mant = 7'h16;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h9: out_mant = 7'h18;
              4'ha: out_mant = 7'h18;
              4'hb: out_mant = 7'h18;
              4'hc: out_mant = 7'h18;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h18;
              4'h1: out_mant = 7'h18;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h1a;
              4'hd: out_mant = 7'h1a;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h087: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h1a;
              4'h7: out_mant = 7'h1c;
              4'h8: out_mant = 7'h1c;
              4'h9: out_mant = 7'h1c;
              4'ha: out_mant = 7'h1c;
              4'hb: out_mant = 7'h1c;
              4'hc: out_mant = 7'h1d;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h0: out_mant = 7'h1d;
              4'h1: out_mant = 7'h1e;
              4'h2: out_mant = 7'h1e;
              4'h3: out_mant = 7'h1e;
              4'h4: out_mant = 7'h1e;
              4'h5: out_mant = 7'h1e;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h20;
              4'h7: out_mant = 7'h22;
              4'h8: out_mant = 7'h22;
              4'h9: out_mant = 7'h22;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h23;
              4'he: out_mant = 7'h23;
              4'hf: out_mant = 7'h23;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h0: out_mant = 7'h23;
              4'h1: out_mant = 7'h23;
              4'h2: out_mant = 7'h23;
              4'h3: out_mant = 7'h23;
              4'ha: out_mant = 7'h25;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h25;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h25;
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h26;
              4'h2: out_mant = 7'h26;
              4'h3: out_mant = 7'h26;
              4'h4: out_mant = 7'h26;
              4'h5: out_mant = 7'h26;
              4'h6: out_mant = 7'h26;
              4'h7: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h29;
            case (mant_lo4)
              4'h0: out_mant = 7'h28;
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h28;
              4'h3: out_mant = 7'h28;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h28;
              4'h6: out_mant = 7'h28;
              4'hf: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h2b;
            case (mant_lo4)
              4'h0: out_mant = 7'h2a;
              4'h1: out_mant = 7'h2a;
              4'h2: out_mant = 7'h2a;
              4'h3: out_mant = 7'h2a;
              4'h4: out_mant = 7'h2a;
              4'h5: out_mant = 7'h2a;
              4'h6: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h8: out_mant = 7'h2d;
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h2d;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2d;
              4'hd: out_mant = 7'h2d;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h088: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h0: out_mant = 7'h2d;
              4'h6: out_mant = 7'h2f;
              4'h7: out_mant = 7'h2f;
              4'h8: out_mant = 7'h2f;
              4'h9: out_mant = 7'h2f;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h30;
              4'hc: out_mant = 7'h30;
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h30;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              4'h1: out_mant = 7'h31;
              4'h2: out_mant = 7'h31;
              4'h3: out_mant = 7'h31;
              4'h4: out_mant = 7'h31;
              4'h5: out_mant = 7'h32;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h32;
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h6: out_mant = 7'h35;
              4'h7: out_mant = 7'h35;
              4'h8: out_mant = 7'h35;
              4'h9: out_mant = 7'h35;
              4'ha: out_mant = 7'h35;
              4'hb: out_mant = 7'h35;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h36;
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h36;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h37;
            case (mant_lo4)
              4'h0: out_mant = 7'h36;
              4'h1: out_mant = 7'h36;
              4'h9: out_mant = 7'h38;
              4'ha: out_mant = 7'h38;
              4'hb: out_mant = 7'h38;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h38;
              4'hf: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h0: out_mant = 7'h39;
              4'h1: out_mant = 7'h39;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h39;
              4'h5: out_mant = 7'h39;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h0: out_mant = 7'h3b;
              4'h1: out_mant = 7'h3b;
              4'h2: out_mant = 7'h3b;
              4'h3: out_mant = 7'h3b;
              4'h4: out_mant = 7'h3b;
              4'hd: out_mant = 7'h3d;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h0: out_mant = 7'h3d;
              4'h1: out_mant = 7'h3d;
              4'h2: out_mant = 7'h3d;
              4'h3: out_mant = 7'h3d;
              4'h4: out_mant = 7'h3d;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h3f;
              4'h1: out_mant = 7'h3f;
              4'h2: out_mant = 7'h3f;
              4'h3: out_mant = 7'h3f;
              4'h4: out_mant = 7'h3f;
              4'h5: out_mant = 7'h3f;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h089: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h41;
              4'h3: out_mant = 7'h41;
              4'h9: out_mant = 7'h43;
              4'ha: out_mant = 7'h43;
              4'hb: out_mant = 7'h43;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h43;
              4'he: out_mant = 7'h44;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h0: out_mant = 7'h44;
              4'h1: out_mant = 7'h44;
              4'h2: out_mant = 7'h44;
              4'h9: out_mant = 7'h46;
              4'ha: out_mant = 7'h46;
              4'hb: out_mant = 7'h46;
              4'hc: out_mant = 7'h46;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h47;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h47;
              4'h1: out_mant = 7'h47;
              4'h2: out_mant = 7'h47;
              4'h3: out_mant = 7'h47;
              4'ha: out_mant = 7'h49;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h49;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h7: out_mant = 7'h4b;
              4'h8: out_mant = 7'h4b;
              4'h9: out_mant = 7'h4b;
              4'ha: out_mant = 7'h4b;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h0: out_mant = 7'h4c;
              4'h1: out_mant = 7'h4c;
              4'h2: out_mant = 7'h4c;
              4'h3: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h4e;
              4'h2: out_mant = 7'h4e;
              4'hb: out_mant = 7'h50;
              4'hc: out_mant = 7'h50;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h0: out_mant = 7'h50;
              4'h1: out_mant = 7'h50;
              4'h2: out_mant = 7'h50;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h52;
              4'hd: out_mant = 7'h52;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h0: out_mant = 7'h52;
              4'h1: out_mant = 7'h52;
              4'h2: out_mant = 7'h52;
              4'h3: out_mant = 7'h52;
              4'hd: out_mant = 7'h54;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h08a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h54;
              4'h8: out_mant = 7'h56;
              4'h9: out_mant = 7'h56;
              4'ha: out_mant = 7'h56;
              4'hb: out_mant = 7'h56;
              4'hc: out_mant = 7'h56;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h58;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h58;
              4'h5: out_mant = 7'h58;
              4'h6: out_mant = 7'h58;
              4'hd: out_mant = 7'h5a;
              4'he: out_mant = 7'h5a;
              4'hf: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h1: out_mant = 7'h5a;
              4'h2: out_mant = 7'h5a;
              4'h9: out_mant = 7'h5c;
              4'ha: out_mant = 7'h5c;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h5c;
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h5e;
            case (mant_lo4)
              4'h0: out_mant = 7'h5d;
              4'h1: out_mant = 7'h5d;
              4'h2: out_mant = 7'h5d;
              4'h3: out_mant = 7'h5d;
              4'h4: out_mant = 7'h5d;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h60;
            case (mant_lo4)
              4'h0: out_mant = 7'h5f;
              4'h1: out_mant = 7'h5f;
              4'h2: out_mant = 7'h5f;
              4'ha: out_mant = 7'h61;
              4'hb: out_mant = 7'h61;
              4'hc: out_mant = 7'h61;
              4'hd: out_mant = 7'h61;
              4'he: out_mant = 7'h61;
              4'hf: out_mant = 7'h61;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h0: out_mant = 7'h61;
              4'h9: out_mant = 7'h63;
              4'ha: out_mant = 7'h63;
              4'hb: out_mant = 7'h63;
              4'hc: out_mant = 7'h63;
              4'hd: out_mant = 7'h63;
              4'he: out_mant = 7'h63;
              4'hf: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              4'h9: out_mant = 7'h65;
              4'ha: out_mant = 7'h65;
              4'hb: out_mant = 7'h65;
              4'hc: out_mant = 7'h65;
              4'hd: out_mant = 7'h65;
              4'he: out_mant = 7'h65;
              4'hf: out_mant = 7'h65;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h66;
            case (mant_lo4)
              4'h0: out_mant = 7'h65;
              4'ha: out_mant = 7'h67;
              4'hb: out_mant = 7'h67;
              4'hc: out_mant = 7'h67;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h08b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h7: out_mant = 7'h69;
              4'h8: out_mant = 7'h69;
              4'h9: out_mant = 7'h69;
              4'ha: out_mant = 7'h69;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h6a;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h6a;
              4'h6: out_mant = 7'h6c;
              4'h7: out_mant = 7'h6c;
              4'h8: out_mant = 7'h6c;
              4'h9: out_mant = 7'h6c;
              4'ha: out_mant = 7'h6c;
              4'hb: out_mant = 7'h6d;
              4'hc: out_mant = 7'h6d;
              4'hd: out_mant = 7'h6d;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h0: out_mant = 7'h6d;
              4'h7: out_mant = 7'h6f;
              4'h8: out_mant = 7'h6f;
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h70;
              4'he: out_mant = 7'h70;
              4'hf: out_mant = 7'h70;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'h0: out_mant = 7'h70;
              4'h1: out_mant = 7'h70;
              4'h2: out_mant = 7'h70;
              4'ha: out_mant = 7'h72;
              4'hb: out_mant = 7'h72;
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'h8: out_mant = 7'h74;
              4'h9: out_mant = 7'h74;
              4'ha: out_mant = 7'h74;
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'h0: out_mant = 7'h75;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h75;
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h75;
              4'h5: out_mant = 7'h75;
              4'h6: out_mant = 7'h75;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'h0: out_mant = 7'h77;
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h77;
              4'h5: out_mant = 7'h77;
              4'h6: out_mant = 7'h77;
              4'hf: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h8: out_mant = 7'h7a;
              4'h9: out_mant = 7'h7a;
              4'ha: out_mant = 7'h7a;
              4'hb: out_mant = 7'h7a;
              4'hc: out_mant = 7'h7a;
              4'hd: out_mant = 7'h7a;
              4'he: out_mant = 7'h7a;
              4'hf: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h08c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              4'h1: out_mant = 7'h7b;
              4'h2: out_mant = 7'h7b;
              4'h3: out_mant = 7'h7b;
              4'h4: out_mant = 7'h7b;
              4'ha: out_mant = 7'h7d;
              4'hb: out_mant = 7'h7d;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h7d;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7e;
              4'h5: out_mant = 7'h7f;
              4'h6: out_mant = 7'h7f;
              4'h7: out_mant = 7'h7f;
              4'h8: out_mant = 7'h7f;
              4'h9: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h1: out_mant = 7'h00;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h9: out_mant = 7'h04;
              4'ha: out_mant = 7'h04;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h8: out_mant = 7'h05;
              4'h9: out_mant = 7'h05;
              4'ha: out_mant = 7'h05;
              4'hb: out_mant = 7'h05;
              4'hc: out_mant = 7'h05;
              4'hd: out_mant = 7'h05;
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h9: out_mant = 7'h06;
              4'ha: out_mant = 7'h06;
              4'hb: out_mant = 7'h06;
              4'hc: out_mant = 7'h06;
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'ha: out_mant = 7'h07;
              4'hb: out_mant = 7'h07;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h07;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h08d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h07;
              4'h3: out_mant = 7'h07;
              4'h4: out_mant = 7'h07;
              4'h5: out_mant = 7'h07;
              4'h6: out_mant = 7'h07;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'hb: out_mant = 7'h0a;
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              4'h2: out_mant = 7'h0a;
              4'h3: out_mant = 7'h0a;
              4'h4: out_mant = 7'h0a;
              4'h5: out_mant = 7'h0a;
              4'h6: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'h1: out_mant = 7'h0b;
              4'h2: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h10;
          end
          default: begin end
        endcase
      end
      9'h08e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              4'ha: out_mant = 7'h12;
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h0: out_mant = 7'h12;
              4'h1: out_mant = 7'h12;
              4'h2: out_mant = 7'h12;
              4'h3: out_mant = 7'h12;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h15;
              4'hd: out_mant = 7'h15;
              4'he: out_mant = 7'h15;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h8: out_mant = 7'h16;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h16;
              4'hc: out_mant = 7'h16;
              4'hd: out_mant = 7'h16;
              4'he: out_mant = 7'h16;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h16;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h17;
              4'h2: out_mant = 7'h17;
              4'h3: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h18;
              4'h1: out_mant = 7'h18;
              4'h2: out_mant = 7'h18;
              4'h3: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h0: out_mant = 7'h19;
              4'h1: out_mant = 7'h19;
              4'h2: out_mant = 7'h19;
              4'h3: out_mant = 7'h19;
              4'h4: out_mant = 7'h19;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h08f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h1a;
              4'h3: out_mant = 7'h1a;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'h8: out_mant = 7'h1d;
              4'h9: out_mant = 7'h1d;
              4'ha: out_mant = 7'h1d;
              4'hb: out_mant = 7'h1d;
              4'hc: out_mant = 7'h1d;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'h0: out_mant = 7'h1d;
              4'h1: out_mant = 7'h1d;
              4'h2: out_mant = 7'h1d;
              4'h3: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'hb: out_mant = 7'h21;
              4'hc: out_mant = 7'h21;
              4'hd: out_mant = 7'h21;
              4'he: out_mant = 7'h21;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h22;
            case (mant_lo4)
              4'ha: out_mant = 7'h23;
              4'hb: out_mant = 7'h23;
              4'hc: out_mant = 7'h23;
              4'hd: out_mant = 7'h23;
              4'he: out_mant = 7'h23;
              4'hf: out_mant = 7'h23;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'hc: out_mant = 7'h24;
              4'hd: out_mant = 7'h24;
              4'he: out_mant = 7'h24;
              4'hf: out_mant = 7'h24;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h090: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h25;
            case (mant_lo4)
              4'h0: out_mant = 7'h24;
              4'h1: out_mant = 7'h24;
              4'h2: out_mant = 7'h24;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h24;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h24;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h25;
              4'hc: out_mant = 7'h27;
              4'hd: out_mant = 7'h27;
              4'he: out_mant = 7'h27;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'h8: out_mant = 7'h28;
              4'h9: out_mant = 7'h28;
              4'ha: out_mant = 7'h28;
              4'hb: out_mant = 7'h28;
              4'hc: out_mant = 7'h28;
              4'hd: out_mant = 7'h28;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h29;
            case (mant_lo4)
              4'h0: out_mant = 7'h28;
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h28;
              4'h3: out_mant = 7'h28;
              4'h4: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h2b;
          end
          3'h6: begin
            out_mant = 7'h2c;
          end
          3'h7: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h0: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h091: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h0: out_mant = 7'h2d;
              4'hb: out_mant = 7'h2f;
              4'hc: out_mant = 7'h2f;
              4'hd: out_mant = 7'h2f;
              4'he: out_mant = 7'h2f;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h0: out_mant = 7'h2f;
              4'h1: out_mant = 7'h2f;
              4'h2: out_mant = 7'h2f;
              4'h3: out_mant = 7'h2f;
              4'h4: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h31;
            case (mant_lo4)
              4'h0: out_mant = 7'h30;
              4'hd: out_mant = 7'h32;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h9: out_mant = 7'h33;
              4'ha: out_mant = 7'h33;
              4'hb: out_mant = 7'h33;
              4'hc: out_mant = 7'h33;
              4'hd: out_mant = 7'h33;
              4'he: out_mant = 7'h33;
              4'hf: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h0: out_mant = 7'h33;
              4'h1: out_mant = 7'h33;
              4'h2: out_mant = 7'h33;
              4'h3: out_mant = 7'h33;
              4'h4: out_mant = 7'h33;
              4'h5: out_mant = 7'h33;
              4'h6: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'h0: out_mant = 7'h34;
              4'h1: out_mant = 7'h34;
              4'h2: out_mant = 7'h34;
              4'h3: out_mant = 7'h34;
              4'h4: out_mant = 7'h34;
              4'h5: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h0: out_mant = 7'h35;
              4'h1: out_mant = 7'h35;
              4'h2: out_mant = 7'h35;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h35;
              4'h5: out_mant = 7'h35;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h37;
            case (mant_lo4)
              4'h0: out_mant = 7'h36;
              4'h1: out_mant = 7'h36;
              4'h2: out_mant = 7'h36;
              4'h3: out_mant = 7'h36;
              4'h4: out_mant = 7'h36;
              4'h5: out_mant = 7'h36;
              4'h6: out_mant = 7'h36;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h092: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h0: out_mant = 7'h37;
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h37;
              4'h3: out_mant = 7'h37;
              4'h4: out_mant = 7'h37;
              4'hf: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h9: out_mant = 7'h3a;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h3a;
              4'hc: out_mant = 7'h3a;
              4'hd: out_mant = 7'h3a;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h3a;
              4'h3: out_mant = 7'h3a;
              4'h4: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h0: out_mant = 7'h3b;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3d;
            case (mant_lo4)
              4'hc: out_mant = 7'h3e;
              4'hd: out_mant = 7'h3e;
              4'he: out_mant = 7'h3e;
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'hc: out_mant = 7'h40;
              4'hd: out_mant = 7'h40;
              4'he: out_mant = 7'h40;
              4'hf: out_mant = 7'h40;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h093: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h41;
            case (mant_lo4)
              4'h8: out_mant = 7'h42;
              4'h9: out_mant = 7'h42;
              4'ha: out_mant = 7'h42;
              4'hb: out_mant = 7'h42;
              4'hc: out_mant = 7'h42;
              4'hd: out_mant = 7'h42;
              4'he: out_mant = 7'h42;
              4'hf: out_mant = 7'h42;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h0: out_mant = 7'h42;
              4'h1: out_mant = 7'h42;
              4'h2: out_mant = 7'h42;
              4'he: out_mant = 7'h44;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'h9: out_mant = 7'h45;
              4'ha: out_mant = 7'h45;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h45;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'h0: out_mant = 7'h45;
              4'h1: out_mant = 7'h45;
              4'h2: out_mant = 7'h45;
              4'h3: out_mant = 7'h45;
              4'h4: out_mant = 7'h45;
              4'h5: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'h0: out_mant = 7'h46;
              4'h1: out_mant = 7'h46;
              4'h2: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h47;
              4'h1: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h49;
            case (mant_lo4)
              4'h0: out_mant = 7'h48;
              4'h1: out_mant = 7'h48;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h094: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h0: out_mant = 7'h4a;
              4'h1: out_mant = 7'h4a;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h0: out_mant = 7'h4c;
              4'h1: out_mant = 7'h4c;
              4'h2: out_mant = 7'h4c;
              4'h3: out_mant = 7'h4c;
              4'h4: out_mant = 7'h4c;
              4'h5: out_mant = 7'h4c;
              4'h6: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'h0: out_mant = 7'h4d;
              4'h1: out_mant = 7'h4d;
              4'he: out_mant = 7'h4f;
              4'hf: out_mant = 7'h4f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'hb: out_mant = 7'h50;
              4'hc: out_mant = 7'h50;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'h9: out_mant = 7'h51;
              4'ha: out_mant = 7'h51;
              4'hb: out_mant = 7'h51;
              4'hc: out_mant = 7'h51;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h8: out_mant = 7'h52;
              4'h9: out_mant = 7'h52;
              4'ha: out_mant = 7'h52;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h52;
              4'hd: out_mant = 7'h52;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h8: out_mant = 7'h53;
              4'h9: out_mant = 7'h53;
              4'ha: out_mant = 7'h53;
              4'hb: out_mant = 7'h53;
              4'hc: out_mant = 7'h53;
              4'hd: out_mant = 7'h53;
              4'he: out_mant = 7'h53;
              4'hf: out_mant = 7'h53;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h9: out_mant = 7'h54;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h54;
              4'hc: out_mant = 7'h54;
              4'hd: out_mant = 7'h54;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h095: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h54;
              4'h3: out_mant = 7'h54;
              4'h4: out_mant = 7'h54;
              4'h5: out_mant = 7'h54;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'hb: out_mant = 7'h57;
              4'hc: out_mant = 7'h57;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h57;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h57;
              4'h5: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h1: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'he: out_mant = 7'h5b;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'he: out_mant = 7'h5d;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'hf: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h096: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5e;
            case (mant_lo4)
              4'h9: out_mant = 7'h5f;
              4'ha: out_mant = 7'h5f;
              4'hb: out_mant = 7'h5f;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h60;
            case (mant_lo4)
              4'h0: out_mant = 7'h5f;
              4'h1: out_mant = 7'h5f;
              4'h2: out_mant = 7'h5f;
              4'h3: out_mant = 7'h5f;
              4'hf: out_mant = 7'h61;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'ha: out_mant = 7'h62;
              4'hb: out_mant = 7'h62;
              4'hc: out_mant = 7'h62;
              4'hd: out_mant = 7'h62;
              4'he: out_mant = 7'h62;
              4'hf: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h62;
              4'h3: out_mant = 7'h62;
              4'h4: out_mant = 7'h62;
              4'h5: out_mant = 7'h62;
              4'h6: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              4'h1: out_mant = 7'h63;
              4'h2: out_mant = 7'h63;
              4'h3: out_mant = 7'h63;
              4'h4: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h64;
              4'h1: out_mant = 7'h64;
              4'h2: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h66;
            case (mant_lo4)
              4'h0: out_mant = 7'h65;
              4'h1: out_mant = 7'h65;
              4'h2: out_mant = 7'h65;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h66;
              4'h3: out_mant = 7'h66;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h097: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h67;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h8: out_mant = 7'h6a;
              4'h9: out_mant = 7'h6a;
              4'ha: out_mant = 7'h6a;
              4'hb: out_mant = 7'h6a;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h6a;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h6a;
              4'h1: out_mant = 7'h6a;
              4'h2: out_mant = 7'h6a;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'hc: out_mant = 7'h6d;
              4'hd: out_mant = 7'h6d;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'ha: out_mant = 7'h6e;
              4'hb: out_mant = 7'h6e;
              4'hc: out_mant = 7'h6e;
              4'hd: out_mant = 7'h6e;
              4'he: out_mant = 7'h6e;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h9: out_mant = 7'h70;
              4'ha: out_mant = 7'h70;
              4'hb: out_mant = 7'h70;
              4'hc: out_mant = 7'h70;
              4'hd: out_mant = 7'h70;
              4'he: out_mant = 7'h70;
              4'hf: out_mant = 7'h70;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'hb: out_mant = 7'h71;
              4'hc: out_mant = 7'h71;
              4'hd: out_mant = 7'h71;
              4'he: out_mant = 7'h71;
              4'hf: out_mant = 7'h71;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h098: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'h0: out_mant = 7'h71;
              4'h1: out_mant = 7'h71;
              4'h2: out_mant = 7'h71;
              4'h3: out_mant = 7'h71;
              4'h4: out_mant = 7'h71;
              4'h5: out_mant = 7'h71;
              4'h6: out_mant = 7'h71;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h74;
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h74;
              4'h3: out_mant = 7'h74;
              4'h4: out_mant = 7'h74;
              4'h5: out_mant = 7'h74;
              4'h6: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'h0: out_mant = 7'h75;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h75;
              4'h3: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              4'hf: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'hf: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'hf: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7a;
          end
          default: begin end
        endcase
      end
      9'h099: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              4'ha: out_mant = 7'h7c;
              4'hb: out_mant = 7'h7c;
              4'hc: out_mant = 7'h7c;
              4'hd: out_mant = 7'h7c;
              4'he: out_mant = 7'h7c;
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7c;
              4'h1: out_mant = 7'h7c;
              4'h2: out_mant = 7'h7c;
              4'h3: out_mant = 7'h7c;
              4'h4: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'hc: out_mant = 7'h7f;
              4'hd: out_mant = 7'h7f;
              4'he: out_mant = 7'h7f;
              4'hf: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h8: out_mant = 7'h00;
              4'h9: out_mant = 7'h00;
              4'ha: out_mant = 7'h00;
              4'hb: out_mant = 7'h00;
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h00;
              4'he: out_mant = 7'h00;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h01;
          end
          3'h6: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'hd: out_mant = 7'h02;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h09a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h9: out_mant = 7'h03;
              4'ha: out_mant = 7'h03;
              4'hb: out_mant = 7'h03;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h04;
          end
          3'h3: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              4'h1: out_mant = 7'h04;
              4'h2: out_mant = 7'h04;
              4'h3: out_mant = 7'h04;
              4'h4: out_mant = 7'h04;
              4'h5: out_mant = 7'h04;
              4'h6: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h05;
          end
          3'h5: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h0: out_mant = 7'h05;
              4'h1: out_mant = 7'h05;
              4'h2: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h06;
          end
          3'h7: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h06;
              4'h1: out_mant = 7'h06;
              4'h2: out_mant = 7'h06;
              4'h3: out_mant = 7'h06;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h09b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h08;
              4'hf: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h08;
          end
          3'h2: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0a;
          end
          3'h5: begin
            out_mant = 7'h0a;
            case (mant_lo4)
              4'h9: out_mant = 7'h0b;
              4'ha: out_mant = 7'h0b;
              4'hb: out_mant = 7'h0b;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h0b;
              4'he: out_mant = 7'h0b;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h0b;
          end
          3'h7: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'ha: out_mant = 7'h0c;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h0c;
              4'he: out_mant = 7'h0c;
              4'hf: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h09c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0c;
          end
          3'h1: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h0d;
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h0d;
              4'h3: out_mant = 7'h0d;
              4'h4: out_mant = 7'h0d;
              4'h5: out_mant = 7'h0d;
              4'h6: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0e;
          end
          3'h4: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'he: out_mant = 7'h10;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h10;
          end
          3'h7: begin
            out_mant = 7'h10;
          end
          default: begin end
        endcase
      end
      9'h09d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'h0: out_mant = 7'h11;
              4'h1: out_mant = 7'h11;
              4'h2: out_mant = 7'h11;
              4'h3: out_mant = 7'h11;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'hb: out_mant = 7'h13;
              4'hc: out_mant = 7'h13;
              4'hd: out_mant = 7'h13;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h13;
          end
          3'h4: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h0: out_mant = 7'h13;
              4'h1: out_mant = 7'h13;
              4'h2: out_mant = 7'h13;
              4'h3: out_mant = 7'h13;
              4'h4: out_mant = 7'h13;
              4'h5: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h14;
          end
          3'h6: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h14;
              4'h2: out_mant = 7'h14;
              4'h3: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h15;
          end
          default: begin end
        endcase
      end
      9'h09e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h0: out_mant = 7'h15;
              4'h1: out_mant = 7'h15;
              4'h2: out_mant = 7'h15;
              4'h3: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h8: out_mant = 7'h17;
              4'h9: out_mant = 7'h17;
              4'ha: out_mant = 7'h17;
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h17;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h17;
          end
          3'h3: begin
            out_mant = 7'h18;
          end
          3'h4: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h19;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h19;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h19;
          end
          3'h6: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'ha: out_mant = 7'h1a;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h1a;
              4'hd: out_mant = 7'h1a;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1a;
          end
          default: begin end
        endcase
      end
      9'h09f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h8: out_mant = 7'h1b;
              4'h9: out_mant = 7'h1b;
              4'ha: out_mant = 7'h1b;
              4'hb: out_mant = 7'h1b;
              4'hc: out_mant = 7'h1b;
              4'hd: out_mant = 7'h1b;
              4'he: out_mant = 7'h1b;
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'hc: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1c;
          end
          3'h3: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h0: out_mant = 7'h1c;
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h1c;
              4'h3: out_mant = 7'h1c;
              4'h4: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1d;
          end
          3'h5: begin
            out_mant = 7'h1e;
          end
          3'h6: begin
            out_mant = 7'h1e;
          end
          3'h7: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h0: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0a0: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'hb: out_mant = 7'h20;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h20;
          end
          3'h2: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h20;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h9: out_mant = 7'h22;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h22;
          end
          3'h5: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h22;
              4'h5: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h23;
          end
          3'h7: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h0: out_mant = 7'h23;
              4'h1: out_mant = 7'h23;
              4'h2: out_mant = 7'h23;
              4'h3: out_mant = 7'h23;
              4'h4: out_mant = 7'h23;
              4'h5: out_mant = 7'h23;
              4'h6: out_mant = 7'h23;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0a1: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h25;
          end
          3'h2: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h25;
              4'h3: out_mant = 7'h25;
              4'h4: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'he: out_mant = 7'h27;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h27;
          end
          3'h5: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'hc: out_mant = 7'h28;
              4'hd: out_mant = 7'h28;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h28;
          end
          3'h7: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'he: out_mant = 7'h29;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0a2: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h29;
          end
          3'h1: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h9: out_mant = 7'h2b;
              4'ha: out_mant = 7'h2b;
              4'hb: out_mant = 7'h2b;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2b;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2b;
          end
          3'h4: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h0: out_mant = 7'h2b;
              4'h1: out_mant = 7'h2b;
              4'h2: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h2c;
          end
          3'h6: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h0: out_mant = 7'h2c;
              4'h1: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2d;
          end
          default: begin end
        endcase
      end
      9'h0a3: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h0: out_mant = 7'h2d;
              4'h1: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'h0: out_mant = 7'h2e;
              4'h1: out_mant = 7'h2e;
              4'h2: out_mant = 7'h2e;
              4'h3: out_mant = 7'h2e;
              4'h4: out_mant = 7'h2e;
              4'h5: out_mant = 7'h2e;
              4'h6: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h30;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h30;
          end
          3'h4: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h9: out_mant = 7'h31;
              4'ha: out_mant = 7'h31;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h31;
              4'hd: out_mant = 7'h31;
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h31;
          end
          3'h6: begin
            out_mant = 7'h31;
            case (mant_lo4)
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h32;
              4'ha: out_mant = 7'h32;
              4'hb: out_mant = 7'h32;
              4'hc: out_mant = 7'h32;
              4'hd: out_mant = 7'h32;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h32;
          end
          default: begin end
        endcase
      end
      9'h0a4: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'h0: out_mant = 7'h32;
              4'h1: out_mant = 7'h32;
              4'h2: out_mant = 7'h32;
              4'h3: out_mant = 7'h32;
              4'h4: out_mant = 7'h32;
              4'h5: out_mant = 7'h32;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h34;
          end
          3'h3: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'h0: out_mant = 7'h34;
              4'h1: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h36;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h36;
          end
          3'h6: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'he: out_mant = 7'h37;
              4'hf: out_mant = 7'h37;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h37;
          end
          default: begin end
        endcase
      end
      9'h0a5: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h37;
            case (mant_lo4)
              4'ha: out_mant = 7'h38;
              4'hb: out_mant = 7'h38;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h38;
              4'hf: out_mant = 7'h38;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'hf: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h39;
          end
          3'h3: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h0: out_mant = 7'h39;
              4'h1: out_mant = 7'h39;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h39;
              4'h5: out_mant = 7'h39;
              4'h6: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3a;
          end
          3'h5: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h3a;
              4'h3: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h3b;
          end
          3'h7: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h0: out_mant = 7'h3b;
              4'h1: out_mant = 7'h3b;
              4'h2: out_mant = 7'h3b;
              4'h3: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0a6: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'hd: out_mant = 7'h3d;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3d;
          end
          3'h2: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h0: out_mant = 7'h3d;
              4'h1: out_mant = 7'h3d;
              4'h2: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3f;
          end
          3'h5: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'h9: out_mant = 7'h40;
              4'ha: out_mant = 7'h40;
              4'hb: out_mant = 7'h40;
              4'hc: out_mant = 7'h40;
              4'hd: out_mant = 7'h40;
              4'he: out_mant = 7'h40;
              4'hf: out_mant = 7'h40;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h40;
          end
          3'h7: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'hb: out_mant = 7'h41;
              4'hc: out_mant = 7'h41;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0a7: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h41;
          end
          3'h1: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h0: out_mant = 7'h42;
              4'h1: out_mant = 7'h42;
              4'h2: out_mant = 7'h42;
              4'h3: out_mant = 7'h42;
              4'h4: out_mant = 7'h42;
              4'h5: out_mant = 7'h42;
              4'h6: out_mant = 7'h42;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h43;
          end
          3'h4: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'h0: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'hf: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h45;
          end
          3'h7: begin
            out_mant = 7'h45;
          end
          default: begin end
        endcase
      end
      9'h0a8: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'h0: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'h0: out_mant = 7'h46;
              4'h1: out_mant = 7'h46;
              4'h2: out_mant = 7'h46;
              4'h3: out_mant = 7'h46;
              4'h4: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'hc: out_mant = 7'h48;
              4'hd: out_mant = 7'h48;
              4'he: out_mant = 7'h48;
              4'hf: out_mant = 7'h48;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h48;
          end
          3'h4: begin
            out_mant = 7'h49;
            case (mant_lo4)
              4'h0: out_mant = 7'h48;
              4'h1: out_mant = 7'h48;
              4'h2: out_mant = 7'h48;
              4'h3: out_mant = 7'h48;
              4'h4: out_mant = 7'h48;
              4'h5: out_mant = 7'h48;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h49;
          end
          3'h6: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              4'h2: out_mant = 7'h49;
              4'h3: out_mant = 7'h49;
              4'h4: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4a;
          end
          default: begin end
        endcase
      end
      9'h0a9: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h0: out_mant = 7'h4a;
              4'h1: out_mant = 7'h4a;
              4'h2: out_mant = 7'h4a;
              4'h3: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h9: out_mant = 7'h4c;
              4'ha: out_mant = 7'h4c;
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h4c;
          end
          3'h3: begin
            out_mant = 7'h4d;
          end
          3'h4: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4e;
          end
          3'h6: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'hb: out_mant = 7'h4f;
              4'hc: out_mant = 7'h4f;
              4'hd: out_mant = 7'h4f;
              4'he: out_mant = 7'h4f;
              4'hf: out_mant = 7'h4f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4f;
          end
          default: begin end
        endcase
      end
      9'h0aa: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h8: out_mant = 7'h50;
              4'h9: out_mant = 7'h50;
              4'ha: out_mant = 7'h50;
              4'hb: out_mant = 7'h50;
              4'hc: out_mant = 7'h50;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h51;
          end
          3'h3: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h1: out_mant = 7'h51;
              4'h2: out_mant = 7'h51;
              4'h3: out_mant = 7'h51;
              4'h4: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h52;
          end
          3'h5: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h0: out_mant = 7'h52;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h53;
          end
          3'h7: begin
            out_mant = 7'h54;
            case (mant_lo4)
              4'h0: out_mant = 7'h53;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0ab: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h54;
            case (mant_lo4)
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h55;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h55;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h55;
          end
          3'h2: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'h0: out_mant = 7'h55;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'ha: out_mant = 7'h57;
              4'hb: out_mant = 7'h57;
              4'hc: out_mant = 7'h57;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h57;
          end
          3'h5: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h57;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h57;
              4'h5: out_mant = 7'h57;
              4'h6: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h58;
          end
          3'h7: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h8: out_mant = 7'h59;
              4'h9: out_mant = 7'h59;
              4'ha: out_mant = 7'h59;
              4'hb: out_mant = 7'h59;
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h59;
              4'he: out_mant = 7'h59;
              4'hf: out_mant = 7'h59;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0ac: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'hf: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5a;
          end
          3'h2: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h1: out_mant = 7'h5a;
              4'h2: out_mant = 7'h5a;
              4'h3: out_mant = 7'h5a;
              4'h4: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h5c;
          end
          3'h5: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'hc: out_mant = 7'h5d;
              4'hd: out_mant = 7'h5d;
              4'he: out_mant = 7'h5d;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5d;
          end
          3'h7: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'he: out_mant = 7'h5e;
              4'hf: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0ad: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5e;
          end
          3'h1: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h0: out_mant = 7'h5e;
              4'h1: out_mant = 7'h5e;
              4'h2: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'ha: out_mant = 7'h60;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h60;
              4'hd: out_mant = 7'h60;
              4'he: out_mant = 7'h60;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h60;
          end
          3'h4: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h60;
              4'h3: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h61;
          end
          3'h6: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h0: out_mant = 7'h61;
              4'h1: out_mant = 7'h61;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h62;
          end
          default: begin end
        endcase
      end
      9'h0ae: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              4'h1: out_mant = 7'h63;
              4'h2: out_mant = 7'h63;
              4'h3: out_mant = 7'h63;
              4'h4: out_mant = 7'h63;
              4'h5: out_mant = 7'h63;
              4'h6: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'he: out_mant = 7'h65;
              4'hf: out_mant = 7'h65;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h65;
          end
          3'h4: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h9: out_mant = 7'h66;
              4'ha: out_mant = 7'h66;
              4'hb: out_mant = 7'h66;
              4'hc: out_mant = 7'h66;
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h66;
          end
          3'h6: begin
            out_mant = 7'h66;
            case (mant_lo4)
              4'h8: out_mant = 7'h67;
              4'h9: out_mant = 7'h67;
              4'ha: out_mant = 7'h67;
              4'hb: out_mant = 7'h67;
              4'hc: out_mant = 7'h67;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h67;
          end
          default: begin end
        endcase
      end
      9'h0af: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h67;
              4'h3: out_mant = 7'h67;
              4'h4: out_mant = 7'h67;
              4'h5: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h69;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h69;
          end
          3'h3: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h0: out_mant = 7'h69;
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6b;
          end
          3'h6: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'he: out_mant = 7'h6c;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h6c;
          end
          default: begin end
        endcase
      end
      9'h0b0: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h6d;
              4'hc: out_mant = 7'h6d;
              4'hd: out_mant = 7'h6d;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6e;
          end
          3'h3: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h8: out_mant = 7'h6f;
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h6f;
          end
          3'h5: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'h0: out_mant = 7'h6f;
              4'h1: out_mant = 7'h6f;
              4'h2: out_mant = 7'h6f;
              4'h3: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h70;
          end
          3'h7: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'h0: out_mant = 7'h70;
              4'h1: out_mant = 7'h70;
              4'h2: out_mant = 7'h70;
              4'h3: out_mant = 7'h70;
              4'h4: out_mant = 7'h70;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0b1: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h72;
          end
          3'h2: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'h1: out_mant = 7'h72;
              4'h2: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h74;
          end
          3'h5: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'ha: out_mant = 7'h75;
              4'hb: out_mant = 7'h75;
              4'hc: out_mant = 7'h75;
              4'hd: out_mant = 7'h75;
              4'he: out_mant = 7'h75;
              4'hf: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h75;
          end
          3'h7: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'hb: out_mant = 7'h76;
              4'hc: out_mant = 7'h76;
              4'hd: out_mant = 7'h76;
              4'he: out_mant = 7'h76;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0b2: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h76;
          end
          3'h1: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h8: out_mant = 7'h78;
              4'h9: out_mant = 7'h78;
              4'ha: out_mant = 7'h78;
              4'hb: out_mant = 7'h78;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h78;
          end
          3'h4: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h0: out_mant = 7'h78;
              4'h1: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h79;
          end
          3'h6: begin
            out_mant = 7'h7a;
          end
          3'h7: begin
            out_mant = 7'h7a;
          end
          default: begin end
        endcase
      end
      9'h0b3: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h0: out_mant = 7'h7b;
              4'h1: out_mant = 7'h7b;
              4'h2: out_mant = 7'h7b;
              4'h3: out_mant = 7'h7b;
              4'h4: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h7d;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7d;
          end
          3'h4: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'h0: out_mant = 7'h7d;
              4'h1: out_mant = 7'h7d;
              4'h2: out_mant = 7'h7d;
              4'h3: out_mant = 7'h7d;
              4'h4: out_mant = 7'h7d;
              4'h5: out_mant = 7'h7d;
              4'h6: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7e;
          end
          3'h6: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7e;
              4'h5: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7f;
          end
          default: begin end
        endcase
      end
      9'h0b4: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h7f;
              4'h1: out_mant = 7'h7f;
              4'h2: out_mant = 7'h7f;
              4'h3: out_mant = 7'h7f;
              4'h4: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h00;
          end
          3'h2: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h1: out_mant = 7'h00;
              4'h2: out_mant = 7'h00;
              4'h3: out_mant = 7'h00;
              4'h4: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h01;
          end
          3'h4: begin
            out_mant = 7'h01;
          end
          3'h5: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'hb: out_mant = 7'h02;
              4'hc: out_mant = 7'h02;
              4'hd: out_mant = 7'h02;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h02;
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h0b5: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
          end
          3'h1: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h0: out_mant = 7'h02;
              4'h1: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h03;
          end
          3'h3: begin
            out_mant = 7'h03;
          end
          3'h4: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h04;
          end
          3'h6: begin
            out_mant = 7'h04;
          end
          3'h7: begin
            out_mant = 7'h04;
          end
          default: begin end
        endcase
      end
      9'h0b6: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              4'h1: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h05;
          end
          3'h2: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h06;
          end
          3'h4: begin
            out_mant = 7'h06;
          end
          3'h5: begin
            out_mant = 7'h06;
          end
          3'h6: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h06;
              4'h1: out_mant = 7'h06;
              4'h2: out_mant = 7'h06;
              4'h3: out_mant = 7'h06;
              4'h4: out_mant = 7'h06;
              4'h5: out_mant = 7'h06;
              4'h6: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h07;
          end
          default: begin end
        endcase
      end
      9'h0b7: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h07;
          end
          3'h1: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h08;
              4'hc: out_mant = 7'h08;
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h08;
              4'hf: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h08;
          end
          3'h3: begin
            out_mant = 7'h08;
          end
          3'h4: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'he: out_mant = 7'h09;
              4'hf: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h09;
          end
          3'h6: begin
            out_mant = 7'h09;
          end
          3'h7: begin
            out_mant = 7'h09;
          end
          default: begin end
        endcase
      end
      9'h0b8: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h9: out_mant = 7'h0a;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h0a;
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h0a;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0a;
          end
          3'h2: begin
            out_mant = 7'h0a;
          end
          3'h3: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              4'h2: out_mant = 7'h0a;
              4'h3: out_mant = 7'h0a;
              4'h4: out_mant = 7'h0a;
              4'h5: out_mant = 7'h0a;
              4'h6: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0b;
          end
          3'h5: begin
            out_mant = 7'h0b;
          end
          3'h6: begin
            out_mant = 7'h0b;
          end
          3'h7: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'h1: out_mant = 7'h0b;
              4'h2: out_mant = 7'h0b;
              4'h3: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0b9: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0c;
          end
          3'h1: begin
            out_mant = 7'h0c;
          end
          3'h2: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'h1: out_mant = 7'h0c;
              4'h2: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0d;
          end
          3'h4: begin
            out_mant = 7'h0d;
          end
          3'h5: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'h9: out_mant = 7'h0e;
              4'ha: out_mant = 7'h0e;
              4'hb: out_mant = 7'h0e;
              4'hc: out_mant = 7'h0e;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h0e;
          end
          3'h7: begin
            out_mant = 7'h0e;
          end
          default: begin end
        endcase
      end
      9'h0ba: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0e;
          end
          3'h1: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0f;
          end
          3'h3: begin
            out_mant = 7'h0f;
          end
          3'h4: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'h0: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h10;
          end
          3'h6: begin
            out_mant = 7'h10;
          end
          3'h7: begin
            out_mant = 7'h10;
          end
          default: begin end
        endcase
      end
      9'h0bb: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h11;
          end
          3'h2: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h12;
          end
          3'h4: begin
            out_mant = 7'h12;
          end
          3'h5: begin
            out_mant = 7'h12;
          end
          3'h6: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h0: out_mant = 7'h12;
              4'h1: out_mant = 7'h12;
              4'h2: out_mant = 7'h12;
              4'h3: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h13;
          end
          default: begin end
        endcase
      end
      9'h0bc: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h13;
          end
          3'h1: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h9: out_mant = 7'h14;
              4'ha: out_mant = 7'h14;
              4'hb: out_mant = 7'h14;
              4'hc: out_mant = 7'h14;
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h14;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h14;
          end
          3'h3: begin
            out_mant = 7'h14;
          end
          3'h4: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h15;
              4'hd: out_mant = 7'h15;
              4'he: out_mant = 7'h15;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h15;
          end
          3'h6: begin
            out_mant = 7'h15;
          end
          3'h7: begin
            out_mant = 7'h15;
          end
          default: begin end
        endcase
      end
      9'h0bd: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h8: out_mant = 7'h16;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h16;
              4'hc: out_mant = 7'h16;
              4'hd: out_mant = 7'h16;
              4'he: out_mant = 7'h16;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h16;
          end
          3'h2: begin
            out_mant = 7'h16;
          end
          3'h3: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h16;
              4'h4: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h17;
          end
          3'h5: begin
            out_mant = 7'h17;
          end
          3'h6: begin
            out_mant = 7'h17;
          end
          3'h7: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0be: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h18;
          end
          3'h1: begin
            out_mant = 7'h18;
          end
          3'h2: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h19;
          end
          3'h4: begin
            out_mant = 7'h19;
          end
          3'h5: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h0: out_mant = 7'h19;
              4'h1: out_mant = 7'h19;
              4'h2: out_mant = 7'h19;
              4'h3: out_mant = 7'h19;
              4'h4: out_mant = 7'h19;
              4'h5: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h1a;
          end
          3'h7: begin
            out_mant = 7'h1a;
          end
          default: begin end
        endcase
      end
      9'h0bf: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h1b;
          end
          3'h2: begin
            out_mant = 7'h1b;
          end
          3'h3: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'hf: out_mant = 7'h1c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1c;
          end
          3'h5: begin
            out_mant = 7'h1c;
          end
          3'h6: begin
            out_mant = 7'h1c;
          end
          3'h7: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0c0: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1d;
          end
          3'h1: begin
            out_mant = 7'h1d;
          end
          3'h2: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h9: out_mant = 7'h1e;
              4'ha: out_mant = 7'h1e;
              4'hb: out_mant = 7'h1e;
              4'hc: out_mant = 7'h1e;
              4'hd: out_mant = 7'h1e;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h1e;
          end
          3'h4: begin
            out_mant = 7'h1e;
          end
          3'h5: begin
            out_mant = 7'h1e;
          end
          3'h6: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h0: out_mant = 7'h1e;
              4'h1: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1f;
          end
          default: begin end
        endcase
      end
      9'h0c1: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1f;
          end
          3'h1: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'h0: out_mant = 7'h1f;
              4'h1: out_mant = 7'h1f;
              4'h2: out_mant = 7'h1f;
              4'h3: out_mant = 7'h1f;
              4'h4: out_mant = 7'h1f;
              4'h5: out_mant = 7'h1f;
              4'h6: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h20;
          end
          3'h3: begin
            out_mant = 7'h20;
          end
          3'h4: begin
            out_mant = 7'h20;
            case (mant_lo4)
              4'h9: out_mant = 7'h21;
              4'ha: out_mant = 7'h21;
              4'hb: out_mant = 7'h21;
              4'hc: out_mant = 7'h21;
              4'hd: out_mant = 7'h21;
              4'he: out_mant = 7'h21;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h21;
          end
          3'h6: begin
            out_mant = 7'h21;
          end
          3'h7: begin
            out_mant = 7'h21;
          end
          default: begin end
        endcase
      end
      9'h0c2: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h22;
            case (mant_lo4)
              4'h0: out_mant = 7'h21;
              4'h1: out_mant = 7'h21;
              4'h2: out_mant = 7'h21;
              4'h3: out_mant = 7'h21;
              4'h4: out_mant = 7'h21;
              4'h5: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h22;
          end
          3'h2: begin
            out_mant = 7'h22;
          end
          3'h3: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              4'h2: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h23;
          end
          3'h5: begin
            out_mant = 7'h23;
          end
          3'h6: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'he: out_mant = 7'h24;
              4'hf: out_mant = 7'h24;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h24;
          end
          default: begin end
        endcase
      end
      9'h0c3: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h24;
          end
          3'h1: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h25;
          end
          3'h3: begin
            out_mant = 7'h25;
          end
          3'h4: begin
            out_mant = 7'h25;
          end
          3'h5: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h25;
              4'h3: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h26;
          end
          3'h7: begin
            out_mant = 7'h26;
          end
          default: begin end
        endcase
      end
      9'h0c4: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'hd: out_mant = 7'h27;
              4'he: out_mant = 7'h27;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h27;
          end
          3'h2: begin
            out_mant = 7'h27;
          end
          3'h3: begin
            out_mant = 7'h27;
            case (mant_lo4)
              4'hc: out_mant = 7'h28;
              4'hd: out_mant = 7'h28;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h28;
          end
          3'h5: begin
            out_mant = 7'h28;
          end
          3'h6: begin
            out_mant = 7'h28;
          end
          3'h7: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'hb: out_mant = 7'h29;
              4'hc: out_mant = 7'h29;
              4'hd: out_mant = 7'h29;
              4'he: out_mant = 7'h29;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0c5: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h29;
          end
          3'h1: begin
            out_mant = 7'h29;
          end
          3'h2: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h29;
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h29;
              4'h3: out_mant = 7'h29;
              4'h4: out_mant = 7'h29;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2a;
          end
          3'h4: begin
            out_mant = 7'h2a;
          end
          3'h5: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'hf: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h2b;
          end
          3'h7: begin
            out_mant = 7'h2b;
          end
          default: begin end
        endcase
      end
      9'h0c6: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2b;
          end
          3'h1: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h0: out_mant = 7'h2b;
              4'h1: out_mant = 7'h2b;
              4'h2: out_mant = 7'h2b;
              4'h3: out_mant = 7'h2b;
              4'h4: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2c;
          end
          3'h3: begin
            out_mant = 7'h2c;
          end
          3'h4: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h0: out_mant = 7'h2c;
              4'h1: out_mant = 7'h2c;
              4'h2: out_mant = 7'h2c;
              4'h3: out_mant = 7'h2c;
              4'h4: out_mant = 7'h2c;
              4'h5: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h2d;
          end
          3'h6: begin
            out_mant = 7'h2d;
          end
          3'h7: begin
            out_mant = 7'h2d;
          end
          default: begin end
        endcase
      end
      9'h0c7: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h0: out_mant = 7'h2d;
              4'h1: out_mant = 7'h2d;
              4'h2: out_mant = 7'h2d;
              4'h3: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h2e;
          end
          3'h2: begin
            out_mant = 7'h2e;
          end
          3'h3: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'h0: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h2f;
          end
          3'h5: begin
            out_mant = 7'h2f;
          end
          3'h6: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'hb: out_mant = 7'h30;
              4'hc: out_mant = 7'h30;
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h30;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h30;
          end
          default: begin end
        endcase
      end
      9'h0c8: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h30;
          end
          3'h1: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'hd: out_mant = 7'h31;
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h31;
          end
          3'h3: begin
            out_mant = 7'h31;
          end
          3'h4: begin
            out_mant = 7'h31;
          end
          3'h5: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h32;
          end
          3'h7: begin
            out_mant = 7'h32;
          end
          default: begin end
        endcase
      end
      9'h0c9: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'hc: out_mant = 7'h33;
              4'hd: out_mant = 7'h33;
              4'he: out_mant = 7'h33;
              4'hf: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h33;
          end
          3'h2: begin
            out_mant = 7'h33;
          end
          3'h3: begin
            out_mant = 7'h33;
            case (mant_lo4)
              4'ha: out_mant = 7'h34;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h34;
          end
          3'h5: begin
            out_mant = 7'h34;
          end
          3'h6: begin
            out_mant = 7'h34;
          end
          3'h7: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h8: out_mant = 7'h35;
              4'h9: out_mant = 7'h35;
              4'ha: out_mant = 7'h35;
              4'hb: out_mant = 7'h35;
              4'hc: out_mant = 7'h35;
              4'hd: out_mant = 7'h35;
              4'he: out_mant = 7'h35;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0ca: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h35;
          end
          3'h1: begin
            out_mant = 7'h35;
          end
          3'h2: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h0: out_mant = 7'h35;
              4'h1: out_mant = 7'h35;
              4'h2: out_mant = 7'h35;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h35;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h36;
          end
          3'h4: begin
            out_mant = 7'h36;
          end
          3'h5: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'hd: out_mant = 7'h37;
              4'he: out_mant = 7'h37;
              4'hf: out_mant = 7'h37;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h37;
          end
          3'h7: begin
            out_mant = 7'h37;
          end
          default: begin end
        endcase
      end
      9'h0cb: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h37;
          end
          3'h1: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h0: out_mant = 7'h37;
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h37;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h38;
          end
          3'h3: begin
            out_mant = 7'h38;
          end
          3'h4: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h0: out_mant = 7'h38;
              4'h1: out_mant = 7'h38;
              4'h2: out_mant = 7'h38;
              4'h3: out_mant = 7'h38;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h39;
          end
          3'h6: begin
            out_mant = 7'h39;
          end
          3'h7: begin
            out_mant = 7'h39;
          end
          default: begin end
        endcase
      end
      9'h0cc: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h0: out_mant = 7'h39;
              4'h1: out_mant = 7'h39;
              4'h2: out_mant = 7'h39;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3a;
          end
          3'h2: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h3b;
          end
          3'h4: begin
            out_mant = 7'h3b;
          end
          3'h5: begin
            out_mant = 7'h3b;
          end
          3'h6: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h8: out_mant = 7'h3c;
              4'h9: out_mant = 7'h3c;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3c;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h3c;
          end
          default: begin end
        endcase
      end
      9'h0cd: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3c;
          end
          3'h1: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'hb: out_mant = 7'h3d;
              4'hc: out_mant = 7'h3d;
              4'hd: out_mant = 7'h3d;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3d;
          end
          3'h3: begin
            out_mant = 7'h3d;
          end
          3'h4: begin
            out_mant = 7'h3d;
            case (mant_lo4)
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h3e;
          end
          3'h6: begin
            out_mant = 7'h3e;
          end
          3'h7: begin
            out_mant = 7'h3e;
          end
          default: begin end
        endcase
      end
      9'h0ce: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'ha: out_mant = 7'h3f;
              4'hb: out_mant = 7'h3f;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h3f;
          end
          3'h2: begin
            out_mant = 7'h3f;
          end
          3'h3: begin
            out_mant = 7'h3f;
            case (mant_lo4)
              4'h8: out_mant = 7'h40;
              4'h9: out_mant = 7'h40;
              4'ha: out_mant = 7'h40;
              4'hb: out_mant = 7'h40;
              4'hc: out_mant = 7'h40;
              4'hd: out_mant = 7'h40;
              4'he: out_mant = 7'h40;
              4'hf: out_mant = 7'h40;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h40;
          end
          3'h5: begin
            out_mant = 7'h40;
          end
          3'h6: begin
            out_mant = 7'h40;
          end
          3'h7: begin
            out_mant = 7'h41;
            case (mant_lo4)
              4'h0: out_mant = 7'h40;
              4'h1: out_mant = 7'h40;
              4'h2: out_mant = 7'h40;
              4'h3: out_mant = 7'h40;
              4'h4: out_mant = 7'h40;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0cf: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h41;
          end
          3'h1: begin
            out_mant = 7'h41;
          end
          3'h2: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h41;
              4'h3: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h42;
          end
          3'h4: begin
            out_mant = 7'h42;
          end
          3'h5: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'ha: out_mant = 7'h43;
              4'hb: out_mant = 7'h43;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h43;
              4'he: out_mant = 7'h43;
              4'hf: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h43;
          end
          3'h7: begin
            out_mant = 7'h43;
          end
          default: begin end
        endcase
      end
      9'h0d0: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h43;
          end
          3'h1: begin
            out_mant = 7'h44;
            case (mant_lo4)
              4'h0: out_mant = 7'h43;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h44;
          end
          3'h3: begin
            out_mant = 7'h44;
          end
          3'h4: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h0: out_mant = 7'h44;
              4'h1: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h45;
          end
          3'h6: begin
            out_mant = 7'h45;
          end
          3'h7: begin
            out_mant = 7'h45;
          end
          default: begin end
        endcase
      end
      9'h0d1: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'h0: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h46;
          end
          3'h2: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'hc: out_mant = 7'h47;
              4'hd: out_mant = 7'h47;
              4'he: out_mant = 7'h47;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h47;
          end
          3'h4: begin
            out_mant = 7'h47;
          end
          3'h5: begin
            out_mant = 7'h47;
          end
          3'h6: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h47;
              4'h1: out_mant = 7'h47;
              4'h2: out_mant = 7'h47;
              4'h3: out_mant = 7'h47;
              4'h4: out_mant = 7'h47;
              4'h5: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h48;
          end
          default: begin end
        endcase
      end
      9'h0d2: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h48;
          end
          3'h1: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h9: out_mant = 7'h49;
              4'ha: out_mant = 7'h49;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h49;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h49;
          end
          3'h3: begin
            out_mant = 7'h49;
          end
          3'h4: begin
            out_mant = 7'h49;
            case (mant_lo4)
              4'hc: out_mant = 7'h4a;
              4'hd: out_mant = 7'h4a;
              4'he: out_mant = 7'h4a;
              4'hf: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4a;
          end
          3'h6: begin
            out_mant = 7'h4a;
          end
          3'h7: begin
            out_mant = 7'h4a;
          end
          default: begin end
        endcase
      end
      9'h0d3: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h8: out_mant = 7'h4b;
              4'h9: out_mant = 7'h4b;
              4'ha: out_mant = 7'h4b;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4b;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h4b;
          end
          3'h2: begin
            out_mant = 7'h4b;
          end
          3'h3: begin
            out_mant = 7'h4c;
            case (mant_lo4)
              4'h0: out_mant = 7'h4b;
              4'h1: out_mant = 7'h4b;
              4'h2: out_mant = 7'h4b;
              4'h3: out_mant = 7'h4b;
              4'h4: out_mant = 7'h4b;
              4'h5: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4c;
          end
          3'h5: begin
            out_mant = 7'h4c;
          end
          3'h6: begin
            out_mant = 7'h4c;
          end
          3'h7: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h0: out_mant = 7'h4c;
              4'h1: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0d4: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4d;
          end
          3'h1: begin
            out_mant = 7'h4d;
          end
          3'h2: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'h0: out_mant = 7'h4d;
              4'h1: out_mant = 7'h4d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4e;
          end
          3'h4: begin
            out_mant = 7'h4e;
          end
          3'h5: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h4e;
              4'h2: out_mant = 7'h4e;
              4'h3: out_mant = 7'h4e;
              4'h4: out_mant = 7'h4e;
              4'h5: out_mant = 7'h4e;
              4'h6: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h4f;
          end
          3'h7: begin
            out_mant = 7'h4f;
          end
          default: begin end
        endcase
      end
      9'h0d5: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4f;
          end
          3'h1: begin
            out_mant = 7'h50;
          end
          3'h2: begin
            out_mant = 7'h50;
          end
          3'h3: begin
            out_mant = 7'h50;
          end
          3'h4: begin
            out_mant = 7'h51;
          end
          3'h5: begin
            out_mant = 7'h51;
          end
          3'h6: begin
            out_mant = 7'h51;
          end
          3'h7: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'hf: out_mant = 7'h52;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0d6: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h52;
          end
          3'h1: begin
            out_mant = 7'h52;
          end
          3'h2: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'ha: out_mant = 7'h53;
              4'hb: out_mant = 7'h53;
              4'hc: out_mant = 7'h53;
              4'hd: out_mant = 7'h53;
              4'he: out_mant = 7'h53;
              4'hf: out_mant = 7'h53;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h53;
          end
          3'h4: begin
            out_mant = 7'h53;
          end
          3'h5: begin
            out_mant = 7'h53;
          end
          3'h6: begin
            out_mant = 7'h54;
            case (mant_lo4)
              4'h0: out_mant = 7'h53;
              4'h1: out_mant = 7'h53;
              4'h2: out_mant = 7'h53;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h54;
          end
          default: begin end
        endcase
      end
      9'h0d7: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h54;
          end
          3'h1: begin
            out_mant = 7'h54;
            case (mant_lo4)
              4'h8: out_mant = 7'h55;
              4'h9: out_mant = 7'h55;
              4'ha: out_mant = 7'h55;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h55;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h55;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h55;
          end
          3'h3: begin
            out_mant = 7'h55;
          end
          3'h4: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'ha: out_mant = 7'h56;
              4'hb: out_mant = 7'h56;
              4'hc: out_mant = 7'h56;
              4'hd: out_mant = 7'h56;
              4'he: out_mant = 7'h56;
              4'hf: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h56;
          end
          3'h6: begin
            out_mant = 7'h56;
          end
          3'h7: begin
            out_mant = 7'h56;
          end
          default: begin end
        endcase
      end
      9'h0d8: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h0: out_mant = 7'h56;
              4'h1: out_mant = 7'h56;
              4'h2: out_mant = 7'h56;
              4'h3: out_mant = 7'h56;
              4'h4: out_mant = 7'h56;
              4'h5: out_mant = 7'h56;
              4'h6: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h57;
          end
          3'h2: begin
            out_mant = 7'h57;
          end
          3'h3: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h0: out_mant = 7'h57;
              4'h1: out_mant = 7'h57;
              4'h2: out_mant = 7'h57;
              4'h3: out_mant = 7'h57;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h58;
          end
          3'h5: begin
            out_mant = 7'h58;
          end
          3'h6: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'hf: out_mant = 7'h59;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h59;
          end
          default: begin end
        endcase
      end
      9'h0d9: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h59;
          end
          3'h1: begin
            out_mant = 7'h59;
          end
          3'h2: begin
            out_mant = 7'h5a;
          end
          3'h3: begin
            out_mant = 7'h5a;
          end
          3'h4: begin
            out_mant = 7'h5a;
          end
          3'h5: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h1: out_mant = 7'h5a;
              4'h2: out_mant = 7'h5a;
              4'h3: out_mant = 7'h5a;
              4'h4: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5b;
          end
          3'h7: begin
            out_mant = 7'h5b;
          end
          default: begin end
        endcase
      end
      9'h0da: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5c;
          end
          3'h2: begin
            out_mant = 7'h5c;
          end
          3'h3: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'hd: out_mant = 7'h5d;
              4'he: out_mant = 7'h5d;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h5d;
          end
          3'h5: begin
            out_mant = 7'h5d;
          end
          3'h6: begin
            out_mant = 7'h5d;
          end
          3'h7: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'hc: out_mant = 7'h5e;
              4'hd: out_mant = 7'h5e;
              4'he: out_mant = 7'h5e;
              4'hf: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0db: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5e;
          end
          3'h1: begin
            out_mant = 7'h5e;
          end
          3'h2: begin
            out_mant = 7'h5e;
            case (mant_lo4)
              4'h8: out_mant = 7'h5f;
              4'h9: out_mant = 7'h5f;
              4'ha: out_mant = 7'h5f;
              4'hb: out_mant = 7'h5f;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h5f;
          end
          3'h4: begin
            out_mant = 7'h5f;
          end
          3'h5: begin
            out_mant = 7'h5f;
          end
          3'h6: begin
            out_mant = 7'h60;
          end
          3'h7: begin
            out_mant = 7'h60;
          end
          default: begin end
        endcase
      end
      9'h0dc: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h60;
          end
          3'h1: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h60;
              4'h3: out_mant = 7'h60;
              4'h4: out_mant = 7'h60;
              4'h5: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h61;
          end
          3'h3: begin
            out_mant = 7'h61;
          end
          3'h4: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h62;
              4'ha: out_mant = 7'h62;
              4'hb: out_mant = 7'h62;
              4'hc: out_mant = 7'h62;
              4'hd: out_mant = 7'h62;
              4'he: out_mant = 7'h62;
              4'hf: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h62;
          end
          3'h6: begin
            out_mant = 7'h62;
          end
          3'h7: begin
            out_mant = 7'h62;
          end
          default: begin end
        endcase
      end
      9'h0dd: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h62;
              4'h3: out_mant = 7'h62;
              4'h4: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h63;
          end
          3'h2: begin
            out_mant = 7'h63;
          end
          3'h3: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h64;
          end
          3'h5: begin
            out_mant = 7'h64;
          end
          3'h6: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'hc: out_mant = 7'h65;
              4'hd: out_mant = 7'h65;
              4'he: out_mant = 7'h65;
              4'hf: out_mant = 7'h65;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h65;
          end
          default: begin end
        endcase
      end
      9'h0de: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h65;
          end
          3'h1: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h66;
          end
          3'h3: begin
            out_mant = 7'h66;
          end
          3'h4: begin
            out_mant = 7'h66;
          end
          3'h5: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              4'h1: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h67;
          end
          3'h7: begin
            out_mant = 7'h67;
          end
          default: begin end
        endcase
      end
      9'h0df: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'hc: out_mant = 7'h68;
              4'hd: out_mant = 7'h68;
              4'he: out_mant = 7'h68;
              4'hf: out_mant = 7'h68;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h68;
          end
          3'h2: begin
            out_mant = 7'h68;
          end
          3'h3: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h69;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h69;
          end
          3'h5: begin
            out_mant = 7'h69;
          end
          3'h6: begin
            out_mant = 7'h69;
          end
          3'h7: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h9: out_mant = 7'h6a;
              4'ha: out_mant = 7'h6a;
              4'hb: out_mant = 7'h6a;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h6a;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0e0: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6a;
          end
          3'h1: begin
            out_mant = 7'h6a;
          end
          3'h2: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h6a;
              4'h1: out_mant = 7'h6a;
              4'h2: out_mant = 7'h6a;
              4'h3: out_mant = 7'h6a;
              4'h4: out_mant = 7'h6a;
              4'h5: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6b;
          end
          3'h4: begin
            out_mant = 7'h6b;
          end
          3'h5: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'he: out_mant = 7'h6c;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6c;
          end
          3'h7: begin
            out_mant = 7'h6c;
          end
          default: begin end
        endcase
      end
      9'h0e1: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6c;
          end
          3'h1: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h0: out_mant = 7'h6c;
              4'h1: out_mant = 7'h6c;
              4'h2: out_mant = 7'h6c;
              4'h3: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6d;
          end
          3'h3: begin
            out_mant = 7'h6d;
          end
          3'h4: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h0: out_mant = 7'h6d;
              4'h1: out_mant = 7'h6d;
              4'h2: out_mant = 7'h6d;
              4'h3: out_mant = 7'h6d;
              4'h4: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h6e;
          end
          3'h6: begin
            out_mant = 7'h6e;
          end
          3'h7: begin
            out_mant = 7'h6e;
          end
          default: begin end
        endcase
      end
      9'h0e2: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h0: out_mant = 7'h6e;
              4'h1: out_mant = 7'h6e;
              4'h2: out_mant = 7'h6e;
              4'h3: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6f;
          end
          3'h2: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'hf: out_mant = 7'h70;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h70;
          end
          3'h4: begin
            out_mant = 7'h70;
          end
          3'h5: begin
            out_mant = 7'h70;
          end
          3'h6: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h71;
              4'hc: out_mant = 7'h71;
              4'hd: out_mant = 7'h71;
              4'he: out_mant = 7'h71;
              4'hf: out_mant = 7'h71;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h71;
          end
          default: begin end
        endcase
      end
      9'h0e3: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h71;
          end
          3'h1: begin
            out_mant = 7'h71;
            case (mant_lo4)
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h72;
          end
          3'h3: begin
            out_mant = 7'h72;
          end
          3'h4: begin
            out_mant = 7'h72;
          end
          3'h5: begin
            out_mant = 7'h73;
          end
          3'h6: begin
            out_mant = 7'h73;
          end
          3'h7: begin
            out_mant = 7'h73;
          end
          default: begin end
        endcase
      end
      9'h0e4: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h74;
          end
          3'h2: begin
            out_mant = 7'h74;
          end
          3'h3: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h9: out_mant = 7'h75;
              4'ha: out_mant = 7'h75;
              4'hb: out_mant = 7'h75;
              4'hc: out_mant = 7'h75;
              4'hd: out_mant = 7'h75;
              4'he: out_mant = 7'h75;
              4'hf: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h75;
          end
          3'h5: begin
            out_mant = 7'h75;
          end
          3'h6: begin
            out_mant = 7'h75;
          end
          3'h7: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'h0: out_mant = 7'h75;
              4'h1: out_mant = 7'h75;
              4'h2: out_mant = 7'h75;
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h75;
              4'h5: out_mant = 7'h75;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0e5: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h76;
          end
          3'h1: begin
            out_mant = 7'h76;
          end
          3'h2: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              4'h1: out_mant = 7'h76;
              4'h2: out_mant = 7'h76;
              4'h3: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h77;
          end
          3'h4: begin
            out_mant = 7'h77;
          end
          3'h5: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'hb: out_mant = 7'h78;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h78;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h78;
          end
          3'h7: begin
            out_mant = 7'h78;
          end
          default: begin end
        endcase
      end
      9'h0e6: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h78;
          end
          3'h1: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h0: out_mant = 7'h78;
              4'h1: out_mant = 7'h78;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h79;
          end
          3'h3: begin
            out_mant = 7'h79;
          end
          3'h4: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              4'h1: out_mant = 7'h79;
              4'h2: out_mant = 7'h79;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7a;
          end
          3'h6: begin
            out_mant = 7'h7a;
          end
          3'h7: begin
            out_mant = 7'h7a;
          end
          default: begin end
        endcase
      end
      9'h0e7: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              4'h1: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7b;
          end
          3'h2: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'hd: out_mant = 7'h7c;
              4'he: out_mant = 7'h7c;
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7c;
          end
          3'h4: begin
            out_mant = 7'h7c;
          end
          3'h5: begin
            out_mant = 7'h7c;
          end
          3'h6: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7c;
              4'h1: out_mant = 7'h7c;
              4'h2: out_mant = 7'h7c;
              4'h3: out_mant = 7'h7c;
              4'h4: out_mant = 7'h7c;
              4'h5: out_mant = 7'h7c;
              4'h6: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7d;
          end
          default: begin end
        endcase
      end
      9'h0e8: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7d;
          end
          3'h1: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'ha: out_mant = 7'h7e;
              4'hb: out_mant = 7'h7e;
              4'hc: out_mant = 7'h7e;
              4'hd: out_mant = 7'h7e;
              4'he: out_mant = 7'h7e;
              4'hf: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h7e;
          end
          3'h3: begin
            out_mant = 7'h7e;
          end
          3'h4: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'hd: out_mant = 7'h7f;
              4'he: out_mant = 7'h7f;
              4'hf: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7f;
          end
          3'h6: begin
            out_mant = 7'h7f;
          end
          3'h7: begin
            out_mant = 7'h7f;
          end
          default: begin end
        endcase
      end
      9'h0e9: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h9: out_mant = 7'h00;
              4'ha: out_mant = 7'h00;
              4'hb: out_mant = 7'h00;
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h00;
              4'he: out_mant = 7'h00;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h00;
          end
          3'h2: begin
            out_mant = 7'h00;
          end
          3'h3: begin
            out_mant = 7'h00;
          end
          3'h4: begin
            out_mant = 7'h00;
          end
          3'h5: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              4'h1: out_mant = 7'h00;
              4'h2: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h01;
          end
          3'h7: begin
            out_mant = 7'h01;
          end
          default: begin end
        endcase
      end
      9'h0ea: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h01;
          end
          3'h1: begin
            out_mant = 7'h01;
          end
          3'h2: begin
            out_mant = 7'h01;
          end
          3'h3: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'hc: out_mant = 7'h02;
              4'hd: out_mant = 7'h02;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h02;
          end
          3'h5: begin
            out_mant = 7'h02;
          end
          3'h6: begin
            out_mant = 7'h02;
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h0eb: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
          end
          3'h1: begin
            out_mant = 7'h02;
          end
          3'h2: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h0: out_mant = 7'h02;
              4'h1: out_mant = 7'h02;
              4'h2: out_mant = 7'h02;
              4'h3: out_mant = 7'h02;
              4'h4: out_mant = 7'h02;
              4'h5: out_mant = 7'h02;
              4'h6: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h03;
          end
          3'h4: begin
            out_mant = 7'h03;
          end
          3'h5: begin
            out_mant = 7'h03;
          end
          3'h6: begin
            out_mant = 7'h03;
          end
          3'h7: begin
            out_mant = 7'h03;
          end
          default: begin end
        endcase
      end
      9'h0ec: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h03;
          end
          3'h1: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h03;
              4'h3: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h04;
          end
          3'h3: begin
            out_mant = 7'h04;
          end
          3'h4: begin
            out_mant = 7'h04;
          end
          3'h5: begin
            out_mant = 7'h04;
          end
          3'h6: begin
            out_mant = 7'h04;
          end
          3'h7: begin
            out_mant = 7'h04;
          end
          default: begin end
        endcase
      end
      9'h0ed: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              4'h1: out_mant = 7'h04;
              4'h2: out_mant = 7'h04;
              4'h3: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h05;
          end
          3'h2: begin
            out_mant = 7'h05;
          end
          3'h3: begin
            out_mant = 7'h05;
          end
          3'h4: begin
            out_mant = 7'h05;
          end
          3'h5: begin
            out_mant = 7'h05;
          end
          3'h6: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'ha: out_mant = 7'h06;
              4'hb: out_mant = 7'h06;
              4'hc: out_mant = 7'h06;
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h06;
          end
          default: begin end
        endcase
      end
      9'h0ee: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h06;
          end
          3'h1: begin
            out_mant = 7'h06;
          end
          3'h2: begin
            out_mant = 7'h06;
          end
          3'h3: begin
            out_mant = 7'h06;
          end
          3'h4: begin
            out_mant = 7'h06;
          end
          3'h5: begin
            out_mant = 7'h07;
          end
          3'h6: begin
            out_mant = 7'h07;
          end
          3'h7: begin
            out_mant = 7'h07;
          end
          default: begin end
        endcase
      end
      9'h0ef: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h07;
          end
          3'h1: begin
            out_mant = 7'h07;
          end
          3'h2: begin
            out_mant = 7'h07;
          end
          3'h3: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h08;
              4'hc: out_mant = 7'h08;
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h08;
              4'hf: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h08;
          end
          3'h5: begin
            out_mant = 7'h08;
          end
          3'h6: begin
            out_mant = 7'h08;
          end
          3'h7: begin
            out_mant = 7'h08;
          end
          default: begin end
        endcase
      end
      9'h0f0: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h08;
          end
          3'h1: begin
            out_mant = 7'h08;
          end
          3'h2: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h08;
              4'h3: out_mant = 7'h08;
              4'h4: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h09;
          end
          3'h4: begin
            out_mant = 7'h09;
          end
          3'h5: begin
            out_mant = 7'h09;
          end
          3'h6: begin
            out_mant = 7'h09;
          end
          3'h7: begin
            out_mant = 7'h09;
          end
          default: begin end
        endcase
      end
      9'h0f1: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h09;
          end
          3'h1: begin
            out_mant = 7'h0a;
            case (mant_lo4)
              4'h0: out_mant = 7'h09;
              4'h1: out_mant = 7'h09;
              4'h2: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0a;
          end
          3'h3: begin
            out_mant = 7'h0a;
          end
          3'h4: begin
            out_mant = 7'h0a;
          end
          3'h5: begin
            out_mant = 7'h0a;
          end
          3'h6: begin
            out_mant = 7'h0a;
          end
          3'h7: begin
            out_mant = 7'h0a;
          end
          default: begin end
        endcase
      end
      9'h0f2: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0b;
          end
          3'h2: begin
            out_mant = 7'h0b;
          end
          3'h3: begin
            out_mant = 7'h0b;
          end
          3'h4: begin
            out_mant = 7'h0b;
          end
          3'h5: begin
            out_mant = 7'h0b;
          end
          3'h6: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h8: out_mant = 7'h0c;
              4'h9: out_mant = 7'h0c;
              4'ha: out_mant = 7'h0c;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h0c;
              4'he: out_mant = 7'h0c;
              4'hf: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h0c;
          end
          default: begin end
        endcase
      end
      9'h0f3: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0c;
          end
          3'h1: begin
            out_mant = 7'h0c;
          end
          3'h2: begin
            out_mant = 7'h0c;
          end
          3'h3: begin
            out_mant = 7'h0c;
          end
          3'h4: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'he: out_mant = 7'h0d;
              4'hf: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0d;
          end
          3'h6: begin
            out_mant = 7'h0d;
          end
          3'h7: begin
            out_mant = 7'h0d;
          end
          default: begin end
        endcase
      end
      9'h0f4: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0d;
          end
          3'h1: begin
            out_mant = 7'h0d;
          end
          3'h2: begin
            out_mant = 7'h0d;
          end
          3'h3: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h0d;
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h0d;
              4'h3: out_mant = 7'h0d;
              4'h4: out_mant = 7'h0d;
              4'h5: out_mant = 7'h0d;
              4'h6: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0e;
          end
          3'h5: begin
            out_mant = 7'h0e;
          end
          3'h6: begin
            out_mant = 7'h0e;
          end
          3'h7: begin
            out_mant = 7'h0e;
          end
          default: begin end
        endcase
      end
      9'h0f5: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0e;
          end
          3'h1: begin
            out_mant = 7'h0e;
          end
          3'h2: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h0e;
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0f;
          end
          3'h4: begin
            out_mant = 7'h0f;
          end
          3'h5: begin
            out_mant = 7'h0f;
          end
          3'h6: begin
            out_mant = 7'h0f;
          end
          3'h7: begin
            out_mant = 7'h0f;
          end
          default: begin end
        endcase
      end
      9'h0f6: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0f;
          end
          3'h1: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'h0: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h10;
          end
          3'h3: begin
            out_mant = 7'h10;
          end
          3'h4: begin
            out_mant = 7'h10;
          end
          3'h5: begin
            out_mant = 7'h10;
          end
          3'h6: begin
            out_mant = 7'h10;
          end
          3'h7: begin
            out_mant = 7'h10;
          end
          default: begin end
        endcase
      end
      9'h0f7: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h11;
          end
          3'h2: begin
            out_mant = 7'h11;
          end
          3'h3: begin
            out_mant = 7'h11;
          end
          3'h4: begin
            out_mant = 7'h11;
          end
          3'h5: begin
            out_mant = 7'h11;
          end
          3'h6: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'h0: out_mant = 7'h11;
              4'h1: out_mant = 7'h11;
              4'h2: out_mant = 7'h11;
              4'h3: out_mant = 7'h11;
              4'h4: out_mant = 7'h11;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h12;
          end
          default: begin end
        endcase
      end
      9'h0f8: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h12;
          end
          3'h1: begin
            out_mant = 7'h12;
          end
          3'h2: begin
            out_mant = 7'h12;
          end
          3'h3: begin
            out_mant = 7'h12;
          end
          3'h4: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'hc: out_mant = 7'h13;
              4'hd: out_mant = 7'h13;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h13;
          end
          3'h6: begin
            out_mant = 7'h13;
          end
          3'h7: begin
            out_mant = 7'h13;
          end
          default: begin end
        endcase
      end
      9'h0f9: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h13;
          end
          3'h1: begin
            out_mant = 7'h13;
          end
          3'h2: begin
            out_mant = 7'h13;
          end
          3'h3: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h0: out_mant = 7'h13;
              4'h1: out_mant = 7'h13;
              4'h2: out_mant = 7'h13;
              4'h3: out_mant = 7'h13;
              4'h4: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h14;
          end
          3'h5: begin
            out_mant = 7'h14;
          end
          3'h6: begin
            out_mant = 7'h14;
          end
          3'h7: begin
            out_mant = 7'h14;
          end
          default: begin end
        endcase
      end
      9'h0fa: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h14;
          end
          3'h1: begin
            out_mant = 7'h14;
          end
          3'h2: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h15;
          end
          3'h4: begin
            out_mant = 7'h15;
          end
          3'h5: begin
            out_mant = 7'h15;
          end
          3'h6: begin
            out_mant = 7'h15;
          end
          3'h7: begin
            out_mant = 7'h15;
          end
          default: begin end
        endcase
      end
      9'h0fb: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h16;
          end
          3'h2: begin
            out_mant = 7'h16;
          end
          3'h3: begin
            out_mant = 7'h16;
          end
          3'h4: begin
            out_mant = 7'h16;
          end
          3'h5: begin
            out_mant = 7'h16;
          end
          3'h6: begin
            out_mant = 7'h16;
          end
          3'h7: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h0fc: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h17;
          end
          3'h1: begin
            out_mant = 7'h17;
          end
          3'h2: begin
            out_mant = 7'h17;
          end
          3'h3: begin
            out_mant = 7'h17;
          end
          3'h4: begin
            out_mant = 7'h17;
          end
          3'h5: begin
            out_mant = 7'h17;
          end
          3'h6: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h18;
          end
          default: begin end
        endcase
      end
      9'h0fd: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h18;
          end
          3'h1: begin
            out_mant = 7'h18;
          end
          3'h2: begin
            out_mant = 7'h18;
          end
          3'h3: begin
            out_mant = 7'h18;
          end
          3'h4: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h9: out_mant = 7'h19;
              4'ha: out_mant = 7'h19;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h19;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h19;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h19;
          end
          3'h6: begin
            out_mant = 7'h19;
          end
          3'h7: begin
            out_mant = 7'h19;
          end
          default: begin end
        endcase
      end
      9'h0fe: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h19;
          end
          3'h1: begin
            out_mant = 7'h19;
          end
          3'h2: begin
            out_mant = 7'h19;
          end
          3'h3: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h0: out_mant = 7'h19;
              4'h1: out_mant = 7'h19;
              4'h2: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1a;
          end
          3'h5: begin
            out_mant = 7'h1a;
          end
          3'h6: begin
            out_mant = 7'h1a;
          end
          3'h7: begin
            out_mant = 7'h1a;
          end
          default: begin end
        endcase
      end
      9'h0ff: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h40;
          end
          3'h2: begin
            out_mant = 7'h40;
          end
          3'h3: begin
            out_mant = 7'h40;
          end
          3'h4: begin
            out_mant = 7'h40;
          end
          3'h5: begin
            out_mant = 7'h40;
          end
          3'h6: begin
            out_mant = 7'h40;
          end
          3'h7: begin
            out_mant = 7'h40;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  reg bit_14;
  always @* begin
    bit_14 = 1'b1;
    casez (sign_exp)
      9'b001111001: bit_14 = 1'b0;
      9'b00111101?: bit_14 = 1'b0;
      9'b0011111??: bit_14 = 1'b0;
      9'b0100000??: bit_14 = 1'b0;
      9'b010000100: bit_14 = 1'b0;
        9'h078: begin
          case (mant_hi1)
            1'h0: begin
              bit_14 = 1'b1;
              case (mant_lo6)
                6'h26: bit_14 = 1'b0;
                6'h27: bit_14 = 1'b0;
                6'h28: bit_14 = 1'b0;
                6'h29: bit_14 = 1'b0;
                6'h2a: bit_14 = 1'b0;
                6'h2b: bit_14 = 1'b0;
                6'h2c: bit_14 = 1'b0;
                6'h2d: bit_14 = 1'b0;
                6'h2e: bit_14 = 1'b0;
                6'h2f: bit_14 = 1'b0;
                6'h30: bit_14 = 1'b0;
                6'h31: bit_14 = 1'b0;
                6'h32: bit_14 = 1'b0;
                6'h33: bit_14 = 1'b0;
                6'h34: bit_14 = 1'b0;
                6'h35: bit_14 = 1'b0;
                6'h36: bit_14 = 1'b0;
                6'h37: bit_14 = 1'b0;
                6'h38: bit_14 = 1'b0;
                6'h39: bit_14 = 1'b0;
                6'h3a: bit_14 = 1'b0;
                6'h3b: bit_14 = 1'b0;
                6'h3c: bit_14 = 1'b0;
                6'h3d: bit_14 = 1'b0;
                6'h3e: bit_14 = 1'b0;
                6'h3f: bit_14 = 1'b0;
                default: begin end
              endcase
            end
            1'h1: begin
              bit_14 = 1'b0;
            end
            default: begin end
          endcase
        end
        9'h085: begin
          case (mant_hi1)
            1'h0: begin
              bit_14 = 1'b0;
            end
            1'h1: begin
              bit_14 = 1'b1;
              case (mant_lo6)
                6'h00: bit_14 = 1'b0;
                6'h01: bit_14 = 1'b0;
                6'h02: bit_14 = 1'b0;
                6'h03: bit_14 = 1'b0;
                6'h04: bit_14 = 1'b0;
                6'h05: bit_14 = 1'b0;
                6'h06: bit_14 = 1'b0;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
      default: begin end
    endcase
  end
  reg bit_15;
  always @* begin
    bit_15 = 1'b0;
    casez (sign_exp)
      9'b000??????: bit_15 = 1'b1;
      9'b0010?????: bit_15 = 1'b1;
      9'b00110????: bit_15 = 1'b1;
      9'b001110???: bit_15 = 1'b1;
      9'b0011110??: bit_15 = 1'b1;
      9'b00111110?: bit_15 = 1'b1;
      9'b001111110: bit_15 = 1'b1;
      9'b100000000: bit_15 = 1'b1;
      default: begin end
    endcase
  end
  assign out = {bit_15, bit_14, out_exp[6], out_exp[5], out_exp[4], out_exp[3], out_exp[2], out_exp[1], out_exp[0], out_mant[6], out_mant[5], out_mant[4], out_mant[3], out_mant[2], out_mant[1], out_mant[0]};
endmodule
