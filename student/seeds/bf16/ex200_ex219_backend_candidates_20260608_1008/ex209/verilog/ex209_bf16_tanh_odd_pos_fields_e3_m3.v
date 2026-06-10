module ex209_bf16_tanh_odd_pos_fields_e3_m3(in, out);
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
  wire sign = in[15];
  wire [7:0] exp = in[14:7];
  reg [7:0] out_exp;
  reg [6:0] out_mant;
  reg is_nan;
  always @* begin
    out_exp = 8'h7f;
    casez (exp)
      8'b00000000: out_exp = 8'h00;
      8'b00000001: out_exp = 8'h01;
      8'b00000010: out_exp = 8'h02;
      8'b00000011: out_exp = 8'h03;
      8'b00000100: out_exp = 8'h04;
      8'b00000101: out_exp = 8'h05;
      8'b00000110: out_exp = 8'h06;
      8'b00000111: out_exp = 8'h07;
      8'b00001000: out_exp = 8'h08;
      8'b00001001: out_exp = 8'h09;
      8'b00001010: out_exp = 8'h0a;
      8'b00001011: out_exp = 8'h0b;
      8'b00001100: out_exp = 8'h0c;
      8'b00001101: out_exp = 8'h0d;
      8'b00001110: out_exp = 8'h0e;
      8'b00001111: out_exp = 8'h0f;
      8'b00010000: out_exp = 8'h10;
      8'b00010001: out_exp = 8'h11;
      8'b00010010: out_exp = 8'h12;
      8'b00010011: out_exp = 8'h13;
      8'b00010100: out_exp = 8'h14;
      8'b00010101: out_exp = 8'h15;
      8'b00010110: out_exp = 8'h16;
      8'b00010111: out_exp = 8'h17;
      8'b00011000: out_exp = 8'h18;
      8'b00011001: out_exp = 8'h19;
      8'b00011010: out_exp = 8'h1a;
      8'b00011011: out_exp = 8'h1b;
      8'b00011100: out_exp = 8'h1c;
      8'b00011101: out_exp = 8'h1d;
      8'b00011110: out_exp = 8'h1e;
      8'b00011111: out_exp = 8'h1f;
      8'b00100000: out_exp = 8'h20;
      8'b00100001: out_exp = 8'h21;
      8'b00100010: out_exp = 8'h22;
      8'b00100011: out_exp = 8'h23;
      8'b00100100: out_exp = 8'h24;
      8'b00100101: out_exp = 8'h25;
      8'b00100110: out_exp = 8'h26;
      8'b00100111: out_exp = 8'h27;
      8'b00101000: out_exp = 8'h28;
      8'b00101001: out_exp = 8'h29;
      8'b00101010: out_exp = 8'h2a;
      8'b00101011: out_exp = 8'h2b;
      8'b00101100: out_exp = 8'h2c;
      8'b00101101: out_exp = 8'h2d;
      8'b00101110: out_exp = 8'h2e;
      8'b00101111: out_exp = 8'h2f;
      8'b00110000: out_exp = 8'h30;
      8'b00110001: out_exp = 8'h31;
      8'b00110010: out_exp = 8'h32;
      8'b00110011: out_exp = 8'h33;
      8'b00110100: out_exp = 8'h34;
      8'b00110101: out_exp = 8'h35;
      8'b00110110: out_exp = 8'h36;
      8'b00110111: out_exp = 8'h37;
      8'b00111000: out_exp = 8'h38;
      8'b00111001: out_exp = 8'h39;
      8'b00111010: out_exp = 8'h3a;
      8'b00111011: out_exp = 8'h3b;
      8'b00111100: out_exp = 8'h3c;
      8'b00111101: out_exp = 8'h3d;
      8'b00111110: out_exp = 8'h3e;
      8'b00111111: out_exp = 8'h3f;
      8'b01000000: out_exp = 8'h40;
      8'b01000001: out_exp = 8'h41;
      8'b01000010: out_exp = 8'h42;
      8'b01000011: out_exp = 8'h43;
      8'b01000100: out_exp = 8'h44;
      8'b01000101: out_exp = 8'h45;
      8'b01000110: out_exp = 8'h46;
      8'b01000111: out_exp = 8'h47;
      8'b01001000: out_exp = 8'h48;
      8'b01001001: out_exp = 8'h49;
      8'b01001010: out_exp = 8'h4a;
      8'b01001011: out_exp = 8'h4b;
      8'b01001100: out_exp = 8'h4c;
      8'b01001101: out_exp = 8'h4d;
      8'b01001110: out_exp = 8'h4e;
      8'b01001111: out_exp = 8'h4f;
      8'b01010000: out_exp = 8'h50;
      8'b01010001: out_exp = 8'h51;
      8'b01010010: out_exp = 8'h52;
      8'b01010011: out_exp = 8'h53;
      8'b01010100: out_exp = 8'h54;
      8'b01010101: out_exp = 8'h55;
      8'b01010110: out_exp = 8'h56;
      8'b01010111: out_exp = 8'h57;
      8'b01011000: out_exp = 8'h58;
      8'b01011001: out_exp = 8'h59;
      8'b01011010: out_exp = 8'h5a;
      8'b01011011: out_exp = 8'h5b;
      8'b01011100: out_exp = 8'h5c;
      8'b01011101: out_exp = 8'h5d;
      8'b01011110: out_exp = 8'h5e;
      8'b01011111: out_exp = 8'h5f;
      8'b01100000: out_exp = 8'h60;
      8'b01100001: out_exp = 8'h61;
      8'b01100010: out_exp = 8'h62;
      8'b01100011: out_exp = 8'h63;
      8'b01100100: out_exp = 8'h64;
      8'b01100101: out_exp = 8'h65;
      8'b01100110: out_exp = 8'h66;
      8'b01100111: out_exp = 8'h67;
      8'b01101000: out_exp = 8'h68;
      8'b01101001: out_exp = 8'h69;
      8'b01101010: out_exp = 8'h6a;
      8'b01101011: out_exp = 8'h6b;
      8'b01101100: out_exp = 8'h6c;
      8'b01101101: out_exp = 8'h6d;
      8'b01101110: out_exp = 8'h6e;
      8'b01101111: out_exp = 8'h6f;
      8'b01110000: out_exp = 8'h70;
      8'b01110001: out_exp = 8'h71;
      8'b01110010: out_exp = 8'h72;
      8'b01110011: out_exp = 8'h73;
      8'b01110100: out_exp = 8'h74;
      8'b01110101: out_exp = 8'h75;
      8'b01110110: out_exp = 8'h76;
      8'b01110111: out_exp = 8'h77;
      8'b01111000: out_exp = 8'h78;
      8'b01111001: out_exp = 8'h79;
      8'b01111010: out_exp = 8'h7a;
      8'b01111011: out_exp = 8'h7b;
      8'b01111111: out_exp = 8'h7e;
        8'h7c: begin
          case (mant_hi3)
            3'h0: begin
              out_exp = 8'h7c;
              case (mant_lo4)
                4'h0: out_exp = 8'h7b;
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
            end
            default: begin end
          endcase
        end
        8'h7d: begin
          case (mant_hi3)
            3'h0: begin
              out_exp = 8'h7d;
              case (mant_lo4)
                4'h0: out_exp = 8'h7c;
                4'h1: out_exp = 8'h7c;
                4'h2: out_exp = 8'h7c;
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
        8'h7e: begin
          case (mant_hi3)
            3'h0: begin
              out_exp = 8'h7d;
              case (mant_lo4)
                4'hd: out_exp = 8'h7e;
                4'he: out_exp = 8'h7e;
                4'hf: out_exp = 8'h7e;
                default: begin end
              endcase
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
        8'h80: begin
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
            end
            3'h5: begin
              out_exp = 8'h7e;
              case (mant_lo4)
                4'he: out_exp = 8'h7f;
                4'hf: out_exp = 8'h7f;
                default: begin end
              endcase
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
        8'hff: begin
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
      default: begin end
    endcase
  end
  always @* begin
    out_mant = 7'h00;
    casez (exp)
        8'h01: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h02: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h03: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h04: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h05: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h06: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h07: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h08: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h09: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h0a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h0b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h0c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h0d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h0e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h0f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h10: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h11: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h12: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h13: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h14: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h15: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h16: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h17: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h18: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h19: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h1a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h1b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h1c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h1d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h1e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h1f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h20: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h21: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h22: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h23: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h24: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h25: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h26: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h27: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h28: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h29: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h2a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h2b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h2c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h2d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h2e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h2f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h30: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h31: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h32: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h33: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h34: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h35: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h36: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h37: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h38: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h39: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h3a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h3b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h3c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h3d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h3e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h3f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h40: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h41: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h42: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h43: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h44: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h45: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h46: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h47: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h48: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h49: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h4a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h4b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h4c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h4d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h4e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h4f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h50: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h51: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h52: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h53: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h54: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h55: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h56: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h57: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h58: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h59: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h5a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h5b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h5c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h5d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h5e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h5f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h60: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h61: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h62: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h63: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h64: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h65: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h66: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h67: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h68: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h69: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h6a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h6b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h6c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h6d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h6e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h6f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h70: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h71: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h72: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h73: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h74: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h75: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h76: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h77: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h78: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h79: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h7a: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h3a;
                4'hb: out_mant = 7'h3b;
                4'hc: out_mant = 7'h3c;
                4'hd: out_mant = 7'h3d;
                4'he: out_mant = 7'h3e;
                4'hf: out_mant = 7'h3f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h1: out_mant = 7'h41;
                4'h2: out_mant = 7'h42;
                4'h3: out_mant = 7'h43;
                4'h4: out_mant = 7'h44;
                4'h5: out_mant = 7'h45;
                4'h6: out_mant = 7'h46;
                4'h7: out_mant = 7'h47;
                4'h8: out_mant = 7'h48;
                4'h9: out_mant = 7'h49;
                4'ha: out_mant = 7'h4a;
                4'hb: out_mant = 7'h4b;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h50;
              case (mant_lo4)
                4'h1: out_mant = 7'h51;
                4'h2: out_mant = 7'h52;
                4'h3: out_mant = 7'h53;
                4'h4: out_mant = 7'h54;
                4'h5: out_mant = 7'h55;
                4'h6: out_mant = 7'h56;
                4'h7: out_mant = 7'h57;
                4'h8: out_mant = 7'h58;
                4'h9: out_mant = 7'h59;
                4'ha: out_mant = 7'h5a;
                4'hb: out_mant = 7'h5b;
                4'hc: out_mant = 7'h5c;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h60;
              case (mant_lo4)
                4'h1: out_mant = 7'h61;
                4'h2: out_mant = 7'h62;
                4'h3: out_mant = 7'h63;
                4'h4: out_mant = 7'h64;
                4'h5: out_mant = 7'h65;
                4'h6: out_mant = 7'h66;
                4'h7: out_mant = 7'h67;
                4'h8: out_mant = 7'h68;
                4'h9: out_mant = 7'h69;
                4'ha: out_mant = 7'h6a;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6d;
                4'he: out_mant = 7'h6e;
                4'hf: out_mant = 7'h6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h70;
              case (mant_lo4)
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h72;
                4'h3: out_mant = 7'h73;
                4'h4: out_mant = 7'h74;
                4'h5: out_mant = 7'h75;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h78;
                4'h9: out_mant = 7'h79;
                4'ha: out_mant = 7'h7a;
                4'hb: out_mant = 7'h7b;
                4'hc: out_mant = 7'h7c;
                4'hd: out_mant = 7'h7d;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h7b: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h00;
              case (mant_lo4)
                4'h1: out_mant = 7'h01;
                4'h2: out_mant = 7'h02;
                4'h3: out_mant = 7'h03;
                4'h4: out_mant = 7'h04;
                4'h5: out_mant = 7'h05;
                4'h6: out_mant = 7'h06;
                4'h7: out_mant = 7'h07;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0b;
                4'hc: out_mant = 7'h0c;
                4'hd: out_mant = 7'h0d;
                4'he: out_mant = 7'h0e;
                4'hf: out_mant = 7'h0f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h10;
              case (mant_lo4)
                4'h1: out_mant = 7'h11;
                4'h2: out_mant = 7'h12;
                4'h3: out_mant = 7'h13;
                4'h4: out_mant = 7'h14;
                4'h5: out_mant = 7'h15;
                4'h6: out_mant = 7'h16;
                4'h7: out_mant = 7'h17;
                4'h8: out_mant = 7'h18;
                4'h9: out_mant = 7'h19;
                4'ha: out_mant = 7'h1a;
                4'hb: out_mant = 7'h1b;
                4'hc: out_mant = 7'h1c;
                4'hd: out_mant = 7'h1d;
                4'he: out_mant = 7'h1e;
                4'hf: out_mant = 7'h1f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h1: out_mant = 7'h21;
                4'h2: out_mant = 7'h22;
                4'h3: out_mant = 7'h23;
                4'h4: out_mant = 7'h24;
                4'h5: out_mant = 7'h25;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h28;
                4'h9: out_mant = 7'h29;
                4'ha: out_mant = 7'h2a;
                4'hb: out_mant = 7'h2b;
                4'hc: out_mant = 7'h2c;
                4'hd: out_mant = 7'h2d;
                4'he: out_mant = 7'h2e;
                4'hf: out_mant = 7'h2f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h38;
              case (mant_lo4)
                4'h0: out_mant = 7'h30;
                4'h1: out_mant = 7'h31;
                4'h2: out_mant = 7'h32;
                4'h3: out_mant = 7'h33;
                4'h4: out_mant = 7'h34;
                4'h5: out_mant = 7'h35;
                4'h6: out_mant = 7'h36;
                4'h7: out_mant = 7'h37;
                4'ha: out_mant = 7'h39;
                4'hb: out_mant = 7'h3a;
                4'hc: out_mant = 7'h3b;
                4'hd: out_mant = 7'h3c;
                4'he: out_mant = 7'h3d;
                4'hf: out_mant = 7'h3e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h3f;
              case (mant_lo4)
                4'h1: out_mant = 7'h40;
                4'h2: out_mant = 7'h41;
                4'h3: out_mant = 7'h42;
                4'h4: out_mant = 7'h43;
                4'h5: out_mant = 7'h44;
                4'h6: out_mant = 7'h45;
                4'h7: out_mant = 7'h46;
                4'h8: out_mant = 7'h47;
                4'h9: out_mant = 7'h48;
                4'ha: out_mant = 7'h49;
                4'hb: out_mant = 7'h4a;
                4'hc: out_mant = 7'h4b;
                4'hd: out_mant = 7'h4c;
                4'he: out_mant = 7'h4d;
                4'hf: out_mant = 7'h4e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h4f;
              case (mant_lo4)
                4'h1: out_mant = 7'h50;
                4'h2: out_mant = 7'h51;
                4'h3: out_mant = 7'h52;
                4'h4: out_mant = 7'h53;
                4'h5: out_mant = 7'h54;
                4'h6: out_mant = 7'h55;
                4'h7: out_mant = 7'h56;
                4'h8: out_mant = 7'h57;
                4'h9: out_mant = 7'h58;
                4'ha: out_mant = 7'h59;
                4'hb: out_mant = 7'h5a;
                4'hc: out_mant = 7'h5b;
                4'hd: out_mant = 7'h5c;
                4'he: out_mant = 7'h5d;
                4'hf: out_mant = 7'h5e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h5f;
              case (mant_lo4)
                4'h1: out_mant = 7'h60;
                4'h2: out_mant = 7'h61;
                4'h3: out_mant = 7'h62;
                4'h4: out_mant = 7'h63;
                4'h5: out_mant = 7'h64;
                4'h6: out_mant = 7'h65;
                4'h7: out_mant = 7'h66;
                4'h8: out_mant = 7'h67;
                4'h9: out_mant = 7'h68;
                4'ha: out_mant = 7'h69;
                4'hb: out_mant = 7'h6a;
                4'hc: out_mant = 7'h6b;
                4'hd: out_mant = 7'h6c;
                4'he: out_mant = 7'h6d;
                4'hf: out_mant = 7'h6e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h6f;
              case (mant_lo4)
                4'h1: out_mant = 7'h70;
                4'h2: out_mant = 7'h71;
                4'h3: out_mant = 7'h72;
                4'h4: out_mant = 7'h73;
                4'h5: out_mant = 7'h74;
                4'h6: out_mant = 7'h75;
                4'h7: out_mant = 7'h76;
                4'h8: out_mant = 7'h77;
                4'h9: out_mant = 7'h78;
                4'ha: out_mant = 7'h79;
                4'hb: out_mant = 7'h7a;
                4'hc: out_mant = 7'h7b;
                4'hd: out_mant = 7'h7c;
                4'he: out_mant = 7'h7d;
                4'hf: out_mant = 7'h7e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h7c: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h7f;
              case (mant_lo4)
                4'h1: out_mant = 7'h00;
                4'h2: out_mant = 7'h01;
                4'h3: out_mant = 7'h02;
                4'h4: out_mant = 7'h03;
                4'h5: out_mant = 7'h04;
                4'h6: out_mant = 7'h05;
                4'h7: out_mant = 7'h06;
                4'h8: out_mant = 7'h07;
                4'h9: out_mant = 7'h08;
                4'ha: out_mant = 7'h09;
                4'hb: out_mant = 7'h0a;
                4'hc: out_mant = 7'h0b;
                4'hd: out_mant = 7'h0c;
                4'he: out_mant = 7'h0d;
                4'hf: out_mant = 7'h0e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h0f;
              case (mant_lo4)
                4'h1: out_mant = 7'h10;
                4'h2: out_mant = 7'h11;
                4'h3: out_mant = 7'h12;
                4'h4: out_mant = 7'h13;
                4'h5: out_mant = 7'h14;
                4'h6: out_mant = 7'h15;
                4'h7: out_mant = 7'h16;
                4'h8: out_mant = 7'h17;
                4'h9: out_mant = 7'h18;
                4'ha: out_mant = 7'h19;
                4'hb: out_mant = 7'h1a;
                4'hc: out_mant = 7'h1b;
                4'hd: out_mant = 7'h1c;
                4'he: out_mant = 7'h1d;
                4'hf: out_mant = 7'h1e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h27;
              case (mant_lo4)
                4'h0: out_mant = 7'h1f;
                4'h1: out_mant = 7'h20;
                4'h2: out_mant = 7'h21;
                4'h3: out_mant = 7'h22;
                4'h4: out_mant = 7'h23;
                4'h5: out_mant = 7'h24;
                4'h6: out_mant = 7'h25;
                4'h7: out_mant = 7'h26;
                4'ha: out_mant = 7'h28;
                4'hb: out_mant = 7'h29;
                4'hc: out_mant = 7'h2a;
                4'hd: out_mant = 7'h2b;
                4'he: out_mant = 7'h2c;
                4'hf: out_mant = 7'h2d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h2e;
              case (mant_lo4)
                4'h1: out_mant = 7'h2f;
                4'h2: out_mant = 7'h30;
                4'h3: out_mant = 7'h31;
                4'h4: out_mant = 7'h32;
                4'h5: out_mant = 7'h33;
                4'h6: out_mant = 7'h34;
                4'h7: out_mant = 7'h35;
                4'h8: out_mant = 7'h36;
                4'h9: out_mant = 7'h37;
                4'ha: out_mant = 7'h38;
                4'hb: out_mant = 7'h39;
                4'hc: out_mant = 7'h3a;
                4'hd: out_mant = 7'h3b;
                4'he: out_mant = 7'h3c;
                4'hf: out_mant = 7'h3d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h45;
              case (mant_lo4)
                4'h0: out_mant = 7'h3e;
                4'h1: out_mant = 7'h3f;
                4'h2: out_mant = 7'h40;
                4'h3: out_mant = 7'h41;
                4'h4: out_mant = 7'h42;
                4'h5: out_mant = 7'h43;
                4'h6: out_mant = 7'h44;
                4'h9: out_mant = 7'h46;
                4'ha: out_mant = 7'h47;
                4'hb: out_mant = 7'h48;
                4'hc: out_mant = 7'h49;
                4'hd: out_mant = 7'h4a;
                4'he: out_mant = 7'h4b;
                4'hf: out_mant = 7'h4c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h4d;
              case (mant_lo4)
                4'h1: out_mant = 7'h4e;
                4'h2: out_mant = 7'h4f;
                4'h3: out_mant = 7'h50;
                4'h4: out_mant = 7'h51;
                4'h5: out_mant = 7'h52;
                4'h6: out_mant = 7'h53;
                4'h7: out_mant = 7'h54;
                4'h8: out_mant = 7'h55;
                4'h9: out_mant = 7'h56;
                4'ha: out_mant = 7'h57;
                4'hb: out_mant = 7'h58;
                4'hc: out_mant = 7'h59;
                4'hd: out_mant = 7'h5a;
                4'he: out_mant = 7'h5b;
                4'hf: out_mant = 7'h5c;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h5c;
              case (mant_lo4)
                4'h1: out_mant = 7'h5d;
                4'h2: out_mant = 7'h5e;
                4'h3: out_mant = 7'h5f;
                4'h4: out_mant = 7'h60;
                4'h5: out_mant = 7'h61;
                4'h6: out_mant = 7'h62;
                4'h7: out_mant = 7'h63;
                4'h8: out_mant = 7'h64;
                4'h9: out_mant = 7'h65;
                4'ha: out_mant = 7'h66;
                4'hb: out_mant = 7'h67;
                4'hc: out_mant = 7'h68;
                4'hd: out_mant = 7'h69;
                4'he: out_mant = 7'h6a;
                4'hf: out_mant = 7'h6b;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h6f;
              case (mant_lo4)
                4'h0: out_mant = 7'h6c;
                4'h1: out_mant = 7'h6d;
                4'h2: out_mant = 7'h6e;
                4'h5: out_mant = 7'h70;
                4'h6: out_mant = 7'h71;
                4'h7: out_mant = 7'h72;
                4'h8: out_mant = 7'h73;
                4'h9: out_mant = 7'h74;
                4'ha: out_mant = 7'h75;
                4'hb: out_mant = 7'h76;
                4'hc: out_mant = 7'h77;
                4'hd: out_mant = 7'h78;
                4'he: out_mant = 7'h79;
                4'hf: out_mant = 7'h7a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h7d: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h0a;
              case (mant_lo4)
                4'h0: out_mant = 7'h7b;
                4'h1: out_mant = 7'h7d;
                4'h2: out_mant = 7'h7f;
                4'h3: out_mant = 7'h00;
                4'h4: out_mant = 7'h01;
                4'h5: out_mant = 7'h02;
                4'h6: out_mant = 7'h03;
                4'h7: out_mant = 7'h04;
                4'h8: out_mant = 7'h05;
                4'h9: out_mant = 7'h06;
                4'ha: out_mant = 7'h07;
                4'hb: out_mant = 7'h08;
                4'hc: out_mant = 7'h09;
                4'hf: out_mant = 7'h0b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h16;
              case (mant_lo4)
                4'h0: out_mant = 7'h0c;
                4'h1: out_mant = 7'h0d;
                4'h2: out_mant = 7'h0e;
                4'h3: out_mant = 7'h0f;
                4'h4: out_mant = 7'h10;
                4'h5: out_mant = 7'h11;
                4'h6: out_mant = 7'h12;
                4'h7: out_mant = 7'h13;
                4'h8: out_mant = 7'h14;
                4'h9: out_mant = 7'h15;
                4'hc: out_mant = 7'h17;
                4'hd: out_mant = 7'h18;
                4'he: out_mant = 7'h19;
                4'hf: out_mant = 7'h1a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h20;
              case (mant_lo4)
                4'h0: out_mant = 7'h1b;
                4'h1: out_mant = 7'h1c;
                4'h2: out_mant = 7'h1d;
                4'h3: out_mant = 7'h1e;
                4'h4: out_mant = 7'h1f;
                4'h7: out_mant = 7'h21;
                4'h8: out_mant = 7'h22;
                4'h9: out_mant = 7'h23;
                4'ha: out_mant = 7'h24;
                4'hb: out_mant = 7'h25;
                4'hc: out_mant = 7'h26;
                4'hd: out_mant = 7'h27;
                4'he: out_mant = 7'h28;
                4'hf: out_mant = 7'h28;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h30;
              case (mant_lo4)
                4'h0: out_mant = 7'h29;
                4'h1: out_mant = 7'h2a;
                4'h2: out_mant = 7'h2b;
                4'h3: out_mant = 7'h2c;
                4'h4: out_mant = 7'h2d;
                4'h5: out_mant = 7'h2e;
                4'h6: out_mant = 7'h2f;
                4'h9: out_mant = 7'h31;
                4'ha: out_mant = 7'h32;
                4'hb: out_mant = 7'h33;
                4'hc: out_mant = 7'h34;
                4'hd: out_mant = 7'h35;
                4'he: out_mant = 7'h36;
                4'hf: out_mant = 7'h37;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h3e;
              case (mant_lo4)
                4'h0: out_mant = 7'h37;
                4'h1: out_mant = 7'h38;
                4'h2: out_mant = 7'h39;
                4'h3: out_mant = 7'h3a;
                4'h4: out_mant = 7'h3b;
                4'h5: out_mant = 7'h3c;
                4'h6: out_mant = 7'h3d;
                4'h9: out_mant = 7'h3f;
                4'ha: out_mant = 7'h40;
                4'hb: out_mant = 7'h41;
                4'hc: out_mant = 7'h42;
                4'hd: out_mant = 7'h43;
                4'he: out_mant = 7'h44;
                4'hf: out_mant = 7'h44;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h4a;
              case (mant_lo4)
                4'h0: out_mant = 7'h45;
                4'h1: out_mant = 7'h46;
                4'h2: out_mant = 7'h47;
                4'h3: out_mant = 7'h48;
                4'h4: out_mant = 7'h49;
                4'h7: out_mant = 7'h4b;
                4'h8: out_mant = 7'h4c;
                4'h9: out_mant = 7'h4d;
                4'ha: out_mant = 7'h4e;
                4'hb: out_mant = 7'h4f;
                4'hc: out_mant = 7'h4f;
                4'hd: out_mant = 7'h50;
                4'he: out_mant = 7'h51;
                4'hf: out_mant = 7'h52;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h54;
              case (mant_lo4)
                4'h0: out_mant = 7'h53;
                4'h3: out_mant = 7'h55;
                4'h4: out_mant = 7'h56;
                4'h5: out_mant = 7'h57;
                4'h6: out_mant = 7'h58;
                4'h7: out_mant = 7'h59;
                4'h8: out_mant = 7'h59;
                4'h9: out_mant = 7'h5a;
                4'ha: out_mant = 7'h5b;
                4'hb: out_mant = 7'h5c;
                4'hc: out_mant = 7'h5d;
                4'hd: out_mant = 7'h5d;
                4'he: out_mant = 7'h5e;
                4'hf: out_mant = 7'h5f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h61;
              case (mant_lo4)
                4'h0: out_mant = 7'h60;
                4'h3: out_mant = 7'h62;
                4'h4: out_mant = 7'h63;
                4'h5: out_mant = 7'h64;
                4'h6: out_mant = 7'h65;
                4'h7: out_mant = 7'h65;
                4'h8: out_mant = 7'h66;
                4'h9: out_mant = 7'h67;
                4'ha: out_mant = 7'h68;
                4'hb: out_mant = 7'h69;
                4'hc: out_mant = 7'h69;
                4'hd: out_mant = 7'h6a;
                4'he: out_mant = 7'h6b;
                4'hf: out_mant = 7'h6c;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h7e: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h6d;
              case (mant_lo4)
                4'h1: out_mant = 7'h6e;
                4'h2: out_mant = 7'h70;
                4'h3: out_mant = 7'h71;
                4'h4: out_mant = 7'h73;
                4'h5: out_mant = 7'h74;
                4'h6: out_mant = 7'h76;
                4'h7: out_mant = 7'h77;
                4'h8: out_mant = 7'h79;
                4'h9: out_mant = 7'h7b;
                4'ha: out_mant = 7'h7c;
                4'hb: out_mant = 7'h7e;
                4'hc: out_mant = 7'h7f;
                4'hd: out_mant = 7'h00;
                4'he: out_mant = 7'h01;
                4'hf: out_mant = 7'h02;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h03;
              case (mant_lo4)
                4'h2: out_mant = 7'h04;
                4'h3: out_mant = 7'h05;
                4'h4: out_mant = 7'h05;
                4'h5: out_mant = 7'h06;
                4'h6: out_mant = 7'h07;
                4'h7: out_mant = 7'h08;
                4'h8: out_mant = 7'h08;
                4'h9: out_mant = 7'h09;
                4'ha: out_mant = 7'h0a;
                4'hb: out_mant = 7'h0a;
                4'hc: out_mant = 7'h0b;
                4'hd: out_mant = 7'h0c;
                4'he: out_mant = 7'h0d;
                4'hf: out_mant = 7'h0d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h0f;
              case (mant_lo4)
                4'h0: out_mant = 7'h0e;
                4'h3: out_mant = 7'h10;
                4'h4: out_mant = 7'h11;
                4'h5: out_mant = 7'h11;
                4'h6: out_mant = 7'h12;
                4'h7: out_mant = 7'h13;
                4'h8: out_mant = 7'h13;
                4'h9: out_mant = 7'h14;
                4'ha: out_mant = 7'h15;
                4'hb: out_mant = 7'h15;
                4'hc: out_mant = 7'h16;
                4'hd: out_mant = 7'h17;
                4'he: out_mant = 7'h17;
                4'hf: out_mant = 7'h18;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h19;
              case (mant_lo4)
                4'h2: out_mant = 7'h1a;
                4'h3: out_mant = 7'h1b;
                4'h4: out_mant = 7'h1b;
                4'h5: out_mant = 7'h1c;
                4'h6: out_mant = 7'h1c;
                4'h7: out_mant = 7'h1d;
                4'h8: out_mant = 7'h1e;
                4'h9: out_mant = 7'h1e;
                4'ha: out_mant = 7'h1f;
                4'hb: out_mant = 7'h20;
                4'hc: out_mant = 7'h20;
                4'hd: out_mant = 7'h21;
                4'he: out_mant = 7'h21;
                4'hf: out_mant = 7'h22;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h23;
              case (mant_lo4)
                4'h2: out_mant = 7'h24;
                4'h3: out_mant = 7'h24;
                4'h4: out_mant = 7'h25;
                4'h5: out_mant = 7'h26;
                4'h6: out_mant = 7'h26;
                4'h7: out_mant = 7'h27;
                4'h8: out_mant = 7'h27;
                4'h9: out_mant = 7'h28;
                4'ha: out_mant = 7'h28;
                4'hb: out_mant = 7'h29;
                4'hc: out_mant = 7'h2a;
                4'hd: out_mant = 7'h2a;
                4'he: out_mant = 7'h2b;
                4'hf: out_mant = 7'h2b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h2c;
              case (mant_lo4)
                4'h2: out_mant = 7'h2d;
                4'h3: out_mant = 7'h2d;
                4'h4: out_mant = 7'h2e;
                4'h5: out_mant = 7'h2e;
                4'h6: out_mant = 7'h2f;
                4'h7: out_mant = 7'h30;
                4'h8: out_mant = 7'h30;
                4'h9: out_mant = 7'h31;
                4'ha: out_mant = 7'h31;
                4'hb: out_mant = 7'h32;
                4'hc: out_mant = 7'h32;
                4'hd: out_mant = 7'h33;
                4'he: out_mant = 7'h33;
                4'hf: out_mant = 7'h34;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h3b;
              case (mant_lo4)
                4'h0: out_mant = 7'h34;
                4'h1: out_mant = 7'h35;
                4'h2: out_mant = 7'h35;
                4'h3: out_mant = 7'h36;
                4'h4: out_mant = 7'h36;
                4'h5: out_mant = 7'h37;
                4'h6: out_mant = 7'h37;
                4'h7: out_mant = 7'h38;
                4'h8: out_mant = 7'h38;
                4'h9: out_mant = 7'h39;
                4'ha: out_mant = 7'h39;
                4'hb: out_mant = 7'h3a;
                4'hc: out_mant = 7'h3a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h40;
              case (mant_lo4)
                4'h0: out_mant = 7'h3c;
                4'h1: out_mant = 7'h3c;
                4'h2: out_mant = 7'h3d;
                4'h3: out_mant = 7'h3d;
                4'h4: out_mant = 7'h3e;
                4'h5: out_mant = 7'h3e;
                4'h6: out_mant = 7'h3f;
                4'h7: out_mant = 7'h3f;
                4'hb: out_mant = 7'h41;
                4'hc: out_mant = 7'h41;
                4'hd: out_mant = 7'h42;
                4'he: out_mant = 7'h42;
                4'hf: out_mant = 7'h43;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h7f: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h45;
              case (mant_lo4)
                4'h0: out_mant = 7'h43;
                4'h1: out_mant = 7'h44;
                4'h4: out_mant = 7'h46;
                4'h5: out_mant = 7'h47;
                4'h6: out_mant = 7'h48;
                4'h7: out_mant = 7'h49;
                4'h8: out_mant = 7'h49;
                4'h9: out_mant = 7'h4a;
                4'ha: out_mant = 7'h4b;
                4'hb: out_mant = 7'h4c;
                4'hc: out_mant = 7'h4c;
                4'hd: out_mant = 7'h4d;
                4'he: out_mant = 7'h4e;
                4'hf: out_mant = 7'h4e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h51;
              case (mant_lo4)
                4'h0: out_mant = 7'h4f;
                4'h1: out_mant = 7'h50;
                4'h4: out_mant = 7'h52;
                4'h5: out_mant = 7'h53;
                4'h6: out_mant = 7'h53;
                4'h7: out_mant = 7'h54;
                4'h8: out_mant = 7'h54;
                4'h9: out_mant = 7'h55;
                4'ha: out_mant = 7'h56;
                4'hb: out_mant = 7'h56;
                4'hc: out_mant = 7'h57;
                4'hd: out_mant = 7'h57;
                4'he: out_mant = 7'h58;
                4'hf: out_mant = 7'h59;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h5a;
              case (mant_lo4)
                4'h0: out_mant = 7'h59;
                4'h3: out_mant = 7'h5b;
                4'h4: out_mant = 7'h5b;
                4'h5: out_mant = 7'h5c;
                4'h6: out_mant = 7'h5c;
                4'h7: out_mant = 7'h5d;
                4'h8: out_mant = 7'h5d;
                4'h9: out_mant = 7'h5e;
                4'ha: out_mant = 7'h5e;
                4'hb: out_mant = 7'h5f;
                4'hc: out_mant = 7'h5f;
                4'hd: out_mant = 7'h60;
                4'he: out_mant = 7'h60;
                4'hf: out_mant = 7'h61;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h63;
              case (mant_lo4)
                4'h0: out_mant = 7'h61;
                4'h1: out_mant = 7'h62;
                4'h2: out_mant = 7'h62;
                4'h6: out_mant = 7'h64;
                4'h7: out_mant = 7'h64;
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
            3'h4: begin
              out_mant = 7'h68;
              case (mant_lo4)
                4'h3: out_mant = 7'h69;
                4'h4: out_mant = 7'h69;
                4'h5: out_mant = 7'h69;
                4'h6: out_mant = 7'h6a;
                4'h7: out_mant = 7'h6a;
                4'h8: out_mant = 7'h6a;
                4'h9: out_mant = 7'h6b;
                4'ha: out_mant = 7'h6b;
                4'hb: out_mant = 7'h6b;
                4'hc: out_mant = 7'h6c;
                4'hd: out_mant = 7'h6c;
                4'he: out_mant = 7'h6c;
                4'hf: out_mant = 7'h6d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_mant = 7'h6f;
              case (mant_lo4)
                4'h0: out_mant = 7'h6d;
                4'h1: out_mant = 7'h6d;
                4'h2: out_mant = 7'h6d;
                4'h3: out_mant = 7'h6e;
                4'h4: out_mant = 7'h6e;
                4'h5: out_mant = 7'h6e;
                4'ha: out_mant = 7'h70;
                4'hb: out_mant = 7'h70;
                4'hc: out_mant = 7'h70;
                4'hd: out_mant = 7'h70;
                4'he: out_mant = 7'h71;
                4'hf: out_mant = 7'h71;
                default: begin end
              endcase
            end
            3'h6: begin
              out_mant = 7'h73;
              case (mant_lo4)
                4'h0: out_mant = 7'h71;
                4'h1: out_mant = 7'h71;
                4'h2: out_mant = 7'h71;
                4'h3: out_mant = 7'h72;
                4'h4: out_mant = 7'h72;
                4'h5: out_mant = 7'h72;
                4'h6: out_mant = 7'h72;
                4'hd: out_mant = 7'h74;
                4'he: out_mant = 7'h74;
                4'hf: out_mant = 7'h74;
                default: begin end
              endcase
            end
            3'h7: begin
              out_mant = 7'h75;
              case (mant_lo4)
                4'h0: out_mant = 7'h74;
                4'h1: out_mant = 7'h74;
                4'h8: out_mant = 7'h76;
                4'h9: out_mant = 7'h76;
                4'ha: out_mant = 7'h76;
                4'hb: out_mant = 7'h76;
                4'hc: out_mant = 7'h76;
                4'hd: out_mant = 7'h76;
                4'he: out_mant = 7'h77;
                4'hf: out_mant = 7'h77;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        8'h80: begin
          case (mant_hi3)
            3'h0: begin
              out_mant = 7'h79;
              case (mant_lo4)
                4'h0: out_mant = 7'h77;
                4'h1: out_mant = 7'h77;
                4'h2: out_mant = 7'h77;
                4'h3: out_mant = 7'h78;
                4'h4: out_mant = 7'h78;
                4'h5: out_mant = 7'h78;
                4'h6: out_mant = 7'h78;
                4'hc: out_mant = 7'h7a;
                4'hd: out_mant = 7'h7a;
                4'he: out_mant = 7'h7a;
                4'hf: out_mant = 7'h7a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_mant = 7'h7c;
              case (mant_lo4)
                4'h0: out_mant = 7'h7a;
                4'h1: out_mant = 7'h7b;
                4'h2: out_mant = 7'h7b;
                4'h3: out_mant = 7'h7b;
                4'h4: out_mant = 7'h7b;
                4'h5: out_mant = 7'h7b;
                4'h6: out_mant = 7'h7b;
                4'h7: out_mant = 7'h7b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_mant = 7'h7d;
              case (mant_lo4)
                4'hb: out_mant = 7'h7e;
                4'hc: out_mant = 7'h7e;
                4'hd: out_mant = 7'h7e;
                4'he: out_mant = 7'h7e;
                4'hf: out_mant = 7'h7e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_mant = 7'h7e;
              case (mant_lo4)
                4'hb: out_mant = 7'h7f;
                4'hc: out_mant = 7'h7f;
                4'hd: out_mant = 7'h7f;
                4'he: out_mant = 7'h7f;
                4'hf: out_mant = 7'h7f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_mant = 7'h7f;
            end
            3'h5: begin
              out_mant = 7'h7f;
              case (mant_lo4)
                4'he: out_mant = 7'h00;
                4'hf: out_mant = 7'h00;
                default: begin end
              endcase
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
        8'hff: begin
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
  always @* begin
    is_nan = 1'b0;
    casez (exp)
      8'hff: begin
        is_nan = 1'b1;
        casez (mant)
          7'h00: is_nan = 1'b0;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = is_nan ? 16'h7fc0 : {sign, out_exp, out_mant};
endmodule
