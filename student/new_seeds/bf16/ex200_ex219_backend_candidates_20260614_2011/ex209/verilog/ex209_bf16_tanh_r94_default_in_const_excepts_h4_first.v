module ex209_bf16_tanh_r94_default_in_const_excepts_h4_first(in, out);
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
          4'h7: begin
            out_r = 16'h3db8;
            case (mant_lo3)
              3'h2: out_r = 16'h3db9;
              3'h3: out_r = 16'h3dba;
              3'h4: out_r = 16'h3dbb;
              3'h5: out_r = 16'h3dbc;
              3'h6: out_r = 16'h3dbd;
              3'h7: out_r = 16'h3dbe;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3dbf;
            case (mant_lo3)
              3'h1: out_r = 16'h3dc0;
              3'h2: out_r = 16'h3dc1;
              3'h3: out_r = 16'h3dc2;
              3'h4: out_r = 16'h3dc3;
              3'h5: out_r = 16'h3dc4;
              3'h6: out_r = 16'h3dc5;
              3'h7: out_r = 16'h3dc6;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3dc7;
            case (mant_lo3)
              3'h1: out_r = 16'h3dc8;
              3'h2: out_r = 16'h3dc9;
              3'h3: out_r = 16'h3dca;
              3'h4: out_r = 16'h3dcb;
              3'h5: out_r = 16'h3dcc;
              3'h6: out_r = 16'h3dcd;
              3'h7: out_r = 16'h3dce;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3dcf;
            case (mant_lo3)
              3'h1: out_r = 16'h3dd0;
              3'h2: out_r = 16'h3dd1;
              3'h3: out_r = 16'h3dd2;
              3'h4: out_r = 16'h3dd3;
              3'h5: out_r = 16'h3dd4;
              3'h6: out_r = 16'h3dd5;
              3'h7: out_r = 16'h3dd6;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3dd7;
            case (mant_lo3)
              3'h1: out_r = 16'h3dd8;
              3'h2: out_r = 16'h3dd9;
              3'h3: out_r = 16'h3dda;
              3'h4: out_r = 16'h3ddb;
              3'h5: out_r = 16'h3ddc;
              3'h6: out_r = 16'h3ddd;
              3'h7: out_r = 16'h3dde;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3ddf;
            case (mant_lo3)
              3'h1: out_r = 16'h3de0;
              3'h2: out_r = 16'h3de1;
              3'h3: out_r = 16'h3de2;
              3'h4: out_r = 16'h3de3;
              3'h5: out_r = 16'h3de4;
              3'h6: out_r = 16'h3de5;
              3'h7: out_r = 16'h3de6;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3de7;
            case (mant_lo3)
              3'h1: out_r = 16'h3de8;
              3'h2: out_r = 16'h3de9;
              3'h3: out_r = 16'h3dea;
              3'h4: out_r = 16'h3deb;
              3'h5: out_r = 16'h3dec;
              3'h6: out_r = 16'h3ded;
              3'h7: out_r = 16'h3dee;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3def;
            case (mant_lo3)
              3'h1: out_r = 16'h3df0;
              3'h2: out_r = 16'h3df1;
              3'h3: out_r = 16'h3df2;
              3'h4: out_r = 16'h3df3;
              3'h5: out_r = 16'h3df4;
              3'h6: out_r = 16'h3df5;
              3'h7: out_r = 16'h3df6;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3df7;
            case (mant_lo3)
              3'h1: out_r = 16'h3df8;
              3'h2: out_r = 16'h3df9;
              3'h3: out_r = 16'h3dfa;
              3'h4: out_r = 16'h3dfb;
              3'h5: out_r = 16'h3dfc;
              3'h6: out_r = 16'h3dfd;
              3'h7: out_r = 16'h3dfe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3dff;
            case (mant_lo3)
              3'h1: out_r = 16'h3e00;
              3'h2: out_r = 16'h3e01;
              3'h3: out_r = 16'h3e02;
              3'h4: out_r = 16'h3e03;
              3'h5: out_r = 16'h3e04;
              3'h6: out_r = 16'h3e05;
              3'h7: out_r = 16'h3e06;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3e07;
            case (mant_lo3)
              3'h1: out_r = 16'h3e08;
              3'h2: out_r = 16'h3e09;
              3'h3: out_r = 16'h3e0a;
              3'h4: out_r = 16'h3e0b;
              3'h5: out_r = 16'h3e0c;
              3'h6: out_r = 16'h3e0d;
              3'h7: out_r = 16'h3e0e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3e0f;
            case (mant_lo3)
              3'h1: out_r = 16'h3e10;
              3'h2: out_r = 16'h3e11;
              3'h3: out_r = 16'h3e12;
              3'h4: out_r = 16'h3e13;
              3'h5: out_r = 16'h3e14;
              3'h6: out_r = 16'h3e15;
              3'h7: out_r = 16'h3e16;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3e17;
            case (mant_lo3)
              3'h1: out_r = 16'h3e18;
              3'h2: out_r = 16'h3e19;
              3'h3: out_r = 16'h3e1a;
              3'h4: out_r = 16'h3e1b;
              3'h5: out_r = 16'h3e1c;
              3'h6: out_r = 16'h3e1d;
              3'h7: out_r = 16'h3e1e;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3e1f;
            case (mant_lo3)
              3'h1: out_r = 16'h3e20;
              3'h2: out_r = 16'h3e21;
              3'h3: out_r = 16'h3e22;
              3'h4: out_r = 16'h3e23;
              3'h5: out_r = 16'h3e24;
              3'h6: out_r = 16'h3e25;
              3'h7: out_r = 16'h3e26;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3e27;
            case (mant_lo3)
              3'h2: out_r = 16'h3e28;
              3'h3: out_r = 16'h3e29;
              3'h4: out_r = 16'h3e2a;
              3'h5: out_r = 16'h3e2b;
              3'h6: out_r = 16'h3e2c;
              3'h7: out_r = 16'h3e2d;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3e2e;
            case (mant_lo3)
              3'h1: out_r = 16'h3e2f;
              3'h2: out_r = 16'h3e30;
              3'h3: out_r = 16'h3e31;
              3'h4: out_r = 16'h3e32;
              3'h5: out_r = 16'h3e33;
              3'h6: out_r = 16'h3e34;
              3'h7: out_r = 16'h3e35;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3e36;
            case (mant_lo3)
              3'h1: out_r = 16'h3e37;
              3'h2: out_r = 16'h3e38;
              3'h3: out_r = 16'h3e39;
              3'h4: out_r = 16'h3e3a;
              3'h5: out_r = 16'h3e3b;
              3'h6: out_r = 16'h3e3c;
              3'h7: out_r = 16'h3e3d;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3e3e;
            case (mant_lo3)
              3'h1: out_r = 16'h3e3f;
              3'h2: out_r = 16'h3e40;
              3'h3: out_r = 16'h3e41;
              3'h4: out_r = 16'h3e42;
              3'h5: out_r = 16'h3e43;
              3'h6: out_r = 16'h3e44;
              3'h7: out_r = 16'h3e45;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3e45;
            case (mant_lo3)
              3'h1: out_r = 16'h3e46;
              3'h2: out_r = 16'h3e47;
              3'h3: out_r = 16'h3e48;
              3'h4: out_r = 16'h3e49;
              3'h5: out_r = 16'h3e4a;
              3'h6: out_r = 16'h3e4b;
              3'h7: out_r = 16'h3e4c;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3e4d;
            case (mant_lo3)
              3'h1: out_r = 16'h3e4e;
              3'h2: out_r = 16'h3e4f;
              3'h3: out_r = 16'h3e50;
              3'h4: out_r = 16'h3e51;
              3'h5: out_r = 16'h3e52;
              3'h6: out_r = 16'h3e53;
              3'h7: out_r = 16'h3e54;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3e55;
            case (mant_lo3)
              3'h1: out_r = 16'h3e56;
              3'h2: out_r = 16'h3e57;
              3'h3: out_r = 16'h3e58;
              3'h4: out_r = 16'h3e59;
              3'h5: out_r = 16'h3e5a;
              3'h6: out_r = 16'h3e5b;
              3'h7: out_r = 16'h3e5c;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3e5c;
            case (mant_lo3)
              3'h1: out_r = 16'h3e5d;
              3'h2: out_r = 16'h3e5e;
              3'h3: out_r = 16'h3e5f;
              3'h4: out_r = 16'h3e60;
              3'h5: out_r = 16'h3e61;
              3'h6: out_r = 16'h3e62;
              3'h7: out_r = 16'h3e63;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3e64;
            case (mant_lo3)
              3'h1: out_r = 16'h3e65;
              3'h2: out_r = 16'h3e66;
              3'h3: out_r = 16'h3e67;
              3'h4: out_r = 16'h3e68;
              3'h5: out_r = 16'h3e69;
              3'h6: out_r = 16'h3e6a;
              3'h7: out_r = 16'h3e6b;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3e6c;
            case (mant_lo3)
              3'h1: out_r = 16'h3e6d;
              3'h2: out_r = 16'h3e6e;
              3'h3: out_r = 16'h3e6f;
              3'h4: out_r = 16'h3e6f;
              3'h5: out_r = 16'h3e70;
              3'h6: out_r = 16'h3e71;
              3'h7: out_r = 16'h3e72;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3e73;
            case (mant_lo3)
              3'h1: out_r = 16'h3e74;
              3'h2: out_r = 16'h3e75;
              3'h3: out_r = 16'h3e76;
              3'h4: out_r = 16'h3e77;
              3'h5: out_r = 16'h3e78;
              3'h6: out_r = 16'h3e79;
              3'h7: out_r = 16'h3e7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3e7b;
            case (mant_lo3)
              3'h1: out_r = 16'h3e7d;
              3'h2: out_r = 16'h3e7f;
              3'h3: out_r = 16'h3e80;
              3'h4: out_r = 16'h3e81;
              3'h5: out_r = 16'h3e82;
              3'h6: out_r = 16'h3e83;
              3'h7: out_r = 16'h3e84;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3e85;
            case (mant_lo3)
              3'h1: out_r = 16'h3e86;
              3'h2: out_r = 16'h3e87;
              3'h3: out_r = 16'h3e88;
              3'h4: out_r = 16'h3e89;
              3'h5: out_r = 16'h3e8a;
              3'h6: out_r = 16'h3e8a;
              3'h7: out_r = 16'h3e8b;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3e8c;
            case (mant_lo3)
              3'h1: out_r = 16'h3e8d;
              3'h2: out_r = 16'h3e8e;
              3'h3: out_r = 16'h3e8f;
              3'h4: out_r = 16'h3e90;
              3'h5: out_r = 16'h3e91;
              3'h6: out_r = 16'h3e92;
              3'h7: out_r = 16'h3e93;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3e94;
            case (mant_lo3)
              3'h1: out_r = 16'h3e95;
              3'h2: out_r = 16'h3e96;
              3'h3: out_r = 16'h3e96;
              3'h4: out_r = 16'h3e97;
              3'h5: out_r = 16'h3e98;
              3'h6: out_r = 16'h3e99;
              3'h7: out_r = 16'h3e9a;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3e9b;
            case (mant_lo3)
              3'h1: out_r = 16'h3e9c;
              3'h2: out_r = 16'h3e9d;
              3'h3: out_r = 16'h3e9e;
              3'h4: out_r = 16'h3e9f;
              3'h5: out_r = 16'h3ea0;
              3'h6: out_r = 16'h3ea0;
              3'h7: out_r = 16'h3ea1;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3ea2;
            case (mant_lo3)
              3'h1: out_r = 16'h3ea3;
              3'h2: out_r = 16'h3ea4;
              3'h3: out_r = 16'h3ea5;
              3'h4: out_r = 16'h3ea6;
              3'h5: out_r = 16'h3ea7;
              3'h6: out_r = 16'h3ea8;
              3'h7: out_r = 16'h3ea8;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3ea9;
            case (mant_lo3)
              3'h1: out_r = 16'h3eaa;
              3'h2: out_r = 16'h3eab;
              3'h3: out_r = 16'h3eac;
              3'h4: out_r = 16'h3ead;
              3'h5: out_r = 16'h3eae;
              3'h6: out_r = 16'h3eaf;
              3'h7: out_r = 16'h3eb0;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3eb0;
            case (mant_lo3)
              3'h1: out_r = 16'h3eb1;
              3'h2: out_r = 16'h3eb2;
              3'h3: out_r = 16'h3eb3;
              3'h4: out_r = 16'h3eb4;
              3'h5: out_r = 16'h3eb5;
              3'h6: out_r = 16'h3eb6;
              3'h7: out_r = 16'h3eb7;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3eb7;
            case (mant_lo3)
              3'h1: out_r = 16'h3eb8;
              3'h2: out_r = 16'h3eb9;
              3'h3: out_r = 16'h3eba;
              3'h4: out_r = 16'h3ebb;
              3'h5: out_r = 16'h3ebc;
              3'h6: out_r = 16'h3ebd;
              3'h7: out_r = 16'h3ebe;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3ebe;
            case (mant_lo3)
              3'h1: out_r = 16'h3ebf;
              3'h2: out_r = 16'h3ec0;
              3'h3: out_r = 16'h3ec1;
              3'h4: out_r = 16'h3ec2;
              3'h5: out_r = 16'h3ec3;
              3'h6: out_r = 16'h3ec4;
              3'h7: out_r = 16'h3ec4;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3ec5;
            case (mant_lo3)
              3'h1: out_r = 16'h3ec6;
              3'h2: out_r = 16'h3ec7;
              3'h3: out_r = 16'h3ec8;
              3'h4: out_r = 16'h3ec9;
              3'h5: out_r = 16'h3eca;
              3'h6: out_r = 16'h3eca;
              3'h7: out_r = 16'h3ecb;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3ecc;
            case (mant_lo3)
              3'h1: out_r = 16'h3ecd;
              3'h2: out_r = 16'h3ece;
              3'h3: out_r = 16'h3ecf;
              3'h4: out_r = 16'h3ecf;
              3'h5: out_r = 16'h3ed0;
              3'h6: out_r = 16'h3ed1;
              3'h7: out_r = 16'h3ed2;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3ed3;
            case (mant_lo3)
              3'h1: out_r = 16'h3ed4;
              3'h2: out_r = 16'h3ed4;
              3'h3: out_r = 16'h3ed5;
              3'h4: out_r = 16'h3ed6;
              3'h5: out_r = 16'h3ed7;
              3'h6: out_r = 16'h3ed8;
              3'h7: out_r = 16'h3ed9;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3ed9;
            case (mant_lo3)
              3'h1: out_r = 16'h3eda;
              3'h2: out_r = 16'h3edb;
              3'h3: out_r = 16'h3edc;
              3'h4: out_r = 16'h3edd;
              3'h5: out_r = 16'h3edd;
              3'h6: out_r = 16'h3ede;
              3'h7: out_r = 16'h3edf;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3ee0;
            case (mant_lo3)
              3'h1: out_r = 16'h3ee1;
              3'h2: out_r = 16'h3ee1;
              3'h3: out_r = 16'h3ee2;
              3'h4: out_r = 16'h3ee3;
              3'h5: out_r = 16'h3ee4;
              3'h6: out_r = 16'h3ee5;
              3'h7: out_r = 16'h3ee5;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3ee6;
            case (mant_lo3)
              3'h1: out_r = 16'h3ee7;
              3'h2: out_r = 16'h3ee8;
              3'h3: out_r = 16'h3ee9;
              3'h4: out_r = 16'h3ee9;
              3'h5: out_r = 16'h3eea;
              3'h6: out_r = 16'h3eeb;
              3'h7: out_r = 16'h3eec;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3eed;
            case (mant_lo3)
              3'h1: out_r = 16'h3eee;
              3'h2: out_r = 16'h3ef0;
              3'h3: out_r = 16'h3ef1;
              3'h4: out_r = 16'h3ef3;
              3'h5: out_r = 16'h3ef4;
              3'h6: out_r = 16'h3ef6;
              3'h7: out_r = 16'h3ef7;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3ef9;
            case (mant_lo3)
              3'h1: out_r = 16'h3efb;
              3'h2: out_r = 16'h3efc;
              3'h3: out_r = 16'h3efe;
              3'h4: out_r = 16'h3eff;
              3'h5: out_r = 16'h3f00;
              3'h6: out_r = 16'h3f01;
              3'h7: out_r = 16'h3f02;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3f03;
            case (mant_lo3)
              3'h2: out_r = 16'h3f04;
              3'h3: out_r = 16'h3f05;
              3'h4: out_r = 16'h3f05;
              3'h5: out_r = 16'h3f06;
              3'h6: out_r = 16'h3f07;
              3'h7: out_r = 16'h3f08;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3f08;
            case (mant_lo3)
              3'h1: out_r = 16'h3f09;
              3'h2: out_r = 16'h3f0a;
              3'h3: out_r = 16'h3f0a;
              3'h4: out_r = 16'h3f0b;
              3'h5: out_r = 16'h3f0c;
              3'h6: out_r = 16'h3f0d;
              3'h7: out_r = 16'h3f0d;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3f0e;
            case (mant_lo3)
              3'h1: out_r = 16'h3f0f;
              3'h2: out_r = 16'h3f0f;
              3'h3: out_r = 16'h3f10;
              3'h4: out_r = 16'h3f11;
              3'h5: out_r = 16'h3f11;
              3'h6: out_r = 16'h3f12;
              3'h7: out_r = 16'h3f13;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3f13;
            case (mant_lo3)
              3'h1: out_r = 16'h3f14;
              3'h2: out_r = 16'h3f15;
              3'h3: out_r = 16'h3f15;
              3'h4: out_r = 16'h3f16;
              3'h5: out_r = 16'h3f17;
              3'h6: out_r = 16'h3f17;
              3'h7: out_r = 16'h3f18;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3f19;
            case (mant_lo3)
              3'h2: out_r = 16'h3f1a;
              3'h3: out_r = 16'h3f1b;
              3'h4: out_r = 16'h3f1b;
              3'h5: out_r = 16'h3f1c;
              3'h6: out_r = 16'h3f1c;
              3'h7: out_r = 16'h3f1d;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3f1e;
            case (mant_lo3)
              3'h2: out_r = 16'h3f1f;
              3'h3: out_r = 16'h3f20;
              3'h4: out_r = 16'h3f20;
              3'h5: out_r = 16'h3f21;
              3'h6: out_r = 16'h3f21;
              3'h7: out_r = 16'h3f22;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3f23;
            case (mant_lo3)
              3'h2: out_r = 16'h3f24;
              3'h3: out_r = 16'h3f24;
              3'h4: out_r = 16'h3f25;
              3'h5: out_r = 16'h3f26;
              3'h6: out_r = 16'h3f26;
              3'h7: out_r = 16'h3f27;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3f27;
            case (mant_lo3)
              3'h1: out_r = 16'h3f28;
              3'h2: out_r = 16'h3f28;
              3'h3: out_r = 16'h3f29;
              3'h4: out_r = 16'h3f2a;
              3'h5: out_r = 16'h3f2a;
              3'h6: out_r = 16'h3f2b;
              3'h7: out_r = 16'h3f2b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3f2c;
            case (mant_lo3)
              3'h2: out_r = 16'h3f2d;
              3'h3: out_r = 16'h3f2d;
              3'h4: out_r = 16'h3f2e;
              3'h5: out_r = 16'h3f2e;
              3'h6: out_r = 16'h3f2f;
              3'h7: out_r = 16'h3f30;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3f30;
            case (mant_lo3)
              3'h1: out_r = 16'h3f31;
              3'h2: out_r = 16'h3f31;
              3'h3: out_r = 16'h3f32;
              3'h4: out_r = 16'h3f32;
              3'h5: out_r = 16'h3f33;
              3'h6: out_r = 16'h3f33;
              3'h7: out_r = 16'h3f34;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3f34;
            case (mant_lo3)
              3'h1: out_r = 16'h3f35;
              3'h2: out_r = 16'h3f35;
              3'h3: out_r = 16'h3f36;
              3'h4: out_r = 16'h3f36;
              3'h5: out_r = 16'h3f37;
              3'h6: out_r = 16'h3f37;
              3'h7: out_r = 16'h3f38;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3f38;
            case (mant_lo3)
              3'h1: out_r = 16'h3f39;
              3'h2: out_r = 16'h3f39;
              3'h3: out_r = 16'h3f3a;
              3'h4: out_r = 16'h3f3a;
              3'h5: out_r = 16'h3f3b;
              3'h6: out_r = 16'h3f3b;
              3'h7: out_r = 16'h3f3b;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3f3c;
            case (mant_lo3)
              3'h2: out_r = 16'h3f3d;
              3'h3: out_r = 16'h3f3d;
              3'h4: out_r = 16'h3f3e;
              3'h5: out_r = 16'h3f3e;
              3'h6: out_r = 16'h3f3f;
              3'h7: out_r = 16'h3f3f;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3f40;
            case (mant_lo3)
              3'h3: out_r = 16'h3f41;
              3'h4: out_r = 16'h3f41;
              3'h5: out_r = 16'h3f42;
              3'h6: out_r = 16'h3f42;
              3'h7: out_r = 16'h3f43;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3f43;
            case (mant_lo3)
              3'h1: out_r = 16'h3f44;
              3'h2: out_r = 16'h3f45;
              3'h3: out_r = 16'h3f45;
              3'h4: out_r = 16'h3f46;
              3'h5: out_r = 16'h3f47;
              3'h6: out_r = 16'h3f48;
              3'h7: out_r = 16'h3f49;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3f49;
            case (mant_lo3)
              3'h1: out_r = 16'h3f4a;
              3'h2: out_r = 16'h3f4b;
              3'h3: out_r = 16'h3f4c;
              3'h4: out_r = 16'h3f4c;
              3'h5: out_r = 16'h3f4d;
              3'h6: out_r = 16'h3f4e;
              3'h7: out_r = 16'h3f4e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3f4f;
            case (mant_lo3)
              3'h1: out_r = 16'h3f50;
              3'h2: out_r = 16'h3f51;
              3'h3: out_r = 16'h3f51;
              3'h4: out_r = 16'h3f52;
              3'h5: out_r = 16'h3f53;
              3'h6: out_r = 16'h3f53;
              3'h7: out_r = 16'h3f54;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3f54;
            case (mant_lo3)
              3'h1: out_r = 16'h3f55;
              3'h2: out_r = 16'h3f56;
              3'h3: out_r = 16'h3f56;
              3'h4: out_r = 16'h3f57;
              3'h5: out_r = 16'h3f57;
              3'h6: out_r = 16'h3f58;
              3'h7: out_r = 16'h3f59;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'h3f59;
            case (mant_lo3)
              3'h1: out_r = 16'h3f5a;
              3'h2: out_r = 16'h3f5a;
              3'h3: out_r = 16'h3f5b;
              3'h4: out_r = 16'h3f5b;
              3'h5: out_r = 16'h3f5c;
              3'h6: out_r = 16'h3f5c;
              3'h7: out_r = 16'h3f5d;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'h3f5d;
            case (mant_lo3)
              3'h1: out_r = 16'h3f5e;
              3'h2: out_r = 16'h3f5e;
              3'h3: out_r = 16'h3f5f;
              3'h4: out_r = 16'h3f5f;
              3'h5: out_r = 16'h3f60;
              3'h6: out_r = 16'h3f60;
              3'h7: out_r = 16'h3f61;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3f61;
            case (mant_lo3)
              3'h1: out_r = 16'h3f62;
              3'h2: out_r = 16'h3f62;
              3'h3: out_r = 16'h3f63;
              3'h4: out_r = 16'h3f63;
              3'h5: out_r = 16'h3f63;
              3'h6: out_r = 16'h3f64;
              3'h7: out_r = 16'h3f64;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'h3f65;
            case (mant_lo3)
              3'h3: out_r = 16'h3f66;
              3'h4: out_r = 16'h3f66;
              3'h5: out_r = 16'h3f67;
              3'h6: out_r = 16'h3f67;
              3'h7: out_r = 16'h3f67;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3f68;
            case (mant_lo3)
              3'h3: out_r = 16'h3f69;
              3'h4: out_r = 16'h3f69;
              3'h5: out_r = 16'h3f69;
              3'h6: out_r = 16'h3f6a;
              3'h7: out_r = 16'h3f6a;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'h3f6a;
            case (mant_lo3)
              3'h1: out_r = 16'h3f6b;
              3'h2: out_r = 16'h3f6b;
              3'h3: out_r = 16'h3f6b;
              3'h4: out_r = 16'h3f6c;
              3'h5: out_r = 16'h3f6c;
              3'h6: out_r = 16'h3f6c;
              3'h7: out_r = 16'h3f6d;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'h3f6d;
            case (mant_lo3)
              3'h3: out_r = 16'h3f6e;
              3'h4: out_r = 16'h3f6e;
              3'h5: out_r = 16'h3f6e;
              3'h6: out_r = 16'h3f6f;
              3'h7: out_r = 16'h3f6f;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'h3f6f;
            case (mant_lo3)
              3'h2: out_r = 16'h3f70;
              3'h3: out_r = 16'h3f70;
              3'h4: out_r = 16'h3f70;
              3'h5: out_r = 16'h3f70;
              3'h6: out_r = 16'h3f71;
              3'h7: out_r = 16'h3f71;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3f71;
            case (mant_lo3)
              3'h3: out_r = 16'h3f72;
              3'h4: out_r = 16'h3f72;
              3'h5: out_r = 16'h3f72;
              3'h6: out_r = 16'h3f72;
              3'h7: out_r = 16'h3f73;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'h3f73;
            case (mant_lo3)
              3'h5: out_r = 16'h3f74;
              3'h6: out_r = 16'h3f74;
              3'h7: out_r = 16'h3f74;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'h3f74;
            case (mant_lo3)
              3'h2: out_r = 16'h3f75;
              3'h3: out_r = 16'h3f75;
              3'h4: out_r = 16'h3f75;
              3'h5: out_r = 16'h3f75;
              3'h6: out_r = 16'h3f75;
              3'h7: out_r = 16'h3f75;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'h3f76;
            case (mant_lo3)
              3'h6: out_r = 16'h3f77;
              3'h7: out_r = 16'h3f77;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3f77;
            case (mant_lo3)
              3'h3: out_r = 16'h3f78;
              3'h4: out_r = 16'h3f78;
              3'h5: out_r = 16'h3f78;
              3'h6: out_r = 16'h3f78;
              3'h7: out_r = 16'h3f79;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'h3f79;
            case (mant_lo3)
              3'h4: out_r = 16'h3f7a;
              3'h5: out_r = 16'h3f7a;
              3'h6: out_r = 16'h3f7a;
              3'h7: out_r = 16'h3f7a;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'h3f7a;
            case (mant_lo3)
              3'h1: out_r = 16'h3f7b;
              3'h2: out_r = 16'h3f7b;
              3'h3: out_r = 16'h3f7b;
              3'h4: out_r = 16'h3f7b;
              3'h5: out_r = 16'h3f7b;
              3'h6: out_r = 16'h3f7b;
              3'h7: out_r = 16'h3f7b;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'h3f7c;
          end
          4'h4: begin
            out_r = 16'h3f7d;
          end
          4'h5: begin
            out_r = 16'h3f7d;
            case (mant_lo3)
              3'h3: out_r = 16'h3f7e;
              3'h4: out_r = 16'h3f7e;
              3'h5: out_r = 16'h3f7e;
              3'h6: out_r = 16'h3f7e;
              3'h7: out_r = 16'h3f7e;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'h3f7e;
          end
          4'h7: begin
            out_r = 16'h3f7e;
            case (mant_lo3)
              3'h3: out_r = 16'h3f7f;
              3'h4: out_r = 16'h3f7f;
              3'h5: out_r = 16'h3f7f;
              3'h6: out_r = 16'h3f7f;
              3'h7: out_r = 16'h3f7f;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'h3f7f;
          end
          4'h9: begin
            out_r = 16'h3f7f;
          end
          4'ha: begin
            out_r = 16'h3f7f;
          end
          4'hb: begin
            out_r = 16'h3f7f;
            case (mant_lo3)
              3'h6: out_r = 16'h3f80;
              3'h7: out_r = 16'h3f80;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'h3f80;
          end
          4'hd: begin
            out_r = 16'h3f80;
          end
          4'he: begin
            out_r = 16'h3f80;
          end
          4'hf: begin
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
        case (mant_hi4)
          4'h0: begin
            out_r = 16'h3f80;
            case (mant_lo3)
              3'h1: out_r = 16'h7fc0;
              3'h2: out_r = 16'h7fc0;
              3'h3: out_r = 16'h7fc0;
              3'h4: out_r = 16'h7fc0;
              3'h5: out_r = 16'h7fc0;
              3'h6: out_r = 16'h7fc0;
              3'h7: out_r = 16'h7fc0;
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
          4'h7: begin
            out_r = 16'hbdb8;
            case (mant_lo3)
              3'h2: out_r = 16'hbdb9;
              3'h3: out_r = 16'hbdba;
              3'h4: out_r = 16'hbdbb;
              3'h5: out_r = 16'hbdbc;
              3'h6: out_r = 16'hbdbd;
              3'h7: out_r = 16'hbdbe;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbdbf;
            case (mant_lo3)
              3'h1: out_r = 16'hbdc0;
              3'h2: out_r = 16'hbdc1;
              3'h3: out_r = 16'hbdc2;
              3'h4: out_r = 16'hbdc3;
              3'h5: out_r = 16'hbdc4;
              3'h6: out_r = 16'hbdc5;
              3'h7: out_r = 16'hbdc6;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbdc7;
            case (mant_lo3)
              3'h1: out_r = 16'hbdc8;
              3'h2: out_r = 16'hbdc9;
              3'h3: out_r = 16'hbdca;
              3'h4: out_r = 16'hbdcb;
              3'h5: out_r = 16'hbdcc;
              3'h6: out_r = 16'hbdcd;
              3'h7: out_r = 16'hbdce;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbdcf;
            case (mant_lo3)
              3'h1: out_r = 16'hbdd0;
              3'h2: out_r = 16'hbdd1;
              3'h3: out_r = 16'hbdd2;
              3'h4: out_r = 16'hbdd3;
              3'h5: out_r = 16'hbdd4;
              3'h6: out_r = 16'hbdd5;
              3'h7: out_r = 16'hbdd6;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbdd7;
            case (mant_lo3)
              3'h1: out_r = 16'hbdd8;
              3'h2: out_r = 16'hbdd9;
              3'h3: out_r = 16'hbdda;
              3'h4: out_r = 16'hbddb;
              3'h5: out_r = 16'hbddc;
              3'h6: out_r = 16'hbddd;
              3'h7: out_r = 16'hbdde;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbddf;
            case (mant_lo3)
              3'h1: out_r = 16'hbde0;
              3'h2: out_r = 16'hbde1;
              3'h3: out_r = 16'hbde2;
              3'h4: out_r = 16'hbde3;
              3'h5: out_r = 16'hbde4;
              3'h6: out_r = 16'hbde5;
              3'h7: out_r = 16'hbde6;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbde7;
            case (mant_lo3)
              3'h1: out_r = 16'hbde8;
              3'h2: out_r = 16'hbde9;
              3'h3: out_r = 16'hbdea;
              3'h4: out_r = 16'hbdeb;
              3'h5: out_r = 16'hbdec;
              3'h6: out_r = 16'hbded;
              3'h7: out_r = 16'hbdee;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbdef;
            case (mant_lo3)
              3'h1: out_r = 16'hbdf0;
              3'h2: out_r = 16'hbdf1;
              3'h3: out_r = 16'hbdf2;
              3'h4: out_r = 16'hbdf3;
              3'h5: out_r = 16'hbdf4;
              3'h6: out_r = 16'hbdf5;
              3'h7: out_r = 16'hbdf6;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbdf7;
            case (mant_lo3)
              3'h1: out_r = 16'hbdf8;
              3'h2: out_r = 16'hbdf9;
              3'h3: out_r = 16'hbdfa;
              3'h4: out_r = 16'hbdfb;
              3'h5: out_r = 16'hbdfc;
              3'h6: out_r = 16'hbdfd;
              3'h7: out_r = 16'hbdfe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbdff;
            case (mant_lo3)
              3'h1: out_r = 16'hbe00;
              3'h2: out_r = 16'hbe01;
              3'h3: out_r = 16'hbe02;
              3'h4: out_r = 16'hbe03;
              3'h5: out_r = 16'hbe04;
              3'h6: out_r = 16'hbe05;
              3'h7: out_r = 16'hbe06;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbe07;
            case (mant_lo3)
              3'h1: out_r = 16'hbe08;
              3'h2: out_r = 16'hbe09;
              3'h3: out_r = 16'hbe0a;
              3'h4: out_r = 16'hbe0b;
              3'h5: out_r = 16'hbe0c;
              3'h6: out_r = 16'hbe0d;
              3'h7: out_r = 16'hbe0e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbe0f;
            case (mant_lo3)
              3'h1: out_r = 16'hbe10;
              3'h2: out_r = 16'hbe11;
              3'h3: out_r = 16'hbe12;
              3'h4: out_r = 16'hbe13;
              3'h5: out_r = 16'hbe14;
              3'h6: out_r = 16'hbe15;
              3'h7: out_r = 16'hbe16;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbe17;
            case (mant_lo3)
              3'h1: out_r = 16'hbe18;
              3'h2: out_r = 16'hbe19;
              3'h3: out_r = 16'hbe1a;
              3'h4: out_r = 16'hbe1b;
              3'h5: out_r = 16'hbe1c;
              3'h6: out_r = 16'hbe1d;
              3'h7: out_r = 16'hbe1e;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbe1f;
            case (mant_lo3)
              3'h1: out_r = 16'hbe20;
              3'h2: out_r = 16'hbe21;
              3'h3: out_r = 16'hbe22;
              3'h4: out_r = 16'hbe23;
              3'h5: out_r = 16'hbe24;
              3'h6: out_r = 16'hbe25;
              3'h7: out_r = 16'hbe26;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbe27;
            case (mant_lo3)
              3'h2: out_r = 16'hbe28;
              3'h3: out_r = 16'hbe29;
              3'h4: out_r = 16'hbe2a;
              3'h5: out_r = 16'hbe2b;
              3'h6: out_r = 16'hbe2c;
              3'h7: out_r = 16'hbe2d;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbe2e;
            case (mant_lo3)
              3'h1: out_r = 16'hbe2f;
              3'h2: out_r = 16'hbe30;
              3'h3: out_r = 16'hbe31;
              3'h4: out_r = 16'hbe32;
              3'h5: out_r = 16'hbe33;
              3'h6: out_r = 16'hbe34;
              3'h7: out_r = 16'hbe35;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbe36;
            case (mant_lo3)
              3'h1: out_r = 16'hbe37;
              3'h2: out_r = 16'hbe38;
              3'h3: out_r = 16'hbe39;
              3'h4: out_r = 16'hbe3a;
              3'h5: out_r = 16'hbe3b;
              3'h6: out_r = 16'hbe3c;
              3'h7: out_r = 16'hbe3d;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbe3e;
            case (mant_lo3)
              3'h1: out_r = 16'hbe3f;
              3'h2: out_r = 16'hbe40;
              3'h3: out_r = 16'hbe41;
              3'h4: out_r = 16'hbe42;
              3'h5: out_r = 16'hbe43;
              3'h6: out_r = 16'hbe44;
              3'h7: out_r = 16'hbe45;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbe45;
            case (mant_lo3)
              3'h1: out_r = 16'hbe46;
              3'h2: out_r = 16'hbe47;
              3'h3: out_r = 16'hbe48;
              3'h4: out_r = 16'hbe49;
              3'h5: out_r = 16'hbe4a;
              3'h6: out_r = 16'hbe4b;
              3'h7: out_r = 16'hbe4c;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbe4d;
            case (mant_lo3)
              3'h1: out_r = 16'hbe4e;
              3'h2: out_r = 16'hbe4f;
              3'h3: out_r = 16'hbe50;
              3'h4: out_r = 16'hbe51;
              3'h5: out_r = 16'hbe52;
              3'h6: out_r = 16'hbe53;
              3'h7: out_r = 16'hbe54;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbe55;
            case (mant_lo3)
              3'h1: out_r = 16'hbe56;
              3'h2: out_r = 16'hbe57;
              3'h3: out_r = 16'hbe58;
              3'h4: out_r = 16'hbe59;
              3'h5: out_r = 16'hbe5a;
              3'h6: out_r = 16'hbe5b;
              3'h7: out_r = 16'hbe5c;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbe5c;
            case (mant_lo3)
              3'h1: out_r = 16'hbe5d;
              3'h2: out_r = 16'hbe5e;
              3'h3: out_r = 16'hbe5f;
              3'h4: out_r = 16'hbe60;
              3'h5: out_r = 16'hbe61;
              3'h6: out_r = 16'hbe62;
              3'h7: out_r = 16'hbe63;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbe64;
            case (mant_lo3)
              3'h1: out_r = 16'hbe65;
              3'h2: out_r = 16'hbe66;
              3'h3: out_r = 16'hbe67;
              3'h4: out_r = 16'hbe68;
              3'h5: out_r = 16'hbe69;
              3'h6: out_r = 16'hbe6a;
              3'h7: out_r = 16'hbe6b;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbe6c;
            case (mant_lo3)
              3'h1: out_r = 16'hbe6d;
              3'h2: out_r = 16'hbe6e;
              3'h3: out_r = 16'hbe6f;
              3'h4: out_r = 16'hbe6f;
              3'h5: out_r = 16'hbe70;
              3'h6: out_r = 16'hbe71;
              3'h7: out_r = 16'hbe72;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbe73;
            case (mant_lo3)
              3'h1: out_r = 16'hbe74;
              3'h2: out_r = 16'hbe75;
              3'h3: out_r = 16'hbe76;
              3'h4: out_r = 16'hbe77;
              3'h5: out_r = 16'hbe78;
              3'h6: out_r = 16'hbe79;
              3'h7: out_r = 16'hbe7a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbe7b;
            case (mant_lo3)
              3'h1: out_r = 16'hbe7d;
              3'h2: out_r = 16'hbe7f;
              3'h3: out_r = 16'hbe80;
              3'h4: out_r = 16'hbe81;
              3'h5: out_r = 16'hbe82;
              3'h6: out_r = 16'hbe83;
              3'h7: out_r = 16'hbe84;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbe85;
            case (mant_lo3)
              3'h1: out_r = 16'hbe86;
              3'h2: out_r = 16'hbe87;
              3'h3: out_r = 16'hbe88;
              3'h4: out_r = 16'hbe89;
              3'h5: out_r = 16'hbe8a;
              3'h6: out_r = 16'hbe8a;
              3'h7: out_r = 16'hbe8b;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbe8c;
            case (mant_lo3)
              3'h1: out_r = 16'hbe8d;
              3'h2: out_r = 16'hbe8e;
              3'h3: out_r = 16'hbe8f;
              3'h4: out_r = 16'hbe90;
              3'h5: out_r = 16'hbe91;
              3'h6: out_r = 16'hbe92;
              3'h7: out_r = 16'hbe93;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbe94;
            case (mant_lo3)
              3'h1: out_r = 16'hbe95;
              3'h2: out_r = 16'hbe96;
              3'h3: out_r = 16'hbe96;
              3'h4: out_r = 16'hbe97;
              3'h5: out_r = 16'hbe98;
              3'h6: out_r = 16'hbe99;
              3'h7: out_r = 16'hbe9a;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbe9b;
            case (mant_lo3)
              3'h1: out_r = 16'hbe9c;
              3'h2: out_r = 16'hbe9d;
              3'h3: out_r = 16'hbe9e;
              3'h4: out_r = 16'hbe9f;
              3'h5: out_r = 16'hbea0;
              3'h6: out_r = 16'hbea0;
              3'h7: out_r = 16'hbea1;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbea2;
            case (mant_lo3)
              3'h1: out_r = 16'hbea3;
              3'h2: out_r = 16'hbea4;
              3'h3: out_r = 16'hbea5;
              3'h4: out_r = 16'hbea6;
              3'h5: out_r = 16'hbea7;
              3'h6: out_r = 16'hbea8;
              3'h7: out_r = 16'hbea8;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbea9;
            case (mant_lo3)
              3'h1: out_r = 16'hbeaa;
              3'h2: out_r = 16'hbeab;
              3'h3: out_r = 16'hbeac;
              3'h4: out_r = 16'hbead;
              3'h5: out_r = 16'hbeae;
              3'h6: out_r = 16'hbeaf;
              3'h7: out_r = 16'hbeb0;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbeb0;
            case (mant_lo3)
              3'h1: out_r = 16'hbeb1;
              3'h2: out_r = 16'hbeb2;
              3'h3: out_r = 16'hbeb3;
              3'h4: out_r = 16'hbeb4;
              3'h5: out_r = 16'hbeb5;
              3'h6: out_r = 16'hbeb6;
              3'h7: out_r = 16'hbeb7;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbeb7;
            case (mant_lo3)
              3'h1: out_r = 16'hbeb8;
              3'h2: out_r = 16'hbeb9;
              3'h3: out_r = 16'hbeba;
              3'h4: out_r = 16'hbebb;
              3'h5: out_r = 16'hbebc;
              3'h6: out_r = 16'hbebd;
              3'h7: out_r = 16'hbebe;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbebe;
            case (mant_lo3)
              3'h1: out_r = 16'hbebf;
              3'h2: out_r = 16'hbec0;
              3'h3: out_r = 16'hbec1;
              3'h4: out_r = 16'hbec2;
              3'h5: out_r = 16'hbec3;
              3'h6: out_r = 16'hbec4;
              3'h7: out_r = 16'hbec4;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbec5;
            case (mant_lo3)
              3'h1: out_r = 16'hbec6;
              3'h2: out_r = 16'hbec7;
              3'h3: out_r = 16'hbec8;
              3'h4: out_r = 16'hbec9;
              3'h5: out_r = 16'hbeca;
              3'h6: out_r = 16'hbeca;
              3'h7: out_r = 16'hbecb;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbecc;
            case (mant_lo3)
              3'h1: out_r = 16'hbecd;
              3'h2: out_r = 16'hbece;
              3'h3: out_r = 16'hbecf;
              3'h4: out_r = 16'hbecf;
              3'h5: out_r = 16'hbed0;
              3'h6: out_r = 16'hbed1;
              3'h7: out_r = 16'hbed2;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbed3;
            case (mant_lo3)
              3'h1: out_r = 16'hbed4;
              3'h2: out_r = 16'hbed4;
              3'h3: out_r = 16'hbed5;
              3'h4: out_r = 16'hbed6;
              3'h5: out_r = 16'hbed7;
              3'h6: out_r = 16'hbed8;
              3'h7: out_r = 16'hbed9;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbed9;
            case (mant_lo3)
              3'h1: out_r = 16'hbeda;
              3'h2: out_r = 16'hbedb;
              3'h3: out_r = 16'hbedc;
              3'h4: out_r = 16'hbedd;
              3'h5: out_r = 16'hbedd;
              3'h6: out_r = 16'hbede;
              3'h7: out_r = 16'hbedf;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbee0;
            case (mant_lo3)
              3'h1: out_r = 16'hbee1;
              3'h2: out_r = 16'hbee1;
              3'h3: out_r = 16'hbee2;
              3'h4: out_r = 16'hbee3;
              3'h5: out_r = 16'hbee4;
              3'h6: out_r = 16'hbee5;
              3'h7: out_r = 16'hbee5;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbee6;
            case (mant_lo3)
              3'h1: out_r = 16'hbee7;
              3'h2: out_r = 16'hbee8;
              3'h3: out_r = 16'hbee9;
              3'h4: out_r = 16'hbee9;
              3'h5: out_r = 16'hbeea;
              3'h6: out_r = 16'hbeeb;
              3'h7: out_r = 16'hbeec;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbeed;
            case (mant_lo3)
              3'h1: out_r = 16'hbeee;
              3'h2: out_r = 16'hbef0;
              3'h3: out_r = 16'hbef1;
              3'h4: out_r = 16'hbef3;
              3'h5: out_r = 16'hbef4;
              3'h6: out_r = 16'hbef6;
              3'h7: out_r = 16'hbef7;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbef9;
            case (mant_lo3)
              3'h1: out_r = 16'hbefb;
              3'h2: out_r = 16'hbefc;
              3'h3: out_r = 16'hbefe;
              3'h4: out_r = 16'hbeff;
              3'h5: out_r = 16'hbf00;
              3'h6: out_r = 16'hbf01;
              3'h7: out_r = 16'hbf02;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbf03;
            case (mant_lo3)
              3'h2: out_r = 16'hbf04;
              3'h3: out_r = 16'hbf05;
              3'h4: out_r = 16'hbf05;
              3'h5: out_r = 16'hbf06;
              3'h6: out_r = 16'hbf07;
              3'h7: out_r = 16'hbf08;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbf08;
            case (mant_lo3)
              3'h1: out_r = 16'hbf09;
              3'h2: out_r = 16'hbf0a;
              3'h3: out_r = 16'hbf0a;
              3'h4: out_r = 16'hbf0b;
              3'h5: out_r = 16'hbf0c;
              3'h6: out_r = 16'hbf0d;
              3'h7: out_r = 16'hbf0d;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbf0e;
            case (mant_lo3)
              3'h1: out_r = 16'hbf0f;
              3'h2: out_r = 16'hbf0f;
              3'h3: out_r = 16'hbf10;
              3'h4: out_r = 16'hbf11;
              3'h5: out_r = 16'hbf11;
              3'h6: out_r = 16'hbf12;
              3'h7: out_r = 16'hbf13;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbf13;
            case (mant_lo3)
              3'h1: out_r = 16'hbf14;
              3'h2: out_r = 16'hbf15;
              3'h3: out_r = 16'hbf15;
              3'h4: out_r = 16'hbf16;
              3'h5: out_r = 16'hbf17;
              3'h6: out_r = 16'hbf17;
              3'h7: out_r = 16'hbf18;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbf19;
            case (mant_lo3)
              3'h2: out_r = 16'hbf1a;
              3'h3: out_r = 16'hbf1b;
              3'h4: out_r = 16'hbf1b;
              3'h5: out_r = 16'hbf1c;
              3'h6: out_r = 16'hbf1c;
              3'h7: out_r = 16'hbf1d;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbf1e;
            case (mant_lo3)
              3'h2: out_r = 16'hbf1f;
              3'h3: out_r = 16'hbf20;
              3'h4: out_r = 16'hbf20;
              3'h5: out_r = 16'hbf21;
              3'h6: out_r = 16'hbf21;
              3'h7: out_r = 16'hbf22;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbf23;
            case (mant_lo3)
              3'h2: out_r = 16'hbf24;
              3'h3: out_r = 16'hbf24;
              3'h4: out_r = 16'hbf25;
              3'h5: out_r = 16'hbf26;
              3'h6: out_r = 16'hbf26;
              3'h7: out_r = 16'hbf27;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbf27;
            case (mant_lo3)
              3'h1: out_r = 16'hbf28;
              3'h2: out_r = 16'hbf28;
              3'h3: out_r = 16'hbf29;
              3'h4: out_r = 16'hbf2a;
              3'h5: out_r = 16'hbf2a;
              3'h6: out_r = 16'hbf2b;
              3'h7: out_r = 16'hbf2b;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbf2c;
            case (mant_lo3)
              3'h2: out_r = 16'hbf2d;
              3'h3: out_r = 16'hbf2d;
              3'h4: out_r = 16'hbf2e;
              3'h5: out_r = 16'hbf2e;
              3'h6: out_r = 16'hbf2f;
              3'h7: out_r = 16'hbf30;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbf30;
            case (mant_lo3)
              3'h1: out_r = 16'hbf31;
              3'h2: out_r = 16'hbf31;
              3'h3: out_r = 16'hbf32;
              3'h4: out_r = 16'hbf32;
              3'h5: out_r = 16'hbf33;
              3'h6: out_r = 16'hbf33;
              3'h7: out_r = 16'hbf34;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbf34;
            case (mant_lo3)
              3'h1: out_r = 16'hbf35;
              3'h2: out_r = 16'hbf35;
              3'h3: out_r = 16'hbf36;
              3'h4: out_r = 16'hbf36;
              3'h5: out_r = 16'hbf37;
              3'h6: out_r = 16'hbf37;
              3'h7: out_r = 16'hbf38;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbf38;
            case (mant_lo3)
              3'h1: out_r = 16'hbf39;
              3'h2: out_r = 16'hbf39;
              3'h3: out_r = 16'hbf3a;
              3'h4: out_r = 16'hbf3a;
              3'h5: out_r = 16'hbf3b;
              3'h6: out_r = 16'hbf3b;
              3'h7: out_r = 16'hbf3b;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbf3c;
            case (mant_lo3)
              3'h2: out_r = 16'hbf3d;
              3'h3: out_r = 16'hbf3d;
              3'h4: out_r = 16'hbf3e;
              3'h5: out_r = 16'hbf3e;
              3'h6: out_r = 16'hbf3f;
              3'h7: out_r = 16'hbf3f;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbf40;
            case (mant_lo3)
              3'h3: out_r = 16'hbf41;
              3'h4: out_r = 16'hbf41;
              3'h5: out_r = 16'hbf42;
              3'h6: out_r = 16'hbf42;
              3'h7: out_r = 16'hbf43;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbf43;
            case (mant_lo3)
              3'h1: out_r = 16'hbf44;
              3'h2: out_r = 16'hbf45;
              3'h3: out_r = 16'hbf45;
              3'h4: out_r = 16'hbf46;
              3'h5: out_r = 16'hbf47;
              3'h6: out_r = 16'hbf48;
              3'h7: out_r = 16'hbf49;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbf49;
            case (mant_lo3)
              3'h1: out_r = 16'hbf4a;
              3'h2: out_r = 16'hbf4b;
              3'h3: out_r = 16'hbf4c;
              3'h4: out_r = 16'hbf4c;
              3'h5: out_r = 16'hbf4d;
              3'h6: out_r = 16'hbf4e;
              3'h7: out_r = 16'hbf4e;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbf4f;
            case (mant_lo3)
              3'h1: out_r = 16'hbf50;
              3'h2: out_r = 16'hbf51;
              3'h3: out_r = 16'hbf51;
              3'h4: out_r = 16'hbf52;
              3'h5: out_r = 16'hbf53;
              3'h6: out_r = 16'hbf53;
              3'h7: out_r = 16'hbf54;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbf54;
            case (mant_lo3)
              3'h1: out_r = 16'hbf55;
              3'h2: out_r = 16'hbf56;
              3'h3: out_r = 16'hbf56;
              3'h4: out_r = 16'hbf57;
              3'h5: out_r = 16'hbf57;
              3'h6: out_r = 16'hbf58;
              3'h7: out_r = 16'hbf59;
              default: begin end
            endcase
          end
          4'h4: begin
            out_r = 16'hbf59;
            case (mant_lo3)
              3'h1: out_r = 16'hbf5a;
              3'h2: out_r = 16'hbf5a;
              3'h3: out_r = 16'hbf5b;
              3'h4: out_r = 16'hbf5b;
              3'h5: out_r = 16'hbf5c;
              3'h6: out_r = 16'hbf5c;
              3'h7: out_r = 16'hbf5d;
              default: begin end
            endcase
          end
          4'h5: begin
            out_r = 16'hbf5d;
            case (mant_lo3)
              3'h1: out_r = 16'hbf5e;
              3'h2: out_r = 16'hbf5e;
              3'h3: out_r = 16'hbf5f;
              3'h4: out_r = 16'hbf5f;
              3'h5: out_r = 16'hbf60;
              3'h6: out_r = 16'hbf60;
              3'h7: out_r = 16'hbf61;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbf61;
            case (mant_lo3)
              3'h1: out_r = 16'hbf62;
              3'h2: out_r = 16'hbf62;
              3'h3: out_r = 16'hbf63;
              3'h4: out_r = 16'hbf63;
              3'h5: out_r = 16'hbf63;
              3'h6: out_r = 16'hbf64;
              3'h7: out_r = 16'hbf64;
              default: begin end
            endcase
          end
          4'h7: begin
            out_r = 16'hbf65;
            case (mant_lo3)
              3'h3: out_r = 16'hbf66;
              3'h4: out_r = 16'hbf66;
              3'h5: out_r = 16'hbf67;
              3'h6: out_r = 16'hbf67;
              3'h7: out_r = 16'hbf67;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbf68;
            case (mant_lo3)
              3'h3: out_r = 16'hbf69;
              3'h4: out_r = 16'hbf69;
              3'h5: out_r = 16'hbf69;
              3'h6: out_r = 16'hbf6a;
              3'h7: out_r = 16'hbf6a;
              default: begin end
            endcase
          end
          4'h9: begin
            out_r = 16'hbf6a;
            case (mant_lo3)
              3'h1: out_r = 16'hbf6b;
              3'h2: out_r = 16'hbf6b;
              3'h3: out_r = 16'hbf6b;
              3'h4: out_r = 16'hbf6c;
              3'h5: out_r = 16'hbf6c;
              3'h6: out_r = 16'hbf6c;
              3'h7: out_r = 16'hbf6d;
              default: begin end
            endcase
          end
          4'ha: begin
            out_r = 16'hbf6d;
            case (mant_lo3)
              3'h3: out_r = 16'hbf6e;
              3'h4: out_r = 16'hbf6e;
              3'h5: out_r = 16'hbf6e;
              3'h6: out_r = 16'hbf6f;
              3'h7: out_r = 16'hbf6f;
              default: begin end
            endcase
          end
          4'hb: begin
            out_r = 16'hbf6f;
            case (mant_lo3)
              3'h2: out_r = 16'hbf70;
              3'h3: out_r = 16'hbf70;
              3'h4: out_r = 16'hbf70;
              3'h5: out_r = 16'hbf70;
              3'h6: out_r = 16'hbf71;
              3'h7: out_r = 16'hbf71;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbf71;
            case (mant_lo3)
              3'h3: out_r = 16'hbf72;
              3'h4: out_r = 16'hbf72;
              3'h5: out_r = 16'hbf72;
              3'h6: out_r = 16'hbf72;
              3'h7: out_r = 16'hbf73;
              default: begin end
            endcase
          end
          4'hd: begin
            out_r = 16'hbf73;
            case (mant_lo3)
              3'h5: out_r = 16'hbf74;
              3'h6: out_r = 16'hbf74;
              3'h7: out_r = 16'hbf74;
              default: begin end
            endcase
          end
          4'he: begin
            out_r = 16'hbf74;
            case (mant_lo3)
              3'h2: out_r = 16'hbf75;
              3'h3: out_r = 16'hbf75;
              3'h4: out_r = 16'hbf75;
              3'h5: out_r = 16'hbf75;
              3'h6: out_r = 16'hbf75;
              3'h7: out_r = 16'hbf75;
              default: begin end
            endcase
          end
          4'hf: begin
            out_r = 16'hbf76;
            case (mant_lo3)
              3'h6: out_r = 16'hbf77;
              3'h7: out_r = 16'hbf77;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbf77;
            case (mant_lo3)
              3'h3: out_r = 16'hbf78;
              3'h4: out_r = 16'hbf78;
              3'h5: out_r = 16'hbf78;
              3'h6: out_r = 16'hbf78;
              3'h7: out_r = 16'hbf79;
              default: begin end
            endcase
          end
          4'h1: begin
            out_r = 16'hbf79;
            case (mant_lo3)
              3'h4: out_r = 16'hbf7a;
              3'h5: out_r = 16'hbf7a;
              3'h6: out_r = 16'hbf7a;
              3'h7: out_r = 16'hbf7a;
              default: begin end
            endcase
          end
          4'h2: begin
            out_r = 16'hbf7a;
            case (mant_lo3)
              3'h1: out_r = 16'hbf7b;
              3'h2: out_r = 16'hbf7b;
              3'h3: out_r = 16'hbf7b;
              3'h4: out_r = 16'hbf7b;
              3'h5: out_r = 16'hbf7b;
              3'h6: out_r = 16'hbf7b;
              3'h7: out_r = 16'hbf7b;
              default: begin end
            endcase
          end
          4'h3: begin
            out_r = 16'hbf7c;
          end
          4'h4: begin
            out_r = 16'hbf7d;
          end
          4'h5: begin
            out_r = 16'hbf7d;
            case (mant_lo3)
              3'h3: out_r = 16'hbf7e;
              3'h4: out_r = 16'hbf7e;
              3'h5: out_r = 16'hbf7e;
              3'h6: out_r = 16'hbf7e;
              3'h7: out_r = 16'hbf7e;
              default: begin end
            endcase
          end
          4'h6: begin
            out_r = 16'hbf7e;
          end
          4'h7: begin
            out_r = 16'hbf7e;
            case (mant_lo3)
              3'h3: out_r = 16'hbf7f;
              3'h4: out_r = 16'hbf7f;
              3'h5: out_r = 16'hbf7f;
              3'h6: out_r = 16'hbf7f;
              3'h7: out_r = 16'hbf7f;
              default: begin end
            endcase
          end
          4'h8: begin
            out_r = 16'hbf7f;
          end
          4'h9: begin
            out_r = 16'hbf7f;
          end
          4'ha: begin
            out_r = 16'hbf7f;
          end
          4'hb: begin
            out_r = 16'hbf7f;
            case (mant_lo3)
              3'h6: out_r = 16'hbf80;
              3'h7: out_r = 16'hbf80;
              default: begin end
            endcase
          end
          4'hc: begin
            out_r = 16'hbf80;
          end
          4'hd: begin
            out_r = 16'hbf80;
          end
          4'he: begin
            out_r = 16'hbf80;
          end
          4'hf: begin
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
        case (mant_hi4)
          4'h0: begin
            out_r = 16'hbf80;
            case (mant_lo3)
              3'h1: out_r = 16'h7fc0;
              3'h2: out_r = 16'h7fc0;
              3'h3: out_r = 16'h7fc0;
              3'h4: out_r = 16'h7fc0;
              3'h5: out_r = 16'h7fc0;
              3'h6: out_r = 16'h7fc0;
              3'h7: out_r = 16'h7fc0;
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
