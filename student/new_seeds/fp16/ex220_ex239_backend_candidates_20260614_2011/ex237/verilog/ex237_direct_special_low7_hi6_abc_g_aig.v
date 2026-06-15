module ex237_direct_special_low7_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire active = (exp >= 5'd1) && (exp <= 5'd30);
  wire [15:0] special_out = (exp == 5'd0) ? {sign, 15'h0000} :
                           ((mant == 10'h000) ? {sign, 5'h1f, 10'h000} : 16'h7e00);
  reg [1:0] cls;
  always @* begin
    case (exp)
      5'h01: cls = 2'h1;
      5'h02: cls = 2'h2;
      5'h03: cls = 2'h0;
      5'h04: cls = 2'h1;
      5'h05: cls = 2'h2;
      5'h06: cls = 2'h0;
      5'h07: cls = 2'h1;
      5'h08: cls = 2'h2;
      5'h09: cls = 2'h0;
      5'h0a: cls = 2'h1;
      5'h0b: cls = 2'h2;
      5'h0c: cls = 2'h0;
      5'h0d: cls = 2'h1;
      5'h0e: cls = 2'h2;
      5'h0f: cls = 2'h0;
      5'h10: cls = 2'h1;
      5'h11: cls = 2'h2;
      5'h12: cls = 2'h0;
      5'h13: cls = 2'h1;
      5'h14: cls = 2'h2;
      5'h15: cls = 2'h0;
      5'h16: cls = 2'h1;
      5'h17: cls = 2'h2;
      5'h18: cls = 2'h0;
      5'h19: cls = 2'h1;
      5'h1a: cls = 2'h2;
      5'h1b: cls = 2'h0;
      5'h1c: cls = 2'h1;
      5'h1d: cls = 2'h2;
      5'h1e: cls = 2'h0;
      default: cls = 2'd0;
    endcase
  end
  reg [6:0] out_low;
  always @* begin
    case (cls)
      2'h0: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 7'h00;
            4'h1: out_low = 7'h00;
            4'h2: out_low = 7'h01;
            4'h3: out_low = 7'h01;
            4'h4: out_low = 7'h01;
            4'h5: out_low = 7'h02;
            4'h6: out_low = 7'h02;
            4'h7: out_low = 7'h02;
            4'h8: out_low = 7'h03;
            4'h9: out_low = 7'h03;
            4'ha: out_low = 7'h03;
            4'hb: out_low = 7'h04;
            4'hc: out_low = 7'h04;
            4'hd: out_low = 7'h04;
            4'he: out_low = 7'h05;
            4'hf: out_low = 7'h05;
            default: out_low = 7'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 7'h05;
            4'h1: out_low = 7'h06;
            4'h2: out_low = 7'h06;
            4'h3: out_low = 7'h06;
            4'h4: out_low = 7'h07;
            4'h5: out_low = 7'h07;
            4'h6: out_low = 7'h07;
            4'h7: out_low = 7'h08;
            4'h8: out_low = 7'h08;
            4'h9: out_low = 7'h08;
            4'ha: out_low = 7'h09;
            4'hb: out_low = 7'h09;
            4'hc: out_low = 7'h09;
            4'hd: out_low = 7'h0a;
            4'he: out_low = 7'h0a;
            4'hf: out_low = 7'h0a;
            default: out_low = 7'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0b;
            4'h1: out_low = 7'h0b;
            4'h2: out_low = 7'h0b;
            4'h3: out_low = 7'h0c;
            4'h4: out_low = 7'h0c;
            4'h5: out_low = 7'h0c;
            4'h6: out_low = 7'h0d;
            4'h7: out_low = 7'h0d;
            4'h8: out_low = 7'h0d;
            4'h9: out_low = 7'h0d;
            4'ha: out_low = 7'h0e;
            4'hb: out_low = 7'h0e;
            4'hc: out_low = 7'h0e;
            4'hd: out_low = 7'h0f;
            4'he: out_low = 7'h0f;
            4'hf: out_low = 7'h0f;
            default: out_low = 7'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 7'h10;
            4'h1: out_low = 7'h10;
            4'h2: out_low = 7'h10;
            4'h3: out_low = 7'h11;
            4'h4: out_low = 7'h11;
            4'h5: out_low = 7'h11;
            4'h6: out_low = 7'h12;
            4'h7: out_low = 7'h12;
            4'h8: out_low = 7'h12;
            4'h9: out_low = 7'h13;
            4'ha: out_low = 7'h13;
            4'hb: out_low = 7'h13;
            4'hc: out_low = 7'h14;
            4'hd: out_low = 7'h14;
            4'he: out_low = 7'h14;
            4'hf: out_low = 7'h15;
            default: out_low = 7'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 7'h15;
            4'h1: out_low = 7'h15;
            4'h2: out_low = 7'h16;
            4'h3: out_low = 7'h16;
            4'h4: out_low = 7'h16;
            4'h5: out_low = 7'h17;
            4'h6: out_low = 7'h17;
            4'h7: out_low = 7'h17;
            4'h8: out_low = 7'h17;
            4'h9: out_low = 7'h18;
            4'ha: out_low = 7'h18;
            4'hb: out_low = 7'h18;
            4'hc: out_low = 7'h19;
            4'hd: out_low = 7'h19;
            4'he: out_low = 7'h19;
            4'hf: out_low = 7'h1a;
            default: out_low = 7'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1a;
            4'h1: out_low = 7'h1a;
            4'h2: out_low = 7'h1b;
            4'h3: out_low = 7'h1b;
            4'h4: out_low = 7'h1b;
            4'h5: out_low = 7'h1c;
            4'h6: out_low = 7'h1c;
            4'h7: out_low = 7'h1c;
            4'h8: out_low = 7'h1d;
            4'h9: out_low = 7'h1d;
            4'ha: out_low = 7'h1d;
            4'hb: out_low = 7'h1d;
            4'hc: out_low = 7'h1e;
            4'hd: out_low = 7'h1e;
            4'he: out_low = 7'h1e;
            4'hf: out_low = 7'h1f;
            default: out_low = 7'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1f;
            4'h1: out_low = 7'h1f;
            4'h2: out_low = 7'h20;
            4'h3: out_low = 7'h20;
            4'h4: out_low = 7'h20;
            4'h5: out_low = 7'h21;
            4'h6: out_low = 7'h21;
            4'h7: out_low = 7'h21;
            4'h8: out_low = 7'h22;
            4'h9: out_low = 7'h22;
            4'ha: out_low = 7'h22;
            4'hb: out_low = 7'h22;
            4'hc: out_low = 7'h23;
            4'hd: out_low = 7'h23;
            4'he: out_low = 7'h23;
            4'hf: out_low = 7'h24;
            default: out_low = 7'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 7'h24;
            4'h1: out_low = 7'h24;
            4'h2: out_low = 7'h25;
            4'h3: out_low = 7'h25;
            4'h4: out_low = 7'h25;
            4'h5: out_low = 7'h26;
            4'h6: out_low = 7'h26;
            4'h7: out_low = 7'h26;
            4'h8: out_low = 7'h27;
            4'h9: out_low = 7'h27;
            4'ha: out_low = 7'h27;
            4'hb: out_low = 7'h27;
            4'hc: out_low = 7'h28;
            4'hd: out_low = 7'h28;
            4'he: out_low = 7'h28;
            4'hf: out_low = 7'h29;
            default: out_low = 7'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 7'h29;
            4'h1: out_low = 7'h29;
            4'h2: out_low = 7'h2a;
            4'h3: out_low = 7'h2a;
            4'h4: out_low = 7'h2a;
            4'h5: out_low = 7'h2b;
            4'h6: out_low = 7'h2b;
            4'h7: out_low = 7'h2b;
            4'h8: out_low = 7'h2b;
            4'h9: out_low = 7'h2c;
            4'ha: out_low = 7'h2c;
            4'hb: out_low = 7'h2c;
            4'hc: out_low = 7'h2d;
            4'hd: out_low = 7'h2d;
            4'he: out_low = 7'h2d;
            4'hf: out_low = 7'h2e;
            default: out_low = 7'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2e;
            4'h1: out_low = 7'h2e;
            4'h2: out_low = 7'h2f;
            4'h3: out_low = 7'h2f;
            4'h4: out_low = 7'h2f;
            4'h5: out_low = 7'h2f;
            4'h6: out_low = 7'h30;
            4'h7: out_low = 7'h30;
            4'h8: out_low = 7'h30;
            4'h9: out_low = 7'h31;
            4'ha: out_low = 7'h31;
            4'hb: out_low = 7'h31;
            4'hc: out_low = 7'h32;
            4'hd: out_low = 7'h32;
            4'he: out_low = 7'h32;
            4'hf: out_low = 7'h32;
            default: out_low = 7'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h33;
            4'h1: out_low = 7'h33;
            4'h2: out_low = 7'h33;
            4'h3: out_low = 7'h34;
            4'h4: out_low = 7'h34;
            4'h5: out_low = 7'h34;
            4'h6: out_low = 7'h35;
            4'h7: out_low = 7'h35;
            4'h8: out_low = 7'h35;
            4'h9: out_low = 7'h35;
            4'ha: out_low = 7'h36;
            4'hb: out_low = 7'h36;
            4'hc: out_low = 7'h36;
            4'hd: out_low = 7'h37;
            4'he: out_low = 7'h37;
            4'hf: out_low = 7'h37;
            default: out_low = 7'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h38;
            4'h1: out_low = 7'h38;
            4'h2: out_low = 7'h38;
            4'h3: out_low = 7'h38;
            4'h4: out_low = 7'h39;
            4'h5: out_low = 7'h39;
            4'h6: out_low = 7'h39;
            4'h7: out_low = 7'h3a;
            4'h8: out_low = 7'h3a;
            4'h9: out_low = 7'h3a;
            4'ha: out_low = 7'h3b;
            4'hb: out_low = 7'h3b;
            4'hc: out_low = 7'h3b;
            4'hd: out_low = 7'h3b;
            4'he: out_low = 7'h3c;
            4'hf: out_low = 7'h3c;
            default: out_low = 7'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3c;
            4'h1: out_low = 7'h3d;
            4'h2: out_low = 7'h3d;
            4'h3: out_low = 7'h3d;
            4'h4: out_low = 7'h3e;
            4'h5: out_low = 7'h3e;
            4'h6: out_low = 7'h3e;
            4'h7: out_low = 7'h3e;
            4'h8: out_low = 7'h3f;
            4'h9: out_low = 7'h3f;
            4'ha: out_low = 7'h3f;
            4'hb: out_low = 7'h40;
            4'hc: out_low = 7'h40;
            4'hd: out_low = 7'h40;
            4'he: out_low = 7'h41;
            4'hf: out_low = 7'h41;
            default: out_low = 7'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h41;
            4'h1: out_low = 7'h41;
            4'h2: out_low = 7'h42;
            4'h3: out_low = 7'h42;
            4'h4: out_low = 7'h42;
            4'h5: out_low = 7'h43;
            4'h6: out_low = 7'h43;
            4'h7: out_low = 7'h43;
            4'h8: out_low = 7'h43;
            4'h9: out_low = 7'h44;
            4'ha: out_low = 7'h44;
            4'hb: out_low = 7'h44;
            4'hc: out_low = 7'h45;
            4'hd: out_low = 7'h45;
            4'he: out_low = 7'h45;
            4'hf: out_low = 7'h46;
            default: out_low = 7'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h46;
            4'h1: out_low = 7'h46;
            4'h2: out_low = 7'h46;
            4'h3: out_low = 7'h47;
            4'h4: out_low = 7'h47;
            4'h5: out_low = 7'h47;
            4'h6: out_low = 7'h48;
            4'h7: out_low = 7'h48;
            4'h8: out_low = 7'h48;
            4'h9: out_low = 7'h48;
            4'ha: out_low = 7'h49;
            4'hb: out_low = 7'h49;
            4'hc: out_low = 7'h49;
            4'hd: out_low = 7'h4a;
            4'he: out_low = 7'h4a;
            4'hf: out_low = 7'h4a;
            default: out_low = 7'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4a;
            4'h1: out_low = 7'h4b;
            4'h2: out_low = 7'h4b;
            4'h3: out_low = 7'h4b;
            4'h4: out_low = 7'h4c;
            4'h5: out_low = 7'h4c;
            4'h6: out_low = 7'h4c;
            4'h7: out_low = 7'h4c;
            4'h8: out_low = 7'h4d;
            4'h9: out_low = 7'h4d;
            4'ha: out_low = 7'h4d;
            4'hb: out_low = 7'h4e;
            4'hc: out_low = 7'h4e;
            4'hd: out_low = 7'h4e;
            4'he: out_low = 7'h4e;
            4'hf: out_low = 7'h4f;
            default: out_low = 7'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4f;
            4'h1: out_low = 7'h4f;
            4'h2: out_low = 7'h50;
            4'h3: out_low = 7'h50;
            4'h4: out_low = 7'h50;
            4'h5: out_low = 7'h51;
            4'h6: out_low = 7'h51;
            4'h7: out_low = 7'h51;
            4'h8: out_low = 7'h51;
            4'h9: out_low = 7'h52;
            4'ha: out_low = 7'h52;
            4'hb: out_low = 7'h52;
            4'hc: out_low = 7'h53;
            4'hd: out_low = 7'h53;
            4'he: out_low = 7'h53;
            4'hf: out_low = 7'h53;
            default: out_low = 7'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 7'h54;
            4'h1: out_low = 7'h54;
            4'h2: out_low = 7'h54;
            4'h3: out_low = 7'h55;
            4'h4: out_low = 7'h55;
            4'h5: out_low = 7'h55;
            4'h6: out_low = 7'h55;
            4'h7: out_low = 7'h56;
            4'h8: out_low = 7'h56;
            4'h9: out_low = 7'h56;
            4'ha: out_low = 7'h56;
            4'hb: out_low = 7'h57;
            4'hc: out_low = 7'h57;
            4'hd: out_low = 7'h57;
            4'he: out_low = 7'h58;
            4'hf: out_low = 7'h58;
            default: out_low = 7'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 7'h58;
            4'h1: out_low = 7'h58;
            4'h2: out_low = 7'h59;
            4'h3: out_low = 7'h59;
            4'h4: out_low = 7'h59;
            4'h5: out_low = 7'h5a;
            4'h6: out_low = 7'h5a;
            4'h7: out_low = 7'h5a;
            4'h8: out_low = 7'h5a;
            4'h9: out_low = 7'h5b;
            4'ha: out_low = 7'h5b;
            4'hb: out_low = 7'h5b;
            4'hc: out_low = 7'h5c;
            4'hd: out_low = 7'h5c;
            4'he: out_low = 7'h5c;
            4'hf: out_low = 7'h5c;
            default: out_low = 7'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5d;
            4'h1: out_low = 7'h5d;
            4'h2: out_low = 7'h5d;
            4'h3: out_low = 7'h5e;
            4'h4: out_low = 7'h5e;
            4'h5: out_low = 7'h5e;
            4'h6: out_low = 7'h5e;
            4'h7: out_low = 7'h5f;
            4'h8: out_low = 7'h5f;
            4'h9: out_low = 7'h5f;
            4'ha: out_low = 7'h5f;
            4'hb: out_low = 7'h60;
            4'hc: out_low = 7'h60;
            4'hd: out_low = 7'h60;
            4'he: out_low = 7'h61;
            4'hf: out_low = 7'h61;
            default: out_low = 7'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 7'h61;
            4'h1: out_low = 7'h61;
            4'h2: out_low = 7'h62;
            4'h3: out_low = 7'h62;
            4'h4: out_low = 7'h62;
            4'h5: out_low = 7'h63;
            4'h6: out_low = 7'h63;
            4'h7: out_low = 7'h63;
            4'h8: out_low = 7'h63;
            4'h9: out_low = 7'h64;
            4'ha: out_low = 7'h64;
            4'hb: out_low = 7'h64;
            4'hc: out_low = 7'h64;
            4'hd: out_low = 7'h65;
            4'he: out_low = 7'h65;
            4'hf: out_low = 7'h65;
            default: out_low = 7'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 7'h66;
            4'h1: out_low = 7'h66;
            4'h2: out_low = 7'h66;
            4'h3: out_low = 7'h66;
            4'h4: out_low = 7'h67;
            4'h5: out_low = 7'h67;
            4'h6: out_low = 7'h67;
            4'h7: out_low = 7'h68;
            4'h8: out_low = 7'h68;
            4'h9: out_low = 7'h68;
            4'ha: out_low = 7'h68;
            4'hb: out_low = 7'h69;
            4'hc: out_low = 7'h69;
            4'hd: out_low = 7'h69;
            4'he: out_low = 7'h69;
            4'hf: out_low = 7'h6a;
            default: out_low = 7'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6a;
            4'h1: out_low = 7'h6a;
            4'h2: out_low = 7'h6b;
            4'h3: out_low = 7'h6b;
            4'h4: out_low = 7'h6b;
            4'h5: out_low = 7'h6b;
            4'h6: out_low = 7'h6c;
            4'h7: out_low = 7'h6c;
            4'h8: out_low = 7'h6c;
            4'h9: out_low = 7'h6c;
            4'ha: out_low = 7'h6d;
            4'hb: out_low = 7'h6d;
            4'hc: out_low = 7'h6d;
            4'hd: out_low = 7'h6e;
            4'he: out_low = 7'h6e;
            4'hf: out_low = 7'h6e;
            default: out_low = 7'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6e;
            4'h1: out_low = 7'h6f;
            4'h2: out_low = 7'h6f;
            4'h3: out_low = 7'h6f;
            4'h4: out_low = 7'h6f;
            4'h5: out_low = 7'h70;
            4'h6: out_low = 7'h70;
            4'h7: out_low = 7'h70;
            4'h8: out_low = 7'h71;
            4'h9: out_low = 7'h71;
            4'ha: out_low = 7'h71;
            4'hb: out_low = 7'h71;
            4'hc: out_low = 7'h72;
            4'hd: out_low = 7'h72;
            4'he: out_low = 7'h72;
            4'hf: out_low = 7'h72;
            default: out_low = 7'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 7'h73;
            4'h1: out_low = 7'h73;
            4'h2: out_low = 7'h73;
            4'h3: out_low = 7'h73;
            4'h4: out_low = 7'h74;
            4'h5: out_low = 7'h74;
            4'h6: out_low = 7'h74;
            4'h7: out_low = 7'h75;
            4'h8: out_low = 7'h75;
            4'h9: out_low = 7'h75;
            4'ha: out_low = 7'h75;
            4'hb: out_low = 7'h76;
            4'hc: out_low = 7'h76;
            4'hd: out_low = 7'h76;
            4'he: out_low = 7'h76;
            4'hf: out_low = 7'h77;
            default: out_low = 7'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 7'h77;
            4'h1: out_low = 7'h77;
            4'h2: out_low = 7'h78;
            4'h3: out_low = 7'h78;
            4'h4: out_low = 7'h78;
            4'h5: out_low = 7'h78;
            4'h6: out_low = 7'h79;
            4'h7: out_low = 7'h79;
            4'h8: out_low = 7'h79;
            4'h9: out_low = 7'h79;
            4'ha: out_low = 7'h7a;
            4'hb: out_low = 7'h7a;
            4'hc: out_low = 7'h7a;
            4'hd: out_low = 7'h7a;
            4'he: out_low = 7'h7b;
            4'hf: out_low = 7'h7b;
            default: out_low = 7'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7b;
            4'h1: out_low = 7'h7c;
            4'h2: out_low = 7'h7c;
            4'h3: out_low = 7'h7c;
            4'h4: out_low = 7'h7c;
            4'h5: out_low = 7'h7d;
            4'h6: out_low = 7'h7d;
            4'h7: out_low = 7'h7d;
            4'h8: out_low = 7'h7d;
            4'h9: out_low = 7'h7e;
            4'ha: out_low = 7'h7e;
            4'hb: out_low = 7'h7e;
            4'hc: out_low = 7'h7e;
            4'hd: out_low = 7'h7f;
            4'he: out_low = 7'h7f;
            4'hf: out_low = 7'h7f;
            default: out_low = 7'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7f;
            4'h1: out_low = 7'h00;
            4'h2: out_low = 7'h00;
            4'h3: out_low = 7'h00;
            4'h4: out_low = 7'h01;
            4'h5: out_low = 7'h01;
            4'h6: out_low = 7'h01;
            4'h7: out_low = 7'h01;
            4'h8: out_low = 7'h02;
            4'h9: out_low = 7'h02;
            4'ha: out_low = 7'h02;
            4'hb: out_low = 7'h02;
            4'hc: out_low = 7'h03;
            4'hd: out_low = 7'h03;
            4'he: out_low = 7'h03;
            4'hf: out_low = 7'h03;
            default: out_low = 7'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h04;
            4'h1: out_low = 7'h04;
            4'h2: out_low = 7'h04;
            4'h3: out_low = 7'h04;
            4'h4: out_low = 7'h05;
            4'h5: out_low = 7'h05;
            4'h6: out_low = 7'h05;
            4'h7: out_low = 7'h06;
            4'h8: out_low = 7'h06;
            4'h9: out_low = 7'h06;
            4'ha: out_low = 7'h06;
            4'hb: out_low = 7'h07;
            4'hc: out_low = 7'h07;
            4'hd: out_low = 7'h07;
            4'he: out_low = 7'h07;
            4'hf: out_low = 7'h08;
            default: out_low = 7'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h08;
            4'h1: out_low = 7'h08;
            4'h2: out_low = 7'h08;
            4'h3: out_low = 7'h09;
            4'h4: out_low = 7'h09;
            4'h5: out_low = 7'h09;
            4'h6: out_low = 7'h09;
            4'h7: out_low = 7'h0a;
            4'h8: out_low = 7'h0a;
            4'h9: out_low = 7'h0a;
            4'ha: out_low = 7'h0a;
            4'hb: out_low = 7'h0b;
            4'hc: out_low = 7'h0b;
            4'hd: out_low = 7'h0b;
            4'he: out_low = 7'h0b;
            4'hf: out_low = 7'h0c;
            default: out_low = 7'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0c;
            4'h1: out_low = 7'h0c;
            4'h2: out_low = 7'h0d;
            4'h3: out_low = 7'h0d;
            4'h4: out_low = 7'h0d;
            4'h5: out_low = 7'h0d;
            4'h6: out_low = 7'h0e;
            4'h7: out_low = 7'h0e;
            4'h8: out_low = 7'h0e;
            4'h9: out_low = 7'h0e;
            4'ha: out_low = 7'h0f;
            4'hb: out_low = 7'h0f;
            4'hc: out_low = 7'h0f;
            4'hd: out_low = 7'h0f;
            4'he: out_low = 7'h10;
            4'hf: out_low = 7'h10;
            default: out_low = 7'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h10;
            4'h1: out_low = 7'h10;
            4'h2: out_low = 7'h11;
            4'h3: out_low = 7'h11;
            4'h4: out_low = 7'h11;
            4'h5: out_low = 7'h11;
            4'h6: out_low = 7'h12;
            4'h7: out_low = 7'h12;
            4'h8: out_low = 7'h12;
            4'h9: out_low = 7'h12;
            4'ha: out_low = 7'h13;
            4'hb: out_low = 7'h13;
            4'hc: out_low = 7'h13;
            4'hd: out_low = 7'h13;
            4'he: out_low = 7'h14;
            4'hf: out_low = 7'h14;
            default: out_low = 7'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 7'h14;
            4'h1: out_low = 7'h14;
            4'h2: out_low = 7'h15;
            4'h3: out_low = 7'h15;
            4'h4: out_low = 7'h15;
            4'h5: out_low = 7'h15;
            4'h6: out_low = 7'h16;
            4'h7: out_low = 7'h16;
            4'h8: out_low = 7'h16;
            4'h9: out_low = 7'h16;
            4'ha: out_low = 7'h17;
            4'hb: out_low = 7'h17;
            4'hc: out_low = 7'h17;
            4'hd: out_low = 7'h17;
            4'he: out_low = 7'h18;
            4'hf: out_low = 7'h18;
            default: out_low = 7'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 7'h18;
            4'h1: out_low = 7'h18;
            4'h2: out_low = 7'h19;
            4'h3: out_low = 7'h19;
            4'h4: out_low = 7'h19;
            4'h5: out_low = 7'h1a;
            4'h6: out_low = 7'h1a;
            4'h7: out_low = 7'h1a;
            4'h8: out_low = 7'h1a;
            4'h9: out_low = 7'h1b;
            4'ha: out_low = 7'h1b;
            4'hb: out_low = 7'h1b;
            4'hc: out_low = 7'h1b;
            4'hd: out_low = 7'h1c;
            4'he: out_low = 7'h1c;
            4'hf: out_low = 7'h1c;
            default: out_low = 7'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1c;
            4'h1: out_low = 7'h1d;
            4'h2: out_low = 7'h1d;
            4'h3: out_low = 7'h1d;
            4'h4: out_low = 7'h1d;
            4'h5: out_low = 7'h1e;
            4'h6: out_low = 7'h1e;
            4'h7: out_low = 7'h1e;
            4'h8: out_low = 7'h1e;
            4'h9: out_low = 7'h1f;
            4'ha: out_low = 7'h1f;
            4'hb: out_low = 7'h1f;
            4'hc: out_low = 7'h1f;
            4'hd: out_low = 7'h20;
            4'he: out_low = 7'h20;
            4'hf: out_low = 7'h20;
            default: out_low = 7'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 7'h20;
            4'h1: out_low = 7'h21;
            4'h2: out_low = 7'h21;
            4'h3: out_low = 7'h21;
            4'h4: out_low = 7'h21;
            4'h5: out_low = 7'h22;
            4'h6: out_low = 7'h22;
            4'h7: out_low = 7'h22;
            4'h8: out_low = 7'h22;
            4'h9: out_low = 7'h23;
            4'ha: out_low = 7'h23;
            4'hb: out_low = 7'h23;
            4'hc: out_low = 7'h23;
            4'hd: out_low = 7'h24;
            4'he: out_low = 7'h24;
            4'hf: out_low = 7'h24;
            default: out_low = 7'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 7'h24;
            4'h1: out_low = 7'h24;
            4'h2: out_low = 7'h25;
            4'h3: out_low = 7'h25;
            4'h4: out_low = 7'h25;
            4'h5: out_low = 7'h25;
            4'h6: out_low = 7'h26;
            4'h7: out_low = 7'h26;
            4'h8: out_low = 7'h26;
            4'h9: out_low = 7'h26;
            4'ha: out_low = 7'h27;
            4'hb: out_low = 7'h27;
            4'hc: out_low = 7'h27;
            4'hd: out_low = 7'h27;
            4'he: out_low = 7'h28;
            4'hf: out_low = 7'h28;
            default: out_low = 7'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 7'h28;
            4'h1: out_low = 7'h28;
            4'h2: out_low = 7'h29;
            4'h3: out_low = 7'h29;
            4'h4: out_low = 7'h29;
            4'h5: out_low = 7'h29;
            4'h6: out_low = 7'h2a;
            4'h7: out_low = 7'h2a;
            4'h8: out_low = 7'h2a;
            4'h9: out_low = 7'h2a;
            4'ha: out_low = 7'h2b;
            4'hb: out_low = 7'h2b;
            4'hc: out_low = 7'h2b;
            4'hd: out_low = 7'h2b;
            4'he: out_low = 7'h2c;
            4'hf: out_low = 7'h2c;
            default: out_low = 7'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2c;
            4'h1: out_low = 7'h2c;
            4'h2: out_low = 7'h2d;
            4'h3: out_low = 7'h2d;
            4'h4: out_low = 7'h2d;
            4'h5: out_low = 7'h2d;
            4'h6: out_low = 7'h2e;
            4'h7: out_low = 7'h2e;
            4'h8: out_low = 7'h2e;
            4'h9: out_low = 7'h2e;
            4'ha: out_low = 7'h2f;
            4'hb: out_low = 7'h2f;
            4'hc: out_low = 7'h2f;
            4'hd: out_low = 7'h2f;
            4'he: out_low = 7'h30;
            4'hf: out_low = 7'h30;
            default: out_low = 7'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 7'h30;
            4'h1: out_low = 7'h30;
            4'h2: out_low = 7'h30;
            4'h3: out_low = 7'h31;
            4'h4: out_low = 7'h31;
            4'h5: out_low = 7'h31;
            4'h6: out_low = 7'h31;
            4'h7: out_low = 7'h32;
            4'h8: out_low = 7'h32;
            4'h9: out_low = 7'h32;
            4'ha: out_low = 7'h32;
            4'hb: out_low = 7'h33;
            4'hc: out_low = 7'h33;
            4'hd: out_low = 7'h33;
            4'he: out_low = 7'h33;
            4'hf: out_low = 7'h34;
            default: out_low = 7'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 7'h34;
            4'h1: out_low = 7'h34;
            4'h2: out_low = 7'h34;
            4'h3: out_low = 7'h35;
            4'h4: out_low = 7'h35;
            4'h5: out_low = 7'h35;
            4'h6: out_low = 7'h35;
            4'h7: out_low = 7'h36;
            4'h8: out_low = 7'h36;
            4'h9: out_low = 7'h36;
            4'ha: out_low = 7'h36;
            4'hb: out_low = 7'h37;
            4'hc: out_low = 7'h37;
            4'hd: out_low = 7'h37;
            4'he: out_low = 7'h37;
            4'hf: out_low = 7'h37;
            default: out_low = 7'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 7'h38;
            4'h1: out_low = 7'h38;
            4'h2: out_low = 7'h38;
            4'h3: out_low = 7'h38;
            4'h4: out_low = 7'h39;
            4'h5: out_low = 7'h39;
            4'h6: out_low = 7'h39;
            4'h7: out_low = 7'h39;
            4'h8: out_low = 7'h3a;
            4'h9: out_low = 7'h3a;
            4'ha: out_low = 7'h3a;
            4'hb: out_low = 7'h3a;
            4'hc: out_low = 7'h3b;
            4'hd: out_low = 7'h3b;
            4'he: out_low = 7'h3b;
            4'hf: out_low = 7'h3b;
            default: out_low = 7'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3c;
            4'h1: out_low = 7'h3c;
            4'h2: out_low = 7'h3c;
            4'h3: out_low = 7'h3c;
            4'h4: out_low = 7'h3d;
            4'h5: out_low = 7'h3d;
            4'h6: out_low = 7'h3d;
            4'h7: out_low = 7'h3d;
            4'h8: out_low = 7'h3d;
            4'h9: out_low = 7'h3e;
            4'ha: out_low = 7'h3e;
            4'hb: out_low = 7'h3e;
            4'hc: out_low = 7'h3e;
            4'hd: out_low = 7'h3f;
            4'he: out_low = 7'h3f;
            4'hf: out_low = 7'h3f;
            default: out_low = 7'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3f;
            4'h1: out_low = 7'h40;
            4'h2: out_low = 7'h40;
            4'h3: out_low = 7'h40;
            4'h4: out_low = 7'h40;
            4'h5: out_low = 7'h41;
            4'h6: out_low = 7'h41;
            4'h7: out_low = 7'h41;
            4'h8: out_low = 7'h41;
            4'h9: out_low = 7'h41;
            4'ha: out_low = 7'h42;
            4'hb: out_low = 7'h42;
            4'hc: out_low = 7'h42;
            4'hd: out_low = 7'h42;
            4'he: out_low = 7'h43;
            4'hf: out_low = 7'h43;
            default: out_low = 7'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h43;
            4'h1: out_low = 7'h43;
            4'h2: out_low = 7'h44;
            4'h3: out_low = 7'h44;
            4'h4: out_low = 7'h44;
            4'h5: out_low = 7'h44;
            4'h6: out_low = 7'h45;
            4'h7: out_low = 7'h45;
            4'h8: out_low = 7'h45;
            4'h9: out_low = 7'h45;
            4'ha: out_low = 7'h45;
            4'hb: out_low = 7'h46;
            4'hc: out_low = 7'h46;
            4'hd: out_low = 7'h46;
            4'he: out_low = 7'h46;
            4'hf: out_low = 7'h47;
            default: out_low = 7'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h47;
            4'h1: out_low = 7'h47;
            4'h2: out_low = 7'h47;
            4'h3: out_low = 7'h48;
            4'h4: out_low = 7'h48;
            4'h5: out_low = 7'h48;
            4'h6: out_low = 7'h48;
            4'h7: out_low = 7'h49;
            4'h8: out_low = 7'h49;
            4'h9: out_low = 7'h49;
            4'ha: out_low = 7'h49;
            4'hb: out_low = 7'h49;
            4'hc: out_low = 7'h4a;
            4'hd: out_low = 7'h4a;
            4'he: out_low = 7'h4a;
            4'hf: out_low = 7'h4a;
            default: out_low = 7'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4b;
            4'h1: out_low = 7'h4b;
            4'h2: out_low = 7'h4b;
            4'h3: out_low = 7'h4b;
            4'h4: out_low = 7'h4c;
            4'h5: out_low = 7'h4c;
            4'h6: out_low = 7'h4c;
            4'h7: out_low = 7'h4c;
            4'h8: out_low = 7'h4c;
            4'h9: out_low = 7'h4d;
            4'ha: out_low = 7'h4d;
            4'hb: out_low = 7'h4d;
            4'hc: out_low = 7'h4d;
            4'hd: out_low = 7'h4e;
            4'he: out_low = 7'h4e;
            4'hf: out_low = 7'h4e;
            default: out_low = 7'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4e;
            4'h1: out_low = 7'h4f;
            4'h2: out_low = 7'h4f;
            4'h3: out_low = 7'h4f;
            4'h4: out_low = 7'h4f;
            4'h5: out_low = 7'h4f;
            4'h6: out_low = 7'h50;
            4'h7: out_low = 7'h50;
            4'h8: out_low = 7'h50;
            4'h9: out_low = 7'h50;
            4'ha: out_low = 7'h51;
            4'hb: out_low = 7'h51;
            4'hc: out_low = 7'h51;
            4'hd: out_low = 7'h51;
            4'he: out_low = 7'h52;
            4'hf: out_low = 7'h52;
            default: out_low = 7'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 7'h52;
            4'h1: out_low = 7'h52;
            4'h2: out_low = 7'h52;
            4'h3: out_low = 7'h53;
            4'h4: out_low = 7'h53;
            4'h5: out_low = 7'h53;
            4'h6: out_low = 7'h53;
            4'h7: out_low = 7'h54;
            4'h8: out_low = 7'h54;
            4'h9: out_low = 7'h54;
            4'ha: out_low = 7'h54;
            4'hb: out_low = 7'h55;
            4'hc: out_low = 7'h55;
            4'hd: out_low = 7'h55;
            4'he: out_low = 7'h55;
            4'hf: out_low = 7'h55;
            default: out_low = 7'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 7'h56;
            4'h1: out_low = 7'h56;
            4'h2: out_low = 7'h56;
            4'h3: out_low = 7'h56;
            4'h4: out_low = 7'h57;
            4'h5: out_low = 7'h57;
            4'h6: out_low = 7'h57;
            4'h7: out_low = 7'h57;
            4'h8: out_low = 7'h57;
            4'h9: out_low = 7'h58;
            4'ha: out_low = 7'h58;
            4'hb: out_low = 7'h58;
            4'hc: out_low = 7'h58;
            4'hd: out_low = 7'h59;
            4'he: out_low = 7'h59;
            4'hf: out_low = 7'h59;
            default: out_low = 7'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 7'h59;
            4'h1: out_low = 7'h5a;
            4'h2: out_low = 7'h5a;
            4'h3: out_low = 7'h5a;
            4'h4: out_low = 7'h5a;
            4'h5: out_low = 7'h5a;
            4'h6: out_low = 7'h5b;
            4'h7: out_low = 7'h5b;
            4'h8: out_low = 7'h5b;
            4'h9: out_low = 7'h5b;
            4'ha: out_low = 7'h5c;
            4'hb: out_low = 7'h5c;
            4'hc: out_low = 7'h5c;
            4'hd: out_low = 7'h5c;
            4'he: out_low = 7'h5c;
            4'hf: out_low = 7'h5d;
            default: out_low = 7'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5d;
            4'h1: out_low = 7'h5d;
            4'h2: out_low = 7'h5d;
            4'h3: out_low = 7'h5e;
            4'h4: out_low = 7'h5e;
            4'h5: out_low = 7'h5e;
            4'h6: out_low = 7'h5e;
            4'h7: out_low = 7'h5e;
            4'h8: out_low = 7'h5f;
            4'h9: out_low = 7'h5f;
            4'ha: out_low = 7'h5f;
            4'hb: out_low = 7'h5f;
            4'hc: out_low = 7'h60;
            4'hd: out_low = 7'h60;
            4'he: out_low = 7'h60;
            4'hf: out_low = 7'h60;
            default: out_low = 7'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 7'h61;
            4'h1: out_low = 7'h61;
            4'h2: out_low = 7'h61;
            4'h3: out_low = 7'h61;
            4'h4: out_low = 7'h61;
            4'h5: out_low = 7'h62;
            4'h6: out_low = 7'h62;
            4'h7: out_low = 7'h62;
            4'h8: out_low = 7'h62;
            4'h9: out_low = 7'h63;
            4'ha: out_low = 7'h63;
            4'hb: out_low = 7'h63;
            4'hc: out_low = 7'h63;
            4'hd: out_low = 7'h63;
            4'he: out_low = 7'h64;
            4'hf: out_low = 7'h64;
            default: out_low = 7'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 7'h64;
            4'h1: out_low = 7'h64;
            4'h2: out_low = 7'h65;
            4'h3: out_low = 7'h65;
            4'h4: out_low = 7'h65;
            4'h5: out_low = 7'h65;
            4'h6: out_low = 7'h65;
            4'h7: out_low = 7'h66;
            4'h8: out_low = 7'h66;
            4'h9: out_low = 7'h66;
            4'ha: out_low = 7'h66;
            4'hb: out_low = 7'h67;
            4'hc: out_low = 7'h67;
            4'hd: out_low = 7'h67;
            4'he: out_low = 7'h67;
            4'hf: out_low = 7'h67;
            default: out_low = 7'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 7'h68;
            4'h1: out_low = 7'h68;
            4'h2: out_low = 7'h68;
            4'h3: out_low = 7'h68;
            4'h4: out_low = 7'h69;
            4'h5: out_low = 7'h69;
            4'h6: out_low = 7'h69;
            4'h7: out_low = 7'h69;
            4'h8: out_low = 7'h69;
            4'h9: out_low = 7'h6a;
            4'ha: out_low = 7'h6a;
            4'hb: out_low = 7'h6a;
            4'hc: out_low = 7'h6a;
            4'hd: out_low = 7'h6b;
            4'he: out_low = 7'h6b;
            4'hf: out_low = 7'h6b;
            default: out_low = 7'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6b;
            4'h1: out_low = 7'h6b;
            4'h2: out_low = 7'h6c;
            4'h3: out_low = 7'h6c;
            4'h4: out_low = 7'h6c;
            4'h5: out_low = 7'h6c;
            4'h6: out_low = 7'h6d;
            4'h7: out_low = 7'h6d;
            4'h8: out_low = 7'h6d;
            4'h9: out_low = 7'h6d;
            4'ha: out_low = 7'h6d;
            4'hb: out_low = 7'h6e;
            4'hc: out_low = 7'h6e;
            4'hd: out_low = 7'h6e;
            4'he: out_low = 7'h6e;
            4'hf: out_low = 7'h6e;
            default: out_low = 7'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6f;
            4'h1: out_low = 7'h6f;
            4'h2: out_low = 7'h6f;
            4'h3: out_low = 7'h6f;
            4'h4: out_low = 7'h70;
            4'h5: out_low = 7'h70;
            4'h6: out_low = 7'h70;
            4'h7: out_low = 7'h70;
            4'h8: out_low = 7'h70;
            4'h9: out_low = 7'h71;
            4'ha: out_low = 7'h71;
            4'hb: out_low = 7'h71;
            4'hc: out_low = 7'h71;
            4'hd: out_low = 7'h72;
            4'he: out_low = 7'h72;
            4'hf: out_low = 7'h72;
            default: out_low = 7'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 7'h72;
            4'h1: out_low = 7'h72;
            4'h2: out_low = 7'h73;
            4'h3: out_low = 7'h73;
            4'h4: out_low = 7'h73;
            4'h5: out_low = 7'h73;
            4'h6: out_low = 7'h74;
            4'h7: out_low = 7'h74;
            4'h8: out_low = 7'h74;
            4'h9: out_low = 7'h74;
            4'ha: out_low = 7'h74;
            4'hb: out_low = 7'h75;
            4'hc: out_low = 7'h75;
            4'hd: out_low = 7'h75;
            4'he: out_low = 7'h75;
            4'hf: out_low = 7'h75;
            default: out_low = 7'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h76;
            4'h1: out_low = 7'h76;
            4'h2: out_low = 7'h76;
            4'h3: out_low = 7'h76;
            4'h4: out_low = 7'h77;
            4'h5: out_low = 7'h77;
            4'h6: out_low = 7'h77;
            4'h7: out_low = 7'h77;
            4'h8: out_low = 7'h77;
            4'h9: out_low = 7'h78;
            4'ha: out_low = 7'h78;
            4'hb: out_low = 7'h78;
            4'hc: out_low = 7'h78;
            4'hd: out_low = 7'h78;
            4'he: out_low = 7'h79;
            4'hf: out_low = 7'h79;
            default: out_low = 7'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h79;
            4'h1: out_low = 7'h79;
            4'h2: out_low = 7'h7a;
            4'h3: out_low = 7'h7a;
            4'h4: out_low = 7'h7a;
            4'h5: out_low = 7'h7a;
            4'h6: out_low = 7'h7a;
            4'h7: out_low = 7'h7b;
            4'h8: out_low = 7'h7b;
            4'h9: out_low = 7'h7b;
            4'ha: out_low = 7'h7b;
            4'hb: out_low = 7'h7c;
            4'hc: out_low = 7'h7c;
            4'hd: out_low = 7'h7c;
            4'he: out_low = 7'h7c;
            4'hf: out_low = 7'h7c;
            default: out_low = 7'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7d;
            4'h1: out_low = 7'h7d;
            4'h2: out_low = 7'h7d;
            4'h3: out_low = 7'h7d;
            4'h4: out_low = 7'h7d;
            4'h5: out_low = 7'h7e;
            4'h6: out_low = 7'h7e;
            4'h7: out_low = 7'h7e;
            4'h8: out_low = 7'h7e;
            4'h9: out_low = 7'h7f;
            4'ha: out_low = 7'h7f;
            4'hb: out_low = 7'h7f;
            4'hc: out_low = 7'h7f;
            4'hd: out_low = 7'h7f;
            4'he: out_low = 7'h00;
            4'hf: out_low = 7'h00;
            default: out_low = 7'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h00;
            4'h1: out_low = 7'h00;
            4'h2: out_low = 7'h00;
            4'h3: out_low = 7'h01;
            4'h4: out_low = 7'h01;
            4'h5: out_low = 7'h01;
            4'h6: out_low = 7'h01;
            4'h7: out_low = 7'h01;
            4'h8: out_low = 7'h02;
            4'h9: out_low = 7'h02;
            4'ha: out_low = 7'h02;
            4'hb: out_low = 7'h02;
            4'hc: out_low = 7'h03;
            4'hd: out_low = 7'h03;
            4'he: out_low = 7'h03;
            4'hf: out_low = 7'h03;
            default: out_low = 7'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h03;
            4'h1: out_low = 7'h04;
            4'h2: out_low = 7'h04;
            4'h3: out_low = 7'h04;
            4'h4: out_low = 7'h04;
            4'h5: out_low = 7'h04;
            4'h6: out_low = 7'h05;
            4'h7: out_low = 7'h05;
            4'h8: out_low = 7'h05;
            4'h9: out_low = 7'h05;
            4'ha: out_low = 7'h06;
            4'hb: out_low = 7'h06;
            4'hc: out_low = 7'h06;
            4'hd: out_low = 7'h06;
            4'he: out_low = 7'h06;
            4'hf: out_low = 7'h07;
            default: out_low = 7'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h07;
            4'h1: out_low = 7'h07;
            4'h2: out_low = 7'h07;
            4'h3: out_low = 7'h07;
            4'h4: out_low = 7'h08;
            4'h5: out_low = 7'h08;
            4'h6: out_low = 7'h08;
            4'h7: out_low = 7'h08;
            4'h8: out_low = 7'h08;
            4'h9: out_low = 7'h09;
            4'ha: out_low = 7'h09;
            4'hb: out_low = 7'h09;
            4'hc: out_low = 7'h09;
            4'hd: out_low = 7'h0a;
            4'he: out_low = 7'h0a;
            4'hf: out_low = 7'h0a;
            default: out_low = 7'h00;
          endcase
        end
        default: out_low = 7'h00;
      endcase
      end
      2'h1: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0a;
            4'h1: out_low = 7'h0b;
            4'h2: out_low = 7'h0b;
            4'h3: out_low = 7'h0b;
            4'h4: out_low = 7'h0c;
            4'h5: out_low = 7'h0c;
            4'h6: out_low = 7'h0d;
            4'h7: out_low = 7'h0d;
            4'h8: out_low = 7'h0e;
            4'h9: out_low = 7'h0e;
            4'ha: out_low = 7'h0e;
            4'hb: out_low = 7'h0f;
            4'hc: out_low = 7'h0f;
            4'hd: out_low = 7'h10;
            4'he: out_low = 7'h10;
            4'hf: out_low = 7'h10;
            default: out_low = 7'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 7'h11;
            4'h1: out_low = 7'h11;
            4'h2: out_low = 7'h12;
            4'h3: out_low = 7'h12;
            4'h4: out_low = 7'h13;
            4'h5: out_low = 7'h13;
            4'h6: out_low = 7'h13;
            4'h7: out_low = 7'h14;
            4'h8: out_low = 7'h14;
            4'h9: out_low = 7'h15;
            4'ha: out_low = 7'h15;
            4'hb: out_low = 7'h15;
            4'hc: out_low = 7'h16;
            4'hd: out_low = 7'h16;
            4'he: out_low = 7'h17;
            4'hf: out_low = 7'h17;
            default: out_low = 7'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 7'h17;
            4'h1: out_low = 7'h18;
            4'h2: out_low = 7'h18;
            4'h3: out_low = 7'h19;
            4'h4: out_low = 7'h19;
            4'h5: out_low = 7'h1a;
            4'h6: out_low = 7'h1a;
            4'h7: out_low = 7'h1a;
            4'h8: out_low = 7'h1b;
            4'h9: out_low = 7'h1b;
            4'ha: out_low = 7'h1c;
            4'hb: out_low = 7'h1c;
            4'hc: out_low = 7'h1c;
            4'hd: out_low = 7'h1d;
            4'he: out_low = 7'h1d;
            4'hf: out_low = 7'h1e;
            default: out_low = 7'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1e;
            4'h1: out_low = 7'h1e;
            4'h2: out_low = 7'h1f;
            4'h3: out_low = 7'h1f;
            4'h4: out_low = 7'h20;
            4'h5: out_low = 7'h20;
            4'h6: out_low = 7'h20;
            4'h7: out_low = 7'h21;
            4'h8: out_low = 7'h21;
            4'h9: out_low = 7'h22;
            4'ha: out_low = 7'h22;
            4'hb: out_low = 7'h22;
            4'hc: out_low = 7'h23;
            4'hd: out_low = 7'h23;
            4'he: out_low = 7'h24;
            4'hf: out_low = 7'h24;
            default: out_low = 7'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 7'h24;
            4'h1: out_low = 7'h25;
            4'h2: out_low = 7'h25;
            4'h3: out_low = 7'h26;
            4'h4: out_low = 7'h26;
            4'h5: out_low = 7'h27;
            4'h6: out_low = 7'h27;
            4'h7: out_low = 7'h27;
            4'h8: out_low = 7'h28;
            4'h9: out_low = 7'h28;
            4'ha: out_low = 7'h29;
            4'hb: out_low = 7'h29;
            4'hc: out_low = 7'h29;
            4'hd: out_low = 7'h2a;
            4'he: out_low = 7'h2a;
            4'hf: out_low = 7'h2b;
            default: out_low = 7'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2b;
            4'h1: out_low = 7'h2b;
            4'h2: out_low = 7'h2c;
            4'h3: out_low = 7'h2c;
            4'h4: out_low = 7'h2d;
            4'h5: out_low = 7'h2d;
            4'h6: out_low = 7'h2d;
            4'h7: out_low = 7'h2e;
            4'h8: out_low = 7'h2e;
            4'h9: out_low = 7'h2f;
            4'ha: out_low = 7'h2f;
            4'hb: out_low = 7'h2f;
            4'hc: out_low = 7'h30;
            4'hd: out_low = 7'h30;
            4'he: out_low = 7'h30;
            4'hf: out_low = 7'h31;
            default: out_low = 7'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 7'h31;
            4'h1: out_low = 7'h32;
            4'h2: out_low = 7'h32;
            4'h3: out_low = 7'h32;
            4'h4: out_low = 7'h33;
            4'h5: out_low = 7'h33;
            4'h6: out_low = 7'h34;
            4'h7: out_low = 7'h34;
            4'h8: out_low = 7'h34;
            4'h9: out_low = 7'h35;
            4'ha: out_low = 7'h35;
            4'hb: out_low = 7'h36;
            4'hc: out_low = 7'h36;
            4'hd: out_low = 7'h36;
            4'he: out_low = 7'h37;
            4'hf: out_low = 7'h37;
            default: out_low = 7'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 7'h38;
            4'h1: out_low = 7'h38;
            4'h2: out_low = 7'h38;
            4'h3: out_low = 7'h39;
            4'h4: out_low = 7'h39;
            4'h5: out_low = 7'h3a;
            4'h6: out_low = 7'h3a;
            4'h7: out_low = 7'h3a;
            4'h8: out_low = 7'h3b;
            4'h9: out_low = 7'h3b;
            4'ha: out_low = 7'h3b;
            4'hb: out_low = 7'h3c;
            4'hc: out_low = 7'h3c;
            4'hd: out_low = 7'h3d;
            4'he: out_low = 7'h3d;
            4'hf: out_low = 7'h3d;
            default: out_low = 7'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3e;
            4'h1: out_low = 7'h3e;
            4'h2: out_low = 7'h3f;
            4'h3: out_low = 7'h3f;
            4'h4: out_low = 7'h3f;
            4'h5: out_low = 7'h40;
            4'h6: out_low = 7'h40;
            4'h7: out_low = 7'h41;
            4'h8: out_low = 7'h41;
            4'h9: out_low = 7'h41;
            4'ha: out_low = 7'h42;
            4'hb: out_low = 7'h42;
            4'hc: out_low = 7'h42;
            4'hd: out_low = 7'h43;
            4'he: out_low = 7'h43;
            4'hf: out_low = 7'h44;
            default: out_low = 7'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 7'h44;
            4'h1: out_low = 7'h44;
            4'h2: out_low = 7'h45;
            4'h3: out_low = 7'h45;
            4'h4: out_low = 7'h46;
            4'h5: out_low = 7'h46;
            4'h6: out_low = 7'h46;
            4'h7: out_low = 7'h47;
            4'h8: out_low = 7'h47;
            4'h9: out_low = 7'h47;
            4'ha: out_low = 7'h48;
            4'hb: out_low = 7'h48;
            4'hc: out_low = 7'h49;
            4'hd: out_low = 7'h49;
            4'he: out_low = 7'h49;
            4'hf: out_low = 7'h4a;
            default: out_low = 7'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4a;
            4'h1: out_low = 7'h4b;
            4'h2: out_low = 7'h4b;
            4'h3: out_low = 7'h4b;
            4'h4: out_low = 7'h4c;
            4'h5: out_low = 7'h4c;
            4'h6: out_low = 7'h4c;
            4'h7: out_low = 7'h4d;
            4'h8: out_low = 7'h4d;
            4'h9: out_low = 7'h4e;
            4'ha: out_low = 7'h4e;
            4'hb: out_low = 7'h4e;
            4'hc: out_low = 7'h4f;
            4'hd: out_low = 7'h4f;
            4'he: out_low = 7'h4f;
            4'hf: out_low = 7'h50;
            default: out_low = 7'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h50;
            4'h1: out_low = 7'h51;
            4'h2: out_low = 7'h51;
            4'h3: out_low = 7'h51;
            4'h4: out_low = 7'h52;
            4'h5: out_low = 7'h52;
            4'h6: out_low = 7'h52;
            4'h7: out_low = 7'h53;
            4'h8: out_low = 7'h53;
            4'h9: out_low = 7'h54;
            4'ha: out_low = 7'h54;
            4'hb: out_low = 7'h54;
            4'hc: out_low = 7'h55;
            4'hd: out_low = 7'h55;
            4'he: out_low = 7'h55;
            4'hf: out_low = 7'h56;
            default: out_low = 7'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h56;
            4'h1: out_low = 7'h57;
            4'h2: out_low = 7'h57;
            4'h3: out_low = 7'h57;
            4'h4: out_low = 7'h58;
            4'h5: out_low = 7'h58;
            4'h6: out_low = 7'h58;
            4'h7: out_low = 7'h59;
            4'h8: out_low = 7'h59;
            4'h9: out_low = 7'h5a;
            4'ha: out_low = 7'h5a;
            4'hb: out_low = 7'h5a;
            4'hc: out_low = 7'h5b;
            4'hd: out_low = 7'h5b;
            4'he: out_low = 7'h5b;
            4'hf: out_low = 7'h5c;
            default: out_low = 7'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5c;
            4'h1: out_low = 7'h5d;
            4'h2: out_low = 7'h5d;
            4'h3: out_low = 7'h5d;
            4'h4: out_low = 7'h5e;
            4'h5: out_low = 7'h5e;
            4'h6: out_low = 7'h5e;
            4'h7: out_low = 7'h5f;
            4'h8: out_low = 7'h5f;
            4'h9: out_low = 7'h60;
            4'ha: out_low = 7'h60;
            4'hb: out_low = 7'h60;
            4'hc: out_low = 7'h61;
            4'hd: out_low = 7'h61;
            4'he: out_low = 7'h61;
            4'hf: out_low = 7'h62;
            default: out_low = 7'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h62;
            4'h1: out_low = 7'h62;
            4'h2: out_low = 7'h63;
            4'h3: out_low = 7'h63;
            4'h4: out_low = 7'h64;
            4'h5: out_low = 7'h64;
            4'h6: out_low = 7'h64;
            4'h7: out_low = 7'h65;
            4'h8: out_low = 7'h65;
            4'h9: out_low = 7'h65;
            4'ha: out_low = 7'h66;
            4'hb: out_low = 7'h66;
            4'hc: out_low = 7'h67;
            4'hd: out_low = 7'h67;
            4'he: out_low = 7'h67;
            4'hf: out_low = 7'h68;
            default: out_low = 7'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h68;
            4'h1: out_low = 7'h68;
            4'h2: out_low = 7'h69;
            4'h3: out_low = 7'h69;
            4'h4: out_low = 7'h69;
            4'h5: out_low = 7'h6a;
            4'h6: out_low = 7'h6a;
            4'h7: out_low = 7'h6b;
            4'h8: out_low = 7'h6b;
            4'h9: out_low = 7'h6b;
            4'ha: out_low = 7'h6c;
            4'hb: out_low = 7'h6c;
            4'hc: out_low = 7'h6c;
            4'hd: out_low = 7'h6d;
            4'he: out_low = 7'h6d;
            4'hf: out_low = 7'h6d;
            default: out_low = 7'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6e;
            4'h1: out_low = 7'h6e;
            4'h2: out_low = 7'h6f;
            4'h3: out_low = 7'h6f;
            4'h4: out_low = 7'h6f;
            4'h5: out_low = 7'h70;
            4'h6: out_low = 7'h70;
            4'h7: out_low = 7'h70;
            4'h8: out_low = 7'h71;
            4'h9: out_low = 7'h71;
            4'ha: out_low = 7'h71;
            4'hb: out_low = 7'h72;
            4'hc: out_low = 7'h72;
            4'hd: out_low = 7'h72;
            4'he: out_low = 7'h73;
            4'hf: out_low = 7'h73;
            default: out_low = 7'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 7'h74;
            4'h1: out_low = 7'h74;
            4'h2: out_low = 7'h74;
            4'h3: out_low = 7'h75;
            4'h4: out_low = 7'h75;
            4'h5: out_low = 7'h75;
            4'h6: out_low = 7'h76;
            4'h7: out_low = 7'h76;
            4'h8: out_low = 7'h76;
            4'h9: out_low = 7'h77;
            4'ha: out_low = 7'h77;
            4'hb: out_low = 7'h77;
            4'hc: out_low = 7'h78;
            4'hd: out_low = 7'h78;
            4'he: out_low = 7'h79;
            4'hf: out_low = 7'h79;
            default: out_low = 7'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 7'h79;
            4'h1: out_low = 7'h7a;
            4'h2: out_low = 7'h7a;
            4'h3: out_low = 7'h7a;
            4'h4: out_low = 7'h7b;
            4'h5: out_low = 7'h7b;
            4'h6: out_low = 7'h7b;
            4'h7: out_low = 7'h7c;
            4'h8: out_low = 7'h7c;
            4'h9: out_low = 7'h7c;
            4'ha: out_low = 7'h7d;
            4'hb: out_low = 7'h7d;
            4'hc: out_low = 7'h7e;
            4'hd: out_low = 7'h7e;
            4'he: out_low = 7'h7e;
            4'hf: out_low = 7'h7f;
            default: out_low = 7'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7f;
            4'h1: out_low = 7'h7f;
            4'h2: out_low = 7'h00;
            4'h3: out_low = 7'h00;
            4'h4: out_low = 7'h00;
            4'h5: out_low = 7'h01;
            4'h6: out_low = 7'h01;
            4'h7: out_low = 7'h01;
            4'h8: out_low = 7'h02;
            4'h9: out_low = 7'h02;
            4'ha: out_low = 7'h02;
            4'hb: out_low = 7'h03;
            4'hc: out_low = 7'h03;
            4'hd: out_low = 7'h04;
            4'he: out_low = 7'h04;
            4'hf: out_low = 7'h04;
            default: out_low = 7'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 7'h05;
            4'h1: out_low = 7'h05;
            4'h2: out_low = 7'h05;
            4'h3: out_low = 7'h06;
            4'h4: out_low = 7'h06;
            4'h5: out_low = 7'h06;
            4'h6: out_low = 7'h07;
            4'h7: out_low = 7'h07;
            4'h8: out_low = 7'h07;
            4'h9: out_low = 7'h08;
            4'ha: out_low = 7'h08;
            4'hb: out_low = 7'h08;
            4'hc: out_low = 7'h09;
            4'hd: out_low = 7'h09;
            4'he: out_low = 7'h09;
            4'hf: out_low = 7'h0a;
            default: out_low = 7'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0a;
            4'h1: out_low = 7'h0a;
            4'h2: out_low = 7'h0b;
            4'h3: out_low = 7'h0b;
            4'h4: out_low = 7'h0c;
            4'h5: out_low = 7'h0c;
            4'h6: out_low = 7'h0c;
            4'h7: out_low = 7'h0d;
            4'h8: out_low = 7'h0d;
            4'h9: out_low = 7'h0d;
            4'ha: out_low = 7'h0e;
            4'hb: out_low = 7'h0e;
            4'hc: out_low = 7'h0e;
            4'hd: out_low = 7'h0f;
            4'he: out_low = 7'h0f;
            4'hf: out_low = 7'h0f;
            default: out_low = 7'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 7'h10;
            4'h1: out_low = 7'h10;
            4'h2: out_low = 7'h10;
            4'h3: out_low = 7'h11;
            4'h4: out_low = 7'h11;
            4'h5: out_low = 7'h11;
            4'h6: out_low = 7'h12;
            4'h7: out_low = 7'h12;
            4'h8: out_low = 7'h12;
            4'h9: out_low = 7'h13;
            4'ha: out_low = 7'h13;
            4'hb: out_low = 7'h13;
            4'hc: out_low = 7'h14;
            4'hd: out_low = 7'h14;
            4'he: out_low = 7'h15;
            4'hf: out_low = 7'h15;
            default: out_low = 7'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 7'h15;
            4'h1: out_low = 7'h16;
            4'h2: out_low = 7'h16;
            4'h3: out_low = 7'h16;
            4'h4: out_low = 7'h17;
            4'h5: out_low = 7'h17;
            4'h6: out_low = 7'h17;
            4'h7: out_low = 7'h18;
            4'h8: out_low = 7'h18;
            4'h9: out_low = 7'h18;
            4'ha: out_low = 7'h19;
            4'hb: out_low = 7'h19;
            4'hc: out_low = 7'h19;
            4'hd: out_low = 7'h1a;
            4'he: out_low = 7'h1a;
            4'hf: out_low = 7'h1a;
            default: out_low = 7'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1b;
            4'h1: out_low = 7'h1b;
            4'h2: out_low = 7'h1b;
            4'h3: out_low = 7'h1c;
            4'h4: out_low = 7'h1c;
            4'h5: out_low = 7'h1c;
            4'h6: out_low = 7'h1d;
            4'h7: out_low = 7'h1d;
            4'h8: out_low = 7'h1d;
            4'h9: out_low = 7'h1e;
            4'ha: out_low = 7'h1e;
            4'hb: out_low = 7'h1e;
            4'hc: out_low = 7'h1f;
            4'hd: out_low = 7'h1f;
            4'he: out_low = 7'h1f;
            4'hf: out_low = 7'h20;
            default: out_low = 7'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 7'h20;
            4'h1: out_low = 7'h20;
            4'h2: out_low = 7'h21;
            4'h3: out_low = 7'h21;
            4'h4: out_low = 7'h21;
            4'h5: out_low = 7'h22;
            4'h6: out_low = 7'h22;
            4'h7: out_low = 7'h22;
            4'h8: out_low = 7'h23;
            4'h9: out_low = 7'h23;
            4'ha: out_low = 7'h23;
            4'hb: out_low = 7'h24;
            4'hc: out_low = 7'h24;
            4'hd: out_low = 7'h24;
            4'he: out_low = 7'h25;
            4'hf: out_low = 7'h25;
            default: out_low = 7'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h25;
            4'h1: out_low = 7'h26;
            4'h2: out_low = 7'h26;
            4'h3: out_low = 7'h26;
            4'h4: out_low = 7'h27;
            4'h5: out_low = 7'h27;
            4'h6: out_low = 7'h27;
            4'h7: out_low = 7'h28;
            4'h8: out_low = 7'h28;
            4'h9: out_low = 7'h28;
            4'ha: out_low = 7'h29;
            4'hb: out_low = 7'h29;
            4'hc: out_low = 7'h29;
            4'hd: out_low = 7'h2a;
            4'he: out_low = 7'h2a;
            4'hf: out_low = 7'h2a;
            default: out_low = 7'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2b;
            4'h1: out_low = 7'h2b;
            4'h2: out_low = 7'h2b;
            4'h3: out_low = 7'h2c;
            4'h4: out_low = 7'h2c;
            4'h5: out_low = 7'h2c;
            4'h6: out_low = 7'h2d;
            4'h7: out_low = 7'h2d;
            4'h8: out_low = 7'h2d;
            4'h9: out_low = 7'h2e;
            4'ha: out_low = 7'h2e;
            4'hb: out_low = 7'h2e;
            4'hc: out_low = 7'h2f;
            4'hd: out_low = 7'h2f;
            4'he: out_low = 7'h2f;
            4'hf: out_low = 7'h30;
            default: out_low = 7'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h30;
            4'h1: out_low = 7'h30;
            4'h2: out_low = 7'h31;
            4'h3: out_low = 7'h31;
            4'h4: out_low = 7'h31;
            4'h5: out_low = 7'h32;
            4'h6: out_low = 7'h32;
            4'h7: out_low = 7'h32;
            4'h8: out_low = 7'h33;
            4'h9: out_low = 7'h33;
            4'ha: out_low = 7'h33;
            4'hb: out_low = 7'h34;
            4'hc: out_low = 7'h34;
            4'hd: out_low = 7'h34;
            4'he: out_low = 7'h35;
            4'hf: out_low = 7'h35;
            default: out_low = 7'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h35;
            4'h1: out_low = 7'h36;
            4'h2: out_low = 7'h36;
            4'h3: out_low = 7'h36;
            4'h4: out_low = 7'h37;
            4'h5: out_low = 7'h37;
            4'h6: out_low = 7'h37;
            4'h7: out_low = 7'h38;
            4'h8: out_low = 7'h38;
            4'h9: out_low = 7'h38;
            4'ha: out_low = 7'h39;
            4'hb: out_low = 7'h39;
            4'hc: out_low = 7'h39;
            4'hd: out_low = 7'h3a;
            4'he: out_low = 7'h3a;
            4'hf: out_low = 7'h3a;
            default: out_low = 7'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3b;
            4'h1: out_low = 7'h3b;
            4'h2: out_low = 7'h3b;
            4'h3: out_low = 7'h3c;
            4'h4: out_low = 7'h3c;
            4'h5: out_low = 7'h3c;
            4'h6: out_low = 7'h3c;
            4'h7: out_low = 7'h3d;
            4'h8: out_low = 7'h3d;
            4'h9: out_low = 7'h3d;
            4'ha: out_low = 7'h3e;
            4'hb: out_low = 7'h3e;
            4'hc: out_low = 7'h3e;
            4'hd: out_low = 7'h3f;
            4'he: out_low = 7'h3f;
            4'hf: out_low = 7'h3f;
            default: out_low = 7'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h40;
            4'h1: out_low = 7'h40;
            4'h2: out_low = 7'h40;
            4'h3: out_low = 7'h41;
            4'h4: out_low = 7'h41;
            4'h5: out_low = 7'h41;
            4'h6: out_low = 7'h42;
            4'h7: out_low = 7'h42;
            4'h8: out_low = 7'h42;
            4'h9: out_low = 7'h43;
            4'ha: out_low = 7'h43;
            4'hb: out_low = 7'h43;
            4'hc: out_low = 7'h44;
            4'hd: out_low = 7'h44;
            4'he: out_low = 7'h44;
            4'hf: out_low = 7'h45;
            default: out_low = 7'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 7'h45;
            4'h1: out_low = 7'h45;
            4'h2: out_low = 7'h46;
            4'h3: out_low = 7'h46;
            4'h4: out_low = 7'h46;
            4'h5: out_low = 7'h46;
            4'h6: out_low = 7'h47;
            4'h7: out_low = 7'h47;
            4'h8: out_low = 7'h47;
            4'h9: out_low = 7'h48;
            4'ha: out_low = 7'h48;
            4'hb: out_low = 7'h48;
            4'hc: out_low = 7'h49;
            4'hd: out_low = 7'h49;
            4'he: out_low = 7'h49;
            4'hf: out_low = 7'h4a;
            default: out_low = 7'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4a;
            4'h1: out_low = 7'h4a;
            4'h2: out_low = 7'h4b;
            4'h3: out_low = 7'h4b;
            4'h4: out_low = 7'h4b;
            4'h5: out_low = 7'h4c;
            4'h6: out_low = 7'h4c;
            4'h7: out_low = 7'h4c;
            4'h8: out_low = 7'h4d;
            4'h9: out_low = 7'h4d;
            4'ha: out_low = 7'h4d;
            4'hb: out_low = 7'h4d;
            4'hc: out_low = 7'h4e;
            4'hd: out_low = 7'h4e;
            4'he: out_low = 7'h4e;
            4'hf: out_low = 7'h4f;
            default: out_low = 7'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4f;
            4'h1: out_low = 7'h4f;
            4'h2: out_low = 7'h50;
            4'h3: out_low = 7'h50;
            4'h4: out_low = 7'h50;
            4'h5: out_low = 7'h51;
            4'h6: out_low = 7'h51;
            4'h7: out_low = 7'h51;
            4'h8: out_low = 7'h52;
            4'h9: out_low = 7'h52;
            4'ha: out_low = 7'h52;
            4'hb: out_low = 7'h53;
            4'hc: out_low = 7'h53;
            4'hd: out_low = 7'h53;
            4'he: out_low = 7'h53;
            4'hf: out_low = 7'h54;
            default: out_low = 7'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 7'h54;
            4'h1: out_low = 7'h54;
            4'h2: out_low = 7'h55;
            4'h3: out_low = 7'h55;
            4'h4: out_low = 7'h55;
            4'h5: out_low = 7'h56;
            4'h6: out_low = 7'h56;
            4'h7: out_low = 7'h56;
            4'h8: out_low = 7'h57;
            4'h9: out_low = 7'h57;
            4'ha: out_low = 7'h57;
            4'hb: out_low = 7'h58;
            4'hc: out_low = 7'h58;
            4'hd: out_low = 7'h58;
            4'he: out_low = 7'h58;
            4'hf: out_low = 7'h59;
            default: out_low = 7'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 7'h59;
            4'h1: out_low = 7'h59;
            4'h2: out_low = 7'h5a;
            4'h3: out_low = 7'h5a;
            4'h4: out_low = 7'h5a;
            4'h5: out_low = 7'h5b;
            4'h6: out_low = 7'h5b;
            4'h7: out_low = 7'h5b;
            4'h8: out_low = 7'h5c;
            4'h9: out_low = 7'h5c;
            4'ha: out_low = 7'h5c;
            4'hb: out_low = 7'h5d;
            4'hc: out_low = 7'h5d;
            4'hd: out_low = 7'h5d;
            4'he: out_low = 7'h5d;
            4'hf: out_low = 7'h5e;
            default: out_low = 7'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5e;
            4'h1: out_low = 7'h5e;
            4'h2: out_low = 7'h5f;
            4'h3: out_low = 7'h5f;
            4'h4: out_low = 7'h5f;
            4'h5: out_low = 7'h60;
            4'h6: out_low = 7'h60;
            4'h7: out_low = 7'h60;
            4'h8: out_low = 7'h61;
            4'h9: out_low = 7'h61;
            4'ha: out_low = 7'h61;
            4'hb: out_low = 7'h61;
            4'hc: out_low = 7'h62;
            4'hd: out_low = 7'h62;
            4'he: out_low = 7'h62;
            4'hf: out_low = 7'h63;
            default: out_low = 7'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 7'h63;
            4'h1: out_low = 7'h63;
            4'h2: out_low = 7'h64;
            4'h3: out_low = 7'h64;
            4'h4: out_low = 7'h64;
            4'h5: out_low = 7'h65;
            4'h6: out_low = 7'h65;
            4'h7: out_low = 7'h65;
            4'h8: out_low = 7'h65;
            4'h9: out_low = 7'h66;
            4'ha: out_low = 7'h66;
            4'hb: out_low = 7'h66;
            4'hc: out_low = 7'h67;
            4'hd: out_low = 7'h67;
            4'he: out_low = 7'h67;
            4'hf: out_low = 7'h68;
            default: out_low = 7'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 7'h68;
            4'h1: out_low = 7'h68;
            4'h2: out_low = 7'h69;
            4'h3: out_low = 7'h69;
            4'h4: out_low = 7'h69;
            4'h5: out_low = 7'h69;
            4'h6: out_low = 7'h6a;
            4'h7: out_low = 7'h6a;
            4'h8: out_low = 7'h6a;
            4'h9: out_low = 7'h6b;
            4'ha: out_low = 7'h6b;
            4'hb: out_low = 7'h6b;
            4'hc: out_low = 7'h6c;
            4'hd: out_low = 7'h6c;
            4'he: out_low = 7'h6c;
            4'hf: out_low = 7'h6c;
            default: out_low = 7'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6d;
            4'h1: out_low = 7'h6d;
            4'h2: out_low = 7'h6d;
            4'h3: out_low = 7'h6e;
            4'h4: out_low = 7'h6e;
            4'h5: out_low = 7'h6e;
            4'h6: out_low = 7'h6f;
            4'h7: out_low = 7'h6f;
            4'h8: out_low = 7'h6f;
            4'h9: out_low = 7'h70;
            4'ha: out_low = 7'h70;
            4'hb: out_low = 7'h70;
            4'hc: out_low = 7'h70;
            4'hd: out_low = 7'h71;
            4'he: out_low = 7'h71;
            4'hf: out_low = 7'h71;
            default: out_low = 7'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 7'h72;
            4'h1: out_low = 7'h72;
            4'h2: out_low = 7'h72;
            4'h3: out_low = 7'h73;
            4'h4: out_low = 7'h73;
            4'h5: out_low = 7'h73;
            4'h6: out_low = 7'h73;
            4'h7: out_low = 7'h74;
            4'h8: out_low = 7'h74;
            4'h9: out_low = 7'h74;
            4'ha: out_low = 7'h75;
            4'hb: out_low = 7'h75;
            4'hc: out_low = 7'h75;
            4'hd: out_low = 7'h76;
            4'he: out_low = 7'h76;
            4'hf: out_low = 7'h76;
            default: out_low = 7'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h76;
            4'h1: out_low = 7'h77;
            4'h2: out_low = 7'h77;
            4'h3: out_low = 7'h77;
            4'h4: out_low = 7'h78;
            4'h5: out_low = 7'h78;
            4'h6: out_low = 7'h78;
            4'h7: out_low = 7'h79;
            4'h8: out_low = 7'h79;
            4'h9: out_low = 7'h79;
            4'ha: out_low = 7'h79;
            4'hb: out_low = 7'h7a;
            4'hc: out_low = 7'h7a;
            4'hd: out_low = 7'h7a;
            4'he: out_low = 7'h7b;
            4'hf: out_low = 7'h7b;
            default: out_low = 7'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7b;
            4'h1: out_low = 7'h7c;
            4'h2: out_low = 7'h7c;
            4'h3: out_low = 7'h7c;
            4'h4: out_low = 7'h7c;
            4'h5: out_low = 7'h7d;
            4'h6: out_low = 7'h7d;
            4'h7: out_low = 7'h7d;
            4'h8: out_low = 7'h7e;
            4'h9: out_low = 7'h7e;
            4'ha: out_low = 7'h7e;
            4'hb: out_low = 7'h7f;
            4'hc: out_low = 7'h7f;
            4'hd: out_low = 7'h7f;
            4'he: out_low = 7'h7f;
            4'hf: out_low = 7'h00;
            default: out_low = 7'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h00;
            4'h1: out_low = 7'h00;
            4'h2: out_low = 7'h01;
            4'h3: out_low = 7'h01;
            4'h4: out_low = 7'h01;
            4'h5: out_low = 7'h01;
            4'h6: out_low = 7'h02;
            4'h7: out_low = 7'h02;
            4'h8: out_low = 7'h02;
            4'h9: out_low = 7'h03;
            4'ha: out_low = 7'h03;
            4'hb: out_low = 7'h03;
            4'hc: out_low = 7'h04;
            4'hd: out_low = 7'h04;
            4'he: out_low = 7'h04;
            4'hf: out_low = 7'h04;
            default: out_low = 7'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h05;
            4'h1: out_low = 7'h05;
            4'h2: out_low = 7'h05;
            4'h3: out_low = 7'h06;
            4'h4: out_low = 7'h06;
            4'h5: out_low = 7'h06;
            4'h6: out_low = 7'h06;
            4'h7: out_low = 7'h07;
            4'h8: out_low = 7'h07;
            4'h9: out_low = 7'h07;
            4'ha: out_low = 7'h08;
            4'hb: out_low = 7'h08;
            4'hc: out_low = 7'h08;
            4'hd: out_low = 7'h09;
            4'he: out_low = 7'h09;
            4'hf: out_low = 7'h09;
            default: out_low = 7'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h09;
            4'h1: out_low = 7'h0a;
            4'h2: out_low = 7'h0a;
            4'h3: out_low = 7'h0a;
            4'h4: out_low = 7'h0b;
            4'h5: out_low = 7'h0b;
            4'h6: out_low = 7'h0b;
            4'h7: out_low = 7'h0b;
            4'h8: out_low = 7'h0c;
            4'h9: out_low = 7'h0c;
            4'ha: out_low = 7'h0c;
            4'hb: out_low = 7'h0d;
            4'hc: out_low = 7'h0d;
            4'hd: out_low = 7'h0d;
            4'he: out_low = 7'h0e;
            4'hf: out_low = 7'h0e;
            default: out_low = 7'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0e;
            4'h1: out_low = 7'h0e;
            4'h2: out_low = 7'h0f;
            4'h3: out_low = 7'h0f;
            4'h4: out_low = 7'h0f;
            4'h5: out_low = 7'h10;
            4'h6: out_low = 7'h10;
            4'h7: out_low = 7'h10;
            4'h8: out_low = 7'h10;
            4'h9: out_low = 7'h11;
            4'ha: out_low = 7'h11;
            4'hb: out_low = 7'h11;
            4'hc: out_low = 7'h12;
            4'hd: out_low = 7'h12;
            4'he: out_low = 7'h12;
            4'hf: out_low = 7'h12;
            default: out_low = 7'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 7'h13;
            4'h1: out_low = 7'h13;
            4'h2: out_low = 7'h13;
            4'h3: out_low = 7'h14;
            4'h4: out_low = 7'h14;
            4'h5: out_low = 7'h14;
            4'h6: out_low = 7'h14;
            4'h7: out_low = 7'h15;
            4'h8: out_low = 7'h15;
            4'h9: out_low = 7'h15;
            4'ha: out_low = 7'h16;
            4'hb: out_low = 7'h16;
            4'hc: out_low = 7'h16;
            4'hd: out_low = 7'h16;
            4'he: out_low = 7'h17;
            4'hf: out_low = 7'h17;
            default: out_low = 7'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 7'h17;
            4'h1: out_low = 7'h18;
            4'h2: out_low = 7'h18;
            4'h3: out_low = 7'h18;
            4'h4: out_low = 7'h18;
            4'h5: out_low = 7'h19;
            4'h6: out_low = 7'h19;
            4'h7: out_low = 7'h19;
            4'h8: out_low = 7'h1a;
            4'h9: out_low = 7'h1a;
            4'ha: out_low = 7'h1a;
            4'hb: out_low = 7'h1b;
            4'hc: out_low = 7'h1b;
            4'hd: out_low = 7'h1b;
            4'he: out_low = 7'h1b;
            4'hf: out_low = 7'h1c;
            default: out_low = 7'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1c;
            4'h1: out_low = 7'h1c;
            4'h2: out_low = 7'h1d;
            4'h3: out_low = 7'h1d;
            4'h4: out_low = 7'h1d;
            4'h5: out_low = 7'h1d;
            4'h6: out_low = 7'h1e;
            4'h7: out_low = 7'h1e;
            4'h8: out_low = 7'h1e;
            4'h9: out_low = 7'h1f;
            4'ha: out_low = 7'h1f;
            4'hb: out_low = 7'h1f;
            4'hc: out_low = 7'h1f;
            4'hd: out_low = 7'h20;
            4'he: out_low = 7'h20;
            4'hf: out_low = 7'h20;
            default: out_low = 7'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 7'h20;
            4'h1: out_low = 7'h21;
            4'h2: out_low = 7'h21;
            4'h3: out_low = 7'h21;
            4'h4: out_low = 7'h22;
            4'h5: out_low = 7'h22;
            4'h6: out_low = 7'h22;
            4'h7: out_low = 7'h22;
            4'h8: out_low = 7'h23;
            4'h9: out_low = 7'h23;
            4'ha: out_low = 7'h23;
            4'hb: out_low = 7'h24;
            4'hc: out_low = 7'h24;
            4'hd: out_low = 7'h24;
            4'he: out_low = 7'h24;
            4'hf: out_low = 7'h25;
            default: out_low = 7'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 7'h25;
            4'h1: out_low = 7'h25;
            4'h2: out_low = 7'h26;
            4'h3: out_low = 7'h26;
            4'h4: out_low = 7'h26;
            4'h5: out_low = 7'h26;
            4'h6: out_low = 7'h27;
            4'h7: out_low = 7'h27;
            4'h8: out_low = 7'h27;
            4'h9: out_low = 7'h28;
            4'ha: out_low = 7'h28;
            4'hb: out_low = 7'h28;
            4'hc: out_low = 7'h28;
            4'hd: out_low = 7'h29;
            4'he: out_low = 7'h29;
            4'hf: out_low = 7'h29;
            default: out_low = 7'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2a;
            4'h1: out_low = 7'h2a;
            4'h2: out_low = 7'h2a;
            4'h3: out_low = 7'h2a;
            4'h4: out_low = 7'h2b;
            4'h5: out_low = 7'h2b;
            4'h6: out_low = 7'h2b;
            4'h7: out_low = 7'h2b;
            4'h8: out_low = 7'h2c;
            4'h9: out_low = 7'h2c;
            4'ha: out_low = 7'h2c;
            4'hb: out_low = 7'h2d;
            4'hc: out_low = 7'h2d;
            4'hd: out_low = 7'h2d;
            4'he: out_low = 7'h2d;
            4'hf: out_low = 7'h2e;
            default: out_low = 7'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2e;
            4'h1: out_low = 7'h2e;
            4'h2: out_low = 7'h2f;
            4'h3: out_low = 7'h2f;
            4'h4: out_low = 7'h2f;
            4'h5: out_low = 7'h2f;
            4'h6: out_low = 7'h30;
            4'h7: out_low = 7'h30;
            4'h8: out_low = 7'h30;
            4'h9: out_low = 7'h31;
            4'ha: out_low = 7'h31;
            4'hb: out_low = 7'h31;
            4'hc: out_low = 7'h31;
            4'hd: out_low = 7'h32;
            4'he: out_low = 7'h32;
            4'hf: out_low = 7'h32;
            default: out_low = 7'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 7'h32;
            4'h1: out_low = 7'h33;
            4'h2: out_low = 7'h33;
            4'h3: out_low = 7'h33;
            4'h4: out_low = 7'h34;
            4'h5: out_low = 7'h34;
            4'h6: out_low = 7'h34;
            4'h7: out_low = 7'h34;
            4'h8: out_low = 7'h35;
            4'h9: out_low = 7'h35;
            4'ha: out_low = 7'h35;
            4'hb: out_low = 7'h36;
            4'hc: out_low = 7'h36;
            4'hd: out_low = 7'h36;
            4'he: out_low = 7'h36;
            4'hf: out_low = 7'h37;
            default: out_low = 7'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 7'h37;
            4'h1: out_low = 7'h37;
            4'h2: out_low = 7'h37;
            4'h3: out_low = 7'h38;
            4'h4: out_low = 7'h38;
            4'h5: out_low = 7'h38;
            4'h6: out_low = 7'h39;
            4'h7: out_low = 7'h39;
            4'h8: out_low = 7'h39;
            4'h9: out_low = 7'h39;
            4'ha: out_low = 7'h3a;
            4'hb: out_low = 7'h3a;
            4'hc: out_low = 7'h3a;
            4'hd: out_low = 7'h3a;
            4'he: out_low = 7'h3b;
            4'hf: out_low = 7'h3b;
            default: out_low = 7'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3b;
            4'h1: out_low = 7'h3c;
            4'h2: out_low = 7'h3c;
            4'h3: out_low = 7'h3c;
            4'h4: out_low = 7'h3c;
            4'h5: out_low = 7'h3d;
            4'h6: out_low = 7'h3d;
            4'h7: out_low = 7'h3d;
            4'h8: out_low = 7'h3e;
            4'h9: out_low = 7'h3e;
            4'ha: out_low = 7'h3e;
            4'hb: out_low = 7'h3e;
            4'hc: out_low = 7'h3f;
            4'hd: out_low = 7'h3f;
            4'he: out_low = 7'h3f;
            4'hf: out_low = 7'h3f;
            default: out_low = 7'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h40;
            4'h1: out_low = 7'h40;
            4'h2: out_low = 7'h40;
            4'h3: out_low = 7'h41;
            4'h4: out_low = 7'h41;
            4'h5: out_low = 7'h41;
            4'h6: out_low = 7'h41;
            4'h7: out_low = 7'h42;
            4'h8: out_low = 7'h42;
            4'h9: out_low = 7'h42;
            4'ha: out_low = 7'h42;
            4'hb: out_low = 7'h43;
            4'hc: out_low = 7'h43;
            4'hd: out_low = 7'h43;
            4'he: out_low = 7'h44;
            4'hf: out_low = 7'h44;
            default: out_low = 7'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h44;
            4'h1: out_low = 7'h44;
            4'h2: out_low = 7'h45;
            4'h3: out_low = 7'h45;
            4'h4: out_low = 7'h45;
            4'h5: out_low = 7'h45;
            4'h6: out_low = 7'h46;
            4'h7: out_low = 7'h46;
            4'h8: out_low = 7'h46;
            4'h9: out_low = 7'h46;
            4'ha: out_low = 7'h47;
            4'hb: out_low = 7'h47;
            4'hc: out_low = 7'h47;
            4'hd: out_low = 7'h48;
            4'he: out_low = 7'h48;
            4'hf: out_low = 7'h48;
            default: out_low = 7'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h48;
            4'h1: out_low = 7'h49;
            4'h2: out_low = 7'h49;
            4'h3: out_low = 7'h49;
            4'h4: out_low = 7'h49;
            4'h5: out_low = 7'h4a;
            4'h6: out_low = 7'h4a;
            4'h7: out_low = 7'h4a;
            4'h8: out_low = 7'h4b;
            4'h9: out_low = 7'h4b;
            4'ha: out_low = 7'h4b;
            4'hb: out_low = 7'h4b;
            4'hc: out_low = 7'h4c;
            4'hd: out_low = 7'h4c;
            4'he: out_low = 7'h4c;
            4'hf: out_low = 7'h4c;
            default: out_low = 7'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4d;
            4'h1: out_low = 7'h4d;
            4'h2: out_low = 7'h4d;
            4'h3: out_low = 7'h4e;
            4'h4: out_low = 7'h4e;
            4'h5: out_low = 7'h4e;
            4'h6: out_low = 7'h4e;
            4'h7: out_low = 7'h4f;
            4'h8: out_low = 7'h4f;
            4'h9: out_low = 7'h4f;
            4'ha: out_low = 7'h4f;
            4'hb: out_low = 7'h50;
            4'hc: out_low = 7'h50;
            4'hd: out_low = 7'h50;
            4'he: out_low = 7'h50;
            4'hf: out_low = 7'h51;
            default: out_low = 7'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h51;
            4'h1: out_low = 7'h51;
            4'h2: out_low = 7'h52;
            4'h3: out_low = 7'h52;
            4'h4: out_low = 7'h52;
            4'h5: out_low = 7'h52;
            4'h6: out_low = 7'h53;
            4'h7: out_low = 7'h53;
            4'h8: out_low = 7'h53;
            4'h9: out_low = 7'h53;
            4'ha: out_low = 7'h54;
            4'hb: out_low = 7'h54;
            4'hc: out_low = 7'h54;
            4'hd: out_low = 7'h54;
            4'he: out_low = 7'h55;
            4'hf: out_low = 7'h55;
            default: out_low = 7'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h55;
            4'h1: out_low = 7'h56;
            4'h2: out_low = 7'h56;
            4'h3: out_low = 7'h56;
            4'h4: out_low = 7'h56;
            4'h5: out_low = 7'h57;
            4'h6: out_low = 7'h57;
            4'h7: out_low = 7'h57;
            4'h8: out_low = 7'h57;
            4'h9: out_low = 7'h58;
            4'ha: out_low = 7'h58;
            4'hb: out_low = 7'h58;
            4'hc: out_low = 7'h58;
            4'hd: out_low = 7'h59;
            4'he: out_low = 7'h59;
            4'hf: out_low = 7'h59;
            default: out_low = 7'h00;
          endcase
        end
        default: out_low = 7'h00;
      endcase
      end
      2'h2: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 7'h59;
            4'h1: out_low = 7'h5a;
            4'h2: out_low = 7'h5b;
            4'h3: out_low = 7'h5b;
            4'h4: out_low = 7'h5c;
            4'h5: out_low = 7'h5c;
            4'h6: out_low = 7'h5d;
            4'h7: out_low = 7'h5d;
            4'h8: out_low = 7'h5e;
            4'h9: out_low = 7'h5e;
            4'ha: out_low = 7'h5f;
            4'hb: out_low = 7'h5f;
            4'hc: out_low = 7'h60;
            4'hd: out_low = 7'h60;
            4'he: out_low = 7'h61;
            4'hf: out_low = 7'h61;
            default: out_low = 7'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 7'h62;
            4'h1: out_low = 7'h62;
            4'h2: out_low = 7'h63;
            4'h3: out_low = 7'h63;
            4'h4: out_low = 7'h64;
            4'h5: out_low = 7'h65;
            4'h6: out_low = 7'h65;
            4'h7: out_low = 7'h66;
            4'h8: out_low = 7'h66;
            4'h9: out_low = 7'h67;
            4'ha: out_low = 7'h67;
            4'hb: out_low = 7'h68;
            4'hc: out_low = 7'h68;
            4'hd: out_low = 7'h69;
            4'he: out_low = 7'h69;
            4'hf: out_low = 7'h6a;
            default: out_low = 7'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6a;
            4'h1: out_low = 7'h6b;
            4'h2: out_low = 7'h6b;
            4'h3: out_low = 7'h6c;
            4'h4: out_low = 7'h6c;
            4'h5: out_low = 7'h6d;
            4'h6: out_low = 7'h6d;
            4'h7: out_low = 7'h6e;
            4'h8: out_low = 7'h6e;
            4'h9: out_low = 7'h6f;
            4'ha: out_low = 7'h6f;
            4'hb: out_low = 7'h70;
            4'hc: out_low = 7'h70;
            4'hd: out_low = 7'h71;
            4'he: out_low = 7'h71;
            4'hf: out_low = 7'h72;
            default: out_low = 7'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 7'h73;
            4'h1: out_low = 7'h73;
            4'h2: out_low = 7'h74;
            4'h3: out_low = 7'h74;
            4'h4: out_low = 7'h75;
            4'h5: out_low = 7'h75;
            4'h6: out_low = 7'h76;
            4'h7: out_low = 7'h76;
            4'h8: out_low = 7'h77;
            4'h9: out_low = 7'h77;
            4'ha: out_low = 7'h78;
            4'hb: out_low = 7'h78;
            4'hc: out_low = 7'h79;
            4'hd: out_low = 7'h79;
            4'he: out_low = 7'h7a;
            4'hf: out_low = 7'h7a;
            default: out_low = 7'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7b;
            4'h1: out_low = 7'h7b;
            4'h2: out_low = 7'h7c;
            4'h3: out_low = 7'h7c;
            4'h4: out_low = 7'h7d;
            4'h5: out_low = 7'h7d;
            4'h6: out_low = 7'h7e;
            4'h7: out_low = 7'h7e;
            4'h8: out_low = 7'h7f;
            4'h9: out_low = 7'h7f;
            4'ha: out_low = 7'h00;
            4'hb: out_low = 7'h00;
            4'hc: out_low = 7'h01;
            4'hd: out_low = 7'h01;
            4'he: out_low = 7'h02;
            4'hf: out_low = 7'h02;
            default: out_low = 7'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 7'h03;
            4'h1: out_low = 7'h03;
            4'h2: out_low = 7'h04;
            4'h3: out_low = 7'h04;
            4'h4: out_low = 7'h05;
            4'h5: out_low = 7'h05;
            4'h6: out_low = 7'h06;
            4'h7: out_low = 7'h06;
            4'h8: out_low = 7'h07;
            4'h9: out_low = 7'h07;
            4'ha: out_low = 7'h08;
            4'hb: out_low = 7'h08;
            4'hc: out_low = 7'h09;
            4'hd: out_low = 7'h09;
            4'he: out_low = 7'h0a;
            4'hf: out_low = 7'h0a;
            default: out_low = 7'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0b;
            4'h1: out_low = 7'h0b;
            4'h2: out_low = 7'h0c;
            4'h3: out_low = 7'h0c;
            4'h4: out_low = 7'h0d;
            4'h5: out_low = 7'h0d;
            4'h6: out_low = 7'h0e;
            4'h7: out_low = 7'h0e;
            4'h8: out_low = 7'h0f;
            4'h9: out_low = 7'h0f;
            4'ha: out_low = 7'h10;
            4'hb: out_low = 7'h10;
            4'hc: out_low = 7'h11;
            4'hd: out_low = 7'h11;
            4'he: out_low = 7'h12;
            4'hf: out_low = 7'h12;
            default: out_low = 7'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 7'h13;
            4'h1: out_low = 7'h13;
            4'h2: out_low = 7'h14;
            4'h3: out_low = 7'h14;
            4'h4: out_low = 7'h15;
            4'h5: out_low = 7'h15;
            4'h6: out_low = 7'h16;
            4'h7: out_low = 7'h16;
            4'h8: out_low = 7'h17;
            4'h9: out_low = 7'h17;
            4'ha: out_low = 7'h18;
            4'hb: out_low = 7'h18;
            4'hc: out_low = 7'h19;
            4'hd: out_low = 7'h19;
            4'he: out_low = 7'h1a;
            4'hf: out_low = 7'h1a;
            default: out_low = 7'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1b;
            4'h1: out_low = 7'h1b;
            4'h2: out_low = 7'h1c;
            4'h3: out_low = 7'h1c;
            4'h4: out_low = 7'h1d;
            4'h5: out_low = 7'h1d;
            4'h6: out_low = 7'h1e;
            4'h7: out_low = 7'h1e;
            4'h8: out_low = 7'h1e;
            4'h9: out_low = 7'h1f;
            4'ha: out_low = 7'h1f;
            4'hb: out_low = 7'h20;
            4'hc: out_low = 7'h20;
            4'hd: out_low = 7'h21;
            4'he: out_low = 7'h21;
            4'hf: out_low = 7'h22;
            default: out_low = 7'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 7'h22;
            4'h1: out_low = 7'h23;
            4'h2: out_low = 7'h23;
            4'h3: out_low = 7'h24;
            4'h4: out_low = 7'h24;
            4'h5: out_low = 7'h25;
            4'h6: out_low = 7'h25;
            4'h7: out_low = 7'h26;
            4'h8: out_low = 7'h26;
            4'h9: out_low = 7'h27;
            4'ha: out_low = 7'h27;
            4'hb: out_low = 7'h28;
            4'hc: out_low = 7'h28;
            4'hd: out_low = 7'h29;
            4'he: out_low = 7'h29;
            4'hf: out_low = 7'h2a;
            default: out_low = 7'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2a;
            4'h1: out_low = 7'h2b;
            4'h2: out_low = 7'h2b;
            4'h3: out_low = 7'h2c;
            4'h4: out_low = 7'h2c;
            4'h5: out_low = 7'h2c;
            4'h6: out_low = 7'h2d;
            4'h7: out_low = 7'h2d;
            4'h8: out_low = 7'h2e;
            4'h9: out_low = 7'h2e;
            4'ha: out_low = 7'h2f;
            4'hb: out_low = 7'h2f;
            4'hc: out_low = 7'h30;
            4'hd: out_low = 7'h30;
            4'he: out_low = 7'h31;
            4'hf: out_low = 7'h31;
            default: out_low = 7'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h32;
            4'h1: out_low = 7'h32;
            4'h2: out_low = 7'h33;
            4'h3: out_low = 7'h33;
            4'h4: out_low = 7'h34;
            4'h5: out_low = 7'h34;
            4'h6: out_low = 7'h35;
            4'h7: out_low = 7'h35;
            4'h8: out_low = 7'h36;
            4'h9: out_low = 7'h36;
            4'ha: out_low = 7'h36;
            4'hb: out_low = 7'h37;
            4'hc: out_low = 7'h37;
            4'hd: out_low = 7'h38;
            4'he: out_low = 7'h38;
            4'hf: out_low = 7'h39;
            default: out_low = 7'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h39;
            4'h1: out_low = 7'h3a;
            4'h2: out_low = 7'h3a;
            4'h3: out_low = 7'h3b;
            4'h4: out_low = 7'h3b;
            4'h5: out_low = 7'h3c;
            4'h6: out_low = 7'h3c;
            4'h7: out_low = 7'h3d;
            4'h8: out_low = 7'h3d;
            4'h9: out_low = 7'h3e;
            4'ha: out_low = 7'h3e;
            4'hb: out_low = 7'h3f;
            4'hc: out_low = 7'h3f;
            4'hd: out_low = 7'h3f;
            4'he: out_low = 7'h40;
            4'hf: out_low = 7'h40;
            default: out_low = 7'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h41;
            4'h1: out_low = 7'h41;
            4'h2: out_low = 7'h42;
            4'h3: out_low = 7'h42;
            4'h4: out_low = 7'h43;
            4'h5: out_low = 7'h43;
            4'h6: out_low = 7'h44;
            4'h7: out_low = 7'h44;
            4'h8: out_low = 7'h45;
            4'h9: out_low = 7'h45;
            4'ha: out_low = 7'h46;
            4'hb: out_low = 7'h46;
            4'hc: out_low = 7'h46;
            4'hd: out_low = 7'h47;
            4'he: out_low = 7'h47;
            4'hf: out_low = 7'h48;
            default: out_low = 7'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h48;
            4'h1: out_low = 7'h49;
            4'h2: out_low = 7'h49;
            4'h3: out_low = 7'h4a;
            4'h4: out_low = 7'h4a;
            4'h5: out_low = 7'h4b;
            4'h6: out_low = 7'h4b;
            4'h7: out_low = 7'h4c;
            4'h8: out_low = 7'h4c;
            4'h9: out_low = 7'h4c;
            4'ha: out_low = 7'h4d;
            4'hb: out_low = 7'h4d;
            4'hc: out_low = 7'h4e;
            4'hd: out_low = 7'h4e;
            4'he: out_low = 7'h4f;
            4'hf: out_low = 7'h4f;
            default: out_low = 7'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h50;
            4'h1: out_low = 7'h50;
            4'h2: out_low = 7'h51;
            4'h3: out_low = 7'h51;
            4'h4: out_low = 7'h52;
            4'h5: out_low = 7'h52;
            4'h6: out_low = 7'h52;
            4'h7: out_low = 7'h53;
            4'h8: out_low = 7'h53;
            4'h9: out_low = 7'h54;
            4'ha: out_low = 7'h54;
            4'hb: out_low = 7'h55;
            4'hc: out_low = 7'h55;
            4'hd: out_low = 7'h56;
            4'he: out_low = 7'h56;
            4'hf: out_low = 7'h57;
            default: out_low = 7'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 7'h57;
            4'h1: out_low = 7'h57;
            4'h2: out_low = 7'h58;
            4'h3: out_low = 7'h58;
            4'h4: out_low = 7'h59;
            4'h5: out_low = 7'h59;
            4'h6: out_low = 7'h5a;
            4'h7: out_low = 7'h5a;
            4'h8: out_low = 7'h5b;
            4'h9: out_low = 7'h5b;
            4'ha: out_low = 7'h5c;
            4'hb: out_low = 7'h5c;
            4'hc: out_low = 7'h5c;
            4'hd: out_low = 7'h5d;
            4'he: out_low = 7'h5d;
            4'hf: out_low = 7'h5e;
            default: out_low = 7'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5e;
            4'h1: out_low = 7'h5f;
            4'h2: out_low = 7'h5f;
            4'h3: out_low = 7'h60;
            4'h4: out_low = 7'h60;
            4'h5: out_low = 7'h61;
            4'h6: out_low = 7'h61;
            4'h7: out_low = 7'h61;
            4'h8: out_low = 7'h62;
            4'h9: out_low = 7'h62;
            4'ha: out_low = 7'h63;
            4'hb: out_low = 7'h63;
            4'hc: out_low = 7'h64;
            4'hd: out_low = 7'h64;
            4'he: out_low = 7'h65;
            4'hf: out_low = 7'h65;
            default: out_low = 7'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 7'h65;
            4'h1: out_low = 7'h66;
            4'h2: out_low = 7'h66;
            4'h3: out_low = 7'h67;
            4'h4: out_low = 7'h67;
            4'h5: out_low = 7'h68;
            4'h6: out_low = 7'h68;
            4'h7: out_low = 7'h69;
            4'h8: out_low = 7'h69;
            4'h9: out_low = 7'h6a;
            4'ha: out_low = 7'h6a;
            4'hb: out_low = 7'h6a;
            4'hc: out_low = 7'h6b;
            4'hd: out_low = 7'h6b;
            4'he: out_low = 7'h6c;
            4'hf: out_low = 7'h6c;
            default: out_low = 7'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6d;
            4'h1: out_low = 7'h6d;
            4'h2: out_low = 7'h6e;
            4'h3: out_low = 7'h6e;
            4'h4: out_low = 7'h6e;
            4'h5: out_low = 7'h6f;
            4'h6: out_low = 7'h6f;
            4'h7: out_low = 7'h70;
            4'h8: out_low = 7'h70;
            4'h9: out_low = 7'h71;
            4'ha: out_low = 7'h71;
            4'hb: out_low = 7'h72;
            4'hc: out_low = 7'h72;
            4'hd: out_low = 7'h72;
            4'he: out_low = 7'h73;
            4'hf: out_low = 7'h73;
            default: out_low = 7'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 7'h74;
            4'h1: out_low = 7'h74;
            4'h2: out_low = 7'h75;
            4'h3: out_low = 7'h75;
            4'h4: out_low = 7'h75;
            4'h5: out_low = 7'h76;
            4'h6: out_low = 7'h76;
            4'h7: out_low = 7'h77;
            4'h8: out_low = 7'h77;
            4'h9: out_low = 7'h78;
            4'ha: out_low = 7'h78;
            4'hb: out_low = 7'h79;
            4'hc: out_low = 7'h79;
            4'hd: out_low = 7'h79;
            4'he: out_low = 7'h7a;
            4'hf: out_low = 7'h7a;
            default: out_low = 7'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7b;
            4'h1: out_low = 7'h7b;
            4'h2: out_low = 7'h7c;
            4'h3: out_low = 7'h7c;
            4'h4: out_low = 7'h7d;
            4'h5: out_low = 7'h7d;
            4'h6: out_low = 7'h7d;
            4'h7: out_low = 7'h7e;
            4'h8: out_low = 7'h7e;
            4'h9: out_low = 7'h7f;
            4'ha: out_low = 7'h7f;
            4'hb: out_low = 7'h00;
            4'hc: out_low = 7'h00;
            4'hd: out_low = 7'h00;
            4'he: out_low = 7'h01;
            4'hf: out_low = 7'h01;
            default: out_low = 7'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 7'h02;
            4'h1: out_low = 7'h02;
            4'h2: out_low = 7'h03;
            4'h3: out_low = 7'h03;
            4'h4: out_low = 7'h03;
            4'h5: out_low = 7'h04;
            4'h6: out_low = 7'h04;
            4'h7: out_low = 7'h05;
            4'h8: out_low = 7'h05;
            4'h9: out_low = 7'h06;
            4'ha: out_low = 7'h06;
            4'hb: out_low = 7'h07;
            4'hc: out_low = 7'h07;
            4'hd: out_low = 7'h07;
            4'he: out_low = 7'h08;
            4'hf: out_low = 7'h08;
            default: out_low = 7'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 7'h09;
            4'h1: out_low = 7'h09;
            4'h2: out_low = 7'h0a;
            4'h3: out_low = 7'h0a;
            4'h4: out_low = 7'h0a;
            4'h5: out_low = 7'h0b;
            4'h6: out_low = 7'h0b;
            4'h7: out_low = 7'h0c;
            4'h8: out_low = 7'h0c;
            4'h9: out_low = 7'h0d;
            4'ha: out_low = 7'h0d;
            4'hb: out_low = 7'h0d;
            4'hc: out_low = 7'h0e;
            4'hd: out_low = 7'h0e;
            4'he: out_low = 7'h0f;
            4'hf: out_low = 7'h0f;
            default: out_low = 7'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 7'h10;
            4'h1: out_low = 7'h10;
            4'h2: out_low = 7'h10;
            4'h3: out_low = 7'h11;
            4'h4: out_low = 7'h11;
            4'h5: out_low = 7'h12;
            4'h6: out_low = 7'h12;
            4'h7: out_low = 7'h13;
            4'h8: out_low = 7'h13;
            4'h9: out_low = 7'h13;
            4'ha: out_low = 7'h14;
            4'hb: out_low = 7'h14;
            4'hc: out_low = 7'h15;
            4'hd: out_low = 7'h15;
            4'he: out_low = 7'h16;
            4'hf: out_low = 7'h16;
            default: out_low = 7'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 7'h16;
            4'h1: out_low = 7'h17;
            4'h2: out_low = 7'h17;
            4'h3: out_low = 7'h18;
            4'h4: out_low = 7'h18;
            4'h5: out_low = 7'h18;
            4'h6: out_low = 7'h19;
            4'h7: out_low = 7'h19;
            4'h8: out_low = 7'h1a;
            4'h9: out_low = 7'h1a;
            4'ha: out_low = 7'h1b;
            4'hb: out_low = 7'h1b;
            4'hc: out_low = 7'h1b;
            4'hd: out_low = 7'h1c;
            4'he: out_low = 7'h1c;
            4'hf: out_low = 7'h1d;
            default: out_low = 7'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1d;
            4'h1: out_low = 7'h1e;
            4'h2: out_low = 7'h1e;
            4'h3: out_low = 7'h1e;
            4'h4: out_low = 7'h1f;
            4'h5: out_low = 7'h1f;
            4'h6: out_low = 7'h20;
            4'h7: out_low = 7'h20;
            4'h8: out_low = 7'h20;
            4'h9: out_low = 7'h21;
            4'ha: out_low = 7'h21;
            4'hb: out_low = 7'h22;
            4'hc: out_low = 7'h22;
            4'hd: out_low = 7'h23;
            4'he: out_low = 7'h23;
            4'hf: out_low = 7'h23;
            default: out_low = 7'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h24;
            4'h1: out_low = 7'h24;
            4'h2: out_low = 7'h25;
            4'h3: out_low = 7'h25;
            4'h4: out_low = 7'h26;
            4'h5: out_low = 7'h26;
            4'h6: out_low = 7'h26;
            4'h7: out_low = 7'h27;
            4'h8: out_low = 7'h27;
            4'h9: out_low = 7'h28;
            4'ha: out_low = 7'h28;
            4'hb: out_low = 7'h28;
            4'hc: out_low = 7'h29;
            4'hd: out_low = 7'h29;
            4'he: out_low = 7'h2a;
            4'hf: out_low = 7'h2a;
            default: out_low = 7'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2b;
            4'h1: out_low = 7'h2b;
            4'h2: out_low = 7'h2b;
            4'h3: out_low = 7'h2c;
            4'h4: out_low = 7'h2c;
            4'h5: out_low = 7'h2d;
            4'h6: out_low = 7'h2d;
            4'h7: out_low = 7'h2d;
            4'h8: out_low = 7'h2e;
            4'h9: out_low = 7'h2e;
            4'ha: out_low = 7'h2f;
            4'hb: out_low = 7'h2f;
            4'hc: out_low = 7'h2f;
            4'hd: out_low = 7'h30;
            4'he: out_low = 7'h30;
            4'hf: out_low = 7'h31;
            default: out_low = 7'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h31;
            4'h1: out_low = 7'h32;
            4'h2: out_low = 7'h32;
            4'h3: out_low = 7'h32;
            4'h4: out_low = 7'h33;
            4'h5: out_low = 7'h33;
            4'h6: out_low = 7'h34;
            4'h7: out_low = 7'h34;
            4'h8: out_low = 7'h34;
            4'h9: out_low = 7'h35;
            4'ha: out_low = 7'h35;
            4'hb: out_low = 7'h36;
            4'hc: out_low = 7'h36;
            4'hd: out_low = 7'h36;
            4'he: out_low = 7'h37;
            4'hf: out_low = 7'h37;
            default: out_low = 7'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h38;
            4'h1: out_low = 7'h38;
            4'h2: out_low = 7'h39;
            4'h3: out_low = 7'h39;
            4'h4: out_low = 7'h39;
            4'h5: out_low = 7'h3a;
            4'h6: out_low = 7'h3a;
            4'h7: out_low = 7'h3b;
            4'h8: out_low = 7'h3b;
            4'h9: out_low = 7'h3b;
            4'ha: out_low = 7'h3c;
            4'hb: out_low = 7'h3c;
            4'hc: out_low = 7'h3d;
            4'hd: out_low = 7'h3d;
            4'he: out_low = 7'h3d;
            4'hf: out_low = 7'h3e;
            default: out_low = 7'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3e;
            4'h1: out_low = 7'h3f;
            4'h2: out_low = 7'h3f;
            4'h3: out_low = 7'h3f;
            4'h4: out_low = 7'h40;
            4'h5: out_low = 7'h40;
            4'h6: out_low = 7'h41;
            4'h7: out_low = 7'h41;
            4'h8: out_low = 7'h41;
            4'h9: out_low = 7'h42;
            4'ha: out_low = 7'h42;
            4'hb: out_low = 7'h43;
            4'hc: out_low = 7'h43;
            4'hd: out_low = 7'h44;
            4'he: out_low = 7'h44;
            4'hf: out_low = 7'h44;
            default: out_low = 7'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 7'h45;
            4'h1: out_low = 7'h45;
            4'h2: out_low = 7'h46;
            4'h3: out_low = 7'h46;
            4'h4: out_low = 7'h46;
            4'h5: out_low = 7'h47;
            4'h6: out_low = 7'h47;
            4'h7: out_low = 7'h48;
            4'h8: out_low = 7'h48;
            4'h9: out_low = 7'h48;
            4'ha: out_low = 7'h49;
            4'hb: out_low = 7'h49;
            4'hc: out_low = 7'h4a;
            4'hd: out_low = 7'h4a;
            4'he: out_low = 7'h4a;
            4'hf: out_low = 7'h4b;
            default: out_low = 7'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4b;
            4'h1: out_low = 7'h4c;
            4'h2: out_low = 7'h4c;
            4'h3: out_low = 7'h4c;
            4'h4: out_low = 7'h4d;
            4'h5: out_low = 7'h4d;
            4'h6: out_low = 7'h4e;
            4'h7: out_low = 7'h4e;
            4'h8: out_low = 7'h4e;
            4'h9: out_low = 7'h4f;
            4'ha: out_low = 7'h4f;
            4'hb: out_low = 7'h50;
            4'hc: out_low = 7'h50;
            4'hd: out_low = 7'h50;
            4'he: out_low = 7'h51;
            4'hf: out_low = 7'h51;
            default: out_low = 7'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 7'h52;
            4'h1: out_low = 7'h52;
            4'h2: out_low = 7'h52;
            4'h3: out_low = 7'h53;
            4'h4: out_low = 7'h53;
            4'h5: out_low = 7'h54;
            4'h6: out_low = 7'h54;
            4'h7: out_low = 7'h54;
            4'h8: out_low = 7'h55;
            4'h9: out_low = 7'h55;
            4'ha: out_low = 7'h56;
            4'hb: out_low = 7'h56;
            4'hc: out_low = 7'h56;
            4'hd: out_low = 7'h57;
            4'he: out_low = 7'h57;
            4'hf: out_low = 7'h58;
            default: out_low = 7'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 7'h58;
            4'h1: out_low = 7'h58;
            4'h2: out_low = 7'h59;
            4'h3: out_low = 7'h59;
            4'h4: out_low = 7'h59;
            4'h5: out_low = 7'h5a;
            4'h6: out_low = 7'h5a;
            4'h7: out_low = 7'h5b;
            4'h8: out_low = 7'h5b;
            4'h9: out_low = 7'h5b;
            4'ha: out_low = 7'h5c;
            4'hb: out_low = 7'h5c;
            4'hc: out_low = 7'h5d;
            4'hd: out_low = 7'h5d;
            4'he: out_low = 7'h5d;
            4'hf: out_low = 7'h5e;
            default: out_low = 7'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5e;
            4'h1: out_low = 7'h5f;
            4'h2: out_low = 7'h5f;
            4'h3: out_low = 7'h5f;
            4'h4: out_low = 7'h60;
            4'h5: out_low = 7'h60;
            4'h6: out_low = 7'h61;
            4'h7: out_low = 7'h61;
            4'h8: out_low = 7'h61;
            4'h9: out_low = 7'h62;
            4'ha: out_low = 7'h62;
            4'hb: out_low = 7'h63;
            4'hc: out_low = 7'h63;
            4'hd: out_low = 7'h63;
            4'he: out_low = 7'h64;
            4'hf: out_low = 7'h64;
            default: out_low = 7'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 7'h64;
            4'h1: out_low = 7'h65;
            4'h2: out_low = 7'h65;
            4'h3: out_low = 7'h66;
            4'h4: out_low = 7'h66;
            4'h5: out_low = 7'h66;
            4'h6: out_low = 7'h67;
            4'h7: out_low = 7'h67;
            4'h8: out_low = 7'h68;
            4'h9: out_low = 7'h68;
            4'ha: out_low = 7'h68;
            4'hb: out_low = 7'h69;
            4'hc: out_low = 7'h69;
            4'hd: out_low = 7'h6a;
            4'he: out_low = 7'h6a;
            4'hf: out_low = 7'h6a;
            default: out_low = 7'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6b;
            4'h1: out_low = 7'h6b;
            4'h2: out_low = 7'h6b;
            4'h3: out_low = 7'h6c;
            4'h4: out_low = 7'h6c;
            4'h5: out_low = 7'h6d;
            4'h6: out_low = 7'h6d;
            4'h7: out_low = 7'h6d;
            4'h8: out_low = 7'h6e;
            4'h9: out_low = 7'h6e;
            4'ha: out_low = 7'h6f;
            4'hb: out_low = 7'h6f;
            4'hc: out_low = 7'h6f;
            4'hd: out_low = 7'h70;
            4'he: out_low = 7'h70;
            4'hf: out_low = 7'h71;
            default: out_low = 7'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 7'h71;
            4'h1: out_low = 7'h71;
            4'h2: out_low = 7'h72;
            4'h3: out_low = 7'h72;
            4'h4: out_low = 7'h72;
            4'h5: out_low = 7'h73;
            4'h6: out_low = 7'h73;
            4'h7: out_low = 7'h74;
            4'h8: out_low = 7'h74;
            4'h9: out_low = 7'h74;
            4'ha: out_low = 7'h75;
            4'hb: out_low = 7'h75;
            4'hc: out_low = 7'h76;
            4'hd: out_low = 7'h76;
            4'he: out_low = 7'h76;
            4'hf: out_low = 7'h77;
            default: out_low = 7'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 7'h77;
            4'h1: out_low = 7'h77;
            4'h2: out_low = 7'h78;
            4'h3: out_low = 7'h78;
            4'h4: out_low = 7'h79;
            4'h5: out_low = 7'h79;
            4'h6: out_low = 7'h79;
            4'h7: out_low = 7'h7a;
            4'h8: out_low = 7'h7a;
            4'h9: out_low = 7'h7a;
            4'ha: out_low = 7'h7b;
            4'hb: out_low = 7'h7b;
            4'hc: out_low = 7'h7c;
            4'hd: out_low = 7'h7c;
            4'he: out_low = 7'h7c;
            4'hf: out_low = 7'h7d;
            default: out_low = 7'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7d;
            4'h1: out_low = 7'h7e;
            4'h2: out_low = 7'h7e;
            4'h3: out_low = 7'h7e;
            4'h4: out_low = 7'h7f;
            4'h5: out_low = 7'h7f;
            4'h6: out_low = 7'h7f;
            4'h7: out_low = 7'h00;
            4'h8: out_low = 7'h00;
            4'h9: out_low = 7'h01;
            4'ha: out_low = 7'h01;
            4'hb: out_low = 7'h01;
            4'hc: out_low = 7'h02;
            4'hd: out_low = 7'h02;
            4'he: out_low = 7'h02;
            4'hf: out_low = 7'h03;
            default: out_low = 7'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h03;
            4'h1: out_low = 7'h04;
            4'h2: out_low = 7'h04;
            4'h3: out_low = 7'h04;
            4'h4: out_low = 7'h05;
            4'h5: out_low = 7'h05;
            4'h6: out_low = 7'h05;
            4'h7: out_low = 7'h06;
            4'h8: out_low = 7'h06;
            4'h9: out_low = 7'h07;
            4'ha: out_low = 7'h07;
            4'hb: out_low = 7'h07;
            4'hc: out_low = 7'h08;
            4'hd: out_low = 7'h08;
            4'he: out_low = 7'h08;
            4'hf: out_low = 7'h09;
            default: out_low = 7'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h09;
            4'h1: out_low = 7'h0a;
            4'h2: out_low = 7'h0a;
            4'h3: out_low = 7'h0a;
            4'h4: out_low = 7'h0b;
            4'h5: out_low = 7'h0b;
            4'h6: out_low = 7'h0b;
            4'h7: out_low = 7'h0c;
            4'h8: out_low = 7'h0c;
            4'h9: out_low = 7'h0d;
            4'ha: out_low = 7'h0d;
            4'hb: out_low = 7'h0d;
            4'hc: out_low = 7'h0e;
            4'hd: out_low = 7'h0e;
            4'he: out_low = 7'h0e;
            4'hf: out_low = 7'h0f;
            default: out_low = 7'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h0f;
            4'h1: out_low = 7'h10;
            4'h2: out_low = 7'h10;
            4'h3: out_low = 7'h10;
            4'h4: out_low = 7'h11;
            4'h5: out_low = 7'h11;
            4'h6: out_low = 7'h11;
            4'h7: out_low = 7'h12;
            4'h8: out_low = 7'h12;
            4'h9: out_low = 7'h13;
            4'ha: out_low = 7'h13;
            4'hb: out_low = 7'h13;
            4'hc: out_low = 7'h14;
            4'hd: out_low = 7'h14;
            4'he: out_low = 7'h14;
            4'hf: out_low = 7'h15;
            default: out_low = 7'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h15;
            4'h1: out_low = 7'h16;
            4'h2: out_low = 7'h16;
            4'h3: out_low = 7'h16;
            4'h4: out_low = 7'h17;
            4'h5: out_low = 7'h17;
            4'h6: out_low = 7'h17;
            4'h7: out_low = 7'h18;
            4'h8: out_low = 7'h18;
            4'h9: out_low = 7'h19;
            4'ha: out_low = 7'h19;
            4'hb: out_low = 7'h19;
            4'hc: out_low = 7'h1a;
            4'hd: out_low = 7'h1a;
            4'he: out_low = 7'h1a;
            4'hf: out_low = 7'h1b;
            default: out_low = 7'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h1b;
            4'h1: out_low = 7'h1b;
            4'h2: out_low = 7'h1c;
            4'h3: out_low = 7'h1c;
            4'h4: out_low = 7'h1d;
            4'h5: out_low = 7'h1d;
            4'h6: out_low = 7'h1d;
            4'h7: out_low = 7'h1e;
            4'h8: out_low = 7'h1e;
            4'h9: out_low = 7'h1e;
            4'ha: out_low = 7'h1f;
            4'hb: out_low = 7'h1f;
            4'hc: out_low = 7'h20;
            4'hd: out_low = 7'h20;
            4'he: out_low = 7'h20;
            4'hf: out_low = 7'h21;
            default: out_low = 7'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h21;
            4'h1: out_low = 7'h21;
            4'h2: out_low = 7'h22;
            4'h3: out_low = 7'h22;
            4'h4: out_low = 7'h22;
            4'h5: out_low = 7'h23;
            4'h6: out_low = 7'h23;
            4'h7: out_low = 7'h24;
            4'h8: out_low = 7'h24;
            4'h9: out_low = 7'h24;
            4'ha: out_low = 7'h25;
            4'hb: out_low = 7'h25;
            4'hc: out_low = 7'h25;
            4'hd: out_low = 7'h26;
            4'he: out_low = 7'h26;
            4'hf: out_low = 7'h26;
            default: out_low = 7'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 7'h27;
            4'h1: out_low = 7'h27;
            4'h2: out_low = 7'h28;
            4'h3: out_low = 7'h28;
            4'h4: out_low = 7'h28;
            4'h5: out_low = 7'h29;
            4'h6: out_low = 7'h29;
            4'h7: out_low = 7'h29;
            4'h8: out_low = 7'h2a;
            4'h9: out_low = 7'h2a;
            4'ha: out_low = 7'h2a;
            4'hb: out_low = 7'h2b;
            4'hc: out_low = 7'h2b;
            4'hd: out_low = 7'h2c;
            4'he: out_low = 7'h2c;
            4'hf: out_low = 7'h2c;
            default: out_low = 7'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 7'h2d;
            4'h1: out_low = 7'h2d;
            4'h2: out_low = 7'h2d;
            4'h3: out_low = 7'h2e;
            4'h4: out_low = 7'h2e;
            4'h5: out_low = 7'h2e;
            4'h6: out_low = 7'h2f;
            4'h7: out_low = 7'h2f;
            4'h8: out_low = 7'h30;
            4'h9: out_low = 7'h30;
            4'ha: out_low = 7'h30;
            4'hb: out_low = 7'h31;
            4'hc: out_low = 7'h31;
            4'hd: out_low = 7'h31;
            4'he: out_low = 7'h32;
            4'hf: out_low = 7'h32;
            default: out_low = 7'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 7'h32;
            4'h1: out_low = 7'h33;
            4'h2: out_low = 7'h33;
            4'h3: out_low = 7'h34;
            4'h4: out_low = 7'h34;
            4'h5: out_low = 7'h34;
            4'h6: out_low = 7'h35;
            4'h7: out_low = 7'h35;
            4'h8: out_low = 7'h35;
            4'h9: out_low = 7'h36;
            4'ha: out_low = 7'h36;
            4'hb: out_low = 7'h36;
            4'hc: out_low = 7'h37;
            4'hd: out_low = 7'h37;
            4'he: out_low = 7'h37;
            4'hf: out_low = 7'h38;
            default: out_low = 7'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 7'h38;
            4'h1: out_low = 7'h39;
            4'h2: out_low = 7'h39;
            4'h3: out_low = 7'h39;
            4'h4: out_low = 7'h3a;
            4'h5: out_low = 7'h3a;
            4'h6: out_low = 7'h3a;
            4'h7: out_low = 7'h3b;
            4'h8: out_low = 7'h3b;
            4'h9: out_low = 7'h3b;
            4'ha: out_low = 7'h3c;
            4'hb: out_low = 7'h3c;
            4'hc: out_low = 7'h3c;
            4'hd: out_low = 7'h3d;
            4'he: out_low = 7'h3d;
            4'hf: out_low = 7'h3e;
            default: out_low = 7'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 7'h3e;
            4'h1: out_low = 7'h3e;
            4'h2: out_low = 7'h3f;
            4'h3: out_low = 7'h3f;
            4'h4: out_low = 7'h3f;
            4'h5: out_low = 7'h40;
            4'h6: out_low = 7'h40;
            4'h7: out_low = 7'h40;
            4'h8: out_low = 7'h41;
            4'h9: out_low = 7'h41;
            4'ha: out_low = 7'h41;
            4'hb: out_low = 7'h42;
            4'hc: out_low = 7'h42;
            4'hd: out_low = 7'h43;
            4'he: out_low = 7'h43;
            4'hf: out_low = 7'h43;
            default: out_low = 7'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 7'h44;
            4'h1: out_low = 7'h44;
            4'h2: out_low = 7'h44;
            4'h3: out_low = 7'h45;
            4'h4: out_low = 7'h45;
            4'h5: out_low = 7'h45;
            4'h6: out_low = 7'h46;
            4'h7: out_low = 7'h46;
            4'h8: out_low = 7'h46;
            4'h9: out_low = 7'h47;
            4'ha: out_low = 7'h47;
            4'hb: out_low = 7'h47;
            4'hc: out_low = 7'h48;
            4'hd: out_low = 7'h48;
            4'he: out_low = 7'h49;
            4'hf: out_low = 7'h49;
            default: out_low = 7'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 7'h49;
            4'h1: out_low = 7'h4a;
            4'h2: out_low = 7'h4a;
            4'h3: out_low = 7'h4a;
            4'h4: out_low = 7'h4b;
            4'h5: out_low = 7'h4b;
            4'h6: out_low = 7'h4b;
            4'h7: out_low = 7'h4c;
            4'h8: out_low = 7'h4c;
            4'h9: out_low = 7'h4c;
            4'ha: out_low = 7'h4d;
            4'hb: out_low = 7'h4d;
            4'hc: out_low = 7'h4d;
            4'hd: out_low = 7'h4e;
            4'he: out_low = 7'h4e;
            4'hf: out_low = 7'h4e;
            default: out_low = 7'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 7'h4f;
            4'h1: out_low = 7'h4f;
            4'h2: out_low = 7'h50;
            4'h3: out_low = 7'h50;
            4'h4: out_low = 7'h50;
            4'h5: out_low = 7'h51;
            4'h6: out_low = 7'h51;
            4'h7: out_low = 7'h51;
            4'h8: out_low = 7'h52;
            4'h9: out_low = 7'h52;
            4'ha: out_low = 7'h52;
            4'hb: out_low = 7'h53;
            4'hc: out_low = 7'h53;
            4'hd: out_low = 7'h53;
            4'he: out_low = 7'h54;
            4'hf: out_low = 7'h54;
            default: out_low = 7'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 7'h54;
            4'h1: out_low = 7'h55;
            4'h2: out_low = 7'h55;
            4'h3: out_low = 7'h55;
            4'h4: out_low = 7'h56;
            4'h5: out_low = 7'h56;
            4'h6: out_low = 7'h56;
            4'h7: out_low = 7'h57;
            4'h8: out_low = 7'h57;
            4'h9: out_low = 7'h58;
            4'ha: out_low = 7'h58;
            4'hb: out_low = 7'h58;
            4'hc: out_low = 7'h59;
            4'hd: out_low = 7'h59;
            4'he: out_low = 7'h59;
            4'hf: out_low = 7'h5a;
            default: out_low = 7'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5a;
            4'h1: out_low = 7'h5a;
            4'h2: out_low = 7'h5b;
            4'h3: out_low = 7'h5b;
            4'h4: out_low = 7'h5b;
            4'h5: out_low = 7'h5c;
            4'h6: out_low = 7'h5c;
            4'h7: out_low = 7'h5c;
            4'h8: out_low = 7'h5d;
            4'h9: out_low = 7'h5d;
            4'ha: out_low = 7'h5d;
            4'hb: out_low = 7'h5e;
            4'hc: out_low = 7'h5e;
            4'hd: out_low = 7'h5e;
            4'he: out_low = 7'h5f;
            4'hf: out_low = 7'h5f;
            default: out_low = 7'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 7'h5f;
            4'h1: out_low = 7'h60;
            4'h2: out_low = 7'h60;
            4'h3: out_low = 7'h61;
            4'h4: out_low = 7'h61;
            4'h5: out_low = 7'h61;
            4'h6: out_low = 7'h62;
            4'h7: out_low = 7'h62;
            4'h8: out_low = 7'h62;
            4'h9: out_low = 7'h63;
            4'ha: out_low = 7'h63;
            4'hb: out_low = 7'h63;
            4'hc: out_low = 7'h64;
            4'hd: out_low = 7'h64;
            4'he: out_low = 7'h64;
            4'hf: out_low = 7'h65;
            default: out_low = 7'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 7'h65;
            4'h1: out_low = 7'h65;
            4'h2: out_low = 7'h66;
            4'h3: out_low = 7'h66;
            4'h4: out_low = 7'h66;
            4'h5: out_low = 7'h67;
            4'h6: out_low = 7'h67;
            4'h7: out_low = 7'h67;
            4'h8: out_low = 7'h68;
            4'h9: out_low = 7'h68;
            4'ha: out_low = 7'h68;
            4'hb: out_low = 7'h69;
            4'hc: out_low = 7'h69;
            4'hd: out_low = 7'h69;
            4'he: out_low = 7'h6a;
            4'hf: out_low = 7'h6a;
            default: out_low = 7'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 7'h6a;
            4'h1: out_low = 7'h6b;
            4'h2: out_low = 7'h6b;
            4'h3: out_low = 7'h6b;
            4'h4: out_low = 7'h6c;
            4'h5: out_low = 7'h6c;
            4'h6: out_low = 7'h6c;
            4'h7: out_low = 7'h6d;
            4'h8: out_low = 7'h6d;
            4'h9: out_low = 7'h6e;
            4'ha: out_low = 7'h6e;
            4'hb: out_low = 7'h6e;
            4'hc: out_low = 7'h6f;
            4'hd: out_low = 7'h6f;
            4'he: out_low = 7'h6f;
            4'hf: out_low = 7'h70;
            default: out_low = 7'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 7'h70;
            4'h1: out_low = 7'h70;
            4'h2: out_low = 7'h71;
            4'h3: out_low = 7'h71;
            4'h4: out_low = 7'h71;
            4'h5: out_low = 7'h72;
            4'h6: out_low = 7'h72;
            4'h7: out_low = 7'h72;
            4'h8: out_low = 7'h73;
            4'h9: out_low = 7'h73;
            4'ha: out_low = 7'h73;
            4'hb: out_low = 7'h74;
            4'hc: out_low = 7'h74;
            4'hd: out_low = 7'h74;
            4'he: out_low = 7'h75;
            4'hf: out_low = 7'h75;
            default: out_low = 7'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 7'h75;
            4'h1: out_low = 7'h76;
            4'h2: out_low = 7'h76;
            4'h3: out_low = 7'h76;
            4'h4: out_low = 7'h77;
            4'h5: out_low = 7'h77;
            4'h6: out_low = 7'h77;
            4'h7: out_low = 7'h78;
            4'h8: out_low = 7'h78;
            4'h9: out_low = 7'h78;
            4'ha: out_low = 7'h79;
            4'hb: out_low = 7'h79;
            4'hc: out_low = 7'h79;
            4'hd: out_low = 7'h7a;
            4'he: out_low = 7'h7a;
            4'hf: out_low = 7'h7a;
            default: out_low = 7'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 7'h7b;
            4'h1: out_low = 7'h7b;
            4'h2: out_low = 7'h7b;
            4'h3: out_low = 7'h7c;
            4'h4: out_low = 7'h7c;
            4'h5: out_low = 7'h7c;
            4'h6: out_low = 7'h7d;
            4'h7: out_low = 7'h7d;
            4'h8: out_low = 7'h7d;
            4'h9: out_low = 7'h7e;
            4'ha: out_low = 7'h7e;
            4'hb: out_low = 7'h7e;
            4'hc: out_low = 7'h7f;
            4'hd: out_low = 7'h7f;
            4'he: out_low = 7'h7f;
            4'hf: out_low = 7'h00;
            default: out_low = 7'h00;
          endcase
        end
        default: out_low = 7'h00;
      endcase
      end
      default: out_low = 7'h00;
    endcase
  end
  reg mag_b14;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b14 = 0;
      end
      5'h02: begin
        mag_b14 = 0;
      end
      5'h03: begin
        mag_b14 = 0;
      end
      5'h04: begin
        mag_b14 = 0;
      end
      5'h05: begin
        mag_b14 = 0;
      end
      5'h06: begin
        mag_b14 = 0;
      end
      5'h07: begin
        mag_b14 = 0;
      end
      5'h08: begin
        mag_b14 = 0;
      end
      5'h09: begin
        mag_b14 = 0;
      end
      5'h0a: begin
        mag_b14 = 0;
      end
      5'h0b: begin
        mag_b14 = 0;
      end
      5'h0c: begin
        mag_b14 = 0;
      end
      5'h0d: begin
        mag_b14 = 0;
      end
      5'h0e: begin
        mag_b14 = 0;
      end
      5'h0f: begin
        mag_b14 = 0;
      end
      5'h10: begin
        mag_b14 = 0;
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          mag_b14 = 0;
        end else begin
          mag_b14 = 1;
        end
      end
      5'h12: begin
        mag_b14 = 1;
      end
      5'h13: begin
        mag_b14 = 1;
      end
      5'h14: begin
        mag_b14 = 1;
      end
      5'h15: begin
        mag_b14 = 1;
      end
      5'h16: begin
        mag_b14 = 1;
      end
      5'h17: begin
        mag_b14 = 1;
      end
      5'h18: begin
        mag_b14 = 1;
      end
      5'h19: begin
        mag_b14 = 1;
      end
      5'h1a: begin
        mag_b14 = 1;
      end
      5'h1b: begin
        mag_b14 = 1;
      end
      5'h1c: begin
        mag_b14 = 1;
      end
      5'h1d: begin
        mag_b14 = 1;
      end
      5'h1e: begin
        mag_b14 = 1;
      end
      default: mag_b14 = 1'b0;
    endcase
  end
  reg mag_b13;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b13 = 1;
      end
      5'h02: begin
        mag_b13 = 1;
      end
      5'h03: begin
        mag_b13 = 1;
      end
      5'h04: begin
        mag_b13 = 1;
      end
      5'h05: begin
        mag_b13 = 1;
      end
      5'h06: begin
        mag_b13 = 1;
      end
      5'h07: begin
        mag_b13 = 1;
      end
      5'h08: begin
        mag_b13 = 1;
      end
      5'h09: begin
        mag_b13 = 1;
      end
      5'h0a: begin
        mag_b13 = 1;
      end
      5'h0b: begin
        mag_b13 = 1;
      end
      5'h0c: begin
        mag_b13 = 1;
      end
      5'h0d: begin
        mag_b13 = 1;
      end
      5'h0e: begin
        mag_b13 = 1;
      end
      5'h0f: begin
        mag_b13 = 1;
      end
      5'h10: begin
        mag_b13 = 1;
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          mag_b13 = 1;
        end else begin
          mag_b13 = 0;
        end
      end
      5'h12: begin
        mag_b13 = 0;
      end
      5'h13: begin
        mag_b13 = 0;
      end
      5'h14: begin
        mag_b13 = 0;
      end
      5'h15: begin
        mag_b13 = 0;
      end
      5'h16: begin
        mag_b13 = 0;
      end
      5'h17: begin
        mag_b13 = 0;
      end
      5'h18: begin
        mag_b13 = 0;
      end
      5'h19: begin
        mag_b13 = 0;
      end
      5'h1a: begin
        mag_b13 = 0;
      end
      5'h1b: begin
        mag_b13 = 0;
      end
      5'h1c: begin
        mag_b13 = 0;
      end
      5'h1d: begin
        mag_b13 = 0;
      end
      5'h1e: begin
        mag_b13 = 0;
      end
      default: mag_b13 = 1'b0;
    endcase
  end
  reg mag_b12;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b12 = 0;
      end
      5'h02: begin
        mag_b12 = 0;
      end
      5'h03: begin
        mag_b12 = 0;
      end
      5'h04: begin
        mag_b12 = 0;
      end
      5'h05: begin
        if (mant <= 10'h3fe) begin
          mag_b12 = 0;
        end else begin
          mag_b12 = 1;
        end
      end
      5'h06: begin
        mag_b12 = 1;
      end
      5'h07: begin
        mag_b12 = 1;
      end
      5'h08: begin
        mag_b12 = 1;
      end
      5'h09: begin
        mag_b12 = 1;
      end
      5'h0a: begin
        mag_b12 = 1;
      end
      5'h0b: begin
        mag_b12 = 1;
      end
      5'h0c: begin
        mag_b12 = 1;
      end
      5'h0d: begin
        mag_b12 = 1;
      end
      5'h0e: begin
        mag_b12 = 1;
      end
      5'h0f: begin
        mag_b12 = 1;
      end
      5'h10: begin
        mag_b12 = 1;
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          mag_b12 = 1;
        end else begin
          mag_b12 = 0;
        end
      end
      5'h12: begin
        mag_b12 = 0;
      end
      5'h13: begin
        mag_b12 = 0;
      end
      5'h14: begin
        mag_b12 = 0;
      end
      5'h15: begin
        mag_b12 = 0;
      end
      5'h16: begin
        mag_b12 = 0;
      end
      5'h17: begin
        mag_b12 = 0;
      end
      5'h18: begin
        mag_b12 = 0;
      end
      5'h19: begin
        mag_b12 = 0;
      end
      5'h1a: begin
        mag_b12 = 0;
      end
      5'h1b: begin
        mag_b12 = 0;
      end
      5'h1c: begin
        mag_b12 = 0;
      end
      5'h1d: begin
        if (mant <= 10'h3fe) begin
          mag_b12 = 0;
        end else begin
          mag_b12 = 1;
        end
      end
      5'h1e: begin
        mag_b12 = 1;
      end
      default: mag_b12 = 1'b0;
    endcase
  end
  reg mag_b11;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b11 = 1;
      end
      5'h02: begin
        mag_b11 = 1;
      end
      5'h03: begin
        mag_b11 = 1;
      end
      5'h04: begin
        mag_b11 = 1;
      end
      5'h05: begin
        if (mant <= 10'h3fe) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h06: begin
        mag_b11 = 0;
      end
      5'h07: begin
        mag_b11 = 0;
      end
      5'h08: begin
        mag_b11 = 0;
      end
      5'h09: begin
        mag_b11 = 0;
      end
      5'h0a: begin
        mag_b11 = 0;
      end
      5'h0b: begin
        if (mant <= 10'h3fe) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h0c: begin
        mag_b11 = 1;
      end
      5'h0d: begin
        mag_b11 = 1;
      end
      5'h0e: begin
        mag_b11 = 1;
      end
      5'h0f: begin
        mag_b11 = 1;
      end
      5'h10: begin
        mag_b11 = 1;
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h12: begin
        mag_b11 = 0;
      end
      5'h13: begin
        mag_b11 = 0;
      end
      5'h14: begin
        mag_b11 = 0;
      end
      5'h15: begin
        mag_b11 = 0;
      end
      5'h16: begin
        mag_b11 = 0;
      end
      5'h17: begin
        if (mant <= 10'h3fe) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h18: begin
        mag_b11 = 1;
      end
      5'h19: begin
        mag_b11 = 1;
      end
      5'h1a: begin
        mag_b11 = 1;
      end
      5'h1b: begin
        mag_b11 = 1;
      end
      5'h1c: begin
        mag_b11 = 1;
      end
      5'h1d: begin
        if (mant <= 10'h3fe) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h1e: begin
        mag_b11 = 0;
      end
      default: mag_b11 = 1'b0;
    endcase
  end
  reg mag_b10;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b10 = 0;
      end
      5'h02: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h03: begin
        mag_b10 = 1;
      end
      5'h04: begin
        mag_b10 = 1;
      end
      5'h05: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h06: begin
        mag_b10 = 0;
      end
      5'h07: begin
        mag_b10 = 0;
      end
      5'h08: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h09: begin
        mag_b10 = 1;
      end
      5'h0a: begin
        mag_b10 = 1;
      end
      5'h0b: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h0c: begin
        mag_b10 = 0;
      end
      5'h0d: begin
        mag_b10 = 0;
      end
      5'h0e: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h0f: begin
        mag_b10 = 1;
      end
      5'h10: begin
        mag_b10 = 1;
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h12: begin
        mag_b10 = 0;
      end
      5'h13: begin
        mag_b10 = 0;
      end
      5'h14: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h15: begin
        mag_b10 = 1;
      end
      5'h16: begin
        mag_b10 = 1;
      end
      5'h17: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h18: begin
        mag_b10 = 0;
      end
      5'h19: begin
        mag_b10 = 0;
      end
      5'h1a: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h1b: begin
        mag_b10 = 1;
      end
      5'h1c: begin
        mag_b10 = 1;
      end
      5'h1d: begin
        if (mant <= 10'h3fe) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h1e: begin
        mag_b10 = 0;
      end
      default: mag_b10 = 1'b0;
    endcase
  end
  reg mag_b9;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h02: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h03: begin
        mag_b9 = 0;
      end
      5'h04: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h05: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h06: begin
        mag_b9 = 0;
      end
      5'h07: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h08: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h09: begin
        mag_b9 = 0;
      end
      5'h0a: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h0b: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h0c: begin
        mag_b9 = 0;
      end
      5'h0d: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h0e: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h0f: begin
        mag_b9 = 0;
      end
      5'h10: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h12: begin
        mag_b9 = 0;
      end
      5'h13: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h14: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h15: begin
        mag_b9 = 0;
      end
      5'h16: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h17: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h18: begin
        mag_b9 = 0;
      end
      5'h19: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h1a: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h1b: begin
        mag_b9 = 0;
      end
      5'h1c: begin
        if (mant <= 10'h2be) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h1d: begin
        if (mant <= 10'h3fe) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h1e: begin
        mag_b9 = 0;
      end
      default: mag_b9 = 1'b0;
    endcase
  end
  reg mag_b8;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h02: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h03: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h04: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h05: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h06: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h07: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h08: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h09: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h0a: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0b: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h0c: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h0d: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0e: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h0f: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h10: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h11: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h12: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h13: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h14: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h15: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h16: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h17: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h18: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h19: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h1a: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h1b: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h1c: begin
        if (mant <= 10'h2be) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h1d: begin
        if (mant <= 10'h15a) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h3fe) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h1e: begin
        if (mant <= 10'h3cd) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      default: mag_b8 = 1'b0;
    endcase
  end
  reg mag_b7;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h02: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h03: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h04: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h05: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h06: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h07: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h08: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h09: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h0a: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h0b: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h0c: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h0d: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h0e: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h0f: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h10: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h11: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h12: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h13: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h14: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h15: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h16: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h17: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h18: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h19: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h1a: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h1b: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h1c: begin
        if (mant <= 10'h131) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h2be) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      5'h1d: begin
        if (mant <= 10'h15a) begin
          if (mant <= 10'h049) begin
            mag_b7 = 0;
          end else begin
            mag_b7 = 1;
          end
        end else begin
          if (mant <= 10'h296) begin
            mag_b7 = 0;
          end else begin
            if (mant <= 10'h3fe) begin
              mag_b7 = 1;
            end else begin
              mag_b7 = 0;
            end
          end
        end
      end
      5'h1e: begin
        if (mant <= 10'h1b0) begin
          mag_b7 = 0;
        end else begin
          if (mant <= 10'h3cd) begin
            mag_b7 = 1;
          end else begin
            mag_b7 = 0;
          end
        end
      end
      default: mag_b7 = 1'b0;
    endcase
  end
  wire [14:0] active_mag = {mag_b14, mag_b13, mag_b12, mag_b11, mag_b10, mag_b9, mag_b8, mag_b7, out_low};
  wire [15:0] active_out = {sign, active_mag};
  assign out = active ? active_out : special_out;
endmodule
