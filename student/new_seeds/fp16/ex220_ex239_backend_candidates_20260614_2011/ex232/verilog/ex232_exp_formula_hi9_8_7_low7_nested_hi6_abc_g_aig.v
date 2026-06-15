module ex232_fp16_square_exp_formula_hi9_8_7_low7_nested_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire active_normal = (exp >= 5'd8) && (exp <= 5'd22);
  wire out_exp_carry = mant >= 10'd424;
  wire [5:0] out_exp_wide = {1'b0, exp} + {1'b0, exp} - 6'd15 + {5'b00000, out_exp_carry};
  wire [4:0] out_exp = out_exp_wide[4:0];
  wire [15:0] special_out =
    (exp <= 5'd7) ? 16'h0000 :
    (exp <= 5'd30) ? 16'h7c00 :
    (mant == 10'h000) ? 16'h7c00 : 16'h7e00;
  reg [6:0] mant_low;
  always @* begin
    case (mant[9:4])
      6'h00: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h00;
          4'h1: mant_low = 7'h02;
          4'h2: mant_low = 7'h04;
          4'h3: mant_low = 7'h06;
          4'h4: mant_low = 7'h08;
          4'h5: mant_low = 7'h0a;
          4'h6: mant_low = 7'h0c;
          4'h7: mant_low = 7'h0e;
          4'h8: mant_low = 7'h10;
          4'h9: mant_low = 7'h12;
          4'ha: mant_low = 7'h14;
          4'hb: mant_low = 7'h16;
          4'hc: mant_low = 7'h18;
          4'hd: mant_low = 7'h1a;
          4'he: mant_low = 7'h1c;
          4'hf: mant_low = 7'h1e;
          default: mant_low = 7'h00;
        endcase
      end
      6'h01: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h20;
          4'h1: mant_low = 7'h22;
          4'h2: mant_low = 7'h24;
          4'h3: mant_low = 7'h26;
          4'h4: mant_low = 7'h28;
          4'h5: mant_low = 7'h2a;
          4'h6: mant_low = 7'h2c;
          4'h7: mant_low = 7'h2f;
          4'h8: mant_low = 7'h31;
          4'h9: mant_low = 7'h33;
          4'ha: mant_low = 7'h35;
          4'hb: mant_low = 7'h37;
          4'hc: mant_low = 7'h39;
          4'hd: mant_low = 7'h3b;
          4'he: mant_low = 7'h3d;
          4'hf: mant_low = 7'h3f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h02: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h41;
          4'h1: mant_low = 7'h43;
          4'h2: mant_low = 7'h45;
          4'h3: mant_low = 7'h47;
          4'h4: mant_low = 7'h49;
          4'h5: mant_low = 7'h4b;
          4'h6: mant_low = 7'h4d;
          4'h7: mant_low = 7'h4f;
          4'h8: mant_low = 7'h52;
          4'h9: mant_low = 7'h54;
          4'ha: mant_low = 7'h56;
          4'hb: mant_low = 7'h58;
          4'hc: mant_low = 7'h5a;
          4'hd: mant_low = 7'h5c;
          4'he: mant_low = 7'h5e;
          4'hf: mant_low = 7'h60;
          default: mant_low = 7'h00;
        endcase
      end
      6'h03: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h62;
          4'h1: mant_low = 7'h64;
          4'h2: mant_low = 7'h66;
          4'h3: mant_low = 7'h69;
          4'h4: mant_low = 7'h6b;
          4'h5: mant_low = 7'h6d;
          4'h6: mant_low = 7'h6f;
          4'h7: mant_low = 7'h71;
          4'h8: mant_low = 7'h73;
          4'h9: mant_low = 7'h75;
          4'ha: mant_low = 7'h77;
          4'hb: mant_low = 7'h79;
          4'hc: mant_low = 7'h7c;
          4'hd: mant_low = 7'h7e;
          4'he: mant_low = 7'h00;
          4'hf: mant_low = 7'h02;
          default: mant_low = 7'h00;
        endcase
      end
      6'h04: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h04;
          4'h1: mant_low = 7'h06;
          4'h2: mant_low = 7'h08;
          4'h3: mant_low = 7'h0a;
          4'h4: mant_low = 7'h0d;
          4'h5: mant_low = 7'h0f;
          4'h6: mant_low = 7'h11;
          4'h7: mant_low = 7'h13;
          4'h8: mant_low = 7'h15;
          4'h9: mant_low = 7'h17;
          4'ha: mant_low = 7'h19;
          4'hb: mant_low = 7'h1b;
          4'hc: mant_low = 7'h1e;
          4'hd: mant_low = 7'h20;
          4'he: mant_low = 7'h22;
          4'hf: mant_low = 7'h24;
          default: mant_low = 7'h00;
        endcase
      end
      6'h05: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h26;
          4'h1: mant_low = 7'h28;
          4'h2: mant_low = 7'h2b;
          4'h3: mant_low = 7'h2d;
          4'h4: mant_low = 7'h2f;
          4'h5: mant_low = 7'h31;
          4'h6: mant_low = 7'h33;
          4'h7: mant_low = 7'h35;
          4'h8: mant_low = 7'h38;
          4'h9: mant_low = 7'h3a;
          4'ha: mant_low = 7'h3c;
          4'hb: mant_low = 7'h3e;
          4'hc: mant_low = 7'h40;
          4'hd: mant_low = 7'h42;
          4'he: mant_low = 7'h45;
          4'hf: mant_low = 7'h47;
          default: mant_low = 7'h00;
        endcase
      end
      6'h06: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h49;
          4'h1: mant_low = 7'h4b;
          4'h2: mant_low = 7'h4d;
          4'h3: mant_low = 7'h50;
          4'h4: mant_low = 7'h52;
          4'h5: mant_low = 7'h54;
          4'h6: mant_low = 7'h56;
          4'h7: mant_low = 7'h58;
          4'h8: mant_low = 7'h5b;
          4'h9: mant_low = 7'h5d;
          4'ha: mant_low = 7'h5f;
          4'hb: mant_low = 7'h61;
          4'hc: mant_low = 7'h63;
          4'hd: mant_low = 7'h66;
          4'he: mant_low = 7'h68;
          4'hf: mant_low = 7'h6a;
          default: mant_low = 7'h00;
        endcase
      end
      6'h07: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h6c;
          4'h1: mant_low = 7'h6e;
          4'h2: mant_low = 7'h71;
          4'h3: mant_low = 7'h73;
          4'h4: mant_low = 7'h75;
          4'h5: mant_low = 7'h77;
          4'h6: mant_low = 7'h7a;
          4'h7: mant_low = 7'h7c;
          4'h8: mant_low = 7'h7e;
          4'h9: mant_low = 7'h00;
          4'ha: mant_low = 7'h03;
          4'hb: mant_low = 7'h05;
          4'hc: mant_low = 7'h07;
          4'hd: mant_low = 7'h09;
          4'he: mant_low = 7'h0c;
          4'hf: mant_low = 7'h0e;
          default: mant_low = 7'h00;
        endcase
      end
      6'h08: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h10;
          4'h1: mant_low = 7'h12;
          4'h2: mant_low = 7'h15;
          4'h3: mant_low = 7'h17;
          4'h4: mant_low = 7'h19;
          4'h5: mant_low = 7'h1b;
          4'h6: mant_low = 7'h1e;
          4'h7: mant_low = 7'h20;
          4'h8: mant_low = 7'h22;
          4'h9: mant_low = 7'h24;
          4'ha: mant_low = 7'h27;
          4'hb: mant_low = 7'h29;
          4'hc: mant_low = 7'h2b;
          4'hd: mant_low = 7'h2d;
          4'he: mant_low = 7'h30;
          4'hf: mant_low = 7'h32;
          default: mant_low = 7'h00;
        endcase
      end
      6'h09: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h34;
          4'h1: mant_low = 7'h37;
          4'h2: mant_low = 7'h39;
          4'h3: mant_low = 7'h3b;
          4'h4: mant_low = 7'h3d;
          4'h5: mant_low = 7'h40;
          4'h6: mant_low = 7'h42;
          4'h7: mant_low = 7'h44;
          4'h8: mant_low = 7'h47;
          4'h9: mant_low = 7'h49;
          4'ha: mant_low = 7'h4b;
          4'hb: mant_low = 7'h4d;
          4'hc: mant_low = 7'h50;
          4'hd: mant_low = 7'h52;
          4'he: mant_low = 7'h54;
          4'hf: mant_low = 7'h57;
          default: mant_low = 7'h00;
        endcase
      end
      6'h0a: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h59;
          4'h1: mant_low = 7'h5b;
          4'h2: mant_low = 7'h5e;
          4'h3: mant_low = 7'h60;
          4'h4: mant_low = 7'h62;
          4'h5: mant_low = 7'h65;
          4'h6: mant_low = 7'h67;
          4'h7: mant_low = 7'h69;
          4'h8: mant_low = 7'h6c;
          4'h9: mant_low = 7'h6e;
          4'ha: mant_low = 7'h70;
          4'hb: mant_low = 7'h73;
          4'hc: mant_low = 7'h75;
          4'hd: mant_low = 7'h77;
          4'he: mant_low = 7'h7a;
          4'hf: mant_low = 7'h7c;
          default: mant_low = 7'h00;
        endcase
      end
      6'h0b: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h7e;
          4'h1: mant_low = 7'h01;
          4'h2: mant_low = 7'h03;
          4'h3: mant_low = 7'h05;
          4'h4: mant_low = 7'h08;
          4'h5: mant_low = 7'h0a;
          4'h6: mant_low = 7'h0c;
          4'h7: mant_low = 7'h0f;
          4'h8: mant_low = 7'h11;
          4'h9: mant_low = 7'h13;
          4'ha: mant_low = 7'h16;
          4'hb: mant_low = 7'h18;
          4'hc: mant_low = 7'h1b;
          4'hd: mant_low = 7'h1d;
          4'he: mant_low = 7'h1f;
          4'hf: mant_low = 7'h22;
          default: mant_low = 7'h00;
        endcase
      end
      6'h0c: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h24;
          4'h1: mant_low = 7'h26;
          4'h2: mant_low = 7'h29;
          4'h3: mant_low = 7'h2b;
          4'h4: mant_low = 7'h2e;
          4'h5: mant_low = 7'h30;
          4'h6: mant_low = 7'h32;
          4'h7: mant_low = 7'h35;
          4'h8: mant_low = 7'h37;
          4'h9: mant_low = 7'h39;
          4'ha: mant_low = 7'h3c;
          4'hb: mant_low = 7'h3e;
          4'hc: mant_low = 7'h41;
          4'hd: mant_low = 7'h43;
          4'he: mant_low = 7'h45;
          4'hf: mant_low = 7'h48;
          default: mant_low = 7'h00;
        endcase
      end
      6'h0d: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h4a;
          4'h1: mant_low = 7'h4d;
          4'h2: mant_low = 7'h4f;
          4'h3: mant_low = 7'h51;
          4'h4: mant_low = 7'h54;
          4'h5: mant_low = 7'h56;
          4'h6: mant_low = 7'h59;
          4'h7: mant_low = 7'h5b;
          4'h8: mant_low = 7'h5e;
          4'h9: mant_low = 7'h60;
          4'ha: mant_low = 7'h62;
          4'hb: mant_low = 7'h65;
          4'hc: mant_low = 7'h67;
          4'hd: mant_low = 7'h6a;
          4'he: mant_low = 7'h6c;
          4'hf: mant_low = 7'h6f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h0e: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h71;
          4'h1: mant_low = 7'h73;
          4'h2: mant_low = 7'h76;
          4'h3: mant_low = 7'h78;
          4'h4: mant_low = 7'h7b;
          4'h5: mant_low = 7'h7d;
          4'h6: mant_low = 7'h00;
          4'h7: mant_low = 7'h02;
          4'h8: mant_low = 7'h05;
          4'h9: mant_low = 7'h07;
          4'ha: mant_low = 7'h09;
          4'hb: mant_low = 7'h0c;
          4'hc: mant_low = 7'h0e;
          4'hd: mant_low = 7'h11;
          4'he: mant_low = 7'h13;
          4'hf: mant_low = 7'h16;
          default: mant_low = 7'h00;
        endcase
      end
      6'h0f: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h18;
          4'h1: mant_low = 7'h1b;
          4'h2: mant_low = 7'h1d;
          4'h3: mant_low = 7'h20;
          4'h4: mant_low = 7'h22;
          4'h5: mant_low = 7'h25;
          4'h6: mant_low = 7'h27;
          4'h7: mant_low = 7'h2a;
          4'h8: mant_low = 7'h2c;
          4'h9: mant_low = 7'h2f;
          4'ha: mant_low = 7'h31;
          4'hb: mant_low = 7'h34;
          4'hc: mant_low = 7'h36;
          4'hd: mant_low = 7'h39;
          4'he: mant_low = 7'h3b;
          4'hf: mant_low = 7'h3e;
          default: mant_low = 7'h00;
        endcase
      end
      6'h10: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h40;
          4'h1: mant_low = 7'h43;
          4'h2: mant_low = 7'h45;
          4'h3: mant_low = 7'h48;
          4'h4: mant_low = 7'h4a;
          4'h5: mant_low = 7'h4d;
          4'h6: mant_low = 7'h4f;
          4'h7: mant_low = 7'h52;
          4'h8: mant_low = 7'h54;
          4'h9: mant_low = 7'h57;
          4'ha: mant_low = 7'h59;
          4'hb: mant_low = 7'h5c;
          4'hc: mant_low = 7'h5e;
          4'hd: mant_low = 7'h61;
          4'he: mant_low = 7'h63;
          4'hf: mant_low = 7'h66;
          default: mant_low = 7'h00;
        endcase
      end
      6'h11: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h68;
          4'h1: mant_low = 7'h6b;
          4'h2: mant_low = 7'h6d;
          4'h3: mant_low = 7'h70;
          4'h4: mant_low = 7'h72;
          4'h5: mant_low = 7'h75;
          4'h6: mant_low = 7'h77;
          4'h7: mant_low = 7'h7a;
          4'h8: mant_low = 7'h7d;
          4'h9: mant_low = 7'h7f;
          4'ha: mant_low = 7'h02;
          4'hb: mant_low = 7'h04;
          4'hc: mant_low = 7'h07;
          4'hd: mant_low = 7'h09;
          4'he: mant_low = 7'h0c;
          4'hf: mant_low = 7'h0e;
          default: mant_low = 7'h00;
        endcase
      end
      6'h12: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h11;
          4'h1: mant_low = 7'h14;
          4'h2: mant_low = 7'h16;
          4'h3: mant_low = 7'h19;
          4'h4: mant_low = 7'h1b;
          4'h5: mant_low = 7'h1e;
          4'h6: mant_low = 7'h20;
          4'h7: mant_low = 7'h23;
          4'h8: mant_low = 7'h26;
          4'h9: mant_low = 7'h28;
          4'ha: mant_low = 7'h2b;
          4'hb: mant_low = 7'h2d;
          4'hc: mant_low = 7'h30;
          4'hd: mant_low = 7'h32;
          4'he: mant_low = 7'h35;
          4'hf: mant_low = 7'h38;
          default: mant_low = 7'h00;
        endcase
      end
      6'h13: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h3a;
          4'h1: mant_low = 7'h3d;
          4'h2: mant_low = 7'h3f;
          4'h3: mant_low = 7'h42;
          4'h4: mant_low = 7'h45;
          4'h5: mant_low = 7'h47;
          4'h6: mant_low = 7'h4a;
          4'h7: mant_low = 7'h4c;
          4'h8: mant_low = 7'h4f;
          4'h9: mant_low = 7'h52;
          4'ha: mant_low = 7'h54;
          4'hb: mant_low = 7'h57;
          4'hc: mant_low = 7'h5a;
          4'hd: mant_low = 7'h5c;
          4'he: mant_low = 7'h5f;
          4'hf: mant_low = 7'h61;
          default: mant_low = 7'h00;
        endcase
      end
      6'h14: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h64;
          4'h1: mant_low = 7'h67;
          4'h2: mant_low = 7'h69;
          4'h3: mant_low = 7'h6c;
          4'h4: mant_low = 7'h6f;
          4'h5: mant_low = 7'h71;
          4'h6: mant_low = 7'h74;
          4'h7: mant_low = 7'h76;
          4'h8: mant_low = 7'h79;
          4'h9: mant_low = 7'h7c;
          4'ha: mant_low = 7'h7e;
          4'hb: mant_low = 7'h01;
          4'hc: mant_low = 7'h04;
          4'hd: mant_low = 7'h06;
          4'he: mant_low = 7'h09;
          4'hf: mant_low = 7'h0c;
          default: mant_low = 7'h00;
        endcase
      end
      6'h15: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h0e;
          4'h1: mant_low = 7'h11;
          4'h2: mant_low = 7'h14;
          4'h3: mant_low = 7'h16;
          4'h4: mant_low = 7'h19;
          4'h5: mant_low = 7'h1c;
          4'h6: mant_low = 7'h1e;
          4'h7: mant_low = 7'h21;
          4'h8: mant_low = 7'h24;
          4'h9: mant_low = 7'h26;
          4'ha: mant_low = 7'h29;
          4'hb: mant_low = 7'h2c;
          4'hc: mant_low = 7'h2e;
          4'hd: mant_low = 7'h31;
          4'he: mant_low = 7'h34;
          4'hf: mant_low = 7'h36;
          default: mant_low = 7'h00;
        endcase
      end
      6'h16: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h39;
          4'h1: mant_low = 7'h3c;
          4'h2: mant_low = 7'h3e;
          4'h3: mant_low = 7'h41;
          4'h4: mant_low = 7'h44;
          4'h5: mant_low = 7'h46;
          4'h6: mant_low = 7'h49;
          4'h7: mant_low = 7'h4c;
          4'h8: mant_low = 7'h4f;
          4'h9: mant_low = 7'h51;
          4'ha: mant_low = 7'h54;
          4'hb: mant_low = 7'h57;
          4'hc: mant_low = 7'h59;
          4'hd: mant_low = 7'h5c;
          4'he: mant_low = 7'h5f;
          4'hf: mant_low = 7'h62;
          default: mant_low = 7'h00;
        endcase
      end
      6'h17: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h64;
          4'h1: mant_low = 7'h67;
          4'h2: mant_low = 7'h6a;
          4'h3: mant_low = 7'h6c;
          4'h4: mant_low = 7'h6f;
          4'h5: mant_low = 7'h72;
          4'h6: mant_low = 7'h75;
          4'h7: mant_low = 7'h77;
          4'h8: mant_low = 7'h7a;
          4'h9: mant_low = 7'h7d;
          4'ha: mant_low = 7'h00;
          4'hb: mant_low = 7'h02;
          4'hc: mant_low = 7'h05;
          4'hd: mant_low = 7'h08;
          4'he: mant_low = 7'h0b;
          4'hf: mant_low = 7'h0d;
          default: mant_low = 7'h00;
        endcase
      end
      6'h18: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h10;
          4'h1: mant_low = 7'h13;
          4'h2: mant_low = 7'h16;
          4'h3: mant_low = 7'h18;
          4'h4: mant_low = 7'h1b;
          4'h5: mant_low = 7'h1e;
          4'h6: mant_low = 7'h21;
          4'h7: mant_low = 7'h23;
          4'h8: mant_low = 7'h26;
          4'h9: mant_low = 7'h29;
          4'ha: mant_low = 7'h2c;
          4'hb: mant_low = 7'h2e;
          4'hc: mant_low = 7'h31;
          4'hd: mant_low = 7'h34;
          4'he: mant_low = 7'h37;
          4'hf: mant_low = 7'h39;
          default: mant_low = 7'h00;
        endcase
      end
      6'h19: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h3c;
          4'h1: mant_low = 7'h3f;
          4'h2: mant_low = 7'h42;
          4'h3: mant_low = 7'h45;
          4'h4: mant_low = 7'h47;
          4'h5: mant_low = 7'h4a;
          4'h6: mant_low = 7'h4d;
          4'h7: mant_low = 7'h50;
          4'h8: mant_low = 7'h53;
          4'h9: mant_low = 7'h55;
          4'ha: mant_low = 7'h58;
          4'hb: mant_low = 7'h5b;
          4'hc: mant_low = 7'h5e;
          4'hd: mant_low = 7'h61;
          4'he: mant_low = 7'h63;
          4'hf: mant_low = 7'h66;
          default: mant_low = 7'h00;
        endcase
      end
      6'h1a: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h69;
          4'h1: mant_low = 7'h6c;
          4'h2: mant_low = 7'h6f;
          4'h3: mant_low = 7'h71;
          4'h4: mant_low = 7'h74;
          4'h5: mant_low = 7'h77;
          4'h6: mant_low = 7'h7a;
          4'h7: mant_low = 7'h7d;
          4'h8: mant_low = 7'h00;
          4'h9: mant_low = 7'h01;
          4'ha: mant_low = 7'h03;
          4'hb: mant_low = 7'h04;
          4'hc: mant_low = 7'h05;
          4'hd: mant_low = 7'h07;
          4'he: mant_low = 7'h08;
          4'hf: mant_low = 7'h0a;
          default: mant_low = 7'h00;
        endcase
      end
      6'h1b: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h0b;
          4'h1: mant_low = 7'h0d;
          4'h2: mant_low = 7'h0e;
          4'h3: mant_low = 7'h0f;
          4'h4: mant_low = 7'h11;
          4'h5: mant_low = 7'h12;
          4'h6: mant_low = 7'h14;
          4'h7: mant_low = 7'h15;
          4'h8: mant_low = 7'h17;
          4'h9: mant_low = 7'h18;
          4'ha: mant_low = 7'h19;
          4'hb: mant_low = 7'h1b;
          4'hc: mant_low = 7'h1c;
          4'hd: mant_low = 7'h1e;
          4'he: mant_low = 7'h1f;
          4'hf: mant_low = 7'h21;
          default: mant_low = 7'h00;
        endcase
      end
      6'h1c: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h22;
          4'h1: mant_low = 7'h23;
          4'h2: mant_low = 7'h25;
          4'h3: mant_low = 7'h26;
          4'h4: mant_low = 7'h28;
          4'h5: mant_low = 7'h29;
          4'h6: mant_low = 7'h2b;
          4'h7: mant_low = 7'h2c;
          4'h8: mant_low = 7'h2e;
          4'h9: mant_low = 7'h2f;
          4'ha: mant_low = 7'h30;
          4'hb: mant_low = 7'h32;
          4'hc: mant_low = 7'h33;
          4'hd: mant_low = 7'h35;
          4'he: mant_low = 7'h36;
          4'hf: mant_low = 7'h38;
          default: mant_low = 7'h00;
        endcase
      end
      6'h1d: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h39;
          4'h1: mant_low = 7'h3b;
          4'h2: mant_low = 7'h3c;
          4'h3: mant_low = 7'h3d;
          4'h4: mant_low = 7'h3f;
          4'h5: mant_low = 7'h40;
          4'h6: mant_low = 7'h42;
          4'h7: mant_low = 7'h43;
          4'h8: mant_low = 7'h45;
          4'h9: mant_low = 7'h46;
          4'ha: mant_low = 7'h48;
          4'hb: mant_low = 7'h49;
          4'hc: mant_low = 7'h4b;
          4'hd: mant_low = 7'h4c;
          4'he: mant_low = 7'h4e;
          4'hf: mant_low = 7'h4f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h1e: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h50;
          4'h1: mant_low = 7'h52;
          4'h2: mant_low = 7'h53;
          4'h3: mant_low = 7'h55;
          4'h4: mant_low = 7'h56;
          4'h5: mant_low = 7'h58;
          4'h6: mant_low = 7'h59;
          4'h7: mant_low = 7'h5b;
          4'h8: mant_low = 7'h5c;
          4'h9: mant_low = 7'h5e;
          4'ha: mant_low = 7'h5f;
          4'hb: mant_low = 7'h61;
          4'hc: mant_low = 7'h62;
          4'hd: mant_low = 7'h64;
          4'he: mant_low = 7'h65;
          4'hf: mant_low = 7'h67;
          default: mant_low = 7'h00;
        endcase
      end
      6'h1f: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h68;
          4'h1: mant_low = 7'h6a;
          4'h2: mant_low = 7'h6b;
          4'h3: mant_low = 7'h6d;
          4'h4: mant_low = 7'h6e;
          4'h5: mant_low = 7'h70;
          4'h6: mant_low = 7'h71;
          4'h7: mant_low = 7'h73;
          4'h8: mant_low = 7'h74;
          4'h9: mant_low = 7'h76;
          4'ha: mant_low = 7'h77;
          4'hb: mant_low = 7'h79;
          4'hc: mant_low = 7'h7a;
          4'hd: mant_low = 7'h7c;
          4'he: mant_low = 7'h7d;
          4'hf: mant_low = 7'h7f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h20: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h00;
          4'h1: mant_low = 7'h02;
          4'h2: mant_low = 7'h03;
          4'h3: mant_low = 7'h05;
          4'h4: mant_low = 7'h06;
          4'h5: mant_low = 7'h08;
          4'h6: mant_low = 7'h09;
          4'h7: mant_low = 7'h0b;
          4'h8: mant_low = 7'h0c;
          4'h9: mant_low = 7'h0e;
          4'ha: mant_low = 7'h0f;
          4'hb: mant_low = 7'h11;
          4'hc: mant_low = 7'h12;
          4'hd: mant_low = 7'h14;
          4'he: mant_low = 7'h15;
          4'hf: mant_low = 7'h17;
          default: mant_low = 7'h00;
        endcase
      end
      6'h21: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h18;
          4'h1: mant_low = 7'h1a;
          4'h2: mant_low = 7'h1b;
          4'h3: mant_low = 7'h1d;
          4'h4: mant_low = 7'h1e;
          4'h5: mant_low = 7'h20;
          4'h6: mant_low = 7'h21;
          4'h7: mant_low = 7'h23;
          4'h8: mant_low = 7'h24;
          4'h9: mant_low = 7'h26;
          4'ha: mant_low = 7'h27;
          4'hb: mant_low = 7'h29;
          4'hc: mant_low = 7'h2a;
          4'hd: mant_low = 7'h2c;
          4'he: mant_low = 7'h2d;
          4'hf: mant_low = 7'h2f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h22: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h30;
          4'h1: mant_low = 7'h32;
          4'h2: mant_low = 7'h34;
          4'h3: mant_low = 7'h35;
          4'h4: mant_low = 7'h37;
          4'h5: mant_low = 7'h38;
          4'h6: mant_low = 7'h3a;
          4'h7: mant_low = 7'h3b;
          4'h8: mant_low = 7'h3d;
          4'h9: mant_low = 7'h3e;
          4'ha: mant_low = 7'h40;
          4'hb: mant_low = 7'h41;
          4'hc: mant_low = 7'h43;
          4'hd: mant_low = 7'h44;
          4'he: mant_low = 7'h46;
          4'hf: mant_low = 7'h48;
          default: mant_low = 7'h00;
        endcase
      end
      6'h23: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h49;
          4'h1: mant_low = 7'h4b;
          4'h2: mant_low = 7'h4c;
          4'h3: mant_low = 7'h4e;
          4'h4: mant_low = 7'h4f;
          4'h5: mant_low = 7'h51;
          4'h6: mant_low = 7'h52;
          4'h7: mant_low = 7'h54;
          4'h8: mant_low = 7'h56;
          4'h9: mant_low = 7'h57;
          4'ha: mant_low = 7'h59;
          4'hb: mant_low = 7'h5a;
          4'hc: mant_low = 7'h5c;
          4'hd: mant_low = 7'h5d;
          4'he: mant_low = 7'h5f;
          4'hf: mant_low = 7'h60;
          default: mant_low = 7'h00;
        endcase
      end
      6'h24: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h62;
          4'h1: mant_low = 7'h64;
          4'h2: mant_low = 7'h65;
          4'h3: mant_low = 7'h67;
          4'h4: mant_low = 7'h68;
          4'h5: mant_low = 7'h6a;
          4'h6: mant_low = 7'h6b;
          4'h7: mant_low = 7'h6d;
          4'h8: mant_low = 7'h6f;
          4'h9: mant_low = 7'h70;
          4'ha: mant_low = 7'h72;
          4'hb: mant_low = 7'h73;
          4'hc: mant_low = 7'h75;
          4'hd: mant_low = 7'h76;
          4'he: mant_low = 7'h78;
          4'hf: mant_low = 7'h7a;
          default: mant_low = 7'h00;
        endcase
      end
      6'h25: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h7b;
          4'h1: mant_low = 7'h7d;
          4'h2: mant_low = 7'h7e;
          4'h3: mant_low = 7'h00;
          4'h4: mant_low = 7'h01;
          4'h5: mant_low = 7'h03;
          4'h6: mant_low = 7'h05;
          4'h7: mant_low = 7'h06;
          4'h8: mant_low = 7'h08;
          4'h9: mant_low = 7'h09;
          4'ha: mant_low = 7'h0b;
          4'hb: mant_low = 7'h0d;
          4'hc: mant_low = 7'h0e;
          4'hd: mant_low = 7'h10;
          4'he: mant_low = 7'h11;
          4'hf: mant_low = 7'h13;
          default: mant_low = 7'h00;
        endcase
      end
      6'h26: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h14;
          4'h1: mant_low = 7'h16;
          4'h2: mant_low = 7'h18;
          4'h3: mant_low = 7'h19;
          4'h4: mant_low = 7'h1b;
          4'h5: mant_low = 7'h1c;
          4'h6: mant_low = 7'h1e;
          4'h7: mant_low = 7'h20;
          4'h8: mant_low = 7'h21;
          4'h9: mant_low = 7'h23;
          4'ha: mant_low = 7'h24;
          4'hb: mant_low = 7'h26;
          4'hc: mant_low = 7'h28;
          4'hd: mant_low = 7'h29;
          4'he: mant_low = 7'h2b;
          4'hf: mant_low = 7'h2d;
          default: mant_low = 7'h00;
        endcase
      end
      6'h27: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h2e;
          4'h1: mant_low = 7'h30;
          4'h2: mant_low = 7'h31;
          4'h3: mant_low = 7'h33;
          4'h4: mant_low = 7'h35;
          4'h5: mant_low = 7'h36;
          4'h6: mant_low = 7'h38;
          4'h7: mant_low = 7'h39;
          4'h8: mant_low = 7'h3b;
          4'h9: mant_low = 7'h3d;
          4'ha: mant_low = 7'h3e;
          4'hb: mant_low = 7'h40;
          4'hc: mant_low = 7'h42;
          4'hd: mant_low = 7'h43;
          4'he: mant_low = 7'h45;
          4'hf: mant_low = 7'h46;
          default: mant_low = 7'h00;
        endcase
      end
      6'h28: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h48;
          4'h1: mant_low = 7'h4a;
          4'h2: mant_low = 7'h4b;
          4'h3: mant_low = 7'h4d;
          4'h4: mant_low = 7'h4f;
          4'h5: mant_low = 7'h50;
          4'h6: mant_low = 7'h52;
          4'h7: mant_low = 7'h53;
          4'h8: mant_low = 7'h55;
          4'h9: mant_low = 7'h57;
          4'ha: mant_low = 7'h58;
          4'hb: mant_low = 7'h5a;
          4'hc: mant_low = 7'h5c;
          4'hd: mant_low = 7'h5d;
          4'he: mant_low = 7'h5f;
          4'hf: mant_low = 7'h60;
          default: mant_low = 7'h00;
        endcase
      end
      6'h29: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h62;
          4'h1: mant_low = 7'h64;
          4'h2: mant_low = 7'h65;
          4'h3: mant_low = 7'h67;
          4'h4: mant_low = 7'h69;
          4'h5: mant_low = 7'h6a;
          4'h6: mant_low = 7'h6c;
          4'h7: mant_low = 7'h6e;
          4'h8: mant_low = 7'h6f;
          4'h9: mant_low = 7'h71;
          4'ha: mant_low = 7'h73;
          4'hb: mant_low = 7'h74;
          4'hc: mant_low = 7'h76;
          4'hd: mant_low = 7'h78;
          4'he: mant_low = 7'h79;
          4'hf: mant_low = 7'h7b;
          default: mant_low = 7'h00;
        endcase
      end
      6'h2a: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h7c;
          4'h1: mant_low = 7'h7e;
          4'h2: mant_low = 7'h00;
          4'h3: mant_low = 7'h01;
          4'h4: mant_low = 7'h03;
          4'h5: mant_low = 7'h05;
          4'h6: mant_low = 7'h06;
          4'h7: mant_low = 7'h08;
          4'h8: mant_low = 7'h0a;
          4'h9: mant_low = 7'h0b;
          4'ha: mant_low = 7'h0d;
          4'hb: mant_low = 7'h0f;
          4'hc: mant_low = 7'h10;
          4'hd: mant_low = 7'h12;
          4'he: mant_low = 7'h14;
          4'hf: mant_low = 7'h15;
          default: mant_low = 7'h00;
        endcase
      end
      6'h2b: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h17;
          4'h1: mant_low = 7'h19;
          4'h2: mant_low = 7'h1a;
          4'h3: mant_low = 7'h1c;
          4'h4: mant_low = 7'h1e;
          4'h5: mant_low = 7'h1f;
          4'h6: mant_low = 7'h21;
          4'h7: mant_low = 7'h23;
          4'h8: mant_low = 7'h25;
          4'h9: mant_low = 7'h26;
          4'ha: mant_low = 7'h28;
          4'hb: mant_low = 7'h2a;
          4'hc: mant_low = 7'h2b;
          4'hd: mant_low = 7'h2d;
          4'he: mant_low = 7'h2f;
          4'hf: mant_low = 7'h30;
          default: mant_low = 7'h00;
        endcase
      end
      6'h2c: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h32;
          4'h1: mant_low = 7'h34;
          4'h2: mant_low = 7'h35;
          4'h3: mant_low = 7'h37;
          4'h4: mant_low = 7'h39;
          4'h5: mant_low = 7'h3a;
          4'h6: mant_low = 7'h3c;
          4'h7: mant_low = 7'h3e;
          4'h8: mant_low = 7'h40;
          4'h9: mant_low = 7'h41;
          4'ha: mant_low = 7'h43;
          4'hb: mant_low = 7'h45;
          4'hc: mant_low = 7'h46;
          4'hd: mant_low = 7'h48;
          4'he: mant_low = 7'h4a;
          4'hf: mant_low = 7'h4b;
          default: mant_low = 7'h00;
        endcase
      end
      6'h2d: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h4d;
          4'h1: mant_low = 7'h4f;
          4'h2: mant_low = 7'h51;
          4'h3: mant_low = 7'h52;
          4'h4: mant_low = 7'h54;
          4'h5: mant_low = 7'h56;
          4'h6: mant_low = 7'h57;
          4'h7: mant_low = 7'h59;
          4'h8: mant_low = 7'h5b;
          4'h9: mant_low = 7'h5c;
          4'ha: mant_low = 7'h5e;
          4'hb: mant_low = 7'h60;
          4'hc: mant_low = 7'h62;
          4'hd: mant_low = 7'h63;
          4'he: mant_low = 7'h65;
          4'hf: mant_low = 7'h67;
          default: mant_low = 7'h00;
        endcase
      end
      6'h2e: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h68;
          4'h1: mant_low = 7'h6a;
          4'h2: mant_low = 7'h6c;
          4'h3: mant_low = 7'h6e;
          4'h4: mant_low = 7'h6f;
          4'h5: mant_low = 7'h71;
          4'h6: mant_low = 7'h73;
          4'h7: mant_low = 7'h75;
          4'h8: mant_low = 7'h76;
          4'h9: mant_low = 7'h78;
          4'ha: mant_low = 7'h7a;
          4'hb: mant_low = 7'h7b;
          4'hc: mant_low = 7'h7d;
          4'hd: mant_low = 7'h7f;
          4'he: mant_low = 7'h01;
          4'hf: mant_low = 7'h02;
          default: mant_low = 7'h00;
        endcase
      end
      6'h2f: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h04;
          4'h1: mant_low = 7'h06;
          4'h2: mant_low = 7'h08;
          4'h3: mant_low = 7'h09;
          4'h4: mant_low = 7'h0b;
          4'h5: mant_low = 7'h0d;
          4'h6: mant_low = 7'h0f;
          4'h7: mant_low = 7'h10;
          4'h8: mant_low = 7'h12;
          4'h9: mant_low = 7'h14;
          4'ha: mant_low = 7'h16;
          4'hb: mant_low = 7'h17;
          4'hc: mant_low = 7'h19;
          4'hd: mant_low = 7'h1b;
          4'he: mant_low = 7'h1d;
          4'hf: mant_low = 7'h1e;
          default: mant_low = 7'h00;
        endcase
      end
      6'h30: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h20;
          4'h1: mant_low = 7'h22;
          4'h2: mant_low = 7'h24;
          4'h3: mant_low = 7'h25;
          4'h4: mant_low = 7'h27;
          4'h5: mant_low = 7'h29;
          4'h6: mant_low = 7'h2b;
          4'h7: mant_low = 7'h2c;
          4'h8: mant_low = 7'h2e;
          4'h9: mant_low = 7'h30;
          4'ha: mant_low = 7'h32;
          4'hb: mant_low = 7'h33;
          4'hc: mant_low = 7'h35;
          4'hd: mant_low = 7'h37;
          4'he: mant_low = 7'h39;
          4'hf: mant_low = 7'h3a;
          default: mant_low = 7'h00;
        endcase
      end
      6'h31: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h3c;
          4'h1: mant_low = 7'h3e;
          4'h2: mant_low = 7'h40;
          4'h3: mant_low = 7'h41;
          4'h4: mant_low = 7'h43;
          4'h5: mant_low = 7'h45;
          4'h6: mant_low = 7'h47;
          4'h7: mant_low = 7'h49;
          4'h8: mant_low = 7'h4a;
          4'h9: mant_low = 7'h4c;
          4'ha: mant_low = 7'h4e;
          4'hb: mant_low = 7'h50;
          4'hc: mant_low = 7'h51;
          4'hd: mant_low = 7'h53;
          4'he: mant_low = 7'h55;
          4'hf: mant_low = 7'h57;
          default: mant_low = 7'h00;
        endcase
      end
      6'h32: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h58;
          4'h1: mant_low = 7'h5a;
          4'h2: mant_low = 7'h5c;
          4'h3: mant_low = 7'h5e;
          4'h4: mant_low = 7'h60;
          4'h5: mant_low = 7'h61;
          4'h6: mant_low = 7'h63;
          4'h7: mant_low = 7'h65;
          4'h8: mant_low = 7'h67;
          4'h9: mant_low = 7'h69;
          4'ha: mant_low = 7'h6a;
          4'hb: mant_low = 7'h6c;
          4'hc: mant_low = 7'h6e;
          4'hd: mant_low = 7'h70;
          4'he: mant_low = 7'h72;
          4'hf: mant_low = 7'h73;
          default: mant_low = 7'h00;
        endcase
      end
      6'h33: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h75;
          4'h1: mant_low = 7'h77;
          4'h2: mant_low = 7'h79;
          4'h3: mant_low = 7'h7b;
          4'h4: mant_low = 7'h7c;
          4'h5: mant_low = 7'h7e;
          4'h6: mant_low = 7'h00;
          4'h7: mant_low = 7'h02;
          4'h8: mant_low = 7'h04;
          4'h9: mant_low = 7'h05;
          4'ha: mant_low = 7'h07;
          4'hb: mant_low = 7'h09;
          4'hc: mant_low = 7'h0b;
          4'hd: mant_low = 7'h0d;
          4'he: mant_low = 7'h0e;
          4'hf: mant_low = 7'h10;
          default: mant_low = 7'h00;
        endcase
      end
      6'h34: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h12;
          4'h1: mant_low = 7'h14;
          4'h2: mant_low = 7'h16;
          4'h3: mant_low = 7'h17;
          4'h4: mant_low = 7'h19;
          4'h5: mant_low = 7'h1b;
          4'h6: mant_low = 7'h1d;
          4'h7: mant_low = 7'h1f;
          4'h8: mant_low = 7'h21;
          4'h9: mant_low = 7'h22;
          4'ha: mant_low = 7'h24;
          4'hb: mant_low = 7'h26;
          4'hc: mant_low = 7'h28;
          4'hd: mant_low = 7'h2a;
          4'he: mant_low = 7'h2b;
          4'hf: mant_low = 7'h2d;
          default: mant_low = 7'h00;
        endcase
      end
      6'h35: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h2f;
          4'h1: mant_low = 7'h31;
          4'h2: mant_low = 7'h33;
          4'h3: mant_low = 7'h35;
          4'h4: mant_low = 7'h36;
          4'h5: mant_low = 7'h38;
          4'h6: mant_low = 7'h3a;
          4'h7: mant_low = 7'h3c;
          4'h8: mant_low = 7'h3e;
          4'h9: mant_low = 7'h40;
          4'ha: mant_low = 7'h41;
          4'hb: mant_low = 7'h43;
          4'hc: mant_low = 7'h45;
          4'hd: mant_low = 7'h47;
          4'he: mant_low = 7'h49;
          4'hf: mant_low = 7'h4b;
          default: mant_low = 7'h00;
        endcase
      end
      6'h36: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h4c;
          4'h1: mant_low = 7'h4e;
          4'h2: mant_low = 7'h50;
          4'h3: mant_low = 7'h52;
          4'h4: mant_low = 7'h54;
          4'h5: mant_low = 7'h56;
          4'h6: mant_low = 7'h58;
          4'h7: mant_low = 7'h59;
          4'h8: mant_low = 7'h5b;
          4'h9: mant_low = 7'h5d;
          4'ha: mant_low = 7'h5f;
          4'hb: mant_low = 7'h61;
          4'hc: mant_low = 7'h63;
          4'hd: mant_low = 7'h65;
          4'he: mant_low = 7'h66;
          4'hf: mant_low = 7'h68;
          default: mant_low = 7'h00;
        endcase
      end
      6'h37: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h6a;
          4'h1: mant_low = 7'h6c;
          4'h2: mant_low = 7'h6e;
          4'h3: mant_low = 7'h70;
          4'h4: mant_low = 7'h72;
          4'h5: mant_low = 7'h73;
          4'h6: mant_low = 7'h75;
          4'h7: mant_low = 7'h77;
          4'h8: mant_low = 7'h79;
          4'h9: mant_low = 7'h7b;
          4'ha: mant_low = 7'h7d;
          4'hb: mant_low = 7'h7f;
          4'hc: mant_low = 7'h01;
          4'hd: mant_low = 7'h02;
          4'he: mant_low = 7'h04;
          4'hf: mant_low = 7'h06;
          default: mant_low = 7'h00;
        endcase
      end
      6'h38: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h08;
          4'h1: mant_low = 7'h0a;
          4'h2: mant_low = 7'h0c;
          4'h3: mant_low = 7'h0e;
          4'h4: mant_low = 7'h10;
          4'h5: mant_low = 7'h11;
          4'h6: mant_low = 7'h13;
          4'h7: mant_low = 7'h15;
          4'h8: mant_low = 7'h17;
          4'h9: mant_low = 7'h19;
          4'ha: mant_low = 7'h1b;
          4'hb: mant_low = 7'h1d;
          4'hc: mant_low = 7'h1f;
          4'hd: mant_low = 7'h20;
          4'he: mant_low = 7'h22;
          4'hf: mant_low = 7'h24;
          default: mant_low = 7'h00;
        endcase
      end
      6'h39: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h26;
          4'h1: mant_low = 7'h28;
          4'h2: mant_low = 7'h2a;
          4'h3: mant_low = 7'h2c;
          4'h4: mant_low = 7'h2e;
          4'h5: mant_low = 7'h30;
          4'h6: mant_low = 7'h31;
          4'h7: mant_low = 7'h33;
          4'h8: mant_low = 7'h35;
          4'h9: mant_low = 7'h37;
          4'ha: mant_low = 7'h39;
          4'hb: mant_low = 7'h3b;
          4'hc: mant_low = 7'h3d;
          4'hd: mant_low = 7'h3f;
          4'he: mant_low = 7'h41;
          4'hf: mant_low = 7'h43;
          default: mant_low = 7'h00;
        endcase
      end
      6'h3a: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h44;
          4'h1: mant_low = 7'h46;
          4'h2: mant_low = 7'h48;
          4'h3: mant_low = 7'h4a;
          4'h4: mant_low = 7'h4c;
          4'h5: mant_low = 7'h4e;
          4'h6: mant_low = 7'h50;
          4'h7: mant_low = 7'h52;
          4'h8: mant_low = 7'h54;
          4'h9: mant_low = 7'h56;
          4'ha: mant_low = 7'h58;
          4'hb: mant_low = 7'h5a;
          4'hc: mant_low = 7'h5b;
          4'hd: mant_low = 7'h5d;
          4'he: mant_low = 7'h5f;
          4'hf: mant_low = 7'h61;
          default: mant_low = 7'h00;
        endcase
      end
      6'h3b: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h63;
          4'h1: mant_low = 7'h65;
          4'h2: mant_low = 7'h67;
          4'h3: mant_low = 7'h69;
          4'h4: mant_low = 7'h6b;
          4'h5: mant_low = 7'h6d;
          4'h6: mant_low = 7'h6f;
          4'h7: mant_low = 7'h71;
          4'h8: mant_low = 7'h73;
          4'h9: mant_low = 7'h74;
          4'ha: mant_low = 7'h76;
          4'hb: mant_low = 7'h78;
          4'hc: mant_low = 7'h7a;
          4'hd: mant_low = 7'h7c;
          4'he: mant_low = 7'h7e;
          4'hf: mant_low = 7'h00;
          default: mant_low = 7'h00;
        endcase
      end
      6'h3c: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h02;
          4'h1: mant_low = 7'h04;
          4'h2: mant_low = 7'h06;
          4'h3: mant_low = 7'h08;
          4'h4: mant_low = 7'h0a;
          4'h5: mant_low = 7'h0c;
          4'h6: mant_low = 7'h0e;
          4'h7: mant_low = 7'h10;
          4'h8: mant_low = 7'h12;
          4'h9: mant_low = 7'h13;
          4'ha: mant_low = 7'h15;
          4'hb: mant_low = 7'h17;
          4'hc: mant_low = 7'h19;
          4'hd: mant_low = 7'h1b;
          4'he: mant_low = 7'h1d;
          4'hf: mant_low = 7'h1f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h3d: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h21;
          4'h1: mant_low = 7'h23;
          4'h2: mant_low = 7'h25;
          4'h3: mant_low = 7'h27;
          4'h4: mant_low = 7'h29;
          4'h5: mant_low = 7'h2b;
          4'h6: mant_low = 7'h2d;
          4'h7: mant_low = 7'h2f;
          4'h8: mant_low = 7'h31;
          4'h9: mant_low = 7'h33;
          4'ha: mant_low = 7'h35;
          4'hb: mant_low = 7'h37;
          4'hc: mant_low = 7'h39;
          4'hd: mant_low = 7'h3b;
          4'he: mant_low = 7'h3d;
          4'hf: mant_low = 7'h3f;
          default: mant_low = 7'h00;
        endcase
      end
      6'h3e: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h40;
          4'h1: mant_low = 7'h42;
          4'h2: mant_low = 7'h44;
          4'h3: mant_low = 7'h46;
          4'h4: mant_low = 7'h48;
          4'h5: mant_low = 7'h4a;
          4'h6: mant_low = 7'h4c;
          4'h7: mant_low = 7'h4e;
          4'h8: mant_low = 7'h50;
          4'h9: mant_low = 7'h52;
          4'ha: mant_low = 7'h54;
          4'hb: mant_low = 7'h56;
          4'hc: mant_low = 7'h58;
          4'hd: mant_low = 7'h5a;
          4'he: mant_low = 7'h5c;
          4'hf: mant_low = 7'h5e;
          default: mant_low = 7'h00;
        endcase
      end
      6'h3f: begin
        case (mant[3:0])
          4'h0: mant_low = 7'h60;
          4'h1: mant_low = 7'h62;
          4'h2: mant_low = 7'h64;
          4'h3: mant_low = 7'h66;
          4'h4: mant_low = 7'h68;
          4'h5: mant_low = 7'h6a;
          4'h6: mant_low = 7'h6c;
          4'h7: mant_low = 7'h6e;
          4'h8: mant_low = 7'h70;
          4'h9: mant_low = 7'h72;
          4'ha: mant_low = 7'h74;
          4'hb: mant_low = 7'h76;
          4'hc: mant_low = 7'h78;
          4'hd: mant_low = 7'h7a;
          4'he: mant_low = 7'h7c;
          4'hf: mant_low = 7'h7e;
          default: mant_low = 7'h00;
        endcase
      end
      default: mant_low = 7'h00;
    endcase
  end
  reg mant_b9;
  always @* begin
    if (mant <= 10'h1a7) begin
      if (mant <= 10'h0e5) begin
        mant_b9 = 0;
      end else begin
        mant_b9 = 1;
      end
    end else begin
      if (mant <= 10'h2ed) begin
        mant_b9 = 0;
      end else begin
        mant_b9 = 1;
      end
    end
  end
  reg mant_b8;
  always @* begin
    if (mant <= 10'h1a7) begin
      if (mant <= 10'h0e5) begin
        if (mant <= 10'h078) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end else begin
        if (mant <= 10'h14a) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end
    end else begin
      if (mant <= 10'h2ed) begin
        if (mant <= 10'h252) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end else begin
        if (mant <= 10'h37b) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end
    end
  end
  reg mant_b7;
  always @* begin
    if (mant <= 10'h1a7) begin
      if (mant <= 10'h0e5) begin
        if (mant <= 10'h078) begin
          if (mant <= 10'h03d) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end else begin
          if (mant <= 10'h0b0) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end
      end else begin
        if (mant <= 10'h14a) begin
          if (mant <= 10'h119) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end else begin
          if (mant <= 10'h179) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end
      end
    end else begin
      if (mant <= 10'h2ed) begin
        if (mant <= 10'h252) begin
          if (mant <= 10'h1ff) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end else begin
          if (mant <= 10'h2a1) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end
      end else begin
        if (mant <= 10'h37b) begin
          if (mant <= 10'h335) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end else begin
          if (mant <= 10'h3be) begin
            mant_b7 = 0;
          end else begin
            mant_b7 = 1;
          end
        end
      end
    end
  end
  wire [9:0] out_mant = {mant_b9, mant_b8, mant_b7, mant_low};
  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;
endmodule
