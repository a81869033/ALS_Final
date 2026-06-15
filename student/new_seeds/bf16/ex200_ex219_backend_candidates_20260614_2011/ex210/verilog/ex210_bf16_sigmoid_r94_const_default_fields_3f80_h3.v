module ex210_bf16_sigmoid_r94_const_default_fields_3f80_h3(in, out);
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
  reg [7:0] out_exp;
  reg [6:0] out_mant;
  always @* begin
    out_exp = 8'h7f;
    casez (sign_exp)
      9'b11000011?: out_exp = 8'h00;
      9'b110001???: out_exp = 8'h00;
      9'b11001????: out_exp = 8'h00;
      9'b1101?????: out_exp = 8'h00;
      9'b1110?????: out_exp = 8'h00;
      9'b11110????: out_exp = 8'h00;
      9'b111110???: out_exp = 8'h00;
      9'b1111110??: out_exp = 8'h00;
      9'b11111110?: out_exp = 8'h00;
      9'b111111110: out_exp = 8'h00;
      9'b1011110??: out_exp = 8'h7d;
      9'b10111110?: out_exp = 8'h7d;
      9'b101111110: out_exp = 8'h7d;
      9'b00???????: out_exp = 8'h7e;
      9'b010000000: out_exp = 8'h7e;
      9'b100??????: out_exp = 8'h7e;
      9'b1010?????: out_exp = 8'h7e;
      9'b10110????: out_exp = 8'h7e;
      9'b1011100??: out_exp = 8'h7e;
      9'b10111010?: out_exp = 8'h7e;
      9'b101110110: out_exp = 8'h7e;
      9'h081: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7e;
          end
          3'h1: begin
            out_exp = 8'h7e;
          end
          3'h2: begin
            out_exp = 8'h7e;
          end
          3'h3: begin
            out_exp = 8'h7e;
          end
          3'h4: begin
            out_exp = 8'h7e;
            case (mant_lo4)
              4'h8: out_exp = 8'h7f;
              4'h9: out_exp = 8'h7f;
              4'ha: out_exp = 8'h7f;
              4'hb: out_exp = 8'h7f;
              4'hc: out_exp = 8'h7f;
              4'hd: out_exp = 8'h7f;
              4'he: out_exp = 8'h7f;
              4'hf: out_exp = 8'h7f;
              default: begin end
            endcase
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
      9'h0ff: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'hff;
            case (mant_lo4)
              4'h0: out_exp = 8'h7f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'hff;
          end
          3'h2: begin
            out_exp = 8'hff;
          end
          3'h3: begin
            out_exp = 8'hff;
          end
          3'h4: begin
            out_exp = 8'hff;
          end
          3'h5: begin
            out_exp = 8'hff;
          end
          3'h6: begin
            out_exp = 8'hff;
          end
          3'h7: begin
            out_exp = 8'hff;
          end
          default: begin end
        endcase
      end
      9'h177: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7d;
            case (mant_lo4)
              4'h0: out_exp = 8'h7e;
              default: begin end
            endcase
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
      9'h17f: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7d;
            case (mant_lo4)
              4'hd: out_exp = 8'h7c;
              4'he: out_exp = 8'h7c;
              4'hf: out_exp = 8'h7c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h7c;
          end
          3'h2: begin
            out_exp = 8'h7c;
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
            out_exp = 8'h7c;
          end
          3'h7: begin
            out_exp = 8'h7c;
            case (mant_lo4)
              4'ha: out_exp = 8'h7b;
              4'hb: out_exp = 8'h7b;
              4'hc: out_exp = 8'h7b;
              4'hd: out_exp = 8'h7b;
              4'he: out_exp = 8'h7b;
              4'hf: out_exp = 8'h7b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h7b;
          end
          3'h1: begin
            out_exp = 8'h7b;
          end
          3'h2: begin
            out_exp = 8'h7b;
            case (mant_lo4)
              4'he: out_exp = 8'h7a;
              4'hf: out_exp = 8'h7a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h7a;
          end
          3'h4: begin
            out_exp = 8'h7a;
          end
          3'h5: begin
            out_exp = 8'h7a;
            case (mant_lo4)
              4'hc: out_exp = 8'h79;
              4'hd: out_exp = 8'h79;
              4'he: out_exp = 8'h79;
              4'hf: out_exp = 8'h79;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h79;
          end
          3'h7: begin
            out_exp = 8'h79;
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h78;
            case (mant_lo4)
              4'h0: out_exp = 8'h79;
              4'h1: out_exp = 8'h79;
              4'h2: out_exp = 8'h79;
              4'h3: out_exp = 8'h79;
              4'h4: out_exp = 8'h79;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h78;
            case (mant_lo4)
              4'hc: out_exp = 8'h77;
              4'hd: out_exp = 8'h77;
              4'he: out_exp = 8'h77;
              4'hf: out_exp = 8'h77;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h77;
          end
          3'h3: begin
            out_exp = 8'h76;
            case (mant_lo4)
              4'h0: out_exp = 8'h77;
              4'h1: out_exp = 8'h77;
              default: begin end
            endcase
          end
          3'h4: begin
            out_exp = 8'h76;
            case (mant_lo4)
              4'h8: out_exp = 8'h75;
              4'h9: out_exp = 8'h75;
              4'ha: out_exp = 8'h75;
              4'hb: out_exp = 8'h75;
              4'hc: out_exp = 8'h75;
              4'hd: out_exp = 8'h75;
              4'he: out_exp = 8'h75;
              4'hf: out_exp = 8'h75;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h75;
            case (mant_lo4)
              4'he: out_exp = 8'h74;
              4'hf: out_exp = 8'h74;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h74;
          end
          3'h7: begin
            out_exp = 8'h73;
            case (mant_lo4)
              4'h0: out_exp = 8'h74;
              4'h1: out_exp = 8'h74;
              4'h2: out_exp = 8'h74;
              4'h3: out_exp = 8'h74;
              4'h4: out_exp = 8'h74;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h72;
            case (mant_lo4)
              4'h0: out_exp = 8'h73;
              4'h1: out_exp = 8'h73;
              4'h2: out_exp = 8'h73;
              4'h3: out_exp = 8'h73;
              4'h4: out_exp = 8'h73;
              4'h5: out_exp = 8'h73;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h71;
            case (mant_lo4)
              4'h0: out_exp = 8'h72;
              4'hc: out_exp = 8'h70;
              4'hd: out_exp = 8'h70;
              4'he: out_exp = 8'h70;
              4'hf: out_exp = 8'h70;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h6f;
            case (mant_lo4)
              4'h0: out_exp = 8'h70;
              4'h1: out_exp = 8'h70;
              4'h2: out_exp = 8'h70;
              4'h3: out_exp = 8'h70;
              4'h4: out_exp = 8'h70;
              4'h5: out_exp = 8'h70;
              4'h6: out_exp = 8'h70;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h6e;
            case (mant_lo4)
              4'h0: out_exp = 8'h6f;
              4'h1: out_exp = 8'h6f;
              4'hd: out_exp = 8'h6d;
              4'he: out_exp = 8'h6d;
              4'hf: out_exp = 8'h6d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_exp = 8'h6d;
            case (mant_lo4)
              4'h8: out_exp = 8'h6c;
              4'h9: out_exp = 8'h6c;
              4'ha: out_exp = 8'h6c;
              4'hb: out_exp = 8'h6c;
              4'hc: out_exp = 8'h6c;
              4'hd: out_exp = 8'h6c;
              4'he: out_exp = 8'h6c;
              4'hf: out_exp = 8'h6c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h6b;
            case (mant_lo4)
              4'h0: out_exp = 8'h6c;
              4'h1: out_exp = 8'h6c;
              4'h2: out_exp = 8'h6c;
              4'he: out_exp = 8'h6a;
              4'hf: out_exp = 8'h6a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h6a;
            case (mant_lo4)
              4'h9: out_exp = 8'h69;
              4'ha: out_exp = 8'h69;
              4'hb: out_exp = 8'h69;
              4'hc: out_exp = 8'h69;
              4'hd: out_exp = 8'h69;
              4'he: out_exp = 8'h69;
              4'hf: out_exp = 8'h69;
              default: begin end
            endcase
          end
          3'h7: begin
            out_exp = 8'h68;
            case (mant_lo4)
              4'h0: out_exp = 8'h69;
              4'h1: out_exp = 8'h69;
              4'h2: out_exp = 8'h69;
              4'h3: out_exp = 8'h69;
              4'h4: out_exp = 8'h69;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h67;
            case (mant_lo4)
              4'h6: out_exp = 8'h66;
              4'h7: out_exp = 8'h66;
              4'h8: out_exp = 8'h66;
              4'h9: out_exp = 8'h66;
              4'ha: out_exp = 8'h66;
              4'hb: out_exp = 8'h65;
              4'hc: out_exp = 8'h65;
              4'hd: out_exp = 8'h65;
              4'he: out_exp = 8'h65;
              4'hf: out_exp = 8'h65;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h63;
            case (mant_lo4)
              4'h0: out_exp = 8'h65;
              4'h1: out_exp = 8'h64;
              4'h2: out_exp = 8'h64;
              4'h3: out_exp = 8'h64;
              4'h4: out_exp = 8'h64;
              4'h5: out_exp = 8'h64;
              4'hc: out_exp = 8'h62;
              4'hd: out_exp = 8'h62;
              4'he: out_exp = 8'h62;
              4'hf: out_exp = 8'h62;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h61;
            case (mant_lo4)
              4'h0: out_exp = 8'h62;
              4'h7: out_exp = 8'h60;
              4'h8: out_exp = 8'h60;
              4'h9: out_exp = 8'h60;
              4'ha: out_exp = 8'h60;
              4'hb: out_exp = 8'h60;
              4'hc: out_exp = 8'h5f;
              4'hd: out_exp = 8'h5f;
              4'he: out_exp = 8'h5f;
              4'hf: out_exp = 8'h5f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h5e;
            case (mant_lo4)
              4'h0: out_exp = 8'h5f;
              4'h1: out_exp = 8'h5f;
              4'h8: out_exp = 8'h5d;
              4'h9: out_exp = 8'h5d;
              4'ha: out_exp = 8'h5d;
              4'hb: out_exp = 8'h5d;
              4'hc: out_exp = 8'h5d;
              4'hd: out_exp = 8'h5c;
              4'he: out_exp = 8'h5c;
              4'hf: out_exp = 8'h5c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_exp = 8'h5a;
            case (mant_lo4)
              4'h0: out_exp = 8'h5c;
              4'h1: out_exp = 8'h5c;
              4'h2: out_exp = 8'h5c;
              4'h3: out_exp = 8'h5b;
              4'h4: out_exp = 8'h5b;
              4'h5: out_exp = 8'h5b;
              4'h6: out_exp = 8'h5b;
              4'h7: out_exp = 8'h5b;
              4'he: out_exp = 8'h59;
              4'hf: out_exp = 8'h59;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h58;
            case (mant_lo4)
              4'h0: out_exp = 8'h59;
              4'h1: out_exp = 8'h59;
              4'h2: out_exp = 8'h59;
              4'h9: out_exp = 8'h57;
              4'ha: out_exp = 8'h57;
              4'hb: out_exp = 8'h57;
              4'hc: out_exp = 8'h57;
              4'hd: out_exp = 8'h57;
              4'he: out_exp = 8'h56;
              4'hf: out_exp = 8'h56;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h54;
            case (mant_lo4)
              4'h0: out_exp = 8'h56;
              4'h1: out_exp = 8'h56;
              4'h2: out_exp = 8'h56;
              4'h3: out_exp = 8'h56;
              4'h4: out_exp = 8'h55;
              4'h5: out_exp = 8'h55;
              4'h6: out_exp = 8'h55;
              4'h7: out_exp = 8'h55;
              4'h8: out_exp = 8'h55;
              4'hf: out_exp = 8'h53;
              default: begin end
            endcase
          end
          3'h7: begin
            out_exp = 8'h51;
            case (mant_lo4)
              4'h0: out_exp = 8'h53;
              4'h1: out_exp = 8'h53;
              4'h2: out_exp = 8'h53;
              4'h3: out_exp = 8'h53;
              4'h4: out_exp = 8'h53;
              4'h5: out_exp = 8'h52;
              4'h6: out_exp = 8'h52;
              4'h7: out_exp = 8'h52;
              4'h8: out_exp = 8'h52;
              4'h9: out_exp = 8'h52;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h50;
            case (mant_lo4)
              4'h3: out_exp = 8'h4f;
              4'h4: out_exp = 8'h4f;
              4'h5: out_exp = 8'h4f;
              4'h6: out_exp = 8'h4e;
              4'h7: out_exp = 8'h4e;
              4'h8: out_exp = 8'h4d;
              4'h9: out_exp = 8'h4d;
              4'ha: out_exp = 8'h4d;
              4'hb: out_exp = 8'h4c;
              4'hc: out_exp = 8'h4c;
              4'hd: out_exp = 8'h4c;
              4'he: out_exp = 8'h4b;
              4'hf: out_exp = 8'h4b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h49;
            case (mant_lo4)
              4'h0: out_exp = 8'h4b;
              4'h1: out_exp = 8'h4a;
              4'h2: out_exp = 8'h4a;
              4'h6: out_exp = 8'h48;
              4'h7: out_exp = 8'h48;
              4'h8: out_exp = 8'h48;
              4'h9: out_exp = 8'h47;
              4'ha: out_exp = 8'h47;
              4'hb: out_exp = 8'h47;
              4'hc: out_exp = 8'h46;
              4'hd: out_exp = 8'h46;
              4'he: out_exp = 8'h46;
              4'hf: out_exp = 8'h45;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h44;
            case (mant_lo4)
              4'h0: out_exp = 8'h45;
              4'h4: out_exp = 8'h43;
              4'h5: out_exp = 8'h43;
              4'h6: out_exp = 8'h43;
              4'h7: out_exp = 8'h42;
              4'h8: out_exp = 8'h42;
              4'h9: out_exp = 8'h42;
              4'ha: out_exp = 8'h41;
              4'hb: out_exp = 8'h41;
              4'hc: out_exp = 8'h40;
              4'hd: out_exp = 8'h40;
              4'he: out_exp = 8'h40;
              4'hf: out_exp = 8'h3f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h3e;
            case (mant_lo4)
              4'h0: out_exp = 8'h3f;
              4'h1: out_exp = 8'h3f;
              4'h5: out_exp = 8'h3d;
              4'h6: out_exp = 8'h3d;
              4'h7: out_exp = 8'h3c;
              4'h8: out_exp = 8'h3c;
              4'h9: out_exp = 8'h3c;
              4'ha: out_exp = 8'h3b;
              4'hb: out_exp = 8'h3b;
              4'hc: out_exp = 8'h3b;
              4'hd: out_exp = 8'h3a;
              4'he: out_exp = 8'h3a;
              4'hf: out_exp = 8'h3a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_exp = 8'h39;
            case (mant_lo4)
              4'h3: out_exp = 8'h38;
              4'h4: out_exp = 8'h38;
              4'h5: out_exp = 8'h37;
              4'h6: out_exp = 8'h37;
              4'h7: out_exp = 8'h37;
              4'h8: out_exp = 8'h36;
              4'h9: out_exp = 8'h36;
              4'ha: out_exp = 8'h36;
              4'hb: out_exp = 8'h35;
              4'hc: out_exp = 8'h35;
              4'hd: out_exp = 8'h35;
              4'he: out_exp = 8'h34;
              4'hf: out_exp = 8'h34;
              default: begin end
            endcase
          end
          3'h5: begin
            out_exp = 8'h33;
            case (mant_lo4)
              4'h3: out_exp = 8'h32;
              4'h4: out_exp = 8'h32;
              4'h5: out_exp = 8'h32;
              4'h6: out_exp = 8'h31;
              4'h7: out_exp = 8'h31;
              4'h8: out_exp = 8'h31;
              4'h9: out_exp = 8'h30;
              4'ha: out_exp = 8'h30;
              4'hb: out_exp = 8'h30;
              4'hc: out_exp = 8'h2f;
              4'hd: out_exp = 8'h2f;
              4'he: out_exp = 8'h2e;
              4'hf: out_exp = 8'h2e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_exp = 8'h2d;
            case (mant_lo4)
              4'h0: out_exp = 8'h2e;
              4'h4: out_exp = 8'h2c;
              4'h5: out_exp = 8'h2c;
              4'h6: out_exp = 8'h2c;
              4'h7: out_exp = 8'h2b;
              4'h8: out_exp = 8'h2b;
              4'h9: out_exp = 8'h2a;
              4'ha: out_exp = 8'h2a;
              4'hb: out_exp = 8'h2a;
              4'hc: out_exp = 8'h29;
              4'hd: out_exp = 8'h29;
              4'he: out_exp = 8'h29;
              4'hf: out_exp = 8'h28;
              default: begin end
            endcase
          end
          3'h7: begin
            out_exp = 8'h26;
            case (mant_lo4)
              4'h0: out_exp = 8'h28;
              4'h1: out_exp = 8'h28;
              4'h2: out_exp = 8'h27;
              4'h3: out_exp = 8'h27;
              4'h7: out_exp = 8'h25;
              4'h8: out_exp = 8'h25;
              4'h9: out_exp = 8'h25;
              4'ha: out_exp = 8'h24;
              4'hb: out_exp = 8'h24;
              4'hc: out_exp = 8'h24;
              4'hd: out_exp = 8'h23;
              4'he: out_exp = 8'h23;
              4'hf: out_exp = 8'h23;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'h21;
            case (mant_lo4)
              4'h0: out_exp = 8'h22;
              4'h3: out_exp = 8'h20;
              4'h4: out_exp = 8'h1f;
              4'h5: out_exp = 8'h1f;
              4'h6: out_exp = 8'h1e;
              4'h7: out_exp = 8'h1d;
              4'h8: out_exp = 8'h1c;
              4'h9: out_exp = 8'h1c;
              4'ha: out_exp = 8'h1b;
              4'hb: out_exp = 8'h1a;
              4'hc: out_exp = 8'h1a;
              4'hd: out_exp = 8'h19;
              4'he: out_exp = 8'h18;
              4'hf: out_exp = 8'h17;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'h14;
            case (mant_lo4)
              4'h0: out_exp = 8'h17;
              4'h1: out_exp = 8'h16;
              4'h2: out_exp = 8'h15;
              4'h5: out_exp = 8'h13;
              4'h6: out_exp = 8'h12;
              4'h7: out_exp = 8'h12;
              4'h8: out_exp = 8'h11;
              4'h9: out_exp = 8'h10;
              4'ha: out_exp = 8'h0f;
              4'hb: out_exp = 8'h0f;
              4'hc: out_exp = 8'h0e;
              4'hd: out_exp = 8'h0d;
              4'he: out_exp = 8'h0d;
              4'hf: out_exp = 8'h0c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_exp = 8'h0a;
            case (mant_lo4)
              4'h0: out_exp = 8'h0b;
              4'h3: out_exp = 8'h09;
              4'h4: out_exp = 8'h08;
              4'h5: out_exp = 8'h07;
              4'h6: out_exp = 8'h07;
              4'h7: out_exp = 8'h06;
              4'h8: out_exp = 8'h05;
              4'h9: out_exp = 8'h05;
              4'ha: out_exp = 8'h04;
              4'hb: out_exp = 8'h03;
              4'hc: out_exp = 8'h02;
              4'hd: out_exp = 8'h02;
              4'he: out_exp = 8'h01;
              4'hf: out_exp = 8'h00;
              default: begin end
            endcase
          end
          3'h3: begin
            out_exp = 8'h00;
          end
          3'h4: begin
            out_exp = 8'h00;
          end
          3'h5: begin
            out_exp = 8'h00;
          end
          3'h6: begin
            out_exp = 8'h00;
          end
          3'h7: begin
            out_exp = 8'h00;
          end
          default: begin end
        endcase
      end
      9'h1ff: begin
        case (mant_hi3)
          3'h0: begin
            out_exp = 8'hff;
            case (mant_lo4)
              4'h0: out_exp = 8'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_exp = 8'hff;
          end
          3'h2: begin
            out_exp = 8'hff;
          end
          3'h3: begin
            out_exp = 8'hff;
          end
          3'h4: begin
            out_exp = 8'hff;
          end
          3'h5: begin
            out_exp = 8'hff;
          end
          3'h6: begin
            out_exp = 8'hff;
          end
          3'h7: begin
            out_exp = 8'hff;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  always @* begin
    out_mant = 7'h00;
    casez (sign_exp)
      9'h078: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h01;
          end
          3'h2: begin
            out_mant = 7'h01;
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
      9'h079: begin
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
          end
          3'h4: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h01;
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
      9'h07a: begin
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
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h04;
          end
          default: begin end
        endcase
      end
      9'h07b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h04;
          end
          3'h1: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h0: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h05;
          end
          3'h3: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h0: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h06;
          end
          3'h5: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h07;
          end
          3'h7: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h08;
            case (mant_lo4)
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
          3'h1: begin
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
          3'h2: begin
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
          3'h3: begin
            out_mant = 7'h0b;
            case (mant_lo4)
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
          3'h4: begin
            out_mant = 7'h0c;
            case (mant_lo4)
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
          3'h7: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h10;
              4'hc: out_mant = 7'h10;
              4'hd: out_mant = 7'h10;
              4'he: out_mant = 7'h10;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              4'h1: out_mant = 7'h10;
              4'h2: out_mant = 7'h10;
              4'h3: out_mant = 7'h10;
              4'h4: out_mant = 7'h10;
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
              4'h4: out_mant = 7'h12;
              4'h5: out_mant = 7'h12;
              4'he: out_mant = 7'h14;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h14;
              4'h1: out_mant = 7'h14;
              4'h2: out_mant = 7'h14;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h14;
              4'he: out_mant = 7'h16;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h16;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h16;
              4'hf: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h18;
              4'h1: out_mant = 7'h18;
              4'h2: out_mant = 7'h18;
              4'h3: out_mant = 7'h18;
              4'h4: out_mant = 7'h18;
              4'h5: out_mant = 7'h18;
              4'h6: out_mant = 7'h18;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          3'h5: begin
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
          3'h6: begin
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
          3'h7: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'h0: out_mant = 7'h1d;
              4'h9: out_mant = 7'h1f;
              4'ha: out_mant = 7'h1f;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h1f;
              4'h1: out_mant = 7'h20;
              4'h2: out_mant = 7'h20;
              4'h3: out_mant = 7'h20;
              4'h4: out_mant = 7'h20;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h23;
              4'hf: out_mant = 7'h23;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h0: out_mant = 7'h23;
              4'h1: out_mant = 7'h23;
              4'h7: out_mant = 7'h25;
              4'h8: out_mant = 7'h25;
              4'h9: out_mant = 7'h25;
              4'ha: out_mant = 7'h25;
              4'hb: out_mant = 7'h26;
              4'hc: out_mant = 7'h26;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h29;
            case (mant_lo4)
              4'h0: out_mant = 7'h27;
              4'h1: out_mant = 7'h27;
              4'h2: out_mant = 7'h27;
              4'h3: out_mant = 7'h27;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h28;
              4'h6: out_mant = 7'h28;
              4'h7: out_mant = 7'h28;
              4'hd: out_mant = 7'h2a;
              4'he: out_mant = 7'h2a;
              4'hf: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2b;
            case (mant_lo4)
              4'h0: out_mant = 7'h2a;
              4'h6: out_mant = 7'h2c;
              4'h7: out_mant = 7'h2c;
              4'h8: out_mant = 7'h2c;
              4'h9: out_mant = 7'h2c;
              4'ha: out_mant = 7'h2d;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2d;
              4'hd: out_mant = 7'h2d;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'h0: out_mant = 7'h2e;
              4'h1: out_mant = 7'h2e;
              4'h2: out_mant = 7'h2e;
              4'h8: out_mant = 7'h30;
              4'h9: out_mant = 7'h30;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h30;
              4'hc: out_mant = 7'h30;
              4'hd: out_mant = 7'h31;
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h31;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h0: out_mant = 7'h31;
              4'h6: out_mant = 7'h33;
              4'h7: out_mant = 7'h33;
              4'h8: out_mant = 7'h33;
              4'h9: out_mant = 7'h33;
              4'ha: out_mant = 7'h33;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h34;
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
              4'h9: out_mant = 7'h37;
              4'ha: out_mant = 7'h37;
              4'hb: out_mant = 7'h37;
              4'hc: out_mant = 7'h37;
              4'hd: out_mant = 7'h37;
              4'he: out_mant = 7'h38;
              4'hf: out_mant = 7'h38;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h39;
            case (mant_lo4)
              4'h0: out_mant = 7'h38;
              4'h1: out_mant = 7'h38;
              4'h2: out_mant = 7'h38;
              4'h8: out_mant = 7'h3a;
              4'h9: out_mant = 7'h3a;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h3a;
              4'hc: out_mant = 7'h3a;
              4'hd: out_mant = 7'h3b;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h0: out_mant = 7'h3b;
              4'h4: out_mant = 7'h3d;
              4'h5: out_mant = 7'h3d;
              4'h6: out_mant = 7'h3d;
              4'h7: out_mant = 7'h3e;
              4'h8: out_mant = 7'h3e;
              4'h9: out_mant = 7'h3f;
              4'ha: out_mant = 7'h3f;
              4'hb: out_mant = 7'h3f;
              4'hc: out_mant = 7'h40;
              4'hd: out_mant = 7'h40;
              4'he: out_mant = 7'h41;
              4'hf: out_mant = 7'h41;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h4: out_mant = 7'h43;
              4'h5: out_mant = 7'h43;
              4'h6: out_mant = 7'h43;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h44;
              4'h9: out_mant = 7'h45;
              4'ha: out_mant = 7'h45;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h46;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h46;
              4'hf: out_mant = 7'h47;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h0: out_mant = 7'h47;
              4'h1: out_mant = 7'h47;
              4'h5: out_mant = 7'h49;
              4'h6: out_mant = 7'h49;
              4'h7: out_mant = 7'h49;
              4'h8: out_mant = 7'h4a;
              4'h9: out_mant = 7'h4a;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h0: out_mant = 7'h4c;
              4'h1: out_mant = 7'h4d;
              4'h2: out_mant = 7'h4d;
              4'h3: out_mant = 7'h4d;
              4'h4: out_mant = 7'h4e;
              4'h5: out_mant = 7'h4e;
              4'h6: out_mant = 7'h4e;
              4'hb: out_mant = 7'h50;
              4'hc: out_mant = 7'h50;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h53;
              4'h7: out_mant = 7'h53;
              4'h8: out_mant = 7'h54;
              4'h9: out_mant = 7'h54;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h54;
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h55;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h0: out_mant = 7'h56;
              4'h1: out_mant = 7'h56;
              4'h2: out_mant = 7'h56;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h57;
              4'h5: out_mant = 7'h57;
              4'ha: out_mant = 7'h59;
              4'hb: out_mant = 7'h59;
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h59;
              4'he: out_mant = 7'h5a;
              4'hf: out_mant = 7'h5a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h0: out_mant = 7'h5a;
              4'h1: out_mant = 7'h5a;
              4'h2: out_mant = 7'h5b;
              4'h3: out_mant = 7'h5b;
              4'h4: out_mant = 7'h5b;
              4'h5: out_mant = 7'h5b;
              4'h6: out_mant = 7'h5c;
              4'h7: out_mant = 7'h5c;
              4'h8: out_mant = 7'h5c;
              4'h9: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h60;
            case (mant_lo4)
              4'h0: out_mant = 7'h5e;
              4'h1: out_mant = 7'h5e;
              4'h2: out_mant = 7'h5e;
              4'h3: out_mant = 7'h5f;
              4'h4: out_mant = 7'h5f;
              4'h5: out_mant = 7'h5f;
              4'h6: out_mant = 7'h5f;
              4'hc: out_mant = 7'h61;
              4'hd: out_mant = 7'h61;
              4'he: out_mant = 7'h61;
              4'hf: out_mant = 7'h61;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h0: out_mant = 7'h61;
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h62;
              4'h3: out_mant = 7'h63;
              4'h4: out_mant = 7'h63;
              4'h8: out_mant = 7'h65;
              4'h9: out_mant = 7'h65;
              4'ha: out_mant = 7'h65;
              4'hb: out_mant = 7'h66;
              4'hc: out_mant = 7'h66;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h68;
              4'h1: out_mant = 7'h68;
              4'h2: out_mant = 7'h68;
              4'h3: out_mant = 7'h69;
              4'h4: out_mant = 7'h69;
              4'h5: out_mant = 7'h69;
              4'h6: out_mant = 7'h6a;
              4'h7: out_mant = 7'h6a;
              4'h8: out_mant = 7'h6a;
              4'hd: out_mant = 7'h6c;
              4'he: out_mant = 7'h6c;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h4: out_mant = 7'h6e;
              4'h5: out_mant = 7'h6e;
              4'h6: out_mant = 7'h6e;
              4'h7: out_mant = 7'h6e;
              4'h8: out_mant = 7'h6f;
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h70;
              4'hd: out_mant = 7'h70;
              4'he: out_mant = 7'h70;
              4'hf: out_mant = 7'h70;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h0: out_mant = 7'h71;
              4'h1: out_mant = 7'h71;
              4'h2: out_mant = 7'h71;
              4'h3: out_mant = 7'h71;
              4'h4: out_mant = 7'h71;
              4'h5: out_mant = 7'h72;
              4'h6: out_mant = 7'h72;
              4'h7: out_mant = 7'h72;
              4'h8: out_mant = 7'h72;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h0: out_mant = 7'h74;
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h74;
              4'h3: out_mant = 7'h74;
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
            out_mant = 7'h78;
            case (mant_lo4)
              4'h0: out_mant = 7'h76;
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h77;
              4'h5: out_mant = 7'h77;
              4'h6: out_mant = 7'h77;
              4'h7: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h0: out_mant = 7'h78;
              4'ha: out_mant = 7'h7a;
              4'hb: out_mant = 7'h7a;
              4'hc: out_mant = 7'h7a;
              4'hd: out_mant = 7'h7a;
              4'he: out_mant = 7'h7a;
              4'hf: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              4'h1: out_mant = 7'h7a;
              4'h2: out_mant = 7'h7a;
              4'h3: out_mant = 7'h7a;
              4'h4: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h0: out_mant = 7'h7b;
              4'h9: out_mant = 7'h7d;
              4'ha: out_mant = 7'h7d;
              4'hb: out_mant = 7'h7d;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h7d;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'h0: out_mant = 7'h7d;
              4'h1: out_mant = 7'h7d;
              4'h2: out_mant = 7'h7d;
              4'h3: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7f;
          end
          3'h4: begin
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
          3'h5: begin
            out_mant = 7'h00;
          end
          3'h6: begin
            out_mant = 7'h00;
          end
          3'h7: begin
            out_mant = 7'h00;
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
      9'h177: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7f;
          end
          3'h2: begin
            out_mant = 7'h7f;
          end
          3'h3: begin
            out_mant = 7'h7f;
          end
          3'h4: begin
            out_mant = 7'h7f;
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
      9'h178: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
          end
          3'h1: begin
            out_mant = 7'h7f;
          end
          3'h2: begin
            out_mant = 7'h7f;
          end
          3'h3: begin
            out_mant = 7'h7f;
          end
          3'h4: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'h0: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7e;
          end
          3'h6: begin
            out_mant = 7'h7e;
          end
          3'h7: begin
            out_mant = 7'h7e;
          end
          default: begin end
        endcase
      end
      9'h179: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7e;
          end
          3'h1: begin
            out_mant = 7'h7e;
          end
          3'h2: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7d;
          end
          3'h4: begin
            out_mant = 7'h7d;
          end
          3'h5: begin
            out_mant = 7'h7d;
          end
          3'h6: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h0: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7c;
          end
          default: begin end
        endcase
      end
      9'h17a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7c;
          end
          3'h1: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h7b;
          end
          3'h3: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h0: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h7a;
          end
          3'h5: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h79;
          end
          3'h7: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'h9: out_mant = 7'h77;
              4'ha: out_mant = 7'h77;
              4'hb: out_mant = 7'h77;
              4'hc: out_mant = 7'h77;
              4'hd: out_mant = 7'h77;
              4'he: out_mant = 7'h77;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h77;
            case (mant_lo4)
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
          3'h2: begin
            out_mant = 7'h76;
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
          3'h3: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h9: out_mant = 7'h74;
              4'ha: out_mant = 7'h74;
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h9: out_mant = 7'h73;
              4'ha: out_mant = 7'h73;
              4'hb: out_mant = 7'h73;
              4'hc: out_mant = 7'h73;
              4'hd: out_mant = 7'h73;
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'h9: out_mant = 7'h72;
              4'ha: out_mant = 7'h72;
              4'hb: out_mant = 7'h72;
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
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
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h0: out_mant = 7'h70;
              4'h1: out_mant = 7'h70;
              4'h2: out_mant = 7'h70;
              4'h3: out_mant = 7'h70;
              4'h4: out_mant = 7'h70;
              4'hd: out_mant = 7'h6e;
              4'he: out_mant = 7'h6e;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6d;
            case (mant_lo4)
              4'h0: out_mant = 7'h6e;
              4'h1: out_mant = 7'h6e;
              4'h2: out_mant = 7'h6e;
              4'h3: out_mant = 7'h6e;
              4'h4: out_mant = 7'h6e;
              4'hd: out_mant = 7'h6c;
              4'he: out_mant = 7'h6c;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h0: out_mant = 7'h6c;
              4'h1: out_mant = 7'h6c;
              4'h2: out_mant = 7'h6c;
              4'h3: out_mant = 7'h6c;
              4'h4: out_mant = 7'h6c;
              4'hd: out_mant = 7'h6a;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h6a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h0: out_mant = 7'h6a;
              4'h1: out_mant = 7'h6a;
              4'h2: out_mant = 7'h6a;
              4'h3: out_mant = 7'h6a;
              4'h4: out_mant = 7'h6a;
              4'hd: out_mant = 7'h68;
              4'he: out_mant = 7'h68;
              4'hf: out_mant = 7'h68;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'h0: out_mant = 7'h68;
              4'h1: out_mant = 7'h68;
              4'h2: out_mant = 7'h68;
              4'h3: out_mant = 7'h68;
              4'h4: out_mant = 7'h68;
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h0: out_mant = 7'h66;
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h66;
              4'h3: out_mant = 7'h66;
              4'h4: out_mant = 7'h66;
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h64;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'h0: out_mant = 7'h64;
              4'h1: out_mant = 7'h64;
              4'h2: out_mant = 7'h64;
              4'h3: out_mant = 7'h64;
              4'h4: out_mant = 7'h64;
              4'he: out_mant = 7'h62;
              4'hf: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              4'h2: out_mant = 7'h62;
              4'h3: out_mant = 7'h62;
              4'h4: out_mant = 7'h62;
              4'h5: out_mant = 7'h62;
              4'he: out_mant = 7'h60;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h0: out_mant = 7'h60;
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h60;
              4'h7: out_mant = 7'h5e;
              4'h8: out_mant = 7'h5e;
              4'h9: out_mant = 7'h5e;
              4'ha: out_mant = 7'h5e;
              4'hb: out_mant = 7'h5d;
              4'hc: out_mant = 7'h5d;
              4'hd: out_mant = 7'h5d;
              4'he: out_mant = 7'h5d;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5c;
            case (mant_lo4)
              4'h4: out_mant = 7'h5b;
              4'h5: out_mant = 7'h5b;
              4'h6: out_mant = 7'h5b;
              4'h7: out_mant = 7'h5b;
              4'h8: out_mant = 7'h5a;
              4'h9: out_mant = 7'h5a;
              4'ha: out_mant = 7'h5a;
              4'hb: out_mant = 7'h5a;
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h59;
              4'he: out_mant = 7'h59;
              4'hf: out_mant = 7'h59;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h4: out_mant = 7'h57;
              4'h5: out_mant = 7'h57;
              4'h6: out_mant = 7'h57;
              4'h7: out_mant = 7'h57;
              4'h8: out_mant = 7'h56;
              4'h9: out_mant = 7'h56;
              4'ha: out_mant = 7'h56;
              4'hb: out_mant = 7'h56;
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h55;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h55;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h52;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h54;
              4'h3: out_mant = 7'h54;
              4'h4: out_mant = 7'h53;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h53;
              4'h7: out_mant = 7'h53;
              4'hd: out_mant = 7'h51;
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
              4'h8: out_mant = 7'h4f;
              4'h9: out_mant = 7'h4e;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4d;
              4'he: out_mant = 7'h4d;
              4'hf: out_mant = 7'h4d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4c;
            case (mant_lo4)
              4'h0: out_mant = 7'h4d;
              4'h6: out_mant = 7'h4b;
              4'h7: out_mant = 7'h4b;
              4'h8: out_mant = 7'h4b;
              4'h9: out_mant = 7'h4b;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h4a;
              4'hc: out_mant = 7'h4a;
              4'hd: out_mant = 7'h4a;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h46;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h49;
              4'h2: out_mant = 7'h48;
              4'h3: out_mant = 7'h48;
              4'h4: out_mant = 7'h48;
              4'h5: out_mant = 7'h48;
              4'h6: out_mant = 7'h47;
              4'h7: out_mant = 7'h47;
              4'h8: out_mant = 7'h47;
              4'h9: out_mant = 7'h47;
              4'hf: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h0: out_mant = 7'h45;
              4'h1: out_mant = 7'h45;
              4'h2: out_mant = 7'h45;
              4'h3: out_mant = 7'h44;
              4'h4: out_mant = 7'h44;
              4'h5: out_mant = 7'h44;
              4'h6: out_mant = 7'h44;
              4'h7: out_mant = 7'h43;
              4'h8: out_mant = 7'h43;
              4'h9: out_mant = 7'h43;
              4'ha: out_mant = 7'h43;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h40;
              4'h3: out_mant = 7'h40;
              4'h4: out_mant = 7'h3f;
              4'h5: out_mant = 7'h3f;
              4'h9: out_mant = 7'h3d;
              4'ha: out_mant = 7'h3d;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h3b;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h1: out_mant = 7'h39;
              4'h2: out_mant = 7'h39;
              4'h6: out_mant = 7'h37;
              4'h7: out_mant = 7'h37;
              4'h8: out_mant = 7'h36;
              4'h9: out_mant = 7'h36;
              4'ha: out_mant = 7'h35;
              4'hb: out_mant = 7'h35;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h33;
              4'hf: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h0: out_mant = 7'h33;
              4'h1: out_mant = 7'h32;
              4'h2: out_mant = 7'h32;
              4'h3: out_mant = 7'h31;
              4'h4: out_mant = 7'h31;
              4'h5: out_mant = 7'h30;
              4'h6: out_mant = 7'h30;
              4'h7: out_mant = 7'h2f;
              4'h8: out_mant = 7'h2f;
              4'hc: out_mant = 7'h2d;
              4'hd: out_mant = 7'h2d;
              4'he: out_mant = 7'h2c;
              4'hf: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h2b;
              4'h1: out_mant = 7'h2b;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h29;
              4'h7: out_mant = 7'h28;
              4'h8: out_mant = 7'h28;
              4'h9: out_mant = 7'h27;
              4'ha: out_mant = 7'h27;
              4'hb: out_mant = 7'h26;
              4'hc: out_mant = 7'h26;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h25;
              4'hf: out_mant = 7'h25;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h24;
              4'h1: out_mant = 7'h24;
              4'h5: out_mant = 7'h22;
              4'h6: out_mant = 7'h22;
              4'h7: out_mant = 7'h21;
              4'h8: out_mant = 7'h21;
              4'h9: out_mant = 7'h20;
              4'ha: out_mant = 7'h20;
              4'hb: out_mant = 7'h20;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h3: out_mant = 7'h1c;
              4'h4: out_mant = 7'h1c;
              4'h5: out_mant = 7'h1b;
              4'h6: out_mant = 7'h1b;
              4'h7: out_mant = 7'h1a;
              4'h8: out_mant = 7'h1a;
              4'h9: out_mant = 7'h1a;
              4'ha: out_mant = 7'h19;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h18;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h15;
            case (mant_lo4)
              4'h0: out_mant = 7'h17;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              4'h6: out_mant = 7'h14;
              4'h7: out_mant = 7'h14;
              4'h8: out_mant = 7'h13;
              4'h9: out_mant = 7'h13;
              4'ha: out_mant = 7'h13;
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h11;
              4'he: out_mant = 7'h11;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              4'h1: out_mant = 7'h10;
              4'h2: out_mant = 7'h0f;
              4'h3: out_mant = 7'h0f;
              4'h7: out_mant = 7'h0d;
              4'h8: out_mant = 7'h0d;
              4'h9: out_mant = 7'h0c;
              4'ha: out_mant = 7'h0c;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h0b;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h09;
              4'h2: out_mant = 7'h08;
              4'h5: out_mant = 7'h06;
              4'h6: out_mant = 7'h05;
              4'h7: out_mant = 7'h04;
              4'h8: out_mant = 7'h03;
              4'h9: out_mant = 7'h03;
              4'ha: out_mant = 7'h02;
              4'hb: out_mant = 7'h01;
              4'hc: out_mant = 7'h00;
              4'hd: out_mant = 7'h7f;
              4'he: out_mant = 7'h7e;
              4'hf: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h1: out_mant = 7'h79;
              4'h2: out_mant = 7'h78;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h75;
              4'h5: out_mant = 7'h74;
              4'h6: out_mant = 7'h72;
              4'h7: out_mant = 7'h71;
              4'h8: out_mant = 7'h6f;
              4'h9: out_mant = 7'h6e;
              4'ha: out_mant = 7'h6c;
              4'hb: out_mant = 7'h6b;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h68;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h65;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h1: out_mant = 7'h63;
              4'h2: out_mant = 7'h61;
              4'h3: out_mant = 7'h60;
              4'h4: out_mant = 7'h5f;
              4'h5: out_mant = 7'h5d;
              4'h6: out_mant = 7'h5c;
              4'h7: out_mant = 7'h5a;
              4'h8: out_mant = 7'h59;
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h56;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h54;
              4'hd: out_mant = 7'h53;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h50;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h4f;
            case (mant_lo4)
              4'h1: out_mant = 7'h4d;
              4'h2: out_mant = 7'h4c;
              4'h3: out_mant = 7'h4b;
              4'h4: out_mant = 7'h4a;
              4'h5: out_mant = 7'h48;
              4'h6: out_mant = 7'h47;
              4'h7: out_mant = 7'h46;
              4'h8: out_mant = 7'h45;
              4'h9: out_mant = 7'h43;
              4'ha: out_mant = 7'h42;
              4'hb: out_mant = 7'h41;
              4'hc: out_mant = 7'h40;
              4'hd: out_mant = 7'h3e;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h38;
              4'h3: out_mant = 7'h37;
              4'h4: out_mant = 7'h36;
              4'h5: out_mant = 7'h35;
              4'h6: out_mant = 7'h34;
              4'h7: out_mant = 7'h33;
              4'h8: out_mant = 7'h31;
              4'h9: out_mant = 7'h30;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h2e;
              4'hc: out_mant = 7'h2d;
              4'hd: out_mant = 7'h2c;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h1: out_mant = 7'h27;
              4'h2: out_mant = 7'h26;
              4'h3: out_mant = 7'h25;
              4'h4: out_mant = 7'h24;
              4'h5: out_mant = 7'h23;
              4'h6: out_mant = 7'h22;
              4'h7: out_mant = 7'h21;
              4'h8: out_mant = 7'h20;
              4'h9: out_mant = 7'h1f;
              4'ha: out_mant = 7'h1e;
              4'hb: out_mant = 7'h1d;
              4'hc: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1b;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h1: out_mant = 7'h17;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h15;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h13;
              4'h6: out_mant = 7'h12;
              4'h7: out_mant = 7'h11;
              4'h8: out_mant = 7'h10;
              4'h9: out_mant = 7'h0f;
              4'ha: out_mant = 7'h0e;
              4'hb: out_mant = 7'h0d;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h0b;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h06;
              4'h5: out_mant = 7'h04;
              4'h6: out_mant = 7'h03;
              4'h7: out_mant = 7'h02;
              4'h8: out_mant = 7'h01;
              4'h9: out_mant = 7'h00;
              4'ha: out_mant = 7'h7e;
              4'hb: out_mant = 7'h7d;
              4'hc: out_mant = 7'h7b;
              4'hd: out_mant = 7'h79;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'h1: out_mant = 7'h71;
              4'h2: out_mant = 7'h6d;
              4'h3: out_mant = 7'h6a;
              4'h4: out_mant = 7'h67;
              4'h5: out_mant = 7'h64;
              4'h6: out_mant = 7'h61;
              4'h7: out_mant = 7'h5e;
              4'h8: out_mant = 7'h5b;
              4'h9: out_mant = 7'h57;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h4f;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h49;
              4'hf: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h3e;
              4'h3: out_mant = 7'h3b;
              4'h4: out_mant = 7'h39;
              4'h5: out_mant = 7'h36;
              4'h6: out_mant = 7'h33;
              4'h7: out_mant = 7'h31;
              4'h8: out_mant = 7'h2e;
              4'h9: out_mant = 7'h2c;
              4'ha: out_mant = 7'h29;
              4'hb: out_mant = 7'h27;
              4'hc: out_mant = 7'h25;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h1: out_mant = 7'h19;
              4'h2: out_mant = 7'h17;
              4'h3: out_mant = 7'h15;
              4'h4: out_mant = 7'h13;
              4'h5: out_mant = 7'h11;
              4'h6: out_mant = 7'h0e;
              4'h7: out_mant = 7'h0c;
              4'h8: out_mant = 7'h0a;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h06;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h02;
              4'hd: out_mant = 7'h01;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'h1: out_mant = 7'h73;
              4'h2: out_mant = 7'h6f;
              4'h3: out_mant = 7'h6b;
              4'h4: out_mant = 7'h68;
              4'h5: out_mant = 7'h65;
              4'h6: out_mant = 7'h61;
              4'h7: out_mant = 7'h5e;
              4'h8: out_mant = 7'h5b;
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h51;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h48;
              4'hf: out_mant = 7'h45;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h42;
            case (mant_lo4)
              4'h1: out_mant = 7'h3f;
              4'h2: out_mant = 7'h3d;
              4'h3: out_mant = 7'h3a;
              4'h4: out_mant = 7'h37;
              4'h5: out_mant = 7'h34;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h2f;
              4'h8: out_mant = 7'h2c;
              4'h9: out_mant = 7'h2a;
              4'ha: out_mant = 7'h27;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h20;
              4'he: out_mant = 7'h1e;
              4'hf: out_mant = 7'h1b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h1: out_mant = 7'h17;
              4'h2: out_mant = 7'h14;
              4'h3: out_mant = 7'h12;
              4'h4: out_mant = 7'h10;
              4'h5: out_mant = 7'h0e;
              4'h6: out_mant = 7'h0c;
              4'h7: out_mant = 7'h0a;
              4'h8: out_mant = 7'h08;
              4'h9: out_mant = 7'h05;
              4'ha: out_mant = 7'h03;
              4'hb: out_mant = 7'h02;
              4'hc: out_mant = 7'h7f;
              4'hd: out_mant = 7'h7b;
              4'he: out_mant = 7'h78;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'h1: out_mant = 7'h6d;
              4'h2: out_mant = 7'h69;
              4'h3: out_mant = 7'h65;
              4'h4: out_mant = 7'h62;
              4'h5: out_mant = 7'h5f;
              4'h6: out_mant = 7'h5b;
              4'h7: out_mant = 7'h58;
              4'h8: out_mant = 7'h55;
              4'h9: out_mant = 7'h51;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h48;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h42;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h1: out_mant = 7'h39;
              4'h2: out_mant = 7'h37;
              4'h3: out_mant = 7'h34;
              4'h4: out_mant = 7'h31;
              4'h5: out_mant = 7'h2e;
              4'h6: out_mant = 7'h2c;
              4'h7: out_mant = 7'h29;
              4'h8: out_mant = 7'h27;
              4'h9: out_mant = 7'h24;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1d;
              4'hd: out_mant = 7'h1a;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h1: out_mant = 7'h0f;
              4'h2: out_mant = 7'h0b;
              4'h3: out_mant = 7'h06;
              4'h4: out_mant = 7'h02;
              4'h5: out_mant = 7'h7d;
              4'h6: out_mant = 7'h75;
              4'h7: out_mant = 7'h6e;
              4'h8: out_mant = 7'h66;
              4'h9: out_mant = 7'h5f;
              4'ha: out_mant = 7'h59;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h1: out_mant = 7'h2f;
              4'h2: out_mant = 7'h29;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h1f;
              4'h5: out_mant = 7'h1a;
              4'h6: out_mant = 7'h16;
              4'h7: out_mant = 7'h11;
              4'h8: out_mant = 7'h0d;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h04;
              4'hb: out_mant = 7'h00;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h71;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h62;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5b;
            case (mant_lo4)
              4'h1: out_mant = 7'h55;
              4'h2: out_mant = 7'h4e;
              4'h3: out_mant = 7'h48;
              4'h4: out_mant = 7'h42;
              4'h5: out_mant = 7'h3c;
              4'h6: out_mant = 7'h36;
              4'h7: out_mant = 7'h30;
              4'h8: out_mant = 7'h2b;
              4'h9: out_mant = 7'h26;
              4'ha: out_mant = 7'h21;
              4'hb: out_mant = 7'h1c;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'h1: out_mant = 7'h01;
              4'h2: out_mant = 7'h7b;
              4'h3: out_mant = 7'h73;
              4'h4: out_mant = 7'h6c;
              4'h5: out_mant = 7'h64;
              4'h6: out_mant = 7'h5d;
              4'h7: out_mant = 7'h57;
              4'h8: out_mant = 7'h50;
              4'h9: out_mant = 7'h4a;
              4'ha: out_mant = 7'h43;
              4'hb: out_mant = 7'h3d;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h32;
              4'he: out_mant = 7'h2c;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h22;
            case (mant_lo4)
              4'h1: out_mant = 7'h1d;
              4'h2: out_mant = 7'h18;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h0f;
              4'h5: out_mant = 7'h0b;
              4'h6: out_mant = 7'h06;
              4'h7: out_mant = 7'h02;
              4'h8: out_mant = 7'h7d;
              4'h9: out_mant = 7'h75;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h66;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h1: out_mant = 7'h3f;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h33;
              4'h4: out_mant = 7'h2e;
              4'h5: out_mant = 7'h28;
              4'h6: out_mant = 7'h23;
              4'h7: out_mant = 7'h1e;
              4'h8: out_mant = 7'h19;
              4'h9: out_mant = 7'h15;
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h7e;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h60;
              4'h3: out_mant = 7'h59;
              4'h4: out_mant = 7'h53;
              4'h5: out_mant = 7'h4c;
              4'h6: out_mant = 7'h46;
              4'h7: out_mant = 7'h40;
              4'h8: out_mant = 7'h3a;
              4'h9: out_mant = 7'h34;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h29;
              4'hc: out_mant = 7'h24;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h1: out_mant = 7'h0c;
              4'h2: out_mant = 7'h08;
              4'h3: out_mant = 7'h04;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h78;
              4'h6: out_mant = 7'h70;
              4'h7: out_mant = 7'h69;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h5b;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h47;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h1b;
              4'h3: out_mant = 7'h12;
              4'h4: out_mant = 7'h09;
              4'h5: out_mant = 7'h01;
              4'h6: out_mant = 7'h72;
              4'h7: out_mant = 7'h63;
              4'h8: out_mant = 7'h55;
              4'h9: out_mant = 7'h48;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h26;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h1: out_mant = 7'h73;
              4'h2: out_mant = 7'h64;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h4a;
              4'h5: out_mant = 7'h3d;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h27;
              4'h8: out_mant = 7'h1d;
              4'h9: out_mant = 7'h13;
              4'ha: out_mant = 7'h0b;
              4'hb: out_mant = 7'h02;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h1: out_mant = 7'h33;
              4'h2: out_mant = 7'h28;
              4'h3: out_mant = 7'h1e;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h0b;
              4'h6: out_mant = 7'h03;
              4'h7: out_mant = 7'h76;
              4'h8: out_mant = 7'h67;
              4'h9: out_mant = 7'h59;
              4'ha: out_mant = 7'h4c;
              4'hb: out_mant = 7'h3f;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h29;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h68;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h4d;
              4'h6: out_mant = 7'h41;
              4'h7: out_mant = 7'h35;
              4'h8: out_mant = 7'h2a;
              4'h9: out_mant = 7'h20;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h0d;
              4'hd: out_mant = 7'h79;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h42;
              4'h2: out_mant = 7'h36;
              4'h3: out_mant = 7'h2b;
              4'h5: out_mant = 7'h17;
              4'h6: out_mant = 7'h0e;
              4'h7: out_mant = 7'h05;
              4'h8: out_mant = 7'h7a;
              4'h9: out_mant = 7'h6b;
              4'ha: out_mant = 7'h5d;
              4'hb: out_mant = 7'h4f;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h37;
              4'he: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h06;
              4'h3: out_mant = 7'h7c;
              4'h4: out_mant = 7'h6c;
              4'h5: out_mant = 7'h5e;
              4'h6: out_mant = 7'h51;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h38;
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h1: out_mant = 7'h52;
              4'h2: out_mant = 7'h45;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h2e;
              4'h5: out_mant = 7'h23;
              4'h6: out_mant = 7'h19;
              4'h7: out_mant = 7'h10;
              4'h8: out_mant = 7'h07;
              4'h9: out_mant = 7'h7e;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h53;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h11;
              4'h3: out_mant = 7'h08;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h70;
              4'h6: out_mant = 7'h62;
              4'h7: out_mant = 7'h54;
              4'h8: out_mant = 7'h47;
              4'h9: out_mant = 7'h3b;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h1b;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h09;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'h1: out_mant = 7'h55;
              4'h2: out_mant = 7'h3c;
              4'h3: out_mant = 7'h26;
              4'h4: out_mant = 7'h13;
              4'h5: out_mant = 7'h01;
              4'h6: out_mant = 7'h64;
              4'h7: out_mant = 7'h49;
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h1d;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h3e;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h4c;
              4'h3: out_mant = 7'h34;
              4'h4: out_mant = 7'h1f;
              4'h5: out_mant = 7'h0c;
              4'h6: out_mant = 7'h77;
              4'h7: out_mant = 7'h5a;
              4'h8: out_mant = 7'h41;
              4'h9: out_mant = 7'h2a;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h1: out_mant = 7'h7a;
              4'h2: out_mant = 7'h5d;
              4'h3: out_mant = 7'h43;
              4'h4: out_mant = 7'h2c;
              4'h5: out_mant = 7'h18;
              4'h6: out_mant = 7'h06;
              4'h7: out_mant = 7'h6c;
              4'h8: out_mant = 7'h50;
              4'h9: out_mant = 7'h38;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h0f;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h6f;
              4'h3: out_mant = 7'h53;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h00;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h47;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h1b;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h1: out_mant = 7'h13;
              4'h2: out_mant = 7'h01;
              4'h3: out_mant = 7'h64;
              4'h4: out_mant = 7'h49;
              4'h5: out_mant = 7'h32;
              4'h6: out_mant = 7'h1d;
              4'h7: out_mant = 7'h0a;
              4'h8: out_mant = 7'h74;
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h3e;
              4'hb: out_mant = 7'h28;
              4'hc: out_mant = 7'h14;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h1: out_mant = 7'h1f;
              4'h2: out_mant = 7'h0c;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h40;
              4'h6: out_mant = 7'h2a;
              4'h7: out_mant = 7'h16;
              4'h8: out_mant = 7'h04;
              4'h9: out_mant = 7'h69;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h36;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h7a;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h1: out_mant = 7'h2c;
              4'h2: out_mant = 7'h18;
              4'h3: out_mant = 7'h06;
              4'h4: out_mant = 7'h6c;
              4'h5: out_mant = 7'h50;
              4'h6: out_mant = 7'h38;
              4'h7: out_mant = 7'h22;
              4'h8: out_mant = 7'h0f;
              4'h9: out_mant = 7'h7d;
              4'ha: out_mant = 7'h5f;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h24;
              4'h3: out_mant = 7'h11;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h62;
              4'h6: out_mant = 7'h47;
              4'h7: out_mant = 7'h30;
              4'h8: out_mant = 7'h1b;
              4'h9: out_mant = 7'h09;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h1: out_mant = 7'h32;
              4'h2: out_mant = 7'h0a;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h03;
              4'h6: out_mant = 7'h4c;
              4'h7: out_mant = 7'h1f;
              4'h8: out_mant = 7'h77;
              4'h9: out_mant = 7'h40;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h1: out_mant = 7'h50;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h7d;
              4'h4: out_mant = 7'h45;
              4'h5: out_mant = 7'h19;
              4'h6: out_mant = 7'h6f;
              4'h7: out_mant = 7'h3a;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h61;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h09;
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h3e;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h67;
              4'h5: out_mant = 7'h34;
              4'h6: out_mant = 7'h0c;
              4'h7: out_mant = 7'h5a;
              4'h8: out_mant = 7'h2a;
              4'h9: out_mant = 7'h04;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h20;
              4'hc: out_mant = 7'h7a;
              4'hd: out_mant = 7'h42;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h1: out_mant = 7'h0f;
              4'h2: out_mant = 7'h5f;
              4'h3: out_mant = 7'h2e;
              4'h4: out_mant = 7'h07;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h24;
              4'h7: out_mant = 7'h7f;
              4'h8: out_mant = 7'h47;
              4'h9: out_mant = 7'h1b;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h03;
              4'h3: out_mant = 7'h4b;
              4'h4: out_mant = 7'h1e;
              4'h5: out_mant = 7'h77;
              4'h6: out_mant = 7'h40;
              4'h7: out_mant = 7'h16;
              4'h8: out_mant = 7'h69;
              4'h9: out_mant = 7'h36;
              4'ha: out_mant = 7'h0d;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h2c;
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h1: out_mant = 7'h45;
              4'h2: out_mant = 7'h19;
              4'h3: out_mant = 7'h6e;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h11;
              4'h6: out_mant = 7'h61;
              4'h7: out_mant = 7'h2f;
              4'h8: out_mant = 7'h09;
              4'h9: out_mant = 7'h55;
              4'ha: out_mant = 7'h26;
              4'hb: out_mant = 7'h01;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h33;
              4'h3: out_mant = 7'h0c;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h2a;
              4'h6: out_mant = 7'h04;
              4'h7: out_mant = 7'h4e;
              4'h8: out_mant = 7'h20;
              4'h9: out_mant = 7'h7a;
              4'ha: out_mant = 7'h42;
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h6c;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h52;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h7f;
              4'h5: out_mant = 7'h47;
              4'h6: out_mant = 7'h1b;
              4'h7: out_mant = 7'h71;
              4'h8: out_mant = 7'h3c;
              4'h9: out_mant = 7'h12;
              4'ha: out_mant = 7'h64;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h5c;
              4'h5: out_mant = 7'h06;
              4'h6: out_mant = 7'h22;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h6e;
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h01;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h3e;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h4e;
              4'h3: out_mant = 7'h79;
              4'h4: out_mant = 7'h17;
              4'h5: out_mant = 7'h37;
              4'h6: out_mant = 7'h5f;
              4'h7: out_mant = 7'h07;
              4'h8: out_mant = 7'h24;
              4'h9: out_mant = 7'h47;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h31;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h0d;
              4'h3: out_mant = 7'h2b;
              4'h4: out_mant = 7'h50;
              4'h5: out_mant = 7'h7c;
              4'h6: out_mant = 7'h19;
              4'h7: out_mant = 7'h39;
              4'h8: out_mant = 7'h61;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h26;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h33;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
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
            out_mant = 7'h00;
          end
          default: begin end
        endcase
      end
      9'h1ff: begin
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
  assign out = {1'b0, out_exp, out_mant};
endmodule
