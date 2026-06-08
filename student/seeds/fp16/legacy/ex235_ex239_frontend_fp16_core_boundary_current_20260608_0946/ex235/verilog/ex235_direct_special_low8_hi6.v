module ex235_direct_special_low8_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire active = (exp >= 5'd1) && (exp <= 5'd30) && !sign;
  wire [15:0] special_out = (exp == 5'd0) ? {sign, 5'h1f, 10'h000} :
                           ((!sign && exp == 5'h1f && mant == 10'h000) ? 16'h0000 : 16'h7e00);
  wire [1:0] cls = {1'b0, exp[0]};
  reg [7:0] out_low;
  always @* begin
    case (cls)
      2'h0: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha8;
            4'h1: out_low = 8'ha7;
            4'h2: out_low = 8'ha7;
            4'h3: out_low = 8'ha6;
            4'h4: out_low = 8'ha5;
            4'h5: out_low = 8'ha5;
            4'h6: out_low = 8'ha4;
            4'h7: out_low = 8'ha3;
            4'h8: out_low = 8'ha3;
            4'h9: out_low = 8'ha2;
            4'ha: out_low = 8'ha1;
            4'hb: out_low = 8'ha0;
            4'hc: out_low = 8'ha0;
            4'hd: out_low = 8'h9f;
            4'he: out_low = 8'h9e;
            4'hf: out_low = 8'h9e;
            default: out_low = 8'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9d;
            4'h1: out_low = 8'h9c;
            4'h2: out_low = 8'h9c;
            4'h3: out_low = 8'h9b;
            4'h4: out_low = 8'h9a;
            4'h5: out_low = 8'h9a;
            4'h6: out_low = 8'h99;
            4'h7: out_low = 8'h98;
            4'h8: out_low = 8'h97;
            4'h9: out_low = 8'h97;
            4'ha: out_low = 8'h96;
            4'hb: out_low = 8'h95;
            4'hc: out_low = 8'h95;
            4'hd: out_low = 8'h94;
            4'he: out_low = 8'h93;
            4'hf: out_low = 8'h93;
            default: out_low = 8'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 8'h92;
            4'h1: out_low = 8'h91;
            4'h2: out_low = 8'h91;
            4'h3: out_low = 8'h90;
            4'h4: out_low = 8'h8f;
            4'h5: out_low = 8'h8f;
            4'h6: out_low = 8'h8e;
            4'h7: out_low = 8'h8d;
            4'h8: out_low = 8'h8d;
            4'h9: out_low = 8'h8c;
            4'ha: out_low = 8'h8b;
            4'hb: out_low = 8'h8b;
            4'hc: out_low = 8'h8a;
            4'hd: out_low = 8'h89;
            4'he: out_low = 8'h89;
            4'hf: out_low = 8'h88;
            default: out_low = 8'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 8'h87;
            4'h1: out_low = 8'h87;
            4'h2: out_low = 8'h86;
            4'h3: out_low = 8'h85;
            4'h4: out_low = 8'h85;
            4'h5: out_low = 8'h84;
            4'h6: out_low = 8'h83;
            4'h7: out_low = 8'h83;
            4'h8: out_low = 8'h82;
            4'h9: out_low = 8'h81;
            4'ha: out_low = 8'h81;
            4'hb: out_low = 8'h80;
            4'hc: out_low = 8'h80;
            4'hd: out_low = 8'h7f;
            4'he: out_low = 8'h7e;
            4'hf: out_low = 8'h7e;
            default: out_low = 8'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7d;
            4'h1: out_low = 8'h7c;
            4'h2: out_low = 8'h7c;
            4'h3: out_low = 8'h7b;
            4'h4: out_low = 8'h7a;
            4'h5: out_low = 8'h7a;
            4'h6: out_low = 8'h79;
            4'h7: out_low = 8'h78;
            4'h8: out_low = 8'h78;
            4'h9: out_low = 8'h77;
            4'ha: out_low = 8'h77;
            4'hb: out_low = 8'h76;
            4'hc: out_low = 8'h75;
            4'hd: out_low = 8'h75;
            4'he: out_low = 8'h74;
            4'hf: out_low = 8'h73;
            default: out_low = 8'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 8'h73;
            4'h1: out_low = 8'h72;
            4'h2: out_low = 8'h71;
            4'h3: out_low = 8'h71;
            4'h4: out_low = 8'h70;
            4'h5: out_low = 8'h70;
            4'h6: out_low = 8'h6f;
            4'h7: out_low = 8'h6e;
            4'h8: out_low = 8'h6e;
            4'h9: out_low = 8'h6d;
            4'ha: out_low = 8'h6c;
            4'hb: out_low = 8'h6c;
            4'hc: out_low = 8'h6b;
            4'hd: out_low = 8'h6b;
            4'he: out_low = 8'h6a;
            4'hf: out_low = 8'h69;
            default: out_low = 8'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 8'h69;
            4'h1: out_low = 8'h68;
            4'h2: out_low = 8'h67;
            4'h3: out_low = 8'h67;
            4'h4: out_low = 8'h66;
            4'h5: out_low = 8'h66;
            4'h6: out_low = 8'h65;
            4'h7: out_low = 8'h64;
            4'h8: out_low = 8'h64;
            4'h9: out_low = 8'h63;
            4'ha: out_low = 8'h63;
            4'hb: out_low = 8'h62;
            4'hc: out_low = 8'h61;
            4'hd: out_low = 8'h61;
            4'he: out_low = 8'h60;
            4'hf: out_low = 8'h60;
            default: out_low = 8'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5f;
            4'h1: out_low = 8'h5e;
            4'h2: out_low = 8'h5e;
            4'h3: out_low = 8'h5d;
            4'h4: out_low = 8'h5d;
            4'h5: out_low = 8'h5c;
            4'h6: out_low = 8'h5b;
            4'h7: out_low = 8'h5b;
            4'h8: out_low = 8'h5a;
            4'h9: out_low = 8'h5a;
            4'ha: out_low = 8'h59;
            4'hb: out_low = 8'h58;
            4'hc: out_low = 8'h58;
            4'hd: out_low = 8'h57;
            4'he: out_low = 8'h57;
            4'hf: out_low = 8'h56;
            default: out_low = 8'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 8'h55;
            4'h1: out_low = 8'h55;
            4'h2: out_low = 8'h54;
            4'h3: out_low = 8'h54;
            4'h4: out_low = 8'h53;
            4'h5: out_low = 8'h52;
            4'h6: out_low = 8'h52;
            4'h7: out_low = 8'h51;
            4'h8: out_low = 8'h51;
            4'h9: out_low = 8'h50;
            4'ha: out_low = 8'h4f;
            4'hb: out_low = 8'h4f;
            4'hc: out_low = 8'h4e;
            4'hd: out_low = 8'h4e;
            4'he: out_low = 8'h4d;
            4'hf: out_low = 8'h4d;
            default: out_low = 8'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4c;
            4'h1: out_low = 8'h4b;
            4'h2: out_low = 8'h4b;
            4'h3: out_low = 8'h4a;
            4'h4: out_low = 8'h4a;
            4'h5: out_low = 8'h49;
            4'h6: out_low = 8'h48;
            4'h7: out_low = 8'h48;
            4'h8: out_low = 8'h47;
            4'h9: out_low = 8'h47;
            4'ha: out_low = 8'h46;
            4'hb: out_low = 8'h46;
            4'hc: out_low = 8'h45;
            4'hd: out_low = 8'h44;
            4'he: out_low = 8'h44;
            4'hf: out_low = 8'h43;
            default: out_low = 8'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h43;
            4'h1: out_low = 8'h42;
            4'h2: out_low = 8'h42;
            4'h3: out_low = 8'h41;
            4'h4: out_low = 8'h40;
            4'h5: out_low = 8'h40;
            4'h6: out_low = 8'h3f;
            4'h7: out_low = 8'h3f;
            4'h8: out_low = 8'h3e;
            4'h9: out_low = 8'h3e;
            4'ha: out_low = 8'h3d;
            4'hb: out_low = 8'h3d;
            4'hc: out_low = 8'h3c;
            4'hd: out_low = 8'h3b;
            4'he: out_low = 8'h3b;
            4'hf: out_low = 8'h3a;
            default: out_low = 8'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3a;
            4'h1: out_low = 8'h39;
            4'h2: out_low = 8'h39;
            4'h3: out_low = 8'h38;
            4'h4: out_low = 8'h38;
            4'h5: out_low = 8'h37;
            4'h6: out_low = 8'h36;
            4'h7: out_low = 8'h36;
            4'h8: out_low = 8'h35;
            4'h9: out_low = 8'h35;
            4'ha: out_low = 8'h34;
            4'hb: out_low = 8'h34;
            4'hc: out_low = 8'h33;
            4'hd: out_low = 8'h33;
            4'he: out_low = 8'h32;
            4'hf: out_low = 8'h31;
            default: out_low = 8'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h31;
            4'h1: out_low = 8'h30;
            4'h2: out_low = 8'h30;
            4'h3: out_low = 8'h2f;
            4'h4: out_low = 8'h2f;
            4'h5: out_low = 8'h2e;
            4'h6: out_low = 8'h2e;
            4'h7: out_low = 8'h2d;
            4'h8: out_low = 8'h2d;
            4'h9: out_low = 8'h2c;
            4'ha: out_low = 8'h2b;
            4'hb: out_low = 8'h2b;
            4'hc: out_low = 8'h2a;
            4'hd: out_low = 8'h2a;
            4'he: out_low = 8'h29;
            4'hf: out_low = 8'h29;
            default: out_low = 8'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h28;
            4'h1: out_low = 8'h28;
            4'h2: out_low = 8'h27;
            4'h3: out_low = 8'h27;
            4'h4: out_low = 8'h26;
            4'h5: out_low = 8'h26;
            4'h6: out_low = 8'h25;
            4'h7: out_low = 8'h25;
            4'h8: out_low = 8'h24;
            4'h9: out_low = 8'h23;
            4'ha: out_low = 8'h23;
            4'hb: out_low = 8'h22;
            4'hc: out_low = 8'h22;
            4'hd: out_low = 8'h21;
            4'he: out_low = 8'h21;
            4'hf: out_low = 8'h20;
            default: out_low = 8'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h20;
            4'h1: out_low = 8'h1f;
            4'h2: out_low = 8'h1f;
            4'h3: out_low = 8'h1e;
            4'h4: out_low = 8'h1e;
            4'h5: out_low = 8'h1d;
            4'h6: out_low = 8'h1d;
            4'h7: out_low = 8'h1c;
            4'h8: out_low = 8'h1c;
            4'h9: out_low = 8'h1b;
            4'ha: out_low = 8'h1b;
            4'hb: out_low = 8'h1a;
            4'hc: out_low = 8'h1a;
            4'hd: out_low = 8'h19;
            4'he: out_low = 8'h18;
            4'hf: out_low = 8'h18;
            default: out_low = 8'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h17;
            4'h1: out_low = 8'h17;
            4'h2: out_low = 8'h16;
            4'h3: out_low = 8'h16;
            4'h4: out_low = 8'h15;
            4'h5: out_low = 8'h15;
            4'h6: out_low = 8'h14;
            4'h7: out_low = 8'h14;
            4'h8: out_low = 8'h13;
            4'h9: out_low = 8'h13;
            4'ha: out_low = 8'h12;
            4'hb: out_low = 8'h12;
            4'hc: out_low = 8'h11;
            4'hd: out_low = 8'h11;
            4'he: out_low = 8'h10;
            4'hf: out_low = 8'h10;
            default: out_low = 8'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0f;
            4'h1: out_low = 8'h0f;
            4'h2: out_low = 8'h0e;
            4'h3: out_low = 8'h0e;
            4'h4: out_low = 8'h0d;
            4'h5: out_low = 8'h0d;
            4'h6: out_low = 8'h0c;
            4'h7: out_low = 8'h0c;
            4'h8: out_low = 8'h0b;
            4'h9: out_low = 8'h0b;
            4'ha: out_low = 8'h0a;
            4'hb: out_low = 8'h0a;
            4'hc: out_low = 8'h09;
            4'hd: out_low = 8'h09;
            4'he: out_low = 8'h08;
            4'hf: out_low = 8'h08;
            default: out_low = 8'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 8'h07;
            4'h1: out_low = 8'h07;
            4'h2: out_low = 8'h06;
            4'h3: out_low = 8'h06;
            4'h4: out_low = 8'h05;
            4'h5: out_low = 8'h05;
            4'h6: out_low = 8'h04;
            4'h7: out_low = 8'h04;
            4'h8: out_low = 8'h03;
            4'h9: out_low = 8'h03;
            4'ha: out_low = 8'h02;
            4'hb: out_low = 8'h02;
            4'hc: out_low = 8'h01;
            4'hd: out_low = 8'h01;
            4'he: out_low = 8'h00;
            4'hf: out_low = 8'h00;
            default: out_low = 8'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 8'hff;
            4'h1: out_low = 8'hff;
            4'h2: out_low = 8'hfe;
            4'h3: out_low = 8'hfe;
            4'h4: out_low = 8'hfd;
            4'h5: out_low = 8'hfd;
            4'h6: out_low = 8'hfc;
            4'h7: out_low = 8'hfc;
            4'h8: out_low = 8'hfb;
            4'h9: out_low = 8'hfb;
            4'ha: out_low = 8'hfb;
            4'hb: out_low = 8'hfa;
            4'hc: out_low = 8'hfa;
            4'hd: out_low = 8'hf9;
            4'he: out_low = 8'hf9;
            4'hf: out_low = 8'hf8;
            default: out_low = 8'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf8;
            4'h1: out_low = 8'hf7;
            4'h2: out_low = 8'hf7;
            4'h3: out_low = 8'hf6;
            4'h4: out_low = 8'hf6;
            4'h5: out_low = 8'hf5;
            4'h6: out_low = 8'hf5;
            4'h7: out_low = 8'hf4;
            4'h8: out_low = 8'hf4;
            4'h9: out_low = 8'hf3;
            4'ha: out_low = 8'hf3;
            4'hb: out_low = 8'hf2;
            4'hc: out_low = 8'hf2;
            4'hd: out_low = 8'hf1;
            4'he: out_low = 8'hf1;
            4'hf: out_low = 8'hf1;
            default: out_low = 8'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf0;
            4'h1: out_low = 8'hf0;
            4'h2: out_low = 8'hef;
            4'h3: out_low = 8'hef;
            4'h4: out_low = 8'hee;
            4'h5: out_low = 8'hee;
            4'h6: out_low = 8'hed;
            4'h7: out_low = 8'hed;
            4'h8: out_low = 8'hec;
            4'h9: out_low = 8'hec;
            4'ha: out_low = 8'heb;
            4'hb: out_low = 8'heb;
            4'hc: out_low = 8'hea;
            4'hd: out_low = 8'hea;
            4'he: out_low = 8'hea;
            4'hf: out_low = 8'he9;
            default: out_low = 8'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 8'he9;
            4'h1: out_low = 8'he8;
            4'h2: out_low = 8'he8;
            4'h3: out_low = 8'he7;
            4'h4: out_low = 8'he7;
            4'h5: out_low = 8'he6;
            4'h6: out_low = 8'he6;
            4'h7: out_low = 8'he5;
            4'h8: out_low = 8'he5;
            4'h9: out_low = 8'he4;
            4'ha: out_low = 8'he4;
            4'hb: out_low = 8'he4;
            4'hc: out_low = 8'he3;
            4'hd: out_low = 8'he3;
            4'he: out_low = 8'he2;
            4'hf: out_low = 8'he2;
            default: out_low = 8'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 8'he1;
            4'h1: out_low = 8'he1;
            4'h2: out_low = 8'he0;
            4'h3: out_low = 8'he0;
            4'h4: out_low = 8'hdf;
            4'h5: out_low = 8'hdf;
            4'h6: out_low = 8'hdf;
            4'h7: out_low = 8'hde;
            4'h8: out_low = 8'hde;
            4'h9: out_low = 8'hdd;
            4'ha: out_low = 8'hdd;
            4'hb: out_low = 8'hdc;
            4'hc: out_low = 8'hdc;
            4'hd: out_low = 8'hdb;
            4'he: out_low = 8'hdb;
            4'hf: out_low = 8'hdb;
            default: out_low = 8'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 8'hda;
            4'h1: out_low = 8'hda;
            4'h2: out_low = 8'hd9;
            4'h3: out_low = 8'hd9;
            4'h4: out_low = 8'hd8;
            4'h5: out_low = 8'hd8;
            4'h6: out_low = 8'hd7;
            4'h7: out_low = 8'hd7;
            4'h8: out_low = 8'hd7;
            4'h9: out_low = 8'hd6;
            4'ha: out_low = 8'hd6;
            4'hb: out_low = 8'hd5;
            4'hc: out_low = 8'hd5;
            4'hd: out_low = 8'hd4;
            4'he: out_low = 8'hd4;
            4'hf: out_low = 8'hd3;
            default: out_low = 8'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd3;
            4'h1: out_low = 8'hd3;
            4'h2: out_low = 8'hd2;
            4'h3: out_low = 8'hd2;
            4'h4: out_low = 8'hd1;
            4'h5: out_low = 8'hd1;
            4'h6: out_low = 8'hd0;
            4'h7: out_low = 8'hd0;
            4'h8: out_low = 8'hcf;
            4'h9: out_low = 8'hcf;
            4'ha: out_low = 8'hcf;
            4'hb: out_low = 8'hce;
            4'hc: out_low = 8'hce;
            4'hd: out_low = 8'hcd;
            4'he: out_low = 8'hcd;
            4'hf: out_low = 8'hcc;
            default: out_low = 8'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 8'hcc;
            4'h1: out_low = 8'hcc;
            4'h2: out_low = 8'hcb;
            4'h3: out_low = 8'hcb;
            4'h4: out_low = 8'hca;
            4'h5: out_low = 8'hca;
            4'h6: out_low = 8'hc9;
            4'h7: out_low = 8'hc9;
            4'h8: out_low = 8'hc9;
            4'h9: out_low = 8'hc8;
            4'ha: out_low = 8'hc8;
            4'hb: out_low = 8'hc7;
            4'hc: out_low = 8'hc7;
            4'hd: out_low = 8'hc6;
            4'he: out_low = 8'hc6;
            4'hf: out_low = 8'hc6;
            default: out_low = 8'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc5;
            4'h1: out_low = 8'hc5;
            4'h2: out_low = 8'hc4;
            4'h3: out_low = 8'hc4;
            4'h4: out_low = 8'hc3;
            4'h5: out_low = 8'hc3;
            4'h6: out_low = 8'hc3;
            4'h7: out_low = 8'hc2;
            4'h8: out_low = 8'hc2;
            4'h9: out_low = 8'hc1;
            4'ha: out_low = 8'hc1;
            4'hb: out_low = 8'hc1;
            4'hc: out_low = 8'hc0;
            4'hd: out_low = 8'hc0;
            4'he: out_low = 8'hbf;
            4'hf: out_low = 8'hbf;
            default: out_low = 8'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 8'hbe;
            4'h1: out_low = 8'hbe;
            4'h2: out_low = 8'hbe;
            4'h3: out_low = 8'hbd;
            4'h4: out_low = 8'hbd;
            4'h5: out_low = 8'hbc;
            4'h6: out_low = 8'hbc;
            4'h7: out_low = 8'hbc;
            4'h8: out_low = 8'hbb;
            4'h9: out_low = 8'hbb;
            4'ha: out_low = 8'hba;
            4'hb: out_low = 8'hba;
            4'hc: out_low = 8'hb9;
            4'hd: out_low = 8'hb9;
            4'he: out_low = 8'hb9;
            4'hf: out_low = 8'hb8;
            default: out_low = 8'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb8;
            4'h1: out_low = 8'hb7;
            4'h2: out_low = 8'hb7;
            4'h3: out_low = 8'hb7;
            4'h4: out_low = 8'hb6;
            4'h5: out_low = 8'hb6;
            4'h6: out_low = 8'hb5;
            4'h7: out_low = 8'hb5;
            4'h8: out_low = 8'hb5;
            4'h9: out_low = 8'hb4;
            4'ha: out_low = 8'hb4;
            4'hb: out_low = 8'hb3;
            4'hc: out_low = 8'hb3;
            4'hd: out_low = 8'hb3;
            4'he: out_low = 8'hb2;
            4'hf: out_low = 8'hb2;
            default: out_low = 8'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb1;
            4'h1: out_low = 8'hb1;
            4'h2: out_low = 8'hb1;
            4'h3: out_low = 8'hb0;
            4'h4: out_low = 8'hb0;
            4'h5: out_low = 8'haf;
            4'h6: out_low = 8'haf;
            4'h7: out_low = 8'haf;
            4'h8: out_low = 8'hae;
            4'h9: out_low = 8'hae;
            4'ha: out_low = 8'had;
            4'hb: out_low = 8'had;
            4'hc: out_low = 8'had;
            4'hd: out_low = 8'hac;
            4'he: out_low = 8'hac;
            4'hf: out_low = 8'hab;
            default: out_low = 8'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 8'hab;
            4'h1: out_low = 8'hab;
            4'h2: out_low = 8'haa;
            4'h3: out_low = 8'haa;
            4'h4: out_low = 8'ha9;
            4'h5: out_low = 8'ha9;
            4'h6: out_low = 8'ha9;
            4'h7: out_low = 8'ha8;
            4'h8: out_low = 8'ha8;
            4'h9: out_low = 8'ha7;
            4'ha: out_low = 8'ha7;
            4'hb: out_low = 8'ha7;
            4'hc: out_low = 8'ha6;
            4'hd: out_low = 8'ha6;
            4'he: out_low = 8'ha5;
            4'hf: out_low = 8'ha5;
            default: out_low = 8'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha5;
            4'h1: out_low = 8'ha4;
            4'h2: out_low = 8'ha4;
            4'h3: out_low = 8'ha3;
            4'h4: out_low = 8'ha3;
            4'h5: out_low = 8'ha3;
            4'h6: out_low = 8'ha2;
            4'h7: out_low = 8'ha2;
            4'h8: out_low = 8'ha2;
            4'h9: out_low = 8'ha1;
            4'ha: out_low = 8'ha1;
            4'hb: out_low = 8'ha0;
            4'hc: out_low = 8'ha0;
            4'hd: out_low = 8'ha0;
            4'he: out_low = 8'h9f;
            4'hf: out_low = 8'h9f;
            default: out_low = 8'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9e;
            4'h1: out_low = 8'h9e;
            4'h2: out_low = 8'h9e;
            4'h3: out_low = 8'h9d;
            4'h4: out_low = 8'h9d;
            4'h5: out_low = 8'h9c;
            4'h6: out_low = 8'h9c;
            4'h7: out_low = 8'h9c;
            4'h8: out_low = 8'h9b;
            4'h9: out_low = 8'h9b;
            4'ha: out_low = 8'h9b;
            4'hb: out_low = 8'h9a;
            4'hc: out_low = 8'h9a;
            4'hd: out_low = 8'h99;
            4'he: out_low = 8'h99;
            4'hf: out_low = 8'h99;
            default: out_low = 8'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 8'h98;
            4'h1: out_low = 8'h98;
            4'h2: out_low = 8'h98;
            4'h3: out_low = 8'h97;
            4'h4: out_low = 8'h97;
            4'h5: out_low = 8'h96;
            4'h6: out_low = 8'h96;
            4'h7: out_low = 8'h96;
            4'h8: out_low = 8'h95;
            4'h9: out_low = 8'h95;
            4'ha: out_low = 8'h95;
            4'hb: out_low = 8'h94;
            4'hc: out_low = 8'h94;
            4'hd: out_low = 8'h93;
            4'he: out_low = 8'h93;
            4'hf: out_low = 8'h93;
            default: out_low = 8'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 8'h92;
            4'h1: out_low = 8'h92;
            4'h2: out_low = 8'h92;
            4'h3: out_low = 8'h91;
            4'h4: out_low = 8'h91;
            4'h5: out_low = 8'h90;
            4'h6: out_low = 8'h90;
            4'h7: out_low = 8'h90;
            4'h8: out_low = 8'h8f;
            4'h9: out_low = 8'h8f;
            4'ha: out_low = 8'h8f;
            4'hb: out_low = 8'h8e;
            4'hc: out_low = 8'h8e;
            4'hd: out_low = 8'h8d;
            4'he: out_low = 8'h8d;
            4'hf: out_low = 8'h8d;
            default: out_low = 8'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 8'h8c;
            4'h1: out_low = 8'h8c;
            4'h2: out_low = 8'h8c;
            4'h3: out_low = 8'h8b;
            4'h4: out_low = 8'h8b;
            4'h5: out_low = 8'h8b;
            4'h6: out_low = 8'h8a;
            4'h7: out_low = 8'h8a;
            4'h8: out_low = 8'h89;
            4'h9: out_low = 8'h89;
            4'ha: out_low = 8'h89;
            4'hb: out_low = 8'h88;
            4'hc: out_low = 8'h88;
            4'hd: out_low = 8'h88;
            4'he: out_low = 8'h87;
            4'hf: out_low = 8'h87;
            default: out_low = 8'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 8'h87;
            4'h1: out_low = 8'h86;
            4'h2: out_low = 8'h86;
            4'h3: out_low = 8'h85;
            4'h4: out_low = 8'h85;
            4'h5: out_low = 8'h85;
            4'h6: out_low = 8'h84;
            4'h7: out_low = 8'h84;
            4'h8: out_low = 8'h84;
            4'h9: out_low = 8'h83;
            4'ha: out_low = 8'h83;
            4'hb: out_low = 8'h83;
            4'hc: out_low = 8'h82;
            4'hd: out_low = 8'h82;
            4'he: out_low = 8'h81;
            4'hf: out_low = 8'h81;
            default: out_low = 8'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 8'h81;
            4'h1: out_low = 8'h80;
            4'h2: out_low = 8'h80;
            4'h3: out_low = 8'h80;
            4'h4: out_low = 8'h7f;
            4'h5: out_low = 8'h7f;
            4'h6: out_low = 8'h7f;
            4'h7: out_low = 8'h7e;
            4'h8: out_low = 8'h7e;
            4'h9: out_low = 8'h7e;
            4'ha: out_low = 8'h7d;
            4'hb: out_low = 8'h7d;
            4'hc: out_low = 8'h7d;
            4'hd: out_low = 8'h7c;
            4'he: out_low = 8'h7c;
            4'hf: out_low = 8'h7b;
            default: out_low = 8'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7b;
            4'h1: out_low = 8'h7b;
            4'h2: out_low = 8'h7a;
            4'h3: out_low = 8'h7a;
            4'h4: out_low = 8'h7a;
            4'h5: out_low = 8'h79;
            4'h6: out_low = 8'h79;
            4'h7: out_low = 8'h79;
            4'h8: out_low = 8'h78;
            4'h9: out_low = 8'h78;
            4'ha: out_low = 8'h78;
            4'hb: out_low = 8'h77;
            4'hc: out_low = 8'h77;
            4'hd: out_low = 8'h77;
            4'he: out_low = 8'h76;
            4'hf: out_low = 8'h76;
            default: out_low = 8'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 8'h76;
            4'h1: out_low = 8'h75;
            4'h2: out_low = 8'h75;
            4'h3: out_low = 8'h74;
            4'h4: out_low = 8'h74;
            4'h5: out_low = 8'h74;
            4'h6: out_low = 8'h73;
            4'h7: out_low = 8'h73;
            4'h8: out_low = 8'h73;
            4'h9: out_low = 8'h72;
            4'ha: out_low = 8'h72;
            4'hb: out_low = 8'h72;
            4'hc: out_low = 8'h71;
            4'hd: out_low = 8'h71;
            4'he: out_low = 8'h71;
            4'hf: out_low = 8'h70;
            default: out_low = 8'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 8'h70;
            4'h1: out_low = 8'h70;
            4'h2: out_low = 8'h6f;
            4'h3: out_low = 8'h6f;
            4'h4: out_low = 8'h6f;
            4'h5: out_low = 8'h6e;
            4'h6: out_low = 8'h6e;
            4'h7: out_low = 8'h6e;
            4'h8: out_low = 8'h6d;
            4'h9: out_low = 8'h6d;
            4'ha: out_low = 8'h6d;
            4'hb: out_low = 8'h6c;
            4'hc: out_low = 8'h6c;
            4'hd: out_low = 8'h6c;
            4'he: out_low = 8'h6b;
            4'hf: out_low = 8'h6b;
            default: out_low = 8'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6b;
            4'h1: out_low = 8'h6a;
            4'h2: out_low = 8'h6a;
            4'h3: out_low = 8'h6a;
            4'h4: out_low = 8'h69;
            4'h5: out_low = 8'h69;
            4'h6: out_low = 8'h69;
            4'h7: out_low = 8'h68;
            4'h8: out_low = 8'h68;
            4'h9: out_low = 8'h68;
            4'ha: out_low = 8'h67;
            4'hb: out_low = 8'h67;
            4'hc: out_low = 8'h67;
            4'hd: out_low = 8'h66;
            4'he: out_low = 8'h66;
            4'hf: out_low = 8'h66;
            default: out_low = 8'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h65;
            4'h1: out_low = 8'h65;
            4'h2: out_low = 8'h65;
            4'h3: out_low = 8'h64;
            4'h4: out_low = 8'h64;
            4'h5: out_low = 8'h64;
            4'h6: out_low = 8'h63;
            4'h7: out_low = 8'h63;
            4'h8: out_low = 8'h63;
            4'h9: out_low = 8'h62;
            4'ha: out_low = 8'h62;
            4'hb: out_low = 8'h62;
            4'hc: out_low = 8'h61;
            4'hd: out_low = 8'h61;
            4'he: out_low = 8'h61;
            4'hf: out_low = 8'h60;
            default: out_low = 8'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h60;
            4'h1: out_low = 8'h60;
            4'h2: out_low = 8'h5f;
            4'h3: out_low = 8'h5f;
            4'h4: out_low = 8'h5f;
            4'h5: out_low = 8'h5e;
            4'h6: out_low = 8'h5e;
            4'h7: out_low = 8'h5e;
            4'h8: out_low = 8'h5d;
            4'h9: out_low = 8'h5d;
            4'ha: out_low = 8'h5d;
            4'hb: out_low = 8'h5c;
            4'hc: out_low = 8'h5c;
            4'hd: out_low = 8'h5c;
            4'he: out_low = 8'h5b;
            4'hf: out_low = 8'h5b;
            default: out_low = 8'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5b;
            4'h1: out_low = 8'h5a;
            4'h2: out_low = 8'h5a;
            4'h3: out_low = 8'h5a;
            4'h4: out_low = 8'h5a;
            4'h5: out_low = 8'h59;
            4'h6: out_low = 8'h59;
            4'h7: out_low = 8'h59;
            4'h8: out_low = 8'h58;
            4'h9: out_low = 8'h58;
            4'ha: out_low = 8'h58;
            4'hb: out_low = 8'h57;
            4'hc: out_low = 8'h57;
            4'hd: out_low = 8'h57;
            4'he: out_low = 8'h56;
            4'hf: out_low = 8'h56;
            default: out_low = 8'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h56;
            4'h1: out_low = 8'h55;
            4'h2: out_low = 8'h55;
            4'h3: out_low = 8'h55;
            4'h4: out_low = 8'h54;
            4'h5: out_low = 8'h54;
            4'h6: out_low = 8'h54;
            4'h7: out_low = 8'h53;
            4'h8: out_low = 8'h53;
            4'h9: out_low = 8'h53;
            4'ha: out_low = 8'h52;
            4'hb: out_low = 8'h52;
            4'hc: out_low = 8'h52;
            4'hd: out_low = 8'h52;
            4'he: out_low = 8'h51;
            4'hf: out_low = 8'h51;
            default: out_low = 8'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h51;
            4'h1: out_low = 8'h50;
            4'h2: out_low = 8'h50;
            4'h3: out_low = 8'h50;
            4'h4: out_low = 8'h4f;
            4'h5: out_low = 8'h4f;
            4'h6: out_low = 8'h4f;
            4'h7: out_low = 8'h4e;
            4'h8: out_low = 8'h4e;
            4'h9: out_low = 8'h4e;
            4'ha: out_low = 8'h4d;
            4'hb: out_low = 8'h4d;
            4'hc: out_low = 8'h4d;
            4'hd: out_low = 8'h4d;
            4'he: out_low = 8'h4c;
            4'hf: out_low = 8'h4c;
            default: out_low = 8'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4c;
            4'h1: out_low = 8'h4b;
            4'h2: out_low = 8'h4b;
            4'h3: out_low = 8'h4b;
            4'h4: out_low = 8'h4a;
            4'h5: out_low = 8'h4a;
            4'h6: out_low = 8'h4a;
            4'h7: out_low = 8'h49;
            4'h8: out_low = 8'h49;
            4'h9: out_low = 8'h49;
            4'ha: out_low = 8'h49;
            4'hb: out_low = 8'h48;
            4'hc: out_low = 8'h48;
            4'hd: out_low = 8'h48;
            4'he: out_low = 8'h47;
            4'hf: out_low = 8'h47;
            default: out_low = 8'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 8'h47;
            4'h1: out_low = 8'h46;
            4'h2: out_low = 8'h46;
            4'h3: out_low = 8'h46;
            4'h4: out_low = 8'h45;
            4'h5: out_low = 8'h45;
            4'h6: out_low = 8'h45;
            4'h7: out_low = 8'h45;
            4'h8: out_low = 8'h44;
            4'h9: out_low = 8'h44;
            4'ha: out_low = 8'h44;
            4'hb: out_low = 8'h43;
            4'hc: out_low = 8'h43;
            4'hd: out_low = 8'h43;
            4'he: out_low = 8'h42;
            4'hf: out_low = 8'h42;
            default: out_low = 8'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 8'h42;
            4'h1: out_low = 8'h42;
            4'h2: out_low = 8'h41;
            4'h3: out_low = 8'h41;
            4'h4: out_low = 8'h41;
            4'h5: out_low = 8'h40;
            4'h6: out_low = 8'h40;
            4'h7: out_low = 8'h40;
            4'h8: out_low = 8'h3f;
            4'h9: out_low = 8'h3f;
            4'ha: out_low = 8'h3f;
            4'hb: out_low = 8'h3f;
            4'hc: out_low = 8'h3e;
            4'hd: out_low = 8'h3e;
            4'he: out_low = 8'h3e;
            4'hf: out_low = 8'h3d;
            default: out_low = 8'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3d;
            4'h1: out_low = 8'h3d;
            4'h2: out_low = 8'h3c;
            4'h3: out_low = 8'h3c;
            4'h4: out_low = 8'h3c;
            4'h5: out_low = 8'h3c;
            4'h6: out_low = 8'h3b;
            4'h7: out_low = 8'h3b;
            4'h8: out_low = 8'h3b;
            4'h9: out_low = 8'h3a;
            4'ha: out_low = 8'h3a;
            4'hb: out_low = 8'h3a;
            4'hc: out_low = 8'h3a;
            4'hd: out_low = 8'h39;
            4'he: out_low = 8'h39;
            4'hf: out_low = 8'h39;
            default: out_low = 8'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 8'h38;
            4'h1: out_low = 8'h38;
            4'h2: out_low = 8'h38;
            4'h3: out_low = 8'h37;
            4'h4: out_low = 8'h37;
            4'h5: out_low = 8'h37;
            4'h6: out_low = 8'h37;
            4'h7: out_low = 8'h36;
            4'h8: out_low = 8'h36;
            4'h9: out_low = 8'h36;
            4'ha: out_low = 8'h35;
            4'hb: out_low = 8'h35;
            4'hc: out_low = 8'h35;
            4'hd: out_low = 8'h35;
            4'he: out_low = 8'h34;
            4'hf: out_low = 8'h34;
            default: out_low = 8'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 8'h34;
            4'h1: out_low = 8'h33;
            4'h2: out_low = 8'h33;
            4'h3: out_low = 8'h33;
            4'h4: out_low = 8'h33;
            4'h5: out_low = 8'h32;
            4'h6: out_low = 8'h32;
            4'h7: out_low = 8'h32;
            4'h8: out_low = 8'h31;
            4'h9: out_low = 8'h31;
            4'ha: out_low = 8'h31;
            4'hb: out_low = 8'h30;
            4'hc: out_low = 8'h30;
            4'hd: out_low = 8'h30;
            4'he: out_low = 8'h30;
            4'hf: out_low = 8'h2f;
            default: out_low = 8'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2f;
            4'h1: out_low = 8'h2f;
            4'h2: out_low = 8'h2e;
            4'h3: out_low = 8'h2e;
            4'h4: out_low = 8'h2e;
            4'h5: out_low = 8'h2e;
            4'h6: out_low = 8'h2d;
            4'h7: out_low = 8'h2d;
            4'h8: out_low = 8'h2d;
            4'h9: out_low = 8'h2c;
            4'ha: out_low = 8'h2c;
            4'hb: out_low = 8'h2c;
            4'hc: out_low = 8'h2c;
            4'hd: out_low = 8'h2b;
            4'he: out_low = 8'h2b;
            4'hf: out_low = 8'h2b;
            default: out_low = 8'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2b;
            4'h1: out_low = 8'h2a;
            4'h2: out_low = 8'h2a;
            4'h3: out_low = 8'h2a;
            4'h4: out_low = 8'h29;
            4'h5: out_low = 8'h29;
            4'h6: out_low = 8'h29;
            4'h7: out_low = 8'h29;
            4'h8: out_low = 8'h28;
            4'h9: out_low = 8'h28;
            4'ha: out_low = 8'h28;
            4'hb: out_low = 8'h27;
            4'hc: out_low = 8'h27;
            4'hd: out_low = 8'h27;
            4'he: out_low = 8'h27;
            4'hf: out_low = 8'h26;
            default: out_low = 8'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 8'h26;
            4'h1: out_low = 8'h26;
            4'h2: out_low = 8'h25;
            4'h3: out_low = 8'h25;
            4'h4: out_low = 8'h25;
            4'h5: out_low = 8'h25;
            4'h6: out_low = 8'h24;
            4'h7: out_low = 8'h24;
            4'h8: out_low = 8'h24;
            4'h9: out_low = 8'h24;
            4'ha: out_low = 8'h23;
            4'hb: out_low = 8'h23;
            4'hc: out_low = 8'h23;
            4'hd: out_low = 8'h22;
            4'he: out_low = 8'h22;
            4'hf: out_low = 8'h22;
            default: out_low = 8'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 8'h22;
            4'h1: out_low = 8'h21;
            4'h2: out_low = 8'h21;
            4'h3: out_low = 8'h21;
            4'h4: out_low = 8'h20;
            4'h5: out_low = 8'h20;
            4'h6: out_low = 8'h20;
            4'h7: out_low = 8'h20;
            4'h8: out_low = 8'h1f;
            4'h9: out_low = 8'h1f;
            4'ha: out_low = 8'h1f;
            4'hb: out_low = 8'h1f;
            4'hc: out_low = 8'h1e;
            4'hd: out_low = 8'h1e;
            4'he: out_low = 8'h1e;
            4'hf: out_low = 8'h1d;
            default: out_low = 8'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1d;
            4'h1: out_low = 8'h1d;
            4'h2: out_low = 8'h1d;
            4'h3: out_low = 8'h1c;
            4'h4: out_low = 8'h1c;
            4'h5: out_low = 8'h1c;
            4'h6: out_low = 8'h1c;
            4'h7: out_low = 8'h1b;
            4'h8: out_low = 8'h1b;
            4'h9: out_low = 8'h1b;
            4'ha: out_low = 8'h1a;
            4'hb: out_low = 8'h1a;
            4'hc: out_low = 8'h1a;
            4'hd: out_low = 8'h1a;
            4'he: out_low = 8'h19;
            4'hf: out_low = 8'h19;
            default: out_low = 8'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h19;
            4'h1: out_low = 8'h19;
            4'h2: out_low = 8'h18;
            4'h3: out_low = 8'h18;
            4'h4: out_low = 8'h18;
            4'h5: out_low = 8'h18;
            4'h6: out_low = 8'h17;
            4'h7: out_low = 8'h17;
            4'h8: out_low = 8'h17;
            4'h9: out_low = 8'h16;
            4'ha: out_low = 8'h16;
            4'hb: out_low = 8'h16;
            4'hc: out_low = 8'h16;
            4'hd: out_low = 8'h15;
            4'he: out_low = 8'h15;
            4'hf: out_low = 8'h15;
            default: out_low = 8'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h15;
            4'h1: out_low = 8'h14;
            4'h2: out_low = 8'h14;
            4'h3: out_low = 8'h14;
            4'h4: out_low = 8'h14;
            4'h5: out_low = 8'h13;
            4'h6: out_low = 8'h13;
            4'h7: out_low = 8'h13;
            4'h8: out_low = 8'h12;
            4'h9: out_low = 8'h12;
            4'ha: out_low = 8'h12;
            4'hb: out_low = 8'h12;
            4'hc: out_low = 8'h11;
            4'hd: out_low = 8'h11;
            4'he: out_low = 8'h11;
            4'hf: out_low = 8'h11;
            default: out_low = 8'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h10;
            4'h1: out_low = 8'h10;
            4'h2: out_low = 8'h10;
            4'h3: out_low = 8'h10;
            4'h4: out_low = 8'h0f;
            4'h5: out_low = 8'h0f;
            4'h6: out_low = 8'h0f;
            4'h7: out_low = 8'h0f;
            4'h8: out_low = 8'h0e;
            4'h9: out_low = 8'h0e;
            4'ha: out_low = 8'h0e;
            4'hb: out_low = 8'h0e;
            4'hc: out_low = 8'h0d;
            4'hd: out_low = 8'h0d;
            4'he: out_low = 8'h0d;
            4'hf: out_low = 8'h0c;
            default: out_low = 8'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0c;
            4'h1: out_low = 8'h0c;
            4'h2: out_low = 8'h0c;
            4'h3: out_low = 8'h0b;
            4'h4: out_low = 8'h0b;
            4'h5: out_low = 8'h0b;
            4'h6: out_low = 8'h0b;
            4'h7: out_low = 8'h0a;
            4'h8: out_low = 8'h0a;
            4'h9: out_low = 8'h0a;
            4'ha: out_low = 8'h0a;
            4'hb: out_low = 8'h09;
            4'hc: out_low = 8'h09;
            4'hd: out_low = 8'h09;
            4'he: out_low = 8'h09;
            4'hf: out_low = 8'h08;
            default: out_low = 8'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h08;
            4'h1: out_low = 8'h08;
            4'h2: out_low = 8'h08;
            4'h3: out_low = 8'h07;
            4'h4: out_low = 8'h07;
            4'h5: out_low = 8'h07;
            4'h6: out_low = 8'h07;
            4'h7: out_low = 8'h06;
            4'h8: out_low = 8'h06;
            4'h9: out_low = 8'h06;
            4'ha: out_low = 8'h06;
            4'hb: out_low = 8'h05;
            4'hc: out_low = 8'h05;
            4'hd: out_low = 8'h05;
            4'he: out_low = 8'h05;
            4'hf: out_low = 8'h04;
            default: out_low = 8'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h04;
            4'h1: out_low = 8'h04;
            4'h2: out_low = 8'h04;
            4'h3: out_low = 8'h03;
            4'h4: out_low = 8'h03;
            4'h5: out_low = 8'h03;
            4'h6: out_low = 8'h03;
            4'h7: out_low = 8'h02;
            4'h8: out_low = 8'h02;
            4'h9: out_low = 8'h02;
            4'ha: out_low = 8'h02;
            4'hb: out_low = 8'h01;
            4'hc: out_low = 8'h01;
            4'hd: out_low = 8'h01;
            4'he: out_low = 8'h01;
            4'hf: out_low = 8'h00;
            default: out_low = 8'h00;
          endcase
        end
        default: out_low = 8'h00;
      endcase
      end
      2'h1: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 8'h00;
            4'h1: out_low = 8'hff;
            4'h2: out_low = 8'hfe;
            4'h3: out_low = 8'hfd;
            4'h4: out_low = 8'hfc;
            4'h5: out_low = 8'hfb;
            4'h6: out_low = 8'hfa;
            4'h7: out_low = 8'hf9;
            4'h8: out_low = 8'hf8;
            4'h9: out_low = 8'hf7;
            4'ha: out_low = 8'hf6;
            4'hb: out_low = 8'hf5;
            4'hc: out_low = 8'hf4;
            4'hd: out_low = 8'hf3;
            4'he: out_low = 8'hf2;
            4'hf: out_low = 8'hf1;
            default: out_low = 8'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf0;
            4'h1: out_low = 8'hef;
            4'h2: out_low = 8'hee;
            4'h3: out_low = 8'hed;
            4'h4: out_low = 8'hec;
            4'h5: out_low = 8'heb;
            4'h6: out_low = 8'hea;
            4'h7: out_low = 8'he9;
            4'h8: out_low = 8'he8;
            4'h9: out_low = 8'he7;
            4'ha: out_low = 8'he6;
            4'hb: out_low = 8'he6;
            4'hc: out_low = 8'he5;
            4'hd: out_low = 8'he4;
            4'he: out_low = 8'he3;
            4'hf: out_low = 8'he2;
            default: out_low = 8'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 8'he1;
            4'h1: out_low = 8'he0;
            4'h2: out_low = 8'hdf;
            4'h3: out_low = 8'hde;
            4'h4: out_low = 8'hdd;
            4'h5: out_low = 8'hdc;
            4'h6: out_low = 8'hdb;
            4'h7: out_low = 8'hda;
            4'h8: out_low = 8'hd9;
            4'h9: out_low = 8'hd8;
            4'ha: out_low = 8'hd7;
            4'hb: out_low = 8'hd6;
            4'hc: out_low = 8'hd5;
            4'hd: out_low = 8'hd4;
            4'he: out_low = 8'hd3;
            4'hf: out_low = 8'hd3;
            default: out_low = 8'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd2;
            4'h1: out_low = 8'hd1;
            4'h2: out_low = 8'hd0;
            4'h3: out_low = 8'hcf;
            4'h4: out_low = 8'hce;
            4'h5: out_low = 8'hcd;
            4'h6: out_low = 8'hcc;
            4'h7: out_low = 8'hcb;
            4'h8: out_low = 8'hca;
            4'h9: out_low = 8'hc9;
            4'ha: out_low = 8'hc8;
            4'hb: out_low = 8'hc7;
            4'hc: out_low = 8'hc7;
            4'hd: out_low = 8'hc6;
            4'he: out_low = 8'hc5;
            4'hf: out_low = 8'hc4;
            default: out_low = 8'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc3;
            4'h1: out_low = 8'hc2;
            4'h2: out_low = 8'hc1;
            4'h3: out_low = 8'hc0;
            4'h4: out_low = 8'hbf;
            4'h5: out_low = 8'hbe;
            4'h6: out_low = 8'hbd;
            4'h7: out_low = 8'hbc;
            4'h8: out_low = 8'hbc;
            4'h9: out_low = 8'hbb;
            4'ha: out_low = 8'hba;
            4'hb: out_low = 8'hb9;
            4'hc: out_low = 8'hb8;
            4'hd: out_low = 8'hb7;
            4'he: out_low = 8'hb6;
            4'hf: out_low = 8'hb5;
            default: out_low = 8'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb4;
            4'h1: out_low = 8'hb4;
            4'h2: out_low = 8'hb3;
            4'h3: out_low = 8'hb2;
            4'h4: out_low = 8'hb1;
            4'h5: out_low = 8'hb0;
            4'h6: out_low = 8'haf;
            4'h7: out_low = 8'hae;
            4'h8: out_low = 8'had;
            4'h9: out_low = 8'hac;
            4'ha: out_low = 8'hac;
            4'hb: out_low = 8'hab;
            4'hc: out_low = 8'haa;
            4'hd: out_low = 8'ha9;
            4'he: out_low = 8'ha8;
            4'hf: out_low = 8'ha7;
            default: out_low = 8'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha6;
            4'h1: out_low = 8'ha5;
            4'h2: out_low = 8'ha5;
            4'h3: out_low = 8'ha4;
            4'h4: out_low = 8'ha3;
            4'h5: out_low = 8'ha2;
            4'h6: out_low = 8'ha1;
            4'h7: out_low = 8'ha0;
            4'h8: out_low = 8'h9f;
            4'h9: out_low = 8'h9e;
            4'ha: out_low = 8'h9e;
            4'hb: out_low = 8'h9d;
            4'hc: out_low = 8'h9c;
            4'hd: out_low = 8'h9b;
            4'he: out_low = 8'h9a;
            4'hf: out_low = 8'h99;
            default: out_low = 8'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 8'h98;
            4'h1: out_low = 8'h98;
            4'h2: out_low = 8'h97;
            4'h3: out_low = 8'h96;
            4'h4: out_low = 8'h95;
            4'h5: out_low = 8'h94;
            4'h6: out_low = 8'h93;
            4'h7: out_low = 8'h92;
            4'h8: out_low = 8'h92;
            4'h9: out_low = 8'h91;
            4'ha: out_low = 8'h90;
            4'hb: out_low = 8'h8f;
            4'hc: out_low = 8'h8e;
            4'hd: out_low = 8'h8d;
            4'he: out_low = 8'h8d;
            4'hf: out_low = 8'h8c;
            default: out_low = 8'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 8'h8b;
            4'h1: out_low = 8'h8a;
            4'h2: out_low = 8'h89;
            4'h3: out_low = 8'h88;
            4'h4: out_low = 8'h88;
            4'h5: out_low = 8'h87;
            4'h6: out_low = 8'h86;
            4'h7: out_low = 8'h85;
            4'h8: out_low = 8'h84;
            4'h9: out_low = 8'h83;
            4'ha: out_low = 8'h83;
            4'hb: out_low = 8'h82;
            4'hc: out_low = 8'h81;
            4'hd: out_low = 8'h80;
            4'he: out_low = 8'h7f;
            4'hf: out_low = 8'h7e;
            default: out_low = 8'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7e;
            4'h1: out_low = 8'h7d;
            4'h2: out_low = 8'h7c;
            4'h3: out_low = 8'h7b;
            4'h4: out_low = 8'h7a;
            4'h5: out_low = 8'h7a;
            4'h6: out_low = 8'h79;
            4'h7: out_low = 8'h78;
            4'h8: out_low = 8'h77;
            4'h9: out_low = 8'h76;
            4'ha: out_low = 8'h75;
            4'hb: out_low = 8'h75;
            4'hc: out_low = 8'h74;
            4'hd: out_low = 8'h73;
            4'he: out_low = 8'h72;
            4'hf: out_low = 8'h71;
            default: out_low = 8'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h71;
            4'h1: out_low = 8'h70;
            4'h2: out_low = 8'h6f;
            4'h3: out_low = 8'h6e;
            4'h4: out_low = 8'h6d;
            4'h5: out_low = 8'h6d;
            4'h6: out_low = 8'h6c;
            4'h7: out_low = 8'h6b;
            4'h8: out_low = 8'h6a;
            4'h9: out_low = 8'h69;
            4'ha: out_low = 8'h69;
            4'hb: out_low = 8'h68;
            4'hc: out_low = 8'h67;
            4'hd: out_low = 8'h66;
            4'he: out_low = 8'h65;
            4'hf: out_low = 8'h65;
            default: out_low = 8'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h64;
            4'h1: out_low = 8'h63;
            4'h2: out_low = 8'h62;
            4'h3: out_low = 8'h62;
            4'h4: out_low = 8'h61;
            4'h5: out_low = 8'h60;
            4'h6: out_low = 8'h5f;
            4'h7: out_low = 8'h5e;
            4'h8: out_low = 8'h5e;
            4'h9: out_low = 8'h5d;
            4'ha: out_low = 8'h5c;
            4'hb: out_low = 8'h5b;
            4'hc: out_low = 8'h5a;
            4'hd: out_low = 8'h5a;
            4'he: out_low = 8'h59;
            4'hf: out_low = 8'h58;
            default: out_low = 8'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h57;
            4'h1: out_low = 8'h57;
            4'h2: out_low = 8'h56;
            4'h3: out_low = 8'h55;
            4'h4: out_low = 8'h54;
            4'h5: out_low = 8'h54;
            4'h6: out_low = 8'h53;
            4'h7: out_low = 8'h52;
            4'h8: out_low = 8'h51;
            4'h9: out_low = 8'h50;
            4'ha: out_low = 8'h50;
            4'hb: out_low = 8'h4f;
            4'hc: out_low = 8'h4e;
            4'hd: out_low = 8'h4d;
            4'he: out_low = 8'h4d;
            4'hf: out_low = 8'h4c;
            default: out_low = 8'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4b;
            4'h1: out_low = 8'h4a;
            4'h2: out_low = 8'h4a;
            4'h3: out_low = 8'h49;
            4'h4: out_low = 8'h48;
            4'h5: out_low = 8'h47;
            4'h6: out_low = 8'h47;
            4'h7: out_low = 8'h46;
            4'h8: out_low = 8'h45;
            4'h9: out_low = 8'h44;
            4'ha: out_low = 8'h44;
            4'hb: out_low = 8'h43;
            4'hc: out_low = 8'h42;
            4'hd: out_low = 8'h41;
            4'he: out_low = 8'h41;
            4'hf: out_low = 8'h40;
            default: out_low = 8'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3f;
            4'h1: out_low = 8'h3e;
            4'h2: out_low = 8'h3e;
            4'h3: out_low = 8'h3d;
            4'h4: out_low = 8'h3c;
            4'h5: out_low = 8'h3b;
            4'h6: out_low = 8'h3b;
            4'h7: out_low = 8'h3a;
            4'h8: out_low = 8'h39;
            4'h9: out_low = 8'h38;
            4'ha: out_low = 8'h38;
            4'hb: out_low = 8'h37;
            4'hc: out_low = 8'h36;
            4'hd: out_low = 8'h36;
            4'he: out_low = 8'h35;
            4'hf: out_low = 8'h34;
            default: out_low = 8'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h33;
            4'h1: out_low = 8'h33;
            4'h2: out_low = 8'h32;
            4'h3: out_low = 8'h31;
            4'h4: out_low = 8'h30;
            4'h5: out_low = 8'h30;
            4'h6: out_low = 8'h2f;
            4'h7: out_low = 8'h2e;
            4'h8: out_low = 8'h2e;
            4'h9: out_low = 8'h2d;
            4'ha: out_low = 8'h2c;
            4'hb: out_low = 8'h2b;
            4'hc: out_low = 8'h2b;
            4'hd: out_low = 8'h2a;
            4'he: out_low = 8'h29;
            4'hf: out_low = 8'h29;
            default: out_low = 8'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 8'h28;
            4'h1: out_low = 8'h27;
            4'h2: out_low = 8'h26;
            4'h3: out_low = 8'h26;
            4'h4: out_low = 8'h25;
            4'h5: out_low = 8'h24;
            4'h6: out_low = 8'h24;
            4'h7: out_low = 8'h23;
            4'h8: out_low = 8'h22;
            4'h9: out_low = 8'h21;
            4'ha: out_low = 8'h21;
            4'hb: out_low = 8'h20;
            4'hc: out_low = 8'h1f;
            4'hd: out_low = 8'h1f;
            4'he: out_low = 8'h1e;
            4'hf: out_low = 8'h1d;
            default: out_low = 8'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1c;
            4'h1: out_low = 8'h1c;
            4'h2: out_low = 8'h1b;
            4'h3: out_low = 8'h1a;
            4'h4: out_low = 8'h1a;
            4'h5: out_low = 8'h19;
            4'h6: out_low = 8'h18;
            4'h7: out_low = 8'h18;
            4'h8: out_low = 8'h17;
            4'h9: out_low = 8'h16;
            4'ha: out_low = 8'h15;
            4'hb: out_low = 8'h15;
            4'hc: out_low = 8'h14;
            4'hd: out_low = 8'h13;
            4'he: out_low = 8'h13;
            4'hf: out_low = 8'h12;
            default: out_low = 8'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 8'h11;
            4'h1: out_low = 8'h11;
            4'h2: out_low = 8'h10;
            4'h3: out_low = 8'h0f;
            4'h4: out_low = 8'h0f;
            4'h5: out_low = 8'h0e;
            4'h6: out_low = 8'h0d;
            4'h7: out_low = 8'h0d;
            4'h8: out_low = 8'h0c;
            4'h9: out_low = 8'h0b;
            4'ha: out_low = 8'h0a;
            4'hb: out_low = 8'h0a;
            4'hc: out_low = 8'h09;
            4'hd: out_low = 8'h08;
            4'he: out_low = 8'h08;
            4'hf: out_low = 8'h07;
            default: out_low = 8'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 8'h06;
            4'h1: out_low = 8'h06;
            4'h2: out_low = 8'h05;
            4'h3: out_low = 8'h04;
            4'h4: out_low = 8'h04;
            4'h5: out_low = 8'h03;
            4'h6: out_low = 8'h02;
            4'h7: out_low = 8'h02;
            4'h8: out_low = 8'h01;
            4'h9: out_low = 8'h00;
            4'ha: out_low = 8'h00;
            4'hb: out_low = 8'hff;
            4'hc: out_low = 8'hfe;
            4'hd: out_low = 8'hfe;
            4'he: out_low = 8'hfd;
            4'hf: out_low = 8'hfc;
            default: out_low = 8'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 8'hfc;
            4'h1: out_low = 8'hfb;
            4'h2: out_low = 8'hfa;
            4'h3: out_low = 8'hfa;
            4'h4: out_low = 8'hf9;
            4'h5: out_low = 8'hf8;
            4'h6: out_low = 8'hf8;
            4'h7: out_low = 8'hf7;
            4'h8: out_low = 8'hf6;
            4'h9: out_low = 8'hf6;
            4'ha: out_low = 8'hf5;
            4'hb: out_low = 8'hf4;
            4'hc: out_low = 8'hf4;
            4'hd: out_low = 8'hf3;
            4'he: out_low = 8'hf2;
            4'hf: out_low = 8'hf2;
            default: out_low = 8'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf1;
            4'h1: out_low = 8'hf0;
            4'h2: out_low = 8'hf0;
            4'h3: out_low = 8'hef;
            4'h4: out_low = 8'hee;
            4'h5: out_low = 8'hee;
            4'h6: out_low = 8'hed;
            4'h7: out_low = 8'hed;
            4'h8: out_low = 8'hec;
            4'h9: out_low = 8'heb;
            4'ha: out_low = 8'heb;
            4'hb: out_low = 8'hea;
            4'hc: out_low = 8'he9;
            4'hd: out_low = 8'he9;
            4'he: out_low = 8'he8;
            4'hf: out_low = 8'he7;
            default: out_low = 8'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 8'he7;
            4'h1: out_low = 8'he6;
            4'h2: out_low = 8'he5;
            4'h3: out_low = 8'he5;
            4'h4: out_low = 8'he4;
            4'h5: out_low = 8'he4;
            4'h6: out_low = 8'he3;
            4'h7: out_low = 8'he2;
            4'h8: out_low = 8'he2;
            4'h9: out_low = 8'he1;
            4'ha: out_low = 8'he0;
            4'hb: out_low = 8'he0;
            4'hc: out_low = 8'hdf;
            4'hd: out_low = 8'hde;
            4'he: out_low = 8'hde;
            4'hf: out_low = 8'hdd;
            default: out_low = 8'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 8'hdd;
            4'h1: out_low = 8'hdc;
            4'h2: out_low = 8'hdb;
            4'h3: out_low = 8'hdb;
            4'h4: out_low = 8'hda;
            4'h5: out_low = 8'hd9;
            4'h6: out_low = 8'hd9;
            4'h7: out_low = 8'hd8;
            4'h8: out_low = 8'hd8;
            4'h9: out_low = 8'hd7;
            4'ha: out_low = 8'hd6;
            4'hb: out_low = 8'hd6;
            4'hc: out_low = 8'hd5;
            4'hd: out_low = 8'hd4;
            4'he: out_low = 8'hd4;
            4'hf: out_low = 8'hd3;
            default: out_low = 8'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd3;
            4'h1: out_low = 8'hd2;
            4'h2: out_low = 8'hd1;
            4'h3: out_low = 8'hd1;
            4'h4: out_low = 8'hd0;
            4'h5: out_low = 8'hcf;
            4'h6: out_low = 8'hcf;
            4'h7: out_low = 8'hce;
            4'h8: out_low = 8'hce;
            4'h9: out_low = 8'hcd;
            4'ha: out_low = 8'hcc;
            4'hb: out_low = 8'hcc;
            4'hc: out_low = 8'hcb;
            4'hd: out_low = 8'hcb;
            4'he: out_low = 8'hca;
            4'hf: out_low = 8'hc9;
            default: out_low = 8'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc9;
            4'h1: out_low = 8'hc8;
            4'h2: out_low = 8'hc7;
            4'h3: out_low = 8'hc7;
            4'h4: out_low = 8'hc6;
            4'h5: out_low = 8'hc6;
            4'h6: out_low = 8'hc5;
            4'h7: out_low = 8'hc4;
            4'h8: out_low = 8'hc4;
            4'h9: out_low = 8'hc3;
            4'ha: out_low = 8'hc3;
            4'hb: out_low = 8'hc2;
            4'hc: out_low = 8'hc1;
            4'hd: out_low = 8'hc1;
            4'he: out_low = 8'hc0;
            4'hf: out_low = 8'hc0;
            default: out_low = 8'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 8'hbf;
            4'h1: out_low = 8'hbe;
            4'h2: out_low = 8'hbe;
            4'h3: out_low = 8'hbd;
            4'h4: out_low = 8'hbd;
            4'h5: out_low = 8'hbc;
            4'h6: out_low = 8'hbb;
            4'h7: out_low = 8'hbb;
            4'h8: out_low = 8'hba;
            4'h9: out_low = 8'hba;
            4'ha: out_low = 8'hb9;
            4'hb: out_low = 8'hb8;
            4'hc: out_low = 8'hb8;
            4'hd: out_low = 8'hb7;
            4'he: out_low = 8'hb7;
            4'hf: out_low = 8'hb6;
            default: out_low = 8'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb6;
            4'h1: out_low = 8'hb5;
            4'h2: out_low = 8'hb4;
            4'h3: out_low = 8'hb4;
            4'h4: out_low = 8'hb3;
            4'h5: out_low = 8'hb3;
            4'h6: out_low = 8'hb2;
            4'h7: out_low = 8'hb1;
            4'h8: out_low = 8'hb1;
            4'h9: out_low = 8'hb0;
            4'ha: out_low = 8'hb0;
            4'hb: out_low = 8'haf;
            4'hc: out_low = 8'hae;
            4'hd: out_low = 8'hae;
            4'he: out_low = 8'had;
            4'hf: out_low = 8'had;
            default: out_low = 8'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 8'hac;
            4'h1: out_low = 8'hac;
            4'h2: out_low = 8'hab;
            4'h3: out_low = 8'haa;
            4'h4: out_low = 8'haa;
            4'h5: out_low = 8'ha9;
            4'h6: out_low = 8'ha9;
            4'h7: out_low = 8'ha8;
            4'h8: out_low = 8'ha8;
            4'h9: out_low = 8'ha7;
            4'ha: out_low = 8'ha6;
            4'hb: out_low = 8'ha6;
            4'hc: out_low = 8'ha5;
            4'hd: out_low = 8'ha5;
            4'he: out_low = 8'ha4;
            4'hf: out_low = 8'ha4;
            default: out_low = 8'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha3;
            4'h1: out_low = 8'ha2;
            4'h2: out_low = 8'ha2;
            4'h3: out_low = 8'ha1;
            4'h4: out_low = 8'ha1;
            4'h5: out_low = 8'ha0;
            4'h6: out_low = 8'ha0;
            4'h7: out_low = 8'h9f;
            4'h8: out_low = 8'h9e;
            4'h9: out_low = 8'h9e;
            4'ha: out_low = 8'h9d;
            4'hb: out_low = 8'h9d;
            4'hc: out_low = 8'h9c;
            4'hd: out_low = 8'h9c;
            4'he: out_low = 8'h9b;
            4'hf: out_low = 8'h9a;
            default: out_low = 8'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9a;
            4'h1: out_low = 8'h99;
            4'h2: out_low = 8'h99;
            4'h3: out_low = 8'h98;
            4'h4: out_low = 8'h98;
            4'h5: out_low = 8'h97;
            4'h6: out_low = 8'h97;
            4'h7: out_low = 8'h96;
            4'h8: out_low = 8'h95;
            4'h9: out_low = 8'h95;
            4'ha: out_low = 8'h94;
            4'hb: out_low = 8'h94;
            4'hc: out_low = 8'h93;
            4'hd: out_low = 8'h93;
            4'he: out_low = 8'h92;
            4'hf: out_low = 8'h92;
            default: out_low = 8'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h91;
            4'h1: out_low = 8'h90;
            4'h2: out_low = 8'h90;
            4'h3: out_low = 8'h8f;
            4'h4: out_low = 8'h8f;
            4'h5: out_low = 8'h8e;
            4'h6: out_low = 8'h8e;
            4'h7: out_low = 8'h8d;
            4'h8: out_low = 8'h8d;
            4'h9: out_low = 8'h8c;
            4'ha: out_low = 8'h8b;
            4'hb: out_low = 8'h8b;
            4'hc: out_low = 8'h8a;
            4'hd: out_low = 8'h8a;
            4'he: out_low = 8'h89;
            4'hf: out_low = 8'h89;
            default: out_low = 8'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 8'h88;
            4'h1: out_low = 8'h88;
            4'h2: out_low = 8'h87;
            4'h3: out_low = 8'h87;
            4'h4: out_low = 8'h86;
            4'h5: out_low = 8'h85;
            4'h6: out_low = 8'h85;
            4'h7: out_low = 8'h84;
            4'h8: out_low = 8'h84;
            4'h9: out_low = 8'h83;
            4'ha: out_low = 8'h83;
            4'hb: out_low = 8'h82;
            4'hc: out_low = 8'h82;
            4'hd: out_low = 8'h81;
            4'he: out_low = 8'h81;
            4'hf: out_low = 8'h80;
            default: out_low = 8'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 8'h80;
            4'h1: out_low = 8'h7f;
            4'h2: out_low = 8'h7e;
            4'h3: out_low = 8'h7e;
            4'h4: out_low = 8'h7d;
            4'h5: out_low = 8'h7d;
            4'h6: out_low = 8'h7c;
            4'h7: out_low = 8'h7c;
            4'h8: out_low = 8'h7b;
            4'h9: out_low = 8'h7b;
            4'ha: out_low = 8'h7a;
            4'hb: out_low = 8'h7a;
            4'hc: out_low = 8'h79;
            4'hd: out_low = 8'h79;
            4'he: out_low = 8'h78;
            4'hf: out_low = 8'h78;
            default: out_low = 8'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 8'h77;
            4'h1: out_low = 8'h77;
            4'h2: out_low = 8'h76;
            4'h3: out_low = 8'h75;
            4'h4: out_low = 8'h75;
            4'h5: out_low = 8'h74;
            4'h6: out_low = 8'h74;
            4'h7: out_low = 8'h73;
            4'h8: out_low = 8'h73;
            4'h9: out_low = 8'h72;
            4'ha: out_low = 8'h72;
            4'hb: out_low = 8'h71;
            4'hc: out_low = 8'h71;
            4'hd: out_low = 8'h70;
            4'he: out_low = 8'h70;
            4'hf: out_low = 8'h6f;
            default: out_low = 8'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6f;
            4'h1: out_low = 8'h6e;
            4'h2: out_low = 8'h6e;
            4'h3: out_low = 8'h6d;
            4'h4: out_low = 8'h6d;
            4'h5: out_low = 8'h6c;
            4'h6: out_low = 8'h6c;
            4'h7: out_low = 8'h6b;
            4'h8: out_low = 8'h6b;
            4'h9: out_low = 8'h6a;
            4'ha: out_low = 8'h69;
            4'hb: out_low = 8'h69;
            4'hc: out_low = 8'h68;
            4'hd: out_low = 8'h68;
            4'he: out_low = 8'h67;
            4'hf: out_low = 8'h67;
            default: out_low = 8'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 8'h66;
            4'h1: out_low = 8'h66;
            4'h2: out_low = 8'h65;
            4'h3: out_low = 8'h65;
            4'h4: out_low = 8'h64;
            4'h5: out_low = 8'h64;
            4'h6: out_low = 8'h63;
            4'h7: out_low = 8'h63;
            4'h8: out_low = 8'h62;
            4'h9: out_low = 8'h62;
            4'ha: out_low = 8'h61;
            4'hb: out_low = 8'h61;
            4'hc: out_low = 8'h60;
            4'hd: out_low = 8'h60;
            4'he: out_low = 8'h5f;
            4'hf: out_low = 8'h5f;
            default: out_low = 8'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5e;
            4'h1: out_low = 8'h5e;
            4'h2: out_low = 8'h5d;
            4'h3: out_low = 8'h5d;
            4'h4: out_low = 8'h5c;
            4'h5: out_low = 8'h5c;
            4'h6: out_low = 8'h5b;
            4'h7: out_low = 8'h5b;
            4'h8: out_low = 8'h5a;
            4'h9: out_low = 8'h5a;
            4'ha: out_low = 8'h59;
            4'hb: out_low = 8'h59;
            4'hc: out_low = 8'h58;
            4'hd: out_low = 8'h58;
            4'he: out_low = 8'h57;
            4'hf: out_low = 8'h57;
            default: out_low = 8'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 8'h56;
            4'h1: out_low = 8'h56;
            4'h2: out_low = 8'h55;
            4'h3: out_low = 8'h55;
            4'h4: out_low = 8'h54;
            4'h5: out_low = 8'h54;
            4'h6: out_low = 8'h53;
            4'h7: out_low = 8'h53;
            4'h8: out_low = 8'h52;
            4'h9: out_low = 8'h52;
            4'ha: out_low = 8'h51;
            4'hb: out_low = 8'h51;
            4'hc: out_low = 8'h50;
            4'hd: out_low = 8'h50;
            4'he: out_low = 8'h4f;
            4'hf: out_low = 8'h4f;
            default: out_low = 8'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4e;
            4'h1: out_low = 8'h4e;
            4'h2: out_low = 8'h4d;
            4'h3: out_low = 8'h4d;
            4'h4: out_low = 8'h4c;
            4'h5: out_low = 8'h4c;
            4'h6: out_low = 8'h4b;
            4'h7: out_low = 8'h4b;
            4'h8: out_low = 8'h4a;
            4'h9: out_low = 8'h4a;
            4'ha: out_low = 8'h49;
            4'hb: out_low = 8'h49;
            4'hc: out_low = 8'h49;
            4'hd: out_low = 8'h48;
            4'he: out_low = 8'h48;
            4'hf: out_low = 8'h47;
            default: out_low = 8'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 8'h47;
            4'h1: out_low = 8'h46;
            4'h2: out_low = 8'h46;
            4'h3: out_low = 8'h45;
            4'h4: out_low = 8'h45;
            4'h5: out_low = 8'h44;
            4'h6: out_low = 8'h44;
            4'h7: out_low = 8'h43;
            4'h8: out_low = 8'h43;
            4'h9: out_low = 8'h42;
            4'ha: out_low = 8'h42;
            4'hb: out_low = 8'h41;
            4'hc: out_low = 8'h41;
            4'hd: out_low = 8'h40;
            4'he: out_low = 8'h40;
            4'hf: out_low = 8'h3f;
            default: out_low = 8'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3f;
            4'h1: out_low = 8'h3e;
            4'h2: out_low = 8'h3e;
            4'h3: out_low = 8'h3d;
            4'h4: out_low = 8'h3d;
            4'h5: out_low = 8'h3d;
            4'h6: out_low = 8'h3c;
            4'h7: out_low = 8'h3c;
            4'h8: out_low = 8'h3b;
            4'h9: out_low = 8'h3b;
            4'ha: out_low = 8'h3a;
            4'hb: out_low = 8'h3a;
            4'hc: out_low = 8'h39;
            4'hd: out_low = 8'h39;
            4'he: out_low = 8'h38;
            4'hf: out_low = 8'h38;
            default: out_low = 8'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h37;
            4'h1: out_low = 8'h37;
            4'h2: out_low = 8'h36;
            4'h3: out_low = 8'h36;
            4'h4: out_low = 8'h35;
            4'h5: out_low = 8'h35;
            4'h6: out_low = 8'h35;
            4'h7: out_low = 8'h34;
            4'h8: out_low = 8'h34;
            4'h9: out_low = 8'h33;
            4'ha: out_low = 8'h33;
            4'hb: out_low = 8'h32;
            4'hc: out_low = 8'h32;
            4'hd: out_low = 8'h31;
            4'he: out_low = 8'h31;
            4'hf: out_low = 8'h30;
            default: out_low = 8'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h30;
            4'h1: out_low = 8'h2f;
            4'h2: out_low = 8'h2f;
            4'h3: out_low = 8'h2f;
            4'h4: out_low = 8'h2e;
            4'h5: out_low = 8'h2e;
            4'h6: out_low = 8'h2d;
            4'h7: out_low = 8'h2d;
            4'h8: out_low = 8'h2c;
            4'h9: out_low = 8'h2c;
            4'ha: out_low = 8'h2b;
            4'hb: out_low = 8'h2b;
            4'hc: out_low = 8'h2a;
            4'hd: out_low = 8'h2a;
            4'he: out_low = 8'h29;
            4'hf: out_low = 8'h29;
            default: out_low = 8'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h29;
            4'h1: out_low = 8'h28;
            4'h2: out_low = 8'h28;
            4'h3: out_low = 8'h27;
            4'h4: out_low = 8'h27;
            4'h5: out_low = 8'h26;
            4'h6: out_low = 8'h26;
            4'h7: out_low = 8'h25;
            4'h8: out_low = 8'h25;
            4'h9: out_low = 8'h24;
            4'ha: out_low = 8'h24;
            4'hb: out_low = 8'h24;
            4'hc: out_low = 8'h23;
            4'hd: out_low = 8'h23;
            4'he: out_low = 8'h22;
            4'hf: out_low = 8'h22;
            default: out_low = 8'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h21;
            4'h1: out_low = 8'h21;
            4'h2: out_low = 8'h20;
            4'h3: out_low = 8'h20;
            4'h4: out_low = 8'h20;
            4'h5: out_low = 8'h1f;
            4'h6: out_low = 8'h1f;
            4'h7: out_low = 8'h1e;
            4'h8: out_low = 8'h1e;
            4'h9: out_low = 8'h1d;
            4'ha: out_low = 8'h1d;
            4'hb: out_low = 8'h1c;
            4'hc: out_low = 8'h1c;
            4'hd: out_low = 8'h1b;
            4'he: out_low = 8'h1b;
            4'hf: out_low = 8'h1b;
            default: out_low = 8'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1a;
            4'h1: out_low = 8'h1a;
            4'h2: out_low = 8'h19;
            4'h3: out_low = 8'h19;
            4'h4: out_low = 8'h18;
            4'h5: out_low = 8'h18;
            4'h6: out_low = 8'h17;
            4'h7: out_low = 8'h17;
            4'h8: out_low = 8'h17;
            4'h9: out_low = 8'h16;
            4'ha: out_low = 8'h16;
            4'hb: out_low = 8'h15;
            4'hc: out_low = 8'h15;
            4'hd: out_low = 8'h14;
            4'he: out_low = 8'h14;
            4'hf: out_low = 8'h14;
            default: out_low = 8'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h13;
            4'h1: out_low = 8'h13;
            4'h2: out_low = 8'h12;
            4'h3: out_low = 8'h12;
            4'h4: out_low = 8'h11;
            4'h5: out_low = 8'h11;
            4'h6: out_low = 8'h10;
            4'h7: out_low = 8'h10;
            4'h8: out_low = 8'h10;
            4'h9: out_low = 8'h0f;
            4'ha: out_low = 8'h0f;
            4'hb: out_low = 8'h0e;
            4'hc: out_low = 8'h0e;
            4'hd: out_low = 8'h0d;
            4'he: out_low = 8'h0d;
            4'hf: out_low = 8'h0d;
            default: out_low = 8'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0c;
            4'h1: out_low = 8'h0c;
            4'h2: out_low = 8'h0b;
            4'h3: out_low = 8'h0b;
            4'h4: out_low = 8'h0a;
            4'h5: out_low = 8'h0a;
            4'h6: out_low = 8'h0a;
            4'h7: out_low = 8'h09;
            4'h8: out_low = 8'h09;
            4'h9: out_low = 8'h08;
            4'ha: out_low = 8'h08;
            4'hb: out_low = 8'h07;
            4'hc: out_low = 8'h07;
            4'hd: out_low = 8'h07;
            4'he: out_low = 8'h06;
            4'hf: out_low = 8'h06;
            default: out_low = 8'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 8'h05;
            4'h1: out_low = 8'h05;
            4'h2: out_low = 8'h04;
            4'h3: out_low = 8'h04;
            4'h4: out_low = 8'h04;
            4'h5: out_low = 8'h03;
            4'h6: out_low = 8'h03;
            4'h7: out_low = 8'h02;
            4'h8: out_low = 8'h02;
            4'h9: out_low = 8'h01;
            4'ha: out_low = 8'h01;
            4'hb: out_low = 8'h01;
            4'hc: out_low = 8'h00;
            4'hd: out_low = 8'h00;
            4'he: out_low = 8'hff;
            4'hf: out_low = 8'hff;
            default: out_low = 8'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 8'hff;
            4'h1: out_low = 8'hfe;
            4'h2: out_low = 8'hfe;
            4'h3: out_low = 8'hfd;
            4'h4: out_low = 8'hfd;
            4'h5: out_low = 8'hfc;
            4'h6: out_low = 8'hfc;
            4'h7: out_low = 8'hfc;
            4'h8: out_low = 8'hfb;
            4'h9: out_low = 8'hfb;
            4'ha: out_low = 8'hfa;
            4'hb: out_low = 8'hfa;
            4'hc: out_low = 8'hf9;
            4'hd: out_low = 8'hf9;
            4'he: out_low = 8'hf9;
            4'hf: out_low = 8'hf8;
            default: out_low = 8'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf8;
            4'h1: out_low = 8'hf7;
            4'h2: out_low = 8'hf7;
            4'h3: out_low = 8'hf7;
            4'h4: out_low = 8'hf6;
            4'h5: out_low = 8'hf6;
            4'h6: out_low = 8'hf5;
            4'h7: out_low = 8'hf5;
            4'h8: out_low = 8'hf5;
            4'h9: out_low = 8'hf4;
            4'ha: out_low = 8'hf4;
            4'hb: out_low = 8'hf3;
            4'hc: out_low = 8'hf3;
            4'hd: out_low = 8'hf2;
            4'he: out_low = 8'hf2;
            4'hf: out_low = 8'hf2;
            default: out_low = 8'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf1;
            4'h1: out_low = 8'hf1;
            4'h2: out_low = 8'hf0;
            4'h3: out_low = 8'hf0;
            4'h4: out_low = 8'hf0;
            4'h5: out_low = 8'hef;
            4'h6: out_low = 8'hef;
            4'h7: out_low = 8'hee;
            4'h8: out_low = 8'hee;
            4'h9: out_low = 8'hee;
            4'ha: out_low = 8'hed;
            4'hb: out_low = 8'hed;
            4'hc: out_low = 8'hec;
            4'hd: out_low = 8'hec;
            4'he: out_low = 8'hec;
            4'hf: out_low = 8'heb;
            default: out_low = 8'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 8'heb;
            4'h1: out_low = 8'hea;
            4'h2: out_low = 8'hea;
            4'h3: out_low = 8'he9;
            4'h4: out_low = 8'he9;
            4'h5: out_low = 8'he9;
            4'h6: out_low = 8'he8;
            4'h7: out_low = 8'he8;
            4'h8: out_low = 8'he7;
            4'h9: out_low = 8'he7;
            4'ha: out_low = 8'he7;
            4'hb: out_low = 8'he6;
            4'hc: out_low = 8'he6;
            4'hd: out_low = 8'he5;
            4'he: out_low = 8'he5;
            4'hf: out_low = 8'he5;
            default: out_low = 8'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 8'he4;
            4'h1: out_low = 8'he4;
            4'h2: out_low = 8'he3;
            4'h3: out_low = 8'he3;
            4'h4: out_low = 8'he3;
            4'h5: out_low = 8'he2;
            4'h6: out_low = 8'he2;
            4'h7: out_low = 8'he1;
            4'h8: out_low = 8'he1;
            4'h9: out_low = 8'he1;
            4'ha: out_low = 8'he0;
            4'hb: out_low = 8'he0;
            4'hc: out_low = 8'hdf;
            4'hd: out_low = 8'hdf;
            4'he: out_low = 8'hdf;
            4'hf: out_low = 8'hde;
            default: out_low = 8'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 8'hde;
            4'h1: out_low = 8'hde;
            4'h2: out_low = 8'hdd;
            4'h3: out_low = 8'hdd;
            4'h4: out_low = 8'hdc;
            4'h5: out_low = 8'hdc;
            4'h6: out_low = 8'hdc;
            4'h7: out_low = 8'hdb;
            4'h8: out_low = 8'hdb;
            4'h9: out_low = 8'hda;
            4'ha: out_low = 8'hda;
            4'hb: out_low = 8'hda;
            4'hc: out_low = 8'hd9;
            4'hd: out_low = 8'hd9;
            4'he: out_low = 8'hd8;
            4'hf: out_low = 8'hd8;
            default: out_low = 8'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd8;
            4'h1: out_low = 8'hd7;
            4'h2: out_low = 8'hd7;
            4'h3: out_low = 8'hd6;
            4'h4: out_low = 8'hd6;
            4'h5: out_low = 8'hd6;
            4'h6: out_low = 8'hd5;
            4'h7: out_low = 8'hd5;
            4'h8: out_low = 8'hd5;
            4'h9: out_low = 8'hd4;
            4'ha: out_low = 8'hd4;
            4'hb: out_low = 8'hd3;
            4'hc: out_low = 8'hd3;
            4'hd: out_low = 8'hd3;
            4'he: out_low = 8'hd2;
            4'hf: out_low = 8'hd2;
            default: out_low = 8'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd1;
            4'h1: out_low = 8'hd1;
            4'h2: out_low = 8'hd1;
            4'h3: out_low = 8'hd0;
            4'h4: out_low = 8'hd0;
            4'h5: out_low = 8'hd0;
            4'h6: out_low = 8'hcf;
            4'h7: out_low = 8'hcf;
            4'h8: out_low = 8'hce;
            4'h9: out_low = 8'hce;
            4'ha: out_low = 8'hce;
            4'hb: out_low = 8'hcd;
            4'hc: out_low = 8'hcd;
            4'hd: out_low = 8'hcc;
            4'he: out_low = 8'hcc;
            4'hf: out_low = 8'hcc;
            default: out_low = 8'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 8'hcb;
            4'h1: out_low = 8'hcb;
            4'h2: out_low = 8'hcb;
            4'h3: out_low = 8'hca;
            4'h4: out_low = 8'hca;
            4'h5: out_low = 8'hc9;
            4'h6: out_low = 8'hc9;
            4'h7: out_low = 8'hc9;
            4'h8: out_low = 8'hc8;
            4'h9: out_low = 8'hc8;
            4'ha: out_low = 8'hc8;
            4'hb: out_low = 8'hc7;
            4'hc: out_low = 8'hc7;
            4'hd: out_low = 8'hc6;
            4'he: out_low = 8'hc6;
            4'hf: out_low = 8'hc6;
            default: out_low = 8'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc5;
            4'h1: out_low = 8'hc5;
            4'h2: out_low = 8'hc5;
            4'h3: out_low = 8'hc4;
            4'h4: out_low = 8'hc4;
            4'h5: out_low = 8'hc3;
            4'h6: out_low = 8'hc3;
            4'h7: out_low = 8'hc3;
            4'h8: out_low = 8'hc2;
            4'h9: out_low = 8'hc2;
            4'ha: out_low = 8'hc2;
            4'hb: out_low = 8'hc1;
            4'hc: out_low = 8'hc1;
            4'hd: out_low = 8'hc0;
            4'he: out_low = 8'hc0;
            4'hf: out_low = 8'hc0;
            default: out_low = 8'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 8'hbf;
            4'h1: out_low = 8'hbf;
            4'h2: out_low = 8'hbf;
            4'h3: out_low = 8'hbe;
            4'h4: out_low = 8'hbe;
            4'h5: out_low = 8'hbd;
            4'h6: out_low = 8'hbd;
            4'h7: out_low = 8'hbd;
            4'h8: out_low = 8'hbc;
            4'h9: out_low = 8'hbc;
            4'ha: out_low = 8'hbc;
            4'hb: out_low = 8'hbb;
            4'hc: out_low = 8'hbb;
            4'hd: out_low = 8'hbb;
            4'he: out_low = 8'hba;
            4'hf: out_low = 8'hba;
            default: out_low = 8'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb9;
            4'h1: out_low = 8'hb9;
            4'h2: out_low = 8'hb9;
            4'h3: out_low = 8'hb8;
            4'h4: out_low = 8'hb8;
            4'h5: out_low = 8'hb8;
            4'h6: out_low = 8'hb7;
            4'h7: out_low = 8'hb7;
            4'h8: out_low = 8'hb7;
            4'h9: out_low = 8'hb6;
            4'ha: out_low = 8'hb6;
            4'hb: out_low = 8'hb5;
            4'hc: out_low = 8'hb5;
            4'hd: out_low = 8'hb5;
            4'he: out_low = 8'hb4;
            4'hf: out_low = 8'hb4;
            default: out_low = 8'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb4;
            4'h1: out_low = 8'hb3;
            4'h2: out_low = 8'hb3;
            4'h3: out_low = 8'hb3;
            4'h4: out_low = 8'hb2;
            4'h5: out_low = 8'hb2;
            4'h6: out_low = 8'hb1;
            4'h7: out_low = 8'hb1;
            4'h8: out_low = 8'hb1;
            4'h9: out_low = 8'hb0;
            4'ha: out_low = 8'hb0;
            4'hb: out_low = 8'hb0;
            4'hc: out_low = 8'haf;
            4'hd: out_low = 8'haf;
            4'he: out_low = 8'haf;
            4'hf: out_low = 8'hae;
            default: out_low = 8'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 8'hae;
            4'h1: out_low = 8'had;
            4'h2: out_low = 8'had;
            4'h3: out_low = 8'had;
            4'h4: out_low = 8'hac;
            4'h5: out_low = 8'hac;
            4'h6: out_low = 8'hac;
            4'h7: out_low = 8'hab;
            4'h8: out_low = 8'hab;
            4'h9: out_low = 8'hab;
            4'ha: out_low = 8'haa;
            4'hb: out_low = 8'haa;
            4'hc: out_low = 8'haa;
            4'hd: out_low = 8'ha9;
            4'he: out_low = 8'ha9;
            4'hf: out_low = 8'ha9;
            default: out_low = 8'h00;
          endcase
        end
        default: out_low = 8'h00;
      endcase
      end
      default: out_low = 8'h00;
    endcase
  end
  reg mag_b14;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b14 = 1;
      end
      5'h02: begin
        mag_b14 = 1;
      end
      5'h03: begin
        mag_b14 = 1;
      end
      5'h04: begin
        mag_b14 = 1;
      end
      5'h05: begin
        mag_b14 = 1;
      end
      5'h06: begin
        mag_b14 = 1;
      end
      5'h07: begin
        mag_b14 = 1;
      end
      5'h08: begin
        mag_b14 = 1;
      end
      5'h09: begin
        mag_b14 = 1;
      end
      5'h0a: begin
        mag_b14 = 1;
      end
      5'h0b: begin
        mag_b14 = 1;
      end
      5'h0c: begin
        mag_b14 = 1;
      end
      5'h0d: begin
        if (mant <= 10'h000) begin
          mag_b14 = 1;
        end else begin
          mag_b14 = 0;
        end
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
        mag_b14 = 0;
      end
      5'h12: begin
        mag_b14 = 0;
      end
      5'h13: begin
        mag_b14 = 0;
      end
      5'h14: begin
        mag_b14 = 0;
      end
      5'h15: begin
        mag_b14 = 0;
      end
      5'h16: begin
        mag_b14 = 0;
      end
      5'h17: begin
        mag_b14 = 0;
      end
      5'h18: begin
        mag_b14 = 0;
      end
      5'h19: begin
        mag_b14 = 0;
      end
      5'h1a: begin
        mag_b14 = 0;
      end
      5'h1b: begin
        mag_b14 = 0;
      end
      5'h1c: begin
        mag_b14 = 0;
      end
      5'h1d: begin
        mag_b14 = 0;
      end
      5'h1e: begin
        mag_b14 = 0;
      end
      default: mag_b14 = 1'b0;
    endcase
  end
  reg mag_b13;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b13 = 0;
      end
      5'h02: begin
        mag_b13 = 0;
      end
      5'h03: begin
        mag_b13 = 0;
      end
      5'h04: begin
        mag_b13 = 0;
      end
      5'h05: begin
        mag_b13 = 0;
      end
      5'h06: begin
        mag_b13 = 0;
      end
      5'h07: begin
        mag_b13 = 0;
      end
      5'h08: begin
        mag_b13 = 0;
      end
      5'h09: begin
        mag_b13 = 0;
      end
      5'h0a: begin
        mag_b13 = 0;
      end
      5'h0b: begin
        mag_b13 = 0;
      end
      5'h0c: begin
        mag_b13 = 0;
      end
      5'h0d: begin
        if (mant <= 10'h000) begin
          mag_b13 = 0;
        end else begin
          mag_b13 = 1;
        end
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
        mag_b13 = 1;
      end
      5'h12: begin
        mag_b13 = 1;
      end
      5'h13: begin
        mag_b13 = 1;
      end
      5'h14: begin
        mag_b13 = 1;
      end
      5'h15: begin
        mag_b13 = 1;
      end
      5'h16: begin
        mag_b13 = 1;
      end
      5'h17: begin
        mag_b13 = 1;
      end
      5'h18: begin
        mag_b13 = 1;
      end
      5'h19: begin
        mag_b13 = 1;
      end
      5'h1a: begin
        mag_b13 = 1;
      end
      5'h1b: begin
        mag_b13 = 1;
      end
      5'h1c: begin
        mag_b13 = 1;
      end
      5'h1d: begin
        if (mant <= 10'h000) begin
          mag_b13 = 1;
        end else begin
          mag_b13 = 0;
        end
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
        mag_b12 = 1;
      end
      5'h02: begin
        mag_b12 = 1;
      end
      5'h03: begin
        mag_b12 = 1;
      end
      5'h04: begin
        mag_b12 = 1;
      end
      5'h05: begin
        if (mant <= 10'h000) begin
          mag_b12 = 1;
        end else begin
          mag_b12 = 0;
        end
      end
      5'h06: begin
        mag_b12 = 0;
      end
      5'h07: begin
        mag_b12 = 0;
      end
      5'h08: begin
        mag_b12 = 0;
      end
      5'h09: begin
        mag_b12 = 0;
      end
      5'h0a: begin
        mag_b12 = 0;
      end
      5'h0b: begin
        mag_b12 = 0;
      end
      5'h0c: begin
        mag_b12 = 0;
      end
      5'h0d: begin
        if (mant <= 10'h000) begin
          mag_b12 = 0;
        end else begin
          mag_b12 = 1;
        end
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
        mag_b12 = 1;
      end
      5'h12: begin
        mag_b12 = 1;
      end
      5'h13: begin
        mag_b12 = 1;
      end
      5'h14: begin
        mag_b12 = 1;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b12 = 1;
        end else begin
          mag_b12 = 0;
        end
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
        if (mant <= 10'h000) begin
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
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h02: begin
        mag_b11 = 0;
      end
      5'h03: begin
        mag_b11 = 0;
      end
      5'h04: begin
        mag_b11 = 0;
      end
      5'h05: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h06: begin
        mag_b11 = 1;
      end
      5'h07: begin
        mag_b11 = 1;
      end
      5'h08: begin
        mag_b11 = 1;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h0a: begin
        mag_b11 = 0;
      end
      5'h0b: begin
        mag_b11 = 0;
      end
      5'h0c: begin
        mag_b11 = 0;
      end
      5'h0d: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
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
        if (mant <= 10'h000) begin
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
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h16: begin
        mag_b11 = 1;
      end
      5'h17: begin
        mag_b11 = 1;
      end
      5'h18: begin
        mag_b11 = 1;
      end
      5'h19: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h1a: begin
        mag_b11 = 0;
      end
      5'h1b: begin
        mag_b11 = 0;
      end
      5'h1c: begin
        mag_b11 = 0;
      end
      5'h1d: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h1e: begin
        mag_b11 = 1;
      end
      default: mag_b11 = 1'b0;
    endcase
  end
  reg mag_b10;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h02: begin
        mag_b10 = 1;
      end
      5'h03: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h04: begin
        mag_b10 = 0;
      end
      5'h05: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h06: begin
        mag_b10 = 1;
      end
      5'h07: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h08: begin
        mag_b10 = 0;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h0a: begin
        mag_b10 = 1;
      end
      5'h0b: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h0c: begin
        mag_b10 = 0;
      end
      5'h0d: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h0e: begin
        mag_b10 = 1;
      end
      5'h0f: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h10: begin
        mag_b10 = 0;
      end
      5'h11: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h12: begin
        mag_b10 = 1;
      end
      5'h13: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h14: begin
        mag_b10 = 0;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h16: begin
        mag_b10 = 1;
      end
      5'h17: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h18: begin
        mag_b10 = 0;
      end
      5'h19: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h1a: begin
        mag_b10 = 1;
      end
      5'h1b: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h1c: begin
        mag_b10 = 0;
      end
      5'h1d: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h1e: begin
        mag_b10 = 1;
      end
      default: mag_b10 = 1'b0;
    endcase
  end
  reg mag_b9;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h02: begin
        mag_b9 = 0;
      end
      5'h03: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h04: begin
        mag_b9 = 0;
      end
      5'h05: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h06: begin
        mag_b9 = 0;
      end
      5'h07: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h08: begin
        mag_b9 = 0;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h0a: begin
        mag_b9 = 0;
      end
      5'h0b: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h0c: begin
        mag_b9 = 0;
      end
      5'h0d: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h0e: begin
        mag_b9 = 0;
      end
      5'h0f: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h10: begin
        mag_b9 = 0;
      end
      5'h11: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h12: begin
        mag_b9 = 0;
      end
      5'h13: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h14: begin
        mag_b9 = 0;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h16: begin
        mag_b9 = 0;
      end
      5'h17: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h18: begin
        mag_b9 = 0;
      end
      5'h19: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h1a: begin
        mag_b9 = 0;
      end
      5'h1b: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
        end
      end
      5'h1c: begin
        mag_b9 = 0;
      end
      5'h1d: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          if (mant <= 10'h31d) begin
            mag_b9 = 1;
          end else begin
            mag_b9 = 0;
          end
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
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h02: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h03: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h04: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h05: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h06: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h07: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h08: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h09: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h0a: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0b: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h0c: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0d: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h0e: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0f: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h10: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h11: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h12: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h13: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h14: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h15: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h16: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h17: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h18: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h19: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h1a: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h1b: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h1c: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h1d: begin
        if (mant <= 10'h13a) begin
          if (mant <= 10'h000) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end else begin
          if (mant <= 10'h31d) begin
            mag_b8 = 0;
          end else begin
            mag_b8 = 1;
          end
        end
      end
      5'h1e: begin
        if (mant <= 10'h11f) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      default: mag_b8 = 1'b0;
    endcase
  end
  wire [14:0] active_mag = {mag_b14, mag_b13, mag_b12, mag_b11, mag_b10, mag_b9, mag_b8, out_low};
  wire [15:0] active_out = {1'b0, active_mag};
  assign out = active ? active_out : special_out;
endmodule
