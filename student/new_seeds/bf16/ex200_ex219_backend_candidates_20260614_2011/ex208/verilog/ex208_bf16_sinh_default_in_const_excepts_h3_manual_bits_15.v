module ex208_bf16_sinh_default_in_const_excepts_h3_manual_bits_15(in, out);
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
  reg [15:0] out_r;
  always @* begin
    out_r = in;
    casez (sign_exp)
      9'h000: out_r = 16'h0000;
      9'h07b: begin
        case (mant_hi3)
          3'h6: begin
            out_r = 16'h3dea;
            case (mant_lo4)
              4'h0: out_r = in;
              4'h1: out_r = in;
              4'h2: out_r = in;
              4'h3: out_r = in;
              4'h4: out_r = in;
              4'h5: out_r = in;
              4'h6: out_r = in;
              4'h7: out_r = in;
              4'h8: out_r = in;
              4'ha: out_r = 16'h3deb;
              4'hb: out_r = 16'h3dec;
              4'hc: out_r = 16'h3ded;
              4'hd: out_r = 16'h3dee;
              4'he: out_r = 16'h3def;
              4'hf: out_r = 16'h3df0;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3df1;
            case (mant_lo4)
              4'h1: out_r = 16'h3df2;
              4'h2: out_r = 16'h3df3;
              4'h3: out_r = 16'h3df4;
              4'h4: out_r = 16'h3df5;
              4'h5: out_r = 16'h3df6;
              4'h6: out_r = 16'h3df7;
              4'h7: out_r = 16'h3df8;
              4'h8: out_r = 16'h3df9;
              4'h9: out_r = 16'h3dfa;
              4'ha: out_r = 16'h3dfb;
              4'hb: out_r = 16'h3dfc;
              4'hc: out_r = 16'h3dfd;
              4'hd: out_r = 16'h3dfe;
              4'he: out_r = 16'h3dff;
              4'hf: out_r = 16'h3e00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi3)
          3'h1: begin
            out_r = 16'h3e14;
            case (mant_lo4)
              4'h0: out_r = in;
              4'h1: out_r = in;
              4'h2: out_r = in;
              4'h4: out_r = 16'h3e15;
              4'h5: out_r = 16'h3e16;
              4'h6: out_r = 16'h3e17;
              4'h7: out_r = 16'h3e18;
              4'h8: out_r = 16'h3e19;
              4'h9: out_r = 16'h3e1a;
              4'ha: out_r = 16'h3e1b;
              4'hb: out_r = 16'h3e1c;
              4'hc: out_r = 16'h3e1d;
              4'hd: out_r = 16'h3e1e;
              4'he: out_r = 16'h3e1f;
              4'hf: out_r = 16'h3e20;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3e21;
            case (mant_lo4)
              4'h1: out_r = 16'h3e22;
              4'h2: out_r = 16'h3e23;
              4'h3: out_r = 16'h3e24;
              4'h4: out_r = 16'h3e25;
              4'h5: out_r = 16'h3e26;
              4'h6: out_r = 16'h3e27;
              4'h7: out_r = 16'h3e28;
              4'h8: out_r = 16'h3e29;
              4'h9: out_r = 16'h3e2a;
              4'ha: out_r = 16'h3e2b;
              4'hb: out_r = 16'h3e2c;
              4'hc: out_r = 16'h3e2d;
              4'hd: out_r = 16'h3e2e;
              4'he: out_r = 16'h3e2f;
              4'hf: out_r = 16'h3e30;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3e31;
            case (mant_lo4)
              4'h1: out_r = 16'h3e32;
              4'h2: out_r = 16'h3e33;
              4'h3: out_r = 16'h3e34;
              4'h4: out_r = 16'h3e35;
              4'h5: out_r = 16'h3e36;
              4'h6: out_r = 16'h3e37;
              4'h7: out_r = 16'h3e38;
              4'h8: out_r = 16'h3e39;
              4'h9: out_r = 16'h3e3a;
              4'ha: out_r = 16'h3e3b;
              4'hb: out_r = 16'h3e3c;
              4'hc: out_r = 16'h3e3d;
              4'hd: out_r = 16'h3e3e;
              4'he: out_r = 16'h3e3f;
              4'hf: out_r = 16'h3e40;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3e41;
            case (mant_lo4)
              4'h1: out_r = 16'h3e42;
              4'h2: out_r = 16'h3e43;
              4'h3: out_r = 16'h3e44;
              4'h4: out_r = 16'h3e45;
              4'h5: out_r = 16'h3e46;
              4'h6: out_r = 16'h3e47;
              4'h7: out_r = 16'h3e48;
              4'h8: out_r = 16'h3e49;
              4'h9: out_r = 16'h3e4a;
              4'ha: out_r = 16'h3e4b;
              4'hb: out_r = 16'h3e4c;
              4'hc: out_r = 16'h3e4d;
              4'hd: out_r = 16'h3e4e;
              4'he: out_r = 16'h3e4f;
              4'hf: out_r = 16'h3e50;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3e51;
            case (mant_lo4)
              4'h1: out_r = 16'h3e52;
              4'h2: out_r = 16'h3e53;
              4'h3: out_r = 16'h3e54;
              4'h4: out_r = 16'h3e56;
              4'h5: out_r = 16'h3e57;
              4'h6: out_r = 16'h3e58;
              4'h7: out_r = 16'h3e59;
              4'h8: out_r = 16'h3e5a;
              4'h9: out_r = 16'h3e5b;
              4'ha: out_r = 16'h3e5c;
              4'hb: out_r = 16'h3e5d;
              4'hc: out_r = 16'h3e5e;
              4'hd: out_r = 16'h3e5f;
              4'he: out_r = 16'h3e60;
              4'hf: out_r = 16'h3e61;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3e62;
            case (mant_lo4)
              4'h1: out_r = 16'h3e63;
              4'h2: out_r = 16'h3e64;
              4'h3: out_r = 16'h3e65;
              4'h4: out_r = 16'h3e66;
              4'h5: out_r = 16'h3e67;
              4'h6: out_r = 16'h3e68;
              4'h7: out_r = 16'h3e69;
              4'h8: out_r = 16'h3e6a;
              4'h9: out_r = 16'h3e6b;
              4'ha: out_r = 16'h3e6c;
              4'hb: out_r = 16'h3e6d;
              4'hc: out_r = 16'h3e6e;
              4'hd: out_r = 16'h3e6f;
              4'he: out_r = 16'h3e70;
              4'hf: out_r = 16'h3e71;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3e80;
            case (mant_lo4)
              4'h0: out_r = 16'h3e72;
              4'h1: out_r = 16'h3e73;
              4'h2: out_r = 16'h3e74;
              4'h3: out_r = 16'h3e75;
              4'h4: out_r = 16'h3e76;
              4'h5: out_r = 16'h3e77;
              4'h6: out_r = 16'h3e78;
              4'h7: out_r = 16'h3e79;
              4'h8: out_r = 16'h3e7a;
              4'h9: out_r = 16'h3e7b;
              4'ha: out_r = 16'h3e7c;
              4'hb: out_r = 16'h3e7e;
              4'hc: out_r = 16'h3e7f;
              4'hf: out_r = 16'h3e81;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3e81;
            case (mant_lo4)
              4'h1: out_r = 16'h3e82;
              4'h2: out_r = 16'h3e83;
              4'h3: out_r = 16'h3e84;
              4'h4: out_r = 16'h3e85;
              4'h5: out_r = 16'h3e87;
              4'h6: out_r = 16'h3e88;
              4'h7: out_r = 16'h3e89;
              4'h8: out_r = 16'h3e8a;
              4'h9: out_r = 16'h3e8b;
              4'ha: out_r = 16'h3e8c;
              4'hb: out_r = 16'h3e8d;
              4'hc: out_r = 16'h3e8e;
              4'hd: out_r = 16'h3e8f;
              4'he: out_r = 16'h3e90;
              4'hf: out_r = 16'h3e91;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3e92;
            case (mant_lo4)
              4'h1: out_r = 16'h3e93;
              4'h2: out_r = 16'h3e94;
              4'h3: out_r = 16'h3e95;
              4'h4: out_r = 16'h3e96;
              4'h5: out_r = 16'h3e97;
              4'h6: out_r = 16'h3e98;
              4'h7: out_r = 16'h3e99;
              4'h8: out_r = 16'h3e9a;
              4'h9: out_r = 16'h3e9b;
              4'ha: out_r = 16'h3e9c;
              4'hb: out_r = 16'h3e9d;
              4'hc: out_r = 16'h3e9e;
              4'hd: out_r = 16'h3e9f;
              4'he: out_r = 16'h3ea1;
              4'hf: out_r = 16'h3ea2;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3ea3;
            case (mant_lo4)
              4'h1: out_r = 16'h3ea4;
              4'h2: out_r = 16'h3ea5;
              4'h3: out_r = 16'h3ea6;
              4'h4: out_r = 16'h3ea7;
              4'h5: out_r = 16'h3ea8;
              4'h6: out_r = 16'h3ea9;
              4'h7: out_r = 16'h3eaa;
              4'h8: out_r = 16'h3eab;
              4'h9: out_r = 16'h3eac;
              4'ha: out_r = 16'h3ead;
              4'hb: out_r = 16'h3eae;
              4'hc: out_r = 16'h3eaf;
              4'hd: out_r = 16'h3eb0;
              4'he: out_r = 16'h3eb1;
              4'hf: out_r = 16'h3eb2;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3eb3;
            case (mant_lo4)
              4'h1: out_r = 16'h3eb5;
              4'h2: out_r = 16'h3eb6;
              4'h3: out_r = 16'h3eb7;
              4'h4: out_r = 16'h3eb8;
              4'h5: out_r = 16'h3eb9;
              4'h6: out_r = 16'h3eba;
              4'h7: out_r = 16'h3ebb;
              4'h8: out_r = 16'h3ebc;
              4'h9: out_r = 16'h3ebd;
              4'ha: out_r = 16'h3ebe;
              4'hb: out_r = 16'h3ebf;
              4'hc: out_r = 16'h3ec0;
              4'hd: out_r = 16'h3ec1;
              4'he: out_r = 16'h3ec2;
              4'hf: out_r = 16'h3ec3;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ec5;
            case (mant_lo4)
              4'h1: out_r = 16'h3ec6;
              4'h2: out_r = 16'h3ec7;
              4'h3: out_r = 16'h3ec8;
              4'h4: out_r = 16'h3ec9;
              4'h5: out_r = 16'h3eca;
              4'h6: out_r = 16'h3ecb;
              4'h7: out_r = 16'h3ecc;
              4'h8: out_r = 16'h3ecd;
              4'h9: out_r = 16'h3ece;
              4'ha: out_r = 16'h3ecf;
              4'hb: out_r = 16'h3ed0;
              4'hc: out_r = 16'h3ed1;
              4'hd: out_r = 16'h3ed3;
              4'he: out_r = 16'h3ed4;
              4'hf: out_r = 16'h3ed5;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3ed6;
            case (mant_lo4)
              4'h1: out_r = 16'h3ed7;
              4'h2: out_r = 16'h3ed8;
              4'h3: out_r = 16'h3ed9;
              4'h4: out_r = 16'h3eda;
              4'h5: out_r = 16'h3edb;
              4'h6: out_r = 16'h3edc;
              4'h7: out_r = 16'h3edd;
              4'h8: out_r = 16'h3ede;
              4'h9: out_r = 16'h3ee0;
              4'ha: out_r = 16'h3ee1;
              4'hb: out_r = 16'h3ee2;
              4'hc: out_r = 16'h3ee3;
              4'hd: out_r = 16'h3ee4;
              4'he: out_r = 16'h3ee5;
              4'hf: out_r = 16'h3ee6;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ee7;
            case (mant_lo4)
              4'h1: out_r = 16'h3ee8;
              4'h2: out_r = 16'h3ee9;
              4'h3: out_r = 16'h3eeb;
              4'h4: out_r = 16'h3eec;
              4'h5: out_r = 16'h3eed;
              4'h6: out_r = 16'h3eee;
              4'h7: out_r = 16'h3eef;
              4'h8: out_r = 16'h3ef0;
              4'h9: out_r = 16'h3ef1;
              4'ha: out_r = 16'h3ef2;
              4'hb: out_r = 16'h3ef3;
              4'hc: out_r = 16'h3ef4;
              4'hd: out_r = 16'h3ef6;
              4'he: out_r = 16'h3ef7;
              4'hf: out_r = 16'h3ef8;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f00;
            case (mant_lo4)
              4'h0: out_r = 16'h3ef9;
              4'h1: out_r = 16'h3efa;
              4'h2: out_r = 16'h3efb;
              4'h3: out_r = 16'h3efc;
              4'h4: out_r = 16'h3efd;
              4'h5: out_r = 16'h3efe;
              4'h8: out_r = 16'h3f01;
              4'h9: out_r = 16'h3f01;
              4'ha: out_r = 16'h3f02;
              4'hb: out_r = 16'h3f03;
              4'hc: out_r = 16'h3f03;
              4'hd: out_r = 16'h3f04;
              4'he: out_r = 16'h3f04;
              4'hf: out_r = 16'h3f05;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f05;
            case (mant_lo4)
              4'h1: out_r = 16'h3f07;
              4'h2: out_r = 16'h3f08;
              4'h3: out_r = 16'h3f09;
              4'h4: out_r = 16'h3f0a;
              4'h5: out_r = 16'h3f0b;
              4'h6: out_r = 16'h3f0c;
              4'h7: out_r = 16'h3f0d;
              4'h8: out_r = 16'h3f0e;
              4'h9: out_r = 16'h3f10;
              4'ha: out_r = 16'h3f11;
              4'hb: out_r = 16'h3f12;
              4'hc: out_r = 16'h3f13;
              4'hd: out_r = 16'h3f14;
              4'he: out_r = 16'h3f15;
              4'hf: out_r = 16'h3f17;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f18;
            case (mant_lo4)
              4'h1: out_r = 16'h3f19;
              4'h2: out_r = 16'h3f1a;
              4'h3: out_r = 16'h3f1b;
              4'h4: out_r = 16'h3f1c;
              4'h5: out_r = 16'h3f1e;
              4'h6: out_r = 16'h3f1f;
              4'h7: out_r = 16'h3f20;
              4'h8: out_r = 16'h3f21;
              4'h9: out_r = 16'h3f22;
              4'ha: out_r = 16'h3f23;
              4'hb: out_r = 16'h3f25;
              4'hc: out_r = 16'h3f26;
              4'hd: out_r = 16'h3f27;
              4'he: out_r = 16'h3f28;
              4'hf: out_r = 16'h3f29;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f2b;
            case (mant_lo4)
              4'h1: out_r = 16'h3f2c;
              4'h2: out_r = 16'h3f2d;
              4'h3: out_r = 16'h3f2e;
              4'h4: out_r = 16'h3f2f;
              4'h5: out_r = 16'h3f31;
              4'h6: out_r = 16'h3f32;
              4'h7: out_r = 16'h3f33;
              4'h8: out_r = 16'h3f34;
              4'h9: out_r = 16'h3f36;
              4'ha: out_r = 16'h3f37;
              4'hb: out_r = 16'h3f38;
              4'hc: out_r = 16'h3f39;
              4'hd: out_r = 16'h3f3a;
              4'he: out_r = 16'h3f3c;
              4'hf: out_r = 16'h3f3d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f3e;
            case (mant_lo4)
              4'h1: out_r = 16'h3f3f;
              4'h2: out_r = 16'h3f41;
              4'h3: out_r = 16'h3f42;
              4'h4: out_r = 16'h3f43;
              4'h5: out_r = 16'h3f44;
              4'h6: out_r = 16'h3f46;
              4'h7: out_r = 16'h3f47;
              4'h8: out_r = 16'h3f48;
              4'h9: out_r = 16'h3f4a;
              4'ha: out_r = 16'h3f4b;
              4'hb: out_r = 16'h3f4c;
              4'hc: out_r = 16'h3f4d;
              4'hd: out_r = 16'h3f4f;
              4'he: out_r = 16'h3f50;
              4'hf: out_r = 16'h3f51;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f53;
            case (mant_lo4)
              4'h1: out_r = 16'h3f54;
              4'h2: out_r = 16'h3f55;
              4'h3: out_r = 16'h3f56;
              4'h4: out_r = 16'h3f58;
              4'h5: out_r = 16'h3f59;
              4'h6: out_r = 16'h3f5a;
              4'h7: out_r = 16'h3f5c;
              4'h8: out_r = 16'h3f5d;
              4'h9: out_r = 16'h3f5e;
              4'ha: out_r = 16'h3f60;
              4'hb: out_r = 16'h3f61;
              4'hc: out_r = 16'h3f62;
              4'hd: out_r = 16'h3f64;
              4'he: out_r = 16'h3f65;
              4'hf: out_r = 16'h3f66;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f68;
            case (mant_lo4)
              4'h1: out_r = 16'h3f69;
              4'h2: out_r = 16'h3f6a;
              4'h3: out_r = 16'h3f6c;
              4'h4: out_r = 16'h3f6d;
              4'h5: out_r = 16'h3f6e;
              4'h6: out_r = 16'h3f70;
              4'h7: out_r = 16'h3f71;
              4'h8: out_r = 16'h3f73;
              4'h9: out_r = 16'h3f74;
              4'ha: out_r = 16'h3f75;
              4'hb: out_r = 16'h3f77;
              4'hc: out_r = 16'h3f78;
              4'hd: out_r = 16'h3f79;
              4'he: out_r = 16'h3f7b;
              4'hf: out_r = 16'h3f7c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f82;
            case (mant_lo4)
              4'h0: out_r = 16'h3f7e;
              4'h1: out_r = 16'h3f7f;
              4'h2: out_r = 16'h3f80;
              4'h3: out_r = 16'h3f81;
              4'h6: out_r = 16'h3f83;
              4'h7: out_r = 16'h3f84;
              4'h8: out_r = 16'h3f85;
              4'h9: out_r = 16'h3f85;
              4'ha: out_r = 16'h3f86;
              4'hb: out_r = 16'h3f87;
              4'hc: out_r = 16'h3f87;
              4'hd: out_r = 16'h3f88;
              4'he: out_r = 16'h3f89;
              4'hf: out_r = 16'h3f8a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f8d;
            case (mant_lo4)
              4'h0: out_r = 16'h3f8a;
              4'h1: out_r = 16'h3f8b;
              4'h2: out_r = 16'h3f8c;
              4'h5: out_r = 16'h3f8e;
              4'h6: out_r = 16'h3f8f;
              4'h7: out_r = 16'h3f90;
              4'h8: out_r = 16'h3f90;
              4'h9: out_r = 16'h3f91;
              4'ha: out_r = 16'h3f92;
              4'hb: out_r = 16'h3f93;
              4'hc: out_r = 16'h3f93;
              4'hd: out_r = 16'h3f94;
              4'he: out_r = 16'h3f95;
              4'hf: out_r = 16'h3f96;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f96;
            case (mant_lo4)
              4'h1: out_r = 16'h3f98;
              4'h2: out_r = 16'h3f9a;
              4'h3: out_r = 16'h3f9b;
              4'h4: out_r = 16'h3f9d;
              4'h5: out_r = 16'h3f9e;
              4'h6: out_r = 16'h3fa0;
              4'h7: out_r = 16'h3fa1;
              4'h8: out_r = 16'h3fa3;
              4'h9: out_r = 16'h3fa5;
              4'ha: out_r = 16'h3fa6;
              4'hb: out_r = 16'h3fa8;
              4'hc: out_r = 16'h3faa;
              4'hd: out_r = 16'h3fab;
              4'he: out_r = 16'h3fad;
              4'hf: out_r = 16'h3faf;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3fb0;
            case (mant_lo4)
              4'h1: out_r = 16'h3fb2;
              4'h2: out_r = 16'h3fb4;
              4'h3: out_r = 16'h3fb6;
              4'h4: out_r = 16'h3fb7;
              4'h5: out_r = 16'h3fb9;
              4'h6: out_r = 16'h3fbb;
              4'h7: out_r = 16'h3fbd;
              4'h8: out_r = 16'h3fbe;
              4'h9: out_r = 16'h3fc0;
              4'ha: out_r = 16'h3fc2;
              4'hb: out_r = 16'h3fc4;
              4'hc: out_r = 16'h3fc6;
              4'hd: out_r = 16'h3fc7;
              4'he: out_r = 16'h3fc9;
              4'hf: out_r = 16'h3fcb;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3fcd;
            case (mant_lo4)
              4'h1: out_r = 16'h3fcf;
              4'h2: out_r = 16'h3fd1;
              4'h3: out_r = 16'h3fd3;
              4'h4: out_r = 16'h3fd5;
              4'h5: out_r = 16'h3fd7;
              4'h6: out_r = 16'h3fd9;
              4'h7: out_r = 16'h3fdb;
              4'h8: out_r = 16'h3fdd;
              4'h9: out_r = 16'h3fdf;
              4'ha: out_r = 16'h3fe1;
              4'hb: out_r = 16'h3fe3;
              4'hc: out_r = 16'h3fe5;
              4'hd: out_r = 16'h3fe7;
              4'he: out_r = 16'h3fe9;
              4'hf: out_r = 16'h3feb;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3fed;
            case (mant_lo4)
              4'h1: out_r = 16'h3fef;
              4'h2: out_r = 16'h3ff1;
              4'h3: out_r = 16'h3ff3;
              4'h4: out_r = 16'h3ff5;
              4'h5: out_r = 16'h3ff8;
              4'h6: out_r = 16'h3ffa;
              4'h7: out_r = 16'h3ffc;
              4'h8: out_r = 16'h3ffe;
              4'h9: out_r = 16'h4000;
              4'ha: out_r = 16'h4001;
              4'hb: out_r = 16'h4002;
              4'hc: out_r = 16'h4004;
              4'hd: out_r = 16'h4005;
              4'he: out_r = 16'h4006;
              4'hf: out_r = 16'h4007;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h4008;
            case (mant_lo4)
              4'h1: out_r = 16'h4009;
              4'h2: out_r = 16'h400b;
              4'h3: out_r = 16'h400c;
              4'h4: out_r = 16'h400d;
              4'h5: out_r = 16'h400e;
              4'h6: out_r = 16'h400f;
              4'h7: out_r = 16'h4011;
              4'h8: out_r = 16'h4012;
              4'h9: out_r = 16'h4013;
              4'ha: out_r = 16'h4014;
              4'hb: out_r = 16'h4016;
              4'hc: out_r = 16'h4017;
              4'hd: out_r = 16'h4018;
              4'he: out_r = 16'h401a;
              4'hf: out_r = 16'h401b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h401c;
            case (mant_lo4)
              4'h1: out_r = 16'h401e;
              4'h2: out_r = 16'h401f;
              4'h3: out_r = 16'h4020;
              4'h4: out_r = 16'h4022;
              4'h5: out_r = 16'h4023;
              4'h6: out_r = 16'h4024;
              4'h7: out_r = 16'h4026;
              4'h8: out_r = 16'h4027;
              4'h9: out_r = 16'h4028;
              4'ha: out_r = 16'h402a;
              4'hb: out_r = 16'h402b;
              4'hc: out_r = 16'h402d;
              4'hd: out_r = 16'h402e;
              4'he: out_r = 16'h4030;
              4'hf: out_r = 16'h4031;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4033;
            case (mant_lo4)
              4'h1: out_r = 16'h4034;
              4'h2: out_r = 16'h4036;
              4'h3: out_r = 16'h4037;
              4'h4: out_r = 16'h4039;
              4'h5: out_r = 16'h403a;
              4'h6: out_r = 16'h403c;
              4'h7: out_r = 16'h403d;
              4'h8: out_r = 16'h403f;
              4'h9: out_r = 16'h4040;
              4'ha: out_r = 16'h4042;
              4'hb: out_r = 16'h4044;
              4'hc: out_r = 16'h4045;
              4'hd: out_r = 16'h4047;
              4'he: out_r = 16'h4048;
              4'hf: out_r = 16'h404a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h404c;
            case (mant_lo4)
              4'h1: out_r = 16'h404d;
              4'h2: out_r = 16'h404f;
              4'h3: out_r = 16'h4051;
              4'h4: out_r = 16'h4053;
              4'h5: out_r = 16'h4054;
              4'h6: out_r = 16'h4056;
              4'h7: out_r = 16'h4058;
              4'h8: out_r = 16'h405a;
              4'h9: out_r = 16'h405b;
              4'ha: out_r = 16'h405d;
              4'hb: out_r = 16'h405f;
              4'hc: out_r = 16'h4061;
              4'hd: out_r = 16'h4063;
              4'he: out_r = 16'h4064;
              4'hf: out_r = 16'h4066;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h4068;
            case (mant_lo4)
              4'h1: out_r = 16'h406c;
              4'h2: out_r = 16'h4070;
              4'h3: out_r = 16'h4074;
              4'h4: out_r = 16'h4078;
              4'h5: out_r = 16'h407c;
              4'h6: out_r = 16'h4080;
              4'h7: out_r = 16'h4082;
              4'h8: out_r = 16'h4084;
              4'h9: out_r = 16'h4086;
              4'ha: out_r = 16'h4088;
              4'hb: out_r = 16'h408b;
              4'hc: out_r = 16'h408d;
              4'hd: out_r = 16'h408f;
              4'he: out_r = 16'h4091;
              4'hf: out_r = 16'h4094;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h4096;
            case (mant_lo4)
              4'h1: out_r = 16'h4099;
              4'h2: out_r = 16'h409b;
              4'h3: out_r = 16'h409d;
              4'h4: out_r = 16'h40a0;
              4'h5: out_r = 16'h40a3;
              4'h6: out_r = 16'h40a5;
              4'h7: out_r = 16'h40a8;
              4'h8: out_r = 16'h40ab;
              4'h9: out_r = 16'h40ad;
              4'ha: out_r = 16'h40b0;
              4'hb: out_r = 16'h40b3;
              4'hc: out_r = 16'h40b6;
              4'hd: out_r = 16'h40b9;
              4'he: out_r = 16'h40bc;
              4'hf: out_r = 16'h40bf;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h40c2;
            case (mant_lo4)
              4'h1: out_r = 16'h40c5;
              4'h2: out_r = 16'h40c8;
              4'h3: out_r = 16'h40cb;
              4'h4: out_r = 16'h40ce;
              4'h5: out_r = 16'h40d2;
              4'h6: out_r = 16'h40d5;
              4'h7: out_r = 16'h40d8;
              4'h8: out_r = 16'h40dc;
              4'h9: out_r = 16'h40df;
              4'ha: out_r = 16'h40e3;
              4'hb: out_r = 16'h40e6;
              4'hc: out_r = 16'h40ea;
              4'hd: out_r = 16'h40ee;
              4'he: out_r = 16'h40f2;
              4'hf: out_r = 16'h40f5;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h40f9;
            case (mant_lo4)
              4'h1: out_r = 16'h40fd;
              4'h2: out_r = 16'h4101;
              4'h3: out_r = 16'h4103;
              4'h4: out_r = 16'h4105;
              4'h5: out_r = 16'h4107;
              4'h6: out_r = 16'h4109;
              4'h7: out_r = 16'h410b;
              4'h8: out_r = 16'h410d;
              4'h9: out_r = 16'h4110;
              4'ha: out_r = 16'h4112;
              4'hb: out_r = 16'h4114;
              4'hc: out_r = 16'h4117;
              4'hd: out_r = 16'h4119;
              4'he: out_r = 16'h411b;
              4'hf: out_r = 16'h411e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h4120;
            case (mant_lo4)
              4'h1: out_r = 16'h4123;
              4'h2: out_r = 16'h4125;
              4'h3: out_r = 16'h4128;
              4'h4: out_r = 16'h412b;
              4'h5: out_r = 16'h412d;
              4'h6: out_r = 16'h4130;
              4'h7: out_r = 16'h4133;
              4'h8: out_r = 16'h4136;
              4'h9: out_r = 16'h4139;
              4'ha: out_r = 16'h413c;
              4'hb: out_r = 16'h413e;
              4'hc: out_r = 16'h4141;
              4'hd: out_r = 16'h4145;
              4'he: out_r = 16'h4148;
              4'hf: out_r = 16'h414b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h414e;
            case (mant_lo4)
              4'h1: out_r = 16'h4151;
              4'h2: out_r = 16'h4155;
              4'h3: out_r = 16'h4158;
              4'h4: out_r = 16'h415b;
              4'h5: out_r = 16'h415f;
              4'h6: out_r = 16'h4162;
              4'h7: out_r = 16'h4166;
              4'h8: out_r = 16'h416a;
              4'h9: out_r = 16'h416d;
              4'ha: out_r = 16'h4171;
              4'hb: out_r = 16'h4175;
              4'hc: out_r = 16'h4179;
              4'hd: out_r = 16'h417d;
              4'he: out_r = 16'h4180;
              4'hf: out_r = 16'h4182;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4184;
            case (mant_lo4)
              4'h1: out_r = 16'h4186;
              4'h2: out_r = 16'h4189;
              4'h3: out_r = 16'h418b;
              4'h4: out_r = 16'h418d;
              4'h5: out_r = 16'h418f;
              4'h6: out_r = 16'h4191;
              4'h7: out_r = 16'h4194;
              4'h8: out_r = 16'h4196;
              4'h9: out_r = 16'h4198;
              4'ha: out_r = 16'h419b;
              4'hb: out_r = 16'h419d;
              4'hc: out_r = 16'h41a0;
              4'hd: out_r = 16'h41a2;
              4'he: out_r = 16'h41a5;
              4'hf: out_r = 16'h41a7;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h41aa;
            case (mant_lo4)
              4'h1: out_r = 16'h41ad;
              4'h2: out_r = 16'h41af;
              4'h3: out_r = 16'h41b2;
              4'h4: out_r = 16'h41b5;
              4'h5: out_r = 16'h41b8;
              4'h6: out_r = 16'h41bb;
              4'h7: out_r = 16'h41be;
              4'h8: out_r = 16'h41c1;
              4'h9: out_r = 16'h41c4;
              4'ha: out_r = 16'h41c7;
              4'hb: out_r = 16'h41ca;
              4'hc: out_r = 16'h41cd;
              4'hd: out_r = 16'h41d0;
              4'he: out_r = 16'h41d4;
              4'hf: out_r = 16'h41d7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h41da;
            case (mant_lo4)
              4'h1: out_r = 16'h41e1;
              4'h2: out_r = 16'h41e8;
              4'h3: out_r = 16'h41f0;
              4'h4: out_r = 16'h41f7;
              4'h5: out_r = 16'h41ff;
              4'h6: out_r = 16'h4204;
              4'h7: out_r = 16'h4208;
              4'h8: out_r = 16'h420c;
              4'h9: out_r = 16'h4211;
              4'ha: out_r = 16'h4215;
              4'hb: out_r = 16'h421a;
              4'hc: out_r = 16'h421f;
              4'hd: out_r = 16'h4224;
              4'he: out_r = 16'h4229;
              4'hf: out_r = 16'h422e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h4234;
            case (mant_lo4)
              4'h1: out_r = 16'h423a;
              4'h2: out_r = 16'h4240;
              4'h3: out_r = 16'h4246;
              4'h4: out_r = 16'h424c;
              4'h5: out_r = 16'h4252;
              4'h6: out_r = 16'h4259;
              4'h7: out_r = 16'h4260;
              4'h8: out_r = 16'h4267;
              4'h9: out_r = 16'h426e;
              4'ha: out_r = 16'h4276;
              4'hb: out_r = 16'h427e;
              4'hc: out_r = 16'h4283;
              4'hd: out_r = 16'h4287;
              4'he: out_r = 16'h428b;
              4'hf: out_r = 16'h4290;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h4294;
            case (mant_lo4)
              4'h1: out_r = 16'h4299;
              4'h2: out_r = 16'h429e;
              4'h3: out_r = 16'h42a3;
              4'h4: out_r = 16'h42a8;
              4'h5: out_r = 16'h42ae;
              4'h6: out_r = 16'h42b3;
              4'h7: out_r = 16'h42b9;
              4'h8: out_r = 16'h42bf;
              4'h9: out_r = 16'h42c5;
              4'ha: out_r = 16'h42cb;
              4'hb: out_r = 16'h42d1;
              4'hc: out_r = 16'h42d8;
              4'hd: out_r = 16'h42df;
              4'he: out_r = 16'h42e6;
              4'hf: out_r = 16'h42ed;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h42f5;
            case (mant_lo4)
              4'h1: out_r = 16'h42fc;
              4'h2: out_r = 16'h4302;
              4'h3: out_r = 16'h4306;
              4'h4: out_r = 16'h430b;
              4'h5: out_r = 16'h430f;
              4'h6: out_r = 16'h4314;
              4'h7: out_r = 16'h4318;
              4'h8: out_r = 16'h431d;
              4'h9: out_r = 16'h4322;
              4'ha: out_r = 16'h4327;
              4'hb: out_r = 16'h432d;
              4'hc: out_r = 16'h4332;
              4'hd: out_r = 16'h4338;
              4'he: out_r = 16'h433d;
              4'hf: out_r = 16'h4344;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h434a;
            case (mant_lo4)
              4'h1: out_r = 16'h4350;
              4'h2: out_r = 16'h4357;
              4'h3: out_r = 16'h435e;
              4'h4: out_r = 16'h4365;
              4'h5: out_r = 16'h436c;
              4'h6: out_r = 16'h4373;
              4'h7: out_r = 16'h437b;
              4'h8: out_r = 16'h4382;
              4'h9: out_r = 16'h4386;
              4'ha: out_r = 16'h438a;
              4'hb: out_r = 16'h438e;
              4'hc: out_r = 16'h4393;
              4'hd: out_r = 16'h4397;
              4'he: out_r = 16'h439c;
              4'hf: out_r = 16'h43a1;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h43a6;
            case (mant_lo4)
              4'h1: out_r = 16'h43ac;
              4'h2: out_r = 16'h43b1;
              4'h3: out_r = 16'h43b7;
              4'h4: out_r = 16'h43bc;
              4'h5: out_r = 16'h43c2;
              4'h6: out_r = 16'h43c9;
              4'h7: out_r = 16'h43cf;
              4'h8: out_r = 16'h43d6;
              4'h9: out_r = 16'h43dc;
              4'ha: out_r = 16'h43e3;
              4'hb: out_r = 16'h43ea;
              4'hc: out_r = 16'h43f2;
              4'hd: out_r = 16'h43fa;
              4'he: out_r = 16'h4401;
              4'hf: out_r = 16'h4405;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4409;
            case (mant_lo4)
              4'h1: out_r = 16'h440d;
              4'h2: out_r = 16'h4412;
              4'h3: out_r = 16'h4417;
              4'h4: out_r = 16'h441b;
              4'h5: out_r = 16'h4420;
              4'h6: out_r = 16'h4425;
              4'h7: out_r = 16'h442b;
              4'h8: out_r = 16'h4430;
              4'h9: out_r = 16'h4436;
              4'ha: out_r = 16'h443b;
              4'hb: out_r = 16'h4441;
              4'hc: out_r = 16'h4447;
              4'hd: out_r = 16'h444e;
              4'he: out_r = 16'h4454;
              4'hf: out_r = 16'h445b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h4462;
            case (mant_lo4)
              4'h1: out_r = 16'h4469;
              4'h2: out_r = 16'h4471;
              4'h3: out_r = 16'h4478;
              4'h4: out_r = 16'h4480;
              4'h5: out_r = 16'h4484;
              4'h6: out_r = 16'h4488;
              4'h7: out_r = 16'h448d;
              4'h8: out_r = 16'h4491;
              4'h9: out_r = 16'h4496;
              4'ha: out_r = 16'h449a;
              4'hb: out_r = 16'h449f;
              4'hc: out_r = 16'h44a4;
              4'hd: out_r = 16'h44aa;
              4'he: out_r = 16'h44af;
              4'hf: out_r = 16'h44b5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h44ba;
            case (mant_lo4)
              4'h1: out_r = 16'h44c6;
              4'h2: out_r = 16'h44d3;
              4'h3: out_r = 16'h44e1;
              4'h4: out_r = 16'h44ef;
              4'h5: out_r = 16'h44ff;
              4'h6: out_r = 16'h4508;
              4'h7: out_r = 16'h4510;
              4'h8: out_r = 16'h451a;
              4'h9: out_r = 16'h4523;
              4'ha: out_r = 16'h452e;
              4'hb: out_r = 16'h4539;
              4'hc: out_r = 16'h4545;
              4'hd: out_r = 16'h4552;
              4'he: out_r = 16'h455f;
              4'hf: out_r = 16'h456e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h457d;
            case (mant_lo4)
              4'h1: out_r = 16'h4587;
              4'h2: out_r = 16'h458f;
              4'h3: out_r = 16'h4599;
              4'h4: out_r = 16'h45a3;
              4'h5: out_r = 16'h45ad;
              4'h6: out_r = 16'h45b8;
              4'h7: out_r = 16'h45c4;
              4'h8: out_r = 16'h45d1;
              4'h9: out_r = 16'h45de;
              4'ha: out_r = 16'h45ed;
              4'hb: out_r = 16'h45fc;
              4'hc: out_r = 16'h4606;
              4'hd: out_r = 16'h460f;
              4'he: out_r = 16'h4618;
              4'hf: out_r = 16'h4622;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h462c;
            case (mant_lo4)
              4'h1: out_r = 16'h4637;
              4'h2: out_r = 16'h4643;
              4'h3: out_r = 16'h4650;
              4'h4: out_r = 16'h465d;
              4'h5: out_r = 16'h466b;
              4'h6: out_r = 16'h467a;
              4'h7: out_r = 16'h4685;
              4'h8: out_r = 16'h468e;
              4'h9: out_r = 16'h4697;
              4'ha: out_r = 16'h46a1;
              4'hb: out_r = 16'h46ab;
              4'hc: out_r = 16'h46b6;
              4'hd: out_r = 16'h46c2;
              4'he: out_r = 16'h46ce;
              4'hf: out_r = 16'h46dc;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h46ea;
            case (mant_lo4)
              4'h1: out_r = 16'h46f9;
              4'h2: out_r = 16'h4705;
              4'h3: out_r = 16'h470d;
              4'h4: out_r = 16'h4716;
              4'h5: out_r = 16'h4720;
              4'h6: out_r = 16'h472a;
              4'h7: out_r = 16'h4735;
              4'h8: out_r = 16'h4741;
              4'h9: out_r = 16'h474d;
              4'ha: out_r = 16'h475a;
              4'hb: out_r = 16'h4769;
              4'hc: out_r = 16'h4778;
              4'hd: out_r = 16'h4784;
              4'he: out_r = 16'h478c;
              4'hf: out_r = 16'h4795;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h479f;
            case (mant_lo4)
              4'h1: out_r = 16'h47a9;
              4'h2: out_r = 16'h47b4;
              4'h3: out_r = 16'h47c0;
              4'h4: out_r = 16'h47cc;
              4'h5: out_r = 16'h47d9;
              4'h6: out_r = 16'h47e7;
              4'h7: out_r = 16'h47f6;
              4'h8: out_r = 16'h4803;
              4'h9: out_r = 16'h480b;
              4'ha: out_r = 16'h4814;
              4'hb: out_r = 16'h481e;
              4'hc: out_r = 16'h4828;
              4'hd: out_r = 16'h4833;
              4'he: out_r = 16'h483f;
              4'hf: out_r = 16'h484b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h4858;
            case (mant_lo4)
              4'h1: out_r = 16'h4866;
              4'h2: out_r = 16'h4875;
              4'h3: out_r = 16'h4882;
              4'h4: out_r = 16'h488b;
              4'h5: out_r = 16'h4894;
              4'h6: out_r = 16'h489d;
              4'h7: out_r = 16'h48a7;
              4'h8: out_r = 16'h48b2;
              4'h9: out_r = 16'h48be;
              4'ha: out_r = 16'h48ca;
              4'hb: out_r = 16'h48d7;
              4'hc: out_r = 16'h48e5;
              4'hd: out_r = 16'h48f3;
              4'he: out_r = 16'h4902;
              4'hf: out_r = 16'h490a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4913;
            case (mant_lo4)
              4'h1: out_r = 16'h491c;
              4'h2: out_r = 16'h4926;
              4'h3: out_r = 16'h4931;
              4'h4: out_r = 16'h493c;
              4'h5: out_r = 16'h4949;
              4'h6: out_r = 16'h4956;
              4'h7: out_r = 16'h4963;
              4'h8: out_r = 16'h4972;
              4'h9: out_r = 16'h4981;
              4'ha: out_r = 16'h4989;
              4'hb: out_r = 16'h4992;
              4'hc: out_r = 16'h499b;
              4'hd: out_r = 16'h49a5;
              4'he: out_r = 16'h49b0;
              4'hf: out_r = 16'h49bb;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h49c8;
            case (mant_lo4)
              4'h1: out_r = 16'h49d4;
              4'h2: out_r = 16'h49e2;
              4'h3: out_r = 16'h49f1;
              4'h4: out_r = 16'h4a00;
              4'h5: out_r = 16'h4a08;
              4'h6: out_r = 16'h4a11;
              4'h7: out_r = 16'h4a1b;
              4'h8: out_r = 16'h4a24;
              4'h9: out_r = 16'h4a2f;
              4'ha: out_r = 16'h4a3a;
              4'hb: out_r = 16'h4a46;
              4'hc: out_r = 16'h4a53;
              4'hd: out_r = 16'h4a61;
              4'he: out_r = 16'h4a6f;
              4'hf: out_r = 16'h4a7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h083: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h4a88;
            case (mant_lo4)
              4'h1: out_r = 16'h4a9a;
              4'h2: out_r = 16'h4aae;
              4'h3: out_r = 16'h4ac5;
              4'h4: out_r = 16'h4ae0;
              4'h5: out_r = 16'h4afd;
              4'h6: out_r = 16'h4b10;
              4'h7: out_r = 16'h4b23;
              4'h8: out_r = 16'h4b38;
              4'h9: out_r = 16'h4b51;
              4'ha: out_r = 16'h4b6d;
              4'hb: out_r = 16'h4b86;
              4'hc: out_r = 16'h4b98;
              4'hd: out_r = 16'h4bac;
              4'he: out_r = 16'h4bc3;
              4'hf: out_r = 16'h4bdd;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h4bfa;
            case (mant_lo4)
              4'h1: out_r = 16'h4c0e;
              4'h2: out_r = 16'h4c21;
              4'h3: out_r = 16'h4c36;
              4'h4: out_r = 16'h4c4e;
              4'h5: out_r = 16'h4c6a;
              4'h6: out_r = 16'h4c85;
              4'h7: out_r = 16'h4c96;
              4'h8: out_r = 16'h4caa;
              4'h9: out_r = 16'h4cc1;
              4'ha: out_r = 16'h4cdb;
              4'hb: out_r = 16'h4cf8;
              4'hc: out_r = 16'h4d0c;
              4'hd: out_r = 16'h4d1f;
              4'he: out_r = 16'h4d34;
              4'hf: out_r = 16'h4d4c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h4d67;
            case (mant_lo4)
              4'h1: out_r = 16'h4d83;
              4'h2: out_r = 16'h4d95;
              4'h3: out_r = 16'h4da8;
              4'h4: out_r = 16'h4dbf;
              4'h5: out_r = 16'h4dd8;
              4'h6: out_r = 16'h4df5;
              4'h7: out_r = 16'h4e0b;
              4'h8: out_r = 16'h4e1d;
              4'h9: out_r = 16'h4e32;
              4'ha: out_r = 16'h4e4a;
              4'hb: out_r = 16'h4e65;
              4'hc: out_r = 16'h4e82;
              4'hd: out_r = 16'h4e93;
              4'he: out_r = 16'h4ea6;
              4'hf: out_r = 16'h4ebd;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h4ed6;
            case (mant_lo4)
              4'h1: out_r = 16'h4ef2;
              4'h2: out_r = 16'h4f09;
              4'h3: out_r = 16'h4f1b;
              4'h4: out_r = 16'h4f30;
              4'h5: out_r = 16'h4f48;
              4'h6: out_r = 16'h4f62;
              4'h7: out_r = 16'h4f80;
              4'h8: out_r = 16'h4f91;
              4'h9: out_r = 16'h4fa5;
              4'ha: out_r = 16'h4fba;
              4'hb: out_r = 16'h4fd3;
              4'hc: out_r = 16'h4fef;
              4'hd: out_r = 16'h5008;
              4'he: out_r = 16'h501a;
              4'hf: out_r = 16'h502e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h5045;
            case (mant_lo4)
              4'h1: out_r = 16'h5060;
              4'h2: out_r = 16'h507d;
              4'h3: out_r = 16'h5090;
              4'h4: out_r = 16'h50a3;
              4'h5: out_r = 16'h50b8;
              4'h6: out_r = 16'h50d1;
              4'h7: out_r = 16'h50ed;
              4'h8: out_r = 16'h5106;
              4'h9: out_r = 16'h5118;
              4'ha: out_r = 16'h512c;
              4'hb: out_r = 16'h5143;
              4'hc: out_r = 16'h515d;
              4'hd: out_r = 16'h517b;
              4'he: out_r = 16'h518e;
              4'hf: out_r = 16'h51a1;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h51b6;
            case (mant_lo4)
              4'h1: out_r = 16'h51cf;
              4'h2: out_r = 16'h51ea;
              4'h3: out_r = 16'h5205;
              4'h4: out_r = 16'h5216;
              4'h5: out_r = 16'h522a;
              4'h6: out_r = 16'h5241;
              4'h7: out_r = 16'h525b;
              4'h8: out_r = 16'h5278;
              4'h9: out_r = 16'h528c;
              4'ha: out_r = 16'h529f;
              4'hb: out_r = 16'h52b4;
              4'hc: out_r = 16'h52cc;
              4'hd: out_r = 16'h52e7;
              4'he: out_r = 16'h5303;
              4'hf: out_r = 16'h5315;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h5328;
            case (mant_lo4)
              4'h1: out_r = 16'h533f;
              4'h2: out_r = 16'h5358;
              4'h3: out_r = 16'h5375;
              4'h4: out_r = 16'h538b;
              4'h5: out_r = 16'h539d;
              4'h6: out_r = 16'h53b2;
              4'h7: out_r = 16'h53ca;
              4'h8: out_r = 16'h53e5;
              4'h9: out_r = 16'h5402;
              4'ha: out_r = 16'h5413;
              4'hb: out_r = 16'h5426;
              4'hc: out_r = 16'h543d;
              4'hd: out_r = 16'h5456;
              4'he: out_r = 16'h5472;
              4'hf: out_r = 16'h5489;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h549c;
            case (mant_lo4)
              4'h1: out_r = 16'h54b0;
              4'h2: out_r = 16'h54c8;
              4'h3: out_r = 16'h54e2;
              4'h4: out_r = 16'h5500;
              4'h5: out_r = 16'h5511;
              4'h6: out_r = 16'h5525;
              4'h7: out_r = 16'h553b;
              4'h8: out_r = 16'h5553;
              4'h9: out_r = 16'h5570;
              4'ha: out_r = 16'h5588;
              4'hb: out_r = 16'h559a;
              4'hc: out_r = 16'h55ae;
              4'hd: out_r = 16'h55c5;
              4'he: out_r = 16'h55e0;
              4'hf: out_r = 16'h55fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h084: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h5610;
            case (mant_lo4)
              4'h1: out_r = 16'h5638;
              4'h2: out_r = 16'h566d;
              4'h3: out_r = 16'h5698;
              4'h4: out_r = 16'h56c3;
              4'h5: out_r = 16'h56fb;
              4'h6: out_r = 16'h5721;
              4'h7: out_r = 16'h574f;
              4'h8: out_r = 16'h5785;
              4'h9: out_r = 16'h57aa;
              4'ha: out_r = 16'h57db;
              4'hb: out_r = 16'h580c;
              4'hc: out_r = 16'h5834;
              4'hd: out_r = 16'h5868;
              4'he: out_r = 16'h5895;
              4'hf: out_r = 16'h58bf;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h58f5;
            case (mant_lo4)
              4'h1: out_r = 16'h591d;
              4'h2: out_r = 16'h594a;
              4'h3: out_r = 16'h5982;
              4'h4: out_r = 16'h59a7;
              4'h5: out_r = 16'h59d6;
              4'h6: out_r = 16'h5a09;
              4'h7: out_r = 16'h5a30;
              4'h8: out_r = 16'h5a62;
              4'h9: out_r = 16'h5a91;
              4'ha: out_r = 16'h5abb;
              4'hb: out_r = 16'h5af0;
              4'hc: out_r = 16'h5b1a;
              4'hd: out_r = 16'h5b46;
              4'he: out_r = 16'h5b7e;
              4'hf: out_r = 16'h5ba3;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h5bd1;
            case (mant_lo4)
              4'h1: out_r = 16'h5c06;
              4'h2: out_r = 16'h5c2c;
              4'h3: out_r = 16'h5c5d;
              4'h4: out_r = 16'h5c8e;
              4'h5: out_r = 16'h5cb6;
              4'h6: out_r = 16'h5cea;
              4'h7: out_r = 16'h5d16;
              4'h8: out_r = 16'h5d41;
              4'h9: out_r = 16'h5d78;
              4'ha: out_r = 16'h5d9f;
              4'hb: out_r = 16'h5dcc;
              4'hc: out_r = 16'h5e03;
              4'hd: out_r = 16'h5e28;
              4'he: out_r = 16'h5e58;
              4'hf: out_r = 16'h5e8b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h5eb2;
            case (mant_lo4)
              4'h1: out_r = 16'h5ee5;
              4'h2: out_r = 16'h5f13;
              4'h3: out_r = 16'h5f3d;
              4'h4: out_r = 16'h5f72;
              4'h5: out_r = 16'h5f9c;
              4'h6: out_r = 16'h5fc8;
              4'h7: out_r = 16'h6000;
              4'h8: out_r = 16'h6025;
              4'h9: out_r = 16'h6054;
              4'ha: out_r = 16'h6088;
              4'hb: out_r = 16'h60ae;
              4'hc: out_r = 16'h60e0;
              4'hd: out_r = 16'h6110;
              4'he: out_r = 16'h6139;
              4'hf: out_r = 16'h616d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h6198;
            case (mant_lo4)
              4'h1: out_r = 16'h61c3;
              4'h2: out_r = 16'h61fb;
              4'h3: out_r = 16'h6221;
              4'h4: out_r = 16'h624f;
              4'h5: out_r = 16'h6285;
              4'h6: out_r = 16'h62aa;
              4'h7: out_r = 16'h62db;
              4'h8: out_r = 16'h630d;
              4'h9: out_r = 16'h6334;
              4'ha: out_r = 16'h6368;
              4'hb: out_r = 16'h6395;
              4'hc: out_r = 16'h63bf;
              4'hd: out_r = 16'h63f5;
              4'he: out_r = 16'h641d;
              4'hf: out_r = 16'h644a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h6482;
            case (mant_lo4)
              4'h1: out_r = 16'h64a7;
              4'h2: out_r = 16'h64d6;
              4'h3: out_r = 16'h6509;
              4'h4: out_r = 16'h6530;
              4'h5: out_r = 16'h6563;
              4'h6: out_r = 16'h6591;
              4'h7: out_r = 16'h65bb;
              4'h8: out_r = 16'h65f0;
              4'h9: out_r = 16'h661a;
              4'ha: out_r = 16'h6646;
              4'hb: out_r = 16'h667e;
              4'hc: out_r = 16'h66a3;
              4'hd: out_r = 16'h66d1;
              4'he: out_r = 16'h6706;
              4'hf: out_r = 16'h672c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h675d;
            case (mant_lo4)
              4'h1: out_r = 16'h678e;
              4'h2: out_r = 16'h67b7;
              4'h3: out_r = 16'h67ea;
              4'h4: out_r = 16'h6816;
              4'h5: out_r = 16'h6841;
              4'h6: out_r = 16'h6878;
              4'h7: out_r = 16'h689f;
              4'h8: out_r = 16'h68cd;
              4'h9: out_r = 16'h6903;
              4'ha: out_r = 16'h6929;
              4'hb: out_r = 16'h6959;
              4'hc: out_r = 16'h698b;
              4'hd: out_r = 16'h69b2;
              4'he: out_r = 16'h69e5;
              4'hf: out_r = 16'h6a13;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h6a3d;
            case (mant_lo4)
              4'h1: out_r = 16'h6a73;
              4'h2: out_r = 16'h6a9c;
              4'h3: out_r = 16'h6ac8;
              4'h4: out_r = 16'h6b00;
              4'h5: out_r = 16'h6b25;
              4'h6: out_r = 16'h6b54;
              4'h7: out_r = 16'h6b88;
              4'h8: out_r = 16'h6baf;
              4'h9: out_r = 16'h6be0;
              4'ha: out_r = 16'h6c10;
              4'hb: out_r = 16'h6c39;
              4'hc: out_r = 16'h6c6d;
              4'hd: out_r = 16'h6c98;
              4'he: out_r = 16'h6cc4;
              4'hf: out_r = 16'h6cfb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h6d21;
            case (mant_lo4)
              4'h1: out_r = 16'h6d85;
              4'h2: out_r = 16'h6ddb;
              4'h3: out_r = 16'h6e35;
              4'h4: out_r = 16'h6e95;
              4'h5: out_r = 16'h6ef5;
              4'h6: out_r = 16'h6f4a;
              4'h7: out_r = 16'h6fa7;
              4'h8: out_r = 16'h7009;
              4'h9: out_r = 16'h7063;
              4'ha: out_r = 16'h70bb;
              4'hb: out_r = 16'h711a;
              4'hc: out_r = 16'h717e;
              4'hd: out_r = 16'h71d1;
              4'he: out_r = 16'h722d;
              4'hf: out_r = 16'h728e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h72eb;
            case (mant_lo4)
              4'h1: out_r = 16'h7341;
              4'h2: out_r = 16'h739f;
              4'h3: out_r = 16'h7403;
              4'h4: out_r = 16'h7459;
              4'h5: out_r = 16'h74b3;
              4'h6: out_r = 16'h7513;
              4'h7: out_r = 16'h7573;
              4'h8: out_r = 16'h75c8;
              4'h9: out_r = 16'h7625;
              4'ha: out_r = 16'h7688;
              4'hb: out_r = 16'h76e0;
              4'hc: out_r = 16'h7739;
              4'hd: out_r = 16'h7798;
              4'he: out_r = 16'h77fb;
              4'hf: out_r = 16'h784f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h78ab;
            case (mant_lo4)
              4'h1: out_r = 16'h790d;
              4'h2: out_r = 16'h7968;
              4'h3: out_r = 16'h79bf;
              4'h4: out_r = 16'h7a1e;
              4'h5: out_r = 16'h7a82;
              4'h6: out_r = 16'h7ad6;
              4'h7: out_r = 16'h7b31;
              4'h8: out_r = 16'h7b92;
              4'h9: out_r = 16'h7bf0;
              4'ha: out_r = 16'h7c46;
              4'hb: out_r = 16'h7ca3;
              4'hc: out_r = 16'h7d07;
              4'hd: out_r = 16'h7d5e;
              4'he: out_r = 16'h7db7;
              4'hf: out_r = 16'h7e17;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h7f80;
            case (mant_lo4)
              4'h0: out_r = 16'h7e79;
              4'h1: out_r = 16'h7ecd;
              4'h2: out_r = 16'h7f29;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h7f80;
          end
          3'h5: begin
            out_r = 16'h7f80;
          end
          3'h6: begin
            out_r = 16'h7f80;
          end
          3'h7: begin
            out_r = 16'h7f80;
          end
          default: begin end
        endcase
      end
      9'h086: out_r = 16'h7f80;
      9'h087: out_r = 16'h7f80;
      9'h088: out_r = 16'h7f80;
      9'h089: out_r = 16'h7f80;
      9'h08a: out_r = 16'h7f80;
      9'h08b: out_r = 16'h7f80;
      9'h08c: out_r = 16'h7f80;
      9'h08d: out_r = 16'h7f80;
      9'h08e: out_r = 16'h7f80;
      9'h08f: out_r = 16'h7f80;
      9'h090: out_r = 16'h7f80;
      9'h091: out_r = 16'h7f80;
      9'h092: out_r = 16'h7f80;
      9'h093: out_r = 16'h7f80;
      9'h094: out_r = 16'h7f80;
      9'h095: out_r = 16'h7f80;
      9'h096: out_r = 16'h7f80;
      9'h097: out_r = 16'h7f80;
      9'h098: out_r = 16'h7f80;
      9'h099: out_r = 16'h7f80;
      9'h09a: out_r = 16'h7f80;
      9'h09b: out_r = 16'h7f80;
      9'h09c: out_r = 16'h7f80;
      9'h09d: out_r = 16'h7f80;
      9'h09e: out_r = 16'h7f80;
      9'h09f: out_r = 16'h7f80;
      9'h0a0: out_r = 16'h7f80;
      9'h0a1: out_r = 16'h7f80;
      9'h0a2: out_r = 16'h7f80;
      9'h0a3: out_r = 16'h7f80;
      9'h0a4: out_r = 16'h7f80;
      9'h0a5: out_r = 16'h7f80;
      9'h0a6: out_r = 16'h7f80;
      9'h0a7: out_r = 16'h7f80;
      9'h0a8: out_r = 16'h7f80;
      9'h0a9: out_r = 16'h7f80;
      9'h0aa: out_r = 16'h7f80;
      9'h0ab: out_r = 16'h7f80;
      9'h0ac: out_r = 16'h7f80;
      9'h0ad: out_r = 16'h7f80;
      9'h0ae: out_r = 16'h7f80;
      9'h0af: out_r = 16'h7f80;
      9'h0b0: out_r = 16'h7f80;
      9'h0b1: out_r = 16'h7f80;
      9'h0b2: out_r = 16'h7f80;
      9'h0b3: out_r = 16'h7f80;
      9'h0b4: out_r = 16'h7f80;
      9'h0b5: out_r = 16'h7f80;
      9'h0b6: out_r = 16'h7f80;
      9'h0b7: out_r = 16'h7f80;
      9'h0b8: out_r = 16'h7f80;
      9'h0b9: out_r = 16'h7f80;
      9'h0ba: out_r = 16'h7f80;
      9'h0bb: out_r = 16'h7f80;
      9'h0bc: out_r = 16'h7f80;
      9'h0bd: out_r = 16'h7f80;
      9'h0be: out_r = 16'h7f80;
      9'h0bf: out_r = 16'h7f80;
      9'h0c0: out_r = 16'h7f80;
      9'h0c1: out_r = 16'h7f80;
      9'h0c2: out_r = 16'h7f80;
      9'h0c3: out_r = 16'h7f80;
      9'h0c4: out_r = 16'h7f80;
      9'h0c5: out_r = 16'h7f80;
      9'h0c6: out_r = 16'h7f80;
      9'h0c7: out_r = 16'h7f80;
      9'h0c8: out_r = 16'h7f80;
      9'h0c9: out_r = 16'h7f80;
      9'h0ca: out_r = 16'h7f80;
      9'h0cb: out_r = 16'h7f80;
      9'h0cc: out_r = 16'h7f80;
      9'h0cd: out_r = 16'h7f80;
      9'h0ce: out_r = 16'h7f80;
      9'h0cf: out_r = 16'h7f80;
      9'h0d0: out_r = 16'h7f80;
      9'h0d1: out_r = 16'h7f80;
      9'h0d2: out_r = 16'h7f80;
      9'h0d3: out_r = 16'h7f80;
      9'h0d4: out_r = 16'h7f80;
      9'h0d5: out_r = 16'h7f80;
      9'h0d6: out_r = 16'h7f80;
      9'h0d7: out_r = 16'h7f80;
      9'h0d8: out_r = 16'h7f80;
      9'h0d9: out_r = 16'h7f80;
      9'h0da: out_r = 16'h7f80;
      9'h0db: out_r = 16'h7f80;
      9'h0dc: out_r = 16'h7f80;
      9'h0dd: out_r = 16'h7f80;
      9'h0de: out_r = 16'h7f80;
      9'h0df: out_r = 16'h7f80;
      9'h0e0: out_r = 16'h7f80;
      9'h0e1: out_r = 16'h7f80;
      9'h0e2: out_r = 16'h7f80;
      9'h0e3: out_r = 16'h7f80;
      9'h0e4: out_r = 16'h7f80;
      9'h0e5: out_r = 16'h7f80;
      9'h0e6: out_r = 16'h7f80;
      9'h0e7: out_r = 16'h7f80;
      9'h0e8: out_r = 16'h7f80;
      9'h0e9: out_r = 16'h7f80;
      9'h0ea: out_r = 16'h7f80;
      9'h0eb: out_r = 16'h7f80;
      9'h0ec: out_r = 16'h7f80;
      9'h0ed: out_r = 16'h7f80;
      9'h0ee: out_r = 16'h7f80;
      9'h0ef: out_r = 16'h7f80;
      9'h0f0: out_r = 16'h7f80;
      9'h0f1: out_r = 16'h7f80;
      9'h0f2: out_r = 16'h7f80;
      9'h0f3: out_r = 16'h7f80;
      9'h0f4: out_r = 16'h7f80;
      9'h0f5: out_r = 16'h7f80;
      9'h0f6: out_r = 16'h7f80;
      9'h0f7: out_r = 16'h7f80;
      9'h0f8: out_r = 16'h7f80;
      9'h0f9: out_r = 16'h7f80;
      9'h0fa: out_r = 16'h7f80;
      9'h0fb: out_r = 16'h7f80;
      9'h0fc: out_r = 16'h7f80;
      9'h0fd: out_r = 16'h7f80;
      9'h0fe: out_r = 16'h7f80;
      9'h0ff: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo4)
              4'h0: out_r = in;
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
      9'h100: out_r = 16'h8000;
      9'h17b: begin
        case (mant_hi3)
          3'h6: begin
            out_r = 16'hbdea;
            case (mant_lo4)
              4'h0: out_r = in;
              4'h1: out_r = in;
              4'h2: out_r = in;
              4'h3: out_r = in;
              4'h4: out_r = in;
              4'h5: out_r = in;
              4'h6: out_r = in;
              4'h7: out_r = in;
              4'h8: out_r = in;
              4'ha: out_r = 16'hbdeb;
              4'hb: out_r = 16'hbdec;
              4'hc: out_r = 16'hbded;
              4'hd: out_r = 16'hbdee;
              4'he: out_r = 16'hbdef;
              4'hf: out_r = 16'hbdf0;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbdf1;
            case (mant_lo4)
              4'h1: out_r = 16'hbdf2;
              4'h2: out_r = 16'hbdf3;
              4'h3: out_r = 16'hbdf4;
              4'h4: out_r = 16'hbdf5;
              4'h5: out_r = 16'hbdf6;
              4'h6: out_r = 16'hbdf7;
              4'h7: out_r = 16'hbdf8;
              4'h8: out_r = 16'hbdf9;
              4'h9: out_r = 16'hbdfa;
              4'ha: out_r = 16'hbdfb;
              4'hb: out_r = 16'hbdfc;
              4'hc: out_r = 16'hbdfd;
              4'hd: out_r = 16'hbdfe;
              4'he: out_r = 16'hbdff;
              4'hf: out_r = 16'hbe00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi3)
          3'h1: begin
            out_r = 16'hbe14;
            case (mant_lo4)
              4'h0: out_r = in;
              4'h1: out_r = in;
              4'h2: out_r = in;
              4'h4: out_r = 16'hbe15;
              4'h5: out_r = 16'hbe16;
              4'h6: out_r = 16'hbe17;
              4'h7: out_r = 16'hbe18;
              4'h8: out_r = 16'hbe19;
              4'h9: out_r = 16'hbe1a;
              4'ha: out_r = 16'hbe1b;
              4'hb: out_r = 16'hbe1c;
              4'hc: out_r = 16'hbe1d;
              4'hd: out_r = 16'hbe1e;
              4'he: out_r = 16'hbe1f;
              4'hf: out_r = 16'hbe20;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbe21;
            case (mant_lo4)
              4'h1: out_r = 16'hbe22;
              4'h2: out_r = 16'hbe23;
              4'h3: out_r = 16'hbe24;
              4'h4: out_r = 16'hbe25;
              4'h5: out_r = 16'hbe26;
              4'h6: out_r = 16'hbe27;
              4'h7: out_r = 16'hbe28;
              4'h8: out_r = 16'hbe29;
              4'h9: out_r = 16'hbe2a;
              4'ha: out_r = 16'hbe2b;
              4'hb: out_r = 16'hbe2c;
              4'hc: out_r = 16'hbe2d;
              4'hd: out_r = 16'hbe2e;
              4'he: out_r = 16'hbe2f;
              4'hf: out_r = 16'hbe30;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbe31;
            case (mant_lo4)
              4'h1: out_r = 16'hbe32;
              4'h2: out_r = 16'hbe33;
              4'h3: out_r = 16'hbe34;
              4'h4: out_r = 16'hbe35;
              4'h5: out_r = 16'hbe36;
              4'h6: out_r = 16'hbe37;
              4'h7: out_r = 16'hbe38;
              4'h8: out_r = 16'hbe39;
              4'h9: out_r = 16'hbe3a;
              4'ha: out_r = 16'hbe3b;
              4'hb: out_r = 16'hbe3c;
              4'hc: out_r = 16'hbe3d;
              4'hd: out_r = 16'hbe3e;
              4'he: out_r = 16'hbe3f;
              4'hf: out_r = 16'hbe40;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbe41;
            case (mant_lo4)
              4'h1: out_r = 16'hbe42;
              4'h2: out_r = 16'hbe43;
              4'h3: out_r = 16'hbe44;
              4'h4: out_r = 16'hbe45;
              4'h5: out_r = 16'hbe46;
              4'h6: out_r = 16'hbe47;
              4'h7: out_r = 16'hbe48;
              4'h8: out_r = 16'hbe49;
              4'h9: out_r = 16'hbe4a;
              4'ha: out_r = 16'hbe4b;
              4'hb: out_r = 16'hbe4c;
              4'hc: out_r = 16'hbe4d;
              4'hd: out_r = 16'hbe4e;
              4'he: out_r = 16'hbe4f;
              4'hf: out_r = 16'hbe50;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbe51;
            case (mant_lo4)
              4'h1: out_r = 16'hbe52;
              4'h2: out_r = 16'hbe53;
              4'h3: out_r = 16'hbe54;
              4'h4: out_r = 16'hbe56;
              4'h5: out_r = 16'hbe57;
              4'h6: out_r = 16'hbe58;
              4'h7: out_r = 16'hbe59;
              4'h8: out_r = 16'hbe5a;
              4'h9: out_r = 16'hbe5b;
              4'ha: out_r = 16'hbe5c;
              4'hb: out_r = 16'hbe5d;
              4'hc: out_r = 16'hbe5e;
              4'hd: out_r = 16'hbe5f;
              4'he: out_r = 16'hbe60;
              4'hf: out_r = 16'hbe61;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbe62;
            case (mant_lo4)
              4'h1: out_r = 16'hbe63;
              4'h2: out_r = 16'hbe64;
              4'h3: out_r = 16'hbe65;
              4'h4: out_r = 16'hbe66;
              4'h5: out_r = 16'hbe67;
              4'h6: out_r = 16'hbe68;
              4'h7: out_r = 16'hbe69;
              4'h8: out_r = 16'hbe6a;
              4'h9: out_r = 16'hbe6b;
              4'ha: out_r = 16'hbe6c;
              4'hb: out_r = 16'hbe6d;
              4'hc: out_r = 16'hbe6e;
              4'hd: out_r = 16'hbe6f;
              4'he: out_r = 16'hbe70;
              4'hf: out_r = 16'hbe71;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbe80;
            case (mant_lo4)
              4'h0: out_r = 16'hbe72;
              4'h1: out_r = 16'hbe73;
              4'h2: out_r = 16'hbe74;
              4'h3: out_r = 16'hbe75;
              4'h4: out_r = 16'hbe76;
              4'h5: out_r = 16'hbe77;
              4'h6: out_r = 16'hbe78;
              4'h7: out_r = 16'hbe79;
              4'h8: out_r = 16'hbe7a;
              4'h9: out_r = 16'hbe7b;
              4'ha: out_r = 16'hbe7c;
              4'hb: out_r = 16'hbe7e;
              4'hc: out_r = 16'hbe7f;
              4'hf: out_r = 16'hbe81;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbe81;
            case (mant_lo4)
              4'h1: out_r = 16'hbe82;
              4'h2: out_r = 16'hbe83;
              4'h3: out_r = 16'hbe84;
              4'h4: out_r = 16'hbe85;
              4'h5: out_r = 16'hbe87;
              4'h6: out_r = 16'hbe88;
              4'h7: out_r = 16'hbe89;
              4'h8: out_r = 16'hbe8a;
              4'h9: out_r = 16'hbe8b;
              4'ha: out_r = 16'hbe8c;
              4'hb: out_r = 16'hbe8d;
              4'hc: out_r = 16'hbe8e;
              4'hd: out_r = 16'hbe8f;
              4'he: out_r = 16'hbe90;
              4'hf: out_r = 16'hbe91;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbe92;
            case (mant_lo4)
              4'h1: out_r = 16'hbe93;
              4'h2: out_r = 16'hbe94;
              4'h3: out_r = 16'hbe95;
              4'h4: out_r = 16'hbe96;
              4'h5: out_r = 16'hbe97;
              4'h6: out_r = 16'hbe98;
              4'h7: out_r = 16'hbe99;
              4'h8: out_r = 16'hbe9a;
              4'h9: out_r = 16'hbe9b;
              4'ha: out_r = 16'hbe9c;
              4'hb: out_r = 16'hbe9d;
              4'hc: out_r = 16'hbe9e;
              4'hd: out_r = 16'hbe9f;
              4'he: out_r = 16'hbea1;
              4'hf: out_r = 16'hbea2;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbea3;
            case (mant_lo4)
              4'h1: out_r = 16'hbea4;
              4'h2: out_r = 16'hbea5;
              4'h3: out_r = 16'hbea6;
              4'h4: out_r = 16'hbea7;
              4'h5: out_r = 16'hbea8;
              4'h6: out_r = 16'hbea9;
              4'h7: out_r = 16'hbeaa;
              4'h8: out_r = 16'hbeab;
              4'h9: out_r = 16'hbeac;
              4'ha: out_r = 16'hbead;
              4'hb: out_r = 16'hbeae;
              4'hc: out_r = 16'hbeaf;
              4'hd: out_r = 16'hbeb0;
              4'he: out_r = 16'hbeb1;
              4'hf: out_r = 16'hbeb2;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbeb3;
            case (mant_lo4)
              4'h1: out_r = 16'hbeb5;
              4'h2: out_r = 16'hbeb6;
              4'h3: out_r = 16'hbeb7;
              4'h4: out_r = 16'hbeb8;
              4'h5: out_r = 16'hbeb9;
              4'h6: out_r = 16'hbeba;
              4'h7: out_r = 16'hbebb;
              4'h8: out_r = 16'hbebc;
              4'h9: out_r = 16'hbebd;
              4'ha: out_r = 16'hbebe;
              4'hb: out_r = 16'hbebf;
              4'hc: out_r = 16'hbec0;
              4'hd: out_r = 16'hbec1;
              4'he: out_r = 16'hbec2;
              4'hf: out_r = 16'hbec3;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbec5;
            case (mant_lo4)
              4'h1: out_r = 16'hbec6;
              4'h2: out_r = 16'hbec7;
              4'h3: out_r = 16'hbec8;
              4'h4: out_r = 16'hbec9;
              4'h5: out_r = 16'hbeca;
              4'h6: out_r = 16'hbecb;
              4'h7: out_r = 16'hbecc;
              4'h8: out_r = 16'hbecd;
              4'h9: out_r = 16'hbece;
              4'ha: out_r = 16'hbecf;
              4'hb: out_r = 16'hbed0;
              4'hc: out_r = 16'hbed1;
              4'hd: out_r = 16'hbed3;
              4'he: out_r = 16'hbed4;
              4'hf: out_r = 16'hbed5;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbed6;
            case (mant_lo4)
              4'h1: out_r = 16'hbed7;
              4'h2: out_r = 16'hbed8;
              4'h3: out_r = 16'hbed9;
              4'h4: out_r = 16'hbeda;
              4'h5: out_r = 16'hbedb;
              4'h6: out_r = 16'hbedc;
              4'h7: out_r = 16'hbedd;
              4'h8: out_r = 16'hbede;
              4'h9: out_r = 16'hbee0;
              4'ha: out_r = 16'hbee1;
              4'hb: out_r = 16'hbee2;
              4'hc: out_r = 16'hbee3;
              4'hd: out_r = 16'hbee4;
              4'he: out_r = 16'hbee5;
              4'hf: out_r = 16'hbee6;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbee7;
            case (mant_lo4)
              4'h1: out_r = 16'hbee8;
              4'h2: out_r = 16'hbee9;
              4'h3: out_r = 16'hbeeb;
              4'h4: out_r = 16'hbeec;
              4'h5: out_r = 16'hbeed;
              4'h6: out_r = 16'hbeee;
              4'h7: out_r = 16'hbeef;
              4'h8: out_r = 16'hbef0;
              4'h9: out_r = 16'hbef1;
              4'ha: out_r = 16'hbef2;
              4'hb: out_r = 16'hbef3;
              4'hc: out_r = 16'hbef4;
              4'hd: out_r = 16'hbef6;
              4'he: out_r = 16'hbef7;
              4'hf: out_r = 16'hbef8;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbf00;
            case (mant_lo4)
              4'h0: out_r = 16'hbef9;
              4'h1: out_r = 16'hbefa;
              4'h2: out_r = 16'hbefb;
              4'h3: out_r = 16'hbefc;
              4'h4: out_r = 16'hbefd;
              4'h5: out_r = 16'hbefe;
              4'h8: out_r = 16'hbf01;
              4'h9: out_r = 16'hbf01;
              4'ha: out_r = 16'hbf02;
              4'hb: out_r = 16'hbf03;
              4'hc: out_r = 16'hbf03;
              4'hd: out_r = 16'hbf04;
              4'he: out_r = 16'hbf04;
              4'hf: out_r = 16'hbf05;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbf05;
            case (mant_lo4)
              4'h1: out_r = 16'hbf07;
              4'h2: out_r = 16'hbf08;
              4'h3: out_r = 16'hbf09;
              4'h4: out_r = 16'hbf0a;
              4'h5: out_r = 16'hbf0b;
              4'h6: out_r = 16'hbf0c;
              4'h7: out_r = 16'hbf0d;
              4'h8: out_r = 16'hbf0e;
              4'h9: out_r = 16'hbf10;
              4'ha: out_r = 16'hbf11;
              4'hb: out_r = 16'hbf12;
              4'hc: out_r = 16'hbf13;
              4'hd: out_r = 16'hbf14;
              4'he: out_r = 16'hbf15;
              4'hf: out_r = 16'hbf17;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbf18;
            case (mant_lo4)
              4'h1: out_r = 16'hbf19;
              4'h2: out_r = 16'hbf1a;
              4'h3: out_r = 16'hbf1b;
              4'h4: out_r = 16'hbf1c;
              4'h5: out_r = 16'hbf1e;
              4'h6: out_r = 16'hbf1f;
              4'h7: out_r = 16'hbf20;
              4'h8: out_r = 16'hbf21;
              4'h9: out_r = 16'hbf22;
              4'ha: out_r = 16'hbf23;
              4'hb: out_r = 16'hbf25;
              4'hc: out_r = 16'hbf26;
              4'hd: out_r = 16'hbf27;
              4'he: out_r = 16'hbf28;
              4'hf: out_r = 16'hbf29;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbf2b;
            case (mant_lo4)
              4'h1: out_r = 16'hbf2c;
              4'h2: out_r = 16'hbf2d;
              4'h3: out_r = 16'hbf2e;
              4'h4: out_r = 16'hbf2f;
              4'h5: out_r = 16'hbf31;
              4'h6: out_r = 16'hbf32;
              4'h7: out_r = 16'hbf33;
              4'h8: out_r = 16'hbf34;
              4'h9: out_r = 16'hbf36;
              4'ha: out_r = 16'hbf37;
              4'hb: out_r = 16'hbf38;
              4'hc: out_r = 16'hbf39;
              4'hd: out_r = 16'hbf3a;
              4'he: out_r = 16'hbf3c;
              4'hf: out_r = 16'hbf3d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbf3e;
            case (mant_lo4)
              4'h1: out_r = 16'hbf3f;
              4'h2: out_r = 16'hbf41;
              4'h3: out_r = 16'hbf42;
              4'h4: out_r = 16'hbf43;
              4'h5: out_r = 16'hbf44;
              4'h6: out_r = 16'hbf46;
              4'h7: out_r = 16'hbf47;
              4'h8: out_r = 16'hbf48;
              4'h9: out_r = 16'hbf4a;
              4'ha: out_r = 16'hbf4b;
              4'hb: out_r = 16'hbf4c;
              4'hc: out_r = 16'hbf4d;
              4'hd: out_r = 16'hbf4f;
              4'he: out_r = 16'hbf50;
              4'hf: out_r = 16'hbf51;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbf53;
            case (mant_lo4)
              4'h1: out_r = 16'hbf54;
              4'h2: out_r = 16'hbf55;
              4'h3: out_r = 16'hbf56;
              4'h4: out_r = 16'hbf58;
              4'h5: out_r = 16'hbf59;
              4'h6: out_r = 16'hbf5a;
              4'h7: out_r = 16'hbf5c;
              4'h8: out_r = 16'hbf5d;
              4'h9: out_r = 16'hbf5e;
              4'ha: out_r = 16'hbf60;
              4'hb: out_r = 16'hbf61;
              4'hc: out_r = 16'hbf62;
              4'hd: out_r = 16'hbf64;
              4'he: out_r = 16'hbf65;
              4'hf: out_r = 16'hbf66;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbf68;
            case (mant_lo4)
              4'h1: out_r = 16'hbf69;
              4'h2: out_r = 16'hbf6a;
              4'h3: out_r = 16'hbf6c;
              4'h4: out_r = 16'hbf6d;
              4'h5: out_r = 16'hbf6e;
              4'h6: out_r = 16'hbf70;
              4'h7: out_r = 16'hbf71;
              4'h8: out_r = 16'hbf73;
              4'h9: out_r = 16'hbf74;
              4'ha: out_r = 16'hbf75;
              4'hb: out_r = 16'hbf77;
              4'hc: out_r = 16'hbf78;
              4'hd: out_r = 16'hbf79;
              4'he: out_r = 16'hbf7b;
              4'hf: out_r = 16'hbf7c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbf82;
            case (mant_lo4)
              4'h0: out_r = 16'hbf7e;
              4'h1: out_r = 16'hbf7f;
              4'h2: out_r = 16'hbf80;
              4'h3: out_r = 16'hbf81;
              4'h6: out_r = 16'hbf83;
              4'h7: out_r = 16'hbf84;
              4'h8: out_r = 16'hbf85;
              4'h9: out_r = 16'hbf85;
              4'ha: out_r = 16'hbf86;
              4'hb: out_r = 16'hbf87;
              4'hc: out_r = 16'hbf87;
              4'hd: out_r = 16'hbf88;
              4'he: out_r = 16'hbf89;
              4'hf: out_r = 16'hbf8a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbf8d;
            case (mant_lo4)
              4'h0: out_r = 16'hbf8a;
              4'h1: out_r = 16'hbf8b;
              4'h2: out_r = 16'hbf8c;
              4'h5: out_r = 16'hbf8e;
              4'h6: out_r = 16'hbf8f;
              4'h7: out_r = 16'hbf90;
              4'h8: out_r = 16'hbf90;
              4'h9: out_r = 16'hbf91;
              4'ha: out_r = 16'hbf92;
              4'hb: out_r = 16'hbf93;
              4'hc: out_r = 16'hbf93;
              4'hd: out_r = 16'hbf94;
              4'he: out_r = 16'hbf95;
              4'hf: out_r = 16'hbf96;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbf96;
            case (mant_lo4)
              4'h1: out_r = 16'hbf98;
              4'h2: out_r = 16'hbf9a;
              4'h3: out_r = 16'hbf9b;
              4'h4: out_r = 16'hbf9d;
              4'h5: out_r = 16'hbf9e;
              4'h6: out_r = 16'hbfa0;
              4'h7: out_r = 16'hbfa1;
              4'h8: out_r = 16'hbfa3;
              4'h9: out_r = 16'hbfa5;
              4'ha: out_r = 16'hbfa6;
              4'hb: out_r = 16'hbfa8;
              4'hc: out_r = 16'hbfaa;
              4'hd: out_r = 16'hbfab;
              4'he: out_r = 16'hbfad;
              4'hf: out_r = 16'hbfaf;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbfb0;
            case (mant_lo4)
              4'h1: out_r = 16'hbfb2;
              4'h2: out_r = 16'hbfb4;
              4'h3: out_r = 16'hbfb6;
              4'h4: out_r = 16'hbfb7;
              4'h5: out_r = 16'hbfb9;
              4'h6: out_r = 16'hbfbb;
              4'h7: out_r = 16'hbfbd;
              4'h8: out_r = 16'hbfbe;
              4'h9: out_r = 16'hbfc0;
              4'ha: out_r = 16'hbfc2;
              4'hb: out_r = 16'hbfc4;
              4'hc: out_r = 16'hbfc6;
              4'hd: out_r = 16'hbfc7;
              4'he: out_r = 16'hbfc9;
              4'hf: out_r = 16'hbfcb;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbfcd;
            case (mant_lo4)
              4'h1: out_r = 16'hbfcf;
              4'h2: out_r = 16'hbfd1;
              4'h3: out_r = 16'hbfd3;
              4'h4: out_r = 16'hbfd5;
              4'h5: out_r = 16'hbfd7;
              4'h6: out_r = 16'hbfd9;
              4'h7: out_r = 16'hbfdb;
              4'h8: out_r = 16'hbfdd;
              4'h9: out_r = 16'hbfdf;
              4'ha: out_r = 16'hbfe1;
              4'hb: out_r = 16'hbfe3;
              4'hc: out_r = 16'hbfe5;
              4'hd: out_r = 16'hbfe7;
              4'he: out_r = 16'hbfe9;
              4'hf: out_r = 16'hbfeb;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbfed;
            case (mant_lo4)
              4'h1: out_r = 16'hbfef;
              4'h2: out_r = 16'hbff1;
              4'h3: out_r = 16'hbff3;
              4'h4: out_r = 16'hbff5;
              4'h5: out_r = 16'hbff8;
              4'h6: out_r = 16'hbffa;
              4'h7: out_r = 16'hbffc;
              4'h8: out_r = 16'hbffe;
              4'h9: out_r = 16'hc000;
              4'ha: out_r = 16'hc001;
              4'hb: out_r = 16'hc002;
              4'hc: out_r = 16'hc004;
              4'hd: out_r = 16'hc005;
              4'he: out_r = 16'hc006;
              4'hf: out_r = 16'hc007;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hc008;
            case (mant_lo4)
              4'h1: out_r = 16'hc009;
              4'h2: out_r = 16'hc00b;
              4'h3: out_r = 16'hc00c;
              4'h4: out_r = 16'hc00d;
              4'h5: out_r = 16'hc00e;
              4'h6: out_r = 16'hc00f;
              4'h7: out_r = 16'hc011;
              4'h8: out_r = 16'hc012;
              4'h9: out_r = 16'hc013;
              4'ha: out_r = 16'hc014;
              4'hb: out_r = 16'hc016;
              4'hc: out_r = 16'hc017;
              4'hd: out_r = 16'hc018;
              4'he: out_r = 16'hc01a;
              4'hf: out_r = 16'hc01b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hc01c;
            case (mant_lo4)
              4'h1: out_r = 16'hc01e;
              4'h2: out_r = 16'hc01f;
              4'h3: out_r = 16'hc020;
              4'h4: out_r = 16'hc022;
              4'h5: out_r = 16'hc023;
              4'h6: out_r = 16'hc024;
              4'h7: out_r = 16'hc026;
              4'h8: out_r = 16'hc027;
              4'h9: out_r = 16'hc028;
              4'ha: out_r = 16'hc02a;
              4'hb: out_r = 16'hc02b;
              4'hc: out_r = 16'hc02d;
              4'hd: out_r = 16'hc02e;
              4'he: out_r = 16'hc030;
              4'hf: out_r = 16'hc031;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hc033;
            case (mant_lo4)
              4'h1: out_r = 16'hc034;
              4'h2: out_r = 16'hc036;
              4'h3: out_r = 16'hc037;
              4'h4: out_r = 16'hc039;
              4'h5: out_r = 16'hc03a;
              4'h6: out_r = 16'hc03c;
              4'h7: out_r = 16'hc03d;
              4'h8: out_r = 16'hc03f;
              4'h9: out_r = 16'hc040;
              4'ha: out_r = 16'hc042;
              4'hb: out_r = 16'hc044;
              4'hc: out_r = 16'hc045;
              4'hd: out_r = 16'hc047;
              4'he: out_r = 16'hc048;
              4'hf: out_r = 16'hc04a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hc04c;
            case (mant_lo4)
              4'h1: out_r = 16'hc04d;
              4'h2: out_r = 16'hc04f;
              4'h3: out_r = 16'hc051;
              4'h4: out_r = 16'hc053;
              4'h5: out_r = 16'hc054;
              4'h6: out_r = 16'hc056;
              4'h7: out_r = 16'hc058;
              4'h8: out_r = 16'hc05a;
              4'h9: out_r = 16'hc05b;
              4'ha: out_r = 16'hc05d;
              4'hb: out_r = 16'hc05f;
              4'hc: out_r = 16'hc061;
              4'hd: out_r = 16'hc063;
              4'he: out_r = 16'hc064;
              4'hf: out_r = 16'hc066;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hc068;
            case (mant_lo4)
              4'h1: out_r = 16'hc06c;
              4'h2: out_r = 16'hc070;
              4'h3: out_r = 16'hc074;
              4'h4: out_r = 16'hc078;
              4'h5: out_r = 16'hc07c;
              4'h6: out_r = 16'hc080;
              4'h7: out_r = 16'hc082;
              4'h8: out_r = 16'hc084;
              4'h9: out_r = 16'hc086;
              4'ha: out_r = 16'hc088;
              4'hb: out_r = 16'hc08b;
              4'hc: out_r = 16'hc08d;
              4'hd: out_r = 16'hc08f;
              4'he: out_r = 16'hc091;
              4'hf: out_r = 16'hc094;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hc096;
            case (mant_lo4)
              4'h1: out_r = 16'hc099;
              4'h2: out_r = 16'hc09b;
              4'h3: out_r = 16'hc09d;
              4'h4: out_r = 16'hc0a0;
              4'h5: out_r = 16'hc0a3;
              4'h6: out_r = 16'hc0a5;
              4'h7: out_r = 16'hc0a8;
              4'h8: out_r = 16'hc0ab;
              4'h9: out_r = 16'hc0ad;
              4'ha: out_r = 16'hc0b0;
              4'hb: out_r = 16'hc0b3;
              4'hc: out_r = 16'hc0b6;
              4'hd: out_r = 16'hc0b9;
              4'he: out_r = 16'hc0bc;
              4'hf: out_r = 16'hc0bf;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hc0c2;
            case (mant_lo4)
              4'h1: out_r = 16'hc0c5;
              4'h2: out_r = 16'hc0c8;
              4'h3: out_r = 16'hc0cb;
              4'h4: out_r = 16'hc0ce;
              4'h5: out_r = 16'hc0d2;
              4'h6: out_r = 16'hc0d5;
              4'h7: out_r = 16'hc0d8;
              4'h8: out_r = 16'hc0dc;
              4'h9: out_r = 16'hc0df;
              4'ha: out_r = 16'hc0e3;
              4'hb: out_r = 16'hc0e6;
              4'hc: out_r = 16'hc0ea;
              4'hd: out_r = 16'hc0ee;
              4'he: out_r = 16'hc0f2;
              4'hf: out_r = 16'hc0f5;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hc0f9;
            case (mant_lo4)
              4'h1: out_r = 16'hc0fd;
              4'h2: out_r = 16'hc101;
              4'h3: out_r = 16'hc103;
              4'h4: out_r = 16'hc105;
              4'h5: out_r = 16'hc107;
              4'h6: out_r = 16'hc109;
              4'h7: out_r = 16'hc10b;
              4'h8: out_r = 16'hc10d;
              4'h9: out_r = 16'hc110;
              4'ha: out_r = 16'hc112;
              4'hb: out_r = 16'hc114;
              4'hc: out_r = 16'hc117;
              4'hd: out_r = 16'hc119;
              4'he: out_r = 16'hc11b;
              4'hf: out_r = 16'hc11e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hc120;
            case (mant_lo4)
              4'h1: out_r = 16'hc123;
              4'h2: out_r = 16'hc125;
              4'h3: out_r = 16'hc128;
              4'h4: out_r = 16'hc12b;
              4'h5: out_r = 16'hc12d;
              4'h6: out_r = 16'hc130;
              4'h7: out_r = 16'hc133;
              4'h8: out_r = 16'hc136;
              4'h9: out_r = 16'hc139;
              4'ha: out_r = 16'hc13c;
              4'hb: out_r = 16'hc13e;
              4'hc: out_r = 16'hc141;
              4'hd: out_r = 16'hc145;
              4'he: out_r = 16'hc148;
              4'hf: out_r = 16'hc14b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hc14e;
            case (mant_lo4)
              4'h1: out_r = 16'hc151;
              4'h2: out_r = 16'hc155;
              4'h3: out_r = 16'hc158;
              4'h4: out_r = 16'hc15b;
              4'h5: out_r = 16'hc15f;
              4'h6: out_r = 16'hc162;
              4'h7: out_r = 16'hc166;
              4'h8: out_r = 16'hc16a;
              4'h9: out_r = 16'hc16d;
              4'ha: out_r = 16'hc171;
              4'hb: out_r = 16'hc175;
              4'hc: out_r = 16'hc179;
              4'hd: out_r = 16'hc17d;
              4'he: out_r = 16'hc180;
              4'hf: out_r = 16'hc182;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hc184;
            case (mant_lo4)
              4'h1: out_r = 16'hc186;
              4'h2: out_r = 16'hc189;
              4'h3: out_r = 16'hc18b;
              4'h4: out_r = 16'hc18d;
              4'h5: out_r = 16'hc18f;
              4'h6: out_r = 16'hc191;
              4'h7: out_r = 16'hc194;
              4'h8: out_r = 16'hc196;
              4'h9: out_r = 16'hc198;
              4'ha: out_r = 16'hc19b;
              4'hb: out_r = 16'hc19d;
              4'hc: out_r = 16'hc1a0;
              4'hd: out_r = 16'hc1a2;
              4'he: out_r = 16'hc1a5;
              4'hf: out_r = 16'hc1a7;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hc1aa;
            case (mant_lo4)
              4'h1: out_r = 16'hc1ad;
              4'h2: out_r = 16'hc1af;
              4'h3: out_r = 16'hc1b2;
              4'h4: out_r = 16'hc1b5;
              4'h5: out_r = 16'hc1b8;
              4'h6: out_r = 16'hc1bb;
              4'h7: out_r = 16'hc1be;
              4'h8: out_r = 16'hc1c1;
              4'h9: out_r = 16'hc1c4;
              4'ha: out_r = 16'hc1c7;
              4'hb: out_r = 16'hc1ca;
              4'hc: out_r = 16'hc1cd;
              4'hd: out_r = 16'hc1d0;
              4'he: out_r = 16'hc1d4;
              4'hf: out_r = 16'hc1d7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hc1da;
            case (mant_lo4)
              4'h1: out_r = 16'hc1e1;
              4'h2: out_r = 16'hc1e8;
              4'h3: out_r = 16'hc1f0;
              4'h4: out_r = 16'hc1f7;
              4'h5: out_r = 16'hc1ff;
              4'h6: out_r = 16'hc204;
              4'h7: out_r = 16'hc208;
              4'h8: out_r = 16'hc20c;
              4'h9: out_r = 16'hc211;
              4'ha: out_r = 16'hc215;
              4'hb: out_r = 16'hc21a;
              4'hc: out_r = 16'hc21f;
              4'hd: out_r = 16'hc224;
              4'he: out_r = 16'hc229;
              4'hf: out_r = 16'hc22e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hc234;
            case (mant_lo4)
              4'h1: out_r = 16'hc23a;
              4'h2: out_r = 16'hc240;
              4'h3: out_r = 16'hc246;
              4'h4: out_r = 16'hc24c;
              4'h5: out_r = 16'hc252;
              4'h6: out_r = 16'hc259;
              4'h7: out_r = 16'hc260;
              4'h8: out_r = 16'hc267;
              4'h9: out_r = 16'hc26e;
              4'ha: out_r = 16'hc276;
              4'hb: out_r = 16'hc27e;
              4'hc: out_r = 16'hc283;
              4'hd: out_r = 16'hc287;
              4'he: out_r = 16'hc28b;
              4'hf: out_r = 16'hc290;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hc294;
            case (mant_lo4)
              4'h1: out_r = 16'hc299;
              4'h2: out_r = 16'hc29e;
              4'h3: out_r = 16'hc2a3;
              4'h4: out_r = 16'hc2a8;
              4'h5: out_r = 16'hc2ae;
              4'h6: out_r = 16'hc2b3;
              4'h7: out_r = 16'hc2b9;
              4'h8: out_r = 16'hc2bf;
              4'h9: out_r = 16'hc2c5;
              4'ha: out_r = 16'hc2cb;
              4'hb: out_r = 16'hc2d1;
              4'hc: out_r = 16'hc2d8;
              4'hd: out_r = 16'hc2df;
              4'he: out_r = 16'hc2e6;
              4'hf: out_r = 16'hc2ed;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hc2f5;
            case (mant_lo4)
              4'h1: out_r = 16'hc2fc;
              4'h2: out_r = 16'hc302;
              4'h3: out_r = 16'hc306;
              4'h4: out_r = 16'hc30b;
              4'h5: out_r = 16'hc30f;
              4'h6: out_r = 16'hc314;
              4'h7: out_r = 16'hc318;
              4'h8: out_r = 16'hc31d;
              4'h9: out_r = 16'hc322;
              4'ha: out_r = 16'hc327;
              4'hb: out_r = 16'hc32d;
              4'hc: out_r = 16'hc332;
              4'hd: out_r = 16'hc338;
              4'he: out_r = 16'hc33d;
              4'hf: out_r = 16'hc344;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hc34a;
            case (mant_lo4)
              4'h1: out_r = 16'hc350;
              4'h2: out_r = 16'hc357;
              4'h3: out_r = 16'hc35e;
              4'h4: out_r = 16'hc365;
              4'h5: out_r = 16'hc36c;
              4'h6: out_r = 16'hc373;
              4'h7: out_r = 16'hc37b;
              4'h8: out_r = 16'hc382;
              4'h9: out_r = 16'hc386;
              4'ha: out_r = 16'hc38a;
              4'hb: out_r = 16'hc38e;
              4'hc: out_r = 16'hc393;
              4'hd: out_r = 16'hc397;
              4'he: out_r = 16'hc39c;
              4'hf: out_r = 16'hc3a1;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hc3a6;
            case (mant_lo4)
              4'h1: out_r = 16'hc3ac;
              4'h2: out_r = 16'hc3b1;
              4'h3: out_r = 16'hc3b7;
              4'h4: out_r = 16'hc3bc;
              4'h5: out_r = 16'hc3c2;
              4'h6: out_r = 16'hc3c9;
              4'h7: out_r = 16'hc3cf;
              4'h8: out_r = 16'hc3d6;
              4'h9: out_r = 16'hc3dc;
              4'ha: out_r = 16'hc3e3;
              4'hb: out_r = 16'hc3ea;
              4'hc: out_r = 16'hc3f2;
              4'hd: out_r = 16'hc3fa;
              4'he: out_r = 16'hc401;
              4'hf: out_r = 16'hc405;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hc409;
            case (mant_lo4)
              4'h1: out_r = 16'hc40d;
              4'h2: out_r = 16'hc412;
              4'h3: out_r = 16'hc417;
              4'h4: out_r = 16'hc41b;
              4'h5: out_r = 16'hc420;
              4'h6: out_r = 16'hc425;
              4'h7: out_r = 16'hc42b;
              4'h8: out_r = 16'hc430;
              4'h9: out_r = 16'hc436;
              4'ha: out_r = 16'hc43b;
              4'hb: out_r = 16'hc441;
              4'hc: out_r = 16'hc447;
              4'hd: out_r = 16'hc44e;
              4'he: out_r = 16'hc454;
              4'hf: out_r = 16'hc45b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hc462;
            case (mant_lo4)
              4'h1: out_r = 16'hc469;
              4'h2: out_r = 16'hc471;
              4'h3: out_r = 16'hc478;
              4'h4: out_r = 16'hc480;
              4'h5: out_r = 16'hc484;
              4'h6: out_r = 16'hc488;
              4'h7: out_r = 16'hc48d;
              4'h8: out_r = 16'hc491;
              4'h9: out_r = 16'hc496;
              4'ha: out_r = 16'hc49a;
              4'hb: out_r = 16'hc49f;
              4'hc: out_r = 16'hc4a4;
              4'hd: out_r = 16'hc4aa;
              4'he: out_r = 16'hc4af;
              4'hf: out_r = 16'hc4b5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hc4ba;
            case (mant_lo4)
              4'h1: out_r = 16'hc4c6;
              4'h2: out_r = 16'hc4d3;
              4'h3: out_r = 16'hc4e1;
              4'h4: out_r = 16'hc4ef;
              4'h5: out_r = 16'hc4ff;
              4'h6: out_r = 16'hc508;
              4'h7: out_r = 16'hc510;
              4'h8: out_r = 16'hc51a;
              4'h9: out_r = 16'hc523;
              4'ha: out_r = 16'hc52e;
              4'hb: out_r = 16'hc539;
              4'hc: out_r = 16'hc545;
              4'hd: out_r = 16'hc552;
              4'he: out_r = 16'hc55f;
              4'hf: out_r = 16'hc56e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hc57d;
            case (mant_lo4)
              4'h1: out_r = 16'hc587;
              4'h2: out_r = 16'hc58f;
              4'h3: out_r = 16'hc599;
              4'h4: out_r = 16'hc5a3;
              4'h5: out_r = 16'hc5ad;
              4'h6: out_r = 16'hc5b8;
              4'h7: out_r = 16'hc5c4;
              4'h8: out_r = 16'hc5d1;
              4'h9: out_r = 16'hc5de;
              4'ha: out_r = 16'hc5ed;
              4'hb: out_r = 16'hc5fc;
              4'hc: out_r = 16'hc606;
              4'hd: out_r = 16'hc60f;
              4'he: out_r = 16'hc618;
              4'hf: out_r = 16'hc622;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hc62c;
            case (mant_lo4)
              4'h1: out_r = 16'hc637;
              4'h2: out_r = 16'hc643;
              4'h3: out_r = 16'hc650;
              4'h4: out_r = 16'hc65d;
              4'h5: out_r = 16'hc66b;
              4'h6: out_r = 16'hc67a;
              4'h7: out_r = 16'hc685;
              4'h8: out_r = 16'hc68e;
              4'h9: out_r = 16'hc697;
              4'ha: out_r = 16'hc6a1;
              4'hb: out_r = 16'hc6ab;
              4'hc: out_r = 16'hc6b6;
              4'hd: out_r = 16'hc6c2;
              4'he: out_r = 16'hc6ce;
              4'hf: out_r = 16'hc6dc;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hc6ea;
            case (mant_lo4)
              4'h1: out_r = 16'hc6f9;
              4'h2: out_r = 16'hc705;
              4'h3: out_r = 16'hc70d;
              4'h4: out_r = 16'hc716;
              4'h5: out_r = 16'hc720;
              4'h6: out_r = 16'hc72a;
              4'h7: out_r = 16'hc735;
              4'h8: out_r = 16'hc741;
              4'h9: out_r = 16'hc74d;
              4'ha: out_r = 16'hc75a;
              4'hb: out_r = 16'hc769;
              4'hc: out_r = 16'hc778;
              4'hd: out_r = 16'hc784;
              4'he: out_r = 16'hc78c;
              4'hf: out_r = 16'hc795;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hc79f;
            case (mant_lo4)
              4'h1: out_r = 16'hc7a9;
              4'h2: out_r = 16'hc7b4;
              4'h3: out_r = 16'hc7c0;
              4'h4: out_r = 16'hc7cc;
              4'h5: out_r = 16'hc7d9;
              4'h6: out_r = 16'hc7e7;
              4'h7: out_r = 16'hc7f6;
              4'h8: out_r = 16'hc803;
              4'h9: out_r = 16'hc80b;
              4'ha: out_r = 16'hc814;
              4'hb: out_r = 16'hc81e;
              4'hc: out_r = 16'hc828;
              4'hd: out_r = 16'hc833;
              4'he: out_r = 16'hc83f;
              4'hf: out_r = 16'hc84b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hc858;
            case (mant_lo4)
              4'h1: out_r = 16'hc866;
              4'h2: out_r = 16'hc875;
              4'h3: out_r = 16'hc882;
              4'h4: out_r = 16'hc88b;
              4'h5: out_r = 16'hc894;
              4'h6: out_r = 16'hc89d;
              4'h7: out_r = 16'hc8a7;
              4'h8: out_r = 16'hc8b2;
              4'h9: out_r = 16'hc8be;
              4'ha: out_r = 16'hc8ca;
              4'hb: out_r = 16'hc8d7;
              4'hc: out_r = 16'hc8e5;
              4'hd: out_r = 16'hc8f3;
              4'he: out_r = 16'hc902;
              4'hf: out_r = 16'hc90a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hc913;
            case (mant_lo4)
              4'h1: out_r = 16'hc91c;
              4'h2: out_r = 16'hc926;
              4'h3: out_r = 16'hc931;
              4'h4: out_r = 16'hc93c;
              4'h5: out_r = 16'hc949;
              4'h6: out_r = 16'hc956;
              4'h7: out_r = 16'hc963;
              4'h8: out_r = 16'hc972;
              4'h9: out_r = 16'hc981;
              4'ha: out_r = 16'hc989;
              4'hb: out_r = 16'hc992;
              4'hc: out_r = 16'hc99b;
              4'hd: out_r = 16'hc9a5;
              4'he: out_r = 16'hc9b0;
              4'hf: out_r = 16'hc9bb;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hc9c8;
            case (mant_lo4)
              4'h1: out_r = 16'hc9d4;
              4'h2: out_r = 16'hc9e2;
              4'h3: out_r = 16'hc9f1;
              4'h4: out_r = 16'hca00;
              4'h5: out_r = 16'hca08;
              4'h6: out_r = 16'hca11;
              4'h7: out_r = 16'hca1b;
              4'h8: out_r = 16'hca24;
              4'h9: out_r = 16'hca2f;
              4'ha: out_r = 16'hca3a;
              4'hb: out_r = 16'hca46;
              4'hc: out_r = 16'hca53;
              4'hd: out_r = 16'hca61;
              4'he: out_r = 16'hca6f;
              4'hf: out_r = 16'hca7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hca88;
            case (mant_lo4)
              4'h1: out_r = 16'hca9a;
              4'h2: out_r = 16'hcaae;
              4'h3: out_r = 16'hcac5;
              4'h4: out_r = 16'hcae0;
              4'h5: out_r = 16'hcafd;
              4'h6: out_r = 16'hcb10;
              4'h7: out_r = 16'hcb23;
              4'h8: out_r = 16'hcb38;
              4'h9: out_r = 16'hcb51;
              4'ha: out_r = 16'hcb6d;
              4'hb: out_r = 16'hcb86;
              4'hc: out_r = 16'hcb98;
              4'hd: out_r = 16'hcbac;
              4'he: out_r = 16'hcbc3;
              4'hf: out_r = 16'hcbdd;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hcbfa;
            case (mant_lo4)
              4'h1: out_r = 16'hcc0e;
              4'h2: out_r = 16'hcc21;
              4'h3: out_r = 16'hcc36;
              4'h4: out_r = 16'hcc4e;
              4'h5: out_r = 16'hcc6a;
              4'h6: out_r = 16'hcc85;
              4'h7: out_r = 16'hcc96;
              4'h8: out_r = 16'hccaa;
              4'h9: out_r = 16'hccc1;
              4'ha: out_r = 16'hccdb;
              4'hb: out_r = 16'hccf8;
              4'hc: out_r = 16'hcd0c;
              4'hd: out_r = 16'hcd1f;
              4'he: out_r = 16'hcd34;
              4'hf: out_r = 16'hcd4c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hcd67;
            case (mant_lo4)
              4'h1: out_r = 16'hcd83;
              4'h2: out_r = 16'hcd95;
              4'h3: out_r = 16'hcda8;
              4'h4: out_r = 16'hcdbf;
              4'h5: out_r = 16'hcdd8;
              4'h6: out_r = 16'hcdf5;
              4'h7: out_r = 16'hce0b;
              4'h8: out_r = 16'hce1d;
              4'h9: out_r = 16'hce32;
              4'ha: out_r = 16'hce4a;
              4'hb: out_r = 16'hce65;
              4'hc: out_r = 16'hce82;
              4'hd: out_r = 16'hce93;
              4'he: out_r = 16'hcea6;
              4'hf: out_r = 16'hcebd;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hced6;
            case (mant_lo4)
              4'h1: out_r = 16'hcef2;
              4'h2: out_r = 16'hcf09;
              4'h3: out_r = 16'hcf1b;
              4'h4: out_r = 16'hcf30;
              4'h5: out_r = 16'hcf48;
              4'h6: out_r = 16'hcf62;
              4'h7: out_r = 16'hcf80;
              4'h8: out_r = 16'hcf91;
              4'h9: out_r = 16'hcfa5;
              4'ha: out_r = 16'hcfba;
              4'hb: out_r = 16'hcfd3;
              4'hc: out_r = 16'hcfef;
              4'hd: out_r = 16'hd008;
              4'he: out_r = 16'hd01a;
              4'hf: out_r = 16'hd02e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hd045;
            case (mant_lo4)
              4'h1: out_r = 16'hd060;
              4'h2: out_r = 16'hd07d;
              4'h3: out_r = 16'hd090;
              4'h4: out_r = 16'hd0a3;
              4'h5: out_r = 16'hd0b8;
              4'h6: out_r = 16'hd0d1;
              4'h7: out_r = 16'hd0ed;
              4'h8: out_r = 16'hd106;
              4'h9: out_r = 16'hd118;
              4'ha: out_r = 16'hd12c;
              4'hb: out_r = 16'hd143;
              4'hc: out_r = 16'hd15d;
              4'hd: out_r = 16'hd17b;
              4'he: out_r = 16'hd18e;
              4'hf: out_r = 16'hd1a1;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hd1b6;
            case (mant_lo4)
              4'h1: out_r = 16'hd1cf;
              4'h2: out_r = 16'hd1ea;
              4'h3: out_r = 16'hd205;
              4'h4: out_r = 16'hd216;
              4'h5: out_r = 16'hd22a;
              4'h6: out_r = 16'hd241;
              4'h7: out_r = 16'hd25b;
              4'h8: out_r = 16'hd278;
              4'h9: out_r = 16'hd28c;
              4'ha: out_r = 16'hd29f;
              4'hb: out_r = 16'hd2b4;
              4'hc: out_r = 16'hd2cc;
              4'hd: out_r = 16'hd2e7;
              4'he: out_r = 16'hd303;
              4'hf: out_r = 16'hd315;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hd328;
            case (mant_lo4)
              4'h1: out_r = 16'hd33f;
              4'h2: out_r = 16'hd358;
              4'h3: out_r = 16'hd375;
              4'h4: out_r = 16'hd38b;
              4'h5: out_r = 16'hd39d;
              4'h6: out_r = 16'hd3b2;
              4'h7: out_r = 16'hd3ca;
              4'h8: out_r = 16'hd3e5;
              4'h9: out_r = 16'hd402;
              4'ha: out_r = 16'hd413;
              4'hb: out_r = 16'hd426;
              4'hc: out_r = 16'hd43d;
              4'hd: out_r = 16'hd456;
              4'he: out_r = 16'hd472;
              4'hf: out_r = 16'hd489;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hd49c;
            case (mant_lo4)
              4'h1: out_r = 16'hd4b0;
              4'h2: out_r = 16'hd4c8;
              4'h3: out_r = 16'hd4e2;
              4'h4: out_r = 16'hd500;
              4'h5: out_r = 16'hd511;
              4'h6: out_r = 16'hd525;
              4'h7: out_r = 16'hd53b;
              4'h8: out_r = 16'hd553;
              4'h9: out_r = 16'hd570;
              4'ha: out_r = 16'hd588;
              4'hb: out_r = 16'hd59a;
              4'hc: out_r = 16'hd5ae;
              4'hd: out_r = 16'hd5c5;
              4'he: out_r = 16'hd5e0;
              4'hf: out_r = 16'hd5fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hd610;
            case (mant_lo4)
              4'h1: out_r = 16'hd638;
              4'h2: out_r = 16'hd66d;
              4'h3: out_r = 16'hd698;
              4'h4: out_r = 16'hd6c3;
              4'h5: out_r = 16'hd6fb;
              4'h6: out_r = 16'hd721;
              4'h7: out_r = 16'hd74f;
              4'h8: out_r = 16'hd785;
              4'h9: out_r = 16'hd7aa;
              4'ha: out_r = 16'hd7db;
              4'hb: out_r = 16'hd80c;
              4'hc: out_r = 16'hd834;
              4'hd: out_r = 16'hd868;
              4'he: out_r = 16'hd895;
              4'hf: out_r = 16'hd8bf;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hd8f5;
            case (mant_lo4)
              4'h1: out_r = 16'hd91d;
              4'h2: out_r = 16'hd94a;
              4'h3: out_r = 16'hd982;
              4'h4: out_r = 16'hd9a7;
              4'h5: out_r = 16'hd9d6;
              4'h6: out_r = 16'hda09;
              4'h7: out_r = 16'hda30;
              4'h8: out_r = 16'hda62;
              4'h9: out_r = 16'hda91;
              4'ha: out_r = 16'hdabb;
              4'hb: out_r = 16'hdaf0;
              4'hc: out_r = 16'hdb1a;
              4'hd: out_r = 16'hdb46;
              4'he: out_r = 16'hdb7e;
              4'hf: out_r = 16'hdba3;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hdbd1;
            case (mant_lo4)
              4'h1: out_r = 16'hdc06;
              4'h2: out_r = 16'hdc2c;
              4'h3: out_r = 16'hdc5d;
              4'h4: out_r = 16'hdc8e;
              4'h5: out_r = 16'hdcb6;
              4'h6: out_r = 16'hdcea;
              4'h7: out_r = 16'hdd16;
              4'h8: out_r = 16'hdd41;
              4'h9: out_r = 16'hdd78;
              4'ha: out_r = 16'hdd9f;
              4'hb: out_r = 16'hddcc;
              4'hc: out_r = 16'hde03;
              4'hd: out_r = 16'hde28;
              4'he: out_r = 16'hde58;
              4'hf: out_r = 16'hde8b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hdeb2;
            case (mant_lo4)
              4'h1: out_r = 16'hdee5;
              4'h2: out_r = 16'hdf13;
              4'h3: out_r = 16'hdf3d;
              4'h4: out_r = 16'hdf72;
              4'h5: out_r = 16'hdf9c;
              4'h6: out_r = 16'hdfc8;
              4'h7: out_r = 16'he000;
              4'h8: out_r = 16'he025;
              4'h9: out_r = 16'he054;
              4'ha: out_r = 16'he088;
              4'hb: out_r = 16'he0ae;
              4'hc: out_r = 16'he0e0;
              4'hd: out_r = 16'he110;
              4'he: out_r = 16'he139;
              4'hf: out_r = 16'he16d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'he198;
            case (mant_lo4)
              4'h1: out_r = 16'he1c3;
              4'h2: out_r = 16'he1fb;
              4'h3: out_r = 16'he221;
              4'h4: out_r = 16'he24f;
              4'h5: out_r = 16'he285;
              4'h6: out_r = 16'he2aa;
              4'h7: out_r = 16'he2db;
              4'h8: out_r = 16'he30d;
              4'h9: out_r = 16'he334;
              4'ha: out_r = 16'he368;
              4'hb: out_r = 16'he395;
              4'hc: out_r = 16'he3bf;
              4'hd: out_r = 16'he3f5;
              4'he: out_r = 16'he41d;
              4'hf: out_r = 16'he44a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'he482;
            case (mant_lo4)
              4'h1: out_r = 16'he4a7;
              4'h2: out_r = 16'he4d6;
              4'h3: out_r = 16'he509;
              4'h4: out_r = 16'he530;
              4'h5: out_r = 16'he563;
              4'h6: out_r = 16'he591;
              4'h7: out_r = 16'he5bb;
              4'h8: out_r = 16'he5f0;
              4'h9: out_r = 16'he61a;
              4'ha: out_r = 16'he646;
              4'hb: out_r = 16'he67e;
              4'hc: out_r = 16'he6a3;
              4'hd: out_r = 16'he6d1;
              4'he: out_r = 16'he706;
              4'hf: out_r = 16'he72c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'he75d;
            case (mant_lo4)
              4'h1: out_r = 16'he78e;
              4'h2: out_r = 16'he7b7;
              4'h3: out_r = 16'he7ea;
              4'h4: out_r = 16'he816;
              4'h5: out_r = 16'he841;
              4'h6: out_r = 16'he878;
              4'h7: out_r = 16'he89f;
              4'h8: out_r = 16'he8cd;
              4'h9: out_r = 16'he903;
              4'ha: out_r = 16'he929;
              4'hb: out_r = 16'he959;
              4'hc: out_r = 16'he98b;
              4'hd: out_r = 16'he9b2;
              4'he: out_r = 16'he9e5;
              4'hf: out_r = 16'hea13;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hea3d;
            case (mant_lo4)
              4'h1: out_r = 16'hea73;
              4'h2: out_r = 16'hea9c;
              4'h3: out_r = 16'heac8;
              4'h4: out_r = 16'heb00;
              4'h5: out_r = 16'heb25;
              4'h6: out_r = 16'heb54;
              4'h7: out_r = 16'heb88;
              4'h8: out_r = 16'hebaf;
              4'h9: out_r = 16'hebe0;
              4'ha: out_r = 16'hec10;
              4'hb: out_r = 16'hec39;
              4'hc: out_r = 16'hec6d;
              4'hd: out_r = 16'hec98;
              4'he: out_r = 16'hecc4;
              4'hf: out_r = 16'hecfb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hed21;
            case (mant_lo4)
              4'h1: out_r = 16'hed85;
              4'h2: out_r = 16'heddb;
              4'h3: out_r = 16'hee35;
              4'h4: out_r = 16'hee95;
              4'h5: out_r = 16'heef5;
              4'h6: out_r = 16'hef4a;
              4'h7: out_r = 16'hefa7;
              4'h8: out_r = 16'hf009;
              4'h9: out_r = 16'hf063;
              4'ha: out_r = 16'hf0bb;
              4'hb: out_r = 16'hf11a;
              4'hc: out_r = 16'hf17e;
              4'hd: out_r = 16'hf1d1;
              4'he: out_r = 16'hf22d;
              4'hf: out_r = 16'hf28e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hf2eb;
            case (mant_lo4)
              4'h1: out_r = 16'hf341;
              4'h2: out_r = 16'hf39f;
              4'h3: out_r = 16'hf403;
              4'h4: out_r = 16'hf459;
              4'h5: out_r = 16'hf4b3;
              4'h6: out_r = 16'hf513;
              4'h7: out_r = 16'hf573;
              4'h8: out_r = 16'hf5c8;
              4'h9: out_r = 16'hf625;
              4'ha: out_r = 16'hf688;
              4'hb: out_r = 16'hf6e0;
              4'hc: out_r = 16'hf739;
              4'hd: out_r = 16'hf798;
              4'he: out_r = 16'hf7fb;
              4'hf: out_r = 16'hf84f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hf8ab;
            case (mant_lo4)
              4'h1: out_r = 16'hf90d;
              4'h2: out_r = 16'hf968;
              4'h3: out_r = 16'hf9bf;
              4'h4: out_r = 16'hfa1e;
              4'h5: out_r = 16'hfa82;
              4'h6: out_r = 16'hfad6;
              4'h7: out_r = 16'hfb31;
              4'h8: out_r = 16'hfb92;
              4'h9: out_r = 16'hfbf0;
              4'ha: out_r = 16'hfc46;
              4'hb: out_r = 16'hfca3;
              4'hc: out_r = 16'hfd07;
              4'hd: out_r = 16'hfd5e;
              4'he: out_r = 16'hfdb7;
              4'hf: out_r = 16'hfe17;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hff80;
            case (mant_lo4)
              4'h0: out_r = 16'hfe79;
              4'h1: out_r = 16'hfecd;
              4'h2: out_r = 16'hff29;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hff80;
          end
          3'h5: begin
            out_r = 16'hff80;
          end
          3'h6: begin
            out_r = 16'hff80;
          end
          3'h7: begin
            out_r = 16'hff80;
          end
          default: begin end
        endcase
      end
      9'h186: out_r = 16'hff80;
      9'h187: out_r = 16'hff80;
      9'h188: out_r = 16'hff80;
      9'h189: out_r = 16'hff80;
      9'h18a: out_r = 16'hff80;
      9'h18b: out_r = 16'hff80;
      9'h18c: out_r = 16'hff80;
      9'h18d: out_r = 16'hff80;
      9'h18e: out_r = 16'hff80;
      9'h18f: out_r = 16'hff80;
      9'h190: out_r = 16'hff80;
      9'h191: out_r = 16'hff80;
      9'h192: out_r = 16'hff80;
      9'h193: out_r = 16'hff80;
      9'h194: out_r = 16'hff80;
      9'h195: out_r = 16'hff80;
      9'h196: out_r = 16'hff80;
      9'h197: out_r = 16'hff80;
      9'h198: out_r = 16'hff80;
      9'h199: out_r = 16'hff80;
      9'h19a: out_r = 16'hff80;
      9'h19b: out_r = 16'hff80;
      9'h19c: out_r = 16'hff80;
      9'h19d: out_r = 16'hff80;
      9'h19e: out_r = 16'hff80;
      9'h19f: out_r = 16'hff80;
      9'h1a0: out_r = 16'hff80;
      9'h1a1: out_r = 16'hff80;
      9'h1a2: out_r = 16'hff80;
      9'h1a3: out_r = 16'hff80;
      9'h1a4: out_r = 16'hff80;
      9'h1a5: out_r = 16'hff80;
      9'h1a6: out_r = 16'hff80;
      9'h1a7: out_r = 16'hff80;
      9'h1a8: out_r = 16'hff80;
      9'h1a9: out_r = 16'hff80;
      9'h1aa: out_r = 16'hff80;
      9'h1ab: out_r = 16'hff80;
      9'h1ac: out_r = 16'hff80;
      9'h1ad: out_r = 16'hff80;
      9'h1ae: out_r = 16'hff80;
      9'h1af: out_r = 16'hff80;
      9'h1b0: out_r = 16'hff80;
      9'h1b1: out_r = 16'hff80;
      9'h1b2: out_r = 16'hff80;
      9'h1b3: out_r = 16'hff80;
      9'h1b4: out_r = 16'hff80;
      9'h1b5: out_r = 16'hff80;
      9'h1b6: out_r = 16'hff80;
      9'h1b7: out_r = 16'hff80;
      9'h1b8: out_r = 16'hff80;
      9'h1b9: out_r = 16'hff80;
      9'h1ba: out_r = 16'hff80;
      9'h1bb: out_r = 16'hff80;
      9'h1bc: out_r = 16'hff80;
      9'h1bd: out_r = 16'hff80;
      9'h1be: out_r = 16'hff80;
      9'h1bf: out_r = 16'hff80;
      9'h1c0: out_r = 16'hff80;
      9'h1c1: out_r = 16'hff80;
      9'h1c2: out_r = 16'hff80;
      9'h1c3: out_r = 16'hff80;
      9'h1c4: out_r = 16'hff80;
      9'h1c5: out_r = 16'hff80;
      9'h1c6: out_r = 16'hff80;
      9'h1c7: out_r = 16'hff80;
      9'h1c8: out_r = 16'hff80;
      9'h1c9: out_r = 16'hff80;
      9'h1ca: out_r = 16'hff80;
      9'h1cb: out_r = 16'hff80;
      9'h1cc: out_r = 16'hff80;
      9'h1cd: out_r = 16'hff80;
      9'h1ce: out_r = 16'hff80;
      9'h1cf: out_r = 16'hff80;
      9'h1d0: out_r = 16'hff80;
      9'h1d1: out_r = 16'hff80;
      9'h1d2: out_r = 16'hff80;
      9'h1d3: out_r = 16'hff80;
      9'h1d4: out_r = 16'hff80;
      9'h1d5: out_r = 16'hff80;
      9'h1d6: out_r = 16'hff80;
      9'h1d7: out_r = 16'hff80;
      9'h1d8: out_r = 16'hff80;
      9'h1d9: out_r = 16'hff80;
      9'h1da: out_r = 16'hff80;
      9'h1db: out_r = 16'hff80;
      9'h1dc: out_r = 16'hff80;
      9'h1dd: out_r = 16'hff80;
      9'h1de: out_r = 16'hff80;
      9'h1df: out_r = 16'hff80;
      9'h1e0: out_r = 16'hff80;
      9'h1e1: out_r = 16'hff80;
      9'h1e2: out_r = 16'hff80;
      9'h1e3: out_r = 16'hff80;
      9'h1e4: out_r = 16'hff80;
      9'h1e5: out_r = 16'hff80;
      9'h1e6: out_r = 16'hff80;
      9'h1e7: out_r = 16'hff80;
      9'h1e8: out_r = 16'hff80;
      9'h1e9: out_r = 16'hff80;
      9'h1ea: out_r = 16'hff80;
      9'h1eb: out_r = 16'hff80;
      9'h1ec: out_r = 16'hff80;
      9'h1ed: out_r = 16'hff80;
      9'h1ee: out_r = 16'hff80;
      9'h1ef: out_r = 16'hff80;
      9'h1f0: out_r = 16'hff80;
      9'h1f1: out_r = 16'hff80;
      9'h1f2: out_r = 16'hff80;
      9'h1f3: out_r = 16'hff80;
      9'h1f4: out_r = 16'hff80;
      9'h1f5: out_r = 16'hff80;
      9'h1f6: out_r = 16'hff80;
      9'h1f7: out_r = 16'hff80;
      9'h1f8: out_r = 16'hff80;
      9'h1f9: out_r = 16'hff80;
      9'h1fa: out_r = 16'hff80;
      9'h1fb: out_r = 16'hff80;
      9'h1fc: out_r = 16'hff80;
      9'h1fd: out_r = 16'hff80;
      9'h1fe: out_r = 16'hff80;
      9'h1ff: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo4)
              4'h0: out_r = in;
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
  wire bit_15 = in[15] & ~((in[14:7] == 8'hff) & (in[6:0] != 7'h00));
  assign out = {bit_15, out_r[14], out_r[13], out_r[12], out_r[11], out_r[10], out_r[9], out_r[8], out_r[7], out_r[6], out_r[5], out_r[4], out_r[3], out_r[2], out_r[1], out_r[0]};
endmodule
