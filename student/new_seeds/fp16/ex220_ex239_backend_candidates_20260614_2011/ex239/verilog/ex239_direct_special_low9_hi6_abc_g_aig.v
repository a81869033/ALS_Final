module ex239_direct_special_low9_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire active = (exp >= 5'd1) && (exp <= 5'd30);
  wire [15:0] special_out = (exp == 5'd0) ? {sign, 5'h1f, 10'h000} :
                           ((mant == 10'h000) ? {sign, 15'h0000} : 16'h7e00);
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
  reg [8:0] out_low;
  always @* begin
    case (cls)
      2'h0: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 9'h000;
            4'h1: out_low = 9'h1ff;
            4'h2: out_low = 9'h1ff;
            4'h3: out_low = 9'h1fe;
            4'h4: out_low = 9'h1fd;
            4'h5: out_low = 9'h1fd;
            4'h6: out_low = 9'h1fc;
            4'h7: out_low = 9'h1fb;
            4'h8: out_low = 9'h1fb;
            4'h9: out_low = 9'h1fa;
            4'ha: out_low = 9'h1f9;
            4'hb: out_low = 9'h1f9;
            4'hc: out_low = 9'h1f8;
            4'hd: out_low = 9'h1f7;
            4'he: out_low = 9'h1f7;
            4'hf: out_low = 9'h1f6;
            default: out_low = 9'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1f5;
            4'h1: out_low = 9'h1f5;
            4'h2: out_low = 9'h1f4;
            4'h3: out_low = 9'h1f3;
            4'h4: out_low = 9'h1f3;
            4'h5: out_low = 9'h1f2;
            4'h6: out_low = 9'h1f2;
            4'h7: out_low = 9'h1f1;
            4'h8: out_low = 9'h1f0;
            4'h9: out_low = 9'h1f0;
            4'ha: out_low = 9'h1ef;
            4'hb: out_low = 9'h1ee;
            4'hc: out_low = 9'h1ee;
            4'hd: out_low = 9'h1ed;
            4'he: out_low = 9'h1ec;
            4'hf: out_low = 9'h1ec;
            default: out_low = 9'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1eb;
            4'h1: out_low = 9'h1ea;
            4'h2: out_low = 9'h1ea;
            4'h3: out_low = 9'h1e9;
            4'h4: out_low = 9'h1e9;
            4'h5: out_low = 9'h1e8;
            4'h6: out_low = 9'h1e7;
            4'h7: out_low = 9'h1e7;
            4'h8: out_low = 9'h1e6;
            4'h9: out_low = 9'h1e5;
            4'ha: out_low = 9'h1e5;
            4'hb: out_low = 9'h1e4;
            4'hc: out_low = 9'h1e3;
            4'hd: out_low = 9'h1e3;
            4'he: out_low = 9'h1e2;
            4'hf: out_low = 9'h1e2;
            default: out_low = 9'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1e1;
            4'h1: out_low = 9'h1e0;
            4'h2: out_low = 9'h1e0;
            4'h3: out_low = 9'h1df;
            4'h4: out_low = 9'h1de;
            4'h5: out_low = 9'h1de;
            4'h6: out_low = 9'h1dd;
            4'h7: out_low = 9'h1dd;
            4'h8: out_low = 9'h1dc;
            4'h9: out_low = 9'h1db;
            4'ha: out_low = 9'h1db;
            4'hb: out_low = 9'h1da;
            4'hc: out_low = 9'h1d9;
            4'hd: out_low = 9'h1d9;
            4'he: out_low = 9'h1d8;
            4'hf: out_low = 9'h1d8;
            default: out_low = 9'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1d7;
            4'h1: out_low = 9'h1d6;
            4'h2: out_low = 9'h1d6;
            4'h3: out_low = 9'h1d5;
            4'h4: out_low = 9'h1d5;
            4'h5: out_low = 9'h1d4;
            4'h6: out_low = 9'h1d3;
            4'h7: out_low = 9'h1d3;
            4'h8: out_low = 9'h1d2;
            4'h9: out_low = 9'h1d2;
            4'ha: out_low = 9'h1d1;
            4'hb: out_low = 9'h1d0;
            4'hc: out_low = 9'h1d0;
            4'hd: out_low = 9'h1cf;
            4'he: out_low = 9'h1ce;
            4'hf: out_low = 9'h1ce;
            default: out_low = 9'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1cd;
            4'h1: out_low = 9'h1cd;
            4'h2: out_low = 9'h1cc;
            4'h3: out_low = 9'h1cb;
            4'h4: out_low = 9'h1cb;
            4'h5: out_low = 9'h1ca;
            4'h6: out_low = 9'h1ca;
            4'h7: out_low = 9'h1c9;
            4'h8: out_low = 9'h1c8;
            4'h9: out_low = 9'h1c8;
            4'ha: out_low = 9'h1c7;
            4'hb: out_low = 9'h1c7;
            4'hc: out_low = 9'h1c6;
            4'hd: out_low = 9'h1c6;
            4'he: out_low = 9'h1c5;
            4'hf: out_low = 9'h1c4;
            default: out_low = 9'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1c4;
            4'h1: out_low = 9'h1c3;
            4'h2: out_low = 9'h1c3;
            4'h3: out_low = 9'h1c2;
            4'h4: out_low = 9'h1c1;
            4'h5: out_low = 9'h1c1;
            4'h6: out_low = 9'h1c0;
            4'h7: out_low = 9'h1c0;
            4'h8: out_low = 9'h1bf;
            4'h9: out_low = 9'h1be;
            4'ha: out_low = 9'h1be;
            4'hb: out_low = 9'h1bd;
            4'hc: out_low = 9'h1bd;
            4'hd: out_low = 9'h1bc;
            4'he: out_low = 9'h1bc;
            4'hf: out_low = 9'h1bb;
            default: out_low = 9'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1ba;
            4'h1: out_low = 9'h1ba;
            4'h2: out_low = 9'h1b9;
            4'h3: out_low = 9'h1b9;
            4'h4: out_low = 9'h1b8;
            4'h5: out_low = 9'h1b7;
            4'h6: out_low = 9'h1b7;
            4'h7: out_low = 9'h1b6;
            4'h8: out_low = 9'h1b6;
            4'h9: out_low = 9'h1b5;
            4'ha: out_low = 9'h1b5;
            4'hb: out_low = 9'h1b4;
            4'hc: out_low = 9'h1b3;
            4'hd: out_low = 9'h1b3;
            4'he: out_low = 9'h1b2;
            4'hf: out_low = 9'h1b2;
            default: out_low = 9'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1b1;
            4'h1: out_low = 9'h1b1;
            4'h2: out_low = 9'h1b0;
            4'h3: out_low = 9'h1af;
            4'h4: out_low = 9'h1af;
            4'h5: out_low = 9'h1ae;
            4'h6: out_low = 9'h1ae;
            4'h7: out_low = 9'h1ad;
            4'h8: out_low = 9'h1ad;
            4'h9: out_low = 9'h1ac;
            4'ha: out_low = 9'h1ab;
            4'hb: out_low = 9'h1ab;
            4'hc: out_low = 9'h1aa;
            4'hd: out_low = 9'h1aa;
            4'he: out_low = 9'h1a9;
            4'hf: out_low = 9'h1a9;
            default: out_low = 9'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1a8;
            4'h1: out_low = 9'h1a8;
            4'h2: out_low = 9'h1a7;
            4'h3: out_low = 9'h1a6;
            4'h4: out_low = 9'h1a6;
            4'h5: out_low = 9'h1a5;
            4'h6: out_low = 9'h1a5;
            4'h7: out_low = 9'h1a4;
            4'h8: out_low = 9'h1a4;
            4'h9: out_low = 9'h1a3;
            4'ha: out_low = 9'h1a3;
            4'hb: out_low = 9'h1a2;
            4'hc: out_low = 9'h1a1;
            4'hd: out_low = 9'h1a1;
            4'he: out_low = 9'h1a0;
            4'hf: out_low = 9'h1a0;
            default: out_low = 9'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h19f;
            4'h1: out_low = 9'h19f;
            4'h2: out_low = 9'h19e;
            4'h3: out_low = 9'h19e;
            4'h4: out_low = 9'h19d;
            4'h5: out_low = 9'h19d;
            4'h6: out_low = 9'h19c;
            4'h7: out_low = 9'h19b;
            4'h8: out_low = 9'h19b;
            4'h9: out_low = 9'h19a;
            4'ha: out_low = 9'h19a;
            4'hb: out_low = 9'h199;
            4'hc: out_low = 9'h199;
            4'hd: out_low = 9'h198;
            4'he: out_low = 9'h198;
            4'hf: out_low = 9'h197;
            default: out_low = 9'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h197;
            4'h1: out_low = 9'h196;
            4'h2: out_low = 9'h195;
            4'h3: out_low = 9'h195;
            4'h4: out_low = 9'h194;
            4'h5: out_low = 9'h194;
            4'h6: out_low = 9'h193;
            4'h7: out_low = 9'h193;
            4'h8: out_low = 9'h192;
            4'h9: out_low = 9'h192;
            4'ha: out_low = 9'h191;
            4'hb: out_low = 9'h191;
            4'hc: out_low = 9'h190;
            4'hd: out_low = 9'h190;
            4'he: out_low = 9'h18f;
            4'hf: out_low = 9'h18f;
            default: out_low = 9'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h18e;
            4'h1: out_low = 9'h18d;
            4'h2: out_low = 9'h18d;
            4'h3: out_low = 9'h18c;
            4'h4: out_low = 9'h18c;
            4'h5: out_low = 9'h18b;
            4'h6: out_low = 9'h18b;
            4'h7: out_low = 9'h18a;
            4'h8: out_low = 9'h18a;
            4'h9: out_low = 9'h189;
            4'ha: out_low = 9'h189;
            4'hb: out_low = 9'h188;
            4'hc: out_low = 9'h188;
            4'hd: out_low = 9'h187;
            4'he: out_low = 9'h187;
            4'hf: out_low = 9'h186;
            default: out_low = 9'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h186;
            4'h1: out_low = 9'h185;
            4'h2: out_low = 9'h185;
            4'h3: out_low = 9'h184;
            4'h4: out_low = 9'h183;
            4'h5: out_low = 9'h183;
            4'h6: out_low = 9'h182;
            4'h7: out_low = 9'h182;
            4'h8: out_low = 9'h181;
            4'h9: out_low = 9'h181;
            4'ha: out_low = 9'h180;
            4'hb: out_low = 9'h180;
            4'hc: out_low = 9'h17f;
            4'hd: out_low = 9'h17f;
            4'he: out_low = 9'h17e;
            4'hf: out_low = 9'h17e;
            default: out_low = 9'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h17d;
            4'h1: out_low = 9'h17d;
            4'h2: out_low = 9'h17c;
            4'h3: out_low = 9'h17c;
            4'h4: out_low = 9'h17b;
            4'h5: out_low = 9'h17b;
            4'h6: out_low = 9'h17a;
            4'h7: out_low = 9'h17a;
            4'h8: out_low = 9'h179;
            4'h9: out_low = 9'h179;
            4'ha: out_low = 9'h178;
            4'hb: out_low = 9'h178;
            4'hc: out_low = 9'h177;
            4'hd: out_low = 9'h177;
            4'he: out_low = 9'h176;
            4'hf: out_low = 9'h176;
            default: out_low = 9'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h175;
            4'h1: out_low = 9'h175;
            4'h2: out_low = 9'h174;
            4'h3: out_low = 9'h174;
            4'h4: out_low = 9'h173;
            4'h5: out_low = 9'h173;
            4'h6: out_low = 9'h172;
            4'h7: out_low = 9'h172;
            4'h8: out_low = 9'h171;
            4'h9: out_low = 9'h171;
            4'ha: out_low = 9'h170;
            4'hb: out_low = 9'h170;
            4'hc: out_low = 9'h16f;
            4'hd: out_low = 9'h16f;
            4'he: out_low = 9'h16e;
            4'hf: out_low = 9'h16e;
            default: out_low = 9'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 9'h16d;
            4'h1: out_low = 9'h16d;
            4'h2: out_low = 9'h16c;
            4'h3: out_low = 9'h16c;
            4'h4: out_low = 9'h16b;
            4'h5: out_low = 9'h16b;
            4'h6: out_low = 9'h16a;
            4'h7: out_low = 9'h16a;
            4'h8: out_low = 9'h169;
            4'h9: out_low = 9'h169;
            4'ha: out_low = 9'h168;
            4'hb: out_low = 9'h168;
            4'hc: out_low = 9'h167;
            4'hd: out_low = 9'h167;
            4'he: out_low = 9'h166;
            4'hf: out_low = 9'h166;
            default: out_low = 9'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 9'h165;
            4'h1: out_low = 9'h165;
            4'h2: out_low = 9'h164;
            4'h3: out_low = 9'h164;
            4'h4: out_low = 9'h163;
            4'h5: out_low = 9'h163;
            4'h6: out_low = 9'h162;
            4'h7: out_low = 9'h162;
            4'h8: out_low = 9'h161;
            4'h9: out_low = 9'h161;
            4'ha: out_low = 9'h160;
            4'hb: out_low = 9'h160;
            4'hc: out_low = 9'h160;
            4'hd: out_low = 9'h15f;
            4'he: out_low = 9'h15f;
            4'hf: out_low = 9'h15e;
            default: out_low = 9'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 9'h15e;
            4'h1: out_low = 9'h15d;
            4'h2: out_low = 9'h15d;
            4'h3: out_low = 9'h15c;
            4'h4: out_low = 9'h15c;
            4'h5: out_low = 9'h15b;
            4'h6: out_low = 9'h15b;
            4'h7: out_low = 9'h15a;
            4'h8: out_low = 9'h15a;
            4'h9: out_low = 9'h159;
            4'ha: out_low = 9'h159;
            4'hb: out_low = 9'h158;
            4'hc: out_low = 9'h158;
            4'hd: out_low = 9'h157;
            4'he: out_low = 9'h157;
            4'hf: out_low = 9'h156;
            default: out_low = 9'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 9'h156;
            4'h1: out_low = 9'h156;
            4'h2: out_low = 9'h155;
            4'h3: out_low = 9'h155;
            4'h4: out_low = 9'h154;
            4'h5: out_low = 9'h154;
            4'h6: out_low = 9'h153;
            4'h7: out_low = 9'h153;
            4'h8: out_low = 9'h152;
            4'h9: out_low = 9'h152;
            4'ha: out_low = 9'h151;
            4'hb: out_low = 9'h151;
            4'hc: out_low = 9'h150;
            4'hd: out_low = 9'h150;
            4'he: out_low = 9'h14f;
            4'hf: out_low = 9'h14f;
            default: out_low = 9'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 9'h14f;
            4'h1: out_low = 9'h14e;
            4'h2: out_low = 9'h14e;
            4'h3: out_low = 9'h14d;
            4'h4: out_low = 9'h14d;
            4'h5: out_low = 9'h14c;
            4'h6: out_low = 9'h14c;
            4'h7: out_low = 9'h14b;
            4'h8: out_low = 9'h14b;
            4'h9: out_low = 9'h14a;
            4'ha: out_low = 9'h14a;
            4'hb: out_low = 9'h149;
            4'hc: out_low = 9'h149;
            4'hd: out_low = 9'h149;
            4'he: out_low = 9'h148;
            4'hf: out_low = 9'h148;
            default: out_low = 9'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 9'h147;
            4'h1: out_low = 9'h147;
            4'h2: out_low = 9'h146;
            4'h3: out_low = 9'h146;
            4'h4: out_low = 9'h145;
            4'h5: out_low = 9'h145;
            4'h6: out_low = 9'h144;
            4'h7: out_low = 9'h144;
            4'h8: out_low = 9'h144;
            4'h9: out_low = 9'h143;
            4'ha: out_low = 9'h143;
            4'hb: out_low = 9'h142;
            4'hc: out_low = 9'h142;
            4'hd: out_low = 9'h141;
            4'he: out_low = 9'h141;
            4'hf: out_low = 9'h140;
            default: out_low = 9'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 9'h140;
            4'h1: out_low = 9'h13f;
            4'h2: out_low = 9'h13f;
            4'h3: out_low = 9'h13f;
            4'h4: out_low = 9'h13e;
            4'h5: out_low = 9'h13e;
            4'h6: out_low = 9'h13d;
            4'h7: out_low = 9'h13d;
            4'h8: out_low = 9'h13c;
            4'h9: out_low = 9'h13c;
            4'ha: out_low = 9'h13b;
            4'hb: out_low = 9'h13b;
            4'hc: out_low = 9'h13b;
            4'hd: out_low = 9'h13a;
            4'he: out_low = 9'h13a;
            4'hf: out_low = 9'h139;
            default: out_low = 9'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 9'h139;
            4'h1: out_low = 9'h138;
            4'h2: out_low = 9'h138;
            4'h3: out_low = 9'h137;
            4'h4: out_low = 9'h137;
            4'h5: out_low = 9'h137;
            4'h6: out_low = 9'h136;
            4'h7: out_low = 9'h136;
            4'h8: out_low = 9'h135;
            4'h9: out_low = 9'h135;
            4'ha: out_low = 9'h134;
            4'hb: out_low = 9'h134;
            4'hc: out_low = 9'h133;
            4'hd: out_low = 9'h133;
            4'he: out_low = 9'h133;
            4'hf: out_low = 9'h132;
            default: out_low = 9'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 9'h132;
            4'h1: out_low = 9'h131;
            4'h2: out_low = 9'h131;
            4'h3: out_low = 9'h130;
            4'h4: out_low = 9'h130;
            4'h5: out_low = 9'h130;
            4'h6: out_low = 9'h12f;
            4'h7: out_low = 9'h12f;
            4'h8: out_low = 9'h12e;
            4'h9: out_low = 9'h12e;
            4'ha: out_low = 9'h12d;
            4'hb: out_low = 9'h12d;
            4'hc: out_low = 9'h12d;
            4'hd: out_low = 9'h12c;
            4'he: out_low = 9'h12c;
            4'hf: out_low = 9'h12b;
            default: out_low = 9'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 9'h12b;
            4'h1: out_low = 9'h12a;
            4'h2: out_low = 9'h12a;
            4'h3: out_low = 9'h12a;
            4'h4: out_low = 9'h129;
            4'h5: out_low = 9'h129;
            4'h6: out_low = 9'h128;
            4'h7: out_low = 9'h128;
            4'h8: out_low = 9'h127;
            4'h9: out_low = 9'h127;
            4'ha: out_low = 9'h127;
            4'hb: out_low = 9'h126;
            4'hc: out_low = 9'h126;
            4'hd: out_low = 9'h125;
            4'he: out_low = 9'h125;
            4'hf: out_low = 9'h124;
            default: out_low = 9'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h124;
            4'h1: out_low = 9'h124;
            4'h2: out_low = 9'h123;
            4'h3: out_low = 9'h123;
            4'h4: out_low = 9'h122;
            4'h5: out_low = 9'h122;
            4'h6: out_low = 9'h121;
            4'h7: out_low = 9'h121;
            4'h8: out_low = 9'h121;
            4'h9: out_low = 9'h120;
            4'ha: out_low = 9'h120;
            4'hb: out_low = 9'h11f;
            4'hc: out_low = 9'h11f;
            4'hd: out_low = 9'h11f;
            4'he: out_low = 9'h11e;
            4'hf: out_low = 9'h11e;
            default: out_low = 9'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h11d;
            4'h1: out_low = 9'h11d;
            4'h2: out_low = 9'h11c;
            4'h3: out_low = 9'h11c;
            4'h4: out_low = 9'h11c;
            4'h5: out_low = 9'h11b;
            4'h6: out_low = 9'h11b;
            4'h7: out_low = 9'h11a;
            4'h8: out_low = 9'h11a;
            4'h9: out_low = 9'h11a;
            4'ha: out_low = 9'h119;
            4'hb: out_low = 9'h119;
            4'hc: out_low = 9'h118;
            4'hd: out_low = 9'h118;
            4'he: out_low = 9'h117;
            4'hf: out_low = 9'h117;
            default: out_low = 9'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h117;
            4'h1: out_low = 9'h116;
            4'h2: out_low = 9'h116;
            4'h3: out_low = 9'h115;
            4'h4: out_low = 9'h115;
            4'h5: out_low = 9'h115;
            4'h6: out_low = 9'h114;
            4'h7: out_low = 9'h114;
            4'h8: out_low = 9'h113;
            4'h9: out_low = 9'h113;
            4'ha: out_low = 9'h113;
            4'hb: out_low = 9'h112;
            4'hc: out_low = 9'h112;
            4'hd: out_low = 9'h111;
            4'he: out_low = 9'h111;
            4'hf: out_low = 9'h111;
            default: out_low = 9'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h110;
            4'h1: out_low = 9'h110;
            4'h2: out_low = 9'h10f;
            4'h3: out_low = 9'h10f;
            4'h4: out_low = 9'h10f;
            4'h5: out_low = 9'h10e;
            4'h6: out_low = 9'h10e;
            4'h7: out_low = 9'h10d;
            4'h8: out_low = 9'h10d;
            4'h9: out_low = 9'h10c;
            4'ha: out_low = 9'h10c;
            4'hb: out_low = 9'h10c;
            4'hc: out_low = 9'h10b;
            4'hd: out_low = 9'h10b;
            4'he: out_low = 9'h10a;
            4'hf: out_low = 9'h10a;
            default: out_low = 9'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h10a;
            4'h1: out_low = 9'h109;
            4'h2: out_low = 9'h109;
            4'h3: out_low = 9'h108;
            4'h4: out_low = 9'h108;
            4'h5: out_low = 9'h108;
            4'h6: out_low = 9'h107;
            4'h7: out_low = 9'h107;
            4'h8: out_low = 9'h107;
            4'h9: out_low = 9'h106;
            4'ha: out_low = 9'h106;
            4'hb: out_low = 9'h105;
            4'hc: out_low = 9'h105;
            4'hd: out_low = 9'h105;
            4'he: out_low = 9'h104;
            4'hf: out_low = 9'h104;
            default: out_low = 9'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h103;
            4'h1: out_low = 9'h103;
            4'h2: out_low = 9'h103;
            4'h3: out_low = 9'h102;
            4'h4: out_low = 9'h102;
            4'h5: out_low = 9'h101;
            4'h6: out_low = 9'h101;
            4'h7: out_low = 9'h101;
            4'h8: out_low = 9'h100;
            4'h9: out_low = 9'h100;
            4'ha: out_low = 9'h0ff;
            4'hb: out_low = 9'h0ff;
            4'hc: out_low = 9'h0ff;
            4'hd: out_low = 9'h0fe;
            4'he: out_low = 9'h0fe;
            4'hf: out_low = 9'h0fd;
            default: out_low = 9'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0fd;
            4'h1: out_low = 9'h0fd;
            4'h2: out_low = 9'h0fc;
            4'h3: out_low = 9'h0fc;
            4'h4: out_low = 9'h0fc;
            4'h5: out_low = 9'h0fb;
            4'h6: out_low = 9'h0fb;
            4'h7: out_low = 9'h0fa;
            4'h8: out_low = 9'h0fa;
            4'h9: out_low = 9'h0fa;
            4'ha: out_low = 9'h0f9;
            4'hb: out_low = 9'h0f9;
            4'hc: out_low = 9'h0f8;
            4'hd: out_low = 9'h0f8;
            4'he: out_low = 9'h0f8;
            4'hf: out_low = 9'h0f7;
            default: out_low = 9'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0f7;
            4'h1: out_low = 9'h0f7;
            4'h2: out_low = 9'h0f6;
            4'h3: out_low = 9'h0f6;
            4'h4: out_low = 9'h0f5;
            4'h5: out_low = 9'h0f5;
            4'h6: out_low = 9'h0f5;
            4'h7: out_low = 9'h0f4;
            4'h8: out_low = 9'h0f4;
            4'h9: out_low = 9'h0f3;
            4'ha: out_low = 9'h0f3;
            4'hb: out_low = 9'h0f3;
            4'hc: out_low = 9'h0f2;
            4'hd: out_low = 9'h0f2;
            4'he: out_low = 9'h0f2;
            4'hf: out_low = 9'h0f1;
            default: out_low = 9'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0f1;
            4'h1: out_low = 9'h0f0;
            4'h2: out_low = 9'h0f0;
            4'h3: out_low = 9'h0f0;
            4'h4: out_low = 9'h0ef;
            4'h5: out_low = 9'h0ef;
            4'h6: out_low = 9'h0ef;
            4'h7: out_low = 9'h0ee;
            4'h8: out_low = 9'h0ee;
            4'h9: out_low = 9'h0ed;
            4'ha: out_low = 9'h0ed;
            4'hb: out_low = 9'h0ed;
            4'hc: out_low = 9'h0ec;
            4'hd: out_low = 9'h0ec;
            4'he: out_low = 9'h0ec;
            4'hf: out_low = 9'h0eb;
            default: out_low = 9'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0eb;
            4'h1: out_low = 9'h0ea;
            4'h2: out_low = 9'h0ea;
            4'h3: out_low = 9'h0ea;
            4'h4: out_low = 9'h0e9;
            4'h5: out_low = 9'h0e9;
            4'h6: out_low = 9'h0e9;
            4'h7: out_low = 9'h0e8;
            4'h8: out_low = 9'h0e8;
            4'h9: out_low = 9'h0e7;
            4'ha: out_low = 9'h0e7;
            4'hb: out_low = 9'h0e7;
            4'hc: out_low = 9'h0e6;
            4'hd: out_low = 9'h0e6;
            4'he: out_low = 9'h0e6;
            4'hf: out_low = 9'h0e5;
            default: out_low = 9'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0e5;
            4'h1: out_low = 9'h0e5;
            4'h2: out_low = 9'h0e4;
            4'h3: out_low = 9'h0e4;
            4'h4: out_low = 9'h0e3;
            4'h5: out_low = 9'h0e3;
            4'h6: out_low = 9'h0e3;
            4'h7: out_low = 9'h0e2;
            4'h8: out_low = 9'h0e2;
            4'h9: out_low = 9'h0e2;
            4'ha: out_low = 9'h0e1;
            4'hb: out_low = 9'h0e1;
            4'hc: out_low = 9'h0e1;
            4'hd: out_low = 9'h0e0;
            4'he: out_low = 9'h0e0;
            4'hf: out_low = 9'h0df;
            default: out_low = 9'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0df;
            4'h1: out_low = 9'h0df;
            4'h2: out_low = 9'h0de;
            4'h3: out_low = 9'h0de;
            4'h4: out_low = 9'h0de;
            4'h5: out_low = 9'h0dd;
            4'h6: out_low = 9'h0dd;
            4'h7: out_low = 9'h0dd;
            4'h8: out_low = 9'h0dc;
            4'h9: out_low = 9'h0dc;
            4'ha: out_low = 9'h0db;
            4'hb: out_low = 9'h0db;
            4'hc: out_low = 9'h0db;
            4'hd: out_low = 9'h0da;
            4'he: out_low = 9'h0da;
            4'hf: out_low = 9'h0da;
            default: out_low = 9'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0d9;
            4'h1: out_low = 9'h0d9;
            4'h2: out_low = 9'h0d9;
            4'h3: out_low = 9'h0d8;
            4'h4: out_low = 9'h0d8;
            4'h5: out_low = 9'h0d8;
            4'h6: out_low = 9'h0d7;
            4'h7: out_low = 9'h0d7;
            4'h8: out_low = 9'h0d6;
            4'h9: out_low = 9'h0d6;
            4'ha: out_low = 9'h0d6;
            4'hb: out_low = 9'h0d5;
            4'hc: out_low = 9'h0d5;
            4'hd: out_low = 9'h0d5;
            4'he: out_low = 9'h0d4;
            4'hf: out_low = 9'h0d4;
            default: out_low = 9'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0d4;
            4'h1: out_low = 9'h0d3;
            4'h2: out_low = 9'h0d3;
            4'h3: out_low = 9'h0d3;
            4'h4: out_low = 9'h0d2;
            4'h5: out_low = 9'h0d2;
            4'h6: out_low = 9'h0d1;
            4'h7: out_low = 9'h0d1;
            4'h8: out_low = 9'h0d1;
            4'h9: out_low = 9'h0d0;
            4'ha: out_low = 9'h0d0;
            4'hb: out_low = 9'h0d0;
            4'hc: out_low = 9'h0cf;
            4'hd: out_low = 9'h0cf;
            4'he: out_low = 9'h0cf;
            4'hf: out_low = 9'h0ce;
            default: out_low = 9'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0ce;
            4'h1: out_low = 9'h0ce;
            4'h2: out_low = 9'h0cd;
            4'h3: out_low = 9'h0cd;
            4'h4: out_low = 9'h0cd;
            4'h5: out_low = 9'h0cc;
            4'h6: out_low = 9'h0cc;
            4'h7: out_low = 9'h0cc;
            4'h8: out_low = 9'h0cb;
            4'h9: out_low = 9'h0cb;
            4'ha: out_low = 9'h0cb;
            4'hb: out_low = 9'h0ca;
            4'hc: out_low = 9'h0ca;
            4'hd: out_low = 9'h0c9;
            4'he: out_low = 9'h0c9;
            4'hf: out_low = 9'h0c9;
            default: out_low = 9'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0c8;
            4'h1: out_low = 9'h0c8;
            4'h2: out_low = 9'h0c8;
            4'h3: out_low = 9'h0c7;
            4'h4: out_low = 9'h0c7;
            4'h5: out_low = 9'h0c7;
            4'h6: out_low = 9'h0c6;
            4'h7: out_low = 9'h0c6;
            4'h8: out_low = 9'h0c6;
            4'h9: out_low = 9'h0c5;
            4'ha: out_low = 9'h0c5;
            4'hb: out_low = 9'h0c5;
            4'hc: out_low = 9'h0c4;
            4'hd: out_low = 9'h0c4;
            4'he: out_low = 9'h0c4;
            4'hf: out_low = 9'h0c3;
            default: out_low = 9'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0c3;
            4'h1: out_low = 9'h0c3;
            4'h2: out_low = 9'h0c2;
            4'h3: out_low = 9'h0c2;
            4'h4: out_low = 9'h0c2;
            4'h5: out_low = 9'h0c1;
            4'h6: out_low = 9'h0c1;
            4'h7: out_low = 9'h0c1;
            4'h8: out_low = 9'h0c0;
            4'h9: out_low = 9'h0c0;
            4'ha: out_low = 9'h0c0;
            4'hb: out_low = 9'h0bf;
            4'hc: out_low = 9'h0bf;
            4'hd: out_low = 9'h0bf;
            4'he: out_low = 9'h0be;
            4'hf: out_low = 9'h0be;
            default: out_low = 9'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0be;
            4'h1: out_low = 9'h0bd;
            4'h2: out_low = 9'h0bd;
            4'h3: out_low = 9'h0bd;
            4'h4: out_low = 9'h0bc;
            4'h5: out_low = 9'h0bc;
            4'h6: out_low = 9'h0bc;
            4'h7: out_low = 9'h0bb;
            4'h8: out_low = 9'h0bb;
            4'h9: out_low = 9'h0bb;
            4'ha: out_low = 9'h0ba;
            4'hb: out_low = 9'h0ba;
            4'hc: out_low = 9'h0ba;
            4'hd: out_low = 9'h0b9;
            4'he: out_low = 9'h0b9;
            4'hf: out_low = 9'h0b9;
            default: out_low = 9'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0b8;
            4'h1: out_low = 9'h0b8;
            4'h2: out_low = 9'h0b8;
            4'h3: out_low = 9'h0b7;
            4'h4: out_low = 9'h0b7;
            4'h5: out_low = 9'h0b7;
            4'h6: out_low = 9'h0b6;
            4'h7: out_low = 9'h0b6;
            4'h8: out_low = 9'h0b6;
            4'h9: out_low = 9'h0b5;
            4'ha: out_low = 9'h0b5;
            4'hb: out_low = 9'h0b5;
            4'hc: out_low = 9'h0b4;
            4'hd: out_low = 9'h0b4;
            4'he: out_low = 9'h0b4;
            4'hf: out_low = 9'h0b3;
            default: out_low = 9'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0b3;
            4'h1: out_low = 9'h0b3;
            4'h2: out_low = 9'h0b2;
            4'h3: out_low = 9'h0b2;
            4'h4: out_low = 9'h0b2;
            4'h5: out_low = 9'h0b1;
            4'h6: out_low = 9'h0b1;
            4'h7: out_low = 9'h0b1;
            4'h8: out_low = 9'h0b0;
            4'h9: out_low = 9'h0b0;
            4'ha: out_low = 9'h0b0;
            4'hb: out_low = 9'h0af;
            4'hc: out_low = 9'h0af;
            4'hd: out_low = 9'h0af;
            4'he: out_low = 9'h0ae;
            4'hf: out_low = 9'h0ae;
            default: out_low = 9'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0ae;
            4'h1: out_low = 9'h0ad;
            4'h2: out_low = 9'h0ad;
            4'h3: out_low = 9'h0ad;
            4'h4: out_low = 9'h0ac;
            4'h5: out_low = 9'h0ac;
            4'h6: out_low = 9'h0ac;
            4'h7: out_low = 9'h0ab;
            4'h8: out_low = 9'h0ab;
            4'h9: out_low = 9'h0ab;
            4'ha: out_low = 9'h0aa;
            4'hb: out_low = 9'h0aa;
            4'hc: out_low = 9'h0aa;
            4'hd: out_low = 9'h0aa;
            4'he: out_low = 9'h0a9;
            4'hf: out_low = 9'h0a9;
            default: out_low = 9'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0a9;
            4'h1: out_low = 9'h0a8;
            4'h2: out_low = 9'h0a8;
            4'h3: out_low = 9'h0a8;
            4'h4: out_low = 9'h0a7;
            4'h5: out_low = 9'h0a7;
            4'h6: out_low = 9'h0a7;
            4'h7: out_low = 9'h0a6;
            4'h8: out_low = 9'h0a6;
            4'h9: out_low = 9'h0a6;
            4'ha: out_low = 9'h0a5;
            4'hb: out_low = 9'h0a5;
            4'hc: out_low = 9'h0a5;
            4'hd: out_low = 9'h0a4;
            4'he: out_low = 9'h0a4;
            4'hf: out_low = 9'h0a4;
            default: out_low = 9'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0a3;
            4'h1: out_low = 9'h0a3;
            4'h2: out_low = 9'h0a3;
            4'h3: out_low = 9'h0a3;
            4'h4: out_low = 9'h0a2;
            4'h5: out_low = 9'h0a2;
            4'h6: out_low = 9'h0a2;
            4'h7: out_low = 9'h0a1;
            4'h8: out_low = 9'h0a1;
            4'h9: out_low = 9'h0a1;
            4'ha: out_low = 9'h0a0;
            4'hb: out_low = 9'h0a0;
            4'hc: out_low = 9'h0a0;
            4'hd: out_low = 9'h09f;
            4'he: out_low = 9'h09f;
            4'hf: out_low = 9'h09f;
            default: out_low = 9'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 9'h09e;
            4'h1: out_low = 9'h09e;
            4'h2: out_low = 9'h09e;
            4'h3: out_low = 9'h09e;
            4'h4: out_low = 9'h09d;
            4'h5: out_low = 9'h09d;
            4'h6: out_low = 9'h09d;
            4'h7: out_low = 9'h09c;
            4'h8: out_low = 9'h09c;
            4'h9: out_low = 9'h09c;
            4'ha: out_low = 9'h09b;
            4'hb: out_low = 9'h09b;
            4'hc: out_low = 9'h09b;
            4'hd: out_low = 9'h09a;
            4'he: out_low = 9'h09a;
            4'hf: out_low = 9'h09a;
            default: out_low = 9'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 9'h099;
            4'h1: out_low = 9'h099;
            4'h2: out_low = 9'h099;
            4'h3: out_low = 9'h099;
            4'h4: out_low = 9'h098;
            4'h5: out_low = 9'h098;
            4'h6: out_low = 9'h098;
            4'h7: out_low = 9'h097;
            4'h8: out_low = 9'h097;
            4'h9: out_low = 9'h097;
            4'ha: out_low = 9'h096;
            4'hb: out_low = 9'h096;
            4'hc: out_low = 9'h096;
            4'hd: out_low = 9'h095;
            4'he: out_low = 9'h095;
            4'hf: out_low = 9'h095;
            default: out_low = 9'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 9'h095;
            4'h1: out_low = 9'h094;
            4'h2: out_low = 9'h094;
            4'h3: out_low = 9'h094;
            4'h4: out_low = 9'h093;
            4'h5: out_low = 9'h093;
            4'h6: out_low = 9'h093;
            4'h7: out_low = 9'h092;
            4'h8: out_low = 9'h092;
            4'h9: out_low = 9'h092;
            4'ha: out_low = 9'h092;
            4'hb: out_low = 9'h091;
            4'hc: out_low = 9'h091;
            4'hd: out_low = 9'h091;
            4'he: out_low = 9'h090;
            4'hf: out_low = 9'h090;
            default: out_low = 9'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 9'h090;
            4'h1: out_low = 9'h08f;
            4'h2: out_low = 9'h08f;
            4'h3: out_low = 9'h08f;
            4'h4: out_low = 9'h08f;
            4'h5: out_low = 9'h08e;
            4'h6: out_low = 9'h08e;
            4'h7: out_low = 9'h08e;
            4'h8: out_low = 9'h08d;
            4'h9: out_low = 9'h08d;
            4'ha: out_low = 9'h08d;
            4'hb: out_low = 9'h08c;
            4'hc: out_low = 9'h08c;
            4'hd: out_low = 9'h08c;
            4'he: out_low = 9'h08c;
            4'hf: out_low = 9'h08b;
            default: out_low = 9'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 9'h08b;
            4'h1: out_low = 9'h08b;
            4'h2: out_low = 9'h08a;
            4'h3: out_low = 9'h08a;
            4'h4: out_low = 9'h08a;
            4'h5: out_low = 9'h089;
            4'h6: out_low = 9'h089;
            4'h7: out_low = 9'h089;
            4'h8: out_low = 9'h089;
            4'h9: out_low = 9'h088;
            4'ha: out_low = 9'h088;
            4'hb: out_low = 9'h088;
            4'hc: out_low = 9'h087;
            4'hd: out_low = 9'h087;
            4'he: out_low = 9'h087;
            4'hf: out_low = 9'h086;
            default: out_low = 9'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 9'h086;
            4'h1: out_low = 9'h086;
            4'h2: out_low = 9'h086;
            4'h3: out_low = 9'h085;
            4'h4: out_low = 9'h085;
            4'h5: out_low = 9'h085;
            4'h6: out_low = 9'h084;
            4'h7: out_low = 9'h084;
            4'h8: out_low = 9'h084;
            4'h9: out_low = 9'h084;
            4'ha: out_low = 9'h083;
            4'hb: out_low = 9'h083;
            4'hc: out_low = 9'h083;
            4'hd: out_low = 9'h082;
            4'he: out_low = 9'h082;
            4'hf: out_low = 9'h082;
            default: out_low = 9'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 9'h081;
            4'h1: out_low = 9'h081;
            4'h2: out_low = 9'h081;
            4'h3: out_low = 9'h081;
            4'h4: out_low = 9'h080;
            4'h5: out_low = 9'h080;
            4'h6: out_low = 9'h080;
            4'h7: out_low = 9'h07f;
            4'h8: out_low = 9'h07f;
            4'h9: out_low = 9'h07f;
            4'ha: out_low = 9'h07f;
            4'hb: out_low = 9'h07e;
            4'hc: out_low = 9'h07e;
            4'hd: out_low = 9'h07e;
            4'he: out_low = 9'h07d;
            4'hf: out_low = 9'h07d;
            default: out_low = 9'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 9'h07d;
            4'h1: out_low = 9'h07d;
            4'h2: out_low = 9'h07c;
            4'h3: out_low = 9'h07c;
            4'h4: out_low = 9'h07c;
            4'h5: out_low = 9'h07b;
            4'h6: out_low = 9'h07b;
            4'h7: out_low = 9'h07b;
            4'h8: out_low = 9'h07b;
            4'h9: out_low = 9'h07a;
            4'ha: out_low = 9'h07a;
            4'hb: out_low = 9'h07a;
            4'hc: out_low = 9'h079;
            4'hd: out_low = 9'h079;
            4'he: out_low = 9'h079;
            4'hf: out_low = 9'h079;
            default: out_low = 9'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 9'h078;
            4'h1: out_low = 9'h078;
            4'h2: out_low = 9'h078;
            4'h3: out_low = 9'h077;
            4'h4: out_low = 9'h077;
            4'h5: out_low = 9'h077;
            4'h6: out_low = 9'h077;
            4'h7: out_low = 9'h076;
            4'h8: out_low = 9'h076;
            4'h9: out_low = 9'h076;
            4'ha: out_low = 9'h075;
            4'hb: out_low = 9'h075;
            4'hc: out_low = 9'h075;
            4'hd: out_low = 9'h075;
            4'he: out_low = 9'h074;
            4'hf: out_low = 9'h074;
            default: out_low = 9'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h074;
            4'h1: out_low = 9'h073;
            4'h2: out_low = 9'h073;
            4'h3: out_low = 9'h073;
            4'h4: out_low = 9'h073;
            4'h5: out_low = 9'h072;
            4'h6: out_low = 9'h072;
            4'h7: out_low = 9'h072;
            4'h8: out_low = 9'h071;
            4'h9: out_low = 9'h071;
            4'ha: out_low = 9'h071;
            4'hb: out_low = 9'h071;
            4'hc: out_low = 9'h070;
            4'hd: out_low = 9'h070;
            4'he: out_low = 9'h070;
            4'hf: out_low = 9'h070;
            default: out_low = 9'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h06f;
            4'h1: out_low = 9'h06f;
            4'h2: out_low = 9'h06f;
            4'h3: out_low = 9'h06e;
            4'h4: out_low = 9'h06e;
            4'h5: out_low = 9'h06e;
            4'h6: out_low = 9'h06e;
            4'h7: out_low = 9'h06d;
            4'h8: out_low = 9'h06d;
            4'h9: out_low = 9'h06d;
            4'ha: out_low = 9'h06c;
            4'hb: out_low = 9'h06c;
            4'hc: out_low = 9'h06c;
            4'hd: out_low = 9'h06c;
            4'he: out_low = 9'h06b;
            4'hf: out_low = 9'h06b;
            default: out_low = 9'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h06b;
            4'h1: out_low = 9'h06b;
            4'h2: out_low = 9'h06a;
            4'h3: out_low = 9'h06a;
            4'h4: out_low = 9'h06a;
            4'h5: out_low = 9'h069;
            4'h6: out_low = 9'h069;
            4'h7: out_low = 9'h069;
            4'h8: out_low = 9'h069;
            4'h9: out_low = 9'h068;
            4'ha: out_low = 9'h068;
            4'hb: out_low = 9'h068;
            4'hc: out_low = 9'h067;
            4'hd: out_low = 9'h067;
            4'he: out_low = 9'h067;
            4'hf: out_low = 9'h067;
            default: out_low = 9'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h066;
            4'h1: out_low = 9'h066;
            4'h2: out_low = 9'h066;
            4'h3: out_low = 9'h066;
            4'h4: out_low = 9'h065;
            4'h5: out_low = 9'h065;
            4'h6: out_low = 9'h065;
            4'h7: out_low = 9'h064;
            4'h8: out_low = 9'h064;
            4'h9: out_low = 9'h064;
            4'ha: out_low = 9'h064;
            4'hb: out_low = 9'h063;
            4'hc: out_low = 9'h063;
            4'hd: out_low = 9'h063;
            4'he: out_low = 9'h063;
            4'hf: out_low = 9'h062;
            default: out_low = 9'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h062;
            4'h1: out_low = 9'h062;
            4'h2: out_low = 9'h062;
            4'h3: out_low = 9'h061;
            4'h4: out_low = 9'h061;
            4'h5: out_low = 9'h061;
            4'h6: out_low = 9'h060;
            4'h7: out_low = 9'h060;
            4'h8: out_low = 9'h060;
            4'h9: out_low = 9'h060;
            4'ha: out_low = 9'h05f;
            4'hb: out_low = 9'h05f;
            4'hc: out_low = 9'h05f;
            4'hd: out_low = 9'h05f;
            4'he: out_low = 9'h05e;
            4'hf: out_low = 9'h05e;
            default: out_low = 9'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h05e;
            4'h1: out_low = 9'h05d;
            4'h2: out_low = 9'h05d;
            4'h3: out_low = 9'h05d;
            4'h4: out_low = 9'h05d;
            4'h5: out_low = 9'h05c;
            4'h6: out_low = 9'h05c;
            4'h7: out_low = 9'h05c;
            4'h8: out_low = 9'h05c;
            4'h9: out_low = 9'h05b;
            4'ha: out_low = 9'h05b;
            4'hb: out_low = 9'h05b;
            4'hc: out_low = 9'h05b;
            4'hd: out_low = 9'h05a;
            4'he: out_low = 9'h05a;
            4'hf: out_low = 9'h05a;
            default: out_low = 9'h000;
          endcase
        end
        default: out_low = 9'h000;
      endcase
      end
      2'h1: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 9'h059;
            4'h1: out_low = 9'h059;
            4'h2: out_low = 9'h058;
            4'h3: out_low = 9'h058;
            4'h4: out_low = 9'h057;
            4'h5: out_low = 9'h057;
            4'h6: out_low = 9'h056;
            4'h7: out_low = 9'h056;
            4'h8: out_low = 9'h055;
            4'h9: out_low = 9'h055;
            4'ha: out_low = 9'h054;
            4'hb: out_low = 9'h054;
            4'hc: out_low = 9'h053;
            4'hd: out_low = 9'h053;
            4'he: out_low = 9'h052;
            4'hf: out_low = 9'h052;
            default: out_low = 9'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 9'h051;
            4'h1: out_low = 9'h051;
            4'h2: out_low = 9'h050;
            4'h3: out_low = 9'h050;
            4'h4: out_low = 9'h04f;
            4'h5: out_low = 9'h04f;
            4'h6: out_low = 9'h04e;
            4'h7: out_low = 9'h04e;
            4'h8: out_low = 9'h04d;
            4'h9: out_low = 9'h04c;
            4'ha: out_low = 9'h04c;
            4'hb: out_low = 9'h04b;
            4'hc: out_low = 9'h04b;
            4'hd: out_low = 9'h04a;
            4'he: out_low = 9'h04a;
            4'hf: out_low = 9'h049;
            default: out_low = 9'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 9'h049;
            4'h1: out_low = 9'h048;
            4'h2: out_low = 9'h048;
            4'h3: out_low = 9'h047;
            4'h4: out_low = 9'h047;
            4'h5: out_low = 9'h046;
            4'h6: out_low = 9'h046;
            4'h7: out_low = 9'h045;
            4'h8: out_low = 9'h045;
            4'h9: out_low = 9'h044;
            4'ha: out_low = 9'h044;
            4'hb: out_low = 9'h043;
            4'hc: out_low = 9'h043;
            4'hd: out_low = 9'h042;
            4'he: out_low = 9'h042;
            4'hf: out_low = 9'h041;
            default: out_low = 9'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 9'h041;
            4'h1: out_low = 9'h040;
            4'h2: out_low = 9'h040;
            4'h3: out_low = 9'h03f;
            4'h4: out_low = 9'h03f;
            4'h5: out_low = 9'h03e;
            4'h6: out_low = 9'h03e;
            4'h7: out_low = 9'h03d;
            4'h8: out_low = 9'h03d;
            4'h9: out_low = 9'h03c;
            4'ha: out_low = 9'h03c;
            4'hb: out_low = 9'h03b;
            4'hc: out_low = 9'h03b;
            4'hd: out_low = 9'h03a;
            4'he: out_low = 9'h03a;
            4'hf: out_low = 9'h039;
            default: out_low = 9'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 9'h039;
            4'h1: out_low = 9'h038;
            4'h2: out_low = 9'h038;
            4'h3: out_low = 9'h038;
            4'h4: out_low = 9'h037;
            4'h5: out_low = 9'h037;
            4'h6: out_low = 9'h036;
            4'h7: out_low = 9'h036;
            4'h8: out_low = 9'h035;
            4'h9: out_low = 9'h035;
            4'ha: out_low = 9'h034;
            4'hb: out_low = 9'h034;
            4'hc: out_low = 9'h033;
            4'hd: out_low = 9'h033;
            4'he: out_low = 9'h032;
            4'hf: out_low = 9'h032;
            default: out_low = 9'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 9'h031;
            4'h1: out_low = 9'h031;
            4'h2: out_low = 9'h030;
            4'h3: out_low = 9'h030;
            4'h4: out_low = 9'h02f;
            4'h5: out_low = 9'h02f;
            4'h6: out_low = 9'h02e;
            4'h7: out_low = 9'h02e;
            4'h8: out_low = 9'h02d;
            4'h9: out_low = 9'h02d;
            4'ha: out_low = 9'h02c;
            4'hb: out_low = 9'h02c;
            4'hc: out_low = 9'h02c;
            4'hd: out_low = 9'h02b;
            4'he: out_low = 9'h02b;
            4'hf: out_low = 9'h02a;
            default: out_low = 9'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 9'h02a;
            4'h1: out_low = 9'h029;
            4'h2: out_low = 9'h029;
            4'h3: out_low = 9'h028;
            4'h4: out_low = 9'h028;
            4'h5: out_low = 9'h027;
            4'h6: out_low = 9'h027;
            4'h7: out_low = 9'h026;
            4'h8: out_low = 9'h026;
            4'h9: out_low = 9'h025;
            4'ha: out_low = 9'h025;
            4'hb: out_low = 9'h025;
            4'hc: out_low = 9'h024;
            4'hd: out_low = 9'h024;
            4'he: out_low = 9'h023;
            4'hf: out_low = 9'h023;
            default: out_low = 9'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 9'h022;
            4'h1: out_low = 9'h022;
            4'h2: out_low = 9'h021;
            4'h3: out_low = 9'h021;
            4'h4: out_low = 9'h020;
            4'h5: out_low = 9'h020;
            4'h6: out_low = 9'h01f;
            4'h7: out_low = 9'h01f;
            4'h8: out_low = 9'h01f;
            4'h9: out_low = 9'h01e;
            4'ha: out_low = 9'h01e;
            4'hb: out_low = 9'h01d;
            4'hc: out_low = 9'h01d;
            4'hd: out_low = 9'h01c;
            4'he: out_low = 9'h01c;
            4'hf: out_low = 9'h01b;
            default: out_low = 9'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 9'h01b;
            4'h1: out_low = 9'h01a;
            4'h2: out_low = 9'h01a;
            4'h3: out_low = 9'h01a;
            4'h4: out_low = 9'h019;
            4'h5: out_low = 9'h019;
            4'h6: out_low = 9'h018;
            4'h7: out_low = 9'h018;
            4'h8: out_low = 9'h017;
            4'h9: out_low = 9'h017;
            4'ha: out_low = 9'h016;
            4'hb: out_low = 9'h016;
            4'hc: out_low = 9'h016;
            4'hd: out_low = 9'h015;
            4'he: out_low = 9'h015;
            4'hf: out_low = 9'h014;
            default: out_low = 9'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 9'h014;
            4'h1: out_low = 9'h013;
            4'h2: out_low = 9'h013;
            4'h3: out_low = 9'h012;
            4'h4: out_low = 9'h012;
            4'h5: out_low = 9'h012;
            4'h6: out_low = 9'h011;
            4'h7: out_low = 9'h011;
            4'h8: out_low = 9'h010;
            4'h9: out_low = 9'h010;
            4'ha: out_low = 9'h00f;
            4'hb: out_low = 9'h00f;
            4'hc: out_low = 9'h00e;
            4'hd: out_low = 9'h00e;
            4'he: out_low = 9'h00e;
            4'hf: out_low = 9'h00d;
            default: out_low = 9'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h00d;
            4'h1: out_low = 9'h00c;
            4'h2: out_low = 9'h00c;
            4'h3: out_low = 9'h00b;
            4'h4: out_low = 9'h00b;
            4'h5: out_low = 9'h00b;
            4'h6: out_low = 9'h00a;
            4'h7: out_low = 9'h00a;
            4'h8: out_low = 9'h009;
            4'h9: out_low = 9'h009;
            4'ha: out_low = 9'h008;
            4'hb: out_low = 9'h008;
            4'hc: out_low = 9'h008;
            4'hd: out_low = 9'h007;
            4'he: out_low = 9'h007;
            4'hf: out_low = 9'h006;
            default: out_low = 9'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h006;
            4'h1: out_low = 9'h005;
            4'h2: out_low = 9'h005;
            4'h3: out_low = 9'h005;
            4'h4: out_low = 9'h004;
            4'h5: out_low = 9'h004;
            4'h6: out_low = 9'h003;
            4'h7: out_low = 9'h003;
            4'h8: out_low = 9'h002;
            4'h9: out_low = 9'h002;
            4'ha: out_low = 9'h002;
            4'hb: out_low = 9'h001;
            4'hc: out_low = 9'h001;
            4'hd: out_low = 9'h000;
            4'he: out_low = 9'h000;
            4'hf: out_low = 9'h1ff;
            default: out_low = 9'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1ff;
            4'h1: out_low = 9'h1ff;
            4'h2: out_low = 9'h1fe;
            4'h3: out_low = 9'h1fe;
            4'h4: out_low = 9'h1fd;
            4'h5: out_low = 9'h1fd;
            4'h6: out_low = 9'h1fc;
            4'h7: out_low = 9'h1fc;
            4'h8: out_low = 9'h1fc;
            4'h9: out_low = 9'h1fb;
            4'ha: out_low = 9'h1fb;
            4'hb: out_low = 9'h1fa;
            4'hc: out_low = 9'h1fa;
            4'hd: out_low = 9'h1fa;
            4'he: out_low = 9'h1f9;
            4'hf: out_low = 9'h1f9;
            default: out_low = 9'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1f8;
            4'h1: out_low = 9'h1f8;
            4'h2: out_low = 9'h1f8;
            4'h3: out_low = 9'h1f7;
            4'h4: out_low = 9'h1f7;
            4'h5: out_low = 9'h1f6;
            4'h6: out_low = 9'h1f6;
            4'h7: out_low = 9'h1f5;
            4'h8: out_low = 9'h1f5;
            4'h9: out_low = 9'h1f5;
            4'ha: out_low = 9'h1f4;
            4'hb: out_low = 9'h1f4;
            4'hc: out_low = 9'h1f3;
            4'hd: out_low = 9'h1f3;
            4'he: out_low = 9'h1f3;
            4'hf: out_low = 9'h1f2;
            default: out_low = 9'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1f2;
            4'h1: out_low = 9'h1f1;
            4'h2: out_low = 9'h1f1;
            4'h3: out_low = 9'h1f1;
            4'h4: out_low = 9'h1f0;
            4'h5: out_low = 9'h1f0;
            4'h6: out_low = 9'h1ef;
            4'h7: out_low = 9'h1ef;
            4'h8: out_low = 9'h1ef;
            4'h9: out_low = 9'h1ee;
            4'ha: out_low = 9'h1ee;
            4'hb: out_low = 9'h1ed;
            4'hc: out_low = 9'h1ed;
            4'hd: out_low = 9'h1ed;
            4'he: out_low = 9'h1ec;
            4'hf: out_low = 9'h1ec;
            default: out_low = 9'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1eb;
            4'h1: out_low = 9'h1eb;
            4'h2: out_low = 9'h1eb;
            4'h3: out_low = 9'h1ea;
            4'h4: out_low = 9'h1ea;
            4'h5: out_low = 9'h1e9;
            4'h6: out_low = 9'h1e9;
            4'h7: out_low = 9'h1e9;
            4'h8: out_low = 9'h1e8;
            4'h9: out_low = 9'h1e8;
            4'ha: out_low = 9'h1e7;
            4'hb: out_low = 9'h1e7;
            4'hc: out_low = 9'h1e7;
            4'hd: out_low = 9'h1e6;
            4'he: out_low = 9'h1e6;
            4'hf: out_low = 9'h1e5;
            default: out_low = 9'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1e5;
            4'h1: out_low = 9'h1e5;
            4'h2: out_low = 9'h1e4;
            4'h3: out_low = 9'h1e4;
            4'h4: out_low = 9'h1e3;
            4'h5: out_low = 9'h1e3;
            4'h6: out_low = 9'h1e3;
            4'h7: out_low = 9'h1e2;
            4'h8: out_low = 9'h1e2;
            4'h9: out_low = 9'h1e1;
            4'ha: out_low = 9'h1e1;
            4'hb: out_low = 9'h1e1;
            4'hc: out_low = 9'h1e0;
            4'hd: out_low = 9'h1e0;
            4'he: out_low = 9'h1e0;
            4'hf: out_low = 9'h1df;
            default: out_low = 9'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1df;
            4'h1: out_low = 9'h1de;
            4'h2: out_low = 9'h1de;
            4'h3: out_low = 9'h1de;
            4'h4: out_low = 9'h1dd;
            4'h5: out_low = 9'h1dd;
            4'h6: out_low = 9'h1dc;
            4'h7: out_low = 9'h1dc;
            4'h8: out_low = 9'h1dc;
            4'h9: out_low = 9'h1db;
            4'ha: out_low = 9'h1db;
            4'hb: out_low = 9'h1db;
            4'hc: out_low = 9'h1da;
            4'hd: out_low = 9'h1da;
            4'he: out_low = 9'h1d9;
            4'hf: out_low = 9'h1d9;
            default: out_low = 9'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1d9;
            4'h1: out_low = 9'h1d8;
            4'h2: out_low = 9'h1d8;
            4'h3: out_low = 9'h1d7;
            4'h4: out_low = 9'h1d7;
            4'h5: out_low = 9'h1d7;
            4'h6: out_low = 9'h1d6;
            4'h7: out_low = 9'h1d6;
            4'h8: out_low = 9'h1d6;
            4'h9: out_low = 9'h1d5;
            4'ha: out_low = 9'h1d5;
            4'hb: out_low = 9'h1d4;
            4'hc: out_low = 9'h1d4;
            4'hd: out_low = 9'h1d4;
            4'he: out_low = 9'h1d3;
            4'hf: out_low = 9'h1d3;
            default: out_low = 9'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1d3;
            4'h1: out_low = 9'h1d2;
            4'h2: out_low = 9'h1d2;
            4'h3: out_low = 9'h1d1;
            4'h4: out_low = 9'h1d1;
            4'h5: out_low = 9'h1d1;
            4'h6: out_low = 9'h1d0;
            4'h7: out_low = 9'h1d0;
            4'h8: out_low = 9'h1d0;
            4'h9: out_low = 9'h1cf;
            4'ha: out_low = 9'h1cf;
            4'hb: out_low = 9'h1ce;
            4'hc: out_low = 9'h1ce;
            4'hd: out_low = 9'h1ce;
            4'he: out_low = 9'h1cd;
            4'hf: out_low = 9'h1cd;
            default: out_low = 9'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1cd;
            4'h1: out_low = 9'h1cc;
            4'h2: out_low = 9'h1cc;
            4'h3: out_low = 9'h1cc;
            4'h4: out_low = 9'h1cb;
            4'h5: out_low = 9'h1cb;
            4'h6: out_low = 9'h1ca;
            4'h7: out_low = 9'h1ca;
            4'h8: out_low = 9'h1ca;
            4'h9: out_low = 9'h1c9;
            4'ha: out_low = 9'h1c9;
            4'hb: out_low = 9'h1c9;
            4'hc: out_low = 9'h1c8;
            4'hd: out_low = 9'h1c8;
            4'he: out_low = 9'h1c8;
            4'hf: out_low = 9'h1c7;
            default: out_low = 9'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1c7;
            4'h1: out_low = 9'h1c6;
            4'h2: out_low = 9'h1c6;
            4'h3: out_low = 9'h1c6;
            4'h4: out_low = 9'h1c5;
            4'h5: out_low = 9'h1c5;
            4'h6: out_low = 9'h1c5;
            4'h7: out_low = 9'h1c4;
            4'h8: out_low = 9'h1c4;
            4'h9: out_low = 9'h1c4;
            4'ha: out_low = 9'h1c3;
            4'hb: out_low = 9'h1c3;
            4'hc: out_low = 9'h1c2;
            4'hd: out_low = 9'h1c2;
            4'he: out_low = 9'h1c2;
            4'hf: out_low = 9'h1c1;
            default: out_low = 9'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1c1;
            4'h1: out_low = 9'h1c1;
            4'h2: out_low = 9'h1c0;
            4'h3: out_low = 9'h1c0;
            4'h4: out_low = 9'h1c0;
            4'h5: out_low = 9'h1bf;
            4'h6: out_low = 9'h1bf;
            4'h7: out_low = 9'h1bf;
            4'h8: out_low = 9'h1be;
            4'h9: out_low = 9'h1be;
            4'ha: out_low = 9'h1bd;
            4'hb: out_low = 9'h1bd;
            4'hc: out_low = 9'h1bd;
            4'hd: out_low = 9'h1bc;
            4'he: out_low = 9'h1bc;
            4'hf: out_low = 9'h1bc;
            default: out_low = 9'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1bb;
            4'h1: out_low = 9'h1bb;
            4'h2: out_low = 9'h1bb;
            4'h3: out_low = 9'h1ba;
            4'h4: out_low = 9'h1ba;
            4'h5: out_low = 9'h1ba;
            4'h6: out_low = 9'h1b9;
            4'h7: out_low = 9'h1b9;
            4'h8: out_low = 9'h1b9;
            4'h9: out_low = 9'h1b8;
            4'ha: out_low = 9'h1b8;
            4'hb: out_low = 9'h1b8;
            4'hc: out_low = 9'h1b7;
            4'hd: out_low = 9'h1b7;
            4'he: out_low = 9'h1b6;
            4'hf: out_low = 9'h1b6;
            default: out_low = 9'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1b6;
            4'h1: out_low = 9'h1b5;
            4'h2: out_low = 9'h1b5;
            4'h3: out_low = 9'h1b5;
            4'h4: out_low = 9'h1b4;
            4'h5: out_low = 9'h1b4;
            4'h6: out_low = 9'h1b4;
            4'h7: out_low = 9'h1b3;
            4'h8: out_low = 9'h1b3;
            4'h9: out_low = 9'h1b3;
            4'ha: out_low = 9'h1b2;
            4'hb: out_low = 9'h1b2;
            4'hc: out_low = 9'h1b2;
            4'hd: out_low = 9'h1b1;
            4'he: out_low = 9'h1b1;
            4'hf: out_low = 9'h1b1;
            default: out_low = 9'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1b0;
            4'h1: out_low = 9'h1b0;
            4'h2: out_low = 9'h1b0;
            4'h3: out_low = 9'h1af;
            4'h4: out_low = 9'h1af;
            4'h5: out_low = 9'h1af;
            4'h6: out_low = 9'h1ae;
            4'h7: out_low = 9'h1ae;
            4'h8: out_low = 9'h1ae;
            4'h9: out_low = 9'h1ad;
            4'ha: out_low = 9'h1ad;
            4'hb: out_low = 9'h1ad;
            4'hc: out_low = 9'h1ac;
            4'hd: out_low = 9'h1ac;
            4'he: out_low = 9'h1ac;
            4'hf: out_low = 9'h1ab;
            default: out_low = 9'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1ab;
            4'h1: out_low = 9'h1ab;
            4'h2: out_low = 9'h1aa;
            4'h3: out_low = 9'h1aa;
            4'h4: out_low = 9'h1aa;
            4'h5: out_low = 9'h1a9;
            4'h6: out_low = 9'h1a9;
            4'h7: out_low = 9'h1a9;
            4'h8: out_low = 9'h1a8;
            4'h9: out_low = 9'h1a8;
            4'ha: out_low = 9'h1a8;
            4'hb: out_low = 9'h1a7;
            4'hc: out_low = 9'h1a7;
            4'hd: out_low = 9'h1a7;
            4'he: out_low = 9'h1a6;
            4'hf: out_low = 9'h1a6;
            default: out_low = 9'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1a6;
            4'h1: out_low = 9'h1a5;
            4'h2: out_low = 9'h1a5;
            4'h3: out_low = 9'h1a5;
            4'h4: out_low = 9'h1a4;
            4'h5: out_low = 9'h1a4;
            4'h6: out_low = 9'h1a4;
            4'h7: out_low = 9'h1a3;
            4'h8: out_low = 9'h1a3;
            4'h9: out_low = 9'h1a3;
            4'ha: out_low = 9'h1a2;
            4'hb: out_low = 9'h1a2;
            4'hc: out_low = 9'h1a2;
            4'hd: out_low = 9'h1a1;
            4'he: out_low = 9'h1a1;
            4'hf: out_low = 9'h1a1;
            default: out_low = 9'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h1a0;
            4'h1: out_low = 9'h1a0;
            4'h2: out_low = 9'h1a0;
            4'h3: out_low = 9'h19f;
            4'h4: out_low = 9'h19f;
            4'h5: out_low = 9'h19f;
            4'h6: out_low = 9'h19e;
            4'h7: out_low = 9'h19e;
            4'h8: out_low = 9'h19e;
            4'h9: out_low = 9'h19d;
            4'ha: out_low = 9'h19d;
            4'hb: out_low = 9'h19d;
            4'hc: out_low = 9'h19c;
            4'hd: out_low = 9'h19c;
            4'he: out_low = 9'h19c;
            4'hf: out_low = 9'h19b;
            default: out_low = 9'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h19b;
            4'h1: out_low = 9'h19b;
            4'h2: out_low = 9'h19a;
            4'h3: out_low = 9'h19a;
            4'h4: out_low = 9'h19a;
            4'h5: out_low = 9'h19a;
            4'h6: out_low = 9'h199;
            4'h7: out_low = 9'h199;
            4'h8: out_low = 9'h199;
            4'h9: out_low = 9'h198;
            4'ha: out_low = 9'h198;
            4'hb: out_low = 9'h198;
            4'hc: out_low = 9'h197;
            4'hd: out_low = 9'h197;
            4'he: out_low = 9'h197;
            4'hf: out_low = 9'h196;
            default: out_low = 9'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h196;
            4'h1: out_low = 9'h196;
            4'h2: out_low = 9'h195;
            4'h3: out_low = 9'h195;
            4'h4: out_low = 9'h195;
            4'h5: out_low = 9'h194;
            4'h6: out_low = 9'h194;
            4'h7: out_low = 9'h194;
            4'h8: out_low = 9'h193;
            4'h9: out_low = 9'h193;
            4'ha: out_low = 9'h193;
            4'hb: out_low = 9'h193;
            4'hc: out_low = 9'h192;
            4'hd: out_low = 9'h192;
            4'he: out_low = 9'h192;
            4'hf: out_low = 9'h191;
            default: out_low = 9'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h191;
            4'h1: out_low = 9'h191;
            4'h2: out_low = 9'h190;
            4'h3: out_low = 9'h190;
            4'h4: out_low = 9'h190;
            4'h5: out_low = 9'h18f;
            4'h6: out_low = 9'h18f;
            4'h7: out_low = 9'h18f;
            4'h8: out_low = 9'h18e;
            4'h9: out_low = 9'h18e;
            4'ha: out_low = 9'h18e;
            4'hb: out_low = 9'h18e;
            4'hc: out_low = 9'h18d;
            4'hd: out_low = 9'h18d;
            4'he: out_low = 9'h18d;
            4'hf: out_low = 9'h18c;
            default: out_low = 9'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 9'h18c;
            4'h1: out_low = 9'h18c;
            4'h2: out_low = 9'h18b;
            4'h3: out_low = 9'h18b;
            4'h4: out_low = 9'h18b;
            4'h5: out_low = 9'h18a;
            4'h6: out_low = 9'h18a;
            4'h7: out_low = 9'h18a;
            4'h8: out_low = 9'h18a;
            4'h9: out_low = 9'h189;
            4'ha: out_low = 9'h189;
            4'hb: out_low = 9'h189;
            4'hc: out_low = 9'h188;
            4'hd: out_low = 9'h188;
            4'he: out_low = 9'h188;
            4'hf: out_low = 9'h187;
            default: out_low = 9'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 9'h187;
            4'h1: out_low = 9'h187;
            4'h2: out_low = 9'h186;
            4'h3: out_low = 9'h186;
            4'h4: out_low = 9'h186;
            4'h5: out_low = 9'h186;
            4'h6: out_low = 9'h185;
            4'h7: out_low = 9'h185;
            4'h8: out_low = 9'h185;
            4'h9: out_low = 9'h184;
            4'ha: out_low = 9'h184;
            4'hb: out_low = 9'h184;
            4'hc: out_low = 9'h183;
            4'hd: out_low = 9'h183;
            4'he: out_low = 9'h183;
            4'hf: out_low = 9'h183;
            default: out_low = 9'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 9'h182;
            4'h1: out_low = 9'h182;
            4'h2: out_low = 9'h182;
            4'h3: out_low = 9'h181;
            4'h4: out_low = 9'h181;
            4'h5: out_low = 9'h181;
            4'h6: out_low = 9'h180;
            4'h7: out_low = 9'h180;
            4'h8: out_low = 9'h180;
            4'h9: out_low = 9'h180;
            4'ha: out_low = 9'h17f;
            4'hb: out_low = 9'h17f;
            4'hc: out_low = 9'h17f;
            4'hd: out_low = 9'h17e;
            4'he: out_low = 9'h17e;
            4'hf: out_low = 9'h17e;
            default: out_low = 9'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 9'h17e;
            4'h1: out_low = 9'h17d;
            4'h2: out_low = 9'h17d;
            4'h3: out_low = 9'h17d;
            4'h4: out_low = 9'h17c;
            4'h5: out_low = 9'h17c;
            4'h6: out_low = 9'h17c;
            4'h7: out_low = 9'h17b;
            4'h8: out_low = 9'h17b;
            4'h9: out_low = 9'h17b;
            4'ha: out_low = 9'h17b;
            4'hb: out_low = 9'h17a;
            4'hc: out_low = 9'h17a;
            4'hd: out_low = 9'h17a;
            4'he: out_low = 9'h179;
            4'hf: out_low = 9'h179;
            default: out_low = 9'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 9'h179;
            4'h1: out_low = 9'h179;
            4'h2: out_low = 9'h178;
            4'h3: out_low = 9'h178;
            4'h4: out_low = 9'h178;
            4'h5: out_low = 9'h177;
            4'h6: out_low = 9'h177;
            4'h7: out_low = 9'h177;
            4'h8: out_low = 9'h176;
            4'h9: out_low = 9'h176;
            4'ha: out_low = 9'h176;
            4'hb: out_low = 9'h176;
            4'hc: out_low = 9'h175;
            4'hd: out_low = 9'h175;
            4'he: out_low = 9'h175;
            4'hf: out_low = 9'h174;
            default: out_low = 9'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 9'h174;
            4'h1: out_low = 9'h174;
            4'h2: out_low = 9'h174;
            4'h3: out_low = 9'h173;
            4'h4: out_low = 9'h173;
            4'h5: out_low = 9'h173;
            4'h6: out_low = 9'h172;
            4'h7: out_low = 9'h172;
            4'h8: out_low = 9'h172;
            4'h9: out_low = 9'h172;
            4'ha: out_low = 9'h171;
            4'hb: out_low = 9'h171;
            4'hc: out_low = 9'h171;
            4'hd: out_low = 9'h170;
            4'he: out_low = 9'h170;
            4'hf: out_low = 9'h170;
            default: out_low = 9'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 9'h170;
            4'h1: out_low = 9'h16f;
            4'h2: out_low = 9'h16f;
            4'h3: out_low = 9'h16f;
            4'h4: out_low = 9'h16e;
            4'h5: out_low = 9'h16e;
            4'h6: out_low = 9'h16e;
            4'h7: out_low = 9'h16e;
            4'h8: out_low = 9'h16d;
            4'h9: out_low = 9'h16d;
            4'ha: out_low = 9'h16d;
            4'hb: out_low = 9'h16c;
            4'hc: out_low = 9'h16c;
            4'hd: out_low = 9'h16c;
            4'he: out_low = 9'h16c;
            4'hf: out_low = 9'h16b;
            default: out_low = 9'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 9'h16b;
            4'h1: out_low = 9'h16b;
            4'h2: out_low = 9'h16b;
            4'h3: out_low = 9'h16a;
            4'h4: out_low = 9'h16a;
            4'h5: out_low = 9'h16a;
            4'h6: out_low = 9'h169;
            4'h7: out_low = 9'h169;
            4'h8: out_low = 9'h169;
            4'h9: out_low = 9'h169;
            4'ha: out_low = 9'h168;
            4'hb: out_low = 9'h168;
            4'hc: out_low = 9'h168;
            4'hd: out_low = 9'h167;
            4'he: out_low = 9'h167;
            4'hf: out_low = 9'h167;
            default: out_low = 9'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 9'h167;
            4'h1: out_low = 9'h166;
            4'h2: out_low = 9'h166;
            4'h3: out_low = 9'h166;
            4'h4: out_low = 9'h166;
            4'h5: out_low = 9'h165;
            4'h6: out_low = 9'h165;
            4'h7: out_low = 9'h165;
            4'h8: out_low = 9'h164;
            4'h9: out_low = 9'h164;
            4'ha: out_low = 9'h164;
            4'hb: out_low = 9'h164;
            4'hc: out_low = 9'h163;
            4'hd: out_low = 9'h163;
            4'he: out_low = 9'h163;
            4'hf: out_low = 9'h162;
            default: out_low = 9'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 9'h162;
            4'h1: out_low = 9'h162;
            4'h2: out_low = 9'h162;
            4'h3: out_low = 9'h161;
            4'h4: out_low = 9'h161;
            4'h5: out_low = 9'h161;
            4'h6: out_low = 9'h161;
            4'h7: out_low = 9'h160;
            4'h8: out_low = 9'h160;
            4'h9: out_low = 9'h160;
            4'ha: out_low = 9'h15f;
            4'hb: out_low = 9'h15f;
            4'hc: out_low = 9'h15f;
            4'hd: out_low = 9'h15f;
            4'he: out_low = 9'h15e;
            4'hf: out_low = 9'h15e;
            default: out_low = 9'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h15e;
            4'h1: out_low = 9'h15e;
            4'h2: out_low = 9'h15d;
            4'h3: out_low = 9'h15d;
            4'h4: out_low = 9'h15d;
            4'h5: out_low = 9'h15d;
            4'h6: out_low = 9'h15c;
            4'h7: out_low = 9'h15c;
            4'h8: out_low = 9'h15c;
            4'h9: out_low = 9'h15b;
            4'ha: out_low = 9'h15b;
            4'hb: out_low = 9'h15b;
            4'hc: out_low = 9'h15b;
            4'hd: out_low = 9'h15a;
            4'he: out_low = 9'h15a;
            4'hf: out_low = 9'h15a;
            default: out_low = 9'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h15a;
            4'h1: out_low = 9'h159;
            4'h2: out_low = 9'h159;
            4'h3: out_low = 9'h159;
            4'h4: out_low = 9'h159;
            4'h5: out_low = 9'h158;
            4'h6: out_low = 9'h158;
            4'h7: out_low = 9'h158;
            4'h8: out_low = 9'h157;
            4'h9: out_low = 9'h157;
            4'ha: out_low = 9'h157;
            4'hb: out_low = 9'h157;
            4'hc: out_low = 9'h156;
            4'hd: out_low = 9'h156;
            4'he: out_low = 9'h156;
            4'hf: out_low = 9'h156;
            default: out_low = 9'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h155;
            4'h1: out_low = 9'h155;
            4'h2: out_low = 9'h155;
            4'h3: out_low = 9'h155;
            4'h4: out_low = 9'h154;
            4'h5: out_low = 9'h154;
            4'h6: out_low = 9'h154;
            4'h7: out_low = 9'h153;
            4'h8: out_low = 9'h153;
            4'h9: out_low = 9'h153;
            4'ha: out_low = 9'h153;
            4'hb: out_low = 9'h152;
            4'hc: out_low = 9'h152;
            4'hd: out_low = 9'h152;
            4'he: out_low = 9'h152;
            4'hf: out_low = 9'h151;
            default: out_low = 9'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h151;
            4'h1: out_low = 9'h151;
            4'h2: out_low = 9'h151;
            4'h3: out_low = 9'h150;
            4'h4: out_low = 9'h150;
            4'h5: out_low = 9'h150;
            4'h6: out_low = 9'h150;
            4'h7: out_low = 9'h14f;
            4'h8: out_low = 9'h14f;
            4'h9: out_low = 9'h14f;
            4'ha: out_low = 9'h14f;
            4'hb: out_low = 9'h14e;
            4'hc: out_low = 9'h14e;
            4'hd: out_low = 9'h14e;
            4'he: out_low = 9'h14e;
            4'hf: out_low = 9'h14d;
            default: out_low = 9'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h14d;
            4'h1: out_low = 9'h14d;
            4'h2: out_low = 9'h14c;
            4'h3: out_low = 9'h14c;
            4'h4: out_low = 9'h14c;
            4'h5: out_low = 9'h14c;
            4'h6: out_low = 9'h14b;
            4'h7: out_low = 9'h14b;
            4'h8: out_low = 9'h14b;
            4'h9: out_low = 9'h14b;
            4'ha: out_low = 9'h14a;
            4'hb: out_low = 9'h14a;
            4'hc: out_low = 9'h14a;
            4'hd: out_low = 9'h14a;
            4'he: out_low = 9'h149;
            4'hf: out_low = 9'h149;
            default: out_low = 9'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h149;
            4'h1: out_low = 9'h149;
            4'h2: out_low = 9'h148;
            4'h3: out_low = 9'h148;
            4'h4: out_low = 9'h148;
            4'h5: out_low = 9'h148;
            4'h6: out_low = 9'h147;
            4'h7: out_low = 9'h147;
            4'h8: out_low = 9'h147;
            4'h9: out_low = 9'h147;
            4'ha: out_low = 9'h146;
            4'hb: out_low = 9'h146;
            4'hc: out_low = 9'h146;
            4'hd: out_low = 9'h146;
            4'he: out_low = 9'h145;
            4'hf: out_low = 9'h145;
            default: out_low = 9'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 9'h145;
            4'h1: out_low = 9'h145;
            4'h2: out_low = 9'h144;
            4'h3: out_low = 9'h144;
            4'h4: out_low = 9'h144;
            4'h5: out_low = 9'h144;
            4'h6: out_low = 9'h143;
            4'h7: out_low = 9'h143;
            4'h8: out_low = 9'h143;
            4'h9: out_low = 9'h143;
            4'ha: out_low = 9'h142;
            4'hb: out_low = 9'h142;
            4'hc: out_low = 9'h142;
            4'hd: out_low = 9'h142;
            4'he: out_low = 9'h141;
            4'hf: out_low = 9'h141;
            default: out_low = 9'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 9'h141;
            4'h1: out_low = 9'h141;
            4'h2: out_low = 9'h140;
            4'h3: out_low = 9'h140;
            4'h4: out_low = 9'h140;
            4'h5: out_low = 9'h140;
            4'h6: out_low = 9'h13f;
            4'h7: out_low = 9'h13f;
            4'h8: out_low = 9'h13f;
            4'h9: out_low = 9'h13f;
            4'ha: out_low = 9'h13e;
            4'hb: out_low = 9'h13e;
            4'hc: out_low = 9'h13e;
            4'hd: out_low = 9'h13e;
            4'he: out_low = 9'h13d;
            4'hf: out_low = 9'h13d;
            default: out_low = 9'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 9'h13d;
            4'h1: out_low = 9'h13d;
            4'h2: out_low = 9'h13c;
            4'h3: out_low = 9'h13c;
            4'h4: out_low = 9'h13c;
            4'h5: out_low = 9'h13c;
            4'h6: out_low = 9'h13b;
            4'h7: out_low = 9'h13b;
            4'h8: out_low = 9'h13b;
            4'h9: out_low = 9'h13b;
            4'ha: out_low = 9'h13b;
            4'hb: out_low = 9'h13a;
            4'hc: out_low = 9'h13a;
            4'hd: out_low = 9'h13a;
            4'he: out_low = 9'h13a;
            4'hf: out_low = 9'h139;
            default: out_low = 9'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 9'h139;
            4'h1: out_low = 9'h139;
            4'h2: out_low = 9'h139;
            4'h3: out_low = 9'h138;
            4'h4: out_low = 9'h138;
            4'h5: out_low = 9'h138;
            4'h6: out_low = 9'h138;
            4'h7: out_low = 9'h137;
            4'h8: out_low = 9'h137;
            4'h9: out_low = 9'h137;
            4'ha: out_low = 9'h137;
            4'hb: out_low = 9'h136;
            4'hc: out_low = 9'h136;
            4'hd: out_low = 9'h136;
            4'he: out_low = 9'h136;
            4'hf: out_low = 9'h135;
            default: out_low = 9'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 9'h135;
            4'h1: out_low = 9'h135;
            4'h2: out_low = 9'h135;
            4'h3: out_low = 9'h134;
            4'h4: out_low = 9'h134;
            4'h5: out_low = 9'h134;
            4'h6: out_low = 9'h134;
            4'h7: out_low = 9'h134;
            4'h8: out_low = 9'h133;
            4'h9: out_low = 9'h133;
            4'ha: out_low = 9'h133;
            4'hb: out_low = 9'h133;
            4'hc: out_low = 9'h132;
            4'hd: out_low = 9'h132;
            4'he: out_low = 9'h132;
            4'hf: out_low = 9'h132;
            default: out_low = 9'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 9'h131;
            4'h1: out_low = 9'h131;
            4'h2: out_low = 9'h131;
            4'h3: out_low = 9'h131;
            4'h4: out_low = 9'h130;
            4'h5: out_low = 9'h130;
            4'h6: out_low = 9'h130;
            4'h7: out_low = 9'h130;
            4'h8: out_low = 9'h12f;
            4'h9: out_low = 9'h12f;
            4'ha: out_low = 9'h12f;
            4'hb: out_low = 9'h12f;
            4'hc: out_low = 9'h12f;
            4'hd: out_low = 9'h12e;
            4'he: out_low = 9'h12e;
            4'hf: out_low = 9'h12e;
            default: out_low = 9'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 9'h12e;
            4'h1: out_low = 9'h12d;
            4'h2: out_low = 9'h12d;
            4'h3: out_low = 9'h12d;
            4'h4: out_low = 9'h12d;
            4'h5: out_low = 9'h12c;
            4'h6: out_low = 9'h12c;
            4'h7: out_low = 9'h12c;
            4'h8: out_low = 9'h12c;
            4'h9: out_low = 9'h12c;
            4'ha: out_low = 9'h12b;
            4'hb: out_low = 9'h12b;
            4'hc: out_low = 9'h12b;
            4'hd: out_low = 9'h12b;
            4'he: out_low = 9'h12a;
            4'hf: out_low = 9'h12a;
            default: out_low = 9'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 9'h12a;
            4'h1: out_low = 9'h12a;
            4'h2: out_low = 9'h129;
            4'h3: out_low = 9'h129;
            4'h4: out_low = 9'h129;
            4'h5: out_low = 9'h129;
            4'h6: out_low = 9'h129;
            4'h7: out_low = 9'h128;
            4'h8: out_low = 9'h128;
            4'h9: out_low = 9'h128;
            4'ha: out_low = 9'h128;
            4'hb: out_low = 9'h127;
            4'hc: out_low = 9'h127;
            4'hd: out_low = 9'h127;
            4'he: out_low = 9'h127;
            4'hf: out_low = 9'h126;
            default: out_low = 9'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 9'h126;
            4'h1: out_low = 9'h126;
            4'h2: out_low = 9'h126;
            4'h3: out_low = 9'h126;
            4'h4: out_low = 9'h125;
            4'h5: out_low = 9'h125;
            4'h6: out_low = 9'h125;
            4'h7: out_low = 9'h125;
            4'h8: out_low = 9'h124;
            4'h9: out_low = 9'h124;
            4'ha: out_low = 9'h124;
            4'hb: out_low = 9'h124;
            4'hc: out_low = 9'h123;
            4'hd: out_low = 9'h123;
            4'he: out_low = 9'h123;
            4'hf: out_low = 9'h123;
            default: out_low = 9'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 9'h123;
            4'h1: out_low = 9'h122;
            4'h2: out_low = 9'h122;
            4'h3: out_low = 9'h122;
            4'h4: out_low = 9'h122;
            4'h5: out_low = 9'h121;
            4'h6: out_low = 9'h121;
            4'h7: out_low = 9'h121;
            4'h8: out_low = 9'h121;
            4'h9: out_low = 9'h121;
            4'ha: out_low = 9'h120;
            4'hb: out_low = 9'h120;
            4'hc: out_low = 9'h120;
            4'hd: out_low = 9'h120;
            4'he: out_low = 9'h11f;
            4'hf: out_low = 9'h11f;
            default: out_low = 9'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h11f;
            4'h1: out_low = 9'h11f;
            4'h2: out_low = 9'h11f;
            4'h3: out_low = 9'h11e;
            4'h4: out_low = 9'h11e;
            4'h5: out_low = 9'h11e;
            4'h6: out_low = 9'h11e;
            4'h7: out_low = 9'h11d;
            4'h8: out_low = 9'h11d;
            4'h9: out_low = 9'h11d;
            4'ha: out_low = 9'h11d;
            4'hb: out_low = 9'h11d;
            4'hc: out_low = 9'h11c;
            4'hd: out_low = 9'h11c;
            4'he: out_low = 9'h11c;
            4'hf: out_low = 9'h11c;
            default: out_low = 9'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h11b;
            4'h1: out_low = 9'h11b;
            4'h2: out_low = 9'h11b;
            4'h3: out_low = 9'h11b;
            4'h4: out_low = 9'h11b;
            4'h5: out_low = 9'h11a;
            4'h6: out_low = 9'h11a;
            4'h7: out_low = 9'h11a;
            4'h8: out_low = 9'h11a;
            4'h9: out_low = 9'h119;
            4'ha: out_low = 9'h119;
            4'hb: out_low = 9'h119;
            4'hc: out_low = 9'h119;
            4'hd: out_low = 9'h119;
            4'he: out_low = 9'h118;
            4'hf: out_low = 9'h118;
            default: out_low = 9'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h118;
            4'h1: out_low = 9'h118;
            4'h2: out_low = 9'h117;
            4'h3: out_low = 9'h117;
            4'h4: out_low = 9'h117;
            4'h5: out_low = 9'h117;
            4'h6: out_low = 9'h117;
            4'h7: out_low = 9'h116;
            4'h8: out_low = 9'h116;
            4'h9: out_low = 9'h116;
            4'ha: out_low = 9'h116;
            4'hb: out_low = 9'h115;
            4'hc: out_low = 9'h115;
            4'hd: out_low = 9'h115;
            4'he: out_low = 9'h115;
            4'hf: out_low = 9'h115;
            default: out_low = 9'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h114;
            4'h1: out_low = 9'h114;
            4'h2: out_low = 9'h114;
            4'h3: out_low = 9'h114;
            4'h4: out_low = 9'h114;
            4'h5: out_low = 9'h113;
            4'h6: out_low = 9'h113;
            4'h7: out_low = 9'h113;
            4'h8: out_low = 9'h113;
            4'h9: out_low = 9'h112;
            4'ha: out_low = 9'h112;
            4'hb: out_low = 9'h112;
            4'hc: out_low = 9'h112;
            4'hd: out_low = 9'h112;
            4'he: out_low = 9'h111;
            4'hf: out_low = 9'h111;
            default: out_low = 9'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h111;
            4'h1: out_low = 9'h111;
            4'h2: out_low = 9'h111;
            4'h3: out_low = 9'h110;
            4'h4: out_low = 9'h110;
            4'h5: out_low = 9'h110;
            4'h6: out_low = 9'h110;
            4'h7: out_low = 9'h10f;
            4'h8: out_low = 9'h10f;
            4'h9: out_low = 9'h10f;
            4'ha: out_low = 9'h10f;
            4'hb: out_low = 9'h10f;
            4'hc: out_low = 9'h10e;
            4'hd: out_low = 9'h10e;
            4'he: out_low = 9'h10e;
            4'hf: out_low = 9'h10e;
            default: out_low = 9'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h10e;
            4'h1: out_low = 9'h10d;
            4'h2: out_low = 9'h10d;
            4'h3: out_low = 9'h10d;
            4'h4: out_low = 9'h10d;
            4'h5: out_low = 9'h10c;
            4'h6: out_low = 9'h10c;
            4'h7: out_low = 9'h10c;
            4'h8: out_low = 9'h10c;
            4'h9: out_low = 9'h10c;
            4'ha: out_low = 9'h10b;
            4'hb: out_low = 9'h10b;
            4'hc: out_low = 9'h10b;
            4'hd: out_low = 9'h10b;
            4'he: out_low = 9'h10b;
            4'hf: out_low = 9'h10a;
            default: out_low = 9'h000;
          endcase
        end
        default: out_low = 9'h000;
      endcase
      end
      2'h2: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 9'h10a;
            4'h1: out_low = 9'h10a;
            4'h2: out_low = 9'h109;
            4'h3: out_low = 9'h109;
            4'h4: out_low = 9'h108;
            4'h5: out_low = 9'h108;
            4'h6: out_low = 9'h108;
            4'h7: out_low = 9'h107;
            4'h8: out_low = 9'h107;
            4'h9: out_low = 9'h106;
            4'ha: out_low = 9'h106;
            4'hb: out_low = 9'h106;
            4'hc: out_low = 9'h105;
            4'hd: out_low = 9'h105;
            4'he: out_low = 9'h104;
            4'hf: out_low = 9'h104;
            default: out_low = 9'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 9'h104;
            4'h1: out_low = 9'h103;
            4'h2: out_low = 9'h103;
            4'h3: out_low = 9'h102;
            4'h4: out_low = 9'h102;
            4'h5: out_low = 9'h101;
            4'h6: out_low = 9'h101;
            4'h7: out_low = 9'h101;
            4'h8: out_low = 9'h100;
            4'h9: out_low = 9'h100;
            4'ha: out_low = 9'h0ff;
            4'hb: out_low = 9'h0ff;
            4'hc: out_low = 9'h0ff;
            4'hd: out_low = 9'h0fe;
            4'he: out_low = 9'h0fe;
            4'hf: out_low = 9'h0fd;
            default: out_low = 9'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0fd;
            4'h1: out_low = 9'h0fd;
            4'h2: out_low = 9'h0fc;
            4'h3: out_low = 9'h0fc;
            4'h4: out_low = 9'h0fb;
            4'h5: out_low = 9'h0fb;
            4'h6: out_low = 9'h0fb;
            4'h7: out_low = 9'h0fa;
            4'h8: out_low = 9'h0fa;
            4'h9: out_low = 9'h0f9;
            4'ha: out_low = 9'h0f9;
            4'hb: out_low = 9'h0f9;
            4'hc: out_low = 9'h0f8;
            4'hd: out_low = 9'h0f8;
            4'he: out_low = 9'h0f7;
            4'hf: out_low = 9'h0f7;
            default: out_low = 9'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0f7;
            4'h1: out_low = 9'h0f6;
            4'h2: out_low = 9'h0f6;
            4'h3: out_low = 9'h0f5;
            4'h4: out_low = 9'h0f5;
            4'h5: out_low = 9'h0f5;
            4'h6: out_low = 9'h0f4;
            4'h7: out_low = 9'h0f4;
            4'h8: out_low = 9'h0f3;
            4'h9: out_low = 9'h0f3;
            4'ha: out_low = 9'h0f3;
            4'hb: out_low = 9'h0f2;
            4'hc: out_low = 9'h0f2;
            4'hd: out_low = 9'h0f2;
            4'he: out_low = 9'h0f1;
            4'hf: out_low = 9'h0f1;
            default: out_low = 9'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0f0;
            4'h1: out_low = 9'h0f0;
            4'h2: out_low = 9'h0f0;
            4'h3: out_low = 9'h0ef;
            4'h4: out_low = 9'h0ef;
            4'h5: out_low = 9'h0ee;
            4'h6: out_low = 9'h0ee;
            4'h7: out_low = 9'h0ee;
            4'h8: out_low = 9'h0ed;
            4'h9: out_low = 9'h0ed;
            4'ha: out_low = 9'h0ec;
            4'hb: out_low = 9'h0ec;
            4'hc: out_low = 9'h0ec;
            4'hd: out_low = 9'h0eb;
            4'he: out_low = 9'h0eb;
            4'hf: out_low = 9'h0eb;
            default: out_low = 9'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0ea;
            4'h1: out_low = 9'h0ea;
            4'h2: out_low = 9'h0e9;
            4'h3: out_low = 9'h0e9;
            4'h4: out_low = 9'h0e9;
            4'h5: out_low = 9'h0e8;
            4'h6: out_low = 9'h0e8;
            4'h7: out_low = 9'h0e8;
            4'h8: out_low = 9'h0e7;
            4'h9: out_low = 9'h0e7;
            4'ha: out_low = 9'h0e6;
            4'hb: out_low = 9'h0e6;
            4'hc: out_low = 9'h0e6;
            4'hd: out_low = 9'h0e5;
            4'he: out_low = 9'h0e5;
            4'hf: out_low = 9'h0e5;
            default: out_low = 9'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0e4;
            4'h1: out_low = 9'h0e4;
            4'h2: out_low = 9'h0e3;
            4'h3: out_low = 9'h0e3;
            4'h4: out_low = 9'h0e3;
            4'h5: out_low = 9'h0e2;
            4'h6: out_low = 9'h0e2;
            4'h7: out_low = 9'h0e2;
            4'h8: out_low = 9'h0e1;
            4'h9: out_low = 9'h0e1;
            4'ha: out_low = 9'h0e0;
            4'hb: out_low = 9'h0e0;
            4'hc: out_low = 9'h0e0;
            4'hd: out_low = 9'h0df;
            4'he: out_low = 9'h0df;
            4'hf: out_low = 9'h0df;
            default: out_low = 9'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0de;
            4'h1: out_low = 9'h0de;
            4'h2: out_low = 9'h0de;
            4'h3: out_low = 9'h0dd;
            4'h4: out_low = 9'h0dd;
            4'h5: out_low = 9'h0dc;
            4'h6: out_low = 9'h0dc;
            4'h7: out_low = 9'h0dc;
            4'h8: out_low = 9'h0db;
            4'h9: out_low = 9'h0db;
            4'ha: out_low = 9'h0db;
            4'hb: out_low = 9'h0da;
            4'hc: out_low = 9'h0da;
            4'hd: out_low = 9'h0da;
            4'he: out_low = 9'h0d9;
            4'hf: out_low = 9'h0d9;
            default: out_low = 9'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0d8;
            4'h1: out_low = 9'h0d8;
            4'h2: out_low = 9'h0d8;
            4'h3: out_low = 9'h0d7;
            4'h4: out_low = 9'h0d7;
            4'h5: out_low = 9'h0d7;
            4'h6: out_low = 9'h0d6;
            4'h7: out_low = 9'h0d6;
            4'h8: out_low = 9'h0d6;
            4'h9: out_low = 9'h0d5;
            4'ha: out_low = 9'h0d5;
            4'hb: out_low = 9'h0d5;
            4'hc: out_low = 9'h0d4;
            4'hd: out_low = 9'h0d4;
            4'he: out_low = 9'h0d4;
            4'hf: out_low = 9'h0d3;
            default: out_low = 9'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0d3;
            4'h1: out_low = 9'h0d2;
            4'h2: out_low = 9'h0d2;
            4'h3: out_low = 9'h0d2;
            4'h4: out_low = 9'h0d1;
            4'h5: out_low = 9'h0d1;
            4'h6: out_low = 9'h0d1;
            4'h7: out_low = 9'h0d0;
            4'h8: out_low = 9'h0d0;
            4'h9: out_low = 9'h0d0;
            4'ha: out_low = 9'h0cf;
            4'hb: out_low = 9'h0cf;
            4'hc: out_low = 9'h0cf;
            4'hd: out_low = 9'h0ce;
            4'he: out_low = 9'h0ce;
            4'hf: out_low = 9'h0ce;
            default: out_low = 9'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0cd;
            4'h1: out_low = 9'h0cd;
            4'h2: out_low = 9'h0cd;
            4'h3: out_low = 9'h0cc;
            4'h4: out_low = 9'h0cc;
            4'h5: out_low = 9'h0cb;
            4'h6: out_low = 9'h0cb;
            4'h7: out_low = 9'h0cb;
            4'h8: out_low = 9'h0ca;
            4'h9: out_low = 9'h0ca;
            4'ha: out_low = 9'h0ca;
            4'hb: out_low = 9'h0c9;
            4'hc: out_low = 9'h0c9;
            4'hd: out_low = 9'h0c9;
            4'he: out_low = 9'h0c8;
            4'hf: out_low = 9'h0c8;
            default: out_low = 9'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0c8;
            4'h1: out_low = 9'h0c7;
            4'h2: out_low = 9'h0c7;
            4'h3: out_low = 9'h0c7;
            4'h4: out_low = 9'h0c6;
            4'h5: out_low = 9'h0c6;
            4'h6: out_low = 9'h0c6;
            4'h7: out_low = 9'h0c5;
            4'h8: out_low = 9'h0c5;
            4'h9: out_low = 9'h0c5;
            4'ha: out_low = 9'h0c4;
            4'hb: out_low = 9'h0c4;
            4'hc: out_low = 9'h0c4;
            4'hd: out_low = 9'h0c3;
            4'he: out_low = 9'h0c3;
            4'hf: out_low = 9'h0c3;
            default: out_low = 9'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0c2;
            4'h1: out_low = 9'h0c2;
            4'h2: out_low = 9'h0c2;
            4'h3: out_low = 9'h0c1;
            4'h4: out_low = 9'h0c1;
            4'h5: out_low = 9'h0c1;
            4'h6: out_low = 9'h0c0;
            4'h7: out_low = 9'h0c0;
            4'h8: out_low = 9'h0c0;
            4'h9: out_low = 9'h0bf;
            4'ha: out_low = 9'h0bf;
            4'hb: out_low = 9'h0bf;
            4'hc: out_low = 9'h0be;
            4'hd: out_low = 9'h0be;
            4'he: out_low = 9'h0be;
            4'hf: out_low = 9'h0bd;
            default: out_low = 9'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0bd;
            4'h1: out_low = 9'h0bd;
            4'h2: out_low = 9'h0bc;
            4'h3: out_low = 9'h0bc;
            4'h4: out_low = 9'h0bc;
            4'h5: out_low = 9'h0bb;
            4'h6: out_low = 9'h0bb;
            4'h7: out_low = 9'h0bb;
            4'h8: out_low = 9'h0ba;
            4'h9: out_low = 9'h0ba;
            4'ha: out_low = 9'h0ba;
            4'hb: out_low = 9'h0b9;
            4'hc: out_low = 9'h0b9;
            4'hd: out_low = 9'h0b9;
            4'he: out_low = 9'h0b8;
            4'hf: out_low = 9'h0b8;
            default: out_low = 9'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0b8;
            4'h1: out_low = 9'h0b8;
            4'h2: out_low = 9'h0b7;
            4'h3: out_low = 9'h0b7;
            4'h4: out_low = 9'h0b7;
            4'h5: out_low = 9'h0b6;
            4'h6: out_low = 9'h0b6;
            4'h7: out_low = 9'h0b6;
            4'h8: out_low = 9'h0b5;
            4'h9: out_low = 9'h0b5;
            4'ha: out_low = 9'h0b5;
            4'hb: out_low = 9'h0b4;
            4'hc: out_low = 9'h0b4;
            4'hd: out_low = 9'h0b4;
            4'he: out_low = 9'h0b3;
            4'hf: out_low = 9'h0b3;
            default: out_low = 9'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0b3;
            4'h1: out_low = 9'h0b2;
            4'h2: out_low = 9'h0b2;
            4'h3: out_low = 9'h0b2;
            4'h4: out_low = 9'h0b1;
            4'h5: out_low = 9'h0b1;
            4'h6: out_low = 9'h0b1;
            4'h7: out_low = 9'h0b0;
            4'h8: out_low = 9'h0b0;
            4'h9: out_low = 9'h0b0;
            4'ha: out_low = 9'h0b0;
            4'hb: out_low = 9'h0af;
            4'hc: out_low = 9'h0af;
            4'hd: out_low = 9'h0af;
            4'he: out_low = 9'h0ae;
            4'hf: out_low = 9'h0ae;
            default: out_low = 9'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0ae;
            4'h1: out_low = 9'h0ad;
            4'h2: out_low = 9'h0ad;
            4'h3: out_low = 9'h0ad;
            4'h4: out_low = 9'h0ac;
            4'h5: out_low = 9'h0ac;
            4'h6: out_low = 9'h0ac;
            4'h7: out_low = 9'h0ac;
            4'h8: out_low = 9'h0ab;
            4'h9: out_low = 9'h0ab;
            4'ha: out_low = 9'h0ab;
            4'hb: out_low = 9'h0aa;
            4'hc: out_low = 9'h0aa;
            4'hd: out_low = 9'h0aa;
            4'he: out_low = 9'h0a9;
            4'hf: out_low = 9'h0a9;
            default: out_low = 9'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0a9;
            4'h1: out_low = 9'h0a8;
            4'h2: out_low = 9'h0a8;
            4'h3: out_low = 9'h0a8;
            4'h4: out_low = 9'h0a8;
            4'h5: out_low = 9'h0a7;
            4'h6: out_low = 9'h0a7;
            4'h7: out_low = 9'h0a7;
            4'h8: out_low = 9'h0a6;
            4'h9: out_low = 9'h0a6;
            4'ha: out_low = 9'h0a6;
            4'hb: out_low = 9'h0a5;
            4'hc: out_low = 9'h0a5;
            4'hd: out_low = 9'h0a5;
            4'he: out_low = 9'h0a4;
            4'hf: out_low = 9'h0a4;
            default: out_low = 9'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 9'h0a4;
            4'h1: out_low = 9'h0a4;
            4'h2: out_low = 9'h0a3;
            4'h3: out_low = 9'h0a3;
            4'h4: out_low = 9'h0a3;
            4'h5: out_low = 9'h0a2;
            4'h6: out_low = 9'h0a2;
            4'h7: out_low = 9'h0a2;
            4'h8: out_low = 9'h0a1;
            4'h9: out_low = 9'h0a1;
            4'ha: out_low = 9'h0a1;
            4'hb: out_low = 9'h0a1;
            4'hc: out_low = 9'h0a0;
            4'hd: out_low = 9'h0a0;
            4'he: out_low = 9'h0a0;
            4'hf: out_low = 9'h09f;
            default: out_low = 9'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 9'h09f;
            4'h1: out_low = 9'h09f;
            4'h2: out_low = 9'h09e;
            4'h3: out_low = 9'h09e;
            4'h4: out_low = 9'h09e;
            4'h5: out_low = 9'h09e;
            4'h6: out_low = 9'h09d;
            4'h7: out_low = 9'h09d;
            4'h8: out_low = 9'h09d;
            4'h9: out_low = 9'h09c;
            4'ha: out_low = 9'h09c;
            4'hb: out_low = 9'h09c;
            4'hc: out_low = 9'h09c;
            4'hd: out_low = 9'h09b;
            4'he: out_low = 9'h09b;
            4'hf: out_low = 9'h09b;
            default: out_low = 9'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 9'h09a;
            4'h1: out_low = 9'h09a;
            4'h2: out_low = 9'h09a;
            4'h3: out_low = 9'h099;
            4'h4: out_low = 9'h099;
            4'h5: out_low = 9'h099;
            4'h6: out_low = 9'h099;
            4'h7: out_low = 9'h098;
            4'h8: out_low = 9'h098;
            4'h9: out_low = 9'h098;
            4'ha: out_low = 9'h097;
            4'hb: out_low = 9'h097;
            4'hc: out_low = 9'h097;
            4'hd: out_low = 9'h097;
            4'he: out_low = 9'h096;
            4'hf: out_low = 9'h096;
            default: out_low = 9'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 9'h096;
            4'h1: out_low = 9'h095;
            4'h2: out_low = 9'h095;
            4'h3: out_low = 9'h095;
            4'h4: out_low = 9'h095;
            4'h5: out_low = 9'h094;
            4'h6: out_low = 9'h094;
            4'h7: out_low = 9'h094;
            4'h8: out_low = 9'h093;
            4'h9: out_low = 9'h093;
            4'ha: out_low = 9'h093;
            4'hb: out_low = 9'h093;
            4'hc: out_low = 9'h092;
            4'hd: out_low = 9'h092;
            4'he: out_low = 9'h092;
            4'hf: out_low = 9'h091;
            default: out_low = 9'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 9'h091;
            4'h1: out_low = 9'h091;
            4'h2: out_low = 9'h091;
            4'h3: out_low = 9'h090;
            4'h4: out_low = 9'h090;
            4'h5: out_low = 9'h090;
            4'h6: out_low = 9'h08f;
            4'h7: out_low = 9'h08f;
            4'h8: out_low = 9'h08f;
            4'h9: out_low = 9'h08f;
            4'ha: out_low = 9'h08e;
            4'hb: out_low = 9'h08e;
            4'hc: out_low = 9'h08e;
            4'hd: out_low = 9'h08d;
            4'he: out_low = 9'h08d;
            4'hf: out_low = 9'h08d;
            default: out_low = 9'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 9'h08d;
            4'h1: out_low = 9'h08c;
            4'h2: out_low = 9'h08c;
            4'h3: out_low = 9'h08c;
            4'h4: out_low = 9'h08c;
            4'h5: out_low = 9'h08b;
            4'h6: out_low = 9'h08b;
            4'h7: out_low = 9'h08b;
            4'h8: out_low = 9'h08a;
            4'h9: out_low = 9'h08a;
            4'ha: out_low = 9'h08a;
            4'hb: out_low = 9'h08a;
            4'hc: out_low = 9'h089;
            4'hd: out_low = 9'h089;
            4'he: out_low = 9'h089;
            4'hf: out_low = 9'h089;
            default: out_low = 9'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 9'h088;
            4'h1: out_low = 9'h088;
            4'h2: out_low = 9'h088;
            4'h3: out_low = 9'h087;
            4'h4: out_low = 9'h087;
            4'h5: out_low = 9'h087;
            4'h6: out_low = 9'h087;
            4'h7: out_low = 9'h086;
            4'h8: out_low = 9'h086;
            4'h9: out_low = 9'h086;
            4'ha: out_low = 9'h085;
            4'hb: out_low = 9'h085;
            4'hc: out_low = 9'h085;
            4'hd: out_low = 9'h085;
            4'he: out_low = 9'h084;
            4'hf: out_low = 9'h084;
            default: out_low = 9'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 9'h084;
            4'h1: out_low = 9'h084;
            4'h2: out_low = 9'h083;
            4'h3: out_low = 9'h083;
            4'h4: out_low = 9'h083;
            4'h5: out_low = 9'h083;
            4'h6: out_low = 9'h082;
            4'h7: out_low = 9'h082;
            4'h8: out_low = 9'h082;
            4'h9: out_low = 9'h081;
            4'ha: out_low = 9'h081;
            4'hb: out_low = 9'h081;
            4'hc: out_low = 9'h081;
            4'hd: out_low = 9'h080;
            4'he: out_low = 9'h080;
            4'hf: out_low = 9'h080;
            default: out_low = 9'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h080;
            4'h1: out_low = 9'h07f;
            4'h2: out_low = 9'h07f;
            4'h3: out_low = 9'h07f;
            4'h4: out_low = 9'h07f;
            4'h5: out_low = 9'h07e;
            4'h6: out_low = 9'h07e;
            4'h7: out_low = 9'h07e;
            4'h8: out_low = 9'h07d;
            4'h9: out_low = 9'h07d;
            4'ha: out_low = 9'h07d;
            4'hb: out_low = 9'h07d;
            4'hc: out_low = 9'h07c;
            4'hd: out_low = 9'h07c;
            4'he: out_low = 9'h07c;
            4'hf: out_low = 9'h07c;
            default: out_low = 9'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h07b;
            4'h1: out_low = 9'h07b;
            4'h2: out_low = 9'h07b;
            4'h3: out_low = 9'h07b;
            4'h4: out_low = 9'h07a;
            4'h5: out_low = 9'h07a;
            4'h6: out_low = 9'h07a;
            4'h7: out_low = 9'h07a;
            4'h8: out_low = 9'h079;
            4'h9: out_low = 9'h079;
            4'ha: out_low = 9'h079;
            4'hb: out_low = 9'h078;
            4'hc: out_low = 9'h078;
            4'hd: out_low = 9'h078;
            4'he: out_low = 9'h078;
            4'hf: out_low = 9'h077;
            default: out_low = 9'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h077;
            4'h1: out_low = 9'h077;
            4'h2: out_low = 9'h077;
            4'h3: out_low = 9'h076;
            4'h4: out_low = 9'h076;
            4'h5: out_low = 9'h076;
            4'h6: out_low = 9'h076;
            4'h7: out_low = 9'h075;
            4'h8: out_low = 9'h075;
            4'h9: out_low = 9'h075;
            4'ha: out_low = 9'h075;
            4'hb: out_low = 9'h074;
            4'hc: out_low = 9'h074;
            4'hd: out_low = 9'h074;
            4'he: out_low = 9'h074;
            4'hf: out_low = 9'h073;
            default: out_low = 9'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h073;
            4'h1: out_low = 9'h073;
            4'h2: out_low = 9'h073;
            4'h3: out_low = 9'h072;
            4'h4: out_low = 9'h072;
            4'h5: out_low = 9'h072;
            4'h6: out_low = 9'h072;
            4'h7: out_low = 9'h071;
            4'h8: out_low = 9'h071;
            4'h9: out_low = 9'h071;
            4'ha: out_low = 9'h071;
            4'hb: out_low = 9'h070;
            4'hc: out_low = 9'h070;
            4'hd: out_low = 9'h070;
            4'he: out_low = 9'h06f;
            4'hf: out_low = 9'h06f;
            default: out_low = 9'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h06f;
            4'h1: out_low = 9'h06f;
            4'h2: out_low = 9'h06e;
            4'h3: out_low = 9'h06e;
            4'h4: out_low = 9'h06e;
            4'h5: out_low = 9'h06e;
            4'h6: out_low = 9'h06d;
            4'h7: out_low = 9'h06d;
            4'h8: out_low = 9'h06d;
            4'h9: out_low = 9'h06d;
            4'ha: out_low = 9'h06c;
            4'hb: out_low = 9'h06c;
            4'hc: out_low = 9'h06c;
            4'hd: out_low = 9'h06c;
            4'he: out_low = 9'h06b;
            4'hf: out_low = 9'h06b;
            default: out_low = 9'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h06b;
            4'h1: out_low = 9'h06b;
            4'h2: out_low = 9'h06b;
            4'h3: out_low = 9'h06a;
            4'h4: out_low = 9'h06a;
            4'h5: out_low = 9'h06a;
            4'h6: out_low = 9'h06a;
            4'h7: out_low = 9'h069;
            4'h8: out_low = 9'h069;
            4'h9: out_low = 9'h069;
            4'ha: out_low = 9'h069;
            4'hb: out_low = 9'h068;
            4'hc: out_low = 9'h068;
            4'hd: out_low = 9'h068;
            4'he: out_low = 9'h068;
            4'hf: out_low = 9'h067;
            default: out_low = 9'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 9'h067;
            4'h1: out_low = 9'h067;
            4'h2: out_low = 9'h067;
            4'h3: out_low = 9'h066;
            4'h4: out_low = 9'h066;
            4'h5: out_low = 9'h066;
            4'h6: out_low = 9'h066;
            4'h7: out_low = 9'h065;
            4'h8: out_low = 9'h065;
            4'h9: out_low = 9'h065;
            4'ha: out_low = 9'h065;
            4'hb: out_low = 9'h064;
            4'hc: out_low = 9'h064;
            4'hd: out_low = 9'h064;
            4'he: out_low = 9'h064;
            4'hf: out_low = 9'h063;
            default: out_low = 9'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 9'h063;
            4'h1: out_low = 9'h063;
            4'h2: out_low = 9'h063;
            4'h3: out_low = 9'h062;
            4'h4: out_low = 9'h062;
            4'h5: out_low = 9'h062;
            4'h6: out_low = 9'h062;
            4'h7: out_low = 9'h061;
            4'h8: out_low = 9'h061;
            4'h9: out_low = 9'h061;
            4'ha: out_low = 9'h061;
            4'hb: out_low = 9'h061;
            4'hc: out_low = 9'h060;
            4'hd: out_low = 9'h060;
            4'he: out_low = 9'h060;
            4'hf: out_low = 9'h060;
            default: out_low = 9'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 9'h05f;
            4'h1: out_low = 9'h05f;
            4'h2: out_low = 9'h05f;
            4'h3: out_low = 9'h05f;
            4'h4: out_low = 9'h05e;
            4'h5: out_low = 9'h05e;
            4'h6: out_low = 9'h05e;
            4'h7: out_low = 9'h05e;
            4'h8: out_low = 9'h05d;
            4'h9: out_low = 9'h05d;
            4'ha: out_low = 9'h05d;
            4'hb: out_low = 9'h05d;
            4'hc: out_low = 9'h05c;
            4'hd: out_low = 9'h05c;
            4'he: out_low = 9'h05c;
            4'hf: out_low = 9'h05c;
            default: out_low = 9'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 9'h05c;
            4'h1: out_low = 9'h05b;
            4'h2: out_low = 9'h05b;
            4'h3: out_low = 9'h05b;
            4'h4: out_low = 9'h05b;
            4'h5: out_low = 9'h05a;
            4'h6: out_low = 9'h05a;
            4'h7: out_low = 9'h05a;
            4'h8: out_low = 9'h05a;
            4'h9: out_low = 9'h059;
            4'ha: out_low = 9'h059;
            4'hb: out_low = 9'h059;
            4'hc: out_low = 9'h059;
            4'hd: out_low = 9'h059;
            4'he: out_low = 9'h058;
            4'hf: out_low = 9'h058;
            default: out_low = 9'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 9'h058;
            4'h1: out_low = 9'h058;
            4'h2: out_low = 9'h057;
            4'h3: out_low = 9'h057;
            4'h4: out_low = 9'h057;
            4'h5: out_low = 9'h057;
            4'h6: out_low = 9'h056;
            4'h7: out_low = 9'h056;
            4'h8: out_low = 9'h056;
            4'h9: out_low = 9'h056;
            4'ha: out_low = 9'h056;
            4'hb: out_low = 9'h055;
            4'hc: out_low = 9'h055;
            4'hd: out_low = 9'h055;
            4'he: out_low = 9'h055;
            4'hf: out_low = 9'h054;
            default: out_low = 9'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 9'h054;
            4'h1: out_low = 9'h054;
            4'h2: out_low = 9'h054;
            4'h3: out_low = 9'h053;
            4'h4: out_low = 9'h053;
            4'h5: out_low = 9'h053;
            4'h6: out_low = 9'h053;
            4'h7: out_low = 9'h053;
            4'h8: out_low = 9'h052;
            4'h9: out_low = 9'h052;
            4'ha: out_low = 9'h052;
            4'hb: out_low = 9'h052;
            4'hc: out_low = 9'h051;
            4'hd: out_low = 9'h051;
            4'he: out_low = 9'h051;
            4'hf: out_low = 9'h051;
            default: out_low = 9'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 9'h051;
            4'h1: out_low = 9'h050;
            4'h2: out_low = 9'h050;
            4'h3: out_low = 9'h050;
            4'h4: out_low = 9'h050;
            4'h5: out_low = 9'h04f;
            4'h6: out_low = 9'h04f;
            4'h7: out_low = 9'h04f;
            4'h8: out_low = 9'h04f;
            4'h9: out_low = 9'h04e;
            4'ha: out_low = 9'h04e;
            4'hb: out_low = 9'h04e;
            4'hc: out_low = 9'h04e;
            4'hd: out_low = 9'h04e;
            4'he: out_low = 9'h04d;
            4'hf: out_low = 9'h04d;
            default: out_low = 9'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 9'h04d;
            4'h1: out_low = 9'h04d;
            4'h2: out_low = 9'h04c;
            4'h3: out_low = 9'h04c;
            4'h4: out_low = 9'h04c;
            4'h5: out_low = 9'h04c;
            4'h6: out_low = 9'h04c;
            4'h7: out_low = 9'h04b;
            4'h8: out_low = 9'h04b;
            4'h9: out_low = 9'h04b;
            4'ha: out_low = 9'h04b;
            4'hb: out_low = 9'h04a;
            4'hc: out_low = 9'h04a;
            4'hd: out_low = 9'h04a;
            4'he: out_low = 9'h04a;
            4'hf: out_low = 9'h04a;
            default: out_low = 9'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 9'h049;
            4'h1: out_low = 9'h049;
            4'h2: out_low = 9'h049;
            4'h3: out_low = 9'h049;
            4'h4: out_low = 9'h049;
            4'h5: out_low = 9'h048;
            4'h6: out_low = 9'h048;
            4'h7: out_low = 9'h048;
            4'h8: out_low = 9'h048;
            4'h9: out_low = 9'h047;
            4'ha: out_low = 9'h047;
            4'hb: out_low = 9'h047;
            4'hc: out_low = 9'h047;
            4'hd: out_low = 9'h047;
            4'he: out_low = 9'h046;
            4'hf: out_low = 9'h046;
            default: out_low = 9'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 9'h046;
            4'h1: out_low = 9'h046;
            4'h2: out_low = 9'h045;
            4'h3: out_low = 9'h045;
            4'h4: out_low = 9'h045;
            4'h5: out_low = 9'h045;
            4'h6: out_low = 9'h045;
            4'h7: out_low = 9'h044;
            4'h8: out_low = 9'h044;
            4'h9: out_low = 9'h044;
            4'ha: out_low = 9'h044;
            4'hb: out_low = 9'h044;
            4'hc: out_low = 9'h043;
            4'hd: out_low = 9'h043;
            4'he: out_low = 9'h043;
            4'hf: out_low = 9'h043;
            default: out_low = 9'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h042;
            4'h1: out_low = 9'h042;
            4'h2: out_low = 9'h042;
            4'h3: out_low = 9'h042;
            4'h4: out_low = 9'h042;
            4'h5: out_low = 9'h041;
            4'h6: out_low = 9'h041;
            4'h7: out_low = 9'h041;
            4'h8: out_low = 9'h041;
            4'h9: out_low = 9'h041;
            4'ha: out_low = 9'h040;
            4'hb: out_low = 9'h040;
            4'hc: out_low = 9'h040;
            4'hd: out_low = 9'h040;
            4'he: out_low = 9'h03f;
            4'hf: out_low = 9'h03f;
            default: out_low = 9'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h03f;
            4'h1: out_low = 9'h03f;
            4'h2: out_low = 9'h03f;
            4'h3: out_low = 9'h03e;
            4'h4: out_low = 9'h03e;
            4'h5: out_low = 9'h03e;
            4'h6: out_low = 9'h03e;
            4'h7: out_low = 9'h03e;
            4'h8: out_low = 9'h03d;
            4'h9: out_low = 9'h03d;
            4'ha: out_low = 9'h03d;
            4'hb: out_low = 9'h03d;
            4'hc: out_low = 9'h03d;
            4'hd: out_low = 9'h03c;
            4'he: out_low = 9'h03c;
            4'hf: out_low = 9'h03c;
            default: out_low = 9'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h03c;
            4'h1: out_low = 9'h03b;
            4'h2: out_low = 9'h03b;
            4'h3: out_low = 9'h03b;
            4'h4: out_low = 9'h03b;
            4'h5: out_low = 9'h03b;
            4'h6: out_low = 9'h03a;
            4'h7: out_low = 9'h03a;
            4'h8: out_low = 9'h03a;
            4'h9: out_low = 9'h03a;
            4'ha: out_low = 9'h03a;
            4'hb: out_low = 9'h039;
            4'hc: out_low = 9'h039;
            4'hd: out_low = 9'h039;
            4'he: out_low = 9'h039;
            4'hf: out_low = 9'h039;
            default: out_low = 9'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h038;
            4'h1: out_low = 9'h038;
            4'h2: out_low = 9'h038;
            4'h3: out_low = 9'h038;
            4'h4: out_low = 9'h038;
            4'h5: out_low = 9'h037;
            4'h6: out_low = 9'h037;
            4'h7: out_low = 9'h037;
            4'h8: out_low = 9'h037;
            4'h9: out_low = 9'h036;
            4'ha: out_low = 9'h036;
            4'hb: out_low = 9'h036;
            4'hc: out_low = 9'h036;
            4'hd: out_low = 9'h036;
            4'he: out_low = 9'h035;
            4'hf: out_low = 9'h035;
            default: out_low = 9'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h035;
            4'h1: out_low = 9'h035;
            4'h2: out_low = 9'h035;
            4'h3: out_low = 9'h034;
            4'h4: out_low = 9'h034;
            4'h5: out_low = 9'h034;
            4'h6: out_low = 9'h034;
            4'h7: out_low = 9'h034;
            4'h8: out_low = 9'h033;
            4'h9: out_low = 9'h033;
            4'ha: out_low = 9'h033;
            4'hb: out_low = 9'h033;
            4'hc: out_low = 9'h033;
            4'hd: out_low = 9'h032;
            4'he: out_low = 9'h032;
            4'hf: out_low = 9'h032;
            default: out_low = 9'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h032;
            4'h1: out_low = 9'h032;
            4'h2: out_low = 9'h031;
            4'h3: out_low = 9'h031;
            4'h4: out_low = 9'h031;
            4'h5: out_low = 9'h031;
            4'h6: out_low = 9'h031;
            4'h7: out_low = 9'h030;
            4'h8: out_low = 9'h030;
            4'h9: out_low = 9'h030;
            4'ha: out_low = 9'h030;
            4'hb: out_low = 9'h030;
            4'hc: out_low = 9'h02f;
            4'hd: out_low = 9'h02f;
            4'he: out_low = 9'h02f;
            4'hf: out_low = 9'h02f;
            default: out_low = 9'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 9'h02f;
            4'h1: out_low = 9'h02e;
            4'h2: out_low = 9'h02e;
            4'h3: out_low = 9'h02e;
            4'h4: out_low = 9'h02e;
            4'h5: out_low = 9'h02e;
            4'h6: out_low = 9'h02d;
            4'h7: out_low = 9'h02d;
            4'h8: out_low = 9'h02d;
            4'h9: out_low = 9'h02d;
            4'ha: out_low = 9'h02d;
            4'hb: out_low = 9'h02c;
            4'hc: out_low = 9'h02c;
            4'hd: out_low = 9'h02c;
            4'he: out_low = 9'h02c;
            4'hf: out_low = 9'h02c;
            default: out_low = 9'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 9'h02b;
            4'h1: out_low = 9'h02b;
            4'h2: out_low = 9'h02b;
            4'h3: out_low = 9'h02b;
            4'h4: out_low = 9'h02b;
            4'h5: out_low = 9'h02a;
            4'h6: out_low = 9'h02a;
            4'h7: out_low = 9'h02a;
            4'h8: out_low = 9'h02a;
            4'h9: out_low = 9'h02a;
            4'ha: out_low = 9'h029;
            4'hb: out_low = 9'h029;
            4'hc: out_low = 9'h029;
            4'hd: out_low = 9'h029;
            4'he: out_low = 9'h029;
            4'hf: out_low = 9'h029;
            default: out_low = 9'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 9'h028;
            4'h1: out_low = 9'h028;
            4'h2: out_low = 9'h028;
            4'h3: out_low = 9'h028;
            4'h4: out_low = 9'h028;
            4'h5: out_low = 9'h027;
            4'h6: out_low = 9'h027;
            4'h7: out_low = 9'h027;
            4'h8: out_low = 9'h027;
            4'h9: out_low = 9'h027;
            4'ha: out_low = 9'h026;
            4'hb: out_low = 9'h026;
            4'hc: out_low = 9'h026;
            4'hd: out_low = 9'h026;
            4'he: out_low = 9'h026;
            4'hf: out_low = 9'h025;
            default: out_low = 9'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 9'h025;
            4'h1: out_low = 9'h025;
            4'h2: out_low = 9'h025;
            4'h3: out_low = 9'h025;
            4'h4: out_low = 9'h024;
            4'h5: out_low = 9'h024;
            4'h6: out_low = 9'h024;
            4'h7: out_low = 9'h024;
            4'h8: out_low = 9'h024;
            4'h9: out_low = 9'h023;
            4'ha: out_low = 9'h023;
            4'hb: out_low = 9'h023;
            4'hc: out_low = 9'h023;
            4'hd: out_low = 9'h023;
            4'he: out_low = 9'h023;
            4'hf: out_low = 9'h022;
            default: out_low = 9'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 9'h022;
            4'h1: out_low = 9'h022;
            4'h2: out_low = 9'h022;
            4'h3: out_low = 9'h022;
            4'h4: out_low = 9'h021;
            4'h5: out_low = 9'h021;
            4'h6: out_low = 9'h021;
            4'h7: out_low = 9'h021;
            4'h8: out_low = 9'h021;
            4'h9: out_low = 9'h020;
            4'ha: out_low = 9'h020;
            4'hb: out_low = 9'h020;
            4'hc: out_low = 9'h020;
            4'hd: out_low = 9'h020;
            4'he: out_low = 9'h020;
            4'hf: out_low = 9'h01f;
            default: out_low = 9'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 9'h01f;
            4'h1: out_low = 9'h01f;
            4'h2: out_low = 9'h01f;
            4'h3: out_low = 9'h01f;
            4'h4: out_low = 9'h01e;
            4'h5: out_low = 9'h01e;
            4'h6: out_low = 9'h01e;
            4'h7: out_low = 9'h01e;
            4'h8: out_low = 9'h01e;
            4'h9: out_low = 9'h01d;
            4'ha: out_low = 9'h01d;
            4'hb: out_low = 9'h01d;
            4'hc: out_low = 9'h01d;
            4'hd: out_low = 9'h01d;
            4'he: out_low = 9'h01d;
            4'hf: out_low = 9'h01c;
            default: out_low = 9'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 9'h01c;
            4'h1: out_low = 9'h01c;
            4'h2: out_low = 9'h01c;
            4'h3: out_low = 9'h01c;
            4'h4: out_low = 9'h01b;
            4'h5: out_low = 9'h01b;
            4'h6: out_low = 9'h01b;
            4'h7: out_low = 9'h01b;
            4'h8: out_low = 9'h01b;
            4'h9: out_low = 9'h01a;
            4'ha: out_low = 9'h01a;
            4'hb: out_low = 9'h01a;
            4'hc: out_low = 9'h01a;
            4'hd: out_low = 9'h01a;
            4'he: out_low = 9'h01a;
            4'hf: out_low = 9'h019;
            default: out_low = 9'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 9'h019;
            4'h1: out_low = 9'h019;
            4'h2: out_low = 9'h019;
            4'h3: out_low = 9'h019;
            4'h4: out_low = 9'h018;
            4'h5: out_low = 9'h018;
            4'h6: out_low = 9'h018;
            4'h7: out_low = 9'h018;
            4'h8: out_low = 9'h018;
            4'h9: out_low = 9'h018;
            4'ha: out_low = 9'h017;
            4'hb: out_low = 9'h017;
            4'hc: out_low = 9'h017;
            4'hd: out_low = 9'h017;
            4'he: out_low = 9'h017;
            4'hf: out_low = 9'h016;
            default: out_low = 9'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 9'h016;
            4'h1: out_low = 9'h016;
            4'h2: out_low = 9'h016;
            4'h3: out_low = 9'h016;
            4'h4: out_low = 9'h016;
            4'h5: out_low = 9'h015;
            4'h6: out_low = 9'h015;
            4'h7: out_low = 9'h015;
            4'h8: out_low = 9'h015;
            4'h9: out_low = 9'h015;
            4'ha: out_low = 9'h014;
            4'hb: out_low = 9'h014;
            4'hc: out_low = 9'h014;
            4'hd: out_low = 9'h014;
            4'he: out_low = 9'h014;
            4'hf: out_low = 9'h014;
            default: out_low = 9'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 9'h013;
            4'h1: out_low = 9'h013;
            4'h2: out_low = 9'h013;
            4'h3: out_low = 9'h013;
            4'h4: out_low = 9'h013;
            4'h5: out_low = 9'h012;
            4'h6: out_low = 9'h012;
            4'h7: out_low = 9'h012;
            4'h8: out_low = 9'h012;
            4'h9: out_low = 9'h012;
            4'ha: out_low = 9'h012;
            4'hb: out_low = 9'h011;
            4'hc: out_low = 9'h011;
            4'hd: out_low = 9'h011;
            4'he: out_low = 9'h011;
            4'hf: out_low = 9'h011;
            default: out_low = 9'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 9'h011;
            4'h1: out_low = 9'h010;
            4'h2: out_low = 9'h010;
            4'h3: out_low = 9'h010;
            4'h4: out_low = 9'h010;
            4'h5: out_low = 9'h010;
            4'h6: out_low = 9'h00f;
            4'h7: out_low = 9'h00f;
            4'h8: out_low = 9'h00f;
            4'h9: out_low = 9'h00f;
            4'ha: out_low = 9'h00f;
            4'hb: out_low = 9'h00f;
            4'hc: out_low = 9'h00e;
            4'hd: out_low = 9'h00e;
            4'he: out_low = 9'h00e;
            4'hf: out_low = 9'h00e;
            default: out_low = 9'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 9'h00e;
            4'h1: out_low = 9'h00e;
            4'h2: out_low = 9'h00d;
            4'h3: out_low = 9'h00d;
            4'h4: out_low = 9'h00d;
            4'h5: out_low = 9'h00d;
            4'h6: out_low = 9'h00d;
            4'h7: out_low = 9'h00c;
            4'h8: out_low = 9'h00c;
            4'h9: out_low = 9'h00c;
            4'ha: out_low = 9'h00c;
            4'hb: out_low = 9'h00c;
            4'hc: out_low = 9'h00c;
            4'hd: out_low = 9'h00b;
            4'he: out_low = 9'h00b;
            4'hf: out_low = 9'h00b;
            default: out_low = 9'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 9'h00b;
            4'h1: out_low = 9'h00b;
            4'h2: out_low = 9'h00b;
            4'h3: out_low = 9'h00a;
            4'h4: out_low = 9'h00a;
            4'h5: out_low = 9'h00a;
            4'h6: out_low = 9'h00a;
            4'h7: out_low = 9'h00a;
            4'h8: out_low = 9'h00a;
            4'h9: out_low = 9'h009;
            4'ha: out_low = 9'h009;
            4'hb: out_low = 9'h009;
            4'hc: out_low = 9'h009;
            4'hd: out_low = 9'h009;
            4'he: out_low = 9'h008;
            4'hf: out_low = 9'h008;
            default: out_low = 9'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 9'h008;
            4'h1: out_low = 9'h008;
            4'h2: out_low = 9'h008;
            4'h3: out_low = 9'h008;
            4'h4: out_low = 9'h007;
            4'h5: out_low = 9'h007;
            4'h6: out_low = 9'h007;
            4'h7: out_low = 9'h007;
            4'h8: out_low = 9'h007;
            4'h9: out_low = 9'h007;
            4'ha: out_low = 9'h006;
            4'hb: out_low = 9'h006;
            4'hc: out_low = 9'h006;
            4'hd: out_low = 9'h006;
            4'he: out_low = 9'h006;
            4'hf: out_low = 9'h006;
            default: out_low = 9'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 9'h005;
            4'h1: out_low = 9'h005;
            4'h2: out_low = 9'h005;
            4'h3: out_low = 9'h005;
            4'h4: out_low = 9'h005;
            4'h5: out_low = 9'h005;
            4'h6: out_low = 9'h004;
            4'h7: out_low = 9'h004;
            4'h8: out_low = 9'h004;
            4'h9: out_low = 9'h004;
            4'ha: out_low = 9'h004;
            4'hb: out_low = 9'h004;
            4'hc: out_low = 9'h003;
            4'hd: out_low = 9'h003;
            4'he: out_low = 9'h003;
            4'hf: out_low = 9'h003;
            default: out_low = 9'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 9'h003;
            4'h1: out_low = 9'h003;
            4'h2: out_low = 9'h002;
            4'h3: out_low = 9'h002;
            4'h4: out_low = 9'h002;
            4'h5: out_low = 9'h002;
            4'h6: out_low = 9'h002;
            4'h7: out_low = 9'h002;
            4'h8: out_low = 9'h001;
            4'h9: out_low = 9'h001;
            4'ha: out_low = 9'h001;
            4'hb: out_low = 9'h001;
            4'hc: out_low = 9'h001;
            4'hd: out_low = 9'h001;
            4'he: out_low = 9'h000;
            4'hf: out_low = 9'h000;
            default: out_low = 9'h000;
          endcase
        end
        default: out_low = 9'h000;
      endcase
      end
      default: out_low = 9'h000;
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
        if (mant <= 10'h000) begin
          mag_b14 = 1;
        end else begin
          mag_b14 = 0;
        end
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
        if (mant <= 10'h000) begin
          mag_b13 = 0;
        end else begin
          mag_b13 = 1;
        end
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
        mag_b13 = 1;
      end
      5'h1e: begin
        mag_b13 = 1;
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
        mag_b12 = 0;
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
        if (mant <= 10'h000) begin
          mag_b12 = 0;
        end else begin
          mag_b12 = 1;
        end
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
        mag_b12 = 1;
      end
      5'h16: begin
        mag_b12 = 1;
      end
      5'h17: begin
        mag_b12 = 1;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b12 = 1;
        end else begin
          mag_b12 = 0;
        end
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
        mag_b12 = 0;
      end
      5'h1e: begin
        mag_b12 = 0;
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
        mag_b11 = 1;
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
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
        mag_b11 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
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
        mag_b11 = 1;
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
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
        mag_b11 = 0;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
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
        mag_b11 = 1;
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      default: mag_b11 = 1'b0;
    endcase
  end
  reg mag_b10;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b10 = 1;
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
        mag_b10 = 0;
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h07: begin
        mag_b10 = 1;
      end
      5'h08: begin
        mag_b10 = 1;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h0a: begin
        mag_b10 = 0;
      end
      5'h0b: begin
        mag_b10 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h0d: begin
        mag_b10 = 1;
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
        mag_b10 = 0;
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h13: begin
        mag_b10 = 1;
      end
      5'h14: begin
        mag_b10 = 1;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h16: begin
        mag_b10 = 0;
      end
      5'h17: begin
        mag_b10 = 0;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h19: begin
        mag_b10 = 1;
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
        mag_b10 = 0;
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      default: mag_b10 = 1'b0;
    endcase
  end
  reg mag_b9;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h02: begin
        mag_b9 = 0;
      end
      5'h03: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h04: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h05: begin
        mag_b9 = 0;
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h07: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h08: begin
        mag_b9 = 0;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h0a: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h0b: begin
        mag_b9 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h0d: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h0e: begin
        mag_b9 = 0;
      end
      5'h0f: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h10: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h11: begin
        mag_b9 = 0;
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h13: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h14: begin
        mag_b9 = 0;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h16: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h17: begin
        mag_b9 = 0;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h19: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h1a: begin
        mag_b9 = 0;
      end
      5'h1b: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h1c: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h1d: begin
        mag_b9 = 0;
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      default: mag_b9 = 1'b0;
    endcase
  end
  wire [14:0] active_mag = {mag_b14, mag_b13, mag_b12, mag_b11, mag_b10, mag_b9, out_low};
  wire [15:0] active_out = {sign, active_mag};
  assign out = active ? active_out : special_out;
endmodule
