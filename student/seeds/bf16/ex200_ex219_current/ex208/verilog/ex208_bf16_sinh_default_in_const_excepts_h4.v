module ex208_bf16_sinh_default_in_const_excepts_h4(in, out);
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
        case (mant_hi4)
          4'hd: begin
            out_r = 16'h3dea;
            case (mant_lo3)
              3'h0: out_r = in;
              3'h2: out_r = 16'h3deb;
              3'h3: out_r = 16'h3dec;
              3'h4: out_r = 16'h3ded;
              3'h5: out_r = 16'h3dee;
              3'h6: out_r = 16'h3def;
              3'h7: out_r = 16'h3df0;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3df1;
            case (mant_lo3)
              3'h1: out_r = 16'h3df2;
              3'h2: out_r = 16'h3df3;
              3'h3: out_r = 16'h3df4;
              3'h4: out_r = 16'h3df5;
              3'h5: out_r = 16'h3df6;
              3'h6: out_r = 16'h3df7;
              3'h7: out_r = 16'h3df8;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3df9;
            case (mant_lo3)
              3'h1: out_r = 16'h3dfa;
              3'h2: out_r = 16'h3dfb;
              3'h3: out_r = 16'h3dfc;
              3'h4: out_r = 16'h3dfd;
              3'h5: out_r = 16'h3dfe;
              3'h6: out_r = 16'h3dff;
              3'h7: out_r = 16'h3e00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi4)
          4'h2: begin
            out_r = 16'h3e14;
            case (mant_lo3)
              3'h0: out_r = in;
              3'h1: out_r = in;
              3'h2: out_r = in;
              3'h4: out_r = 16'h3e15;
              3'h5: out_r = 16'h3e16;
              3'h6: out_r = 16'h3e17;
              3'h7: out_r = 16'h3e18;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3e19;
            case (mant_lo3)
              3'h1: out_r = 16'h3e1a;
              3'h2: out_r = 16'h3e1b;
              3'h3: out_r = 16'h3e1c;
              3'h4: out_r = 16'h3e1d;
              3'h5: out_r = 16'h3e1e;
              3'h6: out_r = 16'h3e1f;
              3'h7: out_r = 16'h3e20;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3e21;
            case (mant_lo3)
              3'h1: out_r = 16'h3e22;
              3'h2: out_r = 16'h3e23;
              3'h3: out_r = 16'h3e24;
              3'h4: out_r = 16'h3e25;
              3'h5: out_r = 16'h3e26;
              3'h6: out_r = 16'h3e27;
              3'h7: out_r = 16'h3e28;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3e29;
            case (mant_lo3)
              3'h1: out_r = 16'h3e2a;
              3'h2: out_r = 16'h3e2b;
              3'h3: out_r = 16'h3e2c;
              3'h4: out_r = 16'h3e2d;
              3'h5: out_r = 16'h3e2e;
              3'h6: out_r = 16'h3e2f;
              3'h7: out_r = 16'h3e30;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3e31;
            case (mant_lo3)
              3'h1: out_r = 16'h3e32;
              3'h2: out_r = 16'h3e33;
              3'h3: out_r = 16'h3e34;
              3'h4: out_r = 16'h3e35;
              3'h5: out_r = 16'h3e36;
              3'h6: out_r = 16'h3e37;
              3'h7: out_r = 16'h3e38;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3e39;
            case (mant_lo3)
              3'h1: out_r = 16'h3e3a;
              3'h2: out_r = 16'h3e3b;
              3'h3: out_r = 16'h3e3c;
              3'h4: out_r = 16'h3e3d;
              3'h5: out_r = 16'h3e3e;
              3'h6: out_r = 16'h3e3f;
              3'h7: out_r = 16'h3e40;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3e41;
            case (mant_lo3)
              3'h1: out_r = 16'h3e42;
              3'h2: out_r = 16'h3e43;
              3'h3: out_r = 16'h3e44;
              3'h4: out_r = 16'h3e45;
              3'h5: out_r = 16'h3e46;
              3'h6: out_r = 16'h3e47;
              3'h7: out_r = 16'h3e48;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3e49;
            case (mant_lo3)
              3'h1: out_r = 16'h3e4a;
              3'h2: out_r = 16'h3e4b;
              3'h3: out_r = 16'h3e4c;
              3'h4: out_r = 16'h3e4d;
              3'h5: out_r = 16'h3e4e;
              3'h6: out_r = 16'h3e4f;
              3'h7: out_r = 16'h3e50;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3e51;
            case (mant_lo3)
              3'h1: out_r = 16'h3e52;
              3'h2: out_r = 16'h3e53;
              3'h3: out_r = 16'h3e54;
              3'h4: out_r = 16'h3e56;
              3'h5: out_r = 16'h3e57;
              3'h6: out_r = 16'h3e58;
              3'h7: out_r = 16'h3e59;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3e5a;
            case (mant_lo3)
              3'h1: out_r = 16'h3e5b;
              3'h2: out_r = 16'h3e5c;
              3'h3: out_r = 16'h3e5d;
              3'h4: out_r = 16'h3e5e;
              3'h5: out_r = 16'h3e5f;
              3'h6: out_r = 16'h3e60;
              3'h7: out_r = 16'h3e61;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3e62;
            case (mant_lo3)
              3'h1: out_r = 16'h3e63;
              3'h2: out_r = 16'h3e64;
              3'h3: out_r = 16'h3e65;
              3'h4: out_r = 16'h3e66;
              3'h5: out_r = 16'h3e67;
              3'h6: out_r = 16'h3e68;
              3'h7: out_r = 16'h3e69;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3e6a;
            case (mant_lo3)
              3'h1: out_r = 16'h3e6b;
              3'h2: out_r = 16'h3e6c;
              3'h3: out_r = 16'h3e6d;
              3'h4: out_r = 16'h3e6e;
              3'h5: out_r = 16'h3e6f;
              3'h6: out_r = 16'h3e70;
              3'h7: out_r = 16'h3e71;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3e72;
            case (mant_lo3)
              3'h1: out_r = 16'h3e73;
              3'h2: out_r = 16'h3e74;
              3'h3: out_r = 16'h3e75;
              3'h4: out_r = 16'h3e76;
              3'h5: out_r = 16'h3e77;
              3'h6: out_r = 16'h3e78;
              3'h7: out_r = 16'h3e79;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3e80;
            case (mant_lo3)
              3'h0: out_r = 16'h3e7a;
              3'h1: out_r = 16'h3e7b;
              3'h2: out_r = 16'h3e7c;
              3'h3: out_r = 16'h3e7e;
              3'h4: out_r = 16'h3e7f;
              3'h7: out_r = 16'h3e81;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3e81;
            case (mant_lo3)
              3'h1: out_r = 16'h3e82;
              3'h2: out_r = 16'h3e83;
              3'h3: out_r = 16'h3e84;
              3'h4: out_r = 16'h3e85;
              3'h5: out_r = 16'h3e87;
              3'h6: out_r = 16'h3e88;
              3'h7: out_r = 16'h3e89;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3e8a;
            case (mant_lo3)
              3'h1: out_r = 16'h3e8b;
              3'h2: out_r = 16'h3e8c;
              3'h3: out_r = 16'h3e8d;
              3'h4: out_r = 16'h3e8e;
              3'h5: out_r = 16'h3e8f;
              3'h6: out_r = 16'h3e90;
              3'h7: out_r = 16'h3e91;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3e92;
            case (mant_lo3)
              3'h1: out_r = 16'h3e93;
              3'h2: out_r = 16'h3e94;
              3'h3: out_r = 16'h3e95;
              3'h4: out_r = 16'h3e96;
              3'h5: out_r = 16'h3e97;
              3'h6: out_r = 16'h3e98;
              3'h7: out_r = 16'h3e99;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3e9a;
            case (mant_lo3)
              3'h1: out_r = 16'h3e9b;
              3'h2: out_r = 16'h3e9c;
              3'h3: out_r = 16'h3e9d;
              3'h4: out_r = 16'h3e9e;
              3'h5: out_r = 16'h3e9f;
              3'h6: out_r = 16'h3ea1;
              3'h7: out_r = 16'h3ea2;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3ea3;
            case (mant_lo3)
              3'h1: out_r = 16'h3ea4;
              3'h2: out_r = 16'h3ea5;
              3'h3: out_r = 16'h3ea6;
              3'h4: out_r = 16'h3ea7;
              3'h5: out_r = 16'h3ea8;
              3'h6: out_r = 16'h3ea9;
              3'h7: out_r = 16'h3eaa;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3eab;
            case (mant_lo3)
              3'h1: out_r = 16'h3eac;
              3'h2: out_r = 16'h3ead;
              3'h3: out_r = 16'h3eae;
              3'h4: out_r = 16'h3eaf;
              3'h5: out_r = 16'h3eb0;
              3'h6: out_r = 16'h3eb1;
              3'h7: out_r = 16'h3eb2;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3eb3;
            case (mant_lo3)
              3'h1: out_r = 16'h3eb5;
              3'h2: out_r = 16'h3eb6;
              3'h3: out_r = 16'h3eb7;
              3'h4: out_r = 16'h3eb8;
              3'h5: out_r = 16'h3eb9;
              3'h6: out_r = 16'h3eba;
              3'h7: out_r = 16'h3ebb;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3ebc;
            case (mant_lo3)
              3'h1: out_r = 16'h3ebd;
              3'h2: out_r = 16'h3ebe;
              3'h3: out_r = 16'h3ebf;
              3'h4: out_r = 16'h3ec0;
              3'h5: out_r = 16'h3ec1;
              3'h6: out_r = 16'h3ec2;
              3'h7: out_r = 16'h3ec3;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3ec5;
            case (mant_lo3)
              3'h1: out_r = 16'h3ec6;
              3'h2: out_r = 16'h3ec7;
              3'h3: out_r = 16'h3ec8;
              3'h4: out_r = 16'h3ec9;
              3'h5: out_r = 16'h3eca;
              3'h6: out_r = 16'h3ecb;
              3'h7: out_r = 16'h3ecc;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3ecd;
            case (mant_lo3)
              3'h1: out_r = 16'h3ece;
              3'h2: out_r = 16'h3ecf;
              3'h3: out_r = 16'h3ed0;
              3'h4: out_r = 16'h3ed1;
              3'h5: out_r = 16'h3ed3;
              3'h6: out_r = 16'h3ed4;
              3'h7: out_r = 16'h3ed5;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3ed6;
            case (mant_lo3)
              3'h1: out_r = 16'h3ed7;
              3'h2: out_r = 16'h3ed8;
              3'h3: out_r = 16'h3ed9;
              3'h4: out_r = 16'h3eda;
              3'h5: out_r = 16'h3edb;
              3'h6: out_r = 16'h3edc;
              3'h7: out_r = 16'h3edd;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3ede;
            case (mant_lo3)
              3'h1: out_r = 16'h3ee0;
              3'h2: out_r = 16'h3ee1;
              3'h3: out_r = 16'h3ee2;
              3'h4: out_r = 16'h3ee3;
              3'h5: out_r = 16'h3ee4;
              3'h6: out_r = 16'h3ee5;
              3'h7: out_r = 16'h3ee6;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3ee7;
            case (mant_lo3)
              3'h1: out_r = 16'h3ee8;
              3'h2: out_r = 16'h3ee9;
              3'h3: out_r = 16'h3eeb;
              3'h4: out_r = 16'h3eec;
              3'h5: out_r = 16'h3eed;
              3'h6: out_r = 16'h3eee;
              3'h7: out_r = 16'h3eef;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3ef0;
            case (mant_lo3)
              3'h1: out_r = 16'h3ef1;
              3'h2: out_r = 16'h3ef2;
              3'h3: out_r = 16'h3ef3;
              3'h4: out_r = 16'h3ef4;
              3'h5: out_r = 16'h3ef6;
              3'h6: out_r = 16'h3ef7;
              3'h7: out_r = 16'h3ef8;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3f00;
            case (mant_lo3)
              3'h0: out_r = 16'h3ef9;
              3'h1: out_r = 16'h3efa;
              3'h2: out_r = 16'h3efb;
              3'h3: out_r = 16'h3efc;
              3'h4: out_r = 16'h3efd;
              3'h5: out_r = 16'h3efe;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3f01;
            case (mant_lo3)
              3'h2: out_r = 16'h3f02;
              3'h3: out_r = 16'h3f03;
              3'h4: out_r = 16'h3f03;
              3'h5: out_r = 16'h3f04;
              3'h6: out_r = 16'h3f04;
              3'h7: out_r = 16'h3f05;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3f05;
            case (mant_lo3)
              3'h1: out_r = 16'h3f07;
              3'h2: out_r = 16'h3f08;
              3'h3: out_r = 16'h3f09;
              3'h4: out_r = 16'h3f0a;
              3'h5: out_r = 16'h3f0b;
              3'h6: out_r = 16'h3f0c;
              3'h7: out_r = 16'h3f0d;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3f0e;
            case (mant_lo3)
              3'h1: out_r = 16'h3f10;
              3'h2: out_r = 16'h3f11;
              3'h3: out_r = 16'h3f12;
              3'h4: out_r = 16'h3f13;
              3'h5: out_r = 16'h3f14;
              3'h6: out_r = 16'h3f15;
              3'h7: out_r = 16'h3f17;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3f18;
            case (mant_lo3)
              3'h1: out_r = 16'h3f19;
              3'h2: out_r = 16'h3f1a;
              3'h3: out_r = 16'h3f1b;
              3'h4: out_r = 16'h3f1c;
              3'h5: out_r = 16'h3f1e;
              3'h6: out_r = 16'h3f1f;
              3'h7: out_r = 16'h3f20;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3f21;
            case (mant_lo3)
              3'h1: out_r = 16'h3f22;
              3'h2: out_r = 16'h3f23;
              3'h3: out_r = 16'h3f25;
              3'h4: out_r = 16'h3f26;
              3'h5: out_r = 16'h3f27;
              3'h6: out_r = 16'h3f28;
              3'h7: out_r = 16'h3f29;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3f2b;
            case (mant_lo3)
              3'h1: out_r = 16'h3f2c;
              3'h2: out_r = 16'h3f2d;
              3'h3: out_r = 16'h3f2e;
              3'h4: out_r = 16'h3f2f;
              3'h5: out_r = 16'h3f31;
              3'h6: out_r = 16'h3f32;
              3'h7: out_r = 16'h3f33;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3f34;
            case (mant_lo3)
              3'h1: out_r = 16'h3f36;
              3'h2: out_r = 16'h3f37;
              3'h3: out_r = 16'h3f38;
              3'h4: out_r = 16'h3f39;
              3'h5: out_r = 16'h3f3a;
              3'h6: out_r = 16'h3f3c;
              3'h7: out_r = 16'h3f3d;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3f3e;
            case (mant_lo3)
              3'h1: out_r = 16'h3f3f;
              3'h2: out_r = 16'h3f41;
              3'h3: out_r = 16'h3f42;
              3'h4: out_r = 16'h3f43;
              3'h5: out_r = 16'h3f44;
              3'h6: out_r = 16'h3f46;
              3'h7: out_r = 16'h3f47;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3f48;
            case (mant_lo3)
              3'h1: out_r = 16'h3f4a;
              3'h2: out_r = 16'h3f4b;
              3'h3: out_r = 16'h3f4c;
              3'h4: out_r = 16'h3f4d;
              3'h5: out_r = 16'h3f4f;
              3'h6: out_r = 16'h3f50;
              3'h7: out_r = 16'h3f51;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3f53;
            case (mant_lo3)
              3'h1: out_r = 16'h3f54;
              3'h2: out_r = 16'h3f55;
              3'h3: out_r = 16'h3f56;
              3'h4: out_r = 16'h3f58;
              3'h5: out_r = 16'h3f59;
              3'h6: out_r = 16'h3f5a;
              3'h7: out_r = 16'h3f5c;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3f5d;
            case (mant_lo3)
              3'h1: out_r = 16'h3f5e;
              3'h2: out_r = 16'h3f60;
              3'h3: out_r = 16'h3f61;
              3'h4: out_r = 16'h3f62;
              3'h5: out_r = 16'h3f64;
              3'h6: out_r = 16'h3f65;
              3'h7: out_r = 16'h3f66;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3f68;
            case (mant_lo3)
              3'h1: out_r = 16'h3f69;
              3'h2: out_r = 16'h3f6a;
              3'h3: out_r = 16'h3f6c;
              3'h4: out_r = 16'h3f6d;
              3'h5: out_r = 16'h3f6e;
              3'h6: out_r = 16'h3f70;
              3'h7: out_r = 16'h3f71;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3f73;
            case (mant_lo3)
              3'h1: out_r = 16'h3f74;
              3'h2: out_r = 16'h3f75;
              3'h3: out_r = 16'h3f77;
              3'h4: out_r = 16'h3f78;
              3'h5: out_r = 16'h3f79;
              3'h6: out_r = 16'h3f7b;
              3'h7: out_r = 16'h3f7c;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3f82;
            case (mant_lo3)
              3'h0: out_r = 16'h3f7e;
              3'h1: out_r = 16'h3f7f;
              3'h2: out_r = 16'h3f80;
              3'h3: out_r = 16'h3f81;
              3'h6: out_r = 16'h3f83;
              3'h7: out_r = 16'h3f84;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3f85;
            case (mant_lo3)
              3'h2: out_r = 16'h3f86;
              3'h3: out_r = 16'h3f87;
              3'h4: out_r = 16'h3f87;
              3'h5: out_r = 16'h3f88;
              3'h6: out_r = 16'h3f89;
              3'h7: out_r = 16'h3f8a;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3f8d;
            case (mant_lo3)
              3'h0: out_r = 16'h3f8a;
              3'h1: out_r = 16'h3f8b;
              3'h2: out_r = 16'h3f8c;
              3'h5: out_r = 16'h3f8e;
              3'h6: out_r = 16'h3f8f;
              3'h7: out_r = 16'h3f90;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3f93;
            case (mant_lo3)
              3'h0: out_r = 16'h3f90;
              3'h1: out_r = 16'h3f91;
              3'h2: out_r = 16'h3f92;
              3'h5: out_r = 16'h3f94;
              3'h6: out_r = 16'h3f95;
              3'h7: out_r = 16'h3f96;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3f96;
            case (mant_lo3)
              3'h1: out_r = 16'h3f98;
              3'h2: out_r = 16'h3f9a;
              3'h3: out_r = 16'h3f9b;
              3'h4: out_r = 16'h3f9d;
              3'h5: out_r = 16'h3f9e;
              3'h6: out_r = 16'h3fa0;
              3'h7: out_r = 16'h3fa1;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3fa3;
            case (mant_lo3)
              3'h1: out_r = 16'h3fa5;
              3'h2: out_r = 16'h3fa6;
              3'h3: out_r = 16'h3fa8;
              3'h4: out_r = 16'h3faa;
              3'h5: out_r = 16'h3fab;
              3'h6: out_r = 16'h3fad;
              3'h7: out_r = 16'h3faf;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3fb0;
            case (mant_lo3)
              3'h1: out_r = 16'h3fb2;
              3'h2: out_r = 16'h3fb4;
              3'h3: out_r = 16'h3fb6;
              3'h4: out_r = 16'h3fb7;
              3'h5: out_r = 16'h3fb9;
              3'h6: out_r = 16'h3fbb;
              3'h7: out_r = 16'h3fbd;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3fbe;
            case (mant_lo3)
              3'h1: out_r = 16'h3fc0;
              3'h2: out_r = 16'h3fc2;
              3'h3: out_r = 16'h3fc4;
              3'h4: out_r = 16'h3fc6;
              3'h5: out_r = 16'h3fc7;
              3'h6: out_r = 16'h3fc9;
              3'h7: out_r = 16'h3fcb;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3fcd;
            case (mant_lo3)
              3'h1: out_r = 16'h3fcf;
              3'h2: out_r = 16'h3fd1;
              3'h3: out_r = 16'h3fd3;
              3'h4: out_r = 16'h3fd5;
              3'h5: out_r = 16'h3fd7;
              3'h6: out_r = 16'h3fd9;
              3'h7: out_r = 16'h3fdb;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3fdd;
            case (mant_lo3)
              3'h1: out_r = 16'h3fdf;
              3'h2: out_r = 16'h3fe1;
              3'h3: out_r = 16'h3fe3;
              3'h4: out_r = 16'h3fe5;
              3'h5: out_r = 16'h3fe7;
              3'h6: out_r = 16'h3fe9;
              3'h7: out_r = 16'h3feb;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3fed;
            case (mant_lo3)
              3'h1: out_r = 16'h3fef;
              3'h2: out_r = 16'h3ff1;
              3'h3: out_r = 16'h3ff3;
              3'h4: out_r = 16'h3ff5;
              3'h5: out_r = 16'h3ff8;
              3'h6: out_r = 16'h3ffa;
              3'h7: out_r = 16'h3ffc;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3ffe;
            case (mant_lo3)
              3'h1: out_r = 16'h4000;
              3'h2: out_r = 16'h4001;
              3'h3: out_r = 16'h4002;
              3'h4: out_r = 16'h4004;
              3'h5: out_r = 16'h4005;
              3'h6: out_r = 16'h4006;
              3'h7: out_r = 16'h4007;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h4008;
            case (mant_lo3)
              3'h1: out_r = 16'h4009;
              3'h2: out_r = 16'h400b;
              3'h3: out_r = 16'h400c;
              3'h4: out_r = 16'h400d;
              3'h5: out_r = 16'h400e;
              3'h6: out_r = 16'h400f;
              3'h7: out_r = 16'h4011;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h4012;
            case (mant_lo3)
              3'h1: out_r = 16'h4013;
              3'h2: out_r = 16'h4014;
              3'h3: out_r = 16'h4016;
              3'h4: out_r = 16'h4017;
              3'h5: out_r = 16'h4018;
              3'h6: out_r = 16'h401a;
              3'h7: out_r = 16'h401b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h401c;
            case (mant_lo3)
              3'h1: out_r = 16'h401e;
              3'h2: out_r = 16'h401f;
              3'h3: out_r = 16'h4020;
              3'h4: out_r = 16'h4022;
              3'h5: out_r = 16'h4023;
              3'h6: out_r = 16'h4024;
              3'h7: out_r = 16'h4026;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h4027;
            case (mant_lo3)
              3'h1: out_r = 16'h4028;
              3'h2: out_r = 16'h402a;
              3'h3: out_r = 16'h402b;
              3'h4: out_r = 16'h402d;
              3'h5: out_r = 16'h402e;
              3'h6: out_r = 16'h4030;
              3'h7: out_r = 16'h4031;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h4033;
            case (mant_lo3)
              3'h1: out_r = 16'h4034;
              3'h2: out_r = 16'h4036;
              3'h3: out_r = 16'h4037;
              3'h4: out_r = 16'h4039;
              3'h5: out_r = 16'h403a;
              3'h6: out_r = 16'h403c;
              3'h7: out_r = 16'h403d;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h403f;
            case (mant_lo3)
              3'h1: out_r = 16'h4040;
              3'h2: out_r = 16'h4042;
              3'h3: out_r = 16'h4044;
              3'h4: out_r = 16'h4045;
              3'h5: out_r = 16'h4047;
              3'h6: out_r = 16'h4048;
              3'h7: out_r = 16'h404a;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h404c;
            case (mant_lo3)
              3'h1: out_r = 16'h404d;
              3'h2: out_r = 16'h404f;
              3'h3: out_r = 16'h4051;
              3'h4: out_r = 16'h4053;
              3'h5: out_r = 16'h4054;
              3'h6: out_r = 16'h4056;
              3'h7: out_r = 16'h4058;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h405a;
            case (mant_lo3)
              3'h1: out_r = 16'h405b;
              3'h2: out_r = 16'h405d;
              3'h3: out_r = 16'h405f;
              3'h4: out_r = 16'h4061;
              3'h5: out_r = 16'h4063;
              3'h6: out_r = 16'h4064;
              3'h7: out_r = 16'h4066;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h4068;
            case (mant_lo3)
              3'h1: out_r = 16'h406c;
              3'h2: out_r = 16'h4070;
              3'h3: out_r = 16'h4074;
              3'h4: out_r = 16'h4078;
              3'h5: out_r = 16'h407c;
              3'h6: out_r = 16'h4080;
              3'h7: out_r = 16'h4082;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h4084;
            case (mant_lo3)
              3'h1: out_r = 16'h4086;
              3'h2: out_r = 16'h4088;
              3'h3: out_r = 16'h408b;
              3'h4: out_r = 16'h408d;
              3'h5: out_r = 16'h408f;
              3'h6: out_r = 16'h4091;
              3'h7: out_r = 16'h4094;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h4096;
            case (mant_lo3)
              3'h1: out_r = 16'h4099;
              3'h2: out_r = 16'h409b;
              3'h3: out_r = 16'h409d;
              3'h4: out_r = 16'h40a0;
              3'h5: out_r = 16'h40a3;
              3'h6: out_r = 16'h40a5;
              3'h7: out_r = 16'h40a8;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h40ab;
            case (mant_lo3)
              3'h1: out_r = 16'h40ad;
              3'h2: out_r = 16'h40b0;
              3'h3: out_r = 16'h40b3;
              3'h4: out_r = 16'h40b6;
              3'h5: out_r = 16'h40b9;
              3'h6: out_r = 16'h40bc;
              3'h7: out_r = 16'h40bf;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h40c2;
            case (mant_lo3)
              3'h1: out_r = 16'h40c5;
              3'h2: out_r = 16'h40c8;
              3'h3: out_r = 16'h40cb;
              3'h4: out_r = 16'h40ce;
              3'h5: out_r = 16'h40d2;
              3'h6: out_r = 16'h40d5;
              3'h7: out_r = 16'h40d8;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h40dc;
            case (mant_lo3)
              3'h1: out_r = 16'h40df;
              3'h2: out_r = 16'h40e3;
              3'h3: out_r = 16'h40e6;
              3'h4: out_r = 16'h40ea;
              3'h5: out_r = 16'h40ee;
              3'h6: out_r = 16'h40f2;
              3'h7: out_r = 16'h40f5;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h40f9;
            case (mant_lo3)
              3'h1: out_r = 16'h40fd;
              3'h2: out_r = 16'h4101;
              3'h3: out_r = 16'h4103;
              3'h4: out_r = 16'h4105;
              3'h5: out_r = 16'h4107;
              3'h6: out_r = 16'h4109;
              3'h7: out_r = 16'h410b;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h410d;
            case (mant_lo3)
              3'h1: out_r = 16'h4110;
              3'h2: out_r = 16'h4112;
              3'h3: out_r = 16'h4114;
              3'h4: out_r = 16'h4117;
              3'h5: out_r = 16'h4119;
              3'h6: out_r = 16'h411b;
              3'h7: out_r = 16'h411e;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h4120;
            case (mant_lo3)
              3'h1: out_r = 16'h4123;
              3'h2: out_r = 16'h4125;
              3'h3: out_r = 16'h4128;
              3'h4: out_r = 16'h412b;
              3'h5: out_r = 16'h412d;
              3'h6: out_r = 16'h4130;
              3'h7: out_r = 16'h4133;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h4136;
            case (mant_lo3)
              3'h1: out_r = 16'h4139;
              3'h2: out_r = 16'h413c;
              3'h3: out_r = 16'h413e;
              3'h4: out_r = 16'h4141;
              3'h5: out_r = 16'h4145;
              3'h6: out_r = 16'h4148;
              3'h7: out_r = 16'h414b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h414e;
            case (mant_lo3)
              3'h1: out_r = 16'h4151;
              3'h2: out_r = 16'h4155;
              3'h3: out_r = 16'h4158;
              3'h4: out_r = 16'h415b;
              3'h5: out_r = 16'h415f;
              3'h6: out_r = 16'h4162;
              3'h7: out_r = 16'h4166;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h416a;
            case (mant_lo3)
              3'h1: out_r = 16'h416d;
              3'h2: out_r = 16'h4171;
              3'h3: out_r = 16'h4175;
              3'h4: out_r = 16'h4179;
              3'h5: out_r = 16'h417d;
              3'h6: out_r = 16'h4180;
              3'h7: out_r = 16'h4182;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h4184;
            case (mant_lo3)
              3'h1: out_r = 16'h4186;
              3'h2: out_r = 16'h4189;
              3'h3: out_r = 16'h418b;
              3'h4: out_r = 16'h418d;
              3'h5: out_r = 16'h418f;
              3'h6: out_r = 16'h4191;
              3'h7: out_r = 16'h4194;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h4196;
            case (mant_lo3)
              3'h1: out_r = 16'h4198;
              3'h2: out_r = 16'h419b;
              3'h3: out_r = 16'h419d;
              3'h4: out_r = 16'h41a0;
              3'h5: out_r = 16'h41a2;
              3'h6: out_r = 16'h41a5;
              3'h7: out_r = 16'h41a7;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h41aa;
            case (mant_lo3)
              3'h1: out_r = 16'h41ad;
              3'h2: out_r = 16'h41af;
              3'h3: out_r = 16'h41b2;
              3'h4: out_r = 16'h41b5;
              3'h5: out_r = 16'h41b8;
              3'h6: out_r = 16'h41bb;
              3'h7: out_r = 16'h41be;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h41c1;
            case (mant_lo3)
              3'h1: out_r = 16'h41c4;
              3'h2: out_r = 16'h41c7;
              3'h3: out_r = 16'h41ca;
              3'h4: out_r = 16'h41cd;
              3'h5: out_r = 16'h41d0;
              3'h6: out_r = 16'h41d4;
              3'h7: out_r = 16'h41d7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h41da;
            case (mant_lo3)
              3'h1: out_r = 16'h41e1;
              3'h2: out_r = 16'h41e8;
              3'h3: out_r = 16'h41f0;
              3'h4: out_r = 16'h41f7;
              3'h5: out_r = 16'h41ff;
              3'h6: out_r = 16'h4204;
              3'h7: out_r = 16'h4208;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h420c;
            case (mant_lo3)
              3'h1: out_r = 16'h4211;
              3'h2: out_r = 16'h4215;
              3'h3: out_r = 16'h421a;
              3'h4: out_r = 16'h421f;
              3'h5: out_r = 16'h4224;
              3'h6: out_r = 16'h4229;
              3'h7: out_r = 16'h422e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h4234;
            case (mant_lo3)
              3'h1: out_r = 16'h423a;
              3'h2: out_r = 16'h4240;
              3'h3: out_r = 16'h4246;
              3'h4: out_r = 16'h424c;
              3'h5: out_r = 16'h4252;
              3'h6: out_r = 16'h4259;
              3'h7: out_r = 16'h4260;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h4267;
            case (mant_lo3)
              3'h1: out_r = 16'h426e;
              3'h2: out_r = 16'h4276;
              3'h3: out_r = 16'h427e;
              3'h4: out_r = 16'h4283;
              3'h5: out_r = 16'h4287;
              3'h6: out_r = 16'h428b;
              3'h7: out_r = 16'h4290;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h4294;
            case (mant_lo3)
              3'h1: out_r = 16'h4299;
              3'h2: out_r = 16'h429e;
              3'h3: out_r = 16'h42a3;
              3'h4: out_r = 16'h42a8;
              3'h5: out_r = 16'h42ae;
              3'h6: out_r = 16'h42b3;
              3'h7: out_r = 16'h42b9;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h42bf;
            case (mant_lo3)
              3'h1: out_r = 16'h42c5;
              3'h2: out_r = 16'h42cb;
              3'h3: out_r = 16'h42d1;
              3'h4: out_r = 16'h42d8;
              3'h5: out_r = 16'h42df;
              3'h6: out_r = 16'h42e6;
              3'h7: out_r = 16'h42ed;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h42f5;
            case (mant_lo3)
              3'h1: out_r = 16'h42fc;
              3'h2: out_r = 16'h4302;
              3'h3: out_r = 16'h4306;
              3'h4: out_r = 16'h430b;
              3'h5: out_r = 16'h430f;
              3'h6: out_r = 16'h4314;
              3'h7: out_r = 16'h4318;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h431d;
            case (mant_lo3)
              3'h1: out_r = 16'h4322;
              3'h2: out_r = 16'h4327;
              3'h3: out_r = 16'h432d;
              3'h4: out_r = 16'h4332;
              3'h5: out_r = 16'h4338;
              3'h6: out_r = 16'h433d;
              3'h7: out_r = 16'h4344;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h434a;
            case (mant_lo3)
              3'h1: out_r = 16'h4350;
              3'h2: out_r = 16'h4357;
              3'h3: out_r = 16'h435e;
              3'h4: out_r = 16'h4365;
              3'h5: out_r = 16'h436c;
              3'h6: out_r = 16'h4373;
              3'h7: out_r = 16'h437b;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h4382;
            case (mant_lo3)
              3'h1: out_r = 16'h4386;
              3'h2: out_r = 16'h438a;
              3'h3: out_r = 16'h438e;
              3'h4: out_r = 16'h4393;
              3'h5: out_r = 16'h4397;
              3'h6: out_r = 16'h439c;
              3'h7: out_r = 16'h43a1;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h43a6;
            case (mant_lo3)
              3'h1: out_r = 16'h43ac;
              3'h2: out_r = 16'h43b1;
              3'h3: out_r = 16'h43b7;
              3'h4: out_r = 16'h43bc;
              3'h5: out_r = 16'h43c2;
              3'h6: out_r = 16'h43c9;
              3'h7: out_r = 16'h43cf;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h43d6;
            case (mant_lo3)
              3'h1: out_r = 16'h43dc;
              3'h2: out_r = 16'h43e3;
              3'h3: out_r = 16'h43ea;
              3'h4: out_r = 16'h43f2;
              3'h5: out_r = 16'h43fa;
              3'h6: out_r = 16'h4401;
              3'h7: out_r = 16'h4405;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h4409;
            case (mant_lo3)
              3'h1: out_r = 16'h440d;
              3'h2: out_r = 16'h4412;
              3'h3: out_r = 16'h4417;
              3'h4: out_r = 16'h441b;
              3'h5: out_r = 16'h4420;
              3'h6: out_r = 16'h4425;
              3'h7: out_r = 16'h442b;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h4430;
            case (mant_lo3)
              3'h1: out_r = 16'h4436;
              3'h2: out_r = 16'h443b;
              3'h3: out_r = 16'h4441;
              3'h4: out_r = 16'h4447;
              3'h5: out_r = 16'h444e;
              3'h6: out_r = 16'h4454;
              3'h7: out_r = 16'h445b;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h4462;
            case (mant_lo3)
              3'h1: out_r = 16'h4469;
              3'h2: out_r = 16'h4471;
              3'h3: out_r = 16'h4478;
              3'h4: out_r = 16'h4480;
              3'h5: out_r = 16'h4484;
              3'h6: out_r = 16'h4488;
              3'h7: out_r = 16'h448d;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h4491;
            case (mant_lo3)
              3'h1: out_r = 16'h4496;
              3'h2: out_r = 16'h449a;
              3'h3: out_r = 16'h449f;
              3'h4: out_r = 16'h44a4;
              3'h5: out_r = 16'h44aa;
              3'h6: out_r = 16'h44af;
              3'h7: out_r = 16'h44b5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h44ba;
            case (mant_lo3)
              3'h1: out_r = 16'h44c6;
              3'h2: out_r = 16'h44d3;
              3'h3: out_r = 16'h44e1;
              3'h4: out_r = 16'h44ef;
              3'h5: out_r = 16'h44ff;
              3'h6: out_r = 16'h4508;
              3'h7: out_r = 16'h4510;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h451a;
            case (mant_lo3)
              3'h1: out_r = 16'h4523;
              3'h2: out_r = 16'h452e;
              3'h3: out_r = 16'h4539;
              3'h4: out_r = 16'h4545;
              3'h5: out_r = 16'h4552;
              3'h6: out_r = 16'h455f;
              3'h7: out_r = 16'h456e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h457d;
            case (mant_lo3)
              3'h1: out_r = 16'h4587;
              3'h2: out_r = 16'h458f;
              3'h3: out_r = 16'h4599;
              3'h4: out_r = 16'h45a3;
              3'h5: out_r = 16'h45ad;
              3'h6: out_r = 16'h45b8;
              3'h7: out_r = 16'h45c4;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h45d1;
            case (mant_lo3)
              3'h1: out_r = 16'h45de;
              3'h2: out_r = 16'h45ed;
              3'h3: out_r = 16'h45fc;
              3'h4: out_r = 16'h4606;
              3'h5: out_r = 16'h460f;
              3'h6: out_r = 16'h4618;
              3'h7: out_r = 16'h4622;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h462c;
            case (mant_lo3)
              3'h1: out_r = 16'h4637;
              3'h2: out_r = 16'h4643;
              3'h3: out_r = 16'h4650;
              3'h4: out_r = 16'h465d;
              3'h5: out_r = 16'h466b;
              3'h6: out_r = 16'h467a;
              3'h7: out_r = 16'h4685;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h468e;
            case (mant_lo3)
              3'h1: out_r = 16'h4697;
              3'h2: out_r = 16'h46a1;
              3'h3: out_r = 16'h46ab;
              3'h4: out_r = 16'h46b6;
              3'h5: out_r = 16'h46c2;
              3'h6: out_r = 16'h46ce;
              3'h7: out_r = 16'h46dc;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h46ea;
            case (mant_lo3)
              3'h1: out_r = 16'h46f9;
              3'h2: out_r = 16'h4705;
              3'h3: out_r = 16'h470d;
              3'h4: out_r = 16'h4716;
              3'h5: out_r = 16'h4720;
              3'h6: out_r = 16'h472a;
              3'h7: out_r = 16'h4735;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h4741;
            case (mant_lo3)
              3'h1: out_r = 16'h474d;
              3'h2: out_r = 16'h475a;
              3'h3: out_r = 16'h4769;
              3'h4: out_r = 16'h4778;
              3'h5: out_r = 16'h4784;
              3'h6: out_r = 16'h478c;
              3'h7: out_r = 16'h4795;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h479f;
            case (mant_lo3)
              3'h1: out_r = 16'h47a9;
              3'h2: out_r = 16'h47b4;
              3'h3: out_r = 16'h47c0;
              3'h4: out_r = 16'h47cc;
              3'h5: out_r = 16'h47d9;
              3'h6: out_r = 16'h47e7;
              3'h7: out_r = 16'h47f6;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h4803;
            case (mant_lo3)
              3'h1: out_r = 16'h480b;
              3'h2: out_r = 16'h4814;
              3'h3: out_r = 16'h481e;
              3'h4: out_r = 16'h4828;
              3'h5: out_r = 16'h4833;
              3'h6: out_r = 16'h483f;
              3'h7: out_r = 16'h484b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h4858;
            case (mant_lo3)
              3'h1: out_r = 16'h4866;
              3'h2: out_r = 16'h4875;
              3'h3: out_r = 16'h4882;
              3'h4: out_r = 16'h488b;
              3'h5: out_r = 16'h4894;
              3'h6: out_r = 16'h489d;
              3'h7: out_r = 16'h48a7;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h48b2;
            case (mant_lo3)
              3'h1: out_r = 16'h48be;
              3'h2: out_r = 16'h48ca;
              3'h3: out_r = 16'h48d7;
              3'h4: out_r = 16'h48e5;
              3'h5: out_r = 16'h48f3;
              3'h6: out_r = 16'h4902;
              3'h7: out_r = 16'h490a;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h4913;
            case (mant_lo3)
              3'h1: out_r = 16'h491c;
              3'h2: out_r = 16'h4926;
              3'h3: out_r = 16'h4931;
              3'h4: out_r = 16'h493c;
              3'h5: out_r = 16'h4949;
              3'h6: out_r = 16'h4956;
              3'h7: out_r = 16'h4963;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h4972;
            case (mant_lo3)
              3'h1: out_r = 16'h4981;
              3'h2: out_r = 16'h4989;
              3'h3: out_r = 16'h4992;
              3'h4: out_r = 16'h499b;
              3'h5: out_r = 16'h49a5;
              3'h6: out_r = 16'h49b0;
              3'h7: out_r = 16'h49bb;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h49c8;
            case (mant_lo3)
              3'h1: out_r = 16'h49d4;
              3'h2: out_r = 16'h49e2;
              3'h3: out_r = 16'h49f1;
              3'h4: out_r = 16'h4a00;
              3'h5: out_r = 16'h4a08;
              3'h6: out_r = 16'h4a11;
              3'h7: out_r = 16'h4a1b;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h4a24;
            case (mant_lo3)
              3'h1: out_r = 16'h4a2f;
              3'h2: out_r = 16'h4a3a;
              3'h3: out_r = 16'h4a46;
              3'h4: out_r = 16'h4a53;
              3'h5: out_r = 16'h4a61;
              3'h6: out_r = 16'h4a6f;
              3'h7: out_r = 16'h4a7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h083: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h4a88;
            case (mant_lo3)
              3'h1: out_r = 16'h4a9a;
              3'h2: out_r = 16'h4aae;
              3'h3: out_r = 16'h4ac5;
              3'h4: out_r = 16'h4ae0;
              3'h5: out_r = 16'h4afd;
              3'h6: out_r = 16'h4b10;
              3'h7: out_r = 16'h4b23;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h4b38;
            case (mant_lo3)
              3'h1: out_r = 16'h4b51;
              3'h2: out_r = 16'h4b6d;
              3'h3: out_r = 16'h4b86;
              3'h4: out_r = 16'h4b98;
              3'h5: out_r = 16'h4bac;
              3'h6: out_r = 16'h4bc3;
              3'h7: out_r = 16'h4bdd;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h4bfa;
            case (mant_lo3)
              3'h1: out_r = 16'h4c0e;
              3'h2: out_r = 16'h4c21;
              3'h3: out_r = 16'h4c36;
              3'h4: out_r = 16'h4c4e;
              3'h5: out_r = 16'h4c6a;
              3'h6: out_r = 16'h4c85;
              3'h7: out_r = 16'h4c96;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h4caa;
            case (mant_lo3)
              3'h1: out_r = 16'h4cc1;
              3'h2: out_r = 16'h4cdb;
              3'h3: out_r = 16'h4cf8;
              3'h4: out_r = 16'h4d0c;
              3'h5: out_r = 16'h4d1f;
              3'h6: out_r = 16'h4d34;
              3'h7: out_r = 16'h4d4c;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h4d67;
            case (mant_lo3)
              3'h1: out_r = 16'h4d83;
              3'h2: out_r = 16'h4d95;
              3'h3: out_r = 16'h4da8;
              3'h4: out_r = 16'h4dbf;
              3'h5: out_r = 16'h4dd8;
              3'h6: out_r = 16'h4df5;
              3'h7: out_r = 16'h4e0b;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h4e1d;
            case (mant_lo3)
              3'h1: out_r = 16'h4e32;
              3'h2: out_r = 16'h4e4a;
              3'h3: out_r = 16'h4e65;
              3'h4: out_r = 16'h4e82;
              3'h5: out_r = 16'h4e93;
              3'h6: out_r = 16'h4ea6;
              3'h7: out_r = 16'h4ebd;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h4ed6;
            case (mant_lo3)
              3'h1: out_r = 16'h4ef2;
              3'h2: out_r = 16'h4f09;
              3'h3: out_r = 16'h4f1b;
              3'h4: out_r = 16'h4f30;
              3'h5: out_r = 16'h4f48;
              3'h6: out_r = 16'h4f62;
              3'h7: out_r = 16'h4f80;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h4f91;
            case (mant_lo3)
              3'h1: out_r = 16'h4fa5;
              3'h2: out_r = 16'h4fba;
              3'h3: out_r = 16'h4fd3;
              3'h4: out_r = 16'h4fef;
              3'h5: out_r = 16'h5008;
              3'h6: out_r = 16'h501a;
              3'h7: out_r = 16'h502e;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h5045;
            case (mant_lo3)
              3'h1: out_r = 16'h5060;
              3'h2: out_r = 16'h507d;
              3'h3: out_r = 16'h5090;
              3'h4: out_r = 16'h50a3;
              3'h5: out_r = 16'h50b8;
              3'h6: out_r = 16'h50d1;
              3'h7: out_r = 16'h50ed;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h5106;
            case (mant_lo3)
              3'h1: out_r = 16'h5118;
              3'h2: out_r = 16'h512c;
              3'h3: out_r = 16'h5143;
              3'h4: out_r = 16'h515d;
              3'h5: out_r = 16'h517b;
              3'h6: out_r = 16'h518e;
              3'h7: out_r = 16'h51a1;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h51b6;
            case (mant_lo3)
              3'h1: out_r = 16'h51cf;
              3'h2: out_r = 16'h51ea;
              3'h3: out_r = 16'h5205;
              3'h4: out_r = 16'h5216;
              3'h5: out_r = 16'h522a;
              3'h6: out_r = 16'h5241;
              3'h7: out_r = 16'h525b;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h5278;
            case (mant_lo3)
              3'h1: out_r = 16'h528c;
              3'h2: out_r = 16'h529f;
              3'h3: out_r = 16'h52b4;
              3'h4: out_r = 16'h52cc;
              3'h5: out_r = 16'h52e7;
              3'h6: out_r = 16'h5303;
              3'h7: out_r = 16'h5315;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h5328;
            case (mant_lo3)
              3'h1: out_r = 16'h533f;
              3'h2: out_r = 16'h5358;
              3'h3: out_r = 16'h5375;
              3'h4: out_r = 16'h538b;
              3'h5: out_r = 16'h539d;
              3'h6: out_r = 16'h53b2;
              3'h7: out_r = 16'h53ca;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h53e5;
            case (mant_lo3)
              3'h1: out_r = 16'h5402;
              3'h2: out_r = 16'h5413;
              3'h3: out_r = 16'h5426;
              3'h4: out_r = 16'h543d;
              3'h5: out_r = 16'h5456;
              3'h6: out_r = 16'h5472;
              3'h7: out_r = 16'h5489;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h549c;
            case (mant_lo3)
              3'h1: out_r = 16'h54b0;
              3'h2: out_r = 16'h54c8;
              3'h3: out_r = 16'h54e2;
              3'h4: out_r = 16'h5500;
              3'h5: out_r = 16'h5511;
              3'h6: out_r = 16'h5525;
              3'h7: out_r = 16'h553b;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h5553;
            case (mant_lo3)
              3'h1: out_r = 16'h5570;
              3'h2: out_r = 16'h5588;
              3'h3: out_r = 16'h559a;
              3'h4: out_r = 16'h55ae;
              3'h5: out_r = 16'h55c5;
              3'h6: out_r = 16'h55e0;
              3'h7: out_r = 16'h55fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h084: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h5610;
            case (mant_lo3)
              3'h1: out_r = 16'h5638;
              3'h2: out_r = 16'h566d;
              3'h3: out_r = 16'h5698;
              3'h4: out_r = 16'h56c3;
              3'h5: out_r = 16'h56fb;
              3'h6: out_r = 16'h5721;
              3'h7: out_r = 16'h574f;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h5785;
            case (mant_lo3)
              3'h1: out_r = 16'h57aa;
              3'h2: out_r = 16'h57db;
              3'h3: out_r = 16'h580c;
              3'h4: out_r = 16'h5834;
              3'h5: out_r = 16'h5868;
              3'h6: out_r = 16'h5895;
              3'h7: out_r = 16'h58bf;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h58f5;
            case (mant_lo3)
              3'h1: out_r = 16'h591d;
              3'h2: out_r = 16'h594a;
              3'h3: out_r = 16'h5982;
              3'h4: out_r = 16'h59a7;
              3'h5: out_r = 16'h59d6;
              3'h6: out_r = 16'h5a09;
              3'h7: out_r = 16'h5a30;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h5a62;
            case (mant_lo3)
              3'h1: out_r = 16'h5a91;
              3'h2: out_r = 16'h5abb;
              3'h3: out_r = 16'h5af0;
              3'h4: out_r = 16'h5b1a;
              3'h5: out_r = 16'h5b46;
              3'h6: out_r = 16'h5b7e;
              3'h7: out_r = 16'h5ba3;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h5bd1;
            case (mant_lo3)
              3'h1: out_r = 16'h5c06;
              3'h2: out_r = 16'h5c2c;
              3'h3: out_r = 16'h5c5d;
              3'h4: out_r = 16'h5c8e;
              3'h5: out_r = 16'h5cb6;
              3'h6: out_r = 16'h5cea;
              3'h7: out_r = 16'h5d16;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h5d41;
            case (mant_lo3)
              3'h1: out_r = 16'h5d78;
              3'h2: out_r = 16'h5d9f;
              3'h3: out_r = 16'h5dcc;
              3'h4: out_r = 16'h5e03;
              3'h5: out_r = 16'h5e28;
              3'h6: out_r = 16'h5e58;
              3'h7: out_r = 16'h5e8b;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h5eb2;
            case (mant_lo3)
              3'h1: out_r = 16'h5ee5;
              3'h2: out_r = 16'h5f13;
              3'h3: out_r = 16'h5f3d;
              3'h4: out_r = 16'h5f72;
              3'h5: out_r = 16'h5f9c;
              3'h6: out_r = 16'h5fc8;
              3'h7: out_r = 16'h6000;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h6025;
            case (mant_lo3)
              3'h1: out_r = 16'h6054;
              3'h2: out_r = 16'h6088;
              3'h3: out_r = 16'h60ae;
              3'h4: out_r = 16'h60e0;
              3'h5: out_r = 16'h6110;
              3'h6: out_r = 16'h6139;
              3'h7: out_r = 16'h616d;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h6198;
            case (mant_lo3)
              3'h1: out_r = 16'h61c3;
              3'h2: out_r = 16'h61fb;
              3'h3: out_r = 16'h6221;
              3'h4: out_r = 16'h624f;
              3'h5: out_r = 16'h6285;
              3'h6: out_r = 16'h62aa;
              3'h7: out_r = 16'h62db;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h630d;
            case (mant_lo3)
              3'h1: out_r = 16'h6334;
              3'h2: out_r = 16'h6368;
              3'h3: out_r = 16'h6395;
              3'h4: out_r = 16'h63bf;
              3'h5: out_r = 16'h63f5;
              3'h6: out_r = 16'h641d;
              3'h7: out_r = 16'h644a;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h6482;
            case (mant_lo3)
              3'h1: out_r = 16'h64a7;
              3'h2: out_r = 16'h64d6;
              3'h3: out_r = 16'h6509;
              3'h4: out_r = 16'h6530;
              3'h5: out_r = 16'h6563;
              3'h6: out_r = 16'h6591;
              3'h7: out_r = 16'h65bb;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h65f0;
            case (mant_lo3)
              3'h1: out_r = 16'h661a;
              3'h2: out_r = 16'h6646;
              3'h3: out_r = 16'h667e;
              3'h4: out_r = 16'h66a3;
              3'h5: out_r = 16'h66d1;
              3'h6: out_r = 16'h6706;
              3'h7: out_r = 16'h672c;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h675d;
            case (mant_lo3)
              3'h1: out_r = 16'h678e;
              3'h2: out_r = 16'h67b7;
              3'h3: out_r = 16'h67ea;
              3'h4: out_r = 16'h6816;
              3'h5: out_r = 16'h6841;
              3'h6: out_r = 16'h6878;
              3'h7: out_r = 16'h689f;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h68cd;
            case (mant_lo3)
              3'h1: out_r = 16'h6903;
              3'h2: out_r = 16'h6929;
              3'h3: out_r = 16'h6959;
              3'h4: out_r = 16'h698b;
              3'h5: out_r = 16'h69b2;
              3'h6: out_r = 16'h69e5;
              3'h7: out_r = 16'h6a13;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h6a3d;
            case (mant_lo3)
              3'h1: out_r = 16'h6a73;
              3'h2: out_r = 16'h6a9c;
              3'h3: out_r = 16'h6ac8;
              3'h4: out_r = 16'h6b00;
              3'h5: out_r = 16'h6b25;
              3'h6: out_r = 16'h6b54;
              3'h7: out_r = 16'h6b88;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h6baf;
            case (mant_lo3)
              3'h1: out_r = 16'h6be0;
              3'h2: out_r = 16'h6c10;
              3'h3: out_r = 16'h6c39;
              3'h4: out_r = 16'h6c6d;
              3'h5: out_r = 16'h6c98;
              3'h6: out_r = 16'h6cc4;
              3'h7: out_r = 16'h6cfb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h6d21;
            case (mant_lo3)
              3'h1: out_r = 16'h6d85;
              3'h2: out_r = 16'h6ddb;
              3'h3: out_r = 16'h6e35;
              3'h4: out_r = 16'h6e95;
              3'h5: out_r = 16'h6ef5;
              3'h6: out_r = 16'h6f4a;
              3'h7: out_r = 16'h6fa7;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h7009;
            case (mant_lo3)
              3'h1: out_r = 16'h7063;
              3'h2: out_r = 16'h70bb;
              3'h3: out_r = 16'h711a;
              3'h4: out_r = 16'h717e;
              3'h5: out_r = 16'h71d1;
              3'h6: out_r = 16'h722d;
              3'h7: out_r = 16'h728e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h72eb;
            case (mant_lo3)
              3'h1: out_r = 16'h7341;
              3'h2: out_r = 16'h739f;
              3'h3: out_r = 16'h7403;
              3'h4: out_r = 16'h7459;
              3'h5: out_r = 16'h74b3;
              3'h6: out_r = 16'h7513;
              3'h7: out_r = 16'h7573;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h75c8;
            case (mant_lo3)
              3'h1: out_r = 16'h7625;
              3'h2: out_r = 16'h7688;
              3'h3: out_r = 16'h76e0;
              3'h4: out_r = 16'h7739;
              3'h5: out_r = 16'h7798;
              3'h6: out_r = 16'h77fb;
              3'h7: out_r = 16'h784f;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h78ab;
            case (mant_lo3)
              3'h1: out_r = 16'h790d;
              3'h2: out_r = 16'h7968;
              3'h3: out_r = 16'h79bf;
              3'h4: out_r = 16'h7a1e;
              3'h5: out_r = 16'h7a82;
              3'h6: out_r = 16'h7ad6;
              3'h7: out_r = 16'h7b31;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h7b92;
            case (mant_lo3)
              3'h1: out_r = 16'h7bf0;
              3'h2: out_r = 16'h7c46;
              3'h3: out_r = 16'h7ca3;
              3'h4: out_r = 16'h7d07;
              3'h5: out_r = 16'h7d5e;
              3'h6: out_r = 16'h7db7;
              3'h7: out_r = 16'h7e17;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h7f80;
            case (mant_lo3)
              3'h0: out_r = 16'h7e79;
              3'h1: out_r = 16'h7ecd;
              3'h2: out_r = 16'h7f29;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h7f80;
          end
          4'h8: begin
            out_r = 16'h7f80;
          end
          4'h9: begin
            out_r = 16'h7f80;
          end
          4'ha: begin
            out_r = 16'h7f80;
          end
          4'hb: begin
            out_r = 16'h7f80;
          end
          4'hc: begin
            out_r = 16'h7f80;
          end
          4'hd: begin
            out_r = 16'h7f80;
          end
          4'he: begin
            out_r = 16'h7f80;
          end
          4'hf: begin
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
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo3)
              3'h0: out_r = in;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h7fc0;
          end
          4'h2: begin
            out_r = 16'h7fc0;
          end
          4'h3: begin
            out_r = 16'h7fc0;
          end
          4'h4: begin
            out_r = 16'h7fc0;
          end
          4'h5: begin
            out_r = 16'h7fc0;
          end
          4'h6: begin
            out_r = 16'h7fc0;
          end
          4'h7: begin
            out_r = 16'h7fc0;
          end
          4'h8: begin
            out_r = 16'h7fc0;
          end
          4'h9: begin
            out_r = 16'h7fc0;
          end
          4'ha: begin
            out_r = 16'h7fc0;
          end
          4'hb: begin
            out_r = 16'h7fc0;
          end
          4'hc: begin
            out_r = 16'h7fc0;
          end
          4'hd: begin
            out_r = 16'h7fc0;
          end
          4'he: begin
            out_r = 16'h7fc0;
          end
          4'hf: begin
            out_r = 16'h7fc0;
          end
          default: begin end
        endcase
      end
      9'h100: out_r = 16'h8000;
      9'h17b: begin
        case (mant_hi4)
          4'hd: begin
            out_r = 16'hbdea;
            case (mant_lo3)
              3'h0: out_r = in;
              3'h2: out_r = 16'hbdeb;
              3'h3: out_r = 16'hbdec;
              3'h4: out_r = 16'hbded;
              3'h5: out_r = 16'hbdee;
              3'h6: out_r = 16'hbdef;
              3'h7: out_r = 16'hbdf0;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbdf1;
            case (mant_lo3)
              3'h1: out_r = 16'hbdf2;
              3'h2: out_r = 16'hbdf3;
              3'h3: out_r = 16'hbdf4;
              3'h4: out_r = 16'hbdf5;
              3'h5: out_r = 16'hbdf6;
              3'h6: out_r = 16'hbdf7;
              3'h7: out_r = 16'hbdf8;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbdf9;
            case (mant_lo3)
              3'h1: out_r = 16'hbdfa;
              3'h2: out_r = 16'hbdfb;
              3'h3: out_r = 16'hbdfc;
              3'h4: out_r = 16'hbdfd;
              3'h5: out_r = 16'hbdfe;
              3'h6: out_r = 16'hbdff;
              3'h7: out_r = 16'hbe00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi4)
          4'h2: begin
            out_r = 16'hbe14;
            case (mant_lo3)
              3'h0: out_r = in;
              3'h1: out_r = in;
              3'h2: out_r = in;
              3'h4: out_r = 16'hbe15;
              3'h5: out_r = 16'hbe16;
              3'h6: out_r = 16'hbe17;
              3'h7: out_r = 16'hbe18;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbe19;
            case (mant_lo3)
              3'h1: out_r = 16'hbe1a;
              3'h2: out_r = 16'hbe1b;
              3'h3: out_r = 16'hbe1c;
              3'h4: out_r = 16'hbe1d;
              3'h5: out_r = 16'hbe1e;
              3'h6: out_r = 16'hbe1f;
              3'h7: out_r = 16'hbe20;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbe21;
            case (mant_lo3)
              3'h1: out_r = 16'hbe22;
              3'h2: out_r = 16'hbe23;
              3'h3: out_r = 16'hbe24;
              3'h4: out_r = 16'hbe25;
              3'h5: out_r = 16'hbe26;
              3'h6: out_r = 16'hbe27;
              3'h7: out_r = 16'hbe28;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbe29;
            case (mant_lo3)
              3'h1: out_r = 16'hbe2a;
              3'h2: out_r = 16'hbe2b;
              3'h3: out_r = 16'hbe2c;
              3'h4: out_r = 16'hbe2d;
              3'h5: out_r = 16'hbe2e;
              3'h6: out_r = 16'hbe2f;
              3'h7: out_r = 16'hbe30;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbe31;
            case (mant_lo3)
              3'h1: out_r = 16'hbe32;
              3'h2: out_r = 16'hbe33;
              3'h3: out_r = 16'hbe34;
              3'h4: out_r = 16'hbe35;
              3'h5: out_r = 16'hbe36;
              3'h6: out_r = 16'hbe37;
              3'h7: out_r = 16'hbe38;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbe39;
            case (mant_lo3)
              3'h1: out_r = 16'hbe3a;
              3'h2: out_r = 16'hbe3b;
              3'h3: out_r = 16'hbe3c;
              3'h4: out_r = 16'hbe3d;
              3'h5: out_r = 16'hbe3e;
              3'h6: out_r = 16'hbe3f;
              3'h7: out_r = 16'hbe40;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbe41;
            case (mant_lo3)
              3'h1: out_r = 16'hbe42;
              3'h2: out_r = 16'hbe43;
              3'h3: out_r = 16'hbe44;
              3'h4: out_r = 16'hbe45;
              3'h5: out_r = 16'hbe46;
              3'h6: out_r = 16'hbe47;
              3'h7: out_r = 16'hbe48;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbe49;
            case (mant_lo3)
              3'h1: out_r = 16'hbe4a;
              3'h2: out_r = 16'hbe4b;
              3'h3: out_r = 16'hbe4c;
              3'h4: out_r = 16'hbe4d;
              3'h5: out_r = 16'hbe4e;
              3'h6: out_r = 16'hbe4f;
              3'h7: out_r = 16'hbe50;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbe51;
            case (mant_lo3)
              3'h1: out_r = 16'hbe52;
              3'h2: out_r = 16'hbe53;
              3'h3: out_r = 16'hbe54;
              3'h4: out_r = 16'hbe56;
              3'h5: out_r = 16'hbe57;
              3'h6: out_r = 16'hbe58;
              3'h7: out_r = 16'hbe59;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbe5a;
            case (mant_lo3)
              3'h1: out_r = 16'hbe5b;
              3'h2: out_r = 16'hbe5c;
              3'h3: out_r = 16'hbe5d;
              3'h4: out_r = 16'hbe5e;
              3'h5: out_r = 16'hbe5f;
              3'h6: out_r = 16'hbe60;
              3'h7: out_r = 16'hbe61;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbe62;
            case (mant_lo3)
              3'h1: out_r = 16'hbe63;
              3'h2: out_r = 16'hbe64;
              3'h3: out_r = 16'hbe65;
              3'h4: out_r = 16'hbe66;
              3'h5: out_r = 16'hbe67;
              3'h6: out_r = 16'hbe68;
              3'h7: out_r = 16'hbe69;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbe6a;
            case (mant_lo3)
              3'h1: out_r = 16'hbe6b;
              3'h2: out_r = 16'hbe6c;
              3'h3: out_r = 16'hbe6d;
              3'h4: out_r = 16'hbe6e;
              3'h5: out_r = 16'hbe6f;
              3'h6: out_r = 16'hbe70;
              3'h7: out_r = 16'hbe71;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbe72;
            case (mant_lo3)
              3'h1: out_r = 16'hbe73;
              3'h2: out_r = 16'hbe74;
              3'h3: out_r = 16'hbe75;
              3'h4: out_r = 16'hbe76;
              3'h5: out_r = 16'hbe77;
              3'h6: out_r = 16'hbe78;
              3'h7: out_r = 16'hbe79;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbe80;
            case (mant_lo3)
              3'h0: out_r = 16'hbe7a;
              3'h1: out_r = 16'hbe7b;
              3'h2: out_r = 16'hbe7c;
              3'h3: out_r = 16'hbe7e;
              3'h4: out_r = 16'hbe7f;
              3'h7: out_r = 16'hbe81;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbe81;
            case (mant_lo3)
              3'h1: out_r = 16'hbe82;
              3'h2: out_r = 16'hbe83;
              3'h3: out_r = 16'hbe84;
              3'h4: out_r = 16'hbe85;
              3'h5: out_r = 16'hbe87;
              3'h6: out_r = 16'hbe88;
              3'h7: out_r = 16'hbe89;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbe8a;
            case (mant_lo3)
              3'h1: out_r = 16'hbe8b;
              3'h2: out_r = 16'hbe8c;
              3'h3: out_r = 16'hbe8d;
              3'h4: out_r = 16'hbe8e;
              3'h5: out_r = 16'hbe8f;
              3'h6: out_r = 16'hbe90;
              3'h7: out_r = 16'hbe91;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbe92;
            case (mant_lo3)
              3'h1: out_r = 16'hbe93;
              3'h2: out_r = 16'hbe94;
              3'h3: out_r = 16'hbe95;
              3'h4: out_r = 16'hbe96;
              3'h5: out_r = 16'hbe97;
              3'h6: out_r = 16'hbe98;
              3'h7: out_r = 16'hbe99;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbe9a;
            case (mant_lo3)
              3'h1: out_r = 16'hbe9b;
              3'h2: out_r = 16'hbe9c;
              3'h3: out_r = 16'hbe9d;
              3'h4: out_r = 16'hbe9e;
              3'h5: out_r = 16'hbe9f;
              3'h6: out_r = 16'hbea1;
              3'h7: out_r = 16'hbea2;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbea3;
            case (mant_lo3)
              3'h1: out_r = 16'hbea4;
              3'h2: out_r = 16'hbea5;
              3'h3: out_r = 16'hbea6;
              3'h4: out_r = 16'hbea7;
              3'h5: out_r = 16'hbea8;
              3'h6: out_r = 16'hbea9;
              3'h7: out_r = 16'hbeaa;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbeab;
            case (mant_lo3)
              3'h1: out_r = 16'hbeac;
              3'h2: out_r = 16'hbead;
              3'h3: out_r = 16'hbeae;
              3'h4: out_r = 16'hbeaf;
              3'h5: out_r = 16'hbeb0;
              3'h6: out_r = 16'hbeb1;
              3'h7: out_r = 16'hbeb2;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbeb3;
            case (mant_lo3)
              3'h1: out_r = 16'hbeb5;
              3'h2: out_r = 16'hbeb6;
              3'h3: out_r = 16'hbeb7;
              3'h4: out_r = 16'hbeb8;
              3'h5: out_r = 16'hbeb9;
              3'h6: out_r = 16'hbeba;
              3'h7: out_r = 16'hbebb;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbebc;
            case (mant_lo3)
              3'h1: out_r = 16'hbebd;
              3'h2: out_r = 16'hbebe;
              3'h3: out_r = 16'hbebf;
              3'h4: out_r = 16'hbec0;
              3'h5: out_r = 16'hbec1;
              3'h6: out_r = 16'hbec2;
              3'h7: out_r = 16'hbec3;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbec5;
            case (mant_lo3)
              3'h1: out_r = 16'hbec6;
              3'h2: out_r = 16'hbec7;
              3'h3: out_r = 16'hbec8;
              3'h4: out_r = 16'hbec9;
              3'h5: out_r = 16'hbeca;
              3'h6: out_r = 16'hbecb;
              3'h7: out_r = 16'hbecc;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbecd;
            case (mant_lo3)
              3'h1: out_r = 16'hbece;
              3'h2: out_r = 16'hbecf;
              3'h3: out_r = 16'hbed0;
              3'h4: out_r = 16'hbed1;
              3'h5: out_r = 16'hbed3;
              3'h6: out_r = 16'hbed4;
              3'h7: out_r = 16'hbed5;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbed6;
            case (mant_lo3)
              3'h1: out_r = 16'hbed7;
              3'h2: out_r = 16'hbed8;
              3'h3: out_r = 16'hbed9;
              3'h4: out_r = 16'hbeda;
              3'h5: out_r = 16'hbedb;
              3'h6: out_r = 16'hbedc;
              3'h7: out_r = 16'hbedd;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbede;
            case (mant_lo3)
              3'h1: out_r = 16'hbee0;
              3'h2: out_r = 16'hbee1;
              3'h3: out_r = 16'hbee2;
              3'h4: out_r = 16'hbee3;
              3'h5: out_r = 16'hbee4;
              3'h6: out_r = 16'hbee5;
              3'h7: out_r = 16'hbee6;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbee7;
            case (mant_lo3)
              3'h1: out_r = 16'hbee8;
              3'h2: out_r = 16'hbee9;
              3'h3: out_r = 16'hbeeb;
              3'h4: out_r = 16'hbeec;
              3'h5: out_r = 16'hbeed;
              3'h6: out_r = 16'hbeee;
              3'h7: out_r = 16'hbeef;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbef0;
            case (mant_lo3)
              3'h1: out_r = 16'hbef1;
              3'h2: out_r = 16'hbef2;
              3'h3: out_r = 16'hbef3;
              3'h4: out_r = 16'hbef4;
              3'h5: out_r = 16'hbef6;
              3'h6: out_r = 16'hbef7;
              3'h7: out_r = 16'hbef8;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbf00;
            case (mant_lo3)
              3'h0: out_r = 16'hbef9;
              3'h1: out_r = 16'hbefa;
              3'h2: out_r = 16'hbefb;
              3'h3: out_r = 16'hbefc;
              3'h4: out_r = 16'hbefd;
              3'h5: out_r = 16'hbefe;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbf01;
            case (mant_lo3)
              3'h2: out_r = 16'hbf02;
              3'h3: out_r = 16'hbf03;
              3'h4: out_r = 16'hbf03;
              3'h5: out_r = 16'hbf04;
              3'h6: out_r = 16'hbf04;
              3'h7: out_r = 16'hbf05;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbf05;
            case (mant_lo3)
              3'h1: out_r = 16'hbf07;
              3'h2: out_r = 16'hbf08;
              3'h3: out_r = 16'hbf09;
              3'h4: out_r = 16'hbf0a;
              3'h5: out_r = 16'hbf0b;
              3'h6: out_r = 16'hbf0c;
              3'h7: out_r = 16'hbf0d;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbf0e;
            case (mant_lo3)
              3'h1: out_r = 16'hbf10;
              3'h2: out_r = 16'hbf11;
              3'h3: out_r = 16'hbf12;
              3'h4: out_r = 16'hbf13;
              3'h5: out_r = 16'hbf14;
              3'h6: out_r = 16'hbf15;
              3'h7: out_r = 16'hbf17;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbf18;
            case (mant_lo3)
              3'h1: out_r = 16'hbf19;
              3'h2: out_r = 16'hbf1a;
              3'h3: out_r = 16'hbf1b;
              3'h4: out_r = 16'hbf1c;
              3'h5: out_r = 16'hbf1e;
              3'h6: out_r = 16'hbf1f;
              3'h7: out_r = 16'hbf20;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbf21;
            case (mant_lo3)
              3'h1: out_r = 16'hbf22;
              3'h2: out_r = 16'hbf23;
              3'h3: out_r = 16'hbf25;
              3'h4: out_r = 16'hbf26;
              3'h5: out_r = 16'hbf27;
              3'h6: out_r = 16'hbf28;
              3'h7: out_r = 16'hbf29;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbf2b;
            case (mant_lo3)
              3'h1: out_r = 16'hbf2c;
              3'h2: out_r = 16'hbf2d;
              3'h3: out_r = 16'hbf2e;
              3'h4: out_r = 16'hbf2f;
              3'h5: out_r = 16'hbf31;
              3'h6: out_r = 16'hbf32;
              3'h7: out_r = 16'hbf33;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbf34;
            case (mant_lo3)
              3'h1: out_r = 16'hbf36;
              3'h2: out_r = 16'hbf37;
              3'h3: out_r = 16'hbf38;
              3'h4: out_r = 16'hbf39;
              3'h5: out_r = 16'hbf3a;
              3'h6: out_r = 16'hbf3c;
              3'h7: out_r = 16'hbf3d;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbf3e;
            case (mant_lo3)
              3'h1: out_r = 16'hbf3f;
              3'h2: out_r = 16'hbf41;
              3'h3: out_r = 16'hbf42;
              3'h4: out_r = 16'hbf43;
              3'h5: out_r = 16'hbf44;
              3'h6: out_r = 16'hbf46;
              3'h7: out_r = 16'hbf47;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbf48;
            case (mant_lo3)
              3'h1: out_r = 16'hbf4a;
              3'h2: out_r = 16'hbf4b;
              3'h3: out_r = 16'hbf4c;
              3'h4: out_r = 16'hbf4d;
              3'h5: out_r = 16'hbf4f;
              3'h6: out_r = 16'hbf50;
              3'h7: out_r = 16'hbf51;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbf53;
            case (mant_lo3)
              3'h1: out_r = 16'hbf54;
              3'h2: out_r = 16'hbf55;
              3'h3: out_r = 16'hbf56;
              3'h4: out_r = 16'hbf58;
              3'h5: out_r = 16'hbf59;
              3'h6: out_r = 16'hbf5a;
              3'h7: out_r = 16'hbf5c;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbf5d;
            case (mant_lo3)
              3'h1: out_r = 16'hbf5e;
              3'h2: out_r = 16'hbf60;
              3'h3: out_r = 16'hbf61;
              3'h4: out_r = 16'hbf62;
              3'h5: out_r = 16'hbf64;
              3'h6: out_r = 16'hbf65;
              3'h7: out_r = 16'hbf66;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbf68;
            case (mant_lo3)
              3'h1: out_r = 16'hbf69;
              3'h2: out_r = 16'hbf6a;
              3'h3: out_r = 16'hbf6c;
              3'h4: out_r = 16'hbf6d;
              3'h5: out_r = 16'hbf6e;
              3'h6: out_r = 16'hbf70;
              3'h7: out_r = 16'hbf71;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbf73;
            case (mant_lo3)
              3'h1: out_r = 16'hbf74;
              3'h2: out_r = 16'hbf75;
              3'h3: out_r = 16'hbf77;
              3'h4: out_r = 16'hbf78;
              3'h5: out_r = 16'hbf79;
              3'h6: out_r = 16'hbf7b;
              3'h7: out_r = 16'hbf7c;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbf82;
            case (mant_lo3)
              3'h0: out_r = 16'hbf7e;
              3'h1: out_r = 16'hbf7f;
              3'h2: out_r = 16'hbf80;
              3'h3: out_r = 16'hbf81;
              3'h6: out_r = 16'hbf83;
              3'h7: out_r = 16'hbf84;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbf85;
            case (mant_lo3)
              3'h2: out_r = 16'hbf86;
              3'h3: out_r = 16'hbf87;
              3'h4: out_r = 16'hbf87;
              3'h5: out_r = 16'hbf88;
              3'h6: out_r = 16'hbf89;
              3'h7: out_r = 16'hbf8a;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbf8d;
            case (mant_lo3)
              3'h0: out_r = 16'hbf8a;
              3'h1: out_r = 16'hbf8b;
              3'h2: out_r = 16'hbf8c;
              3'h5: out_r = 16'hbf8e;
              3'h6: out_r = 16'hbf8f;
              3'h7: out_r = 16'hbf90;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbf93;
            case (mant_lo3)
              3'h0: out_r = 16'hbf90;
              3'h1: out_r = 16'hbf91;
              3'h2: out_r = 16'hbf92;
              3'h5: out_r = 16'hbf94;
              3'h6: out_r = 16'hbf95;
              3'h7: out_r = 16'hbf96;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbf96;
            case (mant_lo3)
              3'h1: out_r = 16'hbf98;
              3'h2: out_r = 16'hbf9a;
              3'h3: out_r = 16'hbf9b;
              3'h4: out_r = 16'hbf9d;
              3'h5: out_r = 16'hbf9e;
              3'h6: out_r = 16'hbfa0;
              3'h7: out_r = 16'hbfa1;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbfa3;
            case (mant_lo3)
              3'h1: out_r = 16'hbfa5;
              3'h2: out_r = 16'hbfa6;
              3'h3: out_r = 16'hbfa8;
              3'h4: out_r = 16'hbfaa;
              3'h5: out_r = 16'hbfab;
              3'h6: out_r = 16'hbfad;
              3'h7: out_r = 16'hbfaf;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbfb0;
            case (mant_lo3)
              3'h1: out_r = 16'hbfb2;
              3'h2: out_r = 16'hbfb4;
              3'h3: out_r = 16'hbfb6;
              3'h4: out_r = 16'hbfb7;
              3'h5: out_r = 16'hbfb9;
              3'h6: out_r = 16'hbfbb;
              3'h7: out_r = 16'hbfbd;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbfbe;
            case (mant_lo3)
              3'h1: out_r = 16'hbfc0;
              3'h2: out_r = 16'hbfc2;
              3'h3: out_r = 16'hbfc4;
              3'h4: out_r = 16'hbfc6;
              3'h5: out_r = 16'hbfc7;
              3'h6: out_r = 16'hbfc9;
              3'h7: out_r = 16'hbfcb;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbfcd;
            case (mant_lo3)
              3'h1: out_r = 16'hbfcf;
              3'h2: out_r = 16'hbfd1;
              3'h3: out_r = 16'hbfd3;
              3'h4: out_r = 16'hbfd5;
              3'h5: out_r = 16'hbfd7;
              3'h6: out_r = 16'hbfd9;
              3'h7: out_r = 16'hbfdb;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbfdd;
            case (mant_lo3)
              3'h1: out_r = 16'hbfdf;
              3'h2: out_r = 16'hbfe1;
              3'h3: out_r = 16'hbfe3;
              3'h4: out_r = 16'hbfe5;
              3'h5: out_r = 16'hbfe7;
              3'h6: out_r = 16'hbfe9;
              3'h7: out_r = 16'hbfeb;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbfed;
            case (mant_lo3)
              3'h1: out_r = 16'hbfef;
              3'h2: out_r = 16'hbff1;
              3'h3: out_r = 16'hbff3;
              3'h4: out_r = 16'hbff5;
              3'h5: out_r = 16'hbff8;
              3'h6: out_r = 16'hbffa;
              3'h7: out_r = 16'hbffc;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbffe;
            case (mant_lo3)
              3'h1: out_r = 16'hc000;
              3'h2: out_r = 16'hc001;
              3'h3: out_r = 16'hc002;
              3'h4: out_r = 16'hc004;
              3'h5: out_r = 16'hc005;
              3'h6: out_r = 16'hc006;
              3'h7: out_r = 16'hc007;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hc008;
            case (mant_lo3)
              3'h1: out_r = 16'hc009;
              3'h2: out_r = 16'hc00b;
              3'h3: out_r = 16'hc00c;
              3'h4: out_r = 16'hc00d;
              3'h5: out_r = 16'hc00e;
              3'h6: out_r = 16'hc00f;
              3'h7: out_r = 16'hc011;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hc012;
            case (mant_lo3)
              3'h1: out_r = 16'hc013;
              3'h2: out_r = 16'hc014;
              3'h3: out_r = 16'hc016;
              3'h4: out_r = 16'hc017;
              3'h5: out_r = 16'hc018;
              3'h6: out_r = 16'hc01a;
              3'h7: out_r = 16'hc01b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hc01c;
            case (mant_lo3)
              3'h1: out_r = 16'hc01e;
              3'h2: out_r = 16'hc01f;
              3'h3: out_r = 16'hc020;
              3'h4: out_r = 16'hc022;
              3'h5: out_r = 16'hc023;
              3'h6: out_r = 16'hc024;
              3'h7: out_r = 16'hc026;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hc027;
            case (mant_lo3)
              3'h1: out_r = 16'hc028;
              3'h2: out_r = 16'hc02a;
              3'h3: out_r = 16'hc02b;
              3'h4: out_r = 16'hc02d;
              3'h5: out_r = 16'hc02e;
              3'h6: out_r = 16'hc030;
              3'h7: out_r = 16'hc031;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hc033;
            case (mant_lo3)
              3'h1: out_r = 16'hc034;
              3'h2: out_r = 16'hc036;
              3'h3: out_r = 16'hc037;
              3'h4: out_r = 16'hc039;
              3'h5: out_r = 16'hc03a;
              3'h6: out_r = 16'hc03c;
              3'h7: out_r = 16'hc03d;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hc03f;
            case (mant_lo3)
              3'h1: out_r = 16'hc040;
              3'h2: out_r = 16'hc042;
              3'h3: out_r = 16'hc044;
              3'h4: out_r = 16'hc045;
              3'h5: out_r = 16'hc047;
              3'h6: out_r = 16'hc048;
              3'h7: out_r = 16'hc04a;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hc04c;
            case (mant_lo3)
              3'h1: out_r = 16'hc04d;
              3'h2: out_r = 16'hc04f;
              3'h3: out_r = 16'hc051;
              3'h4: out_r = 16'hc053;
              3'h5: out_r = 16'hc054;
              3'h6: out_r = 16'hc056;
              3'h7: out_r = 16'hc058;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hc05a;
            case (mant_lo3)
              3'h1: out_r = 16'hc05b;
              3'h2: out_r = 16'hc05d;
              3'h3: out_r = 16'hc05f;
              3'h4: out_r = 16'hc061;
              3'h5: out_r = 16'hc063;
              3'h6: out_r = 16'hc064;
              3'h7: out_r = 16'hc066;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hc068;
            case (mant_lo3)
              3'h1: out_r = 16'hc06c;
              3'h2: out_r = 16'hc070;
              3'h3: out_r = 16'hc074;
              3'h4: out_r = 16'hc078;
              3'h5: out_r = 16'hc07c;
              3'h6: out_r = 16'hc080;
              3'h7: out_r = 16'hc082;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hc084;
            case (mant_lo3)
              3'h1: out_r = 16'hc086;
              3'h2: out_r = 16'hc088;
              3'h3: out_r = 16'hc08b;
              3'h4: out_r = 16'hc08d;
              3'h5: out_r = 16'hc08f;
              3'h6: out_r = 16'hc091;
              3'h7: out_r = 16'hc094;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hc096;
            case (mant_lo3)
              3'h1: out_r = 16'hc099;
              3'h2: out_r = 16'hc09b;
              3'h3: out_r = 16'hc09d;
              3'h4: out_r = 16'hc0a0;
              3'h5: out_r = 16'hc0a3;
              3'h6: out_r = 16'hc0a5;
              3'h7: out_r = 16'hc0a8;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hc0ab;
            case (mant_lo3)
              3'h1: out_r = 16'hc0ad;
              3'h2: out_r = 16'hc0b0;
              3'h3: out_r = 16'hc0b3;
              3'h4: out_r = 16'hc0b6;
              3'h5: out_r = 16'hc0b9;
              3'h6: out_r = 16'hc0bc;
              3'h7: out_r = 16'hc0bf;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hc0c2;
            case (mant_lo3)
              3'h1: out_r = 16'hc0c5;
              3'h2: out_r = 16'hc0c8;
              3'h3: out_r = 16'hc0cb;
              3'h4: out_r = 16'hc0ce;
              3'h5: out_r = 16'hc0d2;
              3'h6: out_r = 16'hc0d5;
              3'h7: out_r = 16'hc0d8;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hc0dc;
            case (mant_lo3)
              3'h1: out_r = 16'hc0df;
              3'h2: out_r = 16'hc0e3;
              3'h3: out_r = 16'hc0e6;
              3'h4: out_r = 16'hc0ea;
              3'h5: out_r = 16'hc0ee;
              3'h6: out_r = 16'hc0f2;
              3'h7: out_r = 16'hc0f5;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hc0f9;
            case (mant_lo3)
              3'h1: out_r = 16'hc0fd;
              3'h2: out_r = 16'hc101;
              3'h3: out_r = 16'hc103;
              3'h4: out_r = 16'hc105;
              3'h5: out_r = 16'hc107;
              3'h6: out_r = 16'hc109;
              3'h7: out_r = 16'hc10b;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hc10d;
            case (mant_lo3)
              3'h1: out_r = 16'hc110;
              3'h2: out_r = 16'hc112;
              3'h3: out_r = 16'hc114;
              3'h4: out_r = 16'hc117;
              3'h5: out_r = 16'hc119;
              3'h6: out_r = 16'hc11b;
              3'h7: out_r = 16'hc11e;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hc120;
            case (mant_lo3)
              3'h1: out_r = 16'hc123;
              3'h2: out_r = 16'hc125;
              3'h3: out_r = 16'hc128;
              3'h4: out_r = 16'hc12b;
              3'h5: out_r = 16'hc12d;
              3'h6: out_r = 16'hc130;
              3'h7: out_r = 16'hc133;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hc136;
            case (mant_lo3)
              3'h1: out_r = 16'hc139;
              3'h2: out_r = 16'hc13c;
              3'h3: out_r = 16'hc13e;
              3'h4: out_r = 16'hc141;
              3'h5: out_r = 16'hc145;
              3'h6: out_r = 16'hc148;
              3'h7: out_r = 16'hc14b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hc14e;
            case (mant_lo3)
              3'h1: out_r = 16'hc151;
              3'h2: out_r = 16'hc155;
              3'h3: out_r = 16'hc158;
              3'h4: out_r = 16'hc15b;
              3'h5: out_r = 16'hc15f;
              3'h6: out_r = 16'hc162;
              3'h7: out_r = 16'hc166;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hc16a;
            case (mant_lo3)
              3'h1: out_r = 16'hc16d;
              3'h2: out_r = 16'hc171;
              3'h3: out_r = 16'hc175;
              3'h4: out_r = 16'hc179;
              3'h5: out_r = 16'hc17d;
              3'h6: out_r = 16'hc180;
              3'h7: out_r = 16'hc182;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hc184;
            case (mant_lo3)
              3'h1: out_r = 16'hc186;
              3'h2: out_r = 16'hc189;
              3'h3: out_r = 16'hc18b;
              3'h4: out_r = 16'hc18d;
              3'h5: out_r = 16'hc18f;
              3'h6: out_r = 16'hc191;
              3'h7: out_r = 16'hc194;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hc196;
            case (mant_lo3)
              3'h1: out_r = 16'hc198;
              3'h2: out_r = 16'hc19b;
              3'h3: out_r = 16'hc19d;
              3'h4: out_r = 16'hc1a0;
              3'h5: out_r = 16'hc1a2;
              3'h6: out_r = 16'hc1a5;
              3'h7: out_r = 16'hc1a7;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hc1aa;
            case (mant_lo3)
              3'h1: out_r = 16'hc1ad;
              3'h2: out_r = 16'hc1af;
              3'h3: out_r = 16'hc1b2;
              3'h4: out_r = 16'hc1b5;
              3'h5: out_r = 16'hc1b8;
              3'h6: out_r = 16'hc1bb;
              3'h7: out_r = 16'hc1be;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hc1c1;
            case (mant_lo3)
              3'h1: out_r = 16'hc1c4;
              3'h2: out_r = 16'hc1c7;
              3'h3: out_r = 16'hc1ca;
              3'h4: out_r = 16'hc1cd;
              3'h5: out_r = 16'hc1d0;
              3'h6: out_r = 16'hc1d4;
              3'h7: out_r = 16'hc1d7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hc1da;
            case (mant_lo3)
              3'h1: out_r = 16'hc1e1;
              3'h2: out_r = 16'hc1e8;
              3'h3: out_r = 16'hc1f0;
              3'h4: out_r = 16'hc1f7;
              3'h5: out_r = 16'hc1ff;
              3'h6: out_r = 16'hc204;
              3'h7: out_r = 16'hc208;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hc20c;
            case (mant_lo3)
              3'h1: out_r = 16'hc211;
              3'h2: out_r = 16'hc215;
              3'h3: out_r = 16'hc21a;
              3'h4: out_r = 16'hc21f;
              3'h5: out_r = 16'hc224;
              3'h6: out_r = 16'hc229;
              3'h7: out_r = 16'hc22e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hc234;
            case (mant_lo3)
              3'h1: out_r = 16'hc23a;
              3'h2: out_r = 16'hc240;
              3'h3: out_r = 16'hc246;
              3'h4: out_r = 16'hc24c;
              3'h5: out_r = 16'hc252;
              3'h6: out_r = 16'hc259;
              3'h7: out_r = 16'hc260;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hc267;
            case (mant_lo3)
              3'h1: out_r = 16'hc26e;
              3'h2: out_r = 16'hc276;
              3'h3: out_r = 16'hc27e;
              3'h4: out_r = 16'hc283;
              3'h5: out_r = 16'hc287;
              3'h6: out_r = 16'hc28b;
              3'h7: out_r = 16'hc290;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hc294;
            case (mant_lo3)
              3'h1: out_r = 16'hc299;
              3'h2: out_r = 16'hc29e;
              3'h3: out_r = 16'hc2a3;
              3'h4: out_r = 16'hc2a8;
              3'h5: out_r = 16'hc2ae;
              3'h6: out_r = 16'hc2b3;
              3'h7: out_r = 16'hc2b9;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hc2bf;
            case (mant_lo3)
              3'h1: out_r = 16'hc2c5;
              3'h2: out_r = 16'hc2cb;
              3'h3: out_r = 16'hc2d1;
              3'h4: out_r = 16'hc2d8;
              3'h5: out_r = 16'hc2df;
              3'h6: out_r = 16'hc2e6;
              3'h7: out_r = 16'hc2ed;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hc2f5;
            case (mant_lo3)
              3'h1: out_r = 16'hc2fc;
              3'h2: out_r = 16'hc302;
              3'h3: out_r = 16'hc306;
              3'h4: out_r = 16'hc30b;
              3'h5: out_r = 16'hc30f;
              3'h6: out_r = 16'hc314;
              3'h7: out_r = 16'hc318;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hc31d;
            case (mant_lo3)
              3'h1: out_r = 16'hc322;
              3'h2: out_r = 16'hc327;
              3'h3: out_r = 16'hc32d;
              3'h4: out_r = 16'hc332;
              3'h5: out_r = 16'hc338;
              3'h6: out_r = 16'hc33d;
              3'h7: out_r = 16'hc344;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hc34a;
            case (mant_lo3)
              3'h1: out_r = 16'hc350;
              3'h2: out_r = 16'hc357;
              3'h3: out_r = 16'hc35e;
              3'h4: out_r = 16'hc365;
              3'h5: out_r = 16'hc36c;
              3'h6: out_r = 16'hc373;
              3'h7: out_r = 16'hc37b;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hc382;
            case (mant_lo3)
              3'h1: out_r = 16'hc386;
              3'h2: out_r = 16'hc38a;
              3'h3: out_r = 16'hc38e;
              3'h4: out_r = 16'hc393;
              3'h5: out_r = 16'hc397;
              3'h6: out_r = 16'hc39c;
              3'h7: out_r = 16'hc3a1;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hc3a6;
            case (mant_lo3)
              3'h1: out_r = 16'hc3ac;
              3'h2: out_r = 16'hc3b1;
              3'h3: out_r = 16'hc3b7;
              3'h4: out_r = 16'hc3bc;
              3'h5: out_r = 16'hc3c2;
              3'h6: out_r = 16'hc3c9;
              3'h7: out_r = 16'hc3cf;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hc3d6;
            case (mant_lo3)
              3'h1: out_r = 16'hc3dc;
              3'h2: out_r = 16'hc3e3;
              3'h3: out_r = 16'hc3ea;
              3'h4: out_r = 16'hc3f2;
              3'h5: out_r = 16'hc3fa;
              3'h6: out_r = 16'hc401;
              3'h7: out_r = 16'hc405;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hc409;
            case (mant_lo3)
              3'h1: out_r = 16'hc40d;
              3'h2: out_r = 16'hc412;
              3'h3: out_r = 16'hc417;
              3'h4: out_r = 16'hc41b;
              3'h5: out_r = 16'hc420;
              3'h6: out_r = 16'hc425;
              3'h7: out_r = 16'hc42b;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hc430;
            case (mant_lo3)
              3'h1: out_r = 16'hc436;
              3'h2: out_r = 16'hc43b;
              3'h3: out_r = 16'hc441;
              3'h4: out_r = 16'hc447;
              3'h5: out_r = 16'hc44e;
              3'h6: out_r = 16'hc454;
              3'h7: out_r = 16'hc45b;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hc462;
            case (mant_lo3)
              3'h1: out_r = 16'hc469;
              3'h2: out_r = 16'hc471;
              3'h3: out_r = 16'hc478;
              3'h4: out_r = 16'hc480;
              3'h5: out_r = 16'hc484;
              3'h6: out_r = 16'hc488;
              3'h7: out_r = 16'hc48d;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hc491;
            case (mant_lo3)
              3'h1: out_r = 16'hc496;
              3'h2: out_r = 16'hc49a;
              3'h3: out_r = 16'hc49f;
              3'h4: out_r = 16'hc4a4;
              3'h5: out_r = 16'hc4aa;
              3'h6: out_r = 16'hc4af;
              3'h7: out_r = 16'hc4b5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hc4ba;
            case (mant_lo3)
              3'h1: out_r = 16'hc4c6;
              3'h2: out_r = 16'hc4d3;
              3'h3: out_r = 16'hc4e1;
              3'h4: out_r = 16'hc4ef;
              3'h5: out_r = 16'hc4ff;
              3'h6: out_r = 16'hc508;
              3'h7: out_r = 16'hc510;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hc51a;
            case (mant_lo3)
              3'h1: out_r = 16'hc523;
              3'h2: out_r = 16'hc52e;
              3'h3: out_r = 16'hc539;
              3'h4: out_r = 16'hc545;
              3'h5: out_r = 16'hc552;
              3'h6: out_r = 16'hc55f;
              3'h7: out_r = 16'hc56e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hc57d;
            case (mant_lo3)
              3'h1: out_r = 16'hc587;
              3'h2: out_r = 16'hc58f;
              3'h3: out_r = 16'hc599;
              3'h4: out_r = 16'hc5a3;
              3'h5: out_r = 16'hc5ad;
              3'h6: out_r = 16'hc5b8;
              3'h7: out_r = 16'hc5c4;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hc5d1;
            case (mant_lo3)
              3'h1: out_r = 16'hc5de;
              3'h2: out_r = 16'hc5ed;
              3'h3: out_r = 16'hc5fc;
              3'h4: out_r = 16'hc606;
              3'h5: out_r = 16'hc60f;
              3'h6: out_r = 16'hc618;
              3'h7: out_r = 16'hc622;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hc62c;
            case (mant_lo3)
              3'h1: out_r = 16'hc637;
              3'h2: out_r = 16'hc643;
              3'h3: out_r = 16'hc650;
              3'h4: out_r = 16'hc65d;
              3'h5: out_r = 16'hc66b;
              3'h6: out_r = 16'hc67a;
              3'h7: out_r = 16'hc685;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hc68e;
            case (mant_lo3)
              3'h1: out_r = 16'hc697;
              3'h2: out_r = 16'hc6a1;
              3'h3: out_r = 16'hc6ab;
              3'h4: out_r = 16'hc6b6;
              3'h5: out_r = 16'hc6c2;
              3'h6: out_r = 16'hc6ce;
              3'h7: out_r = 16'hc6dc;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hc6ea;
            case (mant_lo3)
              3'h1: out_r = 16'hc6f9;
              3'h2: out_r = 16'hc705;
              3'h3: out_r = 16'hc70d;
              3'h4: out_r = 16'hc716;
              3'h5: out_r = 16'hc720;
              3'h6: out_r = 16'hc72a;
              3'h7: out_r = 16'hc735;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hc741;
            case (mant_lo3)
              3'h1: out_r = 16'hc74d;
              3'h2: out_r = 16'hc75a;
              3'h3: out_r = 16'hc769;
              3'h4: out_r = 16'hc778;
              3'h5: out_r = 16'hc784;
              3'h6: out_r = 16'hc78c;
              3'h7: out_r = 16'hc795;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hc79f;
            case (mant_lo3)
              3'h1: out_r = 16'hc7a9;
              3'h2: out_r = 16'hc7b4;
              3'h3: out_r = 16'hc7c0;
              3'h4: out_r = 16'hc7cc;
              3'h5: out_r = 16'hc7d9;
              3'h6: out_r = 16'hc7e7;
              3'h7: out_r = 16'hc7f6;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hc803;
            case (mant_lo3)
              3'h1: out_r = 16'hc80b;
              3'h2: out_r = 16'hc814;
              3'h3: out_r = 16'hc81e;
              3'h4: out_r = 16'hc828;
              3'h5: out_r = 16'hc833;
              3'h6: out_r = 16'hc83f;
              3'h7: out_r = 16'hc84b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hc858;
            case (mant_lo3)
              3'h1: out_r = 16'hc866;
              3'h2: out_r = 16'hc875;
              3'h3: out_r = 16'hc882;
              3'h4: out_r = 16'hc88b;
              3'h5: out_r = 16'hc894;
              3'h6: out_r = 16'hc89d;
              3'h7: out_r = 16'hc8a7;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hc8b2;
            case (mant_lo3)
              3'h1: out_r = 16'hc8be;
              3'h2: out_r = 16'hc8ca;
              3'h3: out_r = 16'hc8d7;
              3'h4: out_r = 16'hc8e5;
              3'h5: out_r = 16'hc8f3;
              3'h6: out_r = 16'hc902;
              3'h7: out_r = 16'hc90a;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hc913;
            case (mant_lo3)
              3'h1: out_r = 16'hc91c;
              3'h2: out_r = 16'hc926;
              3'h3: out_r = 16'hc931;
              3'h4: out_r = 16'hc93c;
              3'h5: out_r = 16'hc949;
              3'h6: out_r = 16'hc956;
              3'h7: out_r = 16'hc963;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hc972;
            case (mant_lo3)
              3'h1: out_r = 16'hc981;
              3'h2: out_r = 16'hc989;
              3'h3: out_r = 16'hc992;
              3'h4: out_r = 16'hc99b;
              3'h5: out_r = 16'hc9a5;
              3'h6: out_r = 16'hc9b0;
              3'h7: out_r = 16'hc9bb;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hc9c8;
            case (mant_lo3)
              3'h1: out_r = 16'hc9d4;
              3'h2: out_r = 16'hc9e2;
              3'h3: out_r = 16'hc9f1;
              3'h4: out_r = 16'hca00;
              3'h5: out_r = 16'hca08;
              3'h6: out_r = 16'hca11;
              3'h7: out_r = 16'hca1b;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hca24;
            case (mant_lo3)
              3'h1: out_r = 16'hca2f;
              3'h2: out_r = 16'hca3a;
              3'h3: out_r = 16'hca46;
              3'h4: out_r = 16'hca53;
              3'h5: out_r = 16'hca61;
              3'h6: out_r = 16'hca6f;
              3'h7: out_r = 16'hca7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hca88;
            case (mant_lo3)
              3'h1: out_r = 16'hca9a;
              3'h2: out_r = 16'hcaae;
              3'h3: out_r = 16'hcac5;
              3'h4: out_r = 16'hcae0;
              3'h5: out_r = 16'hcafd;
              3'h6: out_r = 16'hcb10;
              3'h7: out_r = 16'hcb23;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hcb38;
            case (mant_lo3)
              3'h1: out_r = 16'hcb51;
              3'h2: out_r = 16'hcb6d;
              3'h3: out_r = 16'hcb86;
              3'h4: out_r = 16'hcb98;
              3'h5: out_r = 16'hcbac;
              3'h6: out_r = 16'hcbc3;
              3'h7: out_r = 16'hcbdd;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hcbfa;
            case (mant_lo3)
              3'h1: out_r = 16'hcc0e;
              3'h2: out_r = 16'hcc21;
              3'h3: out_r = 16'hcc36;
              3'h4: out_r = 16'hcc4e;
              3'h5: out_r = 16'hcc6a;
              3'h6: out_r = 16'hcc85;
              3'h7: out_r = 16'hcc96;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hccaa;
            case (mant_lo3)
              3'h1: out_r = 16'hccc1;
              3'h2: out_r = 16'hccdb;
              3'h3: out_r = 16'hccf8;
              3'h4: out_r = 16'hcd0c;
              3'h5: out_r = 16'hcd1f;
              3'h6: out_r = 16'hcd34;
              3'h7: out_r = 16'hcd4c;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hcd67;
            case (mant_lo3)
              3'h1: out_r = 16'hcd83;
              3'h2: out_r = 16'hcd95;
              3'h3: out_r = 16'hcda8;
              3'h4: out_r = 16'hcdbf;
              3'h5: out_r = 16'hcdd8;
              3'h6: out_r = 16'hcdf5;
              3'h7: out_r = 16'hce0b;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hce1d;
            case (mant_lo3)
              3'h1: out_r = 16'hce32;
              3'h2: out_r = 16'hce4a;
              3'h3: out_r = 16'hce65;
              3'h4: out_r = 16'hce82;
              3'h5: out_r = 16'hce93;
              3'h6: out_r = 16'hcea6;
              3'h7: out_r = 16'hcebd;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hced6;
            case (mant_lo3)
              3'h1: out_r = 16'hcef2;
              3'h2: out_r = 16'hcf09;
              3'h3: out_r = 16'hcf1b;
              3'h4: out_r = 16'hcf30;
              3'h5: out_r = 16'hcf48;
              3'h6: out_r = 16'hcf62;
              3'h7: out_r = 16'hcf80;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hcf91;
            case (mant_lo3)
              3'h1: out_r = 16'hcfa5;
              3'h2: out_r = 16'hcfba;
              3'h3: out_r = 16'hcfd3;
              3'h4: out_r = 16'hcfef;
              3'h5: out_r = 16'hd008;
              3'h6: out_r = 16'hd01a;
              3'h7: out_r = 16'hd02e;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hd045;
            case (mant_lo3)
              3'h1: out_r = 16'hd060;
              3'h2: out_r = 16'hd07d;
              3'h3: out_r = 16'hd090;
              3'h4: out_r = 16'hd0a3;
              3'h5: out_r = 16'hd0b8;
              3'h6: out_r = 16'hd0d1;
              3'h7: out_r = 16'hd0ed;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hd106;
            case (mant_lo3)
              3'h1: out_r = 16'hd118;
              3'h2: out_r = 16'hd12c;
              3'h3: out_r = 16'hd143;
              3'h4: out_r = 16'hd15d;
              3'h5: out_r = 16'hd17b;
              3'h6: out_r = 16'hd18e;
              3'h7: out_r = 16'hd1a1;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hd1b6;
            case (mant_lo3)
              3'h1: out_r = 16'hd1cf;
              3'h2: out_r = 16'hd1ea;
              3'h3: out_r = 16'hd205;
              3'h4: out_r = 16'hd216;
              3'h5: out_r = 16'hd22a;
              3'h6: out_r = 16'hd241;
              3'h7: out_r = 16'hd25b;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hd278;
            case (mant_lo3)
              3'h1: out_r = 16'hd28c;
              3'h2: out_r = 16'hd29f;
              3'h3: out_r = 16'hd2b4;
              3'h4: out_r = 16'hd2cc;
              3'h5: out_r = 16'hd2e7;
              3'h6: out_r = 16'hd303;
              3'h7: out_r = 16'hd315;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hd328;
            case (mant_lo3)
              3'h1: out_r = 16'hd33f;
              3'h2: out_r = 16'hd358;
              3'h3: out_r = 16'hd375;
              3'h4: out_r = 16'hd38b;
              3'h5: out_r = 16'hd39d;
              3'h6: out_r = 16'hd3b2;
              3'h7: out_r = 16'hd3ca;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hd3e5;
            case (mant_lo3)
              3'h1: out_r = 16'hd402;
              3'h2: out_r = 16'hd413;
              3'h3: out_r = 16'hd426;
              3'h4: out_r = 16'hd43d;
              3'h5: out_r = 16'hd456;
              3'h6: out_r = 16'hd472;
              3'h7: out_r = 16'hd489;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hd49c;
            case (mant_lo3)
              3'h1: out_r = 16'hd4b0;
              3'h2: out_r = 16'hd4c8;
              3'h3: out_r = 16'hd4e2;
              3'h4: out_r = 16'hd500;
              3'h5: out_r = 16'hd511;
              3'h6: out_r = 16'hd525;
              3'h7: out_r = 16'hd53b;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hd553;
            case (mant_lo3)
              3'h1: out_r = 16'hd570;
              3'h2: out_r = 16'hd588;
              3'h3: out_r = 16'hd59a;
              3'h4: out_r = 16'hd5ae;
              3'h5: out_r = 16'hd5c5;
              3'h6: out_r = 16'hd5e0;
              3'h7: out_r = 16'hd5fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hd610;
            case (mant_lo3)
              3'h1: out_r = 16'hd638;
              3'h2: out_r = 16'hd66d;
              3'h3: out_r = 16'hd698;
              3'h4: out_r = 16'hd6c3;
              3'h5: out_r = 16'hd6fb;
              3'h6: out_r = 16'hd721;
              3'h7: out_r = 16'hd74f;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hd785;
            case (mant_lo3)
              3'h1: out_r = 16'hd7aa;
              3'h2: out_r = 16'hd7db;
              3'h3: out_r = 16'hd80c;
              3'h4: out_r = 16'hd834;
              3'h5: out_r = 16'hd868;
              3'h6: out_r = 16'hd895;
              3'h7: out_r = 16'hd8bf;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hd8f5;
            case (mant_lo3)
              3'h1: out_r = 16'hd91d;
              3'h2: out_r = 16'hd94a;
              3'h3: out_r = 16'hd982;
              3'h4: out_r = 16'hd9a7;
              3'h5: out_r = 16'hd9d6;
              3'h6: out_r = 16'hda09;
              3'h7: out_r = 16'hda30;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hda62;
            case (mant_lo3)
              3'h1: out_r = 16'hda91;
              3'h2: out_r = 16'hdabb;
              3'h3: out_r = 16'hdaf0;
              3'h4: out_r = 16'hdb1a;
              3'h5: out_r = 16'hdb46;
              3'h6: out_r = 16'hdb7e;
              3'h7: out_r = 16'hdba3;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hdbd1;
            case (mant_lo3)
              3'h1: out_r = 16'hdc06;
              3'h2: out_r = 16'hdc2c;
              3'h3: out_r = 16'hdc5d;
              3'h4: out_r = 16'hdc8e;
              3'h5: out_r = 16'hdcb6;
              3'h6: out_r = 16'hdcea;
              3'h7: out_r = 16'hdd16;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hdd41;
            case (mant_lo3)
              3'h1: out_r = 16'hdd78;
              3'h2: out_r = 16'hdd9f;
              3'h3: out_r = 16'hddcc;
              3'h4: out_r = 16'hde03;
              3'h5: out_r = 16'hde28;
              3'h6: out_r = 16'hde58;
              3'h7: out_r = 16'hde8b;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hdeb2;
            case (mant_lo3)
              3'h1: out_r = 16'hdee5;
              3'h2: out_r = 16'hdf13;
              3'h3: out_r = 16'hdf3d;
              3'h4: out_r = 16'hdf72;
              3'h5: out_r = 16'hdf9c;
              3'h6: out_r = 16'hdfc8;
              3'h7: out_r = 16'he000;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'he025;
            case (mant_lo3)
              3'h1: out_r = 16'he054;
              3'h2: out_r = 16'he088;
              3'h3: out_r = 16'he0ae;
              3'h4: out_r = 16'he0e0;
              3'h5: out_r = 16'he110;
              3'h6: out_r = 16'he139;
              3'h7: out_r = 16'he16d;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'he198;
            case (mant_lo3)
              3'h1: out_r = 16'he1c3;
              3'h2: out_r = 16'he1fb;
              3'h3: out_r = 16'he221;
              3'h4: out_r = 16'he24f;
              3'h5: out_r = 16'he285;
              3'h6: out_r = 16'he2aa;
              3'h7: out_r = 16'he2db;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'he30d;
            case (mant_lo3)
              3'h1: out_r = 16'he334;
              3'h2: out_r = 16'he368;
              3'h3: out_r = 16'he395;
              3'h4: out_r = 16'he3bf;
              3'h5: out_r = 16'he3f5;
              3'h6: out_r = 16'he41d;
              3'h7: out_r = 16'he44a;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'he482;
            case (mant_lo3)
              3'h1: out_r = 16'he4a7;
              3'h2: out_r = 16'he4d6;
              3'h3: out_r = 16'he509;
              3'h4: out_r = 16'he530;
              3'h5: out_r = 16'he563;
              3'h6: out_r = 16'he591;
              3'h7: out_r = 16'he5bb;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'he5f0;
            case (mant_lo3)
              3'h1: out_r = 16'he61a;
              3'h2: out_r = 16'he646;
              3'h3: out_r = 16'he67e;
              3'h4: out_r = 16'he6a3;
              3'h5: out_r = 16'he6d1;
              3'h6: out_r = 16'he706;
              3'h7: out_r = 16'he72c;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'he75d;
            case (mant_lo3)
              3'h1: out_r = 16'he78e;
              3'h2: out_r = 16'he7b7;
              3'h3: out_r = 16'he7ea;
              3'h4: out_r = 16'he816;
              3'h5: out_r = 16'he841;
              3'h6: out_r = 16'he878;
              3'h7: out_r = 16'he89f;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'he8cd;
            case (mant_lo3)
              3'h1: out_r = 16'he903;
              3'h2: out_r = 16'he929;
              3'h3: out_r = 16'he959;
              3'h4: out_r = 16'he98b;
              3'h5: out_r = 16'he9b2;
              3'h6: out_r = 16'he9e5;
              3'h7: out_r = 16'hea13;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hea3d;
            case (mant_lo3)
              3'h1: out_r = 16'hea73;
              3'h2: out_r = 16'hea9c;
              3'h3: out_r = 16'heac8;
              3'h4: out_r = 16'heb00;
              3'h5: out_r = 16'heb25;
              3'h6: out_r = 16'heb54;
              3'h7: out_r = 16'heb88;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hebaf;
            case (mant_lo3)
              3'h1: out_r = 16'hebe0;
              3'h2: out_r = 16'hec10;
              3'h3: out_r = 16'hec39;
              3'h4: out_r = 16'hec6d;
              3'h5: out_r = 16'hec98;
              3'h6: out_r = 16'hecc4;
              3'h7: out_r = 16'hecfb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hed21;
            case (mant_lo3)
              3'h1: out_r = 16'hed85;
              3'h2: out_r = 16'heddb;
              3'h3: out_r = 16'hee35;
              3'h4: out_r = 16'hee95;
              3'h5: out_r = 16'heef5;
              3'h6: out_r = 16'hef4a;
              3'h7: out_r = 16'hefa7;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hf009;
            case (mant_lo3)
              3'h1: out_r = 16'hf063;
              3'h2: out_r = 16'hf0bb;
              3'h3: out_r = 16'hf11a;
              3'h4: out_r = 16'hf17e;
              3'h5: out_r = 16'hf1d1;
              3'h6: out_r = 16'hf22d;
              3'h7: out_r = 16'hf28e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hf2eb;
            case (mant_lo3)
              3'h1: out_r = 16'hf341;
              3'h2: out_r = 16'hf39f;
              3'h3: out_r = 16'hf403;
              3'h4: out_r = 16'hf459;
              3'h5: out_r = 16'hf4b3;
              3'h6: out_r = 16'hf513;
              3'h7: out_r = 16'hf573;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hf5c8;
            case (mant_lo3)
              3'h1: out_r = 16'hf625;
              3'h2: out_r = 16'hf688;
              3'h3: out_r = 16'hf6e0;
              3'h4: out_r = 16'hf739;
              3'h5: out_r = 16'hf798;
              3'h6: out_r = 16'hf7fb;
              3'h7: out_r = 16'hf84f;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hf8ab;
            case (mant_lo3)
              3'h1: out_r = 16'hf90d;
              3'h2: out_r = 16'hf968;
              3'h3: out_r = 16'hf9bf;
              3'h4: out_r = 16'hfa1e;
              3'h5: out_r = 16'hfa82;
              3'h6: out_r = 16'hfad6;
              3'h7: out_r = 16'hfb31;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hfb92;
            case (mant_lo3)
              3'h1: out_r = 16'hfbf0;
              3'h2: out_r = 16'hfc46;
              3'h3: out_r = 16'hfca3;
              3'h4: out_r = 16'hfd07;
              3'h5: out_r = 16'hfd5e;
              3'h6: out_r = 16'hfdb7;
              3'h7: out_r = 16'hfe17;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hff80;
            case (mant_lo3)
              3'h0: out_r = 16'hfe79;
              3'h1: out_r = 16'hfecd;
              3'h2: out_r = 16'hff29;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hff80;
          end
          4'h8: begin
            out_r = 16'hff80;
          end
          4'h9: begin
            out_r = 16'hff80;
          end
          4'ha: begin
            out_r = 16'hff80;
          end
          4'hb: begin
            out_r = 16'hff80;
          end
          4'hc: begin
            out_r = 16'hff80;
          end
          4'hd: begin
            out_r = 16'hff80;
          end
          4'he: begin
            out_r = 16'hff80;
          end
          4'hf: begin
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
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo3)
              3'h0: out_r = in;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h7fc0;
          end
          4'h2: begin
            out_r = 16'h7fc0;
          end
          4'h3: begin
            out_r = 16'h7fc0;
          end
          4'h4: begin
            out_r = 16'h7fc0;
          end
          4'h5: begin
            out_r = 16'h7fc0;
          end
          4'h6: begin
            out_r = 16'h7fc0;
          end
          4'h7: begin
            out_r = 16'h7fc0;
          end
          4'h8: begin
            out_r = 16'h7fc0;
          end
          4'h9: begin
            out_r = 16'h7fc0;
          end
          4'ha: begin
            out_r = 16'h7fc0;
          end
          4'hb: begin
            out_r = 16'h7fc0;
          end
          4'hc: begin
            out_r = 16'h7fc0;
          end
          4'hd: begin
            out_r = 16'h7fc0;
          end
          4'he: begin
            out_r = 16'h7fc0;
          end
          4'hf: begin
            out_r = 16'h7fc0;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = out_r;
endmodule
