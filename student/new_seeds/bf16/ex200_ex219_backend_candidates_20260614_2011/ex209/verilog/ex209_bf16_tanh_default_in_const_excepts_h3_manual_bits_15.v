module ex209_bf16_tanh_default_in_const_excepts_h3_manual_bits_15(in, out);
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
          3'h3: begin
            out_r = 16'h3db8;
            case (mant_lo4)
              4'h0: out_r = in;
              4'h1: out_r = in;
              4'h2: out_r = in;
              4'h3: out_r = in;
              4'h4: out_r = in;
              4'h5: out_r = in;
              4'h6: out_r = in;
              4'h7: out_r = in;
              4'ha: out_r = 16'h3db9;
              4'hb: out_r = 16'h3dba;
              4'hc: out_r = 16'h3dbb;
              4'hd: out_r = 16'h3dbc;
              4'he: out_r = 16'h3dbd;
              4'hf: out_r = 16'h3dbe;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3dbf;
            case (mant_lo4)
              4'h1: out_r = 16'h3dc0;
              4'h2: out_r = 16'h3dc1;
              4'h3: out_r = 16'h3dc2;
              4'h4: out_r = 16'h3dc3;
              4'h5: out_r = 16'h3dc4;
              4'h6: out_r = 16'h3dc5;
              4'h7: out_r = 16'h3dc6;
              4'h8: out_r = 16'h3dc7;
              4'h9: out_r = 16'h3dc8;
              4'ha: out_r = 16'h3dc9;
              4'hb: out_r = 16'h3dca;
              4'hc: out_r = 16'h3dcb;
              4'hd: out_r = 16'h3dcc;
              4'he: out_r = 16'h3dcd;
              4'hf: out_r = 16'h3dce;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3dcf;
            case (mant_lo4)
              4'h1: out_r = 16'h3dd0;
              4'h2: out_r = 16'h3dd1;
              4'h3: out_r = 16'h3dd2;
              4'h4: out_r = 16'h3dd3;
              4'h5: out_r = 16'h3dd4;
              4'h6: out_r = 16'h3dd5;
              4'h7: out_r = 16'h3dd6;
              4'h8: out_r = 16'h3dd7;
              4'h9: out_r = 16'h3dd8;
              4'ha: out_r = 16'h3dd9;
              4'hb: out_r = 16'h3dda;
              4'hc: out_r = 16'h3ddb;
              4'hd: out_r = 16'h3ddc;
              4'he: out_r = 16'h3ddd;
              4'hf: out_r = 16'h3dde;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ddf;
            case (mant_lo4)
              4'h1: out_r = 16'h3de0;
              4'h2: out_r = 16'h3de1;
              4'h3: out_r = 16'h3de2;
              4'h4: out_r = 16'h3de3;
              4'h5: out_r = 16'h3de4;
              4'h6: out_r = 16'h3de5;
              4'h7: out_r = 16'h3de6;
              4'h8: out_r = 16'h3de7;
              4'h9: out_r = 16'h3de8;
              4'ha: out_r = 16'h3de9;
              4'hb: out_r = 16'h3dea;
              4'hc: out_r = 16'h3deb;
              4'hd: out_r = 16'h3dec;
              4'he: out_r = 16'h3ded;
              4'hf: out_r = 16'h3dee;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3def;
            case (mant_lo4)
              4'h1: out_r = 16'h3df0;
              4'h2: out_r = 16'h3df1;
              4'h3: out_r = 16'h3df2;
              4'h4: out_r = 16'h3df3;
              4'h5: out_r = 16'h3df4;
              4'h6: out_r = 16'h3df5;
              4'h7: out_r = 16'h3df6;
              4'h8: out_r = 16'h3df7;
              4'h9: out_r = 16'h3df8;
              4'ha: out_r = 16'h3df9;
              4'hb: out_r = 16'h3dfa;
              4'hc: out_r = 16'h3dfb;
              4'hd: out_r = 16'h3dfc;
              4'he: out_r = 16'h3dfd;
              4'hf: out_r = 16'h3dfe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3dff;
            case (mant_lo4)
              4'h1: out_r = 16'h3e00;
              4'h2: out_r = 16'h3e01;
              4'h3: out_r = 16'h3e02;
              4'h4: out_r = 16'h3e03;
              4'h5: out_r = 16'h3e04;
              4'h6: out_r = 16'h3e05;
              4'h7: out_r = 16'h3e06;
              4'h8: out_r = 16'h3e07;
              4'h9: out_r = 16'h3e08;
              4'ha: out_r = 16'h3e09;
              4'hb: out_r = 16'h3e0a;
              4'hc: out_r = 16'h3e0b;
              4'hd: out_r = 16'h3e0c;
              4'he: out_r = 16'h3e0d;
              4'hf: out_r = 16'h3e0e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3e0f;
            case (mant_lo4)
              4'h1: out_r = 16'h3e10;
              4'h2: out_r = 16'h3e11;
              4'h3: out_r = 16'h3e12;
              4'h4: out_r = 16'h3e13;
              4'h5: out_r = 16'h3e14;
              4'h6: out_r = 16'h3e15;
              4'h7: out_r = 16'h3e16;
              4'h8: out_r = 16'h3e17;
              4'h9: out_r = 16'h3e18;
              4'ha: out_r = 16'h3e19;
              4'hb: out_r = 16'h3e1a;
              4'hc: out_r = 16'h3e1b;
              4'hd: out_r = 16'h3e1c;
              4'he: out_r = 16'h3e1d;
              4'hf: out_r = 16'h3e1e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3e27;
            case (mant_lo4)
              4'h0: out_r = 16'h3e1f;
              4'h1: out_r = 16'h3e20;
              4'h2: out_r = 16'h3e21;
              4'h3: out_r = 16'h3e22;
              4'h4: out_r = 16'h3e23;
              4'h5: out_r = 16'h3e24;
              4'h6: out_r = 16'h3e25;
              4'h7: out_r = 16'h3e26;
              4'ha: out_r = 16'h3e28;
              4'hb: out_r = 16'h3e29;
              4'hc: out_r = 16'h3e2a;
              4'hd: out_r = 16'h3e2b;
              4'he: out_r = 16'h3e2c;
              4'hf: out_r = 16'h3e2d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3e2e;
            case (mant_lo4)
              4'h1: out_r = 16'h3e2f;
              4'h2: out_r = 16'h3e30;
              4'h3: out_r = 16'h3e31;
              4'h4: out_r = 16'h3e32;
              4'h5: out_r = 16'h3e33;
              4'h6: out_r = 16'h3e34;
              4'h7: out_r = 16'h3e35;
              4'h8: out_r = 16'h3e36;
              4'h9: out_r = 16'h3e37;
              4'ha: out_r = 16'h3e38;
              4'hb: out_r = 16'h3e39;
              4'hc: out_r = 16'h3e3a;
              4'hd: out_r = 16'h3e3b;
              4'he: out_r = 16'h3e3c;
              4'hf: out_r = 16'h3e3d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3e45;
            case (mant_lo4)
              4'h0: out_r = 16'h3e3e;
              4'h1: out_r = 16'h3e3f;
              4'h2: out_r = 16'h3e40;
              4'h3: out_r = 16'h3e41;
              4'h4: out_r = 16'h3e42;
              4'h5: out_r = 16'h3e43;
              4'h6: out_r = 16'h3e44;
              4'h9: out_r = 16'h3e46;
              4'ha: out_r = 16'h3e47;
              4'hb: out_r = 16'h3e48;
              4'hc: out_r = 16'h3e49;
              4'hd: out_r = 16'h3e4a;
              4'he: out_r = 16'h3e4b;
              4'hf: out_r = 16'h3e4c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3e4d;
            case (mant_lo4)
              4'h1: out_r = 16'h3e4e;
              4'h2: out_r = 16'h3e4f;
              4'h3: out_r = 16'h3e50;
              4'h4: out_r = 16'h3e51;
              4'h5: out_r = 16'h3e52;
              4'h6: out_r = 16'h3e53;
              4'h7: out_r = 16'h3e54;
              4'h8: out_r = 16'h3e55;
              4'h9: out_r = 16'h3e56;
              4'ha: out_r = 16'h3e57;
              4'hb: out_r = 16'h3e58;
              4'hc: out_r = 16'h3e59;
              4'hd: out_r = 16'h3e5a;
              4'he: out_r = 16'h3e5b;
              4'hf: out_r = 16'h3e5c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3e5c;
            case (mant_lo4)
              4'h1: out_r = 16'h3e5d;
              4'h2: out_r = 16'h3e5e;
              4'h3: out_r = 16'h3e5f;
              4'h4: out_r = 16'h3e60;
              4'h5: out_r = 16'h3e61;
              4'h6: out_r = 16'h3e62;
              4'h7: out_r = 16'h3e63;
              4'h8: out_r = 16'h3e64;
              4'h9: out_r = 16'h3e65;
              4'ha: out_r = 16'h3e66;
              4'hb: out_r = 16'h3e67;
              4'hc: out_r = 16'h3e68;
              4'hd: out_r = 16'h3e69;
              4'he: out_r = 16'h3e6a;
              4'hf: out_r = 16'h3e6b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3e6f;
            case (mant_lo4)
              4'h0: out_r = 16'h3e6c;
              4'h1: out_r = 16'h3e6d;
              4'h2: out_r = 16'h3e6e;
              4'h5: out_r = 16'h3e70;
              4'h6: out_r = 16'h3e71;
              4'h7: out_r = 16'h3e72;
              4'h8: out_r = 16'h3e73;
              4'h9: out_r = 16'h3e74;
              4'ha: out_r = 16'h3e75;
              4'hb: out_r = 16'h3e76;
              4'hc: out_r = 16'h3e77;
              4'hd: out_r = 16'h3e78;
              4'he: out_r = 16'h3e79;
              4'hf: out_r = 16'h3e7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3e8a;
            case (mant_lo4)
              4'h0: out_r = 16'h3e7b;
              4'h1: out_r = 16'h3e7d;
              4'h2: out_r = 16'h3e7f;
              4'h3: out_r = 16'h3e80;
              4'h4: out_r = 16'h3e81;
              4'h5: out_r = 16'h3e82;
              4'h6: out_r = 16'h3e83;
              4'h7: out_r = 16'h3e84;
              4'h8: out_r = 16'h3e85;
              4'h9: out_r = 16'h3e86;
              4'ha: out_r = 16'h3e87;
              4'hb: out_r = 16'h3e88;
              4'hc: out_r = 16'h3e89;
              4'hf: out_r = 16'h3e8b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3e96;
            case (mant_lo4)
              4'h0: out_r = 16'h3e8c;
              4'h1: out_r = 16'h3e8d;
              4'h2: out_r = 16'h3e8e;
              4'h3: out_r = 16'h3e8f;
              4'h4: out_r = 16'h3e90;
              4'h5: out_r = 16'h3e91;
              4'h6: out_r = 16'h3e92;
              4'h7: out_r = 16'h3e93;
              4'h8: out_r = 16'h3e94;
              4'h9: out_r = 16'h3e95;
              4'hc: out_r = 16'h3e97;
              4'hd: out_r = 16'h3e98;
              4'he: out_r = 16'h3e99;
              4'hf: out_r = 16'h3e9a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3ea0;
            case (mant_lo4)
              4'h0: out_r = 16'h3e9b;
              4'h1: out_r = 16'h3e9c;
              4'h2: out_r = 16'h3e9d;
              4'h3: out_r = 16'h3e9e;
              4'h4: out_r = 16'h3e9f;
              4'h7: out_r = 16'h3ea1;
              4'h8: out_r = 16'h3ea2;
              4'h9: out_r = 16'h3ea3;
              4'ha: out_r = 16'h3ea4;
              4'hb: out_r = 16'h3ea5;
              4'hc: out_r = 16'h3ea6;
              4'hd: out_r = 16'h3ea7;
              4'he: out_r = 16'h3ea8;
              4'hf: out_r = 16'h3ea8;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3eb0;
            case (mant_lo4)
              4'h0: out_r = 16'h3ea9;
              4'h1: out_r = 16'h3eaa;
              4'h2: out_r = 16'h3eab;
              4'h3: out_r = 16'h3eac;
              4'h4: out_r = 16'h3ead;
              4'h5: out_r = 16'h3eae;
              4'h6: out_r = 16'h3eaf;
              4'h9: out_r = 16'h3eb1;
              4'ha: out_r = 16'h3eb2;
              4'hb: out_r = 16'h3eb3;
              4'hc: out_r = 16'h3eb4;
              4'hd: out_r = 16'h3eb5;
              4'he: out_r = 16'h3eb6;
              4'hf: out_r = 16'h3eb7;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ebe;
            case (mant_lo4)
              4'h0: out_r = 16'h3eb7;
              4'h1: out_r = 16'h3eb8;
              4'h2: out_r = 16'h3eb9;
              4'h3: out_r = 16'h3eba;
              4'h4: out_r = 16'h3ebb;
              4'h5: out_r = 16'h3ebc;
              4'h6: out_r = 16'h3ebd;
              4'h9: out_r = 16'h3ebf;
              4'ha: out_r = 16'h3ec0;
              4'hb: out_r = 16'h3ec1;
              4'hc: out_r = 16'h3ec2;
              4'hd: out_r = 16'h3ec3;
              4'he: out_r = 16'h3ec4;
              4'hf: out_r = 16'h3ec4;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3eca;
            case (mant_lo4)
              4'h0: out_r = 16'h3ec5;
              4'h1: out_r = 16'h3ec6;
              4'h2: out_r = 16'h3ec7;
              4'h3: out_r = 16'h3ec8;
              4'h4: out_r = 16'h3ec9;
              4'h7: out_r = 16'h3ecb;
              4'h8: out_r = 16'h3ecc;
              4'h9: out_r = 16'h3ecd;
              4'ha: out_r = 16'h3ece;
              4'hb: out_r = 16'h3ecf;
              4'hc: out_r = 16'h3ecf;
              4'hd: out_r = 16'h3ed0;
              4'he: out_r = 16'h3ed1;
              4'hf: out_r = 16'h3ed2;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ed4;
            case (mant_lo4)
              4'h0: out_r = 16'h3ed3;
              4'h3: out_r = 16'h3ed5;
              4'h4: out_r = 16'h3ed6;
              4'h5: out_r = 16'h3ed7;
              4'h6: out_r = 16'h3ed8;
              4'h7: out_r = 16'h3ed9;
              4'h8: out_r = 16'h3ed9;
              4'h9: out_r = 16'h3eda;
              4'ha: out_r = 16'h3edb;
              4'hb: out_r = 16'h3edc;
              4'hc: out_r = 16'h3edd;
              4'hd: out_r = 16'h3edd;
              4'he: out_r = 16'h3ede;
              4'hf: out_r = 16'h3edf;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3ee1;
            case (mant_lo4)
              4'h0: out_r = 16'h3ee0;
              4'h3: out_r = 16'h3ee2;
              4'h4: out_r = 16'h3ee3;
              4'h5: out_r = 16'h3ee4;
              4'h6: out_r = 16'h3ee5;
              4'h7: out_r = 16'h3ee5;
              4'h8: out_r = 16'h3ee6;
              4'h9: out_r = 16'h3ee7;
              4'ha: out_r = 16'h3ee8;
              4'hb: out_r = 16'h3ee9;
              4'hc: out_r = 16'h3ee9;
              4'hd: out_r = 16'h3eea;
              4'he: out_r = 16'h3eeb;
              4'hf: out_r = 16'h3eec;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3eed;
            case (mant_lo4)
              4'h1: out_r = 16'h3eee;
              4'h2: out_r = 16'h3ef0;
              4'h3: out_r = 16'h3ef1;
              4'h4: out_r = 16'h3ef3;
              4'h5: out_r = 16'h3ef4;
              4'h6: out_r = 16'h3ef6;
              4'h7: out_r = 16'h3ef7;
              4'h8: out_r = 16'h3ef9;
              4'h9: out_r = 16'h3efb;
              4'ha: out_r = 16'h3efc;
              4'hb: out_r = 16'h3efe;
              4'hc: out_r = 16'h3eff;
              4'hd: out_r = 16'h3f00;
              4'he: out_r = 16'h3f01;
              4'hf: out_r = 16'h3f02;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f03;
            case (mant_lo4)
              4'h2: out_r = 16'h3f04;
              4'h3: out_r = 16'h3f05;
              4'h4: out_r = 16'h3f05;
              4'h5: out_r = 16'h3f06;
              4'h6: out_r = 16'h3f07;
              4'h7: out_r = 16'h3f08;
              4'h8: out_r = 16'h3f08;
              4'h9: out_r = 16'h3f09;
              4'ha: out_r = 16'h3f0a;
              4'hb: out_r = 16'h3f0a;
              4'hc: out_r = 16'h3f0b;
              4'hd: out_r = 16'h3f0c;
              4'he: out_r = 16'h3f0d;
              4'hf: out_r = 16'h3f0d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f0f;
            case (mant_lo4)
              4'h0: out_r = 16'h3f0e;
              4'h3: out_r = 16'h3f10;
              4'h4: out_r = 16'h3f11;
              4'h5: out_r = 16'h3f11;
              4'h6: out_r = 16'h3f12;
              4'h7: out_r = 16'h3f13;
              4'h8: out_r = 16'h3f13;
              4'h9: out_r = 16'h3f14;
              4'ha: out_r = 16'h3f15;
              4'hb: out_r = 16'h3f15;
              4'hc: out_r = 16'h3f16;
              4'hd: out_r = 16'h3f17;
              4'he: out_r = 16'h3f17;
              4'hf: out_r = 16'h3f18;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f19;
            case (mant_lo4)
              4'h2: out_r = 16'h3f1a;
              4'h3: out_r = 16'h3f1b;
              4'h4: out_r = 16'h3f1b;
              4'h5: out_r = 16'h3f1c;
              4'h6: out_r = 16'h3f1c;
              4'h7: out_r = 16'h3f1d;
              4'h8: out_r = 16'h3f1e;
              4'h9: out_r = 16'h3f1e;
              4'ha: out_r = 16'h3f1f;
              4'hb: out_r = 16'h3f20;
              4'hc: out_r = 16'h3f20;
              4'hd: out_r = 16'h3f21;
              4'he: out_r = 16'h3f21;
              4'hf: out_r = 16'h3f22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f23;
            case (mant_lo4)
              4'h2: out_r = 16'h3f24;
              4'h3: out_r = 16'h3f24;
              4'h4: out_r = 16'h3f25;
              4'h5: out_r = 16'h3f26;
              4'h6: out_r = 16'h3f26;
              4'h7: out_r = 16'h3f27;
              4'h8: out_r = 16'h3f27;
              4'h9: out_r = 16'h3f28;
              4'ha: out_r = 16'h3f28;
              4'hb: out_r = 16'h3f29;
              4'hc: out_r = 16'h3f2a;
              4'hd: out_r = 16'h3f2a;
              4'he: out_r = 16'h3f2b;
              4'hf: out_r = 16'h3f2b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f2c;
            case (mant_lo4)
              4'h2: out_r = 16'h3f2d;
              4'h3: out_r = 16'h3f2d;
              4'h4: out_r = 16'h3f2e;
              4'h5: out_r = 16'h3f2e;
              4'h6: out_r = 16'h3f2f;
              4'h7: out_r = 16'h3f30;
              4'h8: out_r = 16'h3f30;
              4'h9: out_r = 16'h3f31;
              4'ha: out_r = 16'h3f31;
              4'hb: out_r = 16'h3f32;
              4'hc: out_r = 16'h3f32;
              4'hd: out_r = 16'h3f33;
              4'he: out_r = 16'h3f33;
              4'hf: out_r = 16'h3f34;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f3b;
            case (mant_lo4)
              4'h0: out_r = 16'h3f34;
              4'h1: out_r = 16'h3f35;
              4'h2: out_r = 16'h3f35;
              4'h3: out_r = 16'h3f36;
              4'h4: out_r = 16'h3f36;
              4'h5: out_r = 16'h3f37;
              4'h6: out_r = 16'h3f37;
              4'h7: out_r = 16'h3f38;
              4'h8: out_r = 16'h3f38;
              4'h9: out_r = 16'h3f39;
              4'ha: out_r = 16'h3f39;
              4'hb: out_r = 16'h3f3a;
              4'hc: out_r = 16'h3f3a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f40;
            case (mant_lo4)
              4'h0: out_r = 16'h3f3c;
              4'h1: out_r = 16'h3f3c;
              4'h2: out_r = 16'h3f3d;
              4'h3: out_r = 16'h3f3d;
              4'h4: out_r = 16'h3f3e;
              4'h5: out_r = 16'h3f3e;
              4'h6: out_r = 16'h3f3f;
              4'h7: out_r = 16'h3f3f;
              4'hb: out_r = 16'h3f41;
              4'hc: out_r = 16'h3f41;
              4'hd: out_r = 16'h3f42;
              4'he: out_r = 16'h3f42;
              4'hf: out_r = 16'h3f43;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f45;
            case (mant_lo4)
              4'h0: out_r = 16'h3f43;
              4'h1: out_r = 16'h3f44;
              4'h4: out_r = 16'h3f46;
              4'h5: out_r = 16'h3f47;
              4'h6: out_r = 16'h3f48;
              4'h7: out_r = 16'h3f49;
              4'h8: out_r = 16'h3f49;
              4'h9: out_r = 16'h3f4a;
              4'ha: out_r = 16'h3f4b;
              4'hb: out_r = 16'h3f4c;
              4'hc: out_r = 16'h3f4c;
              4'hd: out_r = 16'h3f4d;
              4'he: out_r = 16'h3f4e;
              4'hf: out_r = 16'h3f4e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f51;
            case (mant_lo4)
              4'h0: out_r = 16'h3f4f;
              4'h1: out_r = 16'h3f50;
              4'h4: out_r = 16'h3f52;
              4'h5: out_r = 16'h3f53;
              4'h6: out_r = 16'h3f53;
              4'h7: out_r = 16'h3f54;
              4'h8: out_r = 16'h3f54;
              4'h9: out_r = 16'h3f55;
              4'ha: out_r = 16'h3f56;
              4'hb: out_r = 16'h3f56;
              4'hc: out_r = 16'h3f57;
              4'hd: out_r = 16'h3f57;
              4'he: out_r = 16'h3f58;
              4'hf: out_r = 16'h3f59;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f5a;
            case (mant_lo4)
              4'h0: out_r = 16'h3f59;
              4'h3: out_r = 16'h3f5b;
              4'h4: out_r = 16'h3f5b;
              4'h5: out_r = 16'h3f5c;
              4'h6: out_r = 16'h3f5c;
              4'h7: out_r = 16'h3f5d;
              4'h8: out_r = 16'h3f5d;
              4'h9: out_r = 16'h3f5e;
              4'ha: out_r = 16'h3f5e;
              4'hb: out_r = 16'h3f5f;
              4'hc: out_r = 16'h3f5f;
              4'hd: out_r = 16'h3f60;
              4'he: out_r = 16'h3f60;
              4'hf: out_r = 16'h3f61;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f63;
            case (mant_lo4)
              4'h0: out_r = 16'h3f61;
              4'h1: out_r = 16'h3f62;
              4'h2: out_r = 16'h3f62;
              4'h6: out_r = 16'h3f64;
              4'h7: out_r = 16'h3f64;
              4'h8: out_r = 16'h3f65;
              4'h9: out_r = 16'h3f65;
              4'ha: out_r = 16'h3f65;
              4'hb: out_r = 16'h3f66;
              4'hc: out_r = 16'h3f66;
              4'hd: out_r = 16'h3f67;
              4'he: out_r = 16'h3f67;
              4'hf: out_r = 16'h3f67;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f68;
            case (mant_lo4)
              4'h3: out_r = 16'h3f69;
              4'h4: out_r = 16'h3f69;
              4'h5: out_r = 16'h3f69;
              4'h6: out_r = 16'h3f6a;
              4'h7: out_r = 16'h3f6a;
              4'h8: out_r = 16'h3f6a;
              4'h9: out_r = 16'h3f6b;
              4'ha: out_r = 16'h3f6b;
              4'hb: out_r = 16'h3f6b;
              4'hc: out_r = 16'h3f6c;
              4'hd: out_r = 16'h3f6c;
              4'he: out_r = 16'h3f6c;
              4'hf: out_r = 16'h3f6d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f6f;
            case (mant_lo4)
              4'h0: out_r = 16'h3f6d;
              4'h1: out_r = 16'h3f6d;
              4'h2: out_r = 16'h3f6d;
              4'h3: out_r = 16'h3f6e;
              4'h4: out_r = 16'h3f6e;
              4'h5: out_r = 16'h3f6e;
              4'ha: out_r = 16'h3f70;
              4'hb: out_r = 16'h3f70;
              4'hc: out_r = 16'h3f70;
              4'hd: out_r = 16'h3f70;
              4'he: out_r = 16'h3f71;
              4'hf: out_r = 16'h3f71;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f73;
            case (mant_lo4)
              4'h0: out_r = 16'h3f71;
              4'h1: out_r = 16'h3f71;
              4'h2: out_r = 16'h3f71;
              4'h3: out_r = 16'h3f72;
              4'h4: out_r = 16'h3f72;
              4'h5: out_r = 16'h3f72;
              4'h6: out_r = 16'h3f72;
              4'hd: out_r = 16'h3f74;
              4'he: out_r = 16'h3f74;
              4'hf: out_r = 16'h3f74;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f75;
            case (mant_lo4)
              4'h0: out_r = 16'h3f74;
              4'h1: out_r = 16'h3f74;
              4'h8: out_r = 16'h3f76;
              4'h9: out_r = 16'h3f76;
              4'ha: out_r = 16'h3f76;
              4'hb: out_r = 16'h3f76;
              4'hc: out_r = 16'h3f76;
              4'hd: out_r = 16'h3f76;
              4'he: out_r = 16'h3f77;
              4'hf: out_r = 16'h3f77;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f79;
            case (mant_lo4)
              4'h0: out_r = 16'h3f77;
              4'h1: out_r = 16'h3f77;
              4'h2: out_r = 16'h3f77;
              4'h3: out_r = 16'h3f78;
              4'h4: out_r = 16'h3f78;
              4'h5: out_r = 16'h3f78;
              4'h6: out_r = 16'h3f78;
              4'hc: out_r = 16'h3f7a;
              4'hd: out_r = 16'h3f7a;
              4'he: out_r = 16'h3f7a;
              4'hf: out_r = 16'h3f7a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f7c;
            case (mant_lo4)
              4'h0: out_r = 16'h3f7a;
              4'h1: out_r = 16'h3f7b;
              4'h2: out_r = 16'h3f7b;
              4'h3: out_r = 16'h3f7b;
              4'h4: out_r = 16'h3f7b;
              4'h5: out_r = 16'h3f7b;
              4'h6: out_r = 16'h3f7b;
              4'h7: out_r = 16'h3f7b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f7d;
            case (mant_lo4)
              4'hb: out_r = 16'h3f7e;
              4'hc: out_r = 16'h3f7e;
              4'hd: out_r = 16'h3f7e;
              4'he: out_r = 16'h3f7e;
              4'hf: out_r = 16'h3f7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f7e;
            case (mant_lo4)
              4'hb: out_r = 16'h3f7f;
              4'hc: out_r = 16'h3f7f;
              4'hd: out_r = 16'h3f7f;
              4'he: out_r = 16'h3f7f;
              4'hf: out_r = 16'h3f7f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f7f;
          end
          3'h5: begin
            out_r = 16'h3f7f;
            case (mant_lo4)
              4'he: out_r = 16'h3f80;
              4'hf: out_r = 16'h3f80;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f80;
          end
          3'h7: begin
            out_r = 16'h3f80;
          end
          default: begin end
        endcase
      end
      9'h081: out_r = 16'h3f80;
      9'h082: out_r = 16'h3f80;
      9'h083: out_r = 16'h3f80;
      9'h084: out_r = 16'h3f80;
      9'h085: out_r = 16'h3f80;
      9'h086: out_r = 16'h3f80;
      9'h087: out_r = 16'h3f80;
      9'h088: out_r = 16'h3f80;
      9'h089: out_r = 16'h3f80;
      9'h08a: out_r = 16'h3f80;
      9'h08b: out_r = 16'h3f80;
      9'h08c: out_r = 16'h3f80;
      9'h08d: out_r = 16'h3f80;
      9'h08e: out_r = 16'h3f80;
      9'h08f: out_r = 16'h3f80;
      9'h090: out_r = 16'h3f80;
      9'h091: out_r = 16'h3f80;
      9'h092: out_r = 16'h3f80;
      9'h093: out_r = 16'h3f80;
      9'h094: out_r = 16'h3f80;
      9'h095: out_r = 16'h3f80;
      9'h096: out_r = 16'h3f80;
      9'h097: out_r = 16'h3f80;
      9'h098: out_r = 16'h3f80;
      9'h099: out_r = 16'h3f80;
      9'h09a: out_r = 16'h3f80;
      9'h09b: out_r = 16'h3f80;
      9'h09c: out_r = 16'h3f80;
      9'h09d: out_r = 16'h3f80;
      9'h09e: out_r = 16'h3f80;
      9'h09f: out_r = 16'h3f80;
      9'h0a0: out_r = 16'h3f80;
      9'h0a1: out_r = 16'h3f80;
      9'h0a2: out_r = 16'h3f80;
      9'h0a3: out_r = 16'h3f80;
      9'h0a4: out_r = 16'h3f80;
      9'h0a5: out_r = 16'h3f80;
      9'h0a6: out_r = 16'h3f80;
      9'h0a7: out_r = 16'h3f80;
      9'h0a8: out_r = 16'h3f80;
      9'h0a9: out_r = 16'h3f80;
      9'h0aa: out_r = 16'h3f80;
      9'h0ab: out_r = 16'h3f80;
      9'h0ac: out_r = 16'h3f80;
      9'h0ad: out_r = 16'h3f80;
      9'h0ae: out_r = 16'h3f80;
      9'h0af: out_r = 16'h3f80;
      9'h0b0: out_r = 16'h3f80;
      9'h0b1: out_r = 16'h3f80;
      9'h0b2: out_r = 16'h3f80;
      9'h0b3: out_r = 16'h3f80;
      9'h0b4: out_r = 16'h3f80;
      9'h0b5: out_r = 16'h3f80;
      9'h0b6: out_r = 16'h3f80;
      9'h0b7: out_r = 16'h3f80;
      9'h0b8: out_r = 16'h3f80;
      9'h0b9: out_r = 16'h3f80;
      9'h0ba: out_r = 16'h3f80;
      9'h0bb: out_r = 16'h3f80;
      9'h0bc: out_r = 16'h3f80;
      9'h0bd: out_r = 16'h3f80;
      9'h0be: out_r = 16'h3f80;
      9'h0bf: out_r = 16'h3f80;
      9'h0c0: out_r = 16'h3f80;
      9'h0c1: out_r = 16'h3f80;
      9'h0c2: out_r = 16'h3f80;
      9'h0c3: out_r = 16'h3f80;
      9'h0c4: out_r = 16'h3f80;
      9'h0c5: out_r = 16'h3f80;
      9'h0c6: out_r = 16'h3f80;
      9'h0c7: out_r = 16'h3f80;
      9'h0c8: out_r = 16'h3f80;
      9'h0c9: out_r = 16'h3f80;
      9'h0ca: out_r = 16'h3f80;
      9'h0cb: out_r = 16'h3f80;
      9'h0cc: out_r = 16'h3f80;
      9'h0cd: out_r = 16'h3f80;
      9'h0ce: out_r = 16'h3f80;
      9'h0cf: out_r = 16'h3f80;
      9'h0d0: out_r = 16'h3f80;
      9'h0d1: out_r = 16'h3f80;
      9'h0d2: out_r = 16'h3f80;
      9'h0d3: out_r = 16'h3f80;
      9'h0d4: out_r = 16'h3f80;
      9'h0d5: out_r = 16'h3f80;
      9'h0d6: out_r = 16'h3f80;
      9'h0d7: out_r = 16'h3f80;
      9'h0d8: out_r = 16'h3f80;
      9'h0d9: out_r = 16'h3f80;
      9'h0da: out_r = 16'h3f80;
      9'h0db: out_r = 16'h3f80;
      9'h0dc: out_r = 16'h3f80;
      9'h0dd: out_r = 16'h3f80;
      9'h0de: out_r = 16'h3f80;
      9'h0df: out_r = 16'h3f80;
      9'h0e0: out_r = 16'h3f80;
      9'h0e1: out_r = 16'h3f80;
      9'h0e2: out_r = 16'h3f80;
      9'h0e3: out_r = 16'h3f80;
      9'h0e4: out_r = 16'h3f80;
      9'h0e5: out_r = 16'h3f80;
      9'h0e6: out_r = 16'h3f80;
      9'h0e7: out_r = 16'h3f80;
      9'h0e8: out_r = 16'h3f80;
      9'h0e9: out_r = 16'h3f80;
      9'h0ea: out_r = 16'h3f80;
      9'h0eb: out_r = 16'h3f80;
      9'h0ec: out_r = 16'h3f80;
      9'h0ed: out_r = 16'h3f80;
      9'h0ee: out_r = 16'h3f80;
      9'h0ef: out_r = 16'h3f80;
      9'h0f0: out_r = 16'h3f80;
      9'h0f1: out_r = 16'h3f80;
      9'h0f2: out_r = 16'h3f80;
      9'h0f3: out_r = 16'h3f80;
      9'h0f4: out_r = 16'h3f80;
      9'h0f5: out_r = 16'h3f80;
      9'h0f6: out_r = 16'h3f80;
      9'h0f7: out_r = 16'h3f80;
      9'h0f8: out_r = 16'h3f80;
      9'h0f9: out_r = 16'h3f80;
      9'h0fa: out_r = 16'h3f80;
      9'h0fb: out_r = 16'h3f80;
      9'h0fc: out_r = 16'h3f80;
      9'h0fd: out_r = 16'h3f80;
      9'h0fe: out_r = 16'h3f80;
      9'h0ff: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo4)
              4'h0: out_r = 16'h3f80;
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
          3'h3: begin
            out_r = 16'hbdb8;
            case (mant_lo4)
              4'h0: out_r = in;
              4'h1: out_r = in;
              4'h2: out_r = in;
              4'h3: out_r = in;
              4'h4: out_r = in;
              4'h5: out_r = in;
              4'h6: out_r = in;
              4'h7: out_r = in;
              4'ha: out_r = 16'hbdb9;
              4'hb: out_r = 16'hbdba;
              4'hc: out_r = 16'hbdbb;
              4'hd: out_r = 16'hbdbc;
              4'he: out_r = 16'hbdbd;
              4'hf: out_r = 16'hbdbe;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbdbf;
            case (mant_lo4)
              4'h1: out_r = 16'hbdc0;
              4'h2: out_r = 16'hbdc1;
              4'h3: out_r = 16'hbdc2;
              4'h4: out_r = 16'hbdc3;
              4'h5: out_r = 16'hbdc4;
              4'h6: out_r = 16'hbdc5;
              4'h7: out_r = 16'hbdc6;
              4'h8: out_r = 16'hbdc7;
              4'h9: out_r = 16'hbdc8;
              4'ha: out_r = 16'hbdc9;
              4'hb: out_r = 16'hbdca;
              4'hc: out_r = 16'hbdcb;
              4'hd: out_r = 16'hbdcc;
              4'he: out_r = 16'hbdcd;
              4'hf: out_r = 16'hbdce;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbdcf;
            case (mant_lo4)
              4'h1: out_r = 16'hbdd0;
              4'h2: out_r = 16'hbdd1;
              4'h3: out_r = 16'hbdd2;
              4'h4: out_r = 16'hbdd3;
              4'h5: out_r = 16'hbdd4;
              4'h6: out_r = 16'hbdd5;
              4'h7: out_r = 16'hbdd6;
              4'h8: out_r = 16'hbdd7;
              4'h9: out_r = 16'hbdd8;
              4'ha: out_r = 16'hbdd9;
              4'hb: out_r = 16'hbdda;
              4'hc: out_r = 16'hbddb;
              4'hd: out_r = 16'hbddc;
              4'he: out_r = 16'hbddd;
              4'hf: out_r = 16'hbdde;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbddf;
            case (mant_lo4)
              4'h1: out_r = 16'hbde0;
              4'h2: out_r = 16'hbde1;
              4'h3: out_r = 16'hbde2;
              4'h4: out_r = 16'hbde3;
              4'h5: out_r = 16'hbde4;
              4'h6: out_r = 16'hbde5;
              4'h7: out_r = 16'hbde6;
              4'h8: out_r = 16'hbde7;
              4'h9: out_r = 16'hbde8;
              4'ha: out_r = 16'hbde9;
              4'hb: out_r = 16'hbdea;
              4'hc: out_r = 16'hbdeb;
              4'hd: out_r = 16'hbdec;
              4'he: out_r = 16'hbded;
              4'hf: out_r = 16'hbdee;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbdef;
            case (mant_lo4)
              4'h1: out_r = 16'hbdf0;
              4'h2: out_r = 16'hbdf1;
              4'h3: out_r = 16'hbdf2;
              4'h4: out_r = 16'hbdf3;
              4'h5: out_r = 16'hbdf4;
              4'h6: out_r = 16'hbdf5;
              4'h7: out_r = 16'hbdf6;
              4'h8: out_r = 16'hbdf7;
              4'h9: out_r = 16'hbdf8;
              4'ha: out_r = 16'hbdf9;
              4'hb: out_r = 16'hbdfa;
              4'hc: out_r = 16'hbdfb;
              4'hd: out_r = 16'hbdfc;
              4'he: out_r = 16'hbdfd;
              4'hf: out_r = 16'hbdfe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbdff;
            case (mant_lo4)
              4'h1: out_r = 16'hbe00;
              4'h2: out_r = 16'hbe01;
              4'h3: out_r = 16'hbe02;
              4'h4: out_r = 16'hbe03;
              4'h5: out_r = 16'hbe04;
              4'h6: out_r = 16'hbe05;
              4'h7: out_r = 16'hbe06;
              4'h8: out_r = 16'hbe07;
              4'h9: out_r = 16'hbe08;
              4'ha: out_r = 16'hbe09;
              4'hb: out_r = 16'hbe0a;
              4'hc: out_r = 16'hbe0b;
              4'hd: out_r = 16'hbe0c;
              4'he: out_r = 16'hbe0d;
              4'hf: out_r = 16'hbe0e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbe0f;
            case (mant_lo4)
              4'h1: out_r = 16'hbe10;
              4'h2: out_r = 16'hbe11;
              4'h3: out_r = 16'hbe12;
              4'h4: out_r = 16'hbe13;
              4'h5: out_r = 16'hbe14;
              4'h6: out_r = 16'hbe15;
              4'h7: out_r = 16'hbe16;
              4'h8: out_r = 16'hbe17;
              4'h9: out_r = 16'hbe18;
              4'ha: out_r = 16'hbe19;
              4'hb: out_r = 16'hbe1a;
              4'hc: out_r = 16'hbe1b;
              4'hd: out_r = 16'hbe1c;
              4'he: out_r = 16'hbe1d;
              4'hf: out_r = 16'hbe1e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbe27;
            case (mant_lo4)
              4'h0: out_r = 16'hbe1f;
              4'h1: out_r = 16'hbe20;
              4'h2: out_r = 16'hbe21;
              4'h3: out_r = 16'hbe22;
              4'h4: out_r = 16'hbe23;
              4'h5: out_r = 16'hbe24;
              4'h6: out_r = 16'hbe25;
              4'h7: out_r = 16'hbe26;
              4'ha: out_r = 16'hbe28;
              4'hb: out_r = 16'hbe29;
              4'hc: out_r = 16'hbe2a;
              4'hd: out_r = 16'hbe2b;
              4'he: out_r = 16'hbe2c;
              4'hf: out_r = 16'hbe2d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbe2e;
            case (mant_lo4)
              4'h1: out_r = 16'hbe2f;
              4'h2: out_r = 16'hbe30;
              4'h3: out_r = 16'hbe31;
              4'h4: out_r = 16'hbe32;
              4'h5: out_r = 16'hbe33;
              4'h6: out_r = 16'hbe34;
              4'h7: out_r = 16'hbe35;
              4'h8: out_r = 16'hbe36;
              4'h9: out_r = 16'hbe37;
              4'ha: out_r = 16'hbe38;
              4'hb: out_r = 16'hbe39;
              4'hc: out_r = 16'hbe3a;
              4'hd: out_r = 16'hbe3b;
              4'he: out_r = 16'hbe3c;
              4'hf: out_r = 16'hbe3d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbe45;
            case (mant_lo4)
              4'h0: out_r = 16'hbe3e;
              4'h1: out_r = 16'hbe3f;
              4'h2: out_r = 16'hbe40;
              4'h3: out_r = 16'hbe41;
              4'h4: out_r = 16'hbe42;
              4'h5: out_r = 16'hbe43;
              4'h6: out_r = 16'hbe44;
              4'h9: out_r = 16'hbe46;
              4'ha: out_r = 16'hbe47;
              4'hb: out_r = 16'hbe48;
              4'hc: out_r = 16'hbe49;
              4'hd: out_r = 16'hbe4a;
              4'he: out_r = 16'hbe4b;
              4'hf: out_r = 16'hbe4c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbe4d;
            case (mant_lo4)
              4'h1: out_r = 16'hbe4e;
              4'h2: out_r = 16'hbe4f;
              4'h3: out_r = 16'hbe50;
              4'h4: out_r = 16'hbe51;
              4'h5: out_r = 16'hbe52;
              4'h6: out_r = 16'hbe53;
              4'h7: out_r = 16'hbe54;
              4'h8: out_r = 16'hbe55;
              4'h9: out_r = 16'hbe56;
              4'ha: out_r = 16'hbe57;
              4'hb: out_r = 16'hbe58;
              4'hc: out_r = 16'hbe59;
              4'hd: out_r = 16'hbe5a;
              4'he: out_r = 16'hbe5b;
              4'hf: out_r = 16'hbe5c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbe5c;
            case (mant_lo4)
              4'h1: out_r = 16'hbe5d;
              4'h2: out_r = 16'hbe5e;
              4'h3: out_r = 16'hbe5f;
              4'h4: out_r = 16'hbe60;
              4'h5: out_r = 16'hbe61;
              4'h6: out_r = 16'hbe62;
              4'h7: out_r = 16'hbe63;
              4'h8: out_r = 16'hbe64;
              4'h9: out_r = 16'hbe65;
              4'ha: out_r = 16'hbe66;
              4'hb: out_r = 16'hbe67;
              4'hc: out_r = 16'hbe68;
              4'hd: out_r = 16'hbe69;
              4'he: out_r = 16'hbe6a;
              4'hf: out_r = 16'hbe6b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbe6f;
            case (mant_lo4)
              4'h0: out_r = 16'hbe6c;
              4'h1: out_r = 16'hbe6d;
              4'h2: out_r = 16'hbe6e;
              4'h5: out_r = 16'hbe70;
              4'h6: out_r = 16'hbe71;
              4'h7: out_r = 16'hbe72;
              4'h8: out_r = 16'hbe73;
              4'h9: out_r = 16'hbe74;
              4'ha: out_r = 16'hbe75;
              4'hb: out_r = 16'hbe76;
              4'hc: out_r = 16'hbe77;
              4'hd: out_r = 16'hbe78;
              4'he: out_r = 16'hbe79;
              4'hf: out_r = 16'hbe7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbe8a;
            case (mant_lo4)
              4'h0: out_r = 16'hbe7b;
              4'h1: out_r = 16'hbe7d;
              4'h2: out_r = 16'hbe7f;
              4'h3: out_r = 16'hbe80;
              4'h4: out_r = 16'hbe81;
              4'h5: out_r = 16'hbe82;
              4'h6: out_r = 16'hbe83;
              4'h7: out_r = 16'hbe84;
              4'h8: out_r = 16'hbe85;
              4'h9: out_r = 16'hbe86;
              4'ha: out_r = 16'hbe87;
              4'hb: out_r = 16'hbe88;
              4'hc: out_r = 16'hbe89;
              4'hf: out_r = 16'hbe8b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbe96;
            case (mant_lo4)
              4'h0: out_r = 16'hbe8c;
              4'h1: out_r = 16'hbe8d;
              4'h2: out_r = 16'hbe8e;
              4'h3: out_r = 16'hbe8f;
              4'h4: out_r = 16'hbe90;
              4'h5: out_r = 16'hbe91;
              4'h6: out_r = 16'hbe92;
              4'h7: out_r = 16'hbe93;
              4'h8: out_r = 16'hbe94;
              4'h9: out_r = 16'hbe95;
              4'hc: out_r = 16'hbe97;
              4'hd: out_r = 16'hbe98;
              4'he: out_r = 16'hbe99;
              4'hf: out_r = 16'hbe9a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbea0;
            case (mant_lo4)
              4'h0: out_r = 16'hbe9b;
              4'h1: out_r = 16'hbe9c;
              4'h2: out_r = 16'hbe9d;
              4'h3: out_r = 16'hbe9e;
              4'h4: out_r = 16'hbe9f;
              4'h7: out_r = 16'hbea1;
              4'h8: out_r = 16'hbea2;
              4'h9: out_r = 16'hbea3;
              4'ha: out_r = 16'hbea4;
              4'hb: out_r = 16'hbea5;
              4'hc: out_r = 16'hbea6;
              4'hd: out_r = 16'hbea7;
              4'he: out_r = 16'hbea8;
              4'hf: out_r = 16'hbea8;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbeb0;
            case (mant_lo4)
              4'h0: out_r = 16'hbea9;
              4'h1: out_r = 16'hbeaa;
              4'h2: out_r = 16'hbeab;
              4'h3: out_r = 16'hbeac;
              4'h4: out_r = 16'hbead;
              4'h5: out_r = 16'hbeae;
              4'h6: out_r = 16'hbeaf;
              4'h9: out_r = 16'hbeb1;
              4'ha: out_r = 16'hbeb2;
              4'hb: out_r = 16'hbeb3;
              4'hc: out_r = 16'hbeb4;
              4'hd: out_r = 16'hbeb5;
              4'he: out_r = 16'hbeb6;
              4'hf: out_r = 16'hbeb7;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbebe;
            case (mant_lo4)
              4'h0: out_r = 16'hbeb7;
              4'h1: out_r = 16'hbeb8;
              4'h2: out_r = 16'hbeb9;
              4'h3: out_r = 16'hbeba;
              4'h4: out_r = 16'hbebb;
              4'h5: out_r = 16'hbebc;
              4'h6: out_r = 16'hbebd;
              4'h9: out_r = 16'hbebf;
              4'ha: out_r = 16'hbec0;
              4'hb: out_r = 16'hbec1;
              4'hc: out_r = 16'hbec2;
              4'hd: out_r = 16'hbec3;
              4'he: out_r = 16'hbec4;
              4'hf: out_r = 16'hbec4;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbeca;
            case (mant_lo4)
              4'h0: out_r = 16'hbec5;
              4'h1: out_r = 16'hbec6;
              4'h2: out_r = 16'hbec7;
              4'h3: out_r = 16'hbec8;
              4'h4: out_r = 16'hbec9;
              4'h7: out_r = 16'hbecb;
              4'h8: out_r = 16'hbecc;
              4'h9: out_r = 16'hbecd;
              4'ha: out_r = 16'hbece;
              4'hb: out_r = 16'hbecf;
              4'hc: out_r = 16'hbecf;
              4'hd: out_r = 16'hbed0;
              4'he: out_r = 16'hbed1;
              4'hf: out_r = 16'hbed2;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbed4;
            case (mant_lo4)
              4'h0: out_r = 16'hbed3;
              4'h3: out_r = 16'hbed5;
              4'h4: out_r = 16'hbed6;
              4'h5: out_r = 16'hbed7;
              4'h6: out_r = 16'hbed8;
              4'h7: out_r = 16'hbed9;
              4'h8: out_r = 16'hbed9;
              4'h9: out_r = 16'hbeda;
              4'ha: out_r = 16'hbedb;
              4'hb: out_r = 16'hbedc;
              4'hc: out_r = 16'hbedd;
              4'hd: out_r = 16'hbedd;
              4'he: out_r = 16'hbede;
              4'hf: out_r = 16'hbedf;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbee1;
            case (mant_lo4)
              4'h0: out_r = 16'hbee0;
              4'h3: out_r = 16'hbee2;
              4'h4: out_r = 16'hbee3;
              4'h5: out_r = 16'hbee4;
              4'h6: out_r = 16'hbee5;
              4'h7: out_r = 16'hbee5;
              4'h8: out_r = 16'hbee6;
              4'h9: out_r = 16'hbee7;
              4'ha: out_r = 16'hbee8;
              4'hb: out_r = 16'hbee9;
              4'hc: out_r = 16'hbee9;
              4'hd: out_r = 16'hbeea;
              4'he: out_r = 16'hbeeb;
              4'hf: out_r = 16'hbeec;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbeed;
            case (mant_lo4)
              4'h1: out_r = 16'hbeee;
              4'h2: out_r = 16'hbef0;
              4'h3: out_r = 16'hbef1;
              4'h4: out_r = 16'hbef3;
              4'h5: out_r = 16'hbef4;
              4'h6: out_r = 16'hbef6;
              4'h7: out_r = 16'hbef7;
              4'h8: out_r = 16'hbef9;
              4'h9: out_r = 16'hbefb;
              4'ha: out_r = 16'hbefc;
              4'hb: out_r = 16'hbefe;
              4'hc: out_r = 16'hbeff;
              4'hd: out_r = 16'hbf00;
              4'he: out_r = 16'hbf01;
              4'hf: out_r = 16'hbf02;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbf03;
            case (mant_lo4)
              4'h2: out_r = 16'hbf04;
              4'h3: out_r = 16'hbf05;
              4'h4: out_r = 16'hbf05;
              4'h5: out_r = 16'hbf06;
              4'h6: out_r = 16'hbf07;
              4'h7: out_r = 16'hbf08;
              4'h8: out_r = 16'hbf08;
              4'h9: out_r = 16'hbf09;
              4'ha: out_r = 16'hbf0a;
              4'hb: out_r = 16'hbf0a;
              4'hc: out_r = 16'hbf0b;
              4'hd: out_r = 16'hbf0c;
              4'he: out_r = 16'hbf0d;
              4'hf: out_r = 16'hbf0d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbf0f;
            case (mant_lo4)
              4'h0: out_r = 16'hbf0e;
              4'h3: out_r = 16'hbf10;
              4'h4: out_r = 16'hbf11;
              4'h5: out_r = 16'hbf11;
              4'h6: out_r = 16'hbf12;
              4'h7: out_r = 16'hbf13;
              4'h8: out_r = 16'hbf13;
              4'h9: out_r = 16'hbf14;
              4'ha: out_r = 16'hbf15;
              4'hb: out_r = 16'hbf15;
              4'hc: out_r = 16'hbf16;
              4'hd: out_r = 16'hbf17;
              4'he: out_r = 16'hbf17;
              4'hf: out_r = 16'hbf18;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbf19;
            case (mant_lo4)
              4'h2: out_r = 16'hbf1a;
              4'h3: out_r = 16'hbf1b;
              4'h4: out_r = 16'hbf1b;
              4'h5: out_r = 16'hbf1c;
              4'h6: out_r = 16'hbf1c;
              4'h7: out_r = 16'hbf1d;
              4'h8: out_r = 16'hbf1e;
              4'h9: out_r = 16'hbf1e;
              4'ha: out_r = 16'hbf1f;
              4'hb: out_r = 16'hbf20;
              4'hc: out_r = 16'hbf20;
              4'hd: out_r = 16'hbf21;
              4'he: out_r = 16'hbf21;
              4'hf: out_r = 16'hbf22;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbf23;
            case (mant_lo4)
              4'h2: out_r = 16'hbf24;
              4'h3: out_r = 16'hbf24;
              4'h4: out_r = 16'hbf25;
              4'h5: out_r = 16'hbf26;
              4'h6: out_r = 16'hbf26;
              4'h7: out_r = 16'hbf27;
              4'h8: out_r = 16'hbf27;
              4'h9: out_r = 16'hbf28;
              4'ha: out_r = 16'hbf28;
              4'hb: out_r = 16'hbf29;
              4'hc: out_r = 16'hbf2a;
              4'hd: out_r = 16'hbf2a;
              4'he: out_r = 16'hbf2b;
              4'hf: out_r = 16'hbf2b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbf2c;
            case (mant_lo4)
              4'h2: out_r = 16'hbf2d;
              4'h3: out_r = 16'hbf2d;
              4'h4: out_r = 16'hbf2e;
              4'h5: out_r = 16'hbf2e;
              4'h6: out_r = 16'hbf2f;
              4'h7: out_r = 16'hbf30;
              4'h8: out_r = 16'hbf30;
              4'h9: out_r = 16'hbf31;
              4'ha: out_r = 16'hbf31;
              4'hb: out_r = 16'hbf32;
              4'hc: out_r = 16'hbf32;
              4'hd: out_r = 16'hbf33;
              4'he: out_r = 16'hbf33;
              4'hf: out_r = 16'hbf34;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbf3b;
            case (mant_lo4)
              4'h0: out_r = 16'hbf34;
              4'h1: out_r = 16'hbf35;
              4'h2: out_r = 16'hbf35;
              4'h3: out_r = 16'hbf36;
              4'h4: out_r = 16'hbf36;
              4'h5: out_r = 16'hbf37;
              4'h6: out_r = 16'hbf37;
              4'h7: out_r = 16'hbf38;
              4'h8: out_r = 16'hbf38;
              4'h9: out_r = 16'hbf39;
              4'ha: out_r = 16'hbf39;
              4'hb: out_r = 16'hbf3a;
              4'hc: out_r = 16'hbf3a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbf40;
            case (mant_lo4)
              4'h0: out_r = 16'hbf3c;
              4'h1: out_r = 16'hbf3c;
              4'h2: out_r = 16'hbf3d;
              4'h3: out_r = 16'hbf3d;
              4'h4: out_r = 16'hbf3e;
              4'h5: out_r = 16'hbf3e;
              4'h6: out_r = 16'hbf3f;
              4'h7: out_r = 16'hbf3f;
              4'hb: out_r = 16'hbf41;
              4'hc: out_r = 16'hbf41;
              4'hd: out_r = 16'hbf42;
              4'he: out_r = 16'hbf42;
              4'hf: out_r = 16'hbf43;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbf45;
            case (mant_lo4)
              4'h0: out_r = 16'hbf43;
              4'h1: out_r = 16'hbf44;
              4'h4: out_r = 16'hbf46;
              4'h5: out_r = 16'hbf47;
              4'h6: out_r = 16'hbf48;
              4'h7: out_r = 16'hbf49;
              4'h8: out_r = 16'hbf49;
              4'h9: out_r = 16'hbf4a;
              4'ha: out_r = 16'hbf4b;
              4'hb: out_r = 16'hbf4c;
              4'hc: out_r = 16'hbf4c;
              4'hd: out_r = 16'hbf4d;
              4'he: out_r = 16'hbf4e;
              4'hf: out_r = 16'hbf4e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbf51;
            case (mant_lo4)
              4'h0: out_r = 16'hbf4f;
              4'h1: out_r = 16'hbf50;
              4'h4: out_r = 16'hbf52;
              4'h5: out_r = 16'hbf53;
              4'h6: out_r = 16'hbf53;
              4'h7: out_r = 16'hbf54;
              4'h8: out_r = 16'hbf54;
              4'h9: out_r = 16'hbf55;
              4'ha: out_r = 16'hbf56;
              4'hb: out_r = 16'hbf56;
              4'hc: out_r = 16'hbf57;
              4'hd: out_r = 16'hbf57;
              4'he: out_r = 16'hbf58;
              4'hf: out_r = 16'hbf59;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbf5a;
            case (mant_lo4)
              4'h0: out_r = 16'hbf59;
              4'h3: out_r = 16'hbf5b;
              4'h4: out_r = 16'hbf5b;
              4'h5: out_r = 16'hbf5c;
              4'h6: out_r = 16'hbf5c;
              4'h7: out_r = 16'hbf5d;
              4'h8: out_r = 16'hbf5d;
              4'h9: out_r = 16'hbf5e;
              4'ha: out_r = 16'hbf5e;
              4'hb: out_r = 16'hbf5f;
              4'hc: out_r = 16'hbf5f;
              4'hd: out_r = 16'hbf60;
              4'he: out_r = 16'hbf60;
              4'hf: out_r = 16'hbf61;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbf63;
            case (mant_lo4)
              4'h0: out_r = 16'hbf61;
              4'h1: out_r = 16'hbf62;
              4'h2: out_r = 16'hbf62;
              4'h6: out_r = 16'hbf64;
              4'h7: out_r = 16'hbf64;
              4'h8: out_r = 16'hbf65;
              4'h9: out_r = 16'hbf65;
              4'ha: out_r = 16'hbf65;
              4'hb: out_r = 16'hbf66;
              4'hc: out_r = 16'hbf66;
              4'hd: out_r = 16'hbf67;
              4'he: out_r = 16'hbf67;
              4'hf: out_r = 16'hbf67;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbf68;
            case (mant_lo4)
              4'h3: out_r = 16'hbf69;
              4'h4: out_r = 16'hbf69;
              4'h5: out_r = 16'hbf69;
              4'h6: out_r = 16'hbf6a;
              4'h7: out_r = 16'hbf6a;
              4'h8: out_r = 16'hbf6a;
              4'h9: out_r = 16'hbf6b;
              4'ha: out_r = 16'hbf6b;
              4'hb: out_r = 16'hbf6b;
              4'hc: out_r = 16'hbf6c;
              4'hd: out_r = 16'hbf6c;
              4'he: out_r = 16'hbf6c;
              4'hf: out_r = 16'hbf6d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'hbf6f;
            case (mant_lo4)
              4'h0: out_r = 16'hbf6d;
              4'h1: out_r = 16'hbf6d;
              4'h2: out_r = 16'hbf6d;
              4'h3: out_r = 16'hbf6e;
              4'h4: out_r = 16'hbf6e;
              4'h5: out_r = 16'hbf6e;
              4'ha: out_r = 16'hbf70;
              4'hb: out_r = 16'hbf70;
              4'hc: out_r = 16'hbf70;
              4'hd: out_r = 16'hbf70;
              4'he: out_r = 16'hbf71;
              4'hf: out_r = 16'hbf71;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbf73;
            case (mant_lo4)
              4'h0: out_r = 16'hbf71;
              4'h1: out_r = 16'hbf71;
              4'h2: out_r = 16'hbf71;
              4'h3: out_r = 16'hbf72;
              4'h4: out_r = 16'hbf72;
              4'h5: out_r = 16'hbf72;
              4'h6: out_r = 16'hbf72;
              4'hd: out_r = 16'hbf74;
              4'he: out_r = 16'hbf74;
              4'hf: out_r = 16'hbf74;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'hbf75;
            case (mant_lo4)
              4'h0: out_r = 16'hbf74;
              4'h1: out_r = 16'hbf74;
              4'h8: out_r = 16'hbf76;
              4'h9: out_r = 16'hbf76;
              4'ha: out_r = 16'hbf76;
              4'hb: out_r = 16'hbf76;
              4'hc: out_r = 16'hbf76;
              4'hd: out_r = 16'hbf76;
              4'he: out_r = 16'hbf77;
              4'hf: out_r = 16'hbf77;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'hbf79;
            case (mant_lo4)
              4'h0: out_r = 16'hbf77;
              4'h1: out_r = 16'hbf77;
              4'h2: out_r = 16'hbf77;
              4'h3: out_r = 16'hbf78;
              4'h4: out_r = 16'hbf78;
              4'h5: out_r = 16'hbf78;
              4'h6: out_r = 16'hbf78;
              4'hc: out_r = 16'hbf7a;
              4'hd: out_r = 16'hbf7a;
              4'he: out_r = 16'hbf7a;
              4'hf: out_r = 16'hbf7a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'hbf7c;
            case (mant_lo4)
              4'h0: out_r = 16'hbf7a;
              4'h1: out_r = 16'hbf7b;
              4'h2: out_r = 16'hbf7b;
              4'h3: out_r = 16'hbf7b;
              4'h4: out_r = 16'hbf7b;
              4'h5: out_r = 16'hbf7b;
              4'h6: out_r = 16'hbf7b;
              4'h7: out_r = 16'hbf7b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'hbf7d;
            case (mant_lo4)
              4'hb: out_r = 16'hbf7e;
              4'hc: out_r = 16'hbf7e;
              4'hd: out_r = 16'hbf7e;
              4'he: out_r = 16'hbf7e;
              4'hf: out_r = 16'hbf7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'hbf7e;
            case (mant_lo4)
              4'hb: out_r = 16'hbf7f;
              4'hc: out_r = 16'hbf7f;
              4'hd: out_r = 16'hbf7f;
              4'he: out_r = 16'hbf7f;
              4'hf: out_r = 16'hbf7f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'hbf7f;
          end
          3'h5: begin
            out_r = 16'hbf7f;
            case (mant_lo4)
              4'he: out_r = 16'hbf80;
              4'hf: out_r = 16'hbf80;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'hbf80;
          end
          3'h7: begin
            out_r = 16'hbf80;
          end
          default: begin end
        endcase
      end
      9'h181: out_r = 16'hbf80;
      9'h182: out_r = 16'hbf80;
      9'h183: out_r = 16'hbf80;
      9'h184: out_r = 16'hbf80;
      9'h185: out_r = 16'hbf80;
      9'h186: out_r = 16'hbf80;
      9'h187: out_r = 16'hbf80;
      9'h188: out_r = 16'hbf80;
      9'h189: out_r = 16'hbf80;
      9'h18a: out_r = 16'hbf80;
      9'h18b: out_r = 16'hbf80;
      9'h18c: out_r = 16'hbf80;
      9'h18d: out_r = 16'hbf80;
      9'h18e: out_r = 16'hbf80;
      9'h18f: out_r = 16'hbf80;
      9'h190: out_r = 16'hbf80;
      9'h191: out_r = 16'hbf80;
      9'h192: out_r = 16'hbf80;
      9'h193: out_r = 16'hbf80;
      9'h194: out_r = 16'hbf80;
      9'h195: out_r = 16'hbf80;
      9'h196: out_r = 16'hbf80;
      9'h197: out_r = 16'hbf80;
      9'h198: out_r = 16'hbf80;
      9'h199: out_r = 16'hbf80;
      9'h19a: out_r = 16'hbf80;
      9'h19b: out_r = 16'hbf80;
      9'h19c: out_r = 16'hbf80;
      9'h19d: out_r = 16'hbf80;
      9'h19e: out_r = 16'hbf80;
      9'h19f: out_r = 16'hbf80;
      9'h1a0: out_r = 16'hbf80;
      9'h1a1: out_r = 16'hbf80;
      9'h1a2: out_r = 16'hbf80;
      9'h1a3: out_r = 16'hbf80;
      9'h1a4: out_r = 16'hbf80;
      9'h1a5: out_r = 16'hbf80;
      9'h1a6: out_r = 16'hbf80;
      9'h1a7: out_r = 16'hbf80;
      9'h1a8: out_r = 16'hbf80;
      9'h1a9: out_r = 16'hbf80;
      9'h1aa: out_r = 16'hbf80;
      9'h1ab: out_r = 16'hbf80;
      9'h1ac: out_r = 16'hbf80;
      9'h1ad: out_r = 16'hbf80;
      9'h1ae: out_r = 16'hbf80;
      9'h1af: out_r = 16'hbf80;
      9'h1b0: out_r = 16'hbf80;
      9'h1b1: out_r = 16'hbf80;
      9'h1b2: out_r = 16'hbf80;
      9'h1b3: out_r = 16'hbf80;
      9'h1b4: out_r = 16'hbf80;
      9'h1b5: out_r = 16'hbf80;
      9'h1b6: out_r = 16'hbf80;
      9'h1b7: out_r = 16'hbf80;
      9'h1b8: out_r = 16'hbf80;
      9'h1b9: out_r = 16'hbf80;
      9'h1ba: out_r = 16'hbf80;
      9'h1bb: out_r = 16'hbf80;
      9'h1bc: out_r = 16'hbf80;
      9'h1bd: out_r = 16'hbf80;
      9'h1be: out_r = 16'hbf80;
      9'h1bf: out_r = 16'hbf80;
      9'h1c0: out_r = 16'hbf80;
      9'h1c1: out_r = 16'hbf80;
      9'h1c2: out_r = 16'hbf80;
      9'h1c3: out_r = 16'hbf80;
      9'h1c4: out_r = 16'hbf80;
      9'h1c5: out_r = 16'hbf80;
      9'h1c6: out_r = 16'hbf80;
      9'h1c7: out_r = 16'hbf80;
      9'h1c8: out_r = 16'hbf80;
      9'h1c9: out_r = 16'hbf80;
      9'h1ca: out_r = 16'hbf80;
      9'h1cb: out_r = 16'hbf80;
      9'h1cc: out_r = 16'hbf80;
      9'h1cd: out_r = 16'hbf80;
      9'h1ce: out_r = 16'hbf80;
      9'h1cf: out_r = 16'hbf80;
      9'h1d0: out_r = 16'hbf80;
      9'h1d1: out_r = 16'hbf80;
      9'h1d2: out_r = 16'hbf80;
      9'h1d3: out_r = 16'hbf80;
      9'h1d4: out_r = 16'hbf80;
      9'h1d5: out_r = 16'hbf80;
      9'h1d6: out_r = 16'hbf80;
      9'h1d7: out_r = 16'hbf80;
      9'h1d8: out_r = 16'hbf80;
      9'h1d9: out_r = 16'hbf80;
      9'h1da: out_r = 16'hbf80;
      9'h1db: out_r = 16'hbf80;
      9'h1dc: out_r = 16'hbf80;
      9'h1dd: out_r = 16'hbf80;
      9'h1de: out_r = 16'hbf80;
      9'h1df: out_r = 16'hbf80;
      9'h1e0: out_r = 16'hbf80;
      9'h1e1: out_r = 16'hbf80;
      9'h1e2: out_r = 16'hbf80;
      9'h1e3: out_r = 16'hbf80;
      9'h1e4: out_r = 16'hbf80;
      9'h1e5: out_r = 16'hbf80;
      9'h1e6: out_r = 16'hbf80;
      9'h1e7: out_r = 16'hbf80;
      9'h1e8: out_r = 16'hbf80;
      9'h1e9: out_r = 16'hbf80;
      9'h1ea: out_r = 16'hbf80;
      9'h1eb: out_r = 16'hbf80;
      9'h1ec: out_r = 16'hbf80;
      9'h1ed: out_r = 16'hbf80;
      9'h1ee: out_r = 16'hbf80;
      9'h1ef: out_r = 16'hbf80;
      9'h1f0: out_r = 16'hbf80;
      9'h1f1: out_r = 16'hbf80;
      9'h1f2: out_r = 16'hbf80;
      9'h1f3: out_r = 16'hbf80;
      9'h1f4: out_r = 16'hbf80;
      9'h1f5: out_r = 16'hbf80;
      9'h1f6: out_r = 16'hbf80;
      9'h1f7: out_r = 16'hbf80;
      9'h1f8: out_r = 16'hbf80;
      9'h1f9: out_r = 16'hbf80;
      9'h1fa: out_r = 16'hbf80;
      9'h1fb: out_r = 16'hbf80;
      9'h1fc: out_r = 16'hbf80;
      9'h1fd: out_r = 16'hbf80;
      9'h1fe: out_r = 16'hbf80;
      9'h1ff: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo4)
              4'h0: out_r = 16'hbf80;
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
