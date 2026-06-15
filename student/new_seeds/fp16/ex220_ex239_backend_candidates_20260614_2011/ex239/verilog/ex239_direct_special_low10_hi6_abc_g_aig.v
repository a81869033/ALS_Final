module ex239_direct_special_low10_hi6(in, out);
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
  reg [9:0] out_low;
  always @* begin
    case (cls)
      2'h0: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 10'h000;
            4'h1: out_low = 10'h3ff;
            4'h2: out_low = 10'h3ff;
            4'h3: out_low = 10'h3fe;
            4'h4: out_low = 10'h3fd;
            4'h5: out_low = 10'h3fd;
            4'h6: out_low = 10'h3fc;
            4'h7: out_low = 10'h3fb;
            4'h8: out_low = 10'h3fb;
            4'h9: out_low = 10'h3fa;
            4'ha: out_low = 10'h3f9;
            4'hb: out_low = 10'h3f9;
            4'hc: out_low = 10'h3f8;
            4'hd: out_low = 10'h3f7;
            4'he: out_low = 10'h3f7;
            4'hf: out_low = 10'h3f6;
            default: out_low = 10'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3f5;
            4'h1: out_low = 10'h3f5;
            4'h2: out_low = 10'h3f4;
            4'h3: out_low = 10'h3f3;
            4'h4: out_low = 10'h3f3;
            4'h5: out_low = 10'h3f2;
            4'h6: out_low = 10'h3f2;
            4'h7: out_low = 10'h3f1;
            4'h8: out_low = 10'h3f0;
            4'h9: out_low = 10'h3f0;
            4'ha: out_low = 10'h3ef;
            4'hb: out_low = 10'h3ee;
            4'hc: out_low = 10'h3ee;
            4'hd: out_low = 10'h3ed;
            4'he: out_low = 10'h3ec;
            4'hf: out_low = 10'h3ec;
            default: out_low = 10'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3eb;
            4'h1: out_low = 10'h3ea;
            4'h2: out_low = 10'h3ea;
            4'h3: out_low = 10'h3e9;
            4'h4: out_low = 10'h3e9;
            4'h5: out_low = 10'h3e8;
            4'h6: out_low = 10'h3e7;
            4'h7: out_low = 10'h3e7;
            4'h8: out_low = 10'h3e6;
            4'h9: out_low = 10'h3e5;
            4'ha: out_low = 10'h3e5;
            4'hb: out_low = 10'h3e4;
            4'hc: out_low = 10'h3e3;
            4'hd: out_low = 10'h3e3;
            4'he: out_low = 10'h3e2;
            4'hf: out_low = 10'h3e2;
            default: out_low = 10'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3e1;
            4'h1: out_low = 10'h3e0;
            4'h2: out_low = 10'h3e0;
            4'h3: out_low = 10'h3df;
            4'h4: out_low = 10'h3de;
            4'h5: out_low = 10'h3de;
            4'h6: out_low = 10'h3dd;
            4'h7: out_low = 10'h3dd;
            4'h8: out_low = 10'h3dc;
            4'h9: out_low = 10'h3db;
            4'ha: out_low = 10'h3db;
            4'hb: out_low = 10'h3da;
            4'hc: out_low = 10'h3d9;
            4'hd: out_low = 10'h3d9;
            4'he: out_low = 10'h3d8;
            4'hf: out_low = 10'h3d8;
            default: out_low = 10'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3d7;
            4'h1: out_low = 10'h3d6;
            4'h2: out_low = 10'h3d6;
            4'h3: out_low = 10'h3d5;
            4'h4: out_low = 10'h3d5;
            4'h5: out_low = 10'h3d4;
            4'h6: out_low = 10'h3d3;
            4'h7: out_low = 10'h3d3;
            4'h8: out_low = 10'h3d2;
            4'h9: out_low = 10'h3d2;
            4'ha: out_low = 10'h3d1;
            4'hb: out_low = 10'h3d0;
            4'hc: out_low = 10'h3d0;
            4'hd: out_low = 10'h3cf;
            4'he: out_low = 10'h3ce;
            4'hf: out_low = 10'h3ce;
            default: out_low = 10'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3cd;
            4'h1: out_low = 10'h3cd;
            4'h2: out_low = 10'h3cc;
            4'h3: out_low = 10'h3cb;
            4'h4: out_low = 10'h3cb;
            4'h5: out_low = 10'h3ca;
            4'h6: out_low = 10'h3ca;
            4'h7: out_low = 10'h3c9;
            4'h8: out_low = 10'h3c8;
            4'h9: out_low = 10'h3c8;
            4'ha: out_low = 10'h3c7;
            4'hb: out_low = 10'h3c7;
            4'hc: out_low = 10'h3c6;
            4'hd: out_low = 10'h3c6;
            4'he: out_low = 10'h3c5;
            4'hf: out_low = 10'h3c4;
            default: out_low = 10'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3c4;
            4'h1: out_low = 10'h3c3;
            4'h2: out_low = 10'h3c3;
            4'h3: out_low = 10'h3c2;
            4'h4: out_low = 10'h3c1;
            4'h5: out_low = 10'h3c1;
            4'h6: out_low = 10'h3c0;
            4'h7: out_low = 10'h3c0;
            4'h8: out_low = 10'h3bf;
            4'h9: out_low = 10'h3be;
            4'ha: out_low = 10'h3be;
            4'hb: out_low = 10'h3bd;
            4'hc: out_low = 10'h3bd;
            4'hd: out_low = 10'h3bc;
            4'he: out_low = 10'h3bc;
            4'hf: out_low = 10'h3bb;
            default: out_low = 10'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3ba;
            4'h1: out_low = 10'h3ba;
            4'h2: out_low = 10'h3b9;
            4'h3: out_low = 10'h3b9;
            4'h4: out_low = 10'h3b8;
            4'h5: out_low = 10'h3b7;
            4'h6: out_low = 10'h3b7;
            4'h7: out_low = 10'h3b6;
            4'h8: out_low = 10'h3b6;
            4'h9: out_low = 10'h3b5;
            4'ha: out_low = 10'h3b5;
            4'hb: out_low = 10'h3b4;
            4'hc: out_low = 10'h3b3;
            4'hd: out_low = 10'h3b3;
            4'he: out_low = 10'h3b2;
            4'hf: out_low = 10'h3b2;
            default: out_low = 10'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3b1;
            4'h1: out_low = 10'h3b1;
            4'h2: out_low = 10'h3b0;
            4'h3: out_low = 10'h3af;
            4'h4: out_low = 10'h3af;
            4'h5: out_low = 10'h3ae;
            4'h6: out_low = 10'h3ae;
            4'h7: out_low = 10'h3ad;
            4'h8: out_low = 10'h3ad;
            4'h9: out_low = 10'h3ac;
            4'ha: out_low = 10'h3ab;
            4'hb: out_low = 10'h3ab;
            4'hc: out_low = 10'h3aa;
            4'hd: out_low = 10'h3aa;
            4'he: out_low = 10'h3a9;
            4'hf: out_low = 10'h3a9;
            default: out_low = 10'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3a8;
            4'h1: out_low = 10'h3a8;
            4'h2: out_low = 10'h3a7;
            4'h3: out_low = 10'h3a6;
            4'h4: out_low = 10'h3a6;
            4'h5: out_low = 10'h3a5;
            4'h6: out_low = 10'h3a5;
            4'h7: out_low = 10'h3a4;
            4'h8: out_low = 10'h3a4;
            4'h9: out_low = 10'h3a3;
            4'ha: out_low = 10'h3a3;
            4'hb: out_low = 10'h3a2;
            4'hc: out_low = 10'h3a1;
            4'hd: out_low = 10'h3a1;
            4'he: out_low = 10'h3a0;
            4'hf: out_low = 10'h3a0;
            default: out_low = 10'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h39f;
            4'h1: out_low = 10'h39f;
            4'h2: out_low = 10'h39e;
            4'h3: out_low = 10'h39e;
            4'h4: out_low = 10'h39d;
            4'h5: out_low = 10'h39d;
            4'h6: out_low = 10'h39c;
            4'h7: out_low = 10'h39b;
            4'h8: out_low = 10'h39b;
            4'h9: out_low = 10'h39a;
            4'ha: out_low = 10'h39a;
            4'hb: out_low = 10'h399;
            4'hc: out_low = 10'h399;
            4'hd: out_low = 10'h398;
            4'he: out_low = 10'h398;
            4'hf: out_low = 10'h397;
            default: out_low = 10'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h397;
            4'h1: out_low = 10'h396;
            4'h2: out_low = 10'h395;
            4'h3: out_low = 10'h395;
            4'h4: out_low = 10'h394;
            4'h5: out_low = 10'h394;
            4'h6: out_low = 10'h393;
            4'h7: out_low = 10'h393;
            4'h8: out_low = 10'h392;
            4'h9: out_low = 10'h392;
            4'ha: out_low = 10'h391;
            4'hb: out_low = 10'h391;
            4'hc: out_low = 10'h390;
            4'hd: out_low = 10'h390;
            4'he: out_low = 10'h38f;
            4'hf: out_low = 10'h38f;
            default: out_low = 10'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h38e;
            4'h1: out_low = 10'h38d;
            4'h2: out_low = 10'h38d;
            4'h3: out_low = 10'h38c;
            4'h4: out_low = 10'h38c;
            4'h5: out_low = 10'h38b;
            4'h6: out_low = 10'h38b;
            4'h7: out_low = 10'h38a;
            4'h8: out_low = 10'h38a;
            4'h9: out_low = 10'h389;
            4'ha: out_low = 10'h389;
            4'hb: out_low = 10'h388;
            4'hc: out_low = 10'h388;
            4'hd: out_low = 10'h387;
            4'he: out_low = 10'h387;
            4'hf: out_low = 10'h386;
            default: out_low = 10'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h386;
            4'h1: out_low = 10'h385;
            4'h2: out_low = 10'h385;
            4'h3: out_low = 10'h384;
            4'h4: out_low = 10'h383;
            4'h5: out_low = 10'h383;
            4'h6: out_low = 10'h382;
            4'h7: out_low = 10'h382;
            4'h8: out_low = 10'h381;
            4'h9: out_low = 10'h381;
            4'ha: out_low = 10'h380;
            4'hb: out_low = 10'h380;
            4'hc: out_low = 10'h37f;
            4'hd: out_low = 10'h37f;
            4'he: out_low = 10'h37e;
            4'hf: out_low = 10'h37e;
            default: out_low = 10'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h37d;
            4'h1: out_low = 10'h37d;
            4'h2: out_low = 10'h37c;
            4'h3: out_low = 10'h37c;
            4'h4: out_low = 10'h37b;
            4'h5: out_low = 10'h37b;
            4'h6: out_low = 10'h37a;
            4'h7: out_low = 10'h37a;
            4'h8: out_low = 10'h379;
            4'h9: out_low = 10'h379;
            4'ha: out_low = 10'h378;
            4'hb: out_low = 10'h378;
            4'hc: out_low = 10'h377;
            4'hd: out_low = 10'h377;
            4'he: out_low = 10'h376;
            4'hf: out_low = 10'h376;
            default: out_low = 10'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h375;
            4'h1: out_low = 10'h375;
            4'h2: out_low = 10'h374;
            4'h3: out_low = 10'h374;
            4'h4: out_low = 10'h373;
            4'h5: out_low = 10'h373;
            4'h6: out_low = 10'h372;
            4'h7: out_low = 10'h372;
            4'h8: out_low = 10'h371;
            4'h9: out_low = 10'h371;
            4'ha: out_low = 10'h370;
            4'hb: out_low = 10'h370;
            4'hc: out_low = 10'h36f;
            4'hd: out_low = 10'h36f;
            4'he: out_low = 10'h36e;
            4'hf: out_low = 10'h36e;
            default: out_low = 10'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 10'h36d;
            4'h1: out_low = 10'h36d;
            4'h2: out_low = 10'h36c;
            4'h3: out_low = 10'h36c;
            4'h4: out_low = 10'h36b;
            4'h5: out_low = 10'h36b;
            4'h6: out_low = 10'h36a;
            4'h7: out_low = 10'h36a;
            4'h8: out_low = 10'h369;
            4'h9: out_low = 10'h369;
            4'ha: out_low = 10'h368;
            4'hb: out_low = 10'h368;
            4'hc: out_low = 10'h367;
            4'hd: out_low = 10'h367;
            4'he: out_low = 10'h366;
            4'hf: out_low = 10'h366;
            default: out_low = 10'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 10'h365;
            4'h1: out_low = 10'h365;
            4'h2: out_low = 10'h364;
            4'h3: out_low = 10'h364;
            4'h4: out_low = 10'h363;
            4'h5: out_low = 10'h363;
            4'h6: out_low = 10'h362;
            4'h7: out_low = 10'h362;
            4'h8: out_low = 10'h361;
            4'h9: out_low = 10'h361;
            4'ha: out_low = 10'h360;
            4'hb: out_low = 10'h360;
            4'hc: out_low = 10'h360;
            4'hd: out_low = 10'h35f;
            4'he: out_low = 10'h35f;
            4'hf: out_low = 10'h35e;
            default: out_low = 10'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 10'h35e;
            4'h1: out_low = 10'h35d;
            4'h2: out_low = 10'h35d;
            4'h3: out_low = 10'h35c;
            4'h4: out_low = 10'h35c;
            4'h5: out_low = 10'h35b;
            4'h6: out_low = 10'h35b;
            4'h7: out_low = 10'h35a;
            4'h8: out_low = 10'h35a;
            4'h9: out_low = 10'h359;
            4'ha: out_low = 10'h359;
            4'hb: out_low = 10'h358;
            4'hc: out_low = 10'h358;
            4'hd: out_low = 10'h357;
            4'he: out_low = 10'h357;
            4'hf: out_low = 10'h356;
            default: out_low = 10'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 10'h356;
            4'h1: out_low = 10'h356;
            4'h2: out_low = 10'h355;
            4'h3: out_low = 10'h355;
            4'h4: out_low = 10'h354;
            4'h5: out_low = 10'h354;
            4'h6: out_low = 10'h353;
            4'h7: out_low = 10'h353;
            4'h8: out_low = 10'h352;
            4'h9: out_low = 10'h352;
            4'ha: out_low = 10'h351;
            4'hb: out_low = 10'h351;
            4'hc: out_low = 10'h350;
            4'hd: out_low = 10'h350;
            4'he: out_low = 10'h34f;
            4'hf: out_low = 10'h34f;
            default: out_low = 10'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 10'h34f;
            4'h1: out_low = 10'h34e;
            4'h2: out_low = 10'h34e;
            4'h3: out_low = 10'h34d;
            4'h4: out_low = 10'h34d;
            4'h5: out_low = 10'h34c;
            4'h6: out_low = 10'h34c;
            4'h7: out_low = 10'h34b;
            4'h8: out_low = 10'h34b;
            4'h9: out_low = 10'h34a;
            4'ha: out_low = 10'h34a;
            4'hb: out_low = 10'h349;
            4'hc: out_low = 10'h349;
            4'hd: out_low = 10'h349;
            4'he: out_low = 10'h348;
            4'hf: out_low = 10'h348;
            default: out_low = 10'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 10'h347;
            4'h1: out_low = 10'h347;
            4'h2: out_low = 10'h346;
            4'h3: out_low = 10'h346;
            4'h4: out_low = 10'h345;
            4'h5: out_low = 10'h345;
            4'h6: out_low = 10'h344;
            4'h7: out_low = 10'h344;
            4'h8: out_low = 10'h344;
            4'h9: out_low = 10'h343;
            4'ha: out_low = 10'h343;
            4'hb: out_low = 10'h342;
            4'hc: out_low = 10'h342;
            4'hd: out_low = 10'h341;
            4'he: out_low = 10'h341;
            4'hf: out_low = 10'h340;
            default: out_low = 10'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 10'h340;
            4'h1: out_low = 10'h33f;
            4'h2: out_low = 10'h33f;
            4'h3: out_low = 10'h33f;
            4'h4: out_low = 10'h33e;
            4'h5: out_low = 10'h33e;
            4'h6: out_low = 10'h33d;
            4'h7: out_low = 10'h33d;
            4'h8: out_low = 10'h33c;
            4'h9: out_low = 10'h33c;
            4'ha: out_low = 10'h33b;
            4'hb: out_low = 10'h33b;
            4'hc: out_low = 10'h33b;
            4'hd: out_low = 10'h33a;
            4'he: out_low = 10'h33a;
            4'hf: out_low = 10'h339;
            default: out_low = 10'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 10'h339;
            4'h1: out_low = 10'h338;
            4'h2: out_low = 10'h338;
            4'h3: out_low = 10'h337;
            4'h4: out_low = 10'h337;
            4'h5: out_low = 10'h337;
            4'h6: out_low = 10'h336;
            4'h7: out_low = 10'h336;
            4'h8: out_low = 10'h335;
            4'h9: out_low = 10'h335;
            4'ha: out_low = 10'h334;
            4'hb: out_low = 10'h334;
            4'hc: out_low = 10'h333;
            4'hd: out_low = 10'h333;
            4'he: out_low = 10'h333;
            4'hf: out_low = 10'h332;
            default: out_low = 10'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 10'h332;
            4'h1: out_low = 10'h331;
            4'h2: out_low = 10'h331;
            4'h3: out_low = 10'h330;
            4'h4: out_low = 10'h330;
            4'h5: out_low = 10'h330;
            4'h6: out_low = 10'h32f;
            4'h7: out_low = 10'h32f;
            4'h8: out_low = 10'h32e;
            4'h9: out_low = 10'h32e;
            4'ha: out_low = 10'h32d;
            4'hb: out_low = 10'h32d;
            4'hc: out_low = 10'h32d;
            4'hd: out_low = 10'h32c;
            4'he: out_low = 10'h32c;
            4'hf: out_low = 10'h32b;
            default: out_low = 10'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 10'h32b;
            4'h1: out_low = 10'h32a;
            4'h2: out_low = 10'h32a;
            4'h3: out_low = 10'h32a;
            4'h4: out_low = 10'h329;
            4'h5: out_low = 10'h329;
            4'h6: out_low = 10'h328;
            4'h7: out_low = 10'h328;
            4'h8: out_low = 10'h327;
            4'h9: out_low = 10'h327;
            4'ha: out_low = 10'h327;
            4'hb: out_low = 10'h326;
            4'hc: out_low = 10'h326;
            4'hd: out_low = 10'h325;
            4'he: out_low = 10'h325;
            4'hf: out_low = 10'h324;
            default: out_low = 10'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h324;
            4'h1: out_low = 10'h324;
            4'h2: out_low = 10'h323;
            4'h3: out_low = 10'h323;
            4'h4: out_low = 10'h322;
            4'h5: out_low = 10'h322;
            4'h6: out_low = 10'h321;
            4'h7: out_low = 10'h321;
            4'h8: out_low = 10'h321;
            4'h9: out_low = 10'h320;
            4'ha: out_low = 10'h320;
            4'hb: out_low = 10'h31f;
            4'hc: out_low = 10'h31f;
            4'hd: out_low = 10'h31f;
            4'he: out_low = 10'h31e;
            4'hf: out_low = 10'h31e;
            default: out_low = 10'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h31d;
            4'h1: out_low = 10'h31d;
            4'h2: out_low = 10'h31c;
            4'h3: out_low = 10'h31c;
            4'h4: out_low = 10'h31c;
            4'h5: out_low = 10'h31b;
            4'h6: out_low = 10'h31b;
            4'h7: out_low = 10'h31a;
            4'h8: out_low = 10'h31a;
            4'h9: out_low = 10'h31a;
            4'ha: out_low = 10'h319;
            4'hb: out_low = 10'h319;
            4'hc: out_low = 10'h318;
            4'hd: out_low = 10'h318;
            4'he: out_low = 10'h317;
            4'hf: out_low = 10'h317;
            default: out_low = 10'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h317;
            4'h1: out_low = 10'h316;
            4'h2: out_low = 10'h316;
            4'h3: out_low = 10'h315;
            4'h4: out_low = 10'h315;
            4'h5: out_low = 10'h315;
            4'h6: out_low = 10'h314;
            4'h7: out_low = 10'h314;
            4'h8: out_low = 10'h313;
            4'h9: out_low = 10'h313;
            4'ha: out_low = 10'h313;
            4'hb: out_low = 10'h312;
            4'hc: out_low = 10'h312;
            4'hd: out_low = 10'h311;
            4'he: out_low = 10'h311;
            4'hf: out_low = 10'h311;
            default: out_low = 10'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h310;
            4'h1: out_low = 10'h310;
            4'h2: out_low = 10'h30f;
            4'h3: out_low = 10'h30f;
            4'h4: out_low = 10'h30f;
            4'h5: out_low = 10'h30e;
            4'h6: out_low = 10'h30e;
            4'h7: out_low = 10'h30d;
            4'h8: out_low = 10'h30d;
            4'h9: out_low = 10'h30c;
            4'ha: out_low = 10'h30c;
            4'hb: out_low = 10'h30c;
            4'hc: out_low = 10'h30b;
            4'hd: out_low = 10'h30b;
            4'he: out_low = 10'h30a;
            4'hf: out_low = 10'h30a;
            default: out_low = 10'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h30a;
            4'h1: out_low = 10'h309;
            4'h2: out_low = 10'h309;
            4'h3: out_low = 10'h308;
            4'h4: out_low = 10'h308;
            4'h5: out_low = 10'h308;
            4'h6: out_low = 10'h307;
            4'h7: out_low = 10'h307;
            4'h8: out_low = 10'h307;
            4'h9: out_low = 10'h306;
            4'ha: out_low = 10'h306;
            4'hb: out_low = 10'h305;
            4'hc: out_low = 10'h305;
            4'hd: out_low = 10'h305;
            4'he: out_low = 10'h304;
            4'hf: out_low = 10'h304;
            default: out_low = 10'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h303;
            4'h1: out_low = 10'h303;
            4'h2: out_low = 10'h303;
            4'h3: out_low = 10'h302;
            4'h4: out_low = 10'h302;
            4'h5: out_low = 10'h301;
            4'h6: out_low = 10'h301;
            4'h7: out_low = 10'h301;
            4'h8: out_low = 10'h300;
            4'h9: out_low = 10'h300;
            4'ha: out_low = 10'h2ff;
            4'hb: out_low = 10'h2ff;
            4'hc: out_low = 10'h2ff;
            4'hd: out_low = 10'h2fe;
            4'he: out_low = 10'h2fe;
            4'hf: out_low = 10'h2fd;
            default: out_low = 10'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2fd;
            4'h1: out_low = 10'h2fd;
            4'h2: out_low = 10'h2fc;
            4'h3: out_low = 10'h2fc;
            4'h4: out_low = 10'h2fc;
            4'h5: out_low = 10'h2fb;
            4'h6: out_low = 10'h2fb;
            4'h7: out_low = 10'h2fa;
            4'h8: out_low = 10'h2fa;
            4'h9: out_low = 10'h2fa;
            4'ha: out_low = 10'h2f9;
            4'hb: out_low = 10'h2f9;
            4'hc: out_low = 10'h2f8;
            4'hd: out_low = 10'h2f8;
            4'he: out_low = 10'h2f8;
            4'hf: out_low = 10'h2f7;
            default: out_low = 10'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2f7;
            4'h1: out_low = 10'h2f7;
            4'h2: out_low = 10'h2f6;
            4'h3: out_low = 10'h2f6;
            4'h4: out_low = 10'h2f5;
            4'h5: out_low = 10'h2f5;
            4'h6: out_low = 10'h2f5;
            4'h7: out_low = 10'h2f4;
            4'h8: out_low = 10'h2f4;
            4'h9: out_low = 10'h2f3;
            4'ha: out_low = 10'h2f3;
            4'hb: out_low = 10'h2f3;
            4'hc: out_low = 10'h2f2;
            4'hd: out_low = 10'h2f2;
            4'he: out_low = 10'h2f2;
            4'hf: out_low = 10'h2f1;
            default: out_low = 10'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2f1;
            4'h1: out_low = 10'h2f0;
            4'h2: out_low = 10'h2f0;
            4'h3: out_low = 10'h2f0;
            4'h4: out_low = 10'h2ef;
            4'h5: out_low = 10'h2ef;
            4'h6: out_low = 10'h2ef;
            4'h7: out_low = 10'h2ee;
            4'h8: out_low = 10'h2ee;
            4'h9: out_low = 10'h2ed;
            4'ha: out_low = 10'h2ed;
            4'hb: out_low = 10'h2ed;
            4'hc: out_low = 10'h2ec;
            4'hd: out_low = 10'h2ec;
            4'he: out_low = 10'h2ec;
            4'hf: out_low = 10'h2eb;
            default: out_low = 10'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2eb;
            4'h1: out_low = 10'h2ea;
            4'h2: out_low = 10'h2ea;
            4'h3: out_low = 10'h2ea;
            4'h4: out_low = 10'h2e9;
            4'h5: out_low = 10'h2e9;
            4'h6: out_low = 10'h2e9;
            4'h7: out_low = 10'h2e8;
            4'h8: out_low = 10'h2e8;
            4'h9: out_low = 10'h2e7;
            4'ha: out_low = 10'h2e7;
            4'hb: out_low = 10'h2e7;
            4'hc: out_low = 10'h2e6;
            4'hd: out_low = 10'h2e6;
            4'he: out_low = 10'h2e6;
            4'hf: out_low = 10'h2e5;
            default: out_low = 10'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2e5;
            4'h1: out_low = 10'h2e5;
            4'h2: out_low = 10'h2e4;
            4'h3: out_low = 10'h2e4;
            4'h4: out_low = 10'h2e3;
            4'h5: out_low = 10'h2e3;
            4'h6: out_low = 10'h2e3;
            4'h7: out_low = 10'h2e2;
            4'h8: out_low = 10'h2e2;
            4'h9: out_low = 10'h2e2;
            4'ha: out_low = 10'h2e1;
            4'hb: out_low = 10'h2e1;
            4'hc: out_low = 10'h2e1;
            4'hd: out_low = 10'h2e0;
            4'he: out_low = 10'h2e0;
            4'hf: out_low = 10'h2df;
            default: out_low = 10'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2df;
            4'h1: out_low = 10'h2df;
            4'h2: out_low = 10'h2de;
            4'h3: out_low = 10'h2de;
            4'h4: out_low = 10'h2de;
            4'h5: out_low = 10'h2dd;
            4'h6: out_low = 10'h2dd;
            4'h7: out_low = 10'h2dd;
            4'h8: out_low = 10'h2dc;
            4'h9: out_low = 10'h2dc;
            4'ha: out_low = 10'h2db;
            4'hb: out_low = 10'h2db;
            4'hc: out_low = 10'h2db;
            4'hd: out_low = 10'h2da;
            4'he: out_low = 10'h2da;
            4'hf: out_low = 10'h2da;
            default: out_low = 10'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2d9;
            4'h1: out_low = 10'h2d9;
            4'h2: out_low = 10'h2d9;
            4'h3: out_low = 10'h2d8;
            4'h4: out_low = 10'h2d8;
            4'h5: out_low = 10'h2d8;
            4'h6: out_low = 10'h2d7;
            4'h7: out_low = 10'h2d7;
            4'h8: out_low = 10'h2d6;
            4'h9: out_low = 10'h2d6;
            4'ha: out_low = 10'h2d6;
            4'hb: out_low = 10'h2d5;
            4'hc: out_low = 10'h2d5;
            4'hd: out_low = 10'h2d5;
            4'he: out_low = 10'h2d4;
            4'hf: out_low = 10'h2d4;
            default: out_low = 10'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2d4;
            4'h1: out_low = 10'h2d3;
            4'h2: out_low = 10'h2d3;
            4'h3: out_low = 10'h2d3;
            4'h4: out_low = 10'h2d2;
            4'h5: out_low = 10'h2d2;
            4'h6: out_low = 10'h2d1;
            4'h7: out_low = 10'h2d1;
            4'h8: out_low = 10'h2d1;
            4'h9: out_low = 10'h2d0;
            4'ha: out_low = 10'h2d0;
            4'hb: out_low = 10'h2d0;
            4'hc: out_low = 10'h2cf;
            4'hd: out_low = 10'h2cf;
            4'he: out_low = 10'h2cf;
            4'hf: out_low = 10'h2ce;
            default: out_low = 10'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2ce;
            4'h1: out_low = 10'h2ce;
            4'h2: out_low = 10'h2cd;
            4'h3: out_low = 10'h2cd;
            4'h4: out_low = 10'h2cd;
            4'h5: out_low = 10'h2cc;
            4'h6: out_low = 10'h2cc;
            4'h7: out_low = 10'h2cc;
            4'h8: out_low = 10'h2cb;
            4'h9: out_low = 10'h2cb;
            4'ha: out_low = 10'h2cb;
            4'hb: out_low = 10'h2ca;
            4'hc: out_low = 10'h2ca;
            4'hd: out_low = 10'h2c9;
            4'he: out_low = 10'h2c9;
            4'hf: out_low = 10'h2c9;
            default: out_low = 10'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2c8;
            4'h1: out_low = 10'h2c8;
            4'h2: out_low = 10'h2c8;
            4'h3: out_low = 10'h2c7;
            4'h4: out_low = 10'h2c7;
            4'h5: out_low = 10'h2c7;
            4'h6: out_low = 10'h2c6;
            4'h7: out_low = 10'h2c6;
            4'h8: out_low = 10'h2c6;
            4'h9: out_low = 10'h2c5;
            4'ha: out_low = 10'h2c5;
            4'hb: out_low = 10'h2c5;
            4'hc: out_low = 10'h2c4;
            4'hd: out_low = 10'h2c4;
            4'he: out_low = 10'h2c4;
            4'hf: out_low = 10'h2c3;
            default: out_low = 10'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2c3;
            4'h1: out_low = 10'h2c3;
            4'h2: out_low = 10'h2c2;
            4'h3: out_low = 10'h2c2;
            4'h4: out_low = 10'h2c2;
            4'h5: out_low = 10'h2c1;
            4'h6: out_low = 10'h2c1;
            4'h7: out_low = 10'h2c1;
            4'h8: out_low = 10'h2c0;
            4'h9: out_low = 10'h2c0;
            4'ha: out_low = 10'h2c0;
            4'hb: out_low = 10'h2bf;
            4'hc: out_low = 10'h2bf;
            4'hd: out_low = 10'h2bf;
            4'he: out_low = 10'h2be;
            4'hf: out_low = 10'h2be;
            default: out_low = 10'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2be;
            4'h1: out_low = 10'h2bd;
            4'h2: out_low = 10'h2bd;
            4'h3: out_low = 10'h2bd;
            4'h4: out_low = 10'h2bc;
            4'h5: out_low = 10'h2bc;
            4'h6: out_low = 10'h2bc;
            4'h7: out_low = 10'h2bb;
            4'h8: out_low = 10'h2bb;
            4'h9: out_low = 10'h2bb;
            4'ha: out_low = 10'h2ba;
            4'hb: out_low = 10'h2ba;
            4'hc: out_low = 10'h2ba;
            4'hd: out_low = 10'h2b9;
            4'he: out_low = 10'h2b9;
            4'hf: out_low = 10'h2b9;
            default: out_low = 10'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2b8;
            4'h1: out_low = 10'h2b8;
            4'h2: out_low = 10'h2b8;
            4'h3: out_low = 10'h2b7;
            4'h4: out_low = 10'h2b7;
            4'h5: out_low = 10'h2b7;
            4'h6: out_low = 10'h2b6;
            4'h7: out_low = 10'h2b6;
            4'h8: out_low = 10'h2b6;
            4'h9: out_low = 10'h2b5;
            4'ha: out_low = 10'h2b5;
            4'hb: out_low = 10'h2b5;
            4'hc: out_low = 10'h2b4;
            4'hd: out_low = 10'h2b4;
            4'he: out_low = 10'h2b4;
            4'hf: out_low = 10'h2b3;
            default: out_low = 10'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2b3;
            4'h1: out_low = 10'h2b3;
            4'h2: out_low = 10'h2b2;
            4'h3: out_low = 10'h2b2;
            4'h4: out_low = 10'h2b2;
            4'h5: out_low = 10'h2b1;
            4'h6: out_low = 10'h2b1;
            4'h7: out_low = 10'h2b1;
            4'h8: out_low = 10'h2b0;
            4'h9: out_low = 10'h2b0;
            4'ha: out_low = 10'h2b0;
            4'hb: out_low = 10'h2af;
            4'hc: out_low = 10'h2af;
            4'hd: out_low = 10'h2af;
            4'he: out_low = 10'h2ae;
            4'hf: out_low = 10'h2ae;
            default: out_low = 10'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2ae;
            4'h1: out_low = 10'h2ad;
            4'h2: out_low = 10'h2ad;
            4'h3: out_low = 10'h2ad;
            4'h4: out_low = 10'h2ac;
            4'h5: out_low = 10'h2ac;
            4'h6: out_low = 10'h2ac;
            4'h7: out_low = 10'h2ab;
            4'h8: out_low = 10'h2ab;
            4'h9: out_low = 10'h2ab;
            4'ha: out_low = 10'h2aa;
            4'hb: out_low = 10'h2aa;
            4'hc: out_low = 10'h2aa;
            4'hd: out_low = 10'h2aa;
            4'he: out_low = 10'h2a9;
            4'hf: out_low = 10'h2a9;
            default: out_low = 10'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2a9;
            4'h1: out_low = 10'h2a8;
            4'h2: out_low = 10'h2a8;
            4'h3: out_low = 10'h2a8;
            4'h4: out_low = 10'h2a7;
            4'h5: out_low = 10'h2a7;
            4'h6: out_low = 10'h2a7;
            4'h7: out_low = 10'h2a6;
            4'h8: out_low = 10'h2a6;
            4'h9: out_low = 10'h2a6;
            4'ha: out_low = 10'h2a5;
            4'hb: out_low = 10'h2a5;
            4'hc: out_low = 10'h2a5;
            4'hd: out_low = 10'h2a4;
            4'he: out_low = 10'h2a4;
            4'hf: out_low = 10'h2a4;
            default: out_low = 10'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2a3;
            4'h1: out_low = 10'h2a3;
            4'h2: out_low = 10'h2a3;
            4'h3: out_low = 10'h2a3;
            4'h4: out_low = 10'h2a2;
            4'h5: out_low = 10'h2a2;
            4'h6: out_low = 10'h2a2;
            4'h7: out_low = 10'h2a1;
            4'h8: out_low = 10'h2a1;
            4'h9: out_low = 10'h2a1;
            4'ha: out_low = 10'h2a0;
            4'hb: out_low = 10'h2a0;
            4'hc: out_low = 10'h2a0;
            4'hd: out_low = 10'h29f;
            4'he: out_low = 10'h29f;
            4'hf: out_low = 10'h29f;
            default: out_low = 10'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 10'h29e;
            4'h1: out_low = 10'h29e;
            4'h2: out_low = 10'h29e;
            4'h3: out_low = 10'h29e;
            4'h4: out_low = 10'h29d;
            4'h5: out_low = 10'h29d;
            4'h6: out_low = 10'h29d;
            4'h7: out_low = 10'h29c;
            4'h8: out_low = 10'h29c;
            4'h9: out_low = 10'h29c;
            4'ha: out_low = 10'h29b;
            4'hb: out_low = 10'h29b;
            4'hc: out_low = 10'h29b;
            4'hd: out_low = 10'h29a;
            4'he: out_low = 10'h29a;
            4'hf: out_low = 10'h29a;
            default: out_low = 10'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 10'h299;
            4'h1: out_low = 10'h299;
            4'h2: out_low = 10'h299;
            4'h3: out_low = 10'h299;
            4'h4: out_low = 10'h298;
            4'h5: out_low = 10'h298;
            4'h6: out_low = 10'h298;
            4'h7: out_low = 10'h297;
            4'h8: out_low = 10'h297;
            4'h9: out_low = 10'h297;
            4'ha: out_low = 10'h296;
            4'hb: out_low = 10'h296;
            4'hc: out_low = 10'h296;
            4'hd: out_low = 10'h295;
            4'he: out_low = 10'h295;
            4'hf: out_low = 10'h295;
            default: out_low = 10'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 10'h295;
            4'h1: out_low = 10'h294;
            4'h2: out_low = 10'h294;
            4'h3: out_low = 10'h294;
            4'h4: out_low = 10'h293;
            4'h5: out_low = 10'h293;
            4'h6: out_low = 10'h293;
            4'h7: out_low = 10'h292;
            4'h8: out_low = 10'h292;
            4'h9: out_low = 10'h292;
            4'ha: out_low = 10'h292;
            4'hb: out_low = 10'h291;
            4'hc: out_low = 10'h291;
            4'hd: out_low = 10'h291;
            4'he: out_low = 10'h290;
            4'hf: out_low = 10'h290;
            default: out_low = 10'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 10'h290;
            4'h1: out_low = 10'h28f;
            4'h2: out_low = 10'h28f;
            4'h3: out_low = 10'h28f;
            4'h4: out_low = 10'h28f;
            4'h5: out_low = 10'h28e;
            4'h6: out_low = 10'h28e;
            4'h7: out_low = 10'h28e;
            4'h8: out_low = 10'h28d;
            4'h9: out_low = 10'h28d;
            4'ha: out_low = 10'h28d;
            4'hb: out_low = 10'h28c;
            4'hc: out_low = 10'h28c;
            4'hd: out_low = 10'h28c;
            4'he: out_low = 10'h28c;
            4'hf: out_low = 10'h28b;
            default: out_low = 10'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 10'h28b;
            4'h1: out_low = 10'h28b;
            4'h2: out_low = 10'h28a;
            4'h3: out_low = 10'h28a;
            4'h4: out_low = 10'h28a;
            4'h5: out_low = 10'h289;
            4'h6: out_low = 10'h289;
            4'h7: out_low = 10'h289;
            4'h8: out_low = 10'h289;
            4'h9: out_low = 10'h288;
            4'ha: out_low = 10'h288;
            4'hb: out_low = 10'h288;
            4'hc: out_low = 10'h287;
            4'hd: out_low = 10'h287;
            4'he: out_low = 10'h287;
            4'hf: out_low = 10'h286;
            default: out_low = 10'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 10'h286;
            4'h1: out_low = 10'h286;
            4'h2: out_low = 10'h286;
            4'h3: out_low = 10'h285;
            4'h4: out_low = 10'h285;
            4'h5: out_low = 10'h285;
            4'h6: out_low = 10'h284;
            4'h7: out_low = 10'h284;
            4'h8: out_low = 10'h284;
            4'h9: out_low = 10'h284;
            4'ha: out_low = 10'h283;
            4'hb: out_low = 10'h283;
            4'hc: out_low = 10'h283;
            4'hd: out_low = 10'h282;
            4'he: out_low = 10'h282;
            4'hf: out_low = 10'h282;
            default: out_low = 10'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 10'h281;
            4'h1: out_low = 10'h281;
            4'h2: out_low = 10'h281;
            4'h3: out_low = 10'h281;
            4'h4: out_low = 10'h280;
            4'h5: out_low = 10'h280;
            4'h6: out_low = 10'h280;
            4'h7: out_low = 10'h27f;
            4'h8: out_low = 10'h27f;
            4'h9: out_low = 10'h27f;
            4'ha: out_low = 10'h27f;
            4'hb: out_low = 10'h27e;
            4'hc: out_low = 10'h27e;
            4'hd: out_low = 10'h27e;
            4'he: out_low = 10'h27d;
            4'hf: out_low = 10'h27d;
            default: out_low = 10'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 10'h27d;
            4'h1: out_low = 10'h27d;
            4'h2: out_low = 10'h27c;
            4'h3: out_low = 10'h27c;
            4'h4: out_low = 10'h27c;
            4'h5: out_low = 10'h27b;
            4'h6: out_low = 10'h27b;
            4'h7: out_low = 10'h27b;
            4'h8: out_low = 10'h27b;
            4'h9: out_low = 10'h27a;
            4'ha: out_low = 10'h27a;
            4'hb: out_low = 10'h27a;
            4'hc: out_low = 10'h279;
            4'hd: out_low = 10'h279;
            4'he: out_low = 10'h279;
            4'hf: out_low = 10'h279;
            default: out_low = 10'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 10'h278;
            4'h1: out_low = 10'h278;
            4'h2: out_low = 10'h278;
            4'h3: out_low = 10'h277;
            4'h4: out_low = 10'h277;
            4'h5: out_low = 10'h277;
            4'h6: out_low = 10'h277;
            4'h7: out_low = 10'h276;
            4'h8: out_low = 10'h276;
            4'h9: out_low = 10'h276;
            4'ha: out_low = 10'h275;
            4'hb: out_low = 10'h275;
            4'hc: out_low = 10'h275;
            4'hd: out_low = 10'h275;
            4'he: out_low = 10'h274;
            4'hf: out_low = 10'h274;
            default: out_low = 10'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h274;
            4'h1: out_low = 10'h273;
            4'h2: out_low = 10'h273;
            4'h3: out_low = 10'h273;
            4'h4: out_low = 10'h273;
            4'h5: out_low = 10'h272;
            4'h6: out_low = 10'h272;
            4'h7: out_low = 10'h272;
            4'h8: out_low = 10'h271;
            4'h9: out_low = 10'h271;
            4'ha: out_low = 10'h271;
            4'hb: out_low = 10'h271;
            4'hc: out_low = 10'h270;
            4'hd: out_low = 10'h270;
            4'he: out_low = 10'h270;
            4'hf: out_low = 10'h270;
            default: out_low = 10'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h26f;
            4'h1: out_low = 10'h26f;
            4'h2: out_low = 10'h26f;
            4'h3: out_low = 10'h26e;
            4'h4: out_low = 10'h26e;
            4'h5: out_low = 10'h26e;
            4'h6: out_low = 10'h26e;
            4'h7: out_low = 10'h26d;
            4'h8: out_low = 10'h26d;
            4'h9: out_low = 10'h26d;
            4'ha: out_low = 10'h26c;
            4'hb: out_low = 10'h26c;
            4'hc: out_low = 10'h26c;
            4'hd: out_low = 10'h26c;
            4'he: out_low = 10'h26b;
            4'hf: out_low = 10'h26b;
            default: out_low = 10'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h26b;
            4'h1: out_low = 10'h26b;
            4'h2: out_low = 10'h26a;
            4'h3: out_low = 10'h26a;
            4'h4: out_low = 10'h26a;
            4'h5: out_low = 10'h269;
            4'h6: out_low = 10'h269;
            4'h7: out_low = 10'h269;
            4'h8: out_low = 10'h269;
            4'h9: out_low = 10'h268;
            4'ha: out_low = 10'h268;
            4'hb: out_low = 10'h268;
            4'hc: out_low = 10'h267;
            4'hd: out_low = 10'h267;
            4'he: out_low = 10'h267;
            4'hf: out_low = 10'h267;
            default: out_low = 10'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h266;
            4'h1: out_low = 10'h266;
            4'h2: out_low = 10'h266;
            4'h3: out_low = 10'h266;
            4'h4: out_low = 10'h265;
            4'h5: out_low = 10'h265;
            4'h6: out_low = 10'h265;
            4'h7: out_low = 10'h264;
            4'h8: out_low = 10'h264;
            4'h9: out_low = 10'h264;
            4'ha: out_low = 10'h264;
            4'hb: out_low = 10'h263;
            4'hc: out_low = 10'h263;
            4'hd: out_low = 10'h263;
            4'he: out_low = 10'h263;
            4'hf: out_low = 10'h262;
            default: out_low = 10'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h262;
            4'h1: out_low = 10'h262;
            4'h2: out_low = 10'h262;
            4'h3: out_low = 10'h261;
            4'h4: out_low = 10'h261;
            4'h5: out_low = 10'h261;
            4'h6: out_low = 10'h260;
            4'h7: out_low = 10'h260;
            4'h8: out_low = 10'h260;
            4'h9: out_low = 10'h260;
            4'ha: out_low = 10'h25f;
            4'hb: out_low = 10'h25f;
            4'hc: out_low = 10'h25f;
            4'hd: out_low = 10'h25f;
            4'he: out_low = 10'h25e;
            4'hf: out_low = 10'h25e;
            default: out_low = 10'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h25e;
            4'h1: out_low = 10'h25d;
            4'h2: out_low = 10'h25d;
            4'h3: out_low = 10'h25d;
            4'h4: out_low = 10'h25d;
            4'h5: out_low = 10'h25c;
            4'h6: out_low = 10'h25c;
            4'h7: out_low = 10'h25c;
            4'h8: out_low = 10'h25c;
            4'h9: out_low = 10'h25b;
            4'ha: out_low = 10'h25b;
            4'hb: out_low = 10'h25b;
            4'hc: out_low = 10'h25b;
            4'hd: out_low = 10'h25a;
            4'he: out_low = 10'h25a;
            4'hf: out_low = 10'h25a;
            default: out_low = 10'h000;
          endcase
        end
        default: out_low = 10'h000;
      endcase
      end
      2'h1: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 10'h259;
            4'h1: out_low = 10'h259;
            4'h2: out_low = 10'h258;
            4'h3: out_low = 10'h258;
            4'h4: out_low = 10'h257;
            4'h5: out_low = 10'h257;
            4'h6: out_low = 10'h256;
            4'h7: out_low = 10'h256;
            4'h8: out_low = 10'h255;
            4'h9: out_low = 10'h255;
            4'ha: out_low = 10'h254;
            4'hb: out_low = 10'h254;
            4'hc: out_low = 10'h253;
            4'hd: out_low = 10'h253;
            4'he: out_low = 10'h252;
            4'hf: out_low = 10'h252;
            default: out_low = 10'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 10'h251;
            4'h1: out_low = 10'h251;
            4'h2: out_low = 10'h250;
            4'h3: out_low = 10'h250;
            4'h4: out_low = 10'h24f;
            4'h5: out_low = 10'h24f;
            4'h6: out_low = 10'h24e;
            4'h7: out_low = 10'h24e;
            4'h8: out_low = 10'h24d;
            4'h9: out_low = 10'h24c;
            4'ha: out_low = 10'h24c;
            4'hb: out_low = 10'h24b;
            4'hc: out_low = 10'h24b;
            4'hd: out_low = 10'h24a;
            4'he: out_low = 10'h24a;
            4'hf: out_low = 10'h249;
            default: out_low = 10'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 10'h249;
            4'h1: out_low = 10'h248;
            4'h2: out_low = 10'h248;
            4'h3: out_low = 10'h247;
            4'h4: out_low = 10'h247;
            4'h5: out_low = 10'h246;
            4'h6: out_low = 10'h246;
            4'h7: out_low = 10'h245;
            4'h8: out_low = 10'h245;
            4'h9: out_low = 10'h244;
            4'ha: out_low = 10'h244;
            4'hb: out_low = 10'h243;
            4'hc: out_low = 10'h243;
            4'hd: out_low = 10'h242;
            4'he: out_low = 10'h242;
            4'hf: out_low = 10'h241;
            default: out_low = 10'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 10'h241;
            4'h1: out_low = 10'h240;
            4'h2: out_low = 10'h240;
            4'h3: out_low = 10'h23f;
            4'h4: out_low = 10'h23f;
            4'h5: out_low = 10'h23e;
            4'h6: out_low = 10'h23e;
            4'h7: out_low = 10'h23d;
            4'h8: out_low = 10'h23d;
            4'h9: out_low = 10'h23c;
            4'ha: out_low = 10'h23c;
            4'hb: out_low = 10'h23b;
            4'hc: out_low = 10'h23b;
            4'hd: out_low = 10'h23a;
            4'he: out_low = 10'h23a;
            4'hf: out_low = 10'h239;
            default: out_low = 10'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 10'h239;
            4'h1: out_low = 10'h238;
            4'h2: out_low = 10'h238;
            4'h3: out_low = 10'h238;
            4'h4: out_low = 10'h237;
            4'h5: out_low = 10'h237;
            4'h6: out_low = 10'h236;
            4'h7: out_low = 10'h236;
            4'h8: out_low = 10'h235;
            4'h9: out_low = 10'h235;
            4'ha: out_low = 10'h234;
            4'hb: out_low = 10'h234;
            4'hc: out_low = 10'h233;
            4'hd: out_low = 10'h233;
            4'he: out_low = 10'h232;
            4'hf: out_low = 10'h232;
            default: out_low = 10'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 10'h231;
            4'h1: out_low = 10'h231;
            4'h2: out_low = 10'h230;
            4'h3: out_low = 10'h230;
            4'h4: out_low = 10'h22f;
            4'h5: out_low = 10'h22f;
            4'h6: out_low = 10'h22e;
            4'h7: out_low = 10'h22e;
            4'h8: out_low = 10'h22d;
            4'h9: out_low = 10'h22d;
            4'ha: out_low = 10'h22c;
            4'hb: out_low = 10'h22c;
            4'hc: out_low = 10'h22c;
            4'hd: out_low = 10'h22b;
            4'he: out_low = 10'h22b;
            4'hf: out_low = 10'h22a;
            default: out_low = 10'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 10'h22a;
            4'h1: out_low = 10'h229;
            4'h2: out_low = 10'h229;
            4'h3: out_low = 10'h228;
            4'h4: out_low = 10'h228;
            4'h5: out_low = 10'h227;
            4'h6: out_low = 10'h227;
            4'h7: out_low = 10'h226;
            4'h8: out_low = 10'h226;
            4'h9: out_low = 10'h225;
            4'ha: out_low = 10'h225;
            4'hb: out_low = 10'h225;
            4'hc: out_low = 10'h224;
            4'hd: out_low = 10'h224;
            4'he: out_low = 10'h223;
            4'hf: out_low = 10'h223;
            default: out_low = 10'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 10'h222;
            4'h1: out_low = 10'h222;
            4'h2: out_low = 10'h221;
            4'h3: out_low = 10'h221;
            4'h4: out_low = 10'h220;
            4'h5: out_low = 10'h220;
            4'h6: out_low = 10'h21f;
            4'h7: out_low = 10'h21f;
            4'h8: out_low = 10'h21f;
            4'h9: out_low = 10'h21e;
            4'ha: out_low = 10'h21e;
            4'hb: out_low = 10'h21d;
            4'hc: out_low = 10'h21d;
            4'hd: out_low = 10'h21c;
            4'he: out_low = 10'h21c;
            4'hf: out_low = 10'h21b;
            default: out_low = 10'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 10'h21b;
            4'h1: out_low = 10'h21a;
            4'h2: out_low = 10'h21a;
            4'h3: out_low = 10'h21a;
            4'h4: out_low = 10'h219;
            4'h5: out_low = 10'h219;
            4'h6: out_low = 10'h218;
            4'h7: out_low = 10'h218;
            4'h8: out_low = 10'h217;
            4'h9: out_low = 10'h217;
            4'ha: out_low = 10'h216;
            4'hb: out_low = 10'h216;
            4'hc: out_low = 10'h216;
            4'hd: out_low = 10'h215;
            4'he: out_low = 10'h215;
            4'hf: out_low = 10'h214;
            default: out_low = 10'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 10'h214;
            4'h1: out_low = 10'h213;
            4'h2: out_low = 10'h213;
            4'h3: out_low = 10'h212;
            4'h4: out_low = 10'h212;
            4'h5: out_low = 10'h212;
            4'h6: out_low = 10'h211;
            4'h7: out_low = 10'h211;
            4'h8: out_low = 10'h210;
            4'h9: out_low = 10'h210;
            4'ha: out_low = 10'h20f;
            4'hb: out_low = 10'h20f;
            4'hc: out_low = 10'h20e;
            4'hd: out_low = 10'h20e;
            4'he: out_low = 10'h20e;
            4'hf: out_low = 10'h20d;
            default: out_low = 10'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h20d;
            4'h1: out_low = 10'h20c;
            4'h2: out_low = 10'h20c;
            4'h3: out_low = 10'h20b;
            4'h4: out_low = 10'h20b;
            4'h5: out_low = 10'h20b;
            4'h6: out_low = 10'h20a;
            4'h7: out_low = 10'h20a;
            4'h8: out_low = 10'h209;
            4'h9: out_low = 10'h209;
            4'ha: out_low = 10'h208;
            4'hb: out_low = 10'h208;
            4'hc: out_low = 10'h208;
            4'hd: out_low = 10'h207;
            4'he: out_low = 10'h207;
            4'hf: out_low = 10'h206;
            default: out_low = 10'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h206;
            4'h1: out_low = 10'h205;
            4'h2: out_low = 10'h205;
            4'h3: out_low = 10'h205;
            4'h4: out_low = 10'h204;
            4'h5: out_low = 10'h204;
            4'h6: out_low = 10'h203;
            4'h7: out_low = 10'h203;
            4'h8: out_low = 10'h202;
            4'h9: out_low = 10'h202;
            4'ha: out_low = 10'h202;
            4'hb: out_low = 10'h201;
            4'hc: out_low = 10'h201;
            4'hd: out_low = 10'h200;
            4'he: out_low = 10'h200;
            4'hf: out_low = 10'h1ff;
            default: out_low = 10'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1ff;
            4'h1: out_low = 10'h1ff;
            4'h2: out_low = 10'h1fe;
            4'h3: out_low = 10'h1fe;
            4'h4: out_low = 10'h1fd;
            4'h5: out_low = 10'h1fd;
            4'h6: out_low = 10'h1fc;
            4'h7: out_low = 10'h1fc;
            4'h8: out_low = 10'h1fc;
            4'h9: out_low = 10'h1fb;
            4'ha: out_low = 10'h1fb;
            4'hb: out_low = 10'h1fa;
            4'hc: out_low = 10'h1fa;
            4'hd: out_low = 10'h1fa;
            4'he: out_low = 10'h1f9;
            4'hf: out_low = 10'h1f9;
            default: out_low = 10'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1f8;
            4'h1: out_low = 10'h1f8;
            4'h2: out_low = 10'h1f8;
            4'h3: out_low = 10'h1f7;
            4'h4: out_low = 10'h1f7;
            4'h5: out_low = 10'h1f6;
            4'h6: out_low = 10'h1f6;
            4'h7: out_low = 10'h1f5;
            4'h8: out_low = 10'h1f5;
            4'h9: out_low = 10'h1f5;
            4'ha: out_low = 10'h1f4;
            4'hb: out_low = 10'h1f4;
            4'hc: out_low = 10'h1f3;
            4'hd: out_low = 10'h1f3;
            4'he: out_low = 10'h1f3;
            4'hf: out_low = 10'h1f2;
            default: out_low = 10'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1f2;
            4'h1: out_low = 10'h1f1;
            4'h2: out_low = 10'h1f1;
            4'h3: out_low = 10'h1f1;
            4'h4: out_low = 10'h1f0;
            4'h5: out_low = 10'h1f0;
            4'h6: out_low = 10'h1ef;
            4'h7: out_low = 10'h1ef;
            4'h8: out_low = 10'h1ef;
            4'h9: out_low = 10'h1ee;
            4'ha: out_low = 10'h1ee;
            4'hb: out_low = 10'h1ed;
            4'hc: out_low = 10'h1ed;
            4'hd: out_low = 10'h1ed;
            4'he: out_low = 10'h1ec;
            4'hf: out_low = 10'h1ec;
            default: out_low = 10'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1eb;
            4'h1: out_low = 10'h1eb;
            4'h2: out_low = 10'h1eb;
            4'h3: out_low = 10'h1ea;
            4'h4: out_low = 10'h1ea;
            4'h5: out_low = 10'h1e9;
            4'h6: out_low = 10'h1e9;
            4'h7: out_low = 10'h1e9;
            4'h8: out_low = 10'h1e8;
            4'h9: out_low = 10'h1e8;
            4'ha: out_low = 10'h1e7;
            4'hb: out_low = 10'h1e7;
            4'hc: out_low = 10'h1e7;
            4'hd: out_low = 10'h1e6;
            4'he: out_low = 10'h1e6;
            4'hf: out_low = 10'h1e5;
            default: out_low = 10'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1e5;
            4'h1: out_low = 10'h1e5;
            4'h2: out_low = 10'h1e4;
            4'h3: out_low = 10'h1e4;
            4'h4: out_low = 10'h1e3;
            4'h5: out_low = 10'h1e3;
            4'h6: out_low = 10'h1e3;
            4'h7: out_low = 10'h1e2;
            4'h8: out_low = 10'h1e2;
            4'h9: out_low = 10'h1e1;
            4'ha: out_low = 10'h1e1;
            4'hb: out_low = 10'h1e1;
            4'hc: out_low = 10'h1e0;
            4'hd: out_low = 10'h1e0;
            4'he: out_low = 10'h1e0;
            4'hf: out_low = 10'h1df;
            default: out_low = 10'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1df;
            4'h1: out_low = 10'h1de;
            4'h2: out_low = 10'h1de;
            4'h3: out_low = 10'h1de;
            4'h4: out_low = 10'h1dd;
            4'h5: out_low = 10'h1dd;
            4'h6: out_low = 10'h1dc;
            4'h7: out_low = 10'h1dc;
            4'h8: out_low = 10'h1dc;
            4'h9: out_low = 10'h1db;
            4'ha: out_low = 10'h1db;
            4'hb: out_low = 10'h1db;
            4'hc: out_low = 10'h1da;
            4'hd: out_low = 10'h1da;
            4'he: out_low = 10'h1d9;
            4'hf: out_low = 10'h1d9;
            default: out_low = 10'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1d9;
            4'h1: out_low = 10'h1d8;
            4'h2: out_low = 10'h1d8;
            4'h3: out_low = 10'h1d7;
            4'h4: out_low = 10'h1d7;
            4'h5: out_low = 10'h1d7;
            4'h6: out_low = 10'h1d6;
            4'h7: out_low = 10'h1d6;
            4'h8: out_low = 10'h1d6;
            4'h9: out_low = 10'h1d5;
            4'ha: out_low = 10'h1d5;
            4'hb: out_low = 10'h1d4;
            4'hc: out_low = 10'h1d4;
            4'hd: out_low = 10'h1d4;
            4'he: out_low = 10'h1d3;
            4'hf: out_low = 10'h1d3;
            default: out_low = 10'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1d3;
            4'h1: out_low = 10'h1d2;
            4'h2: out_low = 10'h1d2;
            4'h3: out_low = 10'h1d1;
            4'h4: out_low = 10'h1d1;
            4'h5: out_low = 10'h1d1;
            4'h6: out_low = 10'h1d0;
            4'h7: out_low = 10'h1d0;
            4'h8: out_low = 10'h1d0;
            4'h9: out_low = 10'h1cf;
            4'ha: out_low = 10'h1cf;
            4'hb: out_low = 10'h1ce;
            4'hc: out_low = 10'h1ce;
            4'hd: out_low = 10'h1ce;
            4'he: out_low = 10'h1cd;
            4'hf: out_low = 10'h1cd;
            default: out_low = 10'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1cd;
            4'h1: out_low = 10'h1cc;
            4'h2: out_low = 10'h1cc;
            4'h3: out_low = 10'h1cc;
            4'h4: out_low = 10'h1cb;
            4'h5: out_low = 10'h1cb;
            4'h6: out_low = 10'h1ca;
            4'h7: out_low = 10'h1ca;
            4'h8: out_low = 10'h1ca;
            4'h9: out_low = 10'h1c9;
            4'ha: out_low = 10'h1c9;
            4'hb: out_low = 10'h1c9;
            4'hc: out_low = 10'h1c8;
            4'hd: out_low = 10'h1c8;
            4'he: out_low = 10'h1c8;
            4'hf: out_low = 10'h1c7;
            default: out_low = 10'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1c7;
            4'h1: out_low = 10'h1c6;
            4'h2: out_low = 10'h1c6;
            4'h3: out_low = 10'h1c6;
            4'h4: out_low = 10'h1c5;
            4'h5: out_low = 10'h1c5;
            4'h6: out_low = 10'h1c5;
            4'h7: out_low = 10'h1c4;
            4'h8: out_low = 10'h1c4;
            4'h9: out_low = 10'h1c4;
            4'ha: out_low = 10'h1c3;
            4'hb: out_low = 10'h1c3;
            4'hc: out_low = 10'h1c2;
            4'hd: out_low = 10'h1c2;
            4'he: out_low = 10'h1c2;
            4'hf: out_low = 10'h1c1;
            default: out_low = 10'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1c1;
            4'h1: out_low = 10'h1c1;
            4'h2: out_low = 10'h1c0;
            4'h3: out_low = 10'h1c0;
            4'h4: out_low = 10'h1c0;
            4'h5: out_low = 10'h1bf;
            4'h6: out_low = 10'h1bf;
            4'h7: out_low = 10'h1bf;
            4'h8: out_low = 10'h1be;
            4'h9: out_low = 10'h1be;
            4'ha: out_low = 10'h1bd;
            4'hb: out_low = 10'h1bd;
            4'hc: out_low = 10'h1bd;
            4'hd: out_low = 10'h1bc;
            4'he: out_low = 10'h1bc;
            4'hf: out_low = 10'h1bc;
            default: out_low = 10'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1bb;
            4'h1: out_low = 10'h1bb;
            4'h2: out_low = 10'h1bb;
            4'h3: out_low = 10'h1ba;
            4'h4: out_low = 10'h1ba;
            4'h5: out_low = 10'h1ba;
            4'h6: out_low = 10'h1b9;
            4'h7: out_low = 10'h1b9;
            4'h8: out_low = 10'h1b9;
            4'h9: out_low = 10'h1b8;
            4'ha: out_low = 10'h1b8;
            4'hb: out_low = 10'h1b8;
            4'hc: out_low = 10'h1b7;
            4'hd: out_low = 10'h1b7;
            4'he: out_low = 10'h1b6;
            4'hf: out_low = 10'h1b6;
            default: out_low = 10'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1b6;
            4'h1: out_low = 10'h1b5;
            4'h2: out_low = 10'h1b5;
            4'h3: out_low = 10'h1b5;
            4'h4: out_low = 10'h1b4;
            4'h5: out_low = 10'h1b4;
            4'h6: out_low = 10'h1b4;
            4'h7: out_low = 10'h1b3;
            4'h8: out_low = 10'h1b3;
            4'h9: out_low = 10'h1b3;
            4'ha: out_low = 10'h1b2;
            4'hb: out_low = 10'h1b2;
            4'hc: out_low = 10'h1b2;
            4'hd: out_low = 10'h1b1;
            4'he: out_low = 10'h1b1;
            4'hf: out_low = 10'h1b1;
            default: out_low = 10'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1b0;
            4'h1: out_low = 10'h1b0;
            4'h2: out_low = 10'h1b0;
            4'h3: out_low = 10'h1af;
            4'h4: out_low = 10'h1af;
            4'h5: out_low = 10'h1af;
            4'h6: out_low = 10'h1ae;
            4'h7: out_low = 10'h1ae;
            4'h8: out_low = 10'h1ae;
            4'h9: out_low = 10'h1ad;
            4'ha: out_low = 10'h1ad;
            4'hb: out_low = 10'h1ad;
            4'hc: out_low = 10'h1ac;
            4'hd: out_low = 10'h1ac;
            4'he: out_low = 10'h1ac;
            4'hf: out_low = 10'h1ab;
            default: out_low = 10'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1ab;
            4'h1: out_low = 10'h1ab;
            4'h2: out_low = 10'h1aa;
            4'h3: out_low = 10'h1aa;
            4'h4: out_low = 10'h1aa;
            4'h5: out_low = 10'h1a9;
            4'h6: out_low = 10'h1a9;
            4'h7: out_low = 10'h1a9;
            4'h8: out_low = 10'h1a8;
            4'h9: out_low = 10'h1a8;
            4'ha: out_low = 10'h1a8;
            4'hb: out_low = 10'h1a7;
            4'hc: out_low = 10'h1a7;
            4'hd: out_low = 10'h1a7;
            4'he: out_low = 10'h1a6;
            4'hf: out_low = 10'h1a6;
            default: out_low = 10'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1a6;
            4'h1: out_low = 10'h1a5;
            4'h2: out_low = 10'h1a5;
            4'h3: out_low = 10'h1a5;
            4'h4: out_low = 10'h1a4;
            4'h5: out_low = 10'h1a4;
            4'h6: out_low = 10'h1a4;
            4'h7: out_low = 10'h1a3;
            4'h8: out_low = 10'h1a3;
            4'h9: out_low = 10'h1a3;
            4'ha: out_low = 10'h1a2;
            4'hb: out_low = 10'h1a2;
            4'hc: out_low = 10'h1a2;
            4'hd: out_low = 10'h1a1;
            4'he: out_low = 10'h1a1;
            4'hf: out_low = 10'h1a1;
            default: out_low = 10'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1a0;
            4'h1: out_low = 10'h1a0;
            4'h2: out_low = 10'h1a0;
            4'h3: out_low = 10'h19f;
            4'h4: out_low = 10'h19f;
            4'h5: out_low = 10'h19f;
            4'h6: out_low = 10'h19e;
            4'h7: out_low = 10'h19e;
            4'h8: out_low = 10'h19e;
            4'h9: out_low = 10'h19d;
            4'ha: out_low = 10'h19d;
            4'hb: out_low = 10'h19d;
            4'hc: out_low = 10'h19c;
            4'hd: out_low = 10'h19c;
            4'he: out_low = 10'h19c;
            4'hf: out_low = 10'h19b;
            default: out_low = 10'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h19b;
            4'h1: out_low = 10'h19b;
            4'h2: out_low = 10'h19a;
            4'h3: out_low = 10'h19a;
            4'h4: out_low = 10'h19a;
            4'h5: out_low = 10'h19a;
            4'h6: out_low = 10'h199;
            4'h7: out_low = 10'h199;
            4'h8: out_low = 10'h199;
            4'h9: out_low = 10'h198;
            4'ha: out_low = 10'h198;
            4'hb: out_low = 10'h198;
            4'hc: out_low = 10'h197;
            4'hd: out_low = 10'h197;
            4'he: out_low = 10'h197;
            4'hf: out_low = 10'h196;
            default: out_low = 10'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h196;
            4'h1: out_low = 10'h196;
            4'h2: out_low = 10'h195;
            4'h3: out_low = 10'h195;
            4'h4: out_low = 10'h195;
            4'h5: out_low = 10'h194;
            4'h6: out_low = 10'h194;
            4'h7: out_low = 10'h194;
            4'h8: out_low = 10'h193;
            4'h9: out_low = 10'h193;
            4'ha: out_low = 10'h193;
            4'hb: out_low = 10'h193;
            4'hc: out_low = 10'h192;
            4'hd: out_low = 10'h192;
            4'he: out_low = 10'h192;
            4'hf: out_low = 10'h191;
            default: out_low = 10'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h191;
            4'h1: out_low = 10'h191;
            4'h2: out_low = 10'h190;
            4'h3: out_low = 10'h190;
            4'h4: out_low = 10'h190;
            4'h5: out_low = 10'h18f;
            4'h6: out_low = 10'h18f;
            4'h7: out_low = 10'h18f;
            4'h8: out_low = 10'h18e;
            4'h9: out_low = 10'h18e;
            4'ha: out_low = 10'h18e;
            4'hb: out_low = 10'h18e;
            4'hc: out_low = 10'h18d;
            4'hd: out_low = 10'h18d;
            4'he: out_low = 10'h18d;
            4'hf: out_low = 10'h18c;
            default: out_low = 10'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 10'h18c;
            4'h1: out_low = 10'h18c;
            4'h2: out_low = 10'h18b;
            4'h3: out_low = 10'h18b;
            4'h4: out_low = 10'h18b;
            4'h5: out_low = 10'h18a;
            4'h6: out_low = 10'h18a;
            4'h7: out_low = 10'h18a;
            4'h8: out_low = 10'h18a;
            4'h9: out_low = 10'h189;
            4'ha: out_low = 10'h189;
            4'hb: out_low = 10'h189;
            4'hc: out_low = 10'h188;
            4'hd: out_low = 10'h188;
            4'he: out_low = 10'h188;
            4'hf: out_low = 10'h187;
            default: out_low = 10'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 10'h187;
            4'h1: out_low = 10'h187;
            4'h2: out_low = 10'h186;
            4'h3: out_low = 10'h186;
            4'h4: out_low = 10'h186;
            4'h5: out_low = 10'h186;
            4'h6: out_low = 10'h185;
            4'h7: out_low = 10'h185;
            4'h8: out_low = 10'h185;
            4'h9: out_low = 10'h184;
            4'ha: out_low = 10'h184;
            4'hb: out_low = 10'h184;
            4'hc: out_low = 10'h183;
            4'hd: out_low = 10'h183;
            4'he: out_low = 10'h183;
            4'hf: out_low = 10'h183;
            default: out_low = 10'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 10'h182;
            4'h1: out_low = 10'h182;
            4'h2: out_low = 10'h182;
            4'h3: out_low = 10'h181;
            4'h4: out_low = 10'h181;
            4'h5: out_low = 10'h181;
            4'h6: out_low = 10'h180;
            4'h7: out_low = 10'h180;
            4'h8: out_low = 10'h180;
            4'h9: out_low = 10'h180;
            4'ha: out_low = 10'h17f;
            4'hb: out_low = 10'h17f;
            4'hc: out_low = 10'h17f;
            4'hd: out_low = 10'h17e;
            4'he: out_low = 10'h17e;
            4'hf: out_low = 10'h17e;
            default: out_low = 10'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 10'h17e;
            4'h1: out_low = 10'h17d;
            4'h2: out_low = 10'h17d;
            4'h3: out_low = 10'h17d;
            4'h4: out_low = 10'h17c;
            4'h5: out_low = 10'h17c;
            4'h6: out_low = 10'h17c;
            4'h7: out_low = 10'h17b;
            4'h8: out_low = 10'h17b;
            4'h9: out_low = 10'h17b;
            4'ha: out_low = 10'h17b;
            4'hb: out_low = 10'h17a;
            4'hc: out_low = 10'h17a;
            4'hd: out_low = 10'h17a;
            4'he: out_low = 10'h179;
            4'hf: out_low = 10'h179;
            default: out_low = 10'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 10'h179;
            4'h1: out_low = 10'h179;
            4'h2: out_low = 10'h178;
            4'h3: out_low = 10'h178;
            4'h4: out_low = 10'h178;
            4'h5: out_low = 10'h177;
            4'h6: out_low = 10'h177;
            4'h7: out_low = 10'h177;
            4'h8: out_low = 10'h176;
            4'h9: out_low = 10'h176;
            4'ha: out_low = 10'h176;
            4'hb: out_low = 10'h176;
            4'hc: out_low = 10'h175;
            4'hd: out_low = 10'h175;
            4'he: out_low = 10'h175;
            4'hf: out_low = 10'h174;
            default: out_low = 10'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 10'h174;
            4'h1: out_low = 10'h174;
            4'h2: out_low = 10'h174;
            4'h3: out_low = 10'h173;
            4'h4: out_low = 10'h173;
            4'h5: out_low = 10'h173;
            4'h6: out_low = 10'h172;
            4'h7: out_low = 10'h172;
            4'h8: out_low = 10'h172;
            4'h9: out_low = 10'h172;
            4'ha: out_low = 10'h171;
            4'hb: out_low = 10'h171;
            4'hc: out_low = 10'h171;
            4'hd: out_low = 10'h170;
            4'he: out_low = 10'h170;
            4'hf: out_low = 10'h170;
            default: out_low = 10'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 10'h170;
            4'h1: out_low = 10'h16f;
            4'h2: out_low = 10'h16f;
            4'h3: out_low = 10'h16f;
            4'h4: out_low = 10'h16e;
            4'h5: out_low = 10'h16e;
            4'h6: out_low = 10'h16e;
            4'h7: out_low = 10'h16e;
            4'h8: out_low = 10'h16d;
            4'h9: out_low = 10'h16d;
            4'ha: out_low = 10'h16d;
            4'hb: out_low = 10'h16c;
            4'hc: out_low = 10'h16c;
            4'hd: out_low = 10'h16c;
            4'he: out_low = 10'h16c;
            4'hf: out_low = 10'h16b;
            default: out_low = 10'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 10'h16b;
            4'h1: out_low = 10'h16b;
            4'h2: out_low = 10'h16b;
            4'h3: out_low = 10'h16a;
            4'h4: out_low = 10'h16a;
            4'h5: out_low = 10'h16a;
            4'h6: out_low = 10'h169;
            4'h7: out_low = 10'h169;
            4'h8: out_low = 10'h169;
            4'h9: out_low = 10'h169;
            4'ha: out_low = 10'h168;
            4'hb: out_low = 10'h168;
            4'hc: out_low = 10'h168;
            4'hd: out_low = 10'h167;
            4'he: out_low = 10'h167;
            4'hf: out_low = 10'h167;
            default: out_low = 10'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 10'h167;
            4'h1: out_low = 10'h166;
            4'h2: out_low = 10'h166;
            4'h3: out_low = 10'h166;
            4'h4: out_low = 10'h166;
            4'h5: out_low = 10'h165;
            4'h6: out_low = 10'h165;
            4'h7: out_low = 10'h165;
            4'h8: out_low = 10'h164;
            4'h9: out_low = 10'h164;
            4'ha: out_low = 10'h164;
            4'hb: out_low = 10'h164;
            4'hc: out_low = 10'h163;
            4'hd: out_low = 10'h163;
            4'he: out_low = 10'h163;
            4'hf: out_low = 10'h162;
            default: out_low = 10'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 10'h162;
            4'h1: out_low = 10'h162;
            4'h2: out_low = 10'h162;
            4'h3: out_low = 10'h161;
            4'h4: out_low = 10'h161;
            4'h5: out_low = 10'h161;
            4'h6: out_low = 10'h161;
            4'h7: out_low = 10'h160;
            4'h8: out_low = 10'h160;
            4'h9: out_low = 10'h160;
            4'ha: out_low = 10'h15f;
            4'hb: out_low = 10'h15f;
            4'hc: out_low = 10'h15f;
            4'hd: out_low = 10'h15f;
            4'he: out_low = 10'h15e;
            4'hf: out_low = 10'h15e;
            default: out_low = 10'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h15e;
            4'h1: out_low = 10'h15e;
            4'h2: out_low = 10'h15d;
            4'h3: out_low = 10'h15d;
            4'h4: out_low = 10'h15d;
            4'h5: out_low = 10'h15d;
            4'h6: out_low = 10'h15c;
            4'h7: out_low = 10'h15c;
            4'h8: out_low = 10'h15c;
            4'h9: out_low = 10'h15b;
            4'ha: out_low = 10'h15b;
            4'hb: out_low = 10'h15b;
            4'hc: out_low = 10'h15b;
            4'hd: out_low = 10'h15a;
            4'he: out_low = 10'h15a;
            4'hf: out_low = 10'h15a;
            default: out_low = 10'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h15a;
            4'h1: out_low = 10'h159;
            4'h2: out_low = 10'h159;
            4'h3: out_low = 10'h159;
            4'h4: out_low = 10'h159;
            4'h5: out_low = 10'h158;
            4'h6: out_low = 10'h158;
            4'h7: out_low = 10'h158;
            4'h8: out_low = 10'h157;
            4'h9: out_low = 10'h157;
            4'ha: out_low = 10'h157;
            4'hb: out_low = 10'h157;
            4'hc: out_low = 10'h156;
            4'hd: out_low = 10'h156;
            4'he: out_low = 10'h156;
            4'hf: out_low = 10'h156;
            default: out_low = 10'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h155;
            4'h1: out_low = 10'h155;
            4'h2: out_low = 10'h155;
            4'h3: out_low = 10'h155;
            4'h4: out_low = 10'h154;
            4'h5: out_low = 10'h154;
            4'h6: out_low = 10'h154;
            4'h7: out_low = 10'h153;
            4'h8: out_low = 10'h153;
            4'h9: out_low = 10'h153;
            4'ha: out_low = 10'h153;
            4'hb: out_low = 10'h152;
            4'hc: out_low = 10'h152;
            4'hd: out_low = 10'h152;
            4'he: out_low = 10'h152;
            4'hf: out_low = 10'h151;
            default: out_low = 10'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h151;
            4'h1: out_low = 10'h151;
            4'h2: out_low = 10'h151;
            4'h3: out_low = 10'h150;
            4'h4: out_low = 10'h150;
            4'h5: out_low = 10'h150;
            4'h6: out_low = 10'h150;
            4'h7: out_low = 10'h14f;
            4'h8: out_low = 10'h14f;
            4'h9: out_low = 10'h14f;
            4'ha: out_low = 10'h14f;
            4'hb: out_low = 10'h14e;
            4'hc: out_low = 10'h14e;
            4'hd: out_low = 10'h14e;
            4'he: out_low = 10'h14e;
            4'hf: out_low = 10'h14d;
            default: out_low = 10'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h14d;
            4'h1: out_low = 10'h14d;
            4'h2: out_low = 10'h14c;
            4'h3: out_low = 10'h14c;
            4'h4: out_low = 10'h14c;
            4'h5: out_low = 10'h14c;
            4'h6: out_low = 10'h14b;
            4'h7: out_low = 10'h14b;
            4'h8: out_low = 10'h14b;
            4'h9: out_low = 10'h14b;
            4'ha: out_low = 10'h14a;
            4'hb: out_low = 10'h14a;
            4'hc: out_low = 10'h14a;
            4'hd: out_low = 10'h14a;
            4'he: out_low = 10'h149;
            4'hf: out_low = 10'h149;
            default: out_low = 10'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h149;
            4'h1: out_low = 10'h149;
            4'h2: out_low = 10'h148;
            4'h3: out_low = 10'h148;
            4'h4: out_low = 10'h148;
            4'h5: out_low = 10'h148;
            4'h6: out_low = 10'h147;
            4'h7: out_low = 10'h147;
            4'h8: out_low = 10'h147;
            4'h9: out_low = 10'h147;
            4'ha: out_low = 10'h146;
            4'hb: out_low = 10'h146;
            4'hc: out_low = 10'h146;
            4'hd: out_low = 10'h146;
            4'he: out_low = 10'h145;
            4'hf: out_low = 10'h145;
            default: out_low = 10'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 10'h145;
            4'h1: out_low = 10'h145;
            4'h2: out_low = 10'h144;
            4'h3: out_low = 10'h144;
            4'h4: out_low = 10'h144;
            4'h5: out_low = 10'h144;
            4'h6: out_low = 10'h143;
            4'h7: out_low = 10'h143;
            4'h8: out_low = 10'h143;
            4'h9: out_low = 10'h143;
            4'ha: out_low = 10'h142;
            4'hb: out_low = 10'h142;
            4'hc: out_low = 10'h142;
            4'hd: out_low = 10'h142;
            4'he: out_low = 10'h141;
            4'hf: out_low = 10'h141;
            default: out_low = 10'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 10'h141;
            4'h1: out_low = 10'h141;
            4'h2: out_low = 10'h140;
            4'h3: out_low = 10'h140;
            4'h4: out_low = 10'h140;
            4'h5: out_low = 10'h140;
            4'h6: out_low = 10'h13f;
            4'h7: out_low = 10'h13f;
            4'h8: out_low = 10'h13f;
            4'h9: out_low = 10'h13f;
            4'ha: out_low = 10'h13e;
            4'hb: out_low = 10'h13e;
            4'hc: out_low = 10'h13e;
            4'hd: out_low = 10'h13e;
            4'he: out_low = 10'h13d;
            4'hf: out_low = 10'h13d;
            default: out_low = 10'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 10'h13d;
            4'h1: out_low = 10'h13d;
            4'h2: out_low = 10'h13c;
            4'h3: out_low = 10'h13c;
            4'h4: out_low = 10'h13c;
            4'h5: out_low = 10'h13c;
            4'h6: out_low = 10'h13b;
            4'h7: out_low = 10'h13b;
            4'h8: out_low = 10'h13b;
            4'h9: out_low = 10'h13b;
            4'ha: out_low = 10'h13b;
            4'hb: out_low = 10'h13a;
            4'hc: out_low = 10'h13a;
            4'hd: out_low = 10'h13a;
            4'he: out_low = 10'h13a;
            4'hf: out_low = 10'h139;
            default: out_low = 10'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 10'h139;
            4'h1: out_low = 10'h139;
            4'h2: out_low = 10'h139;
            4'h3: out_low = 10'h138;
            4'h4: out_low = 10'h138;
            4'h5: out_low = 10'h138;
            4'h6: out_low = 10'h138;
            4'h7: out_low = 10'h137;
            4'h8: out_low = 10'h137;
            4'h9: out_low = 10'h137;
            4'ha: out_low = 10'h137;
            4'hb: out_low = 10'h136;
            4'hc: out_low = 10'h136;
            4'hd: out_low = 10'h136;
            4'he: out_low = 10'h136;
            4'hf: out_low = 10'h135;
            default: out_low = 10'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 10'h135;
            4'h1: out_low = 10'h135;
            4'h2: out_low = 10'h135;
            4'h3: out_low = 10'h134;
            4'h4: out_low = 10'h134;
            4'h5: out_low = 10'h134;
            4'h6: out_low = 10'h134;
            4'h7: out_low = 10'h134;
            4'h8: out_low = 10'h133;
            4'h9: out_low = 10'h133;
            4'ha: out_low = 10'h133;
            4'hb: out_low = 10'h133;
            4'hc: out_low = 10'h132;
            4'hd: out_low = 10'h132;
            4'he: out_low = 10'h132;
            4'hf: out_low = 10'h132;
            default: out_low = 10'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 10'h131;
            4'h1: out_low = 10'h131;
            4'h2: out_low = 10'h131;
            4'h3: out_low = 10'h131;
            4'h4: out_low = 10'h130;
            4'h5: out_low = 10'h130;
            4'h6: out_low = 10'h130;
            4'h7: out_low = 10'h130;
            4'h8: out_low = 10'h12f;
            4'h9: out_low = 10'h12f;
            4'ha: out_low = 10'h12f;
            4'hb: out_low = 10'h12f;
            4'hc: out_low = 10'h12f;
            4'hd: out_low = 10'h12e;
            4'he: out_low = 10'h12e;
            4'hf: out_low = 10'h12e;
            default: out_low = 10'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 10'h12e;
            4'h1: out_low = 10'h12d;
            4'h2: out_low = 10'h12d;
            4'h3: out_low = 10'h12d;
            4'h4: out_low = 10'h12d;
            4'h5: out_low = 10'h12c;
            4'h6: out_low = 10'h12c;
            4'h7: out_low = 10'h12c;
            4'h8: out_low = 10'h12c;
            4'h9: out_low = 10'h12c;
            4'ha: out_low = 10'h12b;
            4'hb: out_low = 10'h12b;
            4'hc: out_low = 10'h12b;
            4'hd: out_low = 10'h12b;
            4'he: out_low = 10'h12a;
            4'hf: out_low = 10'h12a;
            default: out_low = 10'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 10'h12a;
            4'h1: out_low = 10'h12a;
            4'h2: out_low = 10'h129;
            4'h3: out_low = 10'h129;
            4'h4: out_low = 10'h129;
            4'h5: out_low = 10'h129;
            4'h6: out_low = 10'h129;
            4'h7: out_low = 10'h128;
            4'h8: out_low = 10'h128;
            4'h9: out_low = 10'h128;
            4'ha: out_low = 10'h128;
            4'hb: out_low = 10'h127;
            4'hc: out_low = 10'h127;
            4'hd: out_low = 10'h127;
            4'he: out_low = 10'h127;
            4'hf: out_low = 10'h126;
            default: out_low = 10'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 10'h126;
            4'h1: out_low = 10'h126;
            4'h2: out_low = 10'h126;
            4'h3: out_low = 10'h126;
            4'h4: out_low = 10'h125;
            4'h5: out_low = 10'h125;
            4'h6: out_low = 10'h125;
            4'h7: out_low = 10'h125;
            4'h8: out_low = 10'h124;
            4'h9: out_low = 10'h124;
            4'ha: out_low = 10'h124;
            4'hb: out_low = 10'h124;
            4'hc: out_low = 10'h123;
            4'hd: out_low = 10'h123;
            4'he: out_low = 10'h123;
            4'hf: out_low = 10'h123;
            default: out_low = 10'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 10'h123;
            4'h1: out_low = 10'h122;
            4'h2: out_low = 10'h122;
            4'h3: out_low = 10'h122;
            4'h4: out_low = 10'h122;
            4'h5: out_low = 10'h121;
            4'h6: out_low = 10'h121;
            4'h7: out_low = 10'h121;
            4'h8: out_low = 10'h121;
            4'h9: out_low = 10'h121;
            4'ha: out_low = 10'h120;
            4'hb: out_low = 10'h120;
            4'hc: out_low = 10'h120;
            4'hd: out_low = 10'h120;
            4'he: out_low = 10'h11f;
            4'hf: out_low = 10'h11f;
            default: out_low = 10'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h11f;
            4'h1: out_low = 10'h11f;
            4'h2: out_low = 10'h11f;
            4'h3: out_low = 10'h11e;
            4'h4: out_low = 10'h11e;
            4'h5: out_low = 10'h11e;
            4'h6: out_low = 10'h11e;
            4'h7: out_low = 10'h11d;
            4'h8: out_low = 10'h11d;
            4'h9: out_low = 10'h11d;
            4'ha: out_low = 10'h11d;
            4'hb: out_low = 10'h11d;
            4'hc: out_low = 10'h11c;
            4'hd: out_low = 10'h11c;
            4'he: out_low = 10'h11c;
            4'hf: out_low = 10'h11c;
            default: out_low = 10'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h11b;
            4'h1: out_low = 10'h11b;
            4'h2: out_low = 10'h11b;
            4'h3: out_low = 10'h11b;
            4'h4: out_low = 10'h11b;
            4'h5: out_low = 10'h11a;
            4'h6: out_low = 10'h11a;
            4'h7: out_low = 10'h11a;
            4'h8: out_low = 10'h11a;
            4'h9: out_low = 10'h119;
            4'ha: out_low = 10'h119;
            4'hb: out_low = 10'h119;
            4'hc: out_low = 10'h119;
            4'hd: out_low = 10'h119;
            4'he: out_low = 10'h118;
            4'hf: out_low = 10'h118;
            default: out_low = 10'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h118;
            4'h1: out_low = 10'h118;
            4'h2: out_low = 10'h117;
            4'h3: out_low = 10'h117;
            4'h4: out_low = 10'h117;
            4'h5: out_low = 10'h117;
            4'h6: out_low = 10'h117;
            4'h7: out_low = 10'h116;
            4'h8: out_low = 10'h116;
            4'h9: out_low = 10'h116;
            4'ha: out_low = 10'h116;
            4'hb: out_low = 10'h115;
            4'hc: out_low = 10'h115;
            4'hd: out_low = 10'h115;
            4'he: out_low = 10'h115;
            4'hf: out_low = 10'h115;
            default: out_low = 10'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h114;
            4'h1: out_low = 10'h114;
            4'h2: out_low = 10'h114;
            4'h3: out_low = 10'h114;
            4'h4: out_low = 10'h114;
            4'h5: out_low = 10'h113;
            4'h6: out_low = 10'h113;
            4'h7: out_low = 10'h113;
            4'h8: out_low = 10'h113;
            4'h9: out_low = 10'h112;
            4'ha: out_low = 10'h112;
            4'hb: out_low = 10'h112;
            4'hc: out_low = 10'h112;
            4'hd: out_low = 10'h112;
            4'he: out_low = 10'h111;
            4'hf: out_low = 10'h111;
            default: out_low = 10'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h111;
            4'h1: out_low = 10'h111;
            4'h2: out_low = 10'h111;
            4'h3: out_low = 10'h110;
            4'h4: out_low = 10'h110;
            4'h5: out_low = 10'h110;
            4'h6: out_low = 10'h110;
            4'h7: out_low = 10'h10f;
            4'h8: out_low = 10'h10f;
            4'h9: out_low = 10'h10f;
            4'ha: out_low = 10'h10f;
            4'hb: out_low = 10'h10f;
            4'hc: out_low = 10'h10e;
            4'hd: out_low = 10'h10e;
            4'he: out_low = 10'h10e;
            4'hf: out_low = 10'h10e;
            default: out_low = 10'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h10e;
            4'h1: out_low = 10'h10d;
            4'h2: out_low = 10'h10d;
            4'h3: out_low = 10'h10d;
            4'h4: out_low = 10'h10d;
            4'h5: out_low = 10'h10c;
            4'h6: out_low = 10'h10c;
            4'h7: out_low = 10'h10c;
            4'h8: out_low = 10'h10c;
            4'h9: out_low = 10'h10c;
            4'ha: out_low = 10'h10b;
            4'hb: out_low = 10'h10b;
            4'hc: out_low = 10'h10b;
            4'hd: out_low = 10'h10b;
            4'he: out_low = 10'h10b;
            4'hf: out_low = 10'h10a;
            default: out_low = 10'h000;
          endcase
        end
        default: out_low = 10'h000;
      endcase
      end
      2'h2: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 10'h10a;
            4'h1: out_low = 10'h10a;
            4'h2: out_low = 10'h109;
            4'h3: out_low = 10'h109;
            4'h4: out_low = 10'h108;
            4'h5: out_low = 10'h108;
            4'h6: out_low = 10'h108;
            4'h7: out_low = 10'h107;
            4'h8: out_low = 10'h107;
            4'h9: out_low = 10'h106;
            4'ha: out_low = 10'h106;
            4'hb: out_low = 10'h106;
            4'hc: out_low = 10'h105;
            4'hd: out_low = 10'h105;
            4'he: out_low = 10'h104;
            4'hf: out_low = 10'h104;
            default: out_low = 10'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 10'h104;
            4'h1: out_low = 10'h103;
            4'h2: out_low = 10'h103;
            4'h3: out_low = 10'h102;
            4'h4: out_low = 10'h102;
            4'h5: out_low = 10'h101;
            4'h6: out_low = 10'h101;
            4'h7: out_low = 10'h101;
            4'h8: out_low = 10'h100;
            4'h9: out_low = 10'h100;
            4'ha: out_low = 10'h0ff;
            4'hb: out_low = 10'h0ff;
            4'hc: out_low = 10'h0ff;
            4'hd: out_low = 10'h0fe;
            4'he: out_low = 10'h0fe;
            4'hf: out_low = 10'h0fd;
            default: out_low = 10'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0fd;
            4'h1: out_low = 10'h0fd;
            4'h2: out_low = 10'h0fc;
            4'h3: out_low = 10'h0fc;
            4'h4: out_low = 10'h0fb;
            4'h5: out_low = 10'h0fb;
            4'h6: out_low = 10'h0fb;
            4'h7: out_low = 10'h0fa;
            4'h8: out_low = 10'h0fa;
            4'h9: out_low = 10'h0f9;
            4'ha: out_low = 10'h0f9;
            4'hb: out_low = 10'h0f9;
            4'hc: out_low = 10'h0f8;
            4'hd: out_low = 10'h0f8;
            4'he: out_low = 10'h0f7;
            4'hf: out_low = 10'h0f7;
            default: out_low = 10'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0f7;
            4'h1: out_low = 10'h0f6;
            4'h2: out_low = 10'h0f6;
            4'h3: out_low = 10'h0f5;
            4'h4: out_low = 10'h0f5;
            4'h5: out_low = 10'h0f5;
            4'h6: out_low = 10'h0f4;
            4'h7: out_low = 10'h0f4;
            4'h8: out_low = 10'h0f3;
            4'h9: out_low = 10'h0f3;
            4'ha: out_low = 10'h0f3;
            4'hb: out_low = 10'h0f2;
            4'hc: out_low = 10'h0f2;
            4'hd: out_low = 10'h0f2;
            4'he: out_low = 10'h0f1;
            4'hf: out_low = 10'h0f1;
            default: out_low = 10'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0f0;
            4'h1: out_low = 10'h0f0;
            4'h2: out_low = 10'h0f0;
            4'h3: out_low = 10'h0ef;
            4'h4: out_low = 10'h0ef;
            4'h5: out_low = 10'h0ee;
            4'h6: out_low = 10'h0ee;
            4'h7: out_low = 10'h0ee;
            4'h8: out_low = 10'h0ed;
            4'h9: out_low = 10'h0ed;
            4'ha: out_low = 10'h0ec;
            4'hb: out_low = 10'h0ec;
            4'hc: out_low = 10'h0ec;
            4'hd: out_low = 10'h0eb;
            4'he: out_low = 10'h0eb;
            4'hf: out_low = 10'h0eb;
            default: out_low = 10'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0ea;
            4'h1: out_low = 10'h0ea;
            4'h2: out_low = 10'h0e9;
            4'h3: out_low = 10'h0e9;
            4'h4: out_low = 10'h0e9;
            4'h5: out_low = 10'h0e8;
            4'h6: out_low = 10'h0e8;
            4'h7: out_low = 10'h0e8;
            4'h8: out_low = 10'h0e7;
            4'h9: out_low = 10'h0e7;
            4'ha: out_low = 10'h0e6;
            4'hb: out_low = 10'h0e6;
            4'hc: out_low = 10'h0e6;
            4'hd: out_low = 10'h0e5;
            4'he: out_low = 10'h0e5;
            4'hf: out_low = 10'h0e5;
            default: out_low = 10'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0e4;
            4'h1: out_low = 10'h0e4;
            4'h2: out_low = 10'h0e3;
            4'h3: out_low = 10'h0e3;
            4'h4: out_low = 10'h0e3;
            4'h5: out_low = 10'h0e2;
            4'h6: out_low = 10'h0e2;
            4'h7: out_low = 10'h0e2;
            4'h8: out_low = 10'h0e1;
            4'h9: out_low = 10'h0e1;
            4'ha: out_low = 10'h0e0;
            4'hb: out_low = 10'h0e0;
            4'hc: out_low = 10'h0e0;
            4'hd: out_low = 10'h0df;
            4'he: out_low = 10'h0df;
            4'hf: out_low = 10'h0df;
            default: out_low = 10'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0de;
            4'h1: out_low = 10'h0de;
            4'h2: out_low = 10'h0de;
            4'h3: out_low = 10'h0dd;
            4'h4: out_low = 10'h0dd;
            4'h5: out_low = 10'h0dc;
            4'h6: out_low = 10'h0dc;
            4'h7: out_low = 10'h0dc;
            4'h8: out_low = 10'h0db;
            4'h9: out_low = 10'h0db;
            4'ha: out_low = 10'h0db;
            4'hb: out_low = 10'h0da;
            4'hc: out_low = 10'h0da;
            4'hd: out_low = 10'h0da;
            4'he: out_low = 10'h0d9;
            4'hf: out_low = 10'h0d9;
            default: out_low = 10'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0d8;
            4'h1: out_low = 10'h0d8;
            4'h2: out_low = 10'h0d8;
            4'h3: out_low = 10'h0d7;
            4'h4: out_low = 10'h0d7;
            4'h5: out_low = 10'h0d7;
            4'h6: out_low = 10'h0d6;
            4'h7: out_low = 10'h0d6;
            4'h8: out_low = 10'h0d6;
            4'h9: out_low = 10'h0d5;
            4'ha: out_low = 10'h0d5;
            4'hb: out_low = 10'h0d5;
            4'hc: out_low = 10'h0d4;
            4'hd: out_low = 10'h0d4;
            4'he: out_low = 10'h0d4;
            4'hf: out_low = 10'h0d3;
            default: out_low = 10'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0d3;
            4'h1: out_low = 10'h0d2;
            4'h2: out_low = 10'h0d2;
            4'h3: out_low = 10'h0d2;
            4'h4: out_low = 10'h0d1;
            4'h5: out_low = 10'h0d1;
            4'h6: out_low = 10'h0d1;
            4'h7: out_low = 10'h0d0;
            4'h8: out_low = 10'h0d0;
            4'h9: out_low = 10'h0d0;
            4'ha: out_low = 10'h0cf;
            4'hb: out_low = 10'h0cf;
            4'hc: out_low = 10'h0cf;
            4'hd: out_low = 10'h0ce;
            4'he: out_low = 10'h0ce;
            4'hf: out_low = 10'h0ce;
            default: out_low = 10'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0cd;
            4'h1: out_low = 10'h0cd;
            4'h2: out_low = 10'h0cd;
            4'h3: out_low = 10'h0cc;
            4'h4: out_low = 10'h0cc;
            4'h5: out_low = 10'h0cb;
            4'h6: out_low = 10'h0cb;
            4'h7: out_low = 10'h0cb;
            4'h8: out_low = 10'h0ca;
            4'h9: out_low = 10'h0ca;
            4'ha: out_low = 10'h0ca;
            4'hb: out_low = 10'h0c9;
            4'hc: out_low = 10'h0c9;
            4'hd: out_low = 10'h0c9;
            4'he: out_low = 10'h0c8;
            4'hf: out_low = 10'h0c8;
            default: out_low = 10'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0c8;
            4'h1: out_low = 10'h0c7;
            4'h2: out_low = 10'h0c7;
            4'h3: out_low = 10'h0c7;
            4'h4: out_low = 10'h0c6;
            4'h5: out_low = 10'h0c6;
            4'h6: out_low = 10'h0c6;
            4'h7: out_low = 10'h0c5;
            4'h8: out_low = 10'h0c5;
            4'h9: out_low = 10'h0c5;
            4'ha: out_low = 10'h0c4;
            4'hb: out_low = 10'h0c4;
            4'hc: out_low = 10'h0c4;
            4'hd: out_low = 10'h0c3;
            4'he: out_low = 10'h0c3;
            4'hf: out_low = 10'h0c3;
            default: out_low = 10'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0c2;
            4'h1: out_low = 10'h0c2;
            4'h2: out_low = 10'h0c2;
            4'h3: out_low = 10'h0c1;
            4'h4: out_low = 10'h0c1;
            4'h5: out_low = 10'h0c1;
            4'h6: out_low = 10'h0c0;
            4'h7: out_low = 10'h0c0;
            4'h8: out_low = 10'h0c0;
            4'h9: out_low = 10'h0bf;
            4'ha: out_low = 10'h0bf;
            4'hb: out_low = 10'h0bf;
            4'hc: out_low = 10'h0be;
            4'hd: out_low = 10'h0be;
            4'he: out_low = 10'h0be;
            4'hf: out_low = 10'h0bd;
            default: out_low = 10'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0bd;
            4'h1: out_low = 10'h0bd;
            4'h2: out_low = 10'h0bc;
            4'h3: out_low = 10'h0bc;
            4'h4: out_low = 10'h0bc;
            4'h5: out_low = 10'h0bb;
            4'h6: out_low = 10'h0bb;
            4'h7: out_low = 10'h0bb;
            4'h8: out_low = 10'h0ba;
            4'h9: out_low = 10'h0ba;
            4'ha: out_low = 10'h0ba;
            4'hb: out_low = 10'h0b9;
            4'hc: out_low = 10'h0b9;
            4'hd: out_low = 10'h0b9;
            4'he: out_low = 10'h0b8;
            4'hf: out_low = 10'h0b8;
            default: out_low = 10'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0b8;
            4'h1: out_low = 10'h0b8;
            4'h2: out_low = 10'h0b7;
            4'h3: out_low = 10'h0b7;
            4'h4: out_low = 10'h0b7;
            4'h5: out_low = 10'h0b6;
            4'h6: out_low = 10'h0b6;
            4'h7: out_low = 10'h0b6;
            4'h8: out_low = 10'h0b5;
            4'h9: out_low = 10'h0b5;
            4'ha: out_low = 10'h0b5;
            4'hb: out_low = 10'h0b4;
            4'hc: out_low = 10'h0b4;
            4'hd: out_low = 10'h0b4;
            4'he: out_low = 10'h0b3;
            4'hf: out_low = 10'h0b3;
            default: out_low = 10'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0b3;
            4'h1: out_low = 10'h0b2;
            4'h2: out_low = 10'h0b2;
            4'h3: out_low = 10'h0b2;
            4'h4: out_low = 10'h0b1;
            4'h5: out_low = 10'h0b1;
            4'h6: out_low = 10'h0b1;
            4'h7: out_low = 10'h0b0;
            4'h8: out_low = 10'h0b0;
            4'h9: out_low = 10'h0b0;
            4'ha: out_low = 10'h0b0;
            4'hb: out_low = 10'h0af;
            4'hc: out_low = 10'h0af;
            4'hd: out_low = 10'h0af;
            4'he: out_low = 10'h0ae;
            4'hf: out_low = 10'h0ae;
            default: out_low = 10'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0ae;
            4'h1: out_low = 10'h0ad;
            4'h2: out_low = 10'h0ad;
            4'h3: out_low = 10'h0ad;
            4'h4: out_low = 10'h0ac;
            4'h5: out_low = 10'h0ac;
            4'h6: out_low = 10'h0ac;
            4'h7: out_low = 10'h0ac;
            4'h8: out_low = 10'h0ab;
            4'h9: out_low = 10'h0ab;
            4'ha: out_low = 10'h0ab;
            4'hb: out_low = 10'h0aa;
            4'hc: out_low = 10'h0aa;
            4'hd: out_low = 10'h0aa;
            4'he: out_low = 10'h0a9;
            4'hf: out_low = 10'h0a9;
            default: out_low = 10'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0a9;
            4'h1: out_low = 10'h0a8;
            4'h2: out_low = 10'h0a8;
            4'h3: out_low = 10'h0a8;
            4'h4: out_low = 10'h0a8;
            4'h5: out_low = 10'h0a7;
            4'h6: out_low = 10'h0a7;
            4'h7: out_low = 10'h0a7;
            4'h8: out_low = 10'h0a6;
            4'h9: out_low = 10'h0a6;
            4'ha: out_low = 10'h0a6;
            4'hb: out_low = 10'h0a5;
            4'hc: out_low = 10'h0a5;
            4'hd: out_low = 10'h0a5;
            4'he: out_low = 10'h0a4;
            4'hf: out_low = 10'h0a4;
            default: out_low = 10'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0a4;
            4'h1: out_low = 10'h0a4;
            4'h2: out_low = 10'h0a3;
            4'h3: out_low = 10'h0a3;
            4'h4: out_low = 10'h0a3;
            4'h5: out_low = 10'h0a2;
            4'h6: out_low = 10'h0a2;
            4'h7: out_low = 10'h0a2;
            4'h8: out_low = 10'h0a1;
            4'h9: out_low = 10'h0a1;
            4'ha: out_low = 10'h0a1;
            4'hb: out_low = 10'h0a1;
            4'hc: out_low = 10'h0a0;
            4'hd: out_low = 10'h0a0;
            4'he: out_low = 10'h0a0;
            4'hf: out_low = 10'h09f;
            default: out_low = 10'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 10'h09f;
            4'h1: out_low = 10'h09f;
            4'h2: out_low = 10'h09e;
            4'h3: out_low = 10'h09e;
            4'h4: out_low = 10'h09e;
            4'h5: out_low = 10'h09e;
            4'h6: out_low = 10'h09d;
            4'h7: out_low = 10'h09d;
            4'h8: out_low = 10'h09d;
            4'h9: out_low = 10'h09c;
            4'ha: out_low = 10'h09c;
            4'hb: out_low = 10'h09c;
            4'hc: out_low = 10'h09c;
            4'hd: out_low = 10'h09b;
            4'he: out_low = 10'h09b;
            4'hf: out_low = 10'h09b;
            default: out_low = 10'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 10'h09a;
            4'h1: out_low = 10'h09a;
            4'h2: out_low = 10'h09a;
            4'h3: out_low = 10'h099;
            4'h4: out_low = 10'h099;
            4'h5: out_low = 10'h099;
            4'h6: out_low = 10'h099;
            4'h7: out_low = 10'h098;
            4'h8: out_low = 10'h098;
            4'h9: out_low = 10'h098;
            4'ha: out_low = 10'h097;
            4'hb: out_low = 10'h097;
            4'hc: out_low = 10'h097;
            4'hd: out_low = 10'h097;
            4'he: out_low = 10'h096;
            4'hf: out_low = 10'h096;
            default: out_low = 10'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 10'h096;
            4'h1: out_low = 10'h095;
            4'h2: out_low = 10'h095;
            4'h3: out_low = 10'h095;
            4'h4: out_low = 10'h095;
            4'h5: out_low = 10'h094;
            4'h6: out_low = 10'h094;
            4'h7: out_low = 10'h094;
            4'h8: out_low = 10'h093;
            4'h9: out_low = 10'h093;
            4'ha: out_low = 10'h093;
            4'hb: out_low = 10'h093;
            4'hc: out_low = 10'h092;
            4'hd: out_low = 10'h092;
            4'he: out_low = 10'h092;
            4'hf: out_low = 10'h091;
            default: out_low = 10'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 10'h091;
            4'h1: out_low = 10'h091;
            4'h2: out_low = 10'h091;
            4'h3: out_low = 10'h090;
            4'h4: out_low = 10'h090;
            4'h5: out_low = 10'h090;
            4'h6: out_low = 10'h08f;
            4'h7: out_low = 10'h08f;
            4'h8: out_low = 10'h08f;
            4'h9: out_low = 10'h08f;
            4'ha: out_low = 10'h08e;
            4'hb: out_low = 10'h08e;
            4'hc: out_low = 10'h08e;
            4'hd: out_low = 10'h08d;
            4'he: out_low = 10'h08d;
            4'hf: out_low = 10'h08d;
            default: out_low = 10'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 10'h08d;
            4'h1: out_low = 10'h08c;
            4'h2: out_low = 10'h08c;
            4'h3: out_low = 10'h08c;
            4'h4: out_low = 10'h08c;
            4'h5: out_low = 10'h08b;
            4'h6: out_low = 10'h08b;
            4'h7: out_low = 10'h08b;
            4'h8: out_low = 10'h08a;
            4'h9: out_low = 10'h08a;
            4'ha: out_low = 10'h08a;
            4'hb: out_low = 10'h08a;
            4'hc: out_low = 10'h089;
            4'hd: out_low = 10'h089;
            4'he: out_low = 10'h089;
            4'hf: out_low = 10'h089;
            default: out_low = 10'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 10'h088;
            4'h1: out_low = 10'h088;
            4'h2: out_low = 10'h088;
            4'h3: out_low = 10'h087;
            4'h4: out_low = 10'h087;
            4'h5: out_low = 10'h087;
            4'h6: out_low = 10'h087;
            4'h7: out_low = 10'h086;
            4'h8: out_low = 10'h086;
            4'h9: out_low = 10'h086;
            4'ha: out_low = 10'h085;
            4'hb: out_low = 10'h085;
            4'hc: out_low = 10'h085;
            4'hd: out_low = 10'h085;
            4'he: out_low = 10'h084;
            4'hf: out_low = 10'h084;
            default: out_low = 10'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 10'h084;
            4'h1: out_low = 10'h084;
            4'h2: out_low = 10'h083;
            4'h3: out_low = 10'h083;
            4'h4: out_low = 10'h083;
            4'h5: out_low = 10'h083;
            4'h6: out_low = 10'h082;
            4'h7: out_low = 10'h082;
            4'h8: out_low = 10'h082;
            4'h9: out_low = 10'h081;
            4'ha: out_low = 10'h081;
            4'hb: out_low = 10'h081;
            4'hc: out_low = 10'h081;
            4'hd: out_low = 10'h080;
            4'he: out_low = 10'h080;
            4'hf: out_low = 10'h080;
            default: out_low = 10'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h080;
            4'h1: out_low = 10'h07f;
            4'h2: out_low = 10'h07f;
            4'h3: out_low = 10'h07f;
            4'h4: out_low = 10'h07f;
            4'h5: out_low = 10'h07e;
            4'h6: out_low = 10'h07e;
            4'h7: out_low = 10'h07e;
            4'h8: out_low = 10'h07d;
            4'h9: out_low = 10'h07d;
            4'ha: out_low = 10'h07d;
            4'hb: out_low = 10'h07d;
            4'hc: out_low = 10'h07c;
            4'hd: out_low = 10'h07c;
            4'he: out_low = 10'h07c;
            4'hf: out_low = 10'h07c;
            default: out_low = 10'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h07b;
            4'h1: out_low = 10'h07b;
            4'h2: out_low = 10'h07b;
            4'h3: out_low = 10'h07b;
            4'h4: out_low = 10'h07a;
            4'h5: out_low = 10'h07a;
            4'h6: out_low = 10'h07a;
            4'h7: out_low = 10'h07a;
            4'h8: out_low = 10'h079;
            4'h9: out_low = 10'h079;
            4'ha: out_low = 10'h079;
            4'hb: out_low = 10'h078;
            4'hc: out_low = 10'h078;
            4'hd: out_low = 10'h078;
            4'he: out_low = 10'h078;
            4'hf: out_low = 10'h077;
            default: out_low = 10'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h077;
            4'h1: out_low = 10'h077;
            4'h2: out_low = 10'h077;
            4'h3: out_low = 10'h076;
            4'h4: out_low = 10'h076;
            4'h5: out_low = 10'h076;
            4'h6: out_low = 10'h076;
            4'h7: out_low = 10'h075;
            4'h8: out_low = 10'h075;
            4'h9: out_low = 10'h075;
            4'ha: out_low = 10'h075;
            4'hb: out_low = 10'h074;
            4'hc: out_low = 10'h074;
            4'hd: out_low = 10'h074;
            4'he: out_low = 10'h074;
            4'hf: out_low = 10'h073;
            default: out_low = 10'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h073;
            4'h1: out_low = 10'h073;
            4'h2: out_low = 10'h073;
            4'h3: out_low = 10'h072;
            4'h4: out_low = 10'h072;
            4'h5: out_low = 10'h072;
            4'h6: out_low = 10'h072;
            4'h7: out_low = 10'h071;
            4'h8: out_low = 10'h071;
            4'h9: out_low = 10'h071;
            4'ha: out_low = 10'h071;
            4'hb: out_low = 10'h070;
            4'hc: out_low = 10'h070;
            4'hd: out_low = 10'h070;
            4'he: out_low = 10'h06f;
            4'hf: out_low = 10'h06f;
            default: out_low = 10'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h06f;
            4'h1: out_low = 10'h06f;
            4'h2: out_low = 10'h06e;
            4'h3: out_low = 10'h06e;
            4'h4: out_low = 10'h06e;
            4'h5: out_low = 10'h06e;
            4'h6: out_low = 10'h06d;
            4'h7: out_low = 10'h06d;
            4'h8: out_low = 10'h06d;
            4'h9: out_low = 10'h06d;
            4'ha: out_low = 10'h06c;
            4'hb: out_low = 10'h06c;
            4'hc: out_low = 10'h06c;
            4'hd: out_low = 10'h06c;
            4'he: out_low = 10'h06b;
            4'hf: out_low = 10'h06b;
            default: out_low = 10'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h06b;
            4'h1: out_low = 10'h06b;
            4'h2: out_low = 10'h06b;
            4'h3: out_low = 10'h06a;
            4'h4: out_low = 10'h06a;
            4'h5: out_low = 10'h06a;
            4'h6: out_low = 10'h06a;
            4'h7: out_low = 10'h069;
            4'h8: out_low = 10'h069;
            4'h9: out_low = 10'h069;
            4'ha: out_low = 10'h069;
            4'hb: out_low = 10'h068;
            4'hc: out_low = 10'h068;
            4'hd: out_low = 10'h068;
            4'he: out_low = 10'h068;
            4'hf: out_low = 10'h067;
            default: out_low = 10'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 10'h067;
            4'h1: out_low = 10'h067;
            4'h2: out_low = 10'h067;
            4'h3: out_low = 10'h066;
            4'h4: out_low = 10'h066;
            4'h5: out_low = 10'h066;
            4'h6: out_low = 10'h066;
            4'h7: out_low = 10'h065;
            4'h8: out_low = 10'h065;
            4'h9: out_low = 10'h065;
            4'ha: out_low = 10'h065;
            4'hb: out_low = 10'h064;
            4'hc: out_low = 10'h064;
            4'hd: out_low = 10'h064;
            4'he: out_low = 10'h064;
            4'hf: out_low = 10'h063;
            default: out_low = 10'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 10'h063;
            4'h1: out_low = 10'h063;
            4'h2: out_low = 10'h063;
            4'h3: out_low = 10'h062;
            4'h4: out_low = 10'h062;
            4'h5: out_low = 10'h062;
            4'h6: out_low = 10'h062;
            4'h7: out_low = 10'h061;
            4'h8: out_low = 10'h061;
            4'h9: out_low = 10'h061;
            4'ha: out_low = 10'h061;
            4'hb: out_low = 10'h061;
            4'hc: out_low = 10'h060;
            4'hd: out_low = 10'h060;
            4'he: out_low = 10'h060;
            4'hf: out_low = 10'h060;
            default: out_low = 10'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 10'h05f;
            4'h1: out_low = 10'h05f;
            4'h2: out_low = 10'h05f;
            4'h3: out_low = 10'h05f;
            4'h4: out_low = 10'h05e;
            4'h5: out_low = 10'h05e;
            4'h6: out_low = 10'h05e;
            4'h7: out_low = 10'h05e;
            4'h8: out_low = 10'h05d;
            4'h9: out_low = 10'h05d;
            4'ha: out_low = 10'h05d;
            4'hb: out_low = 10'h05d;
            4'hc: out_low = 10'h05c;
            4'hd: out_low = 10'h05c;
            4'he: out_low = 10'h05c;
            4'hf: out_low = 10'h05c;
            default: out_low = 10'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 10'h05c;
            4'h1: out_low = 10'h05b;
            4'h2: out_low = 10'h05b;
            4'h3: out_low = 10'h05b;
            4'h4: out_low = 10'h05b;
            4'h5: out_low = 10'h05a;
            4'h6: out_low = 10'h05a;
            4'h7: out_low = 10'h05a;
            4'h8: out_low = 10'h05a;
            4'h9: out_low = 10'h059;
            4'ha: out_low = 10'h059;
            4'hb: out_low = 10'h059;
            4'hc: out_low = 10'h059;
            4'hd: out_low = 10'h059;
            4'he: out_low = 10'h058;
            4'hf: out_low = 10'h058;
            default: out_low = 10'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 10'h058;
            4'h1: out_low = 10'h058;
            4'h2: out_low = 10'h057;
            4'h3: out_low = 10'h057;
            4'h4: out_low = 10'h057;
            4'h5: out_low = 10'h057;
            4'h6: out_low = 10'h056;
            4'h7: out_low = 10'h056;
            4'h8: out_low = 10'h056;
            4'h9: out_low = 10'h056;
            4'ha: out_low = 10'h056;
            4'hb: out_low = 10'h055;
            4'hc: out_low = 10'h055;
            4'hd: out_low = 10'h055;
            4'he: out_low = 10'h055;
            4'hf: out_low = 10'h054;
            default: out_low = 10'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 10'h054;
            4'h1: out_low = 10'h054;
            4'h2: out_low = 10'h054;
            4'h3: out_low = 10'h053;
            4'h4: out_low = 10'h053;
            4'h5: out_low = 10'h053;
            4'h6: out_low = 10'h053;
            4'h7: out_low = 10'h053;
            4'h8: out_low = 10'h052;
            4'h9: out_low = 10'h052;
            4'ha: out_low = 10'h052;
            4'hb: out_low = 10'h052;
            4'hc: out_low = 10'h051;
            4'hd: out_low = 10'h051;
            4'he: out_low = 10'h051;
            4'hf: out_low = 10'h051;
            default: out_low = 10'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 10'h051;
            4'h1: out_low = 10'h050;
            4'h2: out_low = 10'h050;
            4'h3: out_low = 10'h050;
            4'h4: out_low = 10'h050;
            4'h5: out_low = 10'h04f;
            4'h6: out_low = 10'h04f;
            4'h7: out_low = 10'h04f;
            4'h8: out_low = 10'h04f;
            4'h9: out_low = 10'h04e;
            4'ha: out_low = 10'h04e;
            4'hb: out_low = 10'h04e;
            4'hc: out_low = 10'h04e;
            4'hd: out_low = 10'h04e;
            4'he: out_low = 10'h04d;
            4'hf: out_low = 10'h04d;
            default: out_low = 10'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 10'h04d;
            4'h1: out_low = 10'h04d;
            4'h2: out_low = 10'h04c;
            4'h3: out_low = 10'h04c;
            4'h4: out_low = 10'h04c;
            4'h5: out_low = 10'h04c;
            4'h6: out_low = 10'h04c;
            4'h7: out_low = 10'h04b;
            4'h8: out_low = 10'h04b;
            4'h9: out_low = 10'h04b;
            4'ha: out_low = 10'h04b;
            4'hb: out_low = 10'h04a;
            4'hc: out_low = 10'h04a;
            4'hd: out_low = 10'h04a;
            4'he: out_low = 10'h04a;
            4'hf: out_low = 10'h04a;
            default: out_low = 10'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 10'h049;
            4'h1: out_low = 10'h049;
            4'h2: out_low = 10'h049;
            4'h3: out_low = 10'h049;
            4'h4: out_low = 10'h049;
            4'h5: out_low = 10'h048;
            4'h6: out_low = 10'h048;
            4'h7: out_low = 10'h048;
            4'h8: out_low = 10'h048;
            4'h9: out_low = 10'h047;
            4'ha: out_low = 10'h047;
            4'hb: out_low = 10'h047;
            4'hc: out_low = 10'h047;
            4'hd: out_low = 10'h047;
            4'he: out_low = 10'h046;
            4'hf: out_low = 10'h046;
            default: out_low = 10'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 10'h046;
            4'h1: out_low = 10'h046;
            4'h2: out_low = 10'h045;
            4'h3: out_low = 10'h045;
            4'h4: out_low = 10'h045;
            4'h5: out_low = 10'h045;
            4'h6: out_low = 10'h045;
            4'h7: out_low = 10'h044;
            4'h8: out_low = 10'h044;
            4'h9: out_low = 10'h044;
            4'ha: out_low = 10'h044;
            4'hb: out_low = 10'h044;
            4'hc: out_low = 10'h043;
            4'hd: out_low = 10'h043;
            4'he: out_low = 10'h043;
            4'hf: out_low = 10'h043;
            default: out_low = 10'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h042;
            4'h1: out_low = 10'h042;
            4'h2: out_low = 10'h042;
            4'h3: out_low = 10'h042;
            4'h4: out_low = 10'h042;
            4'h5: out_low = 10'h041;
            4'h6: out_low = 10'h041;
            4'h7: out_low = 10'h041;
            4'h8: out_low = 10'h041;
            4'h9: out_low = 10'h041;
            4'ha: out_low = 10'h040;
            4'hb: out_low = 10'h040;
            4'hc: out_low = 10'h040;
            4'hd: out_low = 10'h040;
            4'he: out_low = 10'h03f;
            4'hf: out_low = 10'h03f;
            default: out_low = 10'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h03f;
            4'h1: out_low = 10'h03f;
            4'h2: out_low = 10'h03f;
            4'h3: out_low = 10'h03e;
            4'h4: out_low = 10'h03e;
            4'h5: out_low = 10'h03e;
            4'h6: out_low = 10'h03e;
            4'h7: out_low = 10'h03e;
            4'h8: out_low = 10'h03d;
            4'h9: out_low = 10'h03d;
            4'ha: out_low = 10'h03d;
            4'hb: out_low = 10'h03d;
            4'hc: out_low = 10'h03d;
            4'hd: out_low = 10'h03c;
            4'he: out_low = 10'h03c;
            4'hf: out_low = 10'h03c;
            default: out_low = 10'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h03c;
            4'h1: out_low = 10'h03b;
            4'h2: out_low = 10'h03b;
            4'h3: out_low = 10'h03b;
            4'h4: out_low = 10'h03b;
            4'h5: out_low = 10'h03b;
            4'h6: out_low = 10'h03a;
            4'h7: out_low = 10'h03a;
            4'h8: out_low = 10'h03a;
            4'h9: out_low = 10'h03a;
            4'ha: out_low = 10'h03a;
            4'hb: out_low = 10'h039;
            4'hc: out_low = 10'h039;
            4'hd: out_low = 10'h039;
            4'he: out_low = 10'h039;
            4'hf: out_low = 10'h039;
            default: out_low = 10'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h038;
            4'h1: out_low = 10'h038;
            4'h2: out_low = 10'h038;
            4'h3: out_low = 10'h038;
            4'h4: out_low = 10'h038;
            4'h5: out_low = 10'h037;
            4'h6: out_low = 10'h037;
            4'h7: out_low = 10'h037;
            4'h8: out_low = 10'h037;
            4'h9: out_low = 10'h036;
            4'ha: out_low = 10'h036;
            4'hb: out_low = 10'h036;
            4'hc: out_low = 10'h036;
            4'hd: out_low = 10'h036;
            4'he: out_low = 10'h035;
            4'hf: out_low = 10'h035;
            default: out_low = 10'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h035;
            4'h1: out_low = 10'h035;
            4'h2: out_low = 10'h035;
            4'h3: out_low = 10'h034;
            4'h4: out_low = 10'h034;
            4'h5: out_low = 10'h034;
            4'h6: out_low = 10'h034;
            4'h7: out_low = 10'h034;
            4'h8: out_low = 10'h033;
            4'h9: out_low = 10'h033;
            4'ha: out_low = 10'h033;
            4'hb: out_low = 10'h033;
            4'hc: out_low = 10'h033;
            4'hd: out_low = 10'h032;
            4'he: out_low = 10'h032;
            4'hf: out_low = 10'h032;
            default: out_low = 10'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h032;
            4'h1: out_low = 10'h032;
            4'h2: out_low = 10'h031;
            4'h3: out_low = 10'h031;
            4'h4: out_low = 10'h031;
            4'h5: out_low = 10'h031;
            4'h6: out_low = 10'h031;
            4'h7: out_low = 10'h030;
            4'h8: out_low = 10'h030;
            4'h9: out_low = 10'h030;
            4'ha: out_low = 10'h030;
            4'hb: out_low = 10'h030;
            4'hc: out_low = 10'h02f;
            4'hd: out_low = 10'h02f;
            4'he: out_low = 10'h02f;
            4'hf: out_low = 10'h02f;
            default: out_low = 10'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 10'h02f;
            4'h1: out_low = 10'h02e;
            4'h2: out_low = 10'h02e;
            4'h3: out_low = 10'h02e;
            4'h4: out_low = 10'h02e;
            4'h5: out_low = 10'h02e;
            4'h6: out_low = 10'h02d;
            4'h7: out_low = 10'h02d;
            4'h8: out_low = 10'h02d;
            4'h9: out_low = 10'h02d;
            4'ha: out_low = 10'h02d;
            4'hb: out_low = 10'h02c;
            4'hc: out_low = 10'h02c;
            4'hd: out_low = 10'h02c;
            4'he: out_low = 10'h02c;
            4'hf: out_low = 10'h02c;
            default: out_low = 10'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 10'h02b;
            4'h1: out_low = 10'h02b;
            4'h2: out_low = 10'h02b;
            4'h3: out_low = 10'h02b;
            4'h4: out_low = 10'h02b;
            4'h5: out_low = 10'h02a;
            4'h6: out_low = 10'h02a;
            4'h7: out_low = 10'h02a;
            4'h8: out_low = 10'h02a;
            4'h9: out_low = 10'h02a;
            4'ha: out_low = 10'h029;
            4'hb: out_low = 10'h029;
            4'hc: out_low = 10'h029;
            4'hd: out_low = 10'h029;
            4'he: out_low = 10'h029;
            4'hf: out_low = 10'h029;
            default: out_low = 10'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 10'h028;
            4'h1: out_low = 10'h028;
            4'h2: out_low = 10'h028;
            4'h3: out_low = 10'h028;
            4'h4: out_low = 10'h028;
            4'h5: out_low = 10'h027;
            4'h6: out_low = 10'h027;
            4'h7: out_low = 10'h027;
            4'h8: out_low = 10'h027;
            4'h9: out_low = 10'h027;
            4'ha: out_low = 10'h026;
            4'hb: out_low = 10'h026;
            4'hc: out_low = 10'h026;
            4'hd: out_low = 10'h026;
            4'he: out_low = 10'h026;
            4'hf: out_low = 10'h025;
            default: out_low = 10'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 10'h025;
            4'h1: out_low = 10'h025;
            4'h2: out_low = 10'h025;
            4'h3: out_low = 10'h025;
            4'h4: out_low = 10'h024;
            4'h5: out_low = 10'h024;
            4'h6: out_low = 10'h024;
            4'h7: out_low = 10'h024;
            4'h8: out_low = 10'h024;
            4'h9: out_low = 10'h023;
            4'ha: out_low = 10'h023;
            4'hb: out_low = 10'h023;
            4'hc: out_low = 10'h023;
            4'hd: out_low = 10'h023;
            4'he: out_low = 10'h023;
            4'hf: out_low = 10'h022;
            default: out_low = 10'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 10'h022;
            4'h1: out_low = 10'h022;
            4'h2: out_low = 10'h022;
            4'h3: out_low = 10'h022;
            4'h4: out_low = 10'h021;
            4'h5: out_low = 10'h021;
            4'h6: out_low = 10'h021;
            4'h7: out_low = 10'h021;
            4'h8: out_low = 10'h021;
            4'h9: out_low = 10'h020;
            4'ha: out_low = 10'h020;
            4'hb: out_low = 10'h020;
            4'hc: out_low = 10'h020;
            4'hd: out_low = 10'h020;
            4'he: out_low = 10'h020;
            4'hf: out_low = 10'h01f;
            default: out_low = 10'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 10'h01f;
            4'h1: out_low = 10'h01f;
            4'h2: out_low = 10'h01f;
            4'h3: out_low = 10'h01f;
            4'h4: out_low = 10'h01e;
            4'h5: out_low = 10'h01e;
            4'h6: out_low = 10'h01e;
            4'h7: out_low = 10'h01e;
            4'h8: out_low = 10'h01e;
            4'h9: out_low = 10'h01d;
            4'ha: out_low = 10'h01d;
            4'hb: out_low = 10'h01d;
            4'hc: out_low = 10'h01d;
            4'hd: out_low = 10'h01d;
            4'he: out_low = 10'h01d;
            4'hf: out_low = 10'h01c;
            default: out_low = 10'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 10'h01c;
            4'h1: out_low = 10'h01c;
            4'h2: out_low = 10'h01c;
            4'h3: out_low = 10'h01c;
            4'h4: out_low = 10'h01b;
            4'h5: out_low = 10'h01b;
            4'h6: out_low = 10'h01b;
            4'h7: out_low = 10'h01b;
            4'h8: out_low = 10'h01b;
            4'h9: out_low = 10'h01a;
            4'ha: out_low = 10'h01a;
            4'hb: out_low = 10'h01a;
            4'hc: out_low = 10'h01a;
            4'hd: out_low = 10'h01a;
            4'he: out_low = 10'h01a;
            4'hf: out_low = 10'h019;
            default: out_low = 10'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 10'h019;
            4'h1: out_low = 10'h019;
            4'h2: out_low = 10'h019;
            4'h3: out_low = 10'h019;
            4'h4: out_low = 10'h018;
            4'h5: out_low = 10'h018;
            4'h6: out_low = 10'h018;
            4'h7: out_low = 10'h018;
            4'h8: out_low = 10'h018;
            4'h9: out_low = 10'h018;
            4'ha: out_low = 10'h017;
            4'hb: out_low = 10'h017;
            4'hc: out_low = 10'h017;
            4'hd: out_low = 10'h017;
            4'he: out_low = 10'h017;
            4'hf: out_low = 10'h016;
            default: out_low = 10'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 10'h016;
            4'h1: out_low = 10'h016;
            4'h2: out_low = 10'h016;
            4'h3: out_low = 10'h016;
            4'h4: out_low = 10'h016;
            4'h5: out_low = 10'h015;
            4'h6: out_low = 10'h015;
            4'h7: out_low = 10'h015;
            4'h8: out_low = 10'h015;
            4'h9: out_low = 10'h015;
            4'ha: out_low = 10'h014;
            4'hb: out_low = 10'h014;
            4'hc: out_low = 10'h014;
            4'hd: out_low = 10'h014;
            4'he: out_low = 10'h014;
            4'hf: out_low = 10'h014;
            default: out_low = 10'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 10'h013;
            4'h1: out_low = 10'h013;
            4'h2: out_low = 10'h013;
            4'h3: out_low = 10'h013;
            4'h4: out_low = 10'h013;
            4'h5: out_low = 10'h012;
            4'h6: out_low = 10'h012;
            4'h7: out_low = 10'h012;
            4'h8: out_low = 10'h012;
            4'h9: out_low = 10'h012;
            4'ha: out_low = 10'h012;
            4'hb: out_low = 10'h011;
            4'hc: out_low = 10'h011;
            4'hd: out_low = 10'h011;
            4'he: out_low = 10'h011;
            4'hf: out_low = 10'h011;
            default: out_low = 10'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h011;
            4'h1: out_low = 10'h010;
            4'h2: out_low = 10'h010;
            4'h3: out_low = 10'h010;
            4'h4: out_low = 10'h010;
            4'h5: out_low = 10'h010;
            4'h6: out_low = 10'h00f;
            4'h7: out_low = 10'h00f;
            4'h8: out_low = 10'h00f;
            4'h9: out_low = 10'h00f;
            4'ha: out_low = 10'h00f;
            4'hb: out_low = 10'h00f;
            4'hc: out_low = 10'h00e;
            4'hd: out_low = 10'h00e;
            4'he: out_low = 10'h00e;
            4'hf: out_low = 10'h00e;
            default: out_low = 10'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h00e;
            4'h1: out_low = 10'h00e;
            4'h2: out_low = 10'h00d;
            4'h3: out_low = 10'h00d;
            4'h4: out_low = 10'h00d;
            4'h5: out_low = 10'h00d;
            4'h6: out_low = 10'h00d;
            4'h7: out_low = 10'h00c;
            4'h8: out_low = 10'h00c;
            4'h9: out_low = 10'h00c;
            4'ha: out_low = 10'h00c;
            4'hb: out_low = 10'h00c;
            4'hc: out_low = 10'h00c;
            4'hd: out_low = 10'h00b;
            4'he: out_low = 10'h00b;
            4'hf: out_low = 10'h00b;
            default: out_low = 10'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h00b;
            4'h1: out_low = 10'h00b;
            4'h2: out_low = 10'h00b;
            4'h3: out_low = 10'h00a;
            4'h4: out_low = 10'h00a;
            4'h5: out_low = 10'h00a;
            4'h6: out_low = 10'h00a;
            4'h7: out_low = 10'h00a;
            4'h8: out_low = 10'h00a;
            4'h9: out_low = 10'h009;
            4'ha: out_low = 10'h009;
            4'hb: out_low = 10'h009;
            4'hc: out_low = 10'h009;
            4'hd: out_low = 10'h009;
            4'he: out_low = 10'h008;
            4'hf: out_low = 10'h008;
            default: out_low = 10'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h008;
            4'h1: out_low = 10'h008;
            4'h2: out_low = 10'h008;
            4'h3: out_low = 10'h008;
            4'h4: out_low = 10'h007;
            4'h5: out_low = 10'h007;
            4'h6: out_low = 10'h007;
            4'h7: out_low = 10'h007;
            4'h8: out_low = 10'h007;
            4'h9: out_low = 10'h007;
            4'ha: out_low = 10'h006;
            4'hb: out_low = 10'h006;
            4'hc: out_low = 10'h006;
            4'hd: out_low = 10'h006;
            4'he: out_low = 10'h006;
            4'hf: out_low = 10'h006;
            default: out_low = 10'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h005;
            4'h1: out_low = 10'h005;
            4'h2: out_low = 10'h005;
            4'h3: out_low = 10'h005;
            4'h4: out_low = 10'h005;
            4'h5: out_low = 10'h005;
            4'h6: out_low = 10'h004;
            4'h7: out_low = 10'h004;
            4'h8: out_low = 10'h004;
            4'h9: out_low = 10'h004;
            4'ha: out_low = 10'h004;
            4'hb: out_low = 10'h004;
            4'hc: out_low = 10'h003;
            4'hd: out_low = 10'h003;
            4'he: out_low = 10'h003;
            4'hf: out_low = 10'h003;
            default: out_low = 10'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h003;
            4'h1: out_low = 10'h003;
            4'h2: out_low = 10'h002;
            4'h3: out_low = 10'h002;
            4'h4: out_low = 10'h002;
            4'h5: out_low = 10'h002;
            4'h6: out_low = 10'h002;
            4'h7: out_low = 10'h002;
            4'h8: out_low = 10'h001;
            4'h9: out_low = 10'h001;
            4'ha: out_low = 10'h001;
            4'hb: out_low = 10'h001;
            4'hc: out_low = 10'h001;
            4'hd: out_low = 10'h001;
            4'he: out_low = 10'h000;
            4'hf: out_low = 10'h000;
            default: out_low = 10'h000;
          endcase
        end
        default: out_low = 10'h000;
      endcase
      end
      default: out_low = 10'h000;
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
  wire [14:0] active_mag = {mag_b14, mag_b13, mag_b12, mag_b11, mag_b10, out_low};
  wire [15:0] active_out = {sign, active_mag};
  assign out = active ? active_out : special_out;
endmodule
