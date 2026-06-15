module ex207_bf16_tan_r94_odd_pos_passthrough_descriptor_h4(in, out);
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
  reg [15:0] pos_word;
  reg is_passthrough;
  always @* begin
    is_passthrough = 1'b0;
    casez (exp)
      8'b00000001: is_passthrough = 1'b1;
      8'b0000001?: is_passthrough = 1'b1;
      8'b000001??: is_passthrough = 1'b1;
      8'b00001???: is_passthrough = 1'b1;
      8'b0001????: is_passthrough = 1'b1;
      8'b001?????: is_passthrough = 1'b1;
      8'b010?????: is_passthrough = 1'b1;
      8'b0110????: is_passthrough = 1'b1;
      8'b01110???: is_passthrough = 1'b1;
      8'b0111100?: is_passthrough = 1'b1;
      8'b01111010: is_passthrough = 1'b1;
      default: begin end
    endcase
  end
  always @* begin
    pos_word = 16'h0000;
    casez (exp)
      8'b11111111: pos_word = 16'h7fc0;
      8'h7b: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3d80;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d81;
              3'h2: pos_word = 16'h3d82;
              3'h3: pos_word = 16'h3d83;
              3'h4: pos_word = 16'h3d84;
              3'h5: pos_word = 16'h3d85;
              3'h6: pos_word = 16'h3d86;
              3'h7: pos_word = 16'h3d87;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3d88;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d89;
              3'h2: pos_word = 16'h3d8a;
              3'h3: pos_word = 16'h3d8b;
              3'h4: pos_word = 16'h3d8c;
              3'h5: pos_word = 16'h3d8d;
              3'h6: pos_word = 16'h3d8e;
              3'h7: pos_word = 16'h3d8f;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3d90;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d91;
              3'h2: pos_word = 16'h3d92;
              3'h3: pos_word = 16'h3d93;
              3'h4: pos_word = 16'h3d94;
              3'h5: pos_word = 16'h3d95;
              3'h6: pos_word = 16'h3d96;
              3'h7: pos_word = 16'h3d97;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3d98;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d99;
              3'h2: pos_word = 16'h3d9a;
              3'h3: pos_word = 16'h3d9b;
              3'h4: pos_word = 16'h3d9c;
              3'h5: pos_word = 16'h3d9d;
              3'h6: pos_word = 16'h3d9e;
              3'h7: pos_word = 16'h3d9f;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3da0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3da1;
              3'h2: pos_word = 16'h3da2;
              3'h3: pos_word = 16'h3da3;
              3'h4: pos_word = 16'h3da4;
              3'h5: pos_word = 16'h3da5;
              3'h6: pos_word = 16'h3da6;
              3'h7: pos_word = 16'h3da7;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3da8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3da9;
              3'h2: pos_word = 16'h3daa;
              3'h3: pos_word = 16'h3dab;
              3'h4: pos_word = 16'h3dac;
              3'h5: pos_word = 16'h3dad;
              3'h6: pos_word = 16'h3dae;
              3'h7: pos_word = 16'h3daf;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3db0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3db1;
              3'h2: pos_word = 16'h3db2;
              3'h3: pos_word = 16'h3db3;
              3'h4: pos_word = 16'h3db4;
              3'h5: pos_word = 16'h3db5;
              3'h6: pos_word = 16'h3db6;
              3'h7: pos_word = 16'h3db7;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3db8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dba;
              3'h2: pos_word = 16'h3dbb;
              3'h3: pos_word = 16'h3dbc;
              3'h4: pos_word = 16'h3dbd;
              3'h5: pos_word = 16'h3dbe;
              3'h6: pos_word = 16'h3dbf;
              3'h7: pos_word = 16'h3dc0;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3dc1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dc2;
              3'h2: pos_word = 16'h3dc3;
              3'h3: pos_word = 16'h3dc4;
              3'h4: pos_word = 16'h3dc5;
              3'h5: pos_word = 16'h3dc6;
              3'h6: pos_word = 16'h3dc7;
              3'h7: pos_word = 16'h3dc8;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3dc9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dca;
              3'h2: pos_word = 16'h3dcb;
              3'h3: pos_word = 16'h3dcc;
              3'h4: pos_word = 16'h3dcd;
              3'h5: pos_word = 16'h3dce;
              3'h6: pos_word = 16'h3dcf;
              3'h7: pos_word = 16'h3dd0;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3dd1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dd2;
              3'h2: pos_word = 16'h3dd3;
              3'h3: pos_word = 16'h3dd4;
              3'h4: pos_word = 16'h3dd5;
              3'h5: pos_word = 16'h3dd6;
              3'h6: pos_word = 16'h3dd7;
              3'h7: pos_word = 16'h3dd8;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3dd9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dda;
              3'h2: pos_word = 16'h3ddb;
              3'h3: pos_word = 16'h3ddc;
              3'h4: pos_word = 16'h3ddd;
              3'h5: pos_word = 16'h3dde;
              3'h6: pos_word = 16'h3ddf;
              3'h7: pos_word = 16'h3de0;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3de1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3de2;
              3'h2: pos_word = 16'h3de3;
              3'h3: pos_word = 16'h3de4;
              3'h4: pos_word = 16'h3de5;
              3'h5: pos_word = 16'h3de6;
              3'h6: pos_word = 16'h3de7;
              3'h7: pos_word = 16'h3de8;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3de9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dea;
              3'h2: pos_word = 16'h3deb;
              3'h3: pos_word = 16'h3dec;
              3'h4: pos_word = 16'h3ded;
              3'h5: pos_word = 16'h3dee;
              3'h6: pos_word = 16'h3def;
              3'h7: pos_word = 16'h3df0;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3df1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3df2;
              3'h2: pos_word = 16'h3df3;
              3'h3: pos_word = 16'h3df4;
              3'h4: pos_word = 16'h3df5;
              3'h5: pos_word = 16'h3df6;
              3'h6: pos_word = 16'h3df7;
              3'h7: pos_word = 16'h3df8;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3df9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dfa;
              3'h2: pos_word = 16'h3dfb;
              3'h3: pos_word = 16'h3dfc;
              3'h4: pos_word = 16'h3dfd;
              3'h5: pos_word = 16'h3dfe;
              3'h6: pos_word = 16'h3dff;
              3'h7: pos_word = 16'h3e00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7c: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e01;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e02;
              3'h2: pos_word = 16'h3e03;
              3'h3: pos_word = 16'h3e04;
              3'h4: pos_word = 16'h3e05;
              3'h5: pos_word = 16'h3e06;
              3'h6: pos_word = 16'h3e07;
              3'h7: pos_word = 16'h3e08;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e09;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0a;
              3'h2: pos_word = 16'h3e0b;
              3'h3: pos_word = 16'h3e0c;
              3'h4: pos_word = 16'h3e0d;
              3'h5: pos_word = 16'h3e0e;
              3'h6: pos_word = 16'h3e0f;
              3'h7: pos_word = 16'h3e10;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e11;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e12;
              3'h2: pos_word = 16'h3e13;
              3'h3: pos_word = 16'h3e14;
              3'h4: pos_word = 16'h3e15;
              3'h5: pos_word = 16'h3e16;
              3'h6: pos_word = 16'h3e17;
              3'h7: pos_word = 16'h3e18;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e19;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e1a;
              3'h2: pos_word = 16'h3e1b;
              3'h3: pos_word = 16'h3e1c;
              3'h4: pos_word = 16'h3e1d;
              3'h5: pos_word = 16'h3e1e;
              3'h6: pos_word = 16'h3e1f;
              3'h7: pos_word = 16'h3e20;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e21;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e22;
              3'h2: pos_word = 16'h3e23;
              3'h3: pos_word = 16'h3e24;
              3'h4: pos_word = 16'h3e25;
              3'h5: pos_word = 16'h3e26;
              3'h6: pos_word = 16'h3e27;
              3'h7: pos_word = 16'h3e28;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3e2a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e2b;
              3'h2: pos_word = 16'h3e2c;
              3'h3: pos_word = 16'h3e2d;
              3'h4: pos_word = 16'h3e2e;
              3'h5: pos_word = 16'h3e2f;
              3'h6: pos_word = 16'h3e30;
              3'h7: pos_word = 16'h3e31;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e32;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e33;
              3'h2: pos_word = 16'h3e34;
              3'h3: pos_word = 16'h3e35;
              3'h4: pos_word = 16'h3e36;
              3'h5: pos_word = 16'h3e37;
              3'h6: pos_word = 16'h3e38;
              3'h7: pos_word = 16'h3e39;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e3a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e3b;
              3'h2: pos_word = 16'h3e3c;
              3'h3: pos_word = 16'h3e3d;
              3'h4: pos_word = 16'h3e3e;
              3'h5: pos_word = 16'h3e3f;
              3'h6: pos_word = 16'h3e40;
              3'h7: pos_word = 16'h3e41;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3e42;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e43;
              3'h2: pos_word = 16'h3e44;
              3'h3: pos_word = 16'h3e45;
              3'h4: pos_word = 16'h3e46;
              3'h5: pos_word = 16'h3e47;
              3'h6: pos_word = 16'h3e49;
              3'h7: pos_word = 16'h3e4a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3e4b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e4c;
              3'h2: pos_word = 16'h3e4d;
              3'h3: pos_word = 16'h3e4e;
              3'h4: pos_word = 16'h3e4f;
              3'h5: pos_word = 16'h3e50;
              3'h6: pos_word = 16'h3e51;
              3'h7: pos_word = 16'h3e52;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3e53;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e54;
              3'h2: pos_word = 16'h3e55;
              3'h3: pos_word = 16'h3e56;
              3'h4: pos_word = 16'h3e57;
              3'h5: pos_word = 16'h3e58;
              3'h6: pos_word = 16'h3e59;
              3'h7: pos_word = 16'h3e5a;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e5b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e5c;
              3'h2: pos_word = 16'h3e5d;
              3'h3: pos_word = 16'h3e5e;
              3'h4: pos_word = 16'h3e5f;
              3'h5: pos_word = 16'h3e60;
              3'h6: pos_word = 16'h3e62;
              3'h7: pos_word = 16'h3e63;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e64;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e65;
              3'h2: pos_word = 16'h3e66;
              3'h3: pos_word = 16'h3e67;
              3'h4: pos_word = 16'h3e68;
              3'h5: pos_word = 16'h3e69;
              3'h6: pos_word = 16'h3e6a;
              3'h7: pos_word = 16'h3e6b;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3e6c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e6d;
              3'h2: pos_word = 16'h3e6e;
              3'h3: pos_word = 16'h3e6f;
              3'h4: pos_word = 16'h3e70;
              3'h5: pos_word = 16'h3e71;
              3'h6: pos_word = 16'h3e72;
              3'h7: pos_word = 16'h3e73;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3e74;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e76;
              3'h2: pos_word = 16'h3e77;
              3'h3: pos_word = 16'h3e78;
              3'h4: pos_word = 16'h3e79;
              3'h5: pos_word = 16'h3e7a;
              3'h6: pos_word = 16'h3e7b;
              3'h7: pos_word = 16'h3e7c;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e81;
            case (mant_lo3)
              3'h0: pos_word = 16'h3e7d;
              3'h1: pos_word = 16'h3e7e;
              3'h2: pos_word = 16'h3e7f;
              3'h3: pos_word = 16'h3e80;
              3'h6: pos_word = 16'h3e82;
              3'h7: pos_word = 16'h3e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7d: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e83;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e84;
              3'h2: pos_word = 16'h3e85;
              3'h3: pos_word = 16'h3e86;
              3'h4: pos_word = 16'h3e87;
              3'h5: pos_word = 16'h3e88;
              3'h6: pos_word = 16'h3e89;
              3'h7: pos_word = 16'h3e8a;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e8b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e8c;
              3'h2: pos_word = 16'h3e8d;
              3'h3: pos_word = 16'h3e8f;
              3'h4: pos_word = 16'h3e90;
              3'h5: pos_word = 16'h3e91;
              3'h6: pos_word = 16'h3e92;
              3'h7: pos_word = 16'h3e93;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e94;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e95;
              3'h2: pos_word = 16'h3e96;
              3'h3: pos_word = 16'h3e97;
              3'h4: pos_word = 16'h3e98;
              3'h5: pos_word = 16'h3e99;
              3'h6: pos_word = 16'h3e9a;
              3'h7: pos_word = 16'h3e9c;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e9d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e9e;
              3'h2: pos_word = 16'h3e9f;
              3'h3: pos_word = 16'h3ea0;
              3'h4: pos_word = 16'h3ea1;
              3'h5: pos_word = 16'h3ea2;
              3'h6: pos_word = 16'h3ea3;
              3'h7: pos_word = 16'h3ea4;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ea5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea7;
              3'h2: pos_word = 16'h3ea8;
              3'h3: pos_word = 16'h3ea9;
              3'h4: pos_word = 16'h3eaa;
              3'h5: pos_word = 16'h3eab;
              3'h6: pos_word = 16'h3eac;
              3'h7: pos_word = 16'h3ead;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3eae;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eaf;
              3'h2: pos_word = 16'h3eb1;
              3'h3: pos_word = 16'h3eb2;
              3'h4: pos_word = 16'h3eb3;
              3'h5: pos_word = 16'h3eb4;
              3'h6: pos_word = 16'h3eb5;
              3'h7: pos_word = 16'h3eb6;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3eb7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb8;
              3'h2: pos_word = 16'h3eba;
              3'h3: pos_word = 16'h3ebb;
              3'h4: pos_word = 16'h3ebc;
              3'h5: pos_word = 16'h3ebd;
              3'h6: pos_word = 16'h3ebe;
              3'h7: pos_word = 16'h3ebf;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ec0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec1;
              3'h2: pos_word = 16'h3ec3;
              3'h3: pos_word = 16'h3ec4;
              3'h4: pos_word = 16'h3ec5;
              3'h5: pos_word = 16'h3ec6;
              3'h6: pos_word = 16'h3ec7;
              3'h7: pos_word = 16'h3ec8;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3eca;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ecb;
              3'h2: pos_word = 16'h3ecc;
              3'h3: pos_word = 16'h3ecd;
              3'h4: pos_word = 16'h3ece;
              3'h5: pos_word = 16'h3ecf;
              3'h6: pos_word = 16'h3ed0;
              3'h7: pos_word = 16'h3ed2;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3ed3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed4;
              3'h2: pos_word = 16'h3ed5;
              3'h3: pos_word = 16'h3ed6;
              3'h4: pos_word = 16'h3ed8;
              3'h5: pos_word = 16'h3ed9;
              3'h6: pos_word = 16'h3eda;
              3'h7: pos_word = 16'h3edb;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3edc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3edd;
              3'h2: pos_word = 16'h3edf;
              3'h3: pos_word = 16'h3ee0;
              3'h4: pos_word = 16'h3ee1;
              3'h5: pos_word = 16'h3ee2;
              3'h6: pos_word = 16'h3ee3;
              3'h7: pos_word = 16'h3ee5;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ee6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee7;
              3'h2: pos_word = 16'h3ee8;
              3'h3: pos_word = 16'h3ee9;
              3'h4: pos_word = 16'h3eeb;
              3'h5: pos_word = 16'h3eec;
              3'h6: pos_word = 16'h3eed;
              3'h7: pos_word = 16'h3eee;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3eef;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ef1;
              3'h2: pos_word = 16'h3ef2;
              3'h3: pos_word = 16'h3ef3;
              3'h4: pos_word = 16'h3ef4;
              3'h5: pos_word = 16'h3ef6;
              3'h6: pos_word = 16'h3ef7;
              3'h7: pos_word = 16'h3ef8;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f00;
            case (mant_lo3)
              3'h0: pos_word = 16'h3ef9;
              3'h1: pos_word = 16'h3efb;
              3'h2: pos_word = 16'h3efc;
              3'h3: pos_word = 16'h3efd;
              3'h4: pos_word = 16'h3efe;
              3'h7: pos_word = 16'h3f01;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f02;
            case (mant_lo3)
              3'h2: pos_word = 16'h3f03;
              3'h3: pos_word = 16'h3f04;
              3'h4: pos_word = 16'h3f04;
              3'h5: pos_word = 16'h3f05;
              3'h6: pos_word = 16'h3f05;
              3'h7: pos_word = 16'h3f06;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f07;
            case (mant_lo3)
              3'h2: pos_word = 16'h3f08;
              3'h3: pos_word = 16'h3f09;
              3'h4: pos_word = 16'h3f09;
              3'h5: pos_word = 16'h3f0a;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h3f0b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7e: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f0c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0d;
              3'h2: pos_word = 16'h3f0e;
              3'h3: pos_word = 16'h3f10;
              3'h4: pos_word = 16'h3f11;
              3'h5: pos_word = 16'h3f12;
              3'h6: pos_word = 16'h3f14;
              3'h7: pos_word = 16'h3f15;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f16;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f18;
              3'h2: pos_word = 16'h3f19;
              3'h3: pos_word = 16'h3f1a;
              3'h4: pos_word = 16'h3f1c;
              3'h5: pos_word = 16'h3f1d;
              3'h6: pos_word = 16'h3f1f;
              3'h7: pos_word = 16'h3f20;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f21;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f23;
              3'h2: pos_word = 16'h3f24;
              3'h3: pos_word = 16'h3f26;
              3'h4: pos_word = 16'h3f27;
              3'h5: pos_word = 16'h3f28;
              3'h6: pos_word = 16'h3f2a;
              3'h7: pos_word = 16'h3f2b;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f2d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2e;
              3'h2: pos_word = 16'h3f30;
              3'h3: pos_word = 16'h3f31;
              3'h4: pos_word = 16'h3f33;
              3'h5: pos_word = 16'h3f34;
              3'h6: pos_word = 16'h3f36;
              3'h7: pos_word = 16'h3f37;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f39;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'h3f3c;
              3'h3: pos_word = 16'h3f3d;
              3'h4: pos_word = 16'h3f3f;
              3'h5: pos_word = 16'h3f40;
              3'h6: pos_word = 16'h3f42;
              3'h7: pos_word = 16'h3f44;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f45;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f47;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'h3f4a;
              3'h4: pos_word = 16'h3f4c;
              3'h5: pos_word = 16'h3f4d;
              3'h6: pos_word = 16'h3f4f;
              3'h7: pos_word = 16'h3f51;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f52;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f54;
              3'h2: pos_word = 16'h3f56;
              3'h3: pos_word = 16'h3f57;
              3'h4: pos_word = 16'h3f59;
              3'h5: pos_word = 16'h3f5b;
              3'h6: pos_word = 16'h3f5c;
              3'h7: pos_word = 16'h3f5e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f60;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f62;
              3'h2: pos_word = 16'h3f64;
              3'h3: pos_word = 16'h3f65;
              3'h4: pos_word = 16'h3f67;
              3'h5: pos_word = 16'h3f69;
              3'h6: pos_word = 16'h3f6b;
              3'h7: pos_word = 16'h3f6d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f6e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f70;
              3'h2: pos_word = 16'h3f72;
              3'h3: pos_word = 16'h3f74;
              3'h4: pos_word = 16'h3f76;
              3'h5: pos_word = 16'h3f78;
              3'h6: pos_word = 16'h3f7a;
              3'h7: pos_word = 16'h3f7c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f7e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f80;
              3'h2: pos_word = 16'h3f81;
              3'h3: pos_word = 16'h3f82;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'h3f84;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'h3f86;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f87;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f88;
              3'h2: pos_word = 16'h3f89;
              3'h3: pos_word = 16'h3f8a;
              3'h4: pos_word = 16'h3f8b;
              3'h5: pos_word = 16'h3f8d;
              3'h6: pos_word = 16'h3f8e;
              3'h7: pos_word = 16'h3f8f;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f90;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f91;
              3'h2: pos_word = 16'h3f92;
              3'h3: pos_word = 16'h3f93;
              3'h4: pos_word = 16'h3f94;
              3'h5: pos_word = 16'h3f96;
              3'h6: pos_word = 16'h3f97;
              3'h7: pos_word = 16'h3f98;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f99;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9a;
              3'h2: pos_word = 16'h3f9c;
              3'h3: pos_word = 16'h3f9d;
              3'h4: pos_word = 16'h3f9e;
              3'h5: pos_word = 16'h3fa0;
              3'h6: pos_word = 16'h3fa1;
              3'h7: pos_word = 16'h3fa2;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3fa3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa5;
              3'h2: pos_word = 16'h3fa6;
              3'h3: pos_word = 16'h3fa7;
              3'h4: pos_word = 16'h3fa9;
              3'h5: pos_word = 16'h3faa;
              3'h6: pos_word = 16'h3fac;
              3'h7: pos_word = 16'h3fad;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fae;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb0;
              3'h2: pos_word = 16'h3fb1;
              3'h3: pos_word = 16'h3fb3;
              3'h4: pos_word = 16'h3fb4;
              3'h5: pos_word = 16'h3fb6;
              3'h6: pos_word = 16'h3fb7;
              3'h7: pos_word = 16'h3fb9;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3fba;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbc;
              3'h2: pos_word = 16'h3fbd;
              3'h3: pos_word = 16'h3fbf;
              3'h4: pos_word = 16'h3fc1;
              3'h5: pos_word = 16'h3fc2;
              3'h6: pos_word = 16'h3fc4;
              3'h7: pos_word = 16'h3fc6;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7f: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fc7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcb;
              3'h2: pos_word = 16'h3fce;
              3'h3: pos_word = 16'h3fd2;
              3'h4: pos_word = 16'h3fd6;
              3'h5: pos_word = 16'h3fda;
              3'h6: pos_word = 16'h3fde;
              3'h7: pos_word = 16'h3fe2;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fe6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fea;
              3'h2: pos_word = 16'h3fee;
              3'h3: pos_word = 16'h3ff3;
              3'h4: pos_word = 16'h3ff8;
              3'h5: pos_word = 16'h3ffc;
              3'h6: pos_word = 16'h4001;
              3'h7: pos_word = 16'h4003;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4006;
            case (mant_lo3)
              3'h1: pos_word = 16'h4009;
              3'h2: pos_word = 16'h400b;
              3'h3: pos_word = 16'h400e;
              3'h4: pos_word = 16'h4011;
              3'h5: pos_word = 16'h4015;
              3'h6: pos_word = 16'h4018;
              3'h7: pos_word = 16'h401b;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h401f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4022;
              3'h2: pos_word = 16'h4026;
              3'h3: pos_word = 16'h402a;
              3'h4: pos_word = 16'h402e;
              3'h5: pos_word = 16'h4033;
              3'h6: pos_word = 16'h4037;
              3'h7: pos_word = 16'h403c;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4041;
            case (mant_lo3)
              3'h1: pos_word = 16'h4046;
              3'h2: pos_word = 16'h404b;
              3'h3: pos_word = 16'h4051;
              3'h4: pos_word = 16'h4057;
              3'h5: pos_word = 16'h405d;
              3'h6: pos_word = 16'h4064;
              3'h7: pos_word = 16'h406b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4072;
            case (mant_lo3)
              3'h1: pos_word = 16'h407a;
              3'h2: pos_word = 16'h4081;
              3'h3: pos_word = 16'h4086;
              3'h4: pos_word = 16'h408b;
              3'h5: pos_word = 16'h4090;
              3'h6: pos_word = 16'h4095;
              3'h7: pos_word = 16'h409b;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h40a1;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a8;
              3'h2: pos_word = 16'h40b0;
              3'h3: pos_word = 16'h40b8;
              3'h4: pos_word = 16'h40c1;
              3'h5: pos_word = 16'h40ca;
              3'h6: pos_word = 16'h40d5;
              3'h7: pos_word = 16'h40e1;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h40ef;
            case (mant_lo3)
              3'h1: pos_word = 16'h40fe;
              3'h2: pos_word = 16'h4107;
              3'h3: pos_word = 16'h4111;
              3'h4: pos_word = 16'h411c;
              3'h5: pos_word = 16'h4129;
              3'h6: pos_word = 16'h4139;
              3'h7: pos_word = 16'h414b;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4162;
            case (mant_lo3)
              3'h1: pos_word = 16'h417e;
              3'h2: pos_word = 16'h4191;
              3'h3: pos_word = 16'h41a9;
              3'h4: pos_word = 16'h41ca;
              3'h5: pos_word = 16'h41fc;
              3'h6: pos_word = 16'h4227;
              3'h7: pos_word = 16'h4278;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h42f1;
            case (mant_lo3)
              3'h1: pos_word = 16'h4501;
              3'h2: pos_word = 16'hc308;
              3'h3: pos_word = 16'hc284;
              3'h4: pos_word = 16'hc22e;
              3'h5: pos_word = 16'hc202;
              3'h6: pos_word = 16'hc1cf;
              3'h7: pos_word = 16'hc1ac;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc193;
            case (mant_lo3)
              3'h1: pos_word = 16'hc181;
              3'h2: pos_word = 16'hc165;
              3'h3: pos_word = 16'hc14e;
              3'h4: pos_word = 16'hc13b;
              3'h5: pos_word = 16'hc12b;
              3'h6: pos_word = 16'hc11e;
              3'h7: pos_word = 16'hc112;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc108;
            case (mant_lo3)
              3'h1: pos_word = 16'hc100;
              3'h2: pos_word = 16'hc0f0;
              3'h3: pos_word = 16'hc0e3;
              3'h4: pos_word = 16'hc0d7;
              3'h5: pos_word = 16'hc0cc;
              3'h6: pos_word = 16'hc0c2;
              3'h7: pos_word = 16'hc0b9;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc0b1;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a9;
              3'h2: pos_word = 16'hc0a2;
              3'h3: pos_word = 16'hc09c;
              3'h4: pos_word = 16'hc096;
              3'h5: pos_word = 16'hc090;
              3'h6: pos_word = 16'hc08b;
              3'h7: pos_word = 16'hc086;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc082;
            case (mant_lo3)
              3'h1: pos_word = 16'hc07b;
              3'h2: pos_word = 16'hc073;
              3'h3: pos_word = 16'hc06c;
              3'h4: pos_word = 16'hc065;
              3'h5: pos_word = 16'hc05e;
              3'h6: pos_word = 16'hc058;
              3'h7: pos_word = 16'hc052;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc04c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc046;
              3'h2: pos_word = 16'hc041;
              3'h3: pos_word = 16'hc03c;
              3'h4: pos_word = 16'hc038;
              3'h5: pos_word = 16'hc033;
              3'h6: pos_word = 16'hc02f;
              3'h7: pos_word = 16'hc02b;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc027;
            case (mant_lo3)
              3'h1: pos_word = 16'hc023;
              3'h2: pos_word = 16'hc01f;
              3'h3: pos_word = 16'hc01c;
              3'h4: pos_word = 16'hc018;
              3'h5: pos_word = 16'hc015;
              3'h6: pos_word = 16'hc012;
              3'h7: pos_word = 16'hc00f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h80: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc00c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc006;
              3'h2: pos_word = 16'hc001;
              3'h3: pos_word = 16'hbff8;
              3'h4: pos_word = 16'hbfef;
              3'h5: pos_word = 16'hbfe6;
              3'h6: pos_word = 16'hbfde;
              3'h7: pos_word = 16'hbfd6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbfcf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc8;
              3'h2: pos_word = 16'hbfc1;
              3'h3: pos_word = 16'hbfbb;
              3'h4: pos_word = 16'hbfb5;
              3'h5: pos_word = 16'hbfaf;
              3'h6: pos_word = 16'hbfa9;
              3'h7: pos_word = 16'hbfa4;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf9f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9a;
              3'h2: pos_word = 16'hbf95;
              3'h3: pos_word = 16'hbf90;
              3'h4: pos_word = 16'hbf8c;
              3'h5: pos_word = 16'hbf87;
              3'h6: pos_word = 16'hbf83;
              3'h7: pos_word = 16'hbf7e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf77;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6f;
              3'h2: pos_word = 16'hbf68;
              3'h3: pos_word = 16'hbf60;
              3'h4: pos_word = 16'hbf59;
              3'h5: pos_word = 16'hbf53;
              3'h6: pos_word = 16'hbf4c;
              3'h7: pos_word = 16'hbf46;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf3f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf39;
              3'h2: pos_word = 16'hbf33;
              3'h3: pos_word = 16'hbf2d;
              3'h4: pos_word = 16'hbf27;
              3'h5: pos_word = 16'hbf22;
              3'h6: pos_word = 16'hbf1c;
              3'h7: pos_word = 16'hbf17;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf11;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0c;
              3'h2: pos_word = 16'hbf07;
              3'h3: pos_word = 16'hbf02;
              3'h4: pos_word = 16'hbefa;
              3'h5: pos_word = 16'hbef0;
              3'h6: pos_word = 16'hbee6;
              3'h7: pos_word = 16'hbedd;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbed3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeca;
              3'h2: pos_word = 16'hbec1;
              3'h3: pos_word = 16'hbeb8;
              3'h4: pos_word = 16'hbeaf;
              3'h5: pos_word = 16'hbea6;
              3'h6: pos_word = 16'hbe9d;
              3'h7: pos_word = 16'hbe94;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe83;
              3'h2: pos_word = 16'hbe76;
              3'h3: pos_word = 16'hbe65;
              3'h4: pos_word = 16'hbe54;
              3'h5: pos_word = 16'hbe43;
              3'h6: pos_word = 16'hbe33;
              3'h7: pos_word = 16'hbe22;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe12;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe02;
              3'h2: pos_word = 16'hbde3;
              3'h3: pos_word = 16'hbdc3;
              3'h4: pos_word = 16'hbda2;
              3'h5: pos_word = 16'hbd82;
              3'h6: pos_word = 16'hbd44;
              3'h7: pos_word = 16'hbd04;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbc88;
            case (mant_lo3)
              3'h1: pos_word = 16'hba7e;
              3'h2: pos_word = 16'h3c70;
              3'h3: pos_word = 16'h3cf8;
              3'h4: pos_word = 16'h3d3c;
              3'h5: pos_word = 16'h3d7c;
              3'h6: pos_word = 16'h3d9e;
              3'h7: pos_word = 16'h3dbf;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3ddf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dff;
              3'h2: pos_word = 16'h3e10;
              3'h3: pos_word = 16'h3e20;
              3'h4: pos_word = 16'h3e31;
              3'h5: pos_word = 16'h3e41;
              3'h6: pos_word = 16'h3e52;
              3'h7: pos_word = 16'h3e63;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e73;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e82;
              3'h2: pos_word = 16'h3e8b;
              3'h3: pos_word = 16'h3e93;
              3'h4: pos_word = 16'h3e9c;
              3'h5: pos_word = 16'h3ea5;
              3'h6: pos_word = 16'h3eae;
              3'h7: pos_word = 16'h3eb7;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3ec0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec9;
              3'h2: pos_word = 16'h3ed2;
              3'h3: pos_word = 16'h3edc;
              3'h4: pos_word = 16'h3ee5;
              3'h5: pos_word = 16'h3eef;
              3'h6: pos_word = 16'h3ef9;
              3'h7: pos_word = 16'h3f01;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f06;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0c;
              3'h2: pos_word = 16'h3f11;
              3'h3: pos_word = 16'h3f16;
              3'h4: pos_word = 16'h3f1c;
              3'h5: pos_word = 16'h3f21;
              3'h6: pos_word = 16'h3f27;
              3'h7: pos_word = 16'h3f2c;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f32;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f38;
              3'h2: pos_word = 16'h3f3e;
              3'h3: pos_word = 16'h3f45;
              3'h4: pos_word = 16'h3f4b;
              3'h5: pos_word = 16'h3f52;
              3'h6: pos_word = 16'h3f59;
              3'h7: pos_word = 16'h3f60;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f67;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6e;
              3'h2: pos_word = 16'h3f76;
              3'h3: pos_word = 16'h3f7d;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'h3f87;
              3'h6: pos_word = 16'h3f8b;
              3'h7: pos_word = 16'h3f90;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h81: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f94;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9e;
              3'h2: pos_word = 16'h3fa8;
              3'h3: pos_word = 16'h3fb4;
              3'h4: pos_word = 16'h3fc0;
              3'h5: pos_word = 16'h3fce;
              3'h6: pos_word = 16'h3fdd;
              3'h7: pos_word = 16'h3fee;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h4000;
            case (mant_lo3)
              3'h1: pos_word = 16'h400b;
              3'h2: pos_word = 16'h4017;
              3'h3: pos_word = 16'h4026;
              3'h4: pos_word = 16'h4036;
              3'h5: pos_word = 16'h404a;
              3'h6: pos_word = 16'h4063;
              3'h7: pos_word = 16'h4081;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4094;
            case (mant_lo3)
              3'h1: pos_word = 16'h40af;
              3'h2: pos_word = 16'h40d4;
              3'h3: pos_word = 16'h4106;
              3'h4: pos_word = 16'h4137;
              3'h5: pos_word = 16'h418e;
              3'h6: pos_word = 16'h4221;
              3'h7: pos_word = 16'hc31d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc1d5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc168;
              3'h2: pos_word = 16'hc11f;
              3'h3: pos_word = 16'hc0f2;
              3'h4: pos_word = 16'hc0c3;
              3'h5: pos_word = 16'hc0a3;
              3'h6: pos_word = 16'hc08c;
              3'h7: pos_word = 16'hc074;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc058;
            case (mant_lo3)
              3'h1: pos_word = 16'hc042;
              3'h2: pos_word = 16'hc02f;
              3'h3: pos_word = 16'hc020;
              3'h4: pos_word = 16'hc012;
              3'h5: pos_word = 16'hc007;
              3'h6: pos_word = 16'hbff9;
              3'h7: pos_word = 16'hbfe7;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfd7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc8;
              3'h2: pos_word = 16'hbfbb;
              3'h3: pos_word = 16'hbfaf;
              3'h4: pos_word = 16'hbfa4;
              3'h5: pos_word = 16'hbf9a;
              3'h6: pos_word = 16'hbf90;
              3'h7: pos_word = 16'hbf88;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf7f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6f;
              3'h2: pos_word = 16'hbf61;
              3'h3: pos_word = 16'hbf53;
              3'h4: pos_word = 16'hbf46;
              3'h5: pos_word = 16'hbf39;
              3'h6: pos_word = 16'hbf2e;
              3'h7: pos_word = 16'hbf22;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf17;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0c;
              3'h2: pos_word = 16'hbf02;
              3'h3: pos_word = 16'hbef1;
              3'h4: pos_word = 16'hbedd;
              3'h5: pos_word = 16'hbecb;
              3'h6: pos_word = 16'hbeb8;
              3'h7: pos_word = 16'hbea7;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe95;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe84;
              3'h2: pos_word = 16'hbe66;
              3'h3: pos_word = 16'hbe44;
              3'h4: pos_word = 16'hbe23;
              3'h5: pos_word = 16'hbe03;
              3'h6: pos_word = 16'hbdc5;
              3'h7: pos_word = 16'hbd84;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbd08;
            case (mant_lo3)
              3'h1: pos_word = 16'hbafe;
              3'h2: pos_word = 16'h3cf0;
              3'h3: pos_word = 16'h3d78;
              3'h4: pos_word = 16'h3dbd;
              3'h5: pos_word = 16'h3dfd;
              3'h6: pos_word = 16'h3e1f;
              3'h7: pos_word = 16'h3e40;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3e62;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e82;
              3'h2: pos_word = 16'h3e93;
              3'h3: pos_word = 16'h3ea4;
              3'h4: pos_word = 16'h3eb6;
              3'h5: pos_word = 16'h3ec8;
              3'h6: pos_word = 16'h3edb;
              3'h7: pos_word = 16'h3eee;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f01;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0b;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h3f21;
              3'h4: pos_word = 16'h3f2c;
              3'h5: pos_word = 16'h3f38;
              3'h6: pos_word = 16'h3f44;
              3'h7: pos_word = 16'h3f51;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f5f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6e;
              3'h2: pos_word = 16'h3f7d;
              3'h3: pos_word = 16'h3f87;
              3'h4: pos_word = 16'h3f8f;
              3'h5: pos_word = 16'h3f99;
              3'h6: pos_word = 16'h3fa3;
              3'h7: pos_word = 16'h3fae;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3fba;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc7;
              3'h2: pos_word = 16'h3fd5;
              3'h3: pos_word = 16'h3fe5;
              3'h4: pos_word = 16'h3ff6;
              3'h5: pos_word = 16'h4005;
              3'h6: pos_word = 16'h4011;
              3'h7: pos_word = 16'h401e;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h402d;
            case (mant_lo3)
              3'h1: pos_word = 16'h403f;
              3'h2: pos_word = 16'h4055;
              3'h3: pos_word = 16'h4070;
              3'h4: pos_word = 16'h4089;
              3'h5: pos_word = 16'h40a0;
              3'h6: pos_word = 16'h40be;
              3'h7: pos_word = 16'h40eb;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4119;
            case (mant_lo3)
              3'h1: pos_word = 16'h415c;
              3'h2: pos_word = 16'h41c1;
              3'h3: pos_word = 16'h42c3;
              3'h4: pos_word = 16'hc23e;
              3'h5: pos_word = 16'hc199;
              3'h6: pos_word = 16'hc13f;
              3'h7: pos_word = 16'hc10b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h82: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc0da;
            case (mant_lo3)
              3'h1: pos_word = 16'hc097;
              3'h2: pos_word = 16'hc066;
              3'h3: pos_word = 16'hc039;
              3'h4: pos_word = 16'hc019;
              3'h5: pos_word = 16'hc002;
              3'h6: pos_word = 16'hbfdf;
              3'h7: pos_word = 16'hbfc2;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbfaa;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf95;
              3'h2: pos_word = 16'hbf84;
              3'h3: pos_word = 16'hbf68;
              3'h4: pos_word = 16'hbf4d;
              3'h5: pos_word = 16'hbf34;
              3'h6: pos_word = 16'hbf1d;
              3'h7: pos_word = 16'hbf08;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbee8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec2;
              3'h2: pos_word = 16'hbe9e;
              3'h3: pos_word = 16'hbe78;
              3'h4: pos_word = 16'hbe35;
              3'h5: pos_word = 16'hbde7;
              3'h6: pos_word = 16'hbd4c;
              3'h7: pos_word = 16'h3c50;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3d9a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0e;
              3'h2: pos_word = 16'h3e50;
              3'h3: pos_word = 16'h3e8a;
              3'h4: pos_word = 16'h3ead;
              3'h5: pos_word = 16'h3ed1;
              3'h6: pos_word = 16'h3ef7;
              3'h7: pos_word = 16'h3f10;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f26;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3e;
              3'h2: pos_word = 16'h3f58;
              3'h3: pos_word = 16'h3f75;
              3'h4: pos_word = 16'h3f8b;
              3'h5: pos_word = 16'h3f9d;
              3'h6: pos_word = 16'h3fb3;
              3'h7: pos_word = 16'h3fcd;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3fed;
            case (mant_lo3)
              3'h1: pos_word = 16'h400a;
              3'h2: pos_word = 16'h4025;
              3'h3: pos_word = 16'h4049;
              3'h4: pos_word = 16'h407f;
              3'h5: pos_word = 16'h40ad;
              3'h6: pos_word = 16'h4104;
              3'h7: pos_word = 16'h418a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc362;
            case (mant_lo3)
              3'h1: pos_word = 16'hc16f;
              3'h2: pos_word = 16'hc0f6;
              3'h3: pos_word = 16'hc0a5;
              3'h4: pos_word = 16'hc076;
              3'h5: pos_word = 16'hc043;
              3'h6: pos_word = 16'hc021;
              3'h7: pos_word = 16'hc007;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfe8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc9;
              3'h2: pos_word = 16'hbfb0;
              3'h3: pos_word = 16'hbf9a;
              3'h4: pos_word = 16'hbf88;
              3'h5: pos_word = 16'hbf70;
              3'h6: pos_word = 16'hbf54;
              3'h7: pos_word = 16'hbf3a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf23;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0d;
              3'h2: pos_word = 16'hbef2;
              3'h3: pos_word = 16'hbecc;
              3'h4: pos_word = 16'hbea8;
              3'h5: pos_word = 16'hbe85;
              3'h6: pos_word = 16'hbe46;
              3'h7: pos_word = 16'hbe05;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbd88;
            case (mant_lo3)
              3'h1: pos_word = 16'hbb7e;
              3'h2: pos_word = 16'h3d70;
              3'h3: pos_word = 16'h3df9;
              3'h4: pos_word = 16'h3e3e;
              3'h5: pos_word = 16'h3e81;
              3'h6: pos_word = 16'h3ea3;
              3'h7: pos_word = 16'h3ec7;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3eed;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0b;
              3'h2: pos_word = 16'h3f20;
              3'h3: pos_word = 16'h3f37;
              3'h4: pos_word = 16'h3f51;
              3'h5: pos_word = 16'h3f6d;
              3'h6: pos_word = 16'h3f86;
              3'h7: pos_word = 16'h3f98;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fad;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc6;
              3'h2: pos_word = 16'h3fe4;
              3'h3: pos_word = 16'h4005;
              3'h4: pos_word = 16'h401d;
              3'h5: pos_word = 16'h403e;
              3'h6: pos_word = 16'h406f;
              3'h7: pos_word = 16'h409e;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h40e8;
            case (mant_lo3)
              3'h1: pos_word = 16'h4156;
              3'h2: pos_word = 16'h42a4;
              3'h3: pos_word = 16'hc19f;
              3'h4: pos_word = 16'hc10d;
              3'h5: pos_word = 16'hc0b5;
              3'h6: pos_word = 16'hc084;
              3'h7: pos_word = 16'hc04f;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc029;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00d;
              3'h2: pos_word = 16'hbff1;
              3'h3: pos_word = 16'hbfd1;
              3'h4: pos_word = 16'hbfb6;
              3'h5: pos_word = 16'hbfa0;
              3'h6: pos_word = 16'hbf8d;
              3'h7: pos_word = 16'hbf78;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf5b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf41;
              3'h2: pos_word = 16'hbf29;
              3'h3: pos_word = 16'hbf13;
              3'h4: pos_word = 16'hbefc;
              3'h5: pos_word = 16'hbed6;
              3'h6: pos_word = 16'hbeb1;
              3'h7: pos_word = 16'hbe8e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe58;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe16;
              3'h2: pos_word = 16'hbdaa;
              3'h3: pos_word = 16'hbca8;
              3'h4: pos_word = 16'h3d2c;
              3'h5: pos_word = 16'h3dd7;
              3'h6: pos_word = 16'h3e2d;
              3'h7: pos_word = 16'h3e6f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h83: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e9a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee3;
              3'h2: pos_word = 16'h3f1a;
              3'h3: pos_word = 16'h3f4a;
              3'h4: pos_word = 16'h3f82;
              3'h5: pos_word = 16'h3fa7;
              3'h6: pos_word = 16'h3fdb;
              3'h7: pos_word = 16'h4016;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h4060;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ce;
              3'h2: pos_word = 16'h420b;
              3'h3: pos_word = 16'hc126;
              3'h4: pos_word = 16'hc08e;
              3'h5: pos_word = 16'hc031;
              3'h6: pos_word = 16'hbffb;
              3'h7: pos_word = 16'hbfbd;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf63;
              3'h2: pos_word = 16'hbf2f;
              3'h3: pos_word = 16'hbf04;
              3'h4: pos_word = 16'hbebb;
              3'h5: pos_word = 16'hbe6a;
              3'h6: pos_word = 16'hbdcd;
              3'h7: pos_word = 16'h3cd0;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e1b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e91;
              3'h2: pos_word = 16'h3ed9;
              3'h3: pos_word = 16'h3f14;
              3'h4: pos_word = 16'h3f43;
              3'h5: pos_word = 16'h3f7b;
              3'h6: pos_word = 16'h3fa1;
              3'h7: pos_word = 16'h3fd3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h400f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4052;
              3'h2: pos_word = 16'h40ba;
              3'h3: pos_word = 16'h41b0;
              3'h4: pos_word = 16'hc148;
              3'h5: pos_word = 16'hc09a;
              3'h6: pos_word = 16'hc03b;
              3'h7: pos_word = 16'hc003;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfc4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf97;
              3'h2: pos_word = 16'hbf6a;
              3'h3: pos_word = 16'hbf35;
              3'h4: pos_word = 16'hbf09;
              3'h5: pos_word = 16'hbec4;
              3'h6: pos_word = 16'hbe7c;
              3'h7: pos_word = 16'hbdef;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3c11;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0a;
              3'h2: pos_word = 16'h3e88;
              3'h3: pos_word = 16'h3ecf;
              3'h4: pos_word = 16'h3f0f;
              3'h5: pos_word = 16'h3f3c;
              3'h6: pos_word = 16'h3f73;
              3'h7: pos_word = 16'h3f9c;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3fcb;
            case (mant_lo3)
              3'h1: pos_word = 16'h4009;
              3'h2: pos_word = 16'h4046;
              3'h3: pos_word = 16'h40a9;
              3'h4: pos_word = 16'h4181;
              3'h5: pos_word = 16'hc17d;
              3'h6: pos_word = 16'hc0a8;
              3'h7: pos_word = 16'hc046;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc009;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfcb;
              3'h2: pos_word = 16'hbf9c;
              3'h3: pos_word = 16'hbf72;
              3'h4: pos_word = 16'hbf3c;
              3'h5: pos_word = 16'hbf0e;
              3'h6: pos_word = 16'hbece;
              3'h7: pos_word = 16'hbe87;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe09;
            case (mant_lo3)
              3'h1: pos_word = 16'hbbfe;
              3'h2: pos_word = 16'h3df1;
              3'h3: pos_word = 16'h3e7d;
              3'h4: pos_word = 16'h3ec5;
              3'h5: pos_word = 16'h3f09;
              3'h6: pos_word = 16'h3f36;
              3'h7: pos_word = 16'h3f6b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f97;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc4;
              3'h2: pos_word = 16'h4003;
              3'h3: pos_word = 16'h403c;
              3'h4: pos_word = 16'h409b;
              3'h5: pos_word = 16'h414b;
              3'h6: pos_word = 16'hc1ac;
              3'h7: pos_word = 16'hc0b9;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc052;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00f;
              3'h2: pos_word = 16'hbfd2;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'hbf7a;
              3'h5: pos_word = 16'hbf42;
              3'h6: pos_word = 16'hbf14;
              3'h7: pos_word = 16'hbed8;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbe90;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe1a;
              3'h2: pos_word = 16'hbcc7;
              3'h3: pos_word = 16'h3dcf;
              3'h4: pos_word = 16'h3e6b;
              3'h5: pos_word = 16'h3ebb;
              3'h6: pos_word = 16'h3f04;
              3'h7: pos_word = 16'h3f2f;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f63;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f92;
              3'h2: pos_word = 16'h3fbd;
              3'h3: pos_word = 16'h3ffc;
              3'h4: pos_word = 16'h4032;
              3'h5: pos_word = 16'h408f;
              3'h6: pos_word = 16'h4128;
              3'h7: pos_word = 16'hc206;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc0cd;
            case (mant_lo3)
              3'h1: pos_word = 16'hc05f;
              3'h2: pos_word = 16'hc015;
              3'h3: pos_word = 16'hbfdb;
              3'h4: pos_word = 16'hbfa7;
              3'h5: pos_word = 16'hbf81;
              3'h6: pos_word = 16'hbf49;
              3'h7: pos_word = 16'hbf1a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbee2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe99;
              3'h2: pos_word = 16'hbe2b;
              3'h3: pos_word = 16'hbd28;
              3'h4: pos_word = 16'h3dad;
              3'h5: pos_word = 16'h3e59;
              3'h6: pos_word = 16'h3eb2;
              3'h7: pos_word = 16'h3efd;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h84: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f29;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8d;
              3'h2: pos_word = 16'h3ff2;
              3'h3: pos_word = 16'h4085;
              3'h4: pos_word = 16'hc297;
              3'h5: pos_word = 16'hc06d;
              3'h6: pos_word = 16'hbfe3;
              3'h7: pos_word = 16'hbf86;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf20;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea3;
              3'h2: pos_word = 16'hbd6c;
              3'h3: pos_word = 16'h3e48;
              3'h4: pos_word = 16'h3ef3;
              3'h5: pos_word = 16'h3f54;
              3'h6: pos_word = 16'h3fb0;
              3'h7: pos_word = 16'h4021;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h40f8;
            case (mant_lo3)
              3'h1: pos_word = 16'hc103;
              3'h2: pos_word = 16'hc024;
              3'h3: pos_word = 16'hbfb3;
              3'h4: pos_word = 16'hbf57;
              3'h5: pos_word = 16'hbef7;
              3'h6: pos_word = 16'hbe4f;
              3'h7: pos_word = 16'h3d51;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1d;
              3'h2: pos_word = 16'h3f84;
              3'h3: pos_word = 16'h3fe0;
              3'h4: pos_word = 16'h4067;
              3'h5: pos_word = 16'h4249;
              3'h6: pos_word = 16'hc089;
              3'h7: pos_word = 16'hbff6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf8f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2c;
              3'h2: pos_word = 16'hbeb6;
              3'h3: pos_word = 16'hbdba;
              3'h4: pos_word = 16'h3e25;
              3'h5: pos_word = 16'h3ede;
              3'h6: pos_word = 16'h3f46;
              3'h7: pos_word = 16'h3fa4;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4013;
            case (mant_lo3)
              3'h1: pos_word = 16'h40c4;
              3'h2: pos_word = 16'hc134;
              3'h3: pos_word = 16'hc036;
              3'h4: pos_word = 16'hbfc0;
              3'h5: pos_word = 16'hbf66;
              3'h6: pos_word = 16'hbf06;
              3'h7: pos_word = 16'hbe72;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3c91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e8c;
              3'h2: pos_word = 16'h3f12;
              3'h3: pos_word = 16'h3f77;
              3'h4: pos_word = 16'h3fcf;
              3'h5: pos_word = 16'h404d;
              3'h6: pos_word = 16'h4197;
              3'h7: pos_word = 16'hc0a0;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc006;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf99;
              3'h2: pos_word = 16'hbf38;
              3'h3: pos_word = 16'hbec9;
              3'h4: pos_word = 16'hbdff;
              3'h5: pos_word = 16'h3e02;
              3'h6: pos_word = 16'h3eca;
              3'h7: pos_word = 16'h3f39;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f9a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4006;
              3'h2: pos_word = 16'h40a2;
              3'h3: pos_word = 16'hc190;
              3'h4: pos_word = 16'hc04b;
              3'h5: pos_word = 16'hbfce;
              3'h6: pos_word = 16'hbf76;
              3'h7: pos_word = 16'hbf11;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc7e;
              3'h2: pos_word = 16'h3e75;
              3'h3: pos_word = 16'h3f07;
              3'h4: pos_word = 16'h3f67;
              3'h5: pos_word = 16'h3fc1;
              3'h6: pos_word = 16'h4037;
              3'h7: pos_word = 16'h4139;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc0c2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc012;
              3'h2: pos_word = 16'hbfa4;
              3'h3: pos_word = 16'hbf45;
              3'h4: pos_word = 16'hbedd;
              3'h5: pos_word = 16'hbe22;
              3'h6: pos_word = 16'h3dbf;
              3'h7: pos_word = 16'h3eb7;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f2c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f90;
              3'h2: pos_word = 16'h3ff7;
              3'h3: pos_word = 16'h408a;
              3'h4: pos_word = 16'hc235;
              3'h5: pos_word = 16'hc065;
              3'h6: pos_word = 16'hbfde;
              3'h7: pos_word = 16'hbf83;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf1c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9e;
              3'h2: pos_word = 16'hbd48;
              3'h3: pos_word = 16'h3e51;
              3'h4: pos_word = 16'h3ef8;
              3'h5: pos_word = 16'h3f58;
              3'h6: pos_word = 16'h3fb3;
              3'h7: pos_word = 16'h4025;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4105;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0f4;
              3'h2: pos_word = 16'hc020;
              3'h3: pos_word = 16'hbfaf;
              3'h4: pos_word = 16'hbf53;
              3'h5: pos_word = 16'hbef1;
              3'h6: pos_word = 16'hbe45;
              3'h7: pos_word = 16'h3d75;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3ea4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f20;
              3'h2: pos_word = 16'h3f86;
              3'h3: pos_word = 16'h3fe4;
              3'h4: pos_word = 16'h4070;
              3'h5: pos_word = 16'h42b5;
              3'h6: pos_word = 16'hc083;
              3'h7: pos_word = 16'hbff1;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf28;
              3'h2: pos_word = 16'hbeb0;
              3'h3: pos_word = 16'hbda8;
              3'h4: pos_word = 16'h3e2e;
              3'h5: pos_word = 16'h3ee4;
              3'h6: pos_word = 16'h3f4a;
              3'h7: pos_word = 16'h3fa7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h85: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h4016;
            case (mant_lo3)
              3'h1: pos_word = 16'hc124;
              3'h2: pos_word = 16'hbfbc;
              3'h3: pos_word = 16'hbf03;
              3'h4: pos_word = 16'h3cda;
              3'h5: pos_word = 16'h3f15;
              3'h6: pos_word = 16'h3fd3;
              3'h7: pos_word = 16'h41b5;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc003;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf35;
              3'h2: pos_word = 16'hbded;
              3'h3: pos_word = 16'h3ecf;
              3'h4: pos_word = 16'h3f9c;
              3'h5: pos_word = 16'h40aa;
              3'h6: pos_word = 16'hc045;
              3'h7: pos_word = 16'hbf72;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe86;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e7e;
              3'h2: pos_word = 16'h3f6b;
              3'h3: pos_word = 16'h403c;
              3'h4: pos_word = 16'hc0b8;
              3'h5: pos_word = 16'hbfa1;
              3'h6: pos_word = 16'hbed7;
              3'h7: pos_word = 16'h3dd1;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f30;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ffd;
              3'h2: pos_word = 16'hc201;
              3'h3: pos_word = 16'hbfda;
              3'h4: pos_word = 16'hbf19;
              3'h5: pos_word = 16'hbd23;
              3'h6: pos_word = 16'h3efe;
              3'h7: pos_word = 16'h3fb7;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4110;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01c;
              3'h2: pos_word = 16'hbf50;
              3'h3: pos_word = 16'hbe3c;
              3'h4: pos_word = 16'h3ea9;
              3'h5: pos_word = 16'h3f89;
              3'h6: pos_word = 16'h4078;
              3'h7: pos_word = 16'hc07d;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf8a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeab;
              3'h2: pos_word = 16'h3e37;
              3'h3: pos_word = 16'h3f4e;
              3'h4: pos_word = 16'h401a;
              3'h5: pos_word = 16'hc116;
              3'h6: pos_word = 16'hbfb9;
              3'h7: pos_word = 16'hbf00;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3d11;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f18;
              3'h2: pos_word = 16'h3fd8;
              3'h3: pos_word = 16'h41e2;
              3'h4: pos_word = 16'hbfff;
              3'h5: pos_word = 16'hbf31;
              3'h6: pos_word = 16'hbdda;
              3'h7: pos_word = 16'h3ed5;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b3;
              3'h2: pos_word = 16'hc03f;
              3'h3: pos_word = 16'hbf6d;
              3'h4: pos_word = 16'hbe82;
              3'h5: pos_word = 16'h3e84;
              3'h6: pos_word = 16'h3f70;
              3'h7: pos_word = 16'h4042;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc0ae;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9e;
              3'h2: pos_word = 16'hbed2;
              3'h3: pos_word = 16'h3de3;
              3'h4: pos_word = 16'h3f33;
              3'h5: pos_word = 16'h4001;
              3'h6: pos_word = 16'hc1c9;
              3'h7: pos_word = 16'hbfd6;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf16;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcfe;
              3'h2: pos_word = 16'h3f02;
              3'h3: pos_word = 16'h3fba;
              3'h4: pos_word = 16'h411d;
              3'h5: pos_word = 16'hc018;
              3'h6: pos_word = 16'hbf4c;
              3'h7: pos_word = 16'hbe32;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3eae;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8b;
              3'h2: pos_word = 16'h4081;
              3'h3: pos_word = 16'hc074;
              3'h4: pos_word = 16'hbf88;
              3'h5: pos_word = 16'hbea6;
              3'h6: pos_word = 16'h3e41;
              3'h7: pos_word = 16'h3f52;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h401e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc10a;
              3'h2: pos_word = 16'hbfb5;
              3'h3: pos_word = 16'hbefb;
              3'h4: pos_word = 16'h3d35;
              3'h5: pos_word = 16'h3f1b;
              3'h6: pos_word = 16'h3fdc;
              3'h7: pos_word = 16'h4217;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbffa;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2e;
              3'h2: pos_word = 16'hbdc8;
              3'h3: pos_word = 16'h3eda;
              3'h4: pos_word = 16'h3fa2;
              3'h5: pos_word = 16'h40bd;
              3'h6: pos_word = 16'hc03a;
              3'h7: pos_word = 16'hbf69;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe79;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e89;
              3'h2: pos_word = 16'h3f74;
              3'h3: pos_word = 16'h4048;
              3'h4: pos_word = 16'hc0a6;
              3'h5: pos_word = 16'hbf9b;
              3'h6: pos_word = 16'hbecd;
              3'h7: pos_word = 16'h3df6;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f37;
            case (mant_lo3)
              3'h1: pos_word = 16'h4004;
              3'h2: pos_word = 16'hc1a4;
              3'h3: pos_word = 16'hbfd1;
              3'h4: pos_word = 16'hbf13;
              3'h5: pos_word = 16'hbcb5;
              3'h6: pos_word = 16'h3f05;
              3'h7: pos_word = 16'h3fbe;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h412c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc014;
              3'h2: pos_word = 16'hbf48;
              3'h3: pos_word = 16'hbe29;
              3'h4: pos_word = 16'h3eb3;
              3'h5: pos_word = 16'h3f8e;
              3'h6: pos_word = 16'h4086;
              3'h7: pos_word = 16'hc06b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h86: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf85;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e4a;
              3'h2: pos_word = 16'h4022;
              3'h3: pos_word = 16'hbfb2;
              3'h4: pos_word = 16'h3d5a;
              3'h5: pos_word = 16'h3fe1;
              3'h6: pos_word = 16'hbff4;
              3'h7: pos_word = 16'hbdb6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fa5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc035;
              3'h2: pos_word = 16'hbe70;
              3'h3: pos_word = 16'h3f78;
              3'h4: pos_word = 16'hc09f;
              3'h5: pos_word = 16'hbec8;
              3'h6: pos_word = 16'h3f3a;
              3'h7: pos_word = 16'hc18b;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf10;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f07;
              3'h2: pos_word = 16'h413e;
              3'h3: pos_word = 16'hbf45;
              3'h4: pos_word = 16'h3eb8;
              3'h5: pos_word = 16'h408b;
              3'h6: pos_word = 16'hbf83;
              3'h7: pos_word = 16'h3e53;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4026;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfaf;
              3'h2: pos_word = 16'h3d7e;
              3'h3: pos_word = 16'h3fe5;
              3'h4: pos_word = 16'hbfef;
              3'h5: pos_word = 16'hbda3;
              3'h6: pos_word = 16'h3fa8;
              3'h7: pos_word = 16'hc030;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbe66;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7d;
              3'h2: pos_word = 16'hc098;
              3'h3: pos_word = 16'hbec2;
              3'h4: pos_word = 16'h3f3d;
              3'h5: pos_word = 16'hc171;
              3'h6: pos_word = 16'hbf0d;
              3'h7: pos_word = 16'h3f0a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4154;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf41;
              3'h2: pos_word = 16'h3ebd;
              3'h3: pos_word = 16'h4091;
              3'h4: pos_word = 16'hbf81;
              3'h5: pos_word = 16'h3e5d;
              3'h6: pos_word = 16'h402b;
              3'h7: pos_word = 16'hbfab;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3d91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fea;
              3'h2: pos_word = 16'hbfea;
              3'h3: pos_word = 16'hbd91;
              3'h4: pos_word = 16'h3fab;
              3'h5: pos_word = 16'hc02b;
              3'h6: pos_word = 16'hbe5d;
              3'h7: pos_word = 16'h3f81;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc091;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebd;
              3'h2: pos_word = 16'h3f41;
              3'h3: pos_word = 16'hc154;
              3'h4: pos_word = 16'hbf0a;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'h4171;
              3'h7: pos_word = 16'hbf3d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3ec2;
            case (mant_lo3)
              3'h1: pos_word = 16'h4098;
              3'h2: pos_word = 16'hbf7d;
              3'h3: pos_word = 16'h3e66;
              3'h4: pos_word = 16'h4030;
              3'h5: pos_word = 16'hbfa8;
              3'h6: pos_word = 16'h3da3;
              3'h7: pos_word = 16'h3fef;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfe5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd7e;
              3'h2: pos_word = 16'h3faf;
              3'h3: pos_word = 16'hc026;
              3'h4: pos_word = 16'hbe53;
              3'h5: pos_word = 16'h3f83;
              3'h6: pos_word = 16'hc08b;
              3'h7: pos_word = 16'hbeb8;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f45;
            case (mant_lo3)
              3'h1: pos_word = 16'hc13e;
              3'h2: pos_word = 16'hbf07;
              3'h3: pos_word = 16'h3f10;
              3'h4: pos_word = 16'h418b;
              3'h5: pos_word = 16'hbf3a;
              3'h6: pos_word = 16'h3ec8;
              3'h7: pos_word = 16'h409f;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf78;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e70;
              3'h2: pos_word = 16'h4035;
              3'h3: pos_word = 16'hbfa5;
              3'h4: pos_word = 16'h3db6;
              3'h5: pos_word = 16'h3ff5;
              3'h6: pos_word = 16'hbfe1;
              3'h7: pos_word = 16'hbd5a;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fb2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc022;
              3'h2: pos_word = 16'hbe4a;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'hc086;
              3'h5: pos_word = 16'hbeb3;
              3'h6: pos_word = 16'h3f48;
              3'h7: pos_word = 16'hc12c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf05;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f13;
              3'h2: pos_word = 16'h41a4;
              3'h3: pos_word = 16'hbf37;
              3'h4: pos_word = 16'h3ecd;
              3'h5: pos_word = 16'h40a6;
              3'h6: pos_word = 16'hbf74;
              3'h7: pos_word = 16'h3e79;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h403a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa2;
              3'h2: pos_word = 16'h3dc8;
              3'h3: pos_word = 16'h3ffa;
              3'h4: pos_word = 16'hbfdc;
              3'h5: pos_word = 16'hbd35;
              3'h6: pos_word = 16'h3fb5;
              3'h7: pos_word = 16'hc01e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe41;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f88;
              3'h2: pos_word = 16'hc081;
              3'h3: pos_word = 16'hbeae;
              3'h4: pos_word = 16'h3f4c;
              3'h5: pos_word = 16'hc11d;
              3'h6: pos_word = 16'hbf02;
              3'h7: pos_word = 16'h3f16;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h87: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h41c9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed2;
              3'h2: pos_word = 16'hbf70;
              3'h3: pos_word = 16'h403f;
              3'h4: pos_word = 16'h3dda;
              3'h5: pos_word = 16'hbfd8;
              3'h6: pos_word = 16'h3fb9;
              3'h7: pos_word = 16'hbe37;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc078;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f50;
              3'h2: pos_word = 16'hbefe;
              3'h3: pos_word = 16'h4201;
              3'h4: pos_word = 16'h3ed7;
              3'h5: pos_word = 16'hbf6b;
              3'h6: pos_word = 16'h4045;
              3'h7: pos_word = 16'h3ded;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfd3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbc;
              3'h2: pos_word = 16'hbe2e;
              3'h3: pos_word = 16'hc070;
              3'h4: pos_word = 16'h3f53;
              3'h5: pos_word = 16'hbef8;
              3'h6: pos_word = 16'h4235;
              3'h7: pos_word = 16'h3edd;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf67;
            case (mant_lo3)
              3'h1: pos_word = 16'h404b;
              3'h2: pos_word = 16'h3dff;
              3'h3: pos_word = 16'hbfcf;
              3'h4: pos_word = 16'h3fc0;
              3'h5: pos_word = 16'hbe24;
              3'h6: pos_word = 16'hc067;
              3'h7: pos_word = 16'h3f57;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbef3;
            case (mant_lo3)
              3'h1: pos_word = 16'h4297;
              3'h2: pos_word = 16'h3ee2;
              3'h3: pos_word = 16'hbf63;
              3'h4: pos_word = 16'h4052;
              3'h5: pos_word = 16'h3e09;
              3'h6: pos_word = 16'hbfcb;
              3'h7: pos_word = 16'h3fc4;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe1b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc060;
              3'h2: pos_word = 16'h3f5b;
              3'h3: pos_word = 16'hbeed;
              3'h4: pos_word = 16'h4364;
              3'h5: pos_word = 16'h3ee8;
              3'h6: pos_word = 16'hbf5f;
              3'h7: pos_word = 16'h4058;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e12;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc7;
              3'h2: pos_word = 16'h3fc7;
              3'h3: pos_word = 16'hbe12;
              3'h4: pos_word = 16'hc058;
              3'h5: pos_word = 16'h3f5f;
              3'h6: pos_word = 16'hbee8;
              3'h7: pos_word = 16'hc360;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3eed;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5b;
              3'h2: pos_word = 16'h4060;
              3'h3: pos_word = 16'h3e1b;
              3'h4: pos_word = 16'hbfc4;
              3'h5: pos_word = 16'h3fcb;
              3'h6: pos_word = 16'hbe09;
              3'h7: pos_word = 16'hc051;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f63;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee2;
              3'h2: pos_word = 16'hc296;
              3'h3: pos_word = 16'h3ef3;
              3'h4: pos_word = 16'hbf57;
              3'h5: pos_word = 16'h4067;
              3'h6: pos_word = 16'h3e25;
              3'h7: pos_word = 16'hbfc0;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fcf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdff;
              3'h2: pos_word = 16'hc04b;
              3'h3: pos_word = 16'h3f67;
              3'h4: pos_word = 16'hbedd;
              3'h5: pos_word = 16'hc234;
              3'h6: pos_word = 16'h3ef8;
              3'h7: pos_word = 16'hbf53;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4070;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e2e;
              3'h2: pos_word = 16'hbfbc;
              3'h3: pos_word = 16'h3fd4;
              3'h4: pos_word = 16'hbded;
              3'h5: pos_word = 16'hc045;
              3'h6: pos_word = 16'h3f6b;
              3'h7: pos_word = 16'hbed7;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc201;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efe;
              3'h2: pos_word = 16'hbf50;
              3'h3: pos_word = 16'h4078;
              3'h4: pos_word = 16'h3e37;
              3'h5: pos_word = 16'hbfb9;
              3'h6: pos_word = 16'h3fd8;
              3'h7: pos_word = 16'hbdda;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc03f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f70;
              3'h2: pos_word = 16'hbed2;
              3'h3: pos_word = 16'hc1c9;
              3'h4: pos_word = 16'h3f02;
              3'h5: pos_word = 16'hbf4c;
              3'h6: pos_word = 16'h4081;
              3'h7: pos_word = 16'h3e41;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfb5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fdc;
              3'h2: pos_word = 16'hbdc8;
              3'h3: pos_word = 16'hc03a;
              3'h4: pos_word = 16'h3f74;
              3'h5: pos_word = 16'hbecd;
              3'h6: pos_word = 16'hc1a4;
              3'h7: pos_word = 16'h3f05;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf48;
            case (mant_lo3)
              3'h1: pos_word = 16'h4086;
              3'h2: pos_word = 16'h3e4a;
              3'h3: pos_word = 16'hbfb2;
              3'h4: pos_word = 16'h3fe1;
              3'h5: pos_word = 16'hbdb6;
              3'h6: pos_word = 16'hc034;
              3'h7: pos_word = 16'h3f78;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbec8;
            case (mant_lo3)
              3'h1: pos_word = 16'hc18b;
              3'h2: pos_word = 16'h3f07;
              3'h3: pos_word = 16'hbf45;
              3'h4: pos_word = 16'h408b;
              3'h5: pos_word = 16'h3e53;
              3'h6: pos_word = 16'hbfaf;
              3'h7: pos_word = 16'h3fe5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h88: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbda3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7d;
              3'h2: pos_word = 16'hc171;
              3'h3: pos_word = 16'hbf41;
              3'h4: pos_word = 16'h3e5d;
              3'h5: pos_word = 16'h3fea;
              3'h6: pos_word = 16'hc02b;
              3'h7: pos_word = 16'hbebd;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f0d;
            case (mant_lo3)
              3'h1: pos_word = 16'h4098;
              3'h2: pos_word = 16'hbfa8;
              3'h3: pos_word = 16'hbd7e;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'hc13e;
              3'h6: pos_word = 16'hbf3a;
              3'h7: pos_word = 16'h3e70;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ff5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc022;
              3'h2: pos_word = 16'hbeb3;
              3'h3: pos_word = 16'h3f13;
              3'h4: pos_word = 16'h40a6;
              3'h5: pos_word = 16'hbfa2;
              3'h6: pos_word = 16'hbd35;
              3'h7: pos_word = 16'h3f88;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc11d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf33;
              3'h2: pos_word = 16'h3e82;
              3'h3: pos_word = 16'h3fff;
              3'h4: pos_word = 16'hc01a;
              3'h5: pos_word = 16'hbea9;
              3'h6: pos_word = 16'h3f19;
              3'h7: pos_word = 16'h40b8;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf9c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcd9;
              3'h2: pos_word = 16'h3f8c;
              3'h3: pos_word = 16'hc105;
              3'h4: pos_word = 16'hbf2c;
              3'h5: pos_word = 16'h3e8b;
              3'h6: pos_word = 16'h4006;
              3'h7: pos_word = 16'hc013;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f20;
              3'h2: pos_word = 16'h40cd;
              3'h3: pos_word = 16'hbf97;
              3'h4: pos_word = 16'hbc10;
              3'h5: pos_word = 16'h3f92;
              3'h6: pos_word = 16'hc0e8;
              3'h7: pos_word = 16'hbf26;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e95;
            case (mant_lo3)
              3'h1: pos_word = 16'h400c;
              3'h2: pos_word = 16'hc00c;
              3'h3: pos_word = 16'hbe95;
              3'h4: pos_word = 16'h3f26;
              3'h5: pos_word = 16'h40e8;
              3'h6: pos_word = 16'hbf92;
              3'h7: pos_word = 16'h3c12;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f97;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0cd;
              3'h2: pos_word = 16'hbf20;
              3'h3: pos_word = 16'h3e9f;
              3'h4: pos_word = 16'h4013;
              3'h5: pos_word = 16'hc006;
              3'h6: pos_word = 16'hbe8b;
              3'h7: pos_word = 16'h3f2d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4105;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8c;
              3'h2: pos_word = 16'h3cda;
              3'h3: pos_word = 16'h3f9c;
              3'h4: pos_word = 16'hc0b8;
              3'h5: pos_word = 16'hbf19;
              3'h6: pos_word = 16'h3ea9;
              3'h7: pos_word = 16'h401a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfff;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe81;
              3'h2: pos_word = 16'h3f33;
              3'h3: pos_word = 16'h411d;
              3'h4: pos_word = 16'hbf88;
              3'h5: pos_word = 16'h3d36;
              3'h6: pos_word = 16'h3fa2;
              3'h7: pos_word = 16'hc0a6;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf13;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb3;
              3'h2: pos_word = 16'h4022;
              3'h3: pos_word = 16'hbff4;
              3'h4: pos_word = 16'hbe70;
              3'h5: pos_word = 16'h3f3a;
              3'h6: pos_word = 16'h413e;
              3'h7: pos_word = 16'hbf83;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3d7e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa8;
              3'h2: pos_word = 16'hc098;
              3'h3: pos_word = 16'hbf0d;
              3'h4: pos_word = 16'h3ebd;
              3'h5: pos_word = 16'h402b;
              3'h6: pos_word = 16'hbfea;
              3'h7: pos_word = 16'hbe5d;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f41;
            case (mant_lo3)
              3'h1: pos_word = 16'h4171;
              3'h2: pos_word = 16'hbf7d;
              3'h3: pos_word = 16'h3da4;
              3'h4: pos_word = 16'h3faf;
              3'h5: pos_word = 16'hc08b;
              3'h6: pos_word = 16'hbf07;
              3'h7: pos_word = 16'h3ec8;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4035;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe1;
              3'h2: pos_word = 16'hbe4a;
              3'h3: pos_word = 16'h3f48;
              3'h4: pos_word = 16'h41a5;
              3'h5: pos_word = 16'hbf74;
              3'h6: pos_word = 16'h3dc8;
              3'h7: pos_word = 16'h3fb5;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc081;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf02;
              3'h2: pos_word = 16'h3ed2;
              3'h3: pos_word = 16'h403f;
              3'h4: pos_word = 16'hbfd8;
              3'h5: pos_word = 16'hbe37;
              3'h6: pos_word = 16'h3f50;
              3'h7: pos_word = 16'h4201;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf6b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ded;
              3'h2: pos_word = 16'h3fbc;
              3'h3: pos_word = 16'hc06f;
              3'h4: pos_word = 16'hbef8;
              3'h5: pos_word = 16'h3edd;
              3'h6: pos_word = 16'h404b;
              3'h7: pos_word = 16'hbfcf;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h89: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe24;
            case (mant_lo3)
              3'h1: pos_word = 16'h4298;
              3'h2: pos_word = 16'h3e09;
              3'h3: pos_word = 16'hc060;
              3'h4: pos_word = 16'h3ee8;
              3'h5: pos_word = 16'hbfc7;
              3'h6: pos_word = 16'h3f5f;
              3'h7: pos_word = 16'hbf5b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fcb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee2;
              3'h2: pos_word = 16'h4067;
              3'h3: pos_word = 16'hbdff;
              3'h4: pos_word = 16'hc234;
              3'h5: pos_word = 16'h3e2e;
              3'h6: pos_word = 16'hc045;
              3'h7: pos_word = 16'h3efe;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfb9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f70;
              3'h2: pos_word = 16'hbf4c;
              3'h3: pos_word = 16'h3fdc;
              3'h4: pos_word = 16'hbecd;
              3'h5: pos_word = 16'h4086;
              3'h6: pos_word = 16'hbdb6;
              3'h7: pos_word = 16'hc18b;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e53;
            case (mant_lo3)
              3'h1: pos_word = 16'hc030;
              3'h2: pos_word = 16'h3f0a;
              3'h3: pos_word = 16'hbfab;
              3'h4: pos_word = 16'h3f81;
              3'h5: pos_word = 16'hbf3d;
              3'h6: pos_word = 16'h3fef;
              3'h7: pos_word = 16'hbeb8;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h409f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd59;
              3'h2: pos_word = 16'hc12b;
              3'h3: pos_word = 16'h3e7a;
              3'h4: pos_word = 16'hc01e;
              3'h5: pos_word = 16'h3f16;
              3'h6: pos_word = 16'hbf9f;
              3'h7: pos_word = 16'h3f8a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf30;
            case (mant_lo3)
              3'h1: pos_word = 16'h4003;
              3'h2: pos_word = 16'hbea4;
              3'h3: pos_word = 16'h40c2;
              3'h4: pos_word = 16'hbc90;
              3'h5: pos_word = 16'hc0f8;
              3'h6: pos_word = 16'h3e90;
              3'h7: pos_word = 16'hc00f;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f23;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf94;
              3'h2: pos_word = 16'h3f94;
              3'h3: pos_word = 16'hbf23;
              3'h4: pos_word = 16'h400f;
              3'h5: pos_word = 16'hbe90;
              3'h6: pos_word = 16'h40f8;
              3'h7: pos_word = 16'h3c92;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc0c2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea4;
              3'h2: pos_word = 16'hc003;
              3'h3: pos_word = 16'h3f30;
              3'h4: pos_word = 16'hbf8a;
              3'h5: pos_word = 16'h3f9f;
              3'h6: pos_word = 16'hbf16;
              3'h7: pos_word = 16'h401e;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe79;
            case (mant_lo3)
              3'h1: pos_word = 16'h412c;
              3'h2: pos_word = 16'h3d5a;
              3'h3: pos_word = 16'hc09e;
              3'h4: pos_word = 16'h3eb8;
              3'h5: pos_word = 16'hbfef;
              3'h6: pos_word = 16'h3f3e;
              3'h7: pos_word = 16'hbf81;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fab;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0a;
              3'h2: pos_word = 16'h4030;
              3'h3: pos_word = 16'hbe53;
              3'h4: pos_word = 16'h418b;
              3'h5: pos_word = 16'h3db6;
              3'h6: pos_word = 16'hc086;
              3'h7: pos_word = 16'h3ecd;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfdc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4c;
              3'h2: pos_word = 16'hbf6f;
              3'h3: pos_word = 16'h3fb9;
              3'h4: pos_word = 16'hbefe;
              3'h5: pos_word = 16'h4045;
              3'h6: pos_word = 16'hbe2e;
              3'h7: pos_word = 16'h4236;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3dff;
            case (mant_lo3)
              3'h1: pos_word = 16'hc067;
              3'h2: pos_word = 16'h3ee2;
              3'h3: pos_word = 16'hbfcb;
              3'h4: pos_word = 16'h3f5b;
              3'h5: pos_word = 16'hbf5f;
              3'h6: pos_word = 16'h3fc7;
              3'h7: pos_word = 16'hbee7;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4060;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe09;
              3'h2: pos_word = 16'hc295;
              3'h3: pos_word = 16'h3e25;
              3'h4: pos_word = 16'hc04b;
              3'h5: pos_word = 16'h3ef8;
              3'h6: pos_word = 16'hbfbc;
              3'h7: pos_word = 16'h3f6b;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf50;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd8;
              3'h2: pos_word = 16'hbed2;
              3'h3: pos_word = 16'h4081;
              3'h4: pos_word = 16'hbdc8;
              3'h5: pos_word = 16'hc1a4;
              3'h6: pos_word = 16'h3e4a;
              3'h7: pos_word = 16'hc034;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f08;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfae;
              3'h2: pos_word = 16'h3f7d;
              3'h3: pos_word = 16'hbf41;
              3'h4: pos_word = 16'h3fea;
              3'h5: pos_word = 16'hbebd;
              3'h6: pos_word = 16'h4098;
              3'h7: pos_word = 16'hbd7d;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc13d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e70;
              3'h2: pos_word = 16'hc022;
              3'h3: pos_word = 16'h3f13;
              3'h4: pos_word = 16'hbfa2;
              3'h5: pos_word = 16'h3f88;
              3'h6: pos_word = 16'hbf33;
              3'h7: pos_word = 16'h4000;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8a: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbea9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcd8;
              3'h2: pos_word = 16'h3e8b;
              3'h3: pos_word = 16'h3f20;
              3'h4: pos_word = 16'h3f92;
              3'h5: pos_word = 16'h400c;
              3'h6: pos_word = 16'h40e8;
              3'h7: pos_word = 16'hc0cd;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc005;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8c;
              3'h2: pos_word = 16'hbf19;
              3'h3: pos_word = 16'hbe81;
              3'h4: pos_word = 16'h3d36;
              3'h5: pos_word = 16'h3eb3;
              3'h6: pos_word = 16'h3f3a;
              3'h7: pos_word = 16'h3fa8;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h402b;
            case (mant_lo3)
              3'h1: pos_word = 16'h4171;
              3'h2: pos_word = 16'hc08b;
              3'h3: pos_word = 16'hbfe1;
              3'h4: pos_word = 16'hbf74;
              3'h5: pos_word = 16'hbf02;
              3'h6: pos_word = 16'hbe37;
              3'h7: pos_word = 16'h3ded;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3edd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f57;
              3'h2: pos_word = 16'h3fc4;
              3'h3: pos_word = 16'h4059;
              3'h4: pos_word = 16'hc358;
              3'h5: pos_word = 16'hc051;
              3'h6: pos_word = 16'hbfc0;
              3'h7: pos_word = 16'hbf53;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbed7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdda;
              3'h2: pos_word = 16'h3e41;
              3'h3: pos_word = 16'h3f05;
              3'h4: pos_word = 16'h3f78;
              3'h5: pos_word = 16'h3fe6;
              3'h6: pos_word = 16'h4091;
              3'h7: pos_word = 16'hc154;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc026;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa5;
              3'h2: pos_word = 16'hbf36;
              3'h3: pos_word = 16'hbeae;
              3'h4: pos_word = 16'hbd10;
              3'h5: pos_word = 16'h3e86;
              3'h6: pos_word = 16'h3f1d;
              3'h7: pos_word = 16'h3f8f;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4009;
            case (mant_lo3)
              3'h1: pos_word = 16'h40da;
              3'h2: pos_word = 16'hc0d9;
              3'h3: pos_word = 16'hc009;
              3'h4: pos_word = 16'hbf8f;
              3'h5: pos_word = 16'hbf1c;
              3'h6: pos_word = 16'hbe86;
              3'h7: pos_word = 16'h3d12;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3eae;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f37;
              3'h2: pos_word = 16'h3fa5;
              3'h3: pos_word = 16'h4026;
              3'h4: pos_word = 16'h4155;
              3'h5: pos_word = 16'hc091;
              3'h6: pos_word = 16'hbfe5;
              3'h7: pos_word = 16'hbf78;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf05;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe40;
              3'h2: pos_word = 16'h3ddb;
              3'h3: pos_word = 16'h3ed8;
              3'h4: pos_word = 16'h3f54;
              3'h5: pos_word = 16'h3fc0;
              3'h6: pos_word = 16'h4052;
              3'h7: pos_word = 16'h4371;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc058;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc3;
              3'h2: pos_word = 16'hbf57;
              3'h3: pos_word = 16'hbedd;
              3'h4: pos_word = 16'hbdec;
              3'h5: pos_word = 16'h3e37;
              3'h6: pos_word = 16'h3f02;
              3'h7: pos_word = 16'h3f74;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3fe1;
            case (mant_lo3)
              3'h1: pos_word = 16'h408c;
              3'h2: pos_word = 16'hc170;
              3'h3: pos_word = 16'hc02b;
              3'h4: pos_word = 16'hbfa8;
              3'h5: pos_word = 16'hbf3a;
              3'h6: pos_word = 16'hbeb3;
              3'h7: pos_word = 16'hbd34;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e82;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f19;
              3'h2: pos_word = 16'h3f8d;
              3'h3: pos_word = 16'h4006;
              3'h4: pos_word = 16'h40cd;
              3'h5: pos_word = 16'hc0e7;
              3'h6: pos_word = 16'hc00c;
              3'h7: pos_word = 16'hbf91;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf20;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe8b;
              3'h2: pos_word = 16'h3cdc;
              3'h3: pos_word = 16'h3ea9;
              3'h4: pos_word = 16'h3f33;
              3'h5: pos_word = 16'h3fa2;
              3'h6: pos_word = 16'h4022;
              3'h7: pos_word = 16'h413f;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc097;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfea;
              3'h2: pos_word = 16'hbf7c;
              3'h3: pos_word = 16'hbf07;
              3'h4: pos_word = 16'hbe4a;
              3'h5: pos_word = 16'h3dc9;
              3'h6: pos_word = 16'h3ed2;
              3'h7: pos_word = 16'h3f50;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fbc;
            case (mant_lo3)
              3'h1: pos_word = 16'h404b;
              3'h2: pos_word = 16'h429a;
              3'h3: pos_word = 16'hc05f;
              3'h4: pos_word = 16'hbfc7;
              3'h5: pos_word = 16'hbf5b;
              3'h6: pos_word = 16'hbee2;
              3'h7: pos_word = 16'hbdfe;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e2e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efe;
              3'h2: pos_word = 16'h3f70;
              3'h3: pos_word = 16'h3fdc;
              3'h4: pos_word = 16'h4086;
              3'h5: pos_word = 16'hc18a;
              3'h6: pos_word = 16'hc02f;
              3'h7: pos_word = 16'hbfab;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8b: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf3d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd58;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h4003;
              3'h4: pos_word = 16'hc0f7;
              3'h5: pos_word = 16'hbf94;
              3'h6: pos_word = 16'hbe90;
              3'h7: pos_word = 16'h3ea4;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h412c;
              3'h2: pos_word = 16'hbfef;
              3'h3: pos_word = 16'hbf0a;
              3'h4: pos_word = 16'h3db6;
              3'h5: pos_word = 16'h3f4c;
              3'h6: pos_word = 16'h4045;
              3'h7: pos_word = 16'hc067;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf5f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe08;
              3'h2: pos_word = 16'h3ef8;
              3'h3: pos_word = 16'h3fd8;
              3'h4: pos_word = 16'hc1a3;
              3'h5: pos_word = 16'hbfae;
              3'h6: pos_word = 16'hbebd;
              3'h7: pos_word = 16'h3e70;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f88;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b8;
              3'h2: pos_word = 16'hc012;
              3'h3: pos_word = 16'hbf26;
              3'h4: pos_word = 16'h3c18;
              3'h5: pos_word = 16'h3f2d;
              3'h6: pos_word = 16'h401a;
              3'h7: pos_word = 16'hc0a6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf83;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5c;
              3'h2: pos_word = 16'h3ec8;
              3'h3: pos_word = 16'h3fb5;
              3'h4: pos_word = 16'h4203;
              3'h5: pos_word = 16'hbfcf;
              3'h6: pos_word = 16'hbeed;
              3'h7: pos_word = 16'h3e1c;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f67;
            case (mant_lo3)
              3'h1: pos_word = 16'h4079;
              3'h2: pos_word = 16'hc039;
              3'h3: pos_word = 16'hbf44;
              3'h4: pos_word = 16'hbd90;
              3'h5: pos_word = 16'h3f10;
              3'h6: pos_word = 16'h3ffa;
              3'h7: pos_word = 16'hc10f;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf99;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9a;
              3'h2: pos_word = 16'h3e9a;
              3'h3: pos_word = 16'h3f9a;
              3'h4: pos_word = 16'h4111;
              3'h5: pos_word = 16'hbffa;
              3'h6: pos_word = 16'hbf10;
              3'h7: pos_word = 16'h3d92;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f45;
            case (mant_lo3)
              3'h1: pos_word = 16'h403a;
              3'h2: pos_word = 16'hc078;
              3'h3: pos_word = 16'hbf67;
              3'h4: pos_word = 16'hbe1b;
              3'h5: pos_word = 16'h3eed;
              3'h6: pos_word = 16'h3fd0;
              3'h7: pos_word = 16'hc1fe;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfb5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec7;
              3'h2: pos_word = 16'h3e5d;
              3'h3: pos_word = 16'h3f83;
              3'h4: pos_word = 16'h40a7;
              3'h5: pos_word = 16'hc01a;
              3'h6: pos_word = 16'hbf2c;
              3'h7: pos_word = 16'hbc08;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f26;
            case (mant_lo3)
              3'h1: pos_word = 16'h4013;
              3'h2: pos_word = 16'hc0b7;
              3'h3: pos_word = 16'hbf87;
              3'h4: pos_word = 16'hbe6f;
              3'h5: pos_word = 16'h3ebe;
              3'h6: pos_word = 16'h3faf;
              3'h7: pos_word = 16'h41a6;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfd8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef8;
              3'h2: pos_word = 16'h3e09;
              3'h3: pos_word = 16'h3f5f;
              3'h4: pos_word = 16'h4068;
              3'h5: pos_word = 16'hc045;
              3'h6: pos_word = 16'hbf4c;
              3'h7: pos_word = 16'hbdb5;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f0b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff0;
              3'h2: pos_word = 16'hc12b;
              3'h3: pos_word = 16'hbf9f;
              3'h4: pos_word = 16'hbea4;
              3'h5: pos_word = 16'h3e90;
              3'h6: pos_word = 16'h3f94;
              3'h7: pos_word = 16'h40f9;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc002;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf16;
              3'h2: pos_word = 16'h3d5c;
              3'h3: pos_word = 16'h3f3e;
              3'h4: pos_word = 16'h4030;
              3'h5: pos_word = 16'hc086;
              3'h6: pos_word = 16'hbf6f;
              3'h7: pos_word = 16'hbe2d;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ee3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc8;
              3'h2: pos_word = 16'hc290;
              3'h3: pos_word = 16'hbfbc;
              3'h4: pos_word = 16'hbed2;
              3'h5: pos_word = 16'h3e4b;
              3'h6: pos_word = 16'h3f7d;
              3'h7: pos_word = 16'h4098;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc022;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf33;
              3'h2: pos_word = 16'hbcd4;
              3'h3: pos_word = 16'h3f20;
              3'h4: pos_word = 16'h400c;
              3'h5: pos_word = 16'hc0cc;
              3'h6: pos_word = 16'hbf8c;
              3'h7: pos_word = 16'hbe81;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3eb3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa8;
              3'h2: pos_word = 16'h4173;
              3'h3: pos_word = 16'hbfe0;
              3'h4: pos_word = 16'hbf02;
              3'h5: pos_word = 16'h3dee;
              3'h6: pos_word = 16'h3f58;
              3'h7: pos_word = 16'h4059;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8c: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc051;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdd9;
              3'h2: pos_word = 16'h3fe6;
              3'h3: pos_word = 16'hbfa5;
              3'h4: pos_word = 16'h3e87;
              3'h5: pos_word = 16'h40db;
              3'h6: pos_word = 16'hbf1c;
              3'h7: pos_word = 16'h3f37;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc091;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe40;
              3'h2: pos_word = 16'h3fc0;
              3'h3: pos_word = 16'hbfc3;
              3'h4: pos_word = 16'h3e38;
              3'h5: pos_word = 16'h408c;
              3'h6: pos_word = 16'hbf3a;
              3'h7: pos_word = 16'h3f1a;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc0e6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe8b;
              3'h2: pos_word = 16'h3fa2;
              3'h3: pos_word = 16'hbfea;
              3'h4: pos_word = 16'h3dca;
              3'h5: pos_word = 16'h404c;
              3'h6: pos_word = 16'hbf5b;
              3'h7: pos_word = 16'h3efe;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc189;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb8;
              3'h2: pos_word = 16'h3f8a;
              3'h3: pos_word = 16'hc00f;
              3'h4: pos_word = 16'h3c98;
              3'h5: pos_word = 16'h401e;
              3'h6: pos_word = 16'hbf80;
              3'h7: pos_word = 16'h3ecd;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h423c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee7;
              3'h2: pos_word = 16'h3f6c;
              3'h3: pos_word = 16'hc034;
              3'h4: pos_word = 16'hbd7a;
              3'h5: pos_word = 16'h4000;
              3'h6: pos_word = 16'hbf97;
              3'h7: pos_word = 16'h3e9f;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h411e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0d;
              3'h2: pos_word = 16'h3f49;
              3'h3: pos_word = 16'hc06f;
              3'h4: pos_word = 16'hbe11;
              3'h5: pos_word = 16'h3fd4;
              3'h6: pos_word = 16'hbfb1;
              3'h7: pos_word = 16'h3e67;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h40af;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf29;
              3'h2: pos_word = 16'h3f2a;
              3'h3: pos_word = 16'hc0ad;
              3'h4: pos_word = 16'hbe65;
              3'h5: pos_word = 16'h3fb2;
              3'h6: pos_word = 16'hbfd3;
              3'h7: pos_word = 16'h3e13;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4071;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf48;
              3'h2: pos_word = 16'h3f0e;
              3'h3: pos_word = 16'hc11b;
              3'h4: pos_word = 16'hbe9e;
              3'h5: pos_word = 16'h3f97;
              3'h6: pos_word = 16'hbfff;
              3'h7: pos_word = 16'h3d81;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4035;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6b;
              3'h2: pos_word = 16'h3ee8;
              3'h3: pos_word = 16'hc22d;
              3'h4: pos_word = 16'hbecc;
              3'h5: pos_word = 16'h3f81;
              3'h6: pos_word = 16'hc01d;
              3'h7: pos_word = 16'hbc88;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4010;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8a;
              3'h2: pos_word = 16'h3eb9;
              3'h3: pos_word = 16'h418e;
              3'h4: pos_word = 16'hbefd;
              3'h5: pos_word = 16'h3f5c;
              3'h6: pos_word = 16'hc04a;
              3'h7: pos_word = 16'hbdc6;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3feb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa2;
              3'h2: pos_word = 16'h3e8c;
              3'h3: pos_word = 16'h40ea;
              3'h4: pos_word = 16'hbf19;
              3'h5: pos_word = 16'h3f3a;
              3'h6: pos_word = 16'hc08b;
              3'h7: pos_word = 16'hbe36;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fc4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbf;
              3'h2: pos_word = 16'h3e42;
              3'h3: pos_word = 16'h4092;
              3'h4: pos_word = 16'hbf36;
              3'h5: pos_word = 16'h3f1d;
              3'h6: pos_word = 16'hc0d8;
              3'h7: pos_word = 16'hbe86;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fa6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe5;
              3'h2: pos_word = 16'h3ddd;
              3'h3: pos_word = 16'h4052;
              3'h4: pos_word = 16'hbf57;
              3'h5: pos_word = 16'h3f02;
              3'h6: pos_word = 16'hc16c;
              3'h7: pos_word = 16'hbeb2;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f8d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00b;
              3'h2: pos_word = 16'h3ce4;
              3'h3: pos_word = 16'h4023;
              3'h4: pos_word = 16'hbf7c;
              3'h5: pos_word = 16'h3ed3;
              3'h6: pos_word = 16'h42a7;
              3'h7: pos_word = 16'hbee1;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f70;
            case (mant_lo3)
              3'h1: pos_word = 16'hc02f;
              3'h2: pos_word = 16'hbd54;
              3'h3: pos_word = 16'h4003;
              3'h4: pos_word = 16'hbf94;
              3'h5: pos_word = 16'h3ea5;
              3'h6: pos_word = 16'h412e;
              3'h7: pos_word = 16'hbf0a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f4c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc066;
              3'h2: pos_word = 16'hbe07;
              3'h3: pos_word = 16'h3fd8;
              3'h4: pos_word = 16'hbfae;
              3'h5: pos_word = 16'h3e71;
              3'h6: pos_word = 16'h40b9;
              3'h7: pos_word = 16'hbf25;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8d: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f2d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5b;
              3'h2: pos_word = 16'hbfcf;
              3'h3: pos_word = 16'h407a;
              3'h4: pos_word = 16'h3f11;
              3'h5: pos_word = 16'hbe99;
              3'h6: pos_word = 16'hbff9;
              3'h7: pos_word = 16'h403b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3eee;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec7;
              3'h2: pos_word = 16'hc019;
              3'h3: pos_word = 16'h4013;
              3'h4: pos_word = 16'h3ebe;
              3'h5: pos_word = 16'hbef7;
              3'h6: pos_word = 16'hc044;
              3'h7: pos_word = 16'h3ff0;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e91;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf16;
              3'h2: pos_word = 16'hc085;
              3'h3: pos_word = 16'h3fc8;
              3'h4: pos_word = 16'h3e4c;
              3'h5: pos_word = 16'hbf33;
              3'h6: pos_word = 16'hc0cb;
              3'h7: pos_word = 16'h3fa9;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3df0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf53;
              3'h2: pos_word = 16'hc150;
              3'h3: pos_word = 16'h3f8f;
              3'h4: pos_word = 16'h3d18;
              3'h5: pos_word = 16'hbf77;
              3'h6: pos_word = 16'h43b9;
              3'h7: pos_word = 16'h3f75;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbd2e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf91;
              3'h2: pos_word = 16'h4142;
              3'h3: pos_word = 16'h3f50;
              3'h4: pos_word = 16'hbdfb;
              3'h5: pos_word = 16'hbfab;
              3'h6: pos_word = 16'h40c4;
              3'h7: pos_word = 16'h3f30;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe51;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfca;
              3'h2: pos_word = 16'h4082;
              3'h3: pos_word = 16'h3f14;
              3'h4: pos_word = 16'hbe94;
              3'h5: pos_word = 16'hbff3;
              3'h6: pos_word = 16'h4040;
              3'h7: pos_word = 16'h3ef4;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbec1;
            case (mant_lo3)
              3'h1: pos_word = 16'hc015;
              3'h2: pos_word = 16'h4017;
              3'h3: pos_word = 16'h3ec4;
              3'h4: pos_word = 16'hbef1;
              3'h5: pos_word = 16'hc03e;
              3'h6: pos_word = 16'h3ff6;
              3'h7: pos_word = 16'h3e96;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf13;
            case (mant_lo3)
              3'h1: pos_word = 16'hc080;
              3'h2: pos_word = 16'h3fcc;
              3'h3: pos_word = 16'h3e56;
              3'h4: pos_word = 16'hbf2f;
              3'h5: pos_word = 16'hc0bf;
              3'h6: pos_word = 16'h3fac;
              3'h7: pos_word = 16'h3e02;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc139;
              3'h2: pos_word = 16'h3f92;
              3'h3: pos_word = 16'h3d3e;
              3'h4: pos_word = 16'hbf73;
              3'h5: pos_word = 16'hc318;
              3'h6: pos_word = 16'h3f79;
              3'h7: pos_word = 16'hbd08;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf8e;
            case (mant_lo3)
              3'h1: pos_word = 16'h415b;
              3'h2: pos_word = 16'h3f54;
              3'h3: pos_word = 16'hbde8;
              3'h4: pos_word = 16'hbfa7;
              3'h5: pos_word = 16'h40d0;
              3'h6: pos_word = 16'h3f34;
              3'h7: pos_word = 16'hbe48;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfc6;
            case (mant_lo3)
              3'h1: pos_word = 16'h4087;
              3'h2: pos_word = 16'h3f17;
              3'h3: pos_word = 16'hbe8f;
              3'h4: pos_word = 16'hbfee;
              3'h5: pos_word = 16'h4047;
              3'h6: pos_word = 16'h3efa;
              3'h7: pos_word = 16'hbebc;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc012;
            case (mant_lo3)
              3'h1: pos_word = 16'h401b;
              3'h2: pos_word = 16'h3ec9;
              3'h3: pos_word = 16'hbeec;
              3'h4: pos_word = 16'hc038;
              3'h5: pos_word = 16'h3ffb;
              3'h6: pos_word = 16'h3e9b;
              3'h7: pos_word = 16'hbf0f;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc076;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd0;
              3'h2: pos_word = 16'h3e5f;
              3'h3: pos_word = 16'hbf2c;
              3'h4: pos_word = 16'hc0b5;
              3'h5: pos_word = 16'h3faf;
              3'h6: pos_word = 16'h3e0b;
              3'h7: pos_word = 16'hbf4b;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc127;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f95;
              3'h2: pos_word = 16'h3d64;
              3'h3: pos_word = 16'hbf6e;
              3'h4: pos_word = 16'hc27d;
              3'h5: pos_word = 16'h3f7e;
              3'h6: pos_word = 16'hbcc4;
              3'h7: pos_word = 16'hbf8c;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h417b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f58;
              3'h2: pos_word = 16'hbdd5;
              3'h3: pos_word = 16'hbfa4;
              3'h4: pos_word = 16'h40de;
              3'h5: pos_word = 16'h3f38;
              3'h6: pos_word = 16'hbe3e;
              3'h7: pos_word = 16'hbfc2;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h408d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1a;
              3'h2: pos_word = 16'hbe8a;
              3'h3: pos_word = 16'hbfe9;
              3'h4: pos_word = 16'h404d;
              3'h5: pos_word = 16'h3f00;
              3'h6: pos_word = 16'hbeb6;
              3'h7: pos_word = 16'hc00e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8e: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h401f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee6;
              3'h2: pos_word = 16'h4001;
              3'h3: pos_word = 16'hbf0c;
              3'h4: pos_word = 16'h3fd5;
              3'h5: pos_word = 16'hbf28;
              3'h6: pos_word = 16'h3fb3;
              3'h7: pos_word = 16'hbf47;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f98;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6a;
              3'h2: pos_word = 16'h3f81;
              3'h3: pos_word = 16'hbf89;
              3'h4: pos_word = 16'h3f5c;
              3'h5: pos_word = 16'hbfa1;
              3'h6: pos_word = 16'h3f3b;
              3'h7: pos_word = 16'hbfbf;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f1e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe4;
              3'h2: pos_word = 16'h3f03;
              3'h3: pos_word = 16'hc00b;
              3'h4: pos_word = 16'h3ed4;
              3'h5: pos_word = 16'hc02e;
              3'h6: pos_word = 16'h3ea6;
              3'h7: pos_word = 16'hc064;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e73;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a3;
              3'h2: pos_word = 16'h3e1f;
              3'h3: pos_word = 16'hc10c;
              3'h4: pos_word = 16'h3d98;
              3'h5: pos_word = 16'hc1e9;
              3'h6: pos_word = 16'hbbb1;
              3'h7: pos_word = 16'h41b1;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbdaf;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ff;
              3'h2: pos_word = 16'hbe2a;
              3'h3: pos_word = 16'h409a;
              3'h4: pos_word = 16'hbe7f;
              3'h5: pos_word = 16'h405b;
              3'h6: pos_word = 16'hbeac;
              3'h7: pos_word = 16'h4028;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbedb;
            case (mant_lo3)
              3'h1: pos_word = 16'h4007;
              3'h2: pos_word = 16'hbf06;
              3'h3: pos_word = 16'h3fde;
              3'h4: pos_word = 16'hbf21;
              3'h5: pos_word = 16'h3fba;
              3'h6: pos_word = 16'hbf3f;
              3'h7: pos_word = 16'h3f9e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf61;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f86;
              3'h2: pos_word = 16'hbf84;
              3'h3: pos_word = 16'h3f65;
              3'h4: pos_word = 16'hbf9b;
              3'h5: pos_word = 16'h3f43;
              3'h6: pos_word = 16'hbfb7;
              3'h7: pos_word = 16'h3f24;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfda;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f09;
              3'h2: pos_word = 16'hc004;
              3'h3: pos_word = 16'h3edf;
              3'h4: pos_word = 16'hc024;
              3'h5: pos_word = 16'h3eb0;
              3'h6: pos_word = 16'hc055;
              3'h7: pos_word = 16'h3e84;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc095;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e32;
              3'h2: pos_word = 16'hc0f0;
              3'h3: pos_word = 16'h3dbe;
              3'h4: pos_word = 16'hc197;
              3'h5: pos_word = 16'h3c57;
              3'h6: pos_word = 16'h4216;
              3'h7: pos_word = 16'hbd88;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4116;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe17;
              3'h2: pos_word = 16'h40aa;
              3'h3: pos_word = 16'hbe6b;
              3'h4: pos_word = 16'h406b;
              3'h5: pos_word = 16'hbea1;
              3'h6: pos_word = 16'h4032;
              3'h7: pos_word = 16'hbecf;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h400e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf00;
              3'h2: pos_word = 16'h3fe8;
              3'h3: pos_word = 16'hbf1b;
              3'h4: pos_word = 16'h3fc2;
              3'h5: pos_word = 16'hbf38;
              3'h6: pos_word = 16'h3fa4;
              3'h7: pos_word = 16'hbf59;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf7f;
              3'h2: pos_word = 16'h3f6e;
              3'h3: pos_word = 16'hbf95;
              3'h4: pos_word = 16'h3f4a;
              3'h5: pos_word = 16'hbfb0;
              3'h6: pos_word = 16'h3f2b;
              3'h7: pos_word = 16'hbfd1;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f0f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbffc;
              3'h2: pos_word = 16'h3eeb;
              3'h3: pos_word = 16'hc01c;
              3'h4: pos_word = 16'h3ebb;
              3'h5: pos_word = 16'hc048;
              3'h6: pos_word = 16'h3e8e;
              3'h7: pos_word = 16'hc088;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3e46;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0d2;
              3'h2: pos_word = 16'h3de5;
              3'h3: pos_word = 16'hc15f;
              3'h4: pos_word = 16'h3d02;
              3'h5: pos_word = 16'h42f6;
              3'h6: pos_word = 16'hbd44;
              3'h7: pos_word = 16'h4136;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe03;
            case (mant_lo3)
              3'h1: pos_word = 16'h40bd;
              3'h2: pos_word = 16'hbe57;
              3'h3: pos_word = 16'h407e;
              3'h4: pos_word = 16'hbe97;
              3'h5: pos_word = 16'h403d;
              3'h6: pos_word = 16'hbec4;
              3'h7: pos_word = 16'h4015;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbef5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff2;
              3'h2: pos_word = 16'hbf14;
              3'h3: pos_word = 16'h3fca;
              3'h4: pos_word = 16'hbf31;
              3'h5: pos_word = 16'h3faa;
              3'h6: pos_word = 16'hbf51;
              3'h7: pos_word = 16'h3f91;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8f: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf75;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf90;
              3'h2: pos_word = 16'hbfa9;
              3'h3: pos_word = 16'hbfc9;
              3'h4: pos_word = 16'hbff1;
              3'h5: pos_word = 16'hc014;
              3'h6: pos_word = 16'hc03c;
              3'h7: pos_word = 16'hc07b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc0bb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc131;
              3'h2: pos_word = 16'hc2c0;
              3'h3: pos_word = 16'h4167;
              3'h4: pos_word = 16'h40d5;
              3'h5: pos_word = 16'h408a;
              3'h6: pos_word = 16'h4049;
              3'h7: pos_word = 16'h401d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ffe;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd2;
              3'h2: pos_word = 16'h3fb1;
              3'h3: pos_word = 16'h3f96;
              3'h4: pos_word = 16'h3f80;
              3'h5: pos_word = 16'h3f5a;
              3'h6: pos_word = 16'h3f39;
              3'h7: pos_word = 16'h3f1c;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f01;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed1;
              3'h2: pos_word = 16'h3ea3;
              3'h3: pos_word = 16'h3e6e;
              3'h4: pos_word = 16'h3e19;
              3'h5: pos_word = 16'h3d8d;
              3'h6: pos_word = 16'hbc31;
              3'h7: pos_word = 16'hbdba;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbe30;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe83;
              3'h2: pos_word = 16'hbeaf;
              3'h3: pos_word = 16'hbede;
              3'h4: pos_word = 16'hbf08;
              3'h5: pos_word = 16'hbf23;
              3'h6: pos_word = 16'hbf42;
              3'h7: pos_word = 16'hbf64;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf86;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9d;
              3'h2: pos_word = 16'hbfb9;
              3'h3: pos_word = 16'hbfdd;
              3'h4: pos_word = 16'hc006;
              3'h5: pos_word = 16'hc027;
              3'h6: pos_word = 16'hc059;
              3'h7: pos_word = 16'hc099;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc0fa;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1a8;
              3'h2: pos_word = 16'h41f9;
              3'h3: pos_word = 16'h410f;
              3'h4: pos_word = 16'h40a5;
              3'h5: pos_word = 16'h4066;
              3'h6: pos_word = 16'h402f;
              3'h7: pos_word = 16'h400c;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3fe5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbf;
              3'h2: pos_word = 16'h3fa2;
              3'h3: pos_word = 16'h3f8a;
              3'h4: pos_word = 16'h3f6b;
              3'h5: pos_word = 16'h3f48;
              3'h6: pos_word = 16'h3f29;
              3'h7: pos_word = 16'h3f0d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3ee7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb8;
              3'h2: pos_word = 16'h3e8b;
              3'h3: pos_word = 16'h3e40;
              3'h4: pos_word = 16'h3dda;
              3'h5: pos_word = 16'h3cd7;
              3'h6: pos_word = 16'hbd5b;
              3'h7: pos_word = 16'hbe09;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe5d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9a;
              3'h2: pos_word = 16'hbec8;
              3'h3: pos_word = 16'hbef8;
              3'h4: pos_word = 16'hbf16;
              3'h5: pos_word = 16'hbf33;
              3'h6: pos_word = 16'hbf53;
              3'h7: pos_word = 16'hbf78;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfab;
              3'h2: pos_word = 16'hbfcb;
              3'h3: pos_word = 16'hbff4;
              3'h4: pos_word = 16'hc016;
              3'h5: pos_word = 16'hc03f;
              3'h6: pos_word = 16'hc081;
              3'h7: pos_word = 16'hc0c1;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc13d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc348;
              3'h2: pos_word = 16'h4156;
              3'h3: pos_word = 16'h40ce;
              3'h4: pos_word = 16'h4086;
              3'h5: pos_word = 16'h4045;
              3'h6: pos_word = 16'h401a;
              3'h7: pos_word = 16'h3ffa;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fd0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3faf;
              3'h2: pos_word = 16'h3f94;
              3'h3: pos_word = 16'h3f7d;
              3'h4: pos_word = 16'h3f58;
              3'h5: pos_word = 16'h3f37;
              3'h6: pos_word = 16'h3f1a;
              3'h7: pos_word = 16'h3eff;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ece;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea0;
              3'h2: pos_word = 16'h3e68;
              3'h3: pos_word = 16'h3e13;
              3'h4: pos_word = 16'h3d82;
              3'h5: pos_word = 16'hbc85;
              3'h6: pos_word = 16'hbdc5;
              3'h7: pos_word = 16'hbe36;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe85;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb2;
              3'h2: pos_word = 16'hbee1;
              3'h3: pos_word = 16'hbf0a;
              3'h4: pos_word = 16'hbf25;
              3'h5: pos_word = 16'hbf44;
              3'h6: pos_word = 16'hbf66;
              3'h7: pos_word = 16'hbf87;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf9f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbb;
              3'h2: pos_word = 16'hbfe0;
              3'h3: pos_word = 16'hc008;
              3'h4: pos_word = 16'hc02a;
              3'h5: pos_word = 16'hc05e;
              3'h6: pos_word = 16'hc09d;
              3'h7: pos_word = 16'hc103;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h90: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc1be;
            case (mant_lo3)
              3'h1: pos_word = 16'h4108;
              3'h2: pos_word = 16'h4062;
              3'h3: pos_word = 16'h400a;
              3'h4: pos_word = 16'h3fbd;
              3'h5: pos_word = 16'h3f88;
              3'h6: pos_word = 16'h3f46;
              3'h7: pos_word = 16'h3f0b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3eb5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e3a;
              3'h2: pos_word = 16'h3cab;
              3'h3: pos_word = 16'hbe0f;
              3'h4: pos_word = 16'hbe9d;
              3'h5: pos_word = 16'hbefc;
              3'h6: pos_word = 16'hbf35;
              3'h7: pos_word = 16'hbf7b;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfad;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff8;
              3'h2: pos_word = 16'hc042;
              3'h3: pos_word = 16'hc0c8;
              3'h4: pos_word = 16'h451a;
              3'h5: pos_word = 16'h40c7;
              3'h6: pos_word = 16'h4042;
              3'h7: pos_word = 16'h3ff7;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fad;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7a;
              3'h2: pos_word = 16'h3f35;
              3'h3: pos_word = 16'h3efb;
              3'h4: pos_word = 16'h3e9d;
              3'h5: pos_word = 16'h3e0e;
              3'h6: pos_word = 16'hbcb1;
              3'h7: pos_word = 16'hbe3b;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbeb5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0c;
              3'h2: pos_word = 16'hbf46;
              3'h3: pos_word = 16'hbf89;
              3'h4: pos_word = 16'hbfbe;
              3'h5: pos_word = 16'hc00a;
              3'h6: pos_word = 16'hc062;
              3'h7: pos_word = 16'hc109;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h41ba;
            case (mant_lo3)
              3'h1: pos_word = 16'h409c;
              3'h2: pos_word = 16'h4029;
              3'h3: pos_word = 16'h3fdf;
              3'h4: pos_word = 16'h3f9e;
              3'h5: pos_word = 16'h3f66;
              3'h6: pos_word = 16'h3f25;
              3'h7: pos_word = 16'h3ee1;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e85;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dc3;
              3'h2: pos_word = 16'hbd84;
              3'h3: pos_word = 16'hbe69;
              3'h4: pos_word = 16'hbece;
              3'h5: pos_word = 16'hbf1a;
              3'h6: pos_word = 16'hbf58;
              3'h7: pos_word = 16'hbf95;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfd0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01b;
              3'h2: pos_word = 16'hc087;
              3'h3: pos_word = 16'hc158;
              3'h4: pos_word = 16'h413b;
              3'h5: pos_word = 16'h4080;
              3'h6: pos_word = 16'h4016;
              3'h7: pos_word = 16'h3fcb;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f53;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h3ec7;
              3'h4: pos_word = 16'h3e5c;
              3'h5: pos_word = 16'h3d57;
              3'h6: pos_word = 16'hbddb;
              3'h7: pos_word = 16'hbe8b;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbee8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf29;
              3'h2: pos_word = 16'hbf6b;
              3'h3: pos_word = 16'hbfa2;
              3'h4: pos_word = 16'hbfe5;
              3'h5: pos_word = 16'hc030;
              3'h6: pos_word = 16'hc0a6;
              3'h7: pos_word = 16'hc200;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h40f9;
            case (mant_lo3)
              3'h1: pos_word = 16'h4059;
              3'h2: pos_word = 16'h4006;
              3'h3: pos_word = 16'h3fb9;
              3'h4: pos_word = 16'h3f85;
              3'h5: pos_word = 16'h3f41;
              3'h6: pos_word = 16'h3f08;
              3'h7: pos_word = 16'h3eae;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e2f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3c24;
              3'h2: pos_word = 16'hbe1a;
              3'h3: pos_word = 16'hbea3;
              3'h4: pos_word = 16'hbf01;
              3'h5: pos_word = 16'hbf39;
              3'h6: pos_word = 16'hbf80;
              3'h7: pos_word = 16'hbfb1;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbffe;
            case (mant_lo3)
              3'h1: pos_word = 16'hc04a;
              3'h2: pos_word = 16'hc0d7;
              3'h3: pos_word = 16'h42b2;
              3'h4: pos_word = 16'h40ba;
              3'h5: pos_word = 16'h403b;
              3'h6: pos_word = 16'h3ff1;
              3'h7: pos_word = 16'h3fa9;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f75;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f31;
              3'h2: pos_word = 16'h3ef4;
              3'h3: pos_word = 16'h3e97;
              3'h4: pos_word = 16'h3e02;
              3'h5: pos_word = 16'hbd05;
              3'h6: pos_word = 16'hbe47;
              3'h7: pos_word = 16'hbebb;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf0f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4b;
              3'h2: pos_word = 16'hbf8c;
              3'h3: pos_word = 16'hbfc2;
              3'h4: pos_word = 16'hc00e;
              3'h5: pos_word = 16'hc06c;
              3'h6: pos_word = 16'hc117;
              3'h7: pos_word = 16'h4195;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4094;
            case (mant_lo3)
              3'h1: pos_word = 16'h4024;
              3'h2: pos_word = 16'h3fda;
              3'h3: pos_word = 16'h3f9b;
              3'h4: pos_word = 16'h3f61;
              3'h5: pos_word = 16'h3f21;
              3'h6: pos_word = 16'h3eda;
              3'h7: pos_word = 16'h3e7e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h91: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3dad;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe74;
              3'h2: pos_word = 16'hbf1e;
              3'h3: pos_word = 16'hbf98;
              3'h4: pos_word = 16'hc020;
              3'h5: pos_word = 16'hc17e;
              3'h6: pos_word = 16'h4075;
              3'h7: pos_word = 16'h3fc6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f4e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec1;
              3'h2: pos_word = 16'h3d2b;
              3'h3: pos_word = 16'hbe91;
              3'h4: pos_word = 16'hbf2d;
              3'h5: pos_word = 16'hbfa6;
              3'h6: pos_word = 16'hc036;
              3'h7: pos_word = 16'hc244;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4050;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb5;
              3'h2: pos_word = 16'h3f3d;
              3'h3: pos_word = 16'h3ea8;
              3'h4: pos_word = 16'hba55;
              3'h5: pos_word = 16'hbea9;
              3'h6: pos_word = 16'hbf3e;
              3'h7: pos_word = 16'hbfb5;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc052;
            case (mant_lo3)
              3'h1: pos_word = 16'h4235;
              3'h2: pos_word = 16'h4035;
              3'h3: pos_word = 16'h3fa5;
              3'h4: pos_word = 16'h3f2d;
              3'h5: pos_word = 16'h3e91;
              3'h6: pos_word = 16'hbd32;
              3'h7: pos_word = 16'hbec2;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc7;
              3'h2: pos_word = 16'hc077;
              3'h3: pos_word = 16'h4177;
              3'h4: pos_word = 16'h401f;
              3'h5: pos_word = 16'h3f98;
              3'h6: pos_word = 16'h3f1d;
              3'h7: pos_word = 16'h3e73;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbdb0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbedb;
              3'h2: pos_word = 16'hbf62;
              3'h3: pos_word = 16'hbfdb;
              3'h4: pos_word = 16'hc095;
              3'h5: pos_word = 16'h4115;
              3'h6: pos_word = 16'h400d;
              3'h7: pos_word = 16'h3f8b;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f0f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e45;
              3'h2: pos_word = 16'hbe04;
              3'h3: pos_word = 16'hbef5;
              3'h4: pos_word = 16'hbf76;
              3'h5: pos_word = 16'hbff2;
              3'h6: pos_word = 16'hc0bc;
              3'h7: pos_word = 16'h40d4;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ffd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7f;
              3'h2: pos_word = 16'h3f01;
              3'h3: pos_word = 16'h3e18;
              3'h4: pos_word = 16'hbe31;
              3'h5: pos_word = 16'hbf08;
              3'h6: pos_word = 16'hbf86;
              3'h7: pos_word = 16'hc006;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc0fc;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a5;
              3'h2: pos_word = 16'h3fe5;
              3'h3: pos_word = 16'h3f6b;
              3'h4: pos_word = 16'h3ee7;
              3'h5: pos_word = 16'h3dd8;
              3'h6: pos_word = 16'hbe5e;
              3'h7: pos_word = 16'hbf17;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'hc016;
              3'h2: pos_word = 16'hc13e;
              3'h3: pos_word = 16'h4086;
              3'h4: pos_word = 16'h3fcf;
              3'h5: pos_word = 16'h3f57;
              3'h6: pos_word = 16'h3ecd;
              3'h7: pos_word = 16'h3d80;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe86;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf26;
              3'h2: pos_word = 16'hbf9f;
              3'h3: pos_word = 16'hc02a;
              3'h4: pos_word = 16'hc1c2;
              3'h5: pos_word = 16'h4061;
              3'h6: pos_word = 16'h3fbd;
              3'h7: pos_word = 16'h3f45;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3eb4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ca4;
              3'h2: pos_word = 16'hbe9d;
              3'h3: pos_word = 16'hbf36;
              3'h4: pos_word = 16'hbfae;
              3'h5: pos_word = 16'hc043;
              3'h6: pos_word = 16'h444e;
              3'h7: pos_word = 16'h4041;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fad;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f35;
              3'h2: pos_word = 16'h3e9c;
              3'h3: pos_word = 16'hbcb8;
              3'h4: pos_word = 16'hbeb6;
              3'h5: pos_word = 16'hbf46;
              3'h6: pos_word = 16'hbfbe;
              3'h7: pos_word = 16'hc063;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h41b7;
            case (mant_lo3)
              3'h1: pos_word = 16'h4029;
              3'h2: pos_word = 16'h3f9e;
              3'h3: pos_word = 16'h3f25;
              3'h4: pos_word = 16'h3e85;
              3'h5: pos_word = 16'hbd85;
              3'h6: pos_word = 16'hbecf;
              3'h7: pos_word = 16'hbf58;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfd0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc087;
              3'h2: pos_word = 16'h4139;
              3'h3: pos_word = 16'h4015;
              3'h4: pos_word = 16'h3f91;
              3'h5: pos_word = 16'h3f16;
              3'h6: pos_word = 16'h3e5b;
              3'h7: pos_word = 16'hbddd;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbee8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6c;
              3'h2: pos_word = 16'hbfe6;
              3'h3: pos_word = 16'hc0a7;
              3'h4: pos_word = 16'h40f7;
              3'h5: pos_word = 16'h4005;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'h3f08;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h92: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e2e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf02;
              3'h2: pos_word = 16'hbfff;
              3'h3: pos_word = 16'h40b9;
              3'h4: pos_word = 16'h3f75;
              3'h5: pos_word = 16'h3e02;
              3'h6: pos_word = 16'hbf10;
              3'h7: pos_word = 16'hc00e;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h4093;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f61;
              3'h2: pos_word = 16'h3dab;
              3'h3: pos_word = 16'hbf1e;
              3'h4: pos_word = 16'hc020;
              3'h5: pos_word = 16'h4074;
              3'h6: pos_word = 16'h3f4e;
              3'h7: pos_word = 16'h3d28;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf2e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc036;
              3'h2: pos_word = 16'h4050;
              3'h3: pos_word = 16'h3f3d;
              3'h4: pos_word = 16'hbad5;
              3'h5: pos_word = 16'hbf3e;
              3'h6: pos_word = 16'hc052;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd35;
              3'h2: pos_word = 16'hbf4f;
              3'h3: pos_word = 16'hc078;
              3'h4: pos_word = 16'h401e;
              3'h5: pos_word = 16'h3f1d;
              3'h6: pos_word = 16'hbdb2;
              3'h7: pos_word = 16'hbf62;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc096;
            case (mant_lo3)
              3'h1: pos_word = 16'h400d;
              3'h2: pos_word = 16'h3f0e;
              3'h3: pos_word = 16'hbe05;
              3'h4: pos_word = 16'hbf76;
              3'h5: pos_word = 16'hc0bd;
              3'h6: pos_word = 16'h3ffd;
              3'h7: pos_word = 16'h3f00;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe32;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'hc0fe;
              3'h3: pos_word = 16'h3fe4;
              3'h4: pos_word = 16'h3ee6;
              3'h5: pos_word = 16'hbe5f;
              3'h6: pos_word = 16'hbf92;
              3'h7: pos_word = 16'hc140;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3fcf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ecd;
              3'h2: pos_word = 16'hbe86;
              3'h3: pos_word = 16'hbf9f;
              3'h4: pos_word = 16'hc1c6;
              3'h5: pos_word = 16'h3fbd;
              3'h6: pos_word = 16'h3eb4;
              3'h7: pos_word = 16'hbe9e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfae;
            case (mant_lo3)
              3'h1: pos_word = 16'h43f7;
              3'h2: pos_word = 16'h3fac;
              3'h3: pos_word = 16'h3e9c;
              3'h4: pos_word = 16'hbeb6;
              3'h5: pos_word = 16'hbfbe;
              3'h6: pos_word = 16'h41b4;
              3'h7: pos_word = 16'h3f9e;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3e84;
            case (mant_lo3)
              3'h1: pos_word = 16'hbecf;
              3'h2: pos_word = 16'hbfd1;
              3'h3: pos_word = 16'h4137;
              3'h4: pos_word = 16'h3f91;
              3'h5: pos_word = 16'h3e5a;
              3'h6: pos_word = 16'hbee9;
              3'h7: pos_word = 16'hbfe6;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h40f6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f85;
              3'h2: pos_word = 16'h3e2d;
              3'h3: pos_word = 16'hbf02;
              3'h4: pos_word = 16'hbfff;
              3'h5: pos_word = 16'h40b8;
              3'h6: pos_word = 16'h3f74;
              3'h7: pos_word = 16'h3e01;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf10;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00e;
              3'h2: pos_word = 16'h4093;
              3'h3: pos_word = 16'h3f60;
              3'h4: pos_word = 16'h3daa;
              3'h5: pos_word = 16'hbf1e;
              3'h6: pos_word = 16'hc020;
              3'h7: pos_word = 16'h4073;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f4e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d24;
              3'h2: pos_word = 16'hbf2e;
              3'h3: pos_word = 16'hc037;
              3'h4: pos_word = 16'h404f;
              3'h5: pos_word = 16'h3f3c;
              3'h6: pos_word = 16'hbb1f;
              3'h7: pos_word = 16'hbf3e;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc053;
            case (mant_lo3)
              3'h1: pos_word = 16'h4034;
              3'h2: pos_word = 16'h3f2c;
              3'h3: pos_word = 16'hbd38;
              3'h4: pos_word = 16'hbf50;
              3'h5: pos_word = 16'hc078;
              3'h6: pos_word = 16'h401e;
              3'h7: pos_word = 16'h3f1d;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbdb4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf62;
              3'h2: pos_word = 16'hc096;
              3'h3: pos_word = 16'h400d;
              3'h4: pos_word = 16'h3f0e;
              3'h5: pos_word = 16'hbe06;
              3'h6: pos_word = 16'hbf77;
              3'h7: pos_word = 16'hc0be;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3ffc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f00;
              3'h2: pos_word = 16'hbe32;
              3'h3: pos_word = 16'hbf86;
              3'h4: pos_word = 16'hc0ff;
              3'h5: pos_word = 16'h3fe4;
              3'h6: pos_word = 16'h3ee6;
              3'h7: pos_word = 16'hbe60;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'hc142;
              3'h2: pos_word = 16'h3fcf;
              3'h3: pos_word = 16'h3ecc;
              3'h4: pos_word = 16'hbe87;
              3'h5: pos_word = 16'hbf9f;
              3'h6: pos_word = 16'hc1ca;
              3'h7: pos_word = 16'h3fbc;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h93: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3eb3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfae;
              3'h2: pos_word = 16'h3fac;
              3'h3: pos_word = 16'hbeb7;
              3'h4: pos_word = 16'h41b0;
              3'h5: pos_word = 16'h3e84;
              3'h6: pos_word = 16'hbfd1;
              3'h7: pos_word = 16'h3f91;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbee9;
            case (mant_lo3)
              3'h1: pos_word = 16'h40f4;
              3'h2: pos_word = 16'h3e2c;
              3'h3: pos_word = 16'hc000;
              3'h4: pos_word = 16'h3f74;
              3'h5: pos_word = 16'hbf10;
              3'h6: pos_word = 16'h4092;
              3'h7: pos_word = 16'h3da8;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc021;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4d;
              3'h2: pos_word = 16'hbf2e;
              3'h3: pos_word = 16'h404f;
              3'h4: pos_word = 16'hbb55;
              3'h5: pos_word = 16'hc053;
              3'h6: pos_word = 16'h3f2c;
              3'h7: pos_word = 16'hbf50;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h401e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb5;
              3'h2: pos_word = 16'hc097;
              3'h3: pos_word = 16'h3f0e;
              3'h4: pos_word = 16'hbf77;
              3'h5: pos_word = 16'h3ffc;
              3'h6: pos_word = 16'hbe33;
              3'h7: pos_word = 16'hc100;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ee5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf92;
              3'h2: pos_word = 16'h3fce;
              3'h3: pos_word = 16'hbe87;
              3'h4: pos_word = 16'hc1ce;
              3'h5: pos_word = 16'h3eb3;
              3'h6: pos_word = 16'hbfae;
              3'h7: pos_word = 16'h3fac;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbeb7;
            case (mant_lo3)
              3'h1: pos_word = 16'h41ad;
              3'h2: pos_word = 16'h3e83;
              3'h3: pos_word = 16'hbfd2;
              3'h4: pos_word = 16'h3f90;
              3'h5: pos_word = 16'hbeea;
              3'h6: pos_word = 16'h40f3;
              3'h7: pos_word = 16'h3e2c;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc000;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f73;
              3'h2: pos_word = 16'hbf10;
              3'h3: pos_word = 16'h4092;
              3'h4: pos_word = 16'h3da6;
              3'h5: pos_word = 16'hc021;
              3'h6: pos_word = 16'h3f4d;
              3'h7: pos_word = 16'hbf2f;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h404e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbb85;
              3'h2: pos_word = 16'hc054;
              3'h3: pos_word = 16'h3f2c;
              3'h4: pos_word = 16'hbf50;
              3'h5: pos_word = 16'h401d;
              3'h6: pos_word = 16'hbdb7;
              3'h7: pos_word = 16'hc098;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f0e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf77;
              3'h2: pos_word = 16'h3ffb;
              3'h3: pos_word = 16'hbe34;
              3'h4: pos_word = 16'hc101;
              3'h5: pos_word = 16'h3ee5;
              3'h6: pos_word = 16'hbf93;
              3'h7: pos_word = 16'h3fce;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe88;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1d2;
              3'h2: pos_word = 16'h3eb2;
              3'h3: pos_word = 16'hbfaf;
              3'h4: pos_word = 16'h3fab;
              3'h5: pos_word = 16'hbeb7;
              3'h6: pos_word = 16'h41aa;
              3'h7: pos_word = 16'h3e83;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfd2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f90;
              3'h2: pos_word = 16'hbeea;
              3'h3: pos_word = 16'h40f1;
              3'h4: pos_word = 16'h3e2b;
              3'h5: pos_word = 16'hc000;
              3'h6: pos_word = 16'h3f73;
              3'h7: pos_word = 16'hbf11;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4091;
            case (mant_lo3)
              3'h1: pos_word = 16'h3da5;
              3'h2: pos_word = 16'hc021;
              3'h3: pos_word = 16'h3f4d;
              3'h4: pos_word = 16'hbf2f;
              3'h5: pos_word = 16'h404d;
              3'h6: pos_word = 16'hbb9f;
              3'h7: pos_word = 16'hc055;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f2b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf51;
              3'h2: pos_word = 16'h401d;
              3'h3: pos_word = 16'hbdb9;
              3'h4: pos_word = 16'hc098;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'hbf78;
              3'h7: pos_word = 16'h3ffb;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe35;
            case (mant_lo3)
              3'h1: pos_word = 16'hc102;
              3'h2: pos_word = 16'h3ee4;
              3'h3: pos_word = 16'hbf93;
              3'h4: pos_word = 16'h3fcd;
              3'h5: pos_word = 16'hbe88;
              3'h6: pos_word = 16'hc1d7;
              3'h7: pos_word = 16'h3eb2;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfaf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fab;
              3'h2: pos_word = 16'hbeb8;
              3'h3: pos_word = 16'h41a7;
              3'h4: pos_word = 16'h3e82;
              3'h5: pos_word = 16'hbfd2;
              3'h6: pos_word = 16'h3f90;
              3'h7: pos_word = 16'hbeeb;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h40f0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e2a;
              3'h2: pos_word = 16'hc001;
              3'h3: pos_word = 16'h3f73;
              3'h4: pos_word = 16'hbf11;
              3'h5: pos_word = 16'h4091;
              3'h6: pos_word = 16'h3da3;
              3'h7: pos_word = 16'hc022;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h94: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f4c;
            case (mant_lo3)
              3'h1: pos_word = 16'h404d;
              3'h2: pos_word = 16'hc055;
              3'h3: pos_word = 16'hbf51;
              3'h4: pos_word = 16'hbdba;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'h3ffa;
              3'h7: pos_word = 16'hc103;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf93;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe89;
              3'h2: pos_word = 16'h3eb1;
              3'h3: pos_word = 16'h3fab;
              3'h4: pos_word = 16'h41a5;
              3'h5: pos_word = 16'hbfd3;
              3'h6: pos_word = 16'hbeeb;
              3'h7: pos_word = 16'h3e29;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f72;
            case (mant_lo3)
              3'h1: pos_word = 16'h4090;
              3'h2: pos_word = 16'hc022;
              3'h3: pos_word = 16'hbf2f;
              3'h4: pos_word = 16'hbbd5;
              3'h5: pos_word = 16'h3f2b;
              3'h6: pos_word = 16'h401c;
              3'h7: pos_word = 16'hc099;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf79;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe37;
              3'h2: pos_word = 16'h3ee3;
              3'h3: pos_word = 16'h3fcd;
              3'h4: pos_word = 16'hc1e1;
              3'h5: pos_word = 16'hbfb0;
              3'h6: pos_word = 16'hbeb9;
              3'h7: pos_word = 16'h3e82;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f8f;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ed;
              3'h2: pos_word = 16'hc001;
              3'h3: pos_word = 16'hbf11;
              3'h4: pos_word = 16'h3d9f;
              3'h5: pos_word = 16'h3f4c;
              3'h6: pos_word = 16'h404c;
              3'h7: pos_word = 16'hc057;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf52;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdbe;
              3'h2: pos_word = 16'h3f0d;
              3'h3: pos_word = 16'h3ff9;
              3'h4: pos_word = 16'hc105;
              3'h5: pos_word = 16'hbf94;
              3'h6: pos_word = 16'hbe89;
              3'h7: pos_word = 16'h3eb0;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3faa;
            case (mant_lo3)
              3'h1: pos_word = 16'h419f;
              3'h2: pos_word = 16'hbfd4;
              3'h3: pos_word = 16'hbeec;
              3'h4: pos_word = 16'h3e27;
              3'h5: pos_word = 16'h3f71;
              3'h6: pos_word = 16'h408f;
              3'h7: pos_word = 16'hc023;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf30;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc05;
              3'h2: pos_word = 16'h3f2a;
              3'h3: pos_word = 16'h401c;
              3'h4: pos_word = 16'hc09b;
              3'h5: pos_word = 16'hbf79;
              3'h6: pos_word = 16'hbe38;
              3'h7: pos_word = 16'h3ee2;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3fcc;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1eb;
              3'h2: pos_word = 16'hbfb0;
              3'h3: pos_word = 16'hbeba;
              3'h4: pos_word = 16'h3e81;
              3'h5: pos_word = 16'h3f8f;
              3'h6: pos_word = 16'h40ea;
              3'h7: pos_word = 16'hc002;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf12;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d9c;
              3'h2: pos_word = 16'h3f4b;
              3'h3: pos_word = 16'h404b;
              3'h4: pos_word = 16'hc058;
              3'h5: pos_word = 16'hbf53;
              3'h6: pos_word = 16'hbdc1;
              3'h7: pos_word = 16'h3f0c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3ff8;
            case (mant_lo3)
              3'h1: pos_word = 16'hc107;
              3'h2: pos_word = 16'hbf94;
              3'h3: pos_word = 16'hbe8a;
              3'h4: pos_word = 16'h3eb0;
              3'h5: pos_word = 16'h3faa;
              3'h6: pos_word = 16'h419a;
              3'h7: pos_word = 16'hbfd4;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbeed;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e26;
              3'h2: pos_word = 16'h3f71;
              3'h3: pos_word = 16'h408e;
              3'h4: pos_word = 16'hc024;
              3'h5: pos_word = 16'hbf31;
              3'h6: pos_word = 16'hbc1f;
              3'h7: pos_word = 16'h3f29;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h401b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc09c;
              3'h2: pos_word = 16'hbf7a;
              3'h3: pos_word = 16'hbe3a;
              3'h4: pos_word = 16'h3ee1;
              3'h5: pos_word = 16'h3fcb;
              3'h6: pos_word = 16'hc1f7;
              3'h7: pos_word = 16'hbfb1;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbebb;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e7f;
              3'h2: pos_word = 16'h3f8e;
              3'h3: pos_word = 16'h40e7;
              3'h4: pos_word = 16'hc002;
              3'h5: pos_word = 16'hbf13;
              3'h6: pos_word = 16'h3d99;
              3'h7: pos_word = 16'h3f4a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4049;
            case (mant_lo3)
              3'h1: pos_word = 16'hc059;
              3'h2: pos_word = 16'hbf53;
              3'h3: pos_word = 16'hbdc4;
              3'h4: pos_word = 16'h3f0b;
              3'h5: pos_word = 16'h3ff7;
              3'h6: pos_word = 16'hc109;
              3'h7: pos_word = 16'hbf95;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe8b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eaf;
              3'h2: pos_word = 16'h3fa9;
              3'h3: pos_word = 16'h4196;
              3'h4: pos_word = 16'hbfd5;
              3'h5: pos_word = 16'hbeee;
              3'h6: pos_word = 16'h3e24;
              3'h7: pos_word = 16'h3f70;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h95: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h408d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf31;
              3'h2: pos_word = 16'h3f29;
              3'h3: pos_word = 16'hc09d;
              3'h4: pos_word = 16'hbe3c;
              3'h5: pos_word = 16'h3fcb;
              3'h6: pos_word = 16'hbfb1;
              3'h7: pos_word = 16'h3e7e;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h40e4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf13;
              3'h2: pos_word = 16'h3f4a;
              3'h3: pos_word = 16'hc05a;
              3'h4: pos_word = 16'hbdc8;
              3'h5: pos_word = 16'h3ff6;
              3'h6: pos_word = 16'hbf95;
              3'h7: pos_word = 16'h3eae;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4191;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeef;
              3'h2: pos_word = 16'h3f6f;
              3'h3: pos_word = 16'hc025;
              3'h4: pos_word = 16'hbc55;
              3'h5: pos_word = 16'h4019;
              3'h6: pos_word = 16'hbf7c;
              3'h7: pos_word = 16'h3edf;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc209;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebd;
              3'h2: pos_word = 16'h3f8e;
              3'h3: pos_word = 16'hc003;
              3'h4: pos_word = 16'h3d92;
              3'h5: pos_word = 16'h4047;
              3'h6: pos_word = 16'hbf55;
              3'h7: pos_word = 16'h3f0a;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc10d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe8d;
              3'h2: pos_word = 16'h3fa8;
              3'h3: pos_word = 16'hbfd7;
              3'h4: pos_word = 16'h3e20;
              3'h5: pos_word = 16'h408b;
              3'h6: pos_word = 16'hbf33;
              3'h7: pos_word = 16'h3f28;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0a0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe3f;
              3'h2: pos_word = 16'h3fc9;
              3'h3: pos_word = 16'hbfb3;
              3'h4: pos_word = 16'h3e7a;
              3'h5: pos_word = 16'h40df;
              3'h6: pos_word = 16'hbf14;
              3'h7: pos_word = 16'h3f48;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc05d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdce;
              3'h2: pos_word = 16'h3ff4;
              3'h3: pos_word = 16'hbf96;
              3'h4: pos_word = 16'h3eac;
              3'h5: pos_word = 16'h4189;
              3'h6: pos_word = 16'hbef1;
              3'h7: pos_word = 16'h3f6e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc027;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc85;
              3'h2: pos_word = 16'h4018;
              3'h3: pos_word = 16'hbf7e;
              3'h4: pos_word = 16'h3edd;
              3'h5: pos_word = 16'hc21b;
              3'h6: pos_word = 16'hbebf;
              3'h7: pos_word = 16'h3f8d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc004;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d8b;
              3'h2: pos_word = 16'h4045;
              3'h3: pos_word = 16'hbf56;
              3'h4: pos_word = 16'h3f09;
              3'h5: pos_word = 16'hc111;
              3'h6: pos_word = 16'hbe8f;
              3'h7: pos_word = 16'h3fa7;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfd8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e1d;
              3'h2: pos_word = 16'h4089;
              3'h3: pos_word = 16'hbf34;
              3'h4: pos_word = 16'h3f26;
              3'h5: pos_word = 16'hc0a3;
              3'h6: pos_word = 16'hbe43;
              3'h7: pos_word = 16'h3fc8;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfb4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e77;
              3'h2: pos_word = 16'h40da;
              3'h3: pos_word = 16'hbf15;
              3'h4: pos_word = 16'h3f47;
              3'h5: pos_word = 16'hc060;
              3'h6: pos_word = 16'hbdd5;
              3'h7: pos_word = 16'h3ff2;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf97;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eaa;
              3'h2: pos_word = 16'h4182;
              3'h3: pos_word = 16'hbef3;
              3'h4: pos_word = 16'h3f6c;
              3'h5: pos_word = 16'hc029;
              3'h6: pos_word = 16'hbc9f;
              3'h7: pos_word = 16'h4017;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf7f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3edb;
              3'h2: pos_word = 16'hc231;
              3'h3: pos_word = 16'hbec0;
              3'h4: pos_word = 16'h3f8c;
              3'h5: pos_word = 16'hc006;
              3'h6: pos_word = 16'h3d85;
              3'h7: pos_word = 16'h4043;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf57;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f08;
              3'h2: pos_word = 16'hc115;
              3'h3: pos_word = 16'hbe91;
              3'h4: pos_word = 16'h3fa6;
              3'h5: pos_word = 16'hbfda;
              3'h6: pos_word = 16'h3e1a;
              3'h7: pos_word = 16'h4087;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf35;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f25;
              3'h2: pos_word = 16'hc0a5;
              3'h3: pos_word = 16'hbe46;
              3'h4: pos_word = 16'h3fc6;
              3'h5: pos_word = 16'hbfb5;
              3'h6: pos_word = 16'h3e73;
              3'h7: pos_word = 16'h40d5;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf16;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f46;
              3'h2: pos_word = 16'hc063;
              3'h3: pos_word = 16'hbddc;
              3'h4: pos_word = 16'h3ff1;
              3'h5: pos_word = 16'hbf98;
              3'h6: pos_word = 16'h3ea8;
              3'h7: pos_word = 16'h4177;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h96: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbef5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc02a;
              3'h2: pos_word = 16'h4015;
              3'h3: pos_word = 16'h3ed9;
              3'h4: pos_word = 16'hbec2;
              3'h5: pos_word = 16'hc007;
              3'h6: pos_word = 16'h4041;
              3'h7: pos_word = 16'h3f07;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbe92;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfdc;
              3'h2: pos_word = 16'h4085;
              3'h3: pos_word = 16'h3f24;
              3'h4: pos_word = 16'hbe4a;
              3'h5: pos_word = 16'hbfb6;
              3'h6: pos_word = 16'h40d1;
              3'h7: pos_word = 16'h3f44;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbde3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf99;
              3'h2: pos_word = 16'h416b;
              3'h3: pos_word = 16'h3f69;
              3'h4: pos_word = 16'hbcd5;
              3'h5: pos_word = 16'hbf81;
              3'h6: pos_word = 16'hc278;
              3'h7: pos_word = 16'h3f8a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3d6f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5a;
              3'h2: pos_word = 16'hc11f;
              3'h3: pos_word = 16'h3fa4;
              3'h4: pos_word = 16'h3e13;
              3'h5: pos_word = 16'hbf37;
              3'h6: pos_word = 16'hc0ab;
              3'h7: pos_word = 16'h3fc3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e6c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf19;
              3'h2: pos_word = 16'hc068;
              3'h3: pos_word = 16'h3fed;
              3'h4: pos_word = 16'h3ea5;
              3'h5: pos_word = 16'hbefa;
              3'h6: pos_word = 16'hc02e;
              3'h7: pos_word = 16'h4013;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3ed6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec6;
              3'h2: pos_word = 16'hc009;
              3'h3: pos_word = 16'h403d;
              3'h4: pos_word = 16'h3f05;
              3'h5: pos_word = 16'hbe96;
              3'h6: pos_word = 16'hbfdf;
              3'h7: pos_word = 16'h4081;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f22;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe50;
              3'h2: pos_word = 16'hbfb9;
              3'h3: pos_word = 16'h40c8;
              3'h4: pos_word = 16'h3f42;
              3'h5: pos_word = 16'hbdf0;
              3'h6: pos_word = 16'hbf9b;
              3'h7: pos_word = 16'h4156;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f66;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd05;
              3'h2: pos_word = 16'hbf83;
              3'h3: pos_word = 16'hc2cf;
              3'h4: pos_word = 16'h3f88;
              3'h5: pos_word = 16'h3d54;
              3'h6: pos_word = 16'hbf5d;
              3'h7: pos_word = 16'hc12a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3fa1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0c;
              3'h2: pos_word = 16'hbf3a;
              3'h3: pos_word = 16'hc0b2;
              3'h4: pos_word = 16'h3fc1;
              3'h5: pos_word = 16'h3e65;
              3'h6: pos_word = 16'hbf1b;
              3'h7: pos_word = 16'hc06e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fe9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea1;
              3'h2: pos_word = 16'hbefe;
              3'h3: pos_word = 16'hc031;
              3'h4: pos_word = 16'h4010;
              3'h5: pos_word = 16'h3ed2;
              3'h6: pos_word = 16'hbeca;
              3'h7: pos_word = 16'hc00b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4039;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f03;
              3'h2: pos_word = 16'hbe9a;
              3'h3: pos_word = 16'hbfe2;
              3'h4: pos_word = 16'h407b;
              3'h5: pos_word = 16'h3f1f;
              3'h6: pos_word = 16'hbe57;
              3'h7: pos_word = 16'hbfbb;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h40c0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3f;
              3'h2: pos_word = 16'hbdfd;
              3'h3: pos_word = 16'hbf9d;
              3'h4: pos_word = 16'h4145;
              3'h5: pos_word = 16'h3f63;
              3'h6: pos_word = 16'hbd20;
              3'h7: pos_word = 16'hbf85;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc39d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f86;
              3'h2: pos_word = 16'h3d3a;
              3'h3: pos_word = 16'hbf60;
              3'h4: pos_word = 16'hc137;
              3'h5: pos_word = 16'h3f9f;
              3'h6: pos_word = 16'h3e05;
              3'h7: pos_word = 16'hbf3d;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc0b9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbe;
              3'h2: pos_word = 16'h3e5e;
              3'h3: pos_word = 16'hbf1d;
              3'h4: pos_word = 16'hc075;
              3'h5: pos_word = 16'h3fe6;
              3'h6: pos_word = 16'h3e9d;
              3'h7: pos_word = 16'hbf01;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc035;
            case (mant_lo3)
              3'h1: pos_word = 16'h400e;
              3'h2: pos_word = 16'h3ece;
              3'h3: pos_word = 16'hbece;
              3'h4: pos_word = 16'hc00e;
              3'h5: pos_word = 16'h4035;
              3'h6: pos_word = 16'h3f01;
              3'h7: pos_word = 16'hbe9d;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfe6;
            case (mant_lo3)
              3'h1: pos_word = 16'h4075;
              3'h2: pos_word = 16'h3f1d;
              3'h3: pos_word = 16'hbe5e;
              3'h4: pos_word = 16'hbfbe;
              3'h5: pos_word = 16'h40b9;
              3'h6: pos_word = 16'h3f3d;
              3'h7: pos_word = 16'hbe05;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h97: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f60;
              3'h2: pos_word = 16'hbf86;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'hbf63;
              3'h5: pos_word = 16'h3f9d;
              3'h6: pos_word = 16'hbf3f;
              3'h7: pos_word = 16'h3fbb;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf1f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe2;
              3'h2: pos_word = 16'hbf03;
              3'h3: pos_word = 16'h400b;
              3'h4: pos_word = 16'hbed2;
              3'h5: pos_word = 16'h4031;
              3'h6: pos_word = 16'hbea1;
              3'h7: pos_word = 16'h406e;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe65;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b2;
              3'h2: pos_word = 16'hbe0c;
              3'h3: pos_word = 16'h412a;
              3'h4: pos_word = 16'hbd55;
              3'h5: pos_word = 16'h42cc;
              3'h6: pos_word = 16'h3d04;
              3'h7: pos_word = 16'hc157;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3df0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c8;
              3'h2: pos_word = 16'h3e50;
              3'h3: pos_word = 16'hc081;
              3'h4: pos_word = 16'h3e96;
              3'h5: pos_word = 16'hc03d;
              3'h6: pos_word = 16'h3ec6;
              3'h7: pos_word = 16'hc013;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ef9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfed;
              3'h2: pos_word = 16'h3f19;
              3'h3: pos_word = 16'hbfc4;
              3'h4: pos_word = 16'h3f37;
              3'h5: pos_word = 16'hbfa4;
              3'h6: pos_word = 16'h3f5a;
              3'h7: pos_word = 16'hbf8a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f81;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf69;
              3'h2: pos_word = 16'h3f99;
              3'h3: pos_word = 16'hbf44;
              3'h4: pos_word = 16'h3fb6;
              3'h5: pos_word = 16'hbf24;
              3'h6: pos_word = 16'h3fdb;
              3'h7: pos_word = 16'hbf07;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4007;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeda;
              3'h2: pos_word = 16'h402a;
              3'h3: pos_word = 16'hbea8;
              3'h4: pos_word = 16'h4062;
              3'h5: pos_word = 16'hbe73;
              3'h6: pos_word = 16'h40a5;
              3'h7: pos_word = 16'hbe1a;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4115;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd85;
              3'h2: pos_word = 16'h4230;
              3'h3: pos_word = 16'h3c9e;
              3'h4: pos_word = 16'hc182;
              3'h5: pos_word = 16'h3dd5;
              3'h6: pos_word = 16'hc0da;
              3'h7: pos_word = 16'h3e43;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc089;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e8f;
              3'h2: pos_word = 16'hc045;
              3'h3: pos_word = 16'h3ebe;
              3'h4: pos_word = 16'hc018;
              3'h5: pos_word = 16'h3ef1;
              3'h6: pos_word = 16'hbff4;
              3'h7: pos_word = 16'h3f14;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfc9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f32;
              3'h2: pos_word = 16'hbfa8;
              3'h3: pos_word = 16'h3f55;
              3'h4: pos_word = 16'hbf8e;
              3'h5: pos_word = 16'h3f7c;
              3'h6: pos_word = 16'hbf6f;
              3'h7: pos_word = 16'h3f95;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf4a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb1;
              3'h2: pos_word = 16'hbf29;
              3'h3: pos_word = 16'h3fd5;
              3'h4: pos_word = 16'hbf0b;
              3'h5: pos_word = 16'h4002;
              3'h6: pos_word = 16'hbee1;
              3'h7: pos_word = 16'h4024;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbeb0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4058;
              3'h2: pos_word = 16'hbe81;
              3'h3: pos_word = 16'h409b;
              3'h4: pos_word = 16'hbe27;
              3'h5: pos_word = 16'h4105;
              3'h6: pos_word = 16'hbda0;
              3'h7: pos_word = 16'h41e0;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3bd0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1a5;
              3'h2: pos_word = 16'h3dba;
              3'h3: pos_word = 16'hc0f0;
              3'h4: pos_word = 16'h3e35;
              3'h5: pos_word = 16'hc091;
              3'h6: pos_word = 16'h3e88;
              3'h7: pos_word = 16'hc04e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3eb7;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01e;
              3'h2: pos_word = 16'h3ee9;
              3'h3: pos_word = 16'hbffc;
              3'h4: pos_word = 16'h3f10;
              3'h5: pos_word = 16'hbfcf;
              3'h6: pos_word = 16'h3f2e;
              3'h7: pos_word = 16'hbfad;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf91;
              3'h2: pos_word = 16'h3f75;
              3'h3: pos_word = 16'hbf76;
              3'h4: pos_word = 16'h3f91;
              3'h5: pos_word = 16'hbf4f;
              3'h6: pos_word = 16'h3fad;
              3'h7: pos_word = 16'hbf2e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3fcf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf10;
              3'h2: pos_word = 16'h3ffc;
              3'h3: pos_word = 16'hbee9;
              3'h4: pos_word = 16'h401e;
              3'h5: pos_word = 16'hbeb7;
              3'h6: pos_word = 16'h404e;
              3'h7: pos_word = 16'hbe88;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h98: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h4091;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ef;
              3'h2: pos_word = 16'h41a4;
              3'h3: pos_word = 16'hc1e1;
              3'h4: pos_word = 16'hc105;
              3'h5: pos_word = 16'hc09b;
              3'h6: pos_word = 16'hc058;
              3'h7: pos_word = 16'hc024;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc002;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd5;
              3'h2: pos_word = 16'hbfb1;
              3'h3: pos_word = 16'hbf95;
              3'h4: pos_word = 16'hbf7c;
              3'h5: pos_word = 16'hbf55;
              3'h6: pos_word = 16'hbf33;
              3'h7: pos_word = 16'hbf14;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbef1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebf;
              3'h2: pos_word = 16'hbe8f;
              3'h3: pos_word = 16'hbe43;
              3'h4: pos_word = 16'hbdd5;
              3'h5: pos_word = 16'hbca1;
              3'h6: pos_word = 16'h3d84;
              3'h7: pos_word = 16'h3e1a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e73;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea8;
              3'h2: pos_word = 16'h3ed9;
              3'h3: pos_word = 16'h3f07;
              3'h4: pos_word = 16'h3f24;
              3'h5: pos_word = 16'h3f44;
              3'h6: pos_word = 16'h3f69;
              3'h7: pos_word = 16'h3f8a;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fa4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc3;
              3'h2: pos_word = 16'h3fed;
              3'h3: pos_word = 16'h4013;
              3'h4: pos_word = 16'h403d;
              3'h5: pos_word = 16'h4081;
              3'h6: pos_word = 16'h40c8;
              3'h7: pos_word = 16'h4156;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc2d2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc12a;
              3'h2: pos_word = 16'hc0b2;
              3'h3: pos_word = 16'hc06f;
              3'h4: pos_word = 16'hc031;
              3'h5: pos_word = 16'hc00b;
              3'h6: pos_word = 16'hbfe2;
              3'h7: pos_word = 16'hbfbc;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf9d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf85;
              3'h2: pos_word = 16'hbf60;
              3'h3: pos_word = 16'hbf3d;
              3'h4: pos_word = 16'hbf1d;
              3'h5: pos_word = 16'hbf01;
              3'h6: pos_word = 16'hbece;
              3'h7: pos_word = 16'hbe9d;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe5f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe06;
              3'h2: pos_word = 16'hbd3b;
              3'h3: pos_word = 16'h3d1e;
              3'h4: pos_word = 16'h3dfd;
              3'h5: pos_word = 16'h3e57;
              3'h6: pos_word = 16'h3e99;
              3'h7: pos_word = 16'h3eca;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3efd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1b;
              3'h2: pos_word = 16'h3f3a;
              3'h3: pos_word = 16'h3f5d;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'h3f9b;
              3'h6: pos_word = 16'h3fb9;
              3'h7: pos_word = 16'h3fdf;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4009;
            case (mant_lo3)
              3'h1: pos_word = 16'h402e;
              3'h2: pos_word = 16'h4068;
              3'h3: pos_word = 16'h40ab;
              3'h4: pos_word = 16'h411e;
              3'h5: pos_word = 16'h4273;
              3'h6: pos_word = 16'hc16c;
              3'h7: pos_word = 16'hc0d1;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc085;
            case (mant_lo3)
              3'h1: pos_word = 16'hc041;
              3'h2: pos_word = 16'hc015;
              3'h3: pos_word = 16'hbff1;
              3'h4: pos_word = 16'hbfc6;
              3'h5: pos_word = 16'hbfa6;
              3'h6: pos_word = 16'hbf8c;
              3'h7: pos_word = 16'hbf6c;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf47;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf27;
              3'h2: pos_word = 16'hbf09;
              3'h3: pos_word = 16'hbede;
              3'h4: pos_word = 16'hbeac;
              3'h5: pos_word = 16'hbe7b;
              3'h6: pos_word = 16'hbe21;
              3'h7: pos_word = 16'hbd93;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3c50;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dc7;
              3'h2: pos_word = 16'h3e3c;
              3'h3: pos_word = 16'h3e8b;
              3'h4: pos_word = 16'h3ebb;
              3'h5: pos_word = 16'h3eed;
              3'h6: pos_word = 16'h3f12;
              3'h7: pos_word = 16'h3f30;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f52;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f79;
              3'h2: pos_word = 16'h3f93;
              3'h3: pos_word = 16'h3faf;
              3'h4: pos_word = 16'h3fd2;
              3'h5: pos_word = 16'h4000;
              3'h6: pos_word = 16'h4021;
              3'h7: pos_word = 16'h4053;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4096;
            case (mant_lo3)
              3'h1: pos_word = 16'h40fb;
              3'h2: pos_word = 16'h41bd;
              3'h3: pos_word = 16'hc1bf;
              3'h4: pos_word = 16'hc0fd;
              3'h5: pos_word = 16'hc096;
              3'h6: pos_word = 16'hc053;
              3'h7: pos_word = 16'hc021;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc000;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd2;
              3'h2: pos_word = 16'hbfaf;
              3'h3: pos_word = 16'hbf93;
              3'h4: pos_word = 16'hbf79;
              3'h5: pos_word = 16'hbf52;
              3'h6: pos_word = 16'hbf30;
              3'h7: pos_word = 16'hbf12;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h99: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbeed;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe8b;
              3'h2: pos_word = 16'hbdc8;
              3'h3: pos_word = 16'h3d92;
              3'h4: pos_word = 16'h3e7a;
              3'h5: pos_word = 16'h3edd;
              3'h6: pos_word = 16'h3f26;
              3'h7: pos_word = 16'h3f6c;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fa6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff0;
              3'h2: pos_word = 16'h4041;
              3'h3: pos_word = 16'h40d0;
              3'h4: pos_word = 16'hc27c;
              3'h5: pos_word = 16'hc0ac;
              3'h6: pos_word = 16'hc02e;
              3'h7: pos_word = 16'hbfdf;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf9b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5d;
              3'h2: pos_word = 16'hbf1b;
              3'h3: pos_word = 16'hbeca;
              3'h4: pos_word = 16'hbe58;
              3'h5: pos_word = 16'hbd21;
              3'h6: pos_word = 16'h3e05;
              3'h7: pos_word = 16'h3e9d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f01;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3c;
              3'h2: pos_word = 16'h3f85;
              3'h3: pos_word = 16'h3fbb;
              3'h4: pos_word = 16'h400b;
              3'h5: pos_word = 16'h406e;
              3'h6: pos_word = 16'h4129;
              3'h7: pos_word = 16'hc157;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc081;
            case (mant_lo3)
              3'h1: pos_word = 16'hc013;
              3'h2: pos_word = 16'hbfc4;
              3'h3: pos_word = 16'hbf8a;
              3'h4: pos_word = 16'hbf44;
              3'h5: pos_word = 16'hbf07;
              3'h6: pos_word = 16'hbea8;
              3'h7: pos_word = 16'hbe1a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3c9c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e42;
              3'h2: pos_word = 16'h3ebe;
              3'h3: pos_word = 16'h3f14;
              3'h4: pos_word = 16'h3f54;
              3'h5: pos_word = 16'h3f95;
              3'h6: pos_word = 16'h3fd5;
              3'h7: pos_word = 16'h4024;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h409a;
            case (mant_lo3)
              3'h1: pos_word = 16'h41de;
              3'h2: pos_word = 16'hc0f0;
              3'h3: pos_word = 16'hc04e;
              3'h4: pos_word = 16'hbffc;
              3'h5: pos_word = 16'hbfad;
              3'h6: pos_word = 16'hbf76;
              3'h7: pos_word = 16'hbf2e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbeea;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe88;
              3'h2: pos_word = 16'hbdbb;
              3'h3: pos_word = 16'h3d9f;
              3'h4: pos_word = 16'h3e80;
              3'h5: pos_word = 16'h3ee1;
              3'h6: pos_word = 16'h3f29;
              3'h7: pos_word = 16'h3f6f;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3fa8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff4;
              3'h2: pos_word = 16'h4045;
              3'h3: pos_word = 16'h40d9;
              3'h4: pos_word = 16'hc234;
              3'h5: pos_word = 16'hc0a6;
              3'h6: pos_word = 16'hc02b;
              3'h7: pos_word = 16'hbfdc;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf99;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5a;
              3'h2: pos_word = 16'hbf19;
              3'h3: pos_word = 16'hbec6;
              3'h4: pos_word = 16'hbe51;
              3'h5: pos_word = 16'hbd07;
              3'h6: pos_word = 16'h3e0c;
              3'h7: pos_word = 16'h3ea1;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f03;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3f;
              3'h2: pos_word = 16'h3f86;
              3'h3: pos_word = 16'h3fbe;
              3'h4: pos_word = 16'h400e;
              3'h5: pos_word = 16'h4074;
              3'h6: pos_word = 16'h4135;
              3'h7: pos_word = 16'hc146;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc07c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc010;
              3'h2: pos_word = 16'hbfc1;
              3'h3: pos_word = 16'hbf88;
              3'h4: pos_word = 16'hbf42;
              3'h5: pos_word = 16'hbf05;
              3'h6: pos_word = 16'hbea5;
              3'h7: pos_word = 16'hbe13;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3cd0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e49;
              3'h2: pos_word = 16'h3ec2;
              3'h3: pos_word = 16'h3f16;
              3'h4: pos_word = 16'h3f57;
              3'h5: pos_word = 16'h3f97;
              3'h6: pos_word = 16'h3fd8;
              3'h7: pos_word = 16'h4027;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h409f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4207;
              3'h2: pos_word = 16'hc0e5;
              3'h3: pos_word = 16'hc04a;
              3'h4: pos_word = 16'hbff9;
              3'h5: pos_word = 16'hbfaa;
              3'h6: pos_word = 16'hbf73;
              3'h7: pos_word = 16'hbf2b;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbee6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe84;
              3'h2: pos_word = 16'hbdae;
              3'h3: pos_word = 16'h3dac;
              3'h4: pos_word = 16'h3e84;
              3'h5: pos_word = 16'h3ee5;
              3'h6: pos_word = 16'h3f2b;
              3'h7: pos_word = 16'h3f72;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3faa;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff8;
              3'h2: pos_word = 16'h4049;
              3'h3: pos_word = 16'h40e3;
              3'h4: pos_word = 16'hc20c;
              3'h5: pos_word = 16'hc0a0;
              3'h6: pos_word = 16'hc027;
              3'h7: pos_word = 16'hbfd9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9a: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf97;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf17;
              3'h2: pos_word = 16'hbe4a;
              3'h3: pos_word = 16'h3e12;
              3'h4: pos_word = 16'h3f05;
              3'h5: pos_word = 16'h3f88;
              3'h6: pos_word = 16'h4010;
              3'h7: pos_word = 16'h4144;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc075;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbe;
              3'h2: pos_word = 16'hbf3f;
              3'h3: pos_word = 16'hbea1;
              3'h4: pos_word = 16'h3d02;
              3'h5: pos_word = 16'h3ec6;
              3'h6: pos_word = 16'h3f5a;
              3'h7: pos_word = 16'h3fdb;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h40a5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0db;
              3'h2: pos_word = 16'hbff5;
              3'h3: pos_word = 16'hbf6f;
              3'h4: pos_word = 16'hbee2;
              3'h5: pos_word = 16'hbda1;
              3'h6: pos_word = 16'h3e87;
              3'h7: pos_word = 16'h3f2d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fac;
            case (mant_lo3)
              3'h1: pos_word = 16'h404e;
              3'h2: pos_word = 16'hc1e5;
              3'h3: pos_word = 16'hc024;
              3'h4: pos_word = 16'hbf95;
              3'h5: pos_word = 16'hbf14;
              3'h6: pos_word = 16'hbe43;
              3'h7: pos_word = 16'h3e19;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f07;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8a;
              3'h2: pos_word = 16'h4012;
              3'h3: pos_word = 16'h4154;
              3'h4: pos_word = 16'hc06f;
              3'h5: pos_word = 16'hbfbc;
              3'h6: pos_word = 16'hbf3d;
              3'h7: pos_word = 16'hbe9e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3d1c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec9;
              3'h2: pos_word = 16'h3f5d;
              3'h3: pos_word = 16'h3fde;
              3'h4: pos_word = 16'h40ab;
              3'h5: pos_word = 16'hc0d2;
              3'h6: pos_word = 16'hbff1;
              3'h7: pos_word = 16'hbf6c;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbede;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd94;
              3'h2: pos_word = 16'h3e8b;
              3'h3: pos_word = 16'h3f30;
              3'h4: pos_word = 16'h3faf;
              3'h5: pos_word = 16'h4052;
              3'h6: pos_word = 16'hc1c2;
              3'h7: pos_word = 16'hc021;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf93;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf12;
              3'h2: pos_word = 16'hbe3d;
              3'h3: pos_word = 16'h3e20;
              3'h4: pos_word = 16'h3f09;
              3'h5: pos_word = 16'h3f8b;
              3'h6: pos_word = 16'h4015;
              3'h7: pos_word = 16'h4168;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc069;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb9;
              3'h2: pos_word = 16'hbf3a;
              3'h3: pos_word = 16'hbe9a;
              3'h4: pos_word = 16'h3d36;
              3'h5: pos_word = 16'h3ecd;
              3'h6: pos_word = 16'h3f60;
              3'h7: pos_word = 16'h3fe2;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h40b1;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c9;
              3'h2: pos_word = 16'hbfed;
              3'h3: pos_word = 16'hbf69;
              3'h4: pos_word = 16'hbeda;
              3'h5: pos_word = 16'hbd87;
              3'h6: pos_word = 16'h3e8e;
              3'h7: pos_word = 16'h3f32;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3fb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h4057;
              3'h2: pos_word = 16'hc1a8;
              3'h3: pos_word = 16'hc01e;
              3'h4: pos_word = 16'hbf92;
              3'h5: pos_word = 16'hbf10;
              3'h6: pos_word = 16'hbe36;
              3'h7: pos_word = 16'h3e26;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f0b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8d;
              3'h2: pos_word = 16'h4018;
              3'h3: pos_word = 16'h4180;
              3'h4: pos_word = 16'hc063;
              3'h5: pos_word = 16'hbfb7;
              3'h6: pos_word = 16'hbf38;
              3'h7: pos_word = 16'hbe97;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3d50;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed1;
              3'h2: pos_word = 16'h3f63;
              3'h3: pos_word = 16'h3fe5;
              3'h4: pos_word = 16'h40b7;
              3'h5: pos_word = 16'hc0c1;
              3'h6: pos_word = 16'hbfea;
              3'h7: pos_word = 16'hbf66;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbed6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd73;
              3'h2: pos_word = 16'h3e92;
              3'h3: pos_word = 16'h3f35;
              3'h4: pos_word = 16'h3fb3;
              3'h5: pos_word = 16'h405c;
              3'h6: pos_word = 16'hc194;
              3'h7: pos_word = 16'hc01b;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf90;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0e;
              3'h2: pos_word = 16'hbe2f;
              3'h3: pos_word = 16'h3e2d;
              3'h4: pos_word = 16'h3f0d;
              3'h5: pos_word = 16'h3f8f;
              3'h6: pos_word = 16'h401a;
              3'h7: pos_word = 16'h418e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc05e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb4;
              3'h2: pos_word = 16'hbf35;
              3'h3: pos_word = 16'hbe93;
              3'h4: pos_word = 16'h3d6a;
              3'h5: pos_word = 16'h3ed5;
              3'h6: pos_word = 16'h3f65;
              3'h7: pos_word = 16'h3fe9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9b: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h40bf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe6;
              3'h2: pos_word = 16'hbed2;
              3'h3: pos_word = 16'h3e95;
              3'h4: pos_word = 16'h3fb6;
              3'h5: pos_word = 16'hc184;
              3'h6: pos_word = 16'hbf8e;
              3'h7: pos_word = 16'hbe29;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f0f;
            case (mant_lo3)
              3'h1: pos_word = 16'h401d;
              3'h2: pos_word = 16'hc059;
              3'h3: pos_word = 16'hbf33;
              3'h4: pos_word = 16'h3d82;
              3'h5: pos_word = 16'h3f68;
              3'h6: pos_word = 16'h40c6;
              3'h7: pos_word = 16'hbfe3;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbecf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e99;
              3'h2: pos_word = 16'h3fb8;
              3'h3: pos_word = 16'hc170;
              3'h4: pos_word = 16'hbf8c;
              3'h5: pos_word = 16'hbe22;
              3'h6: pos_word = 16'h3f12;
              3'h7: pos_word = 16'h4020;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc054;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf31;
              3'h2: pos_word = 16'h3d8f;
              3'h3: pos_word = 16'h3f6b;
              3'h4: pos_word = 16'h40cf;
              3'h5: pos_word = 16'hbfe0;
              3'h6: pos_word = 16'hbecb;
              3'h7: pos_word = 16'h3e9c;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fbb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc15b;
              3'h2: pos_word = 16'hbf8a;
              3'h3: pos_word = 16'hbe1b;
              3'h4: pos_word = 16'h3f14;
              3'h5: pos_word = 16'h4023;
              3'h6: pos_word = 16'hc04f;
              3'h7: pos_word = 16'hbf2e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3d9c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6e;
              3'h2: pos_word = 16'h40d8;
              3'h3: pos_word = 16'hbfdc;
              3'h4: pos_word = 16'hbec7;
              3'h5: pos_word = 16'h3ea0;
              3'h6: pos_word = 16'h3fbd;
              3'h7: pos_word = 16'hc149;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf89;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe15;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h4026;
              3'h4: pos_word = 16'hc04b;
              3'h5: pos_word = 16'hbf2c;
              3'h6: pos_word = 16'h3da9;
              3'h7: pos_word = 16'h3f71;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h40e2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd9;
              3'h2: pos_word = 16'hbec3;
              3'h3: pos_word = 16'h3ea4;
              3'h4: pos_word = 16'h3fc0;
              3'h5: pos_word = 16'hc13a;
              3'h6: pos_word = 16'hbf87;
              3'h7: pos_word = 16'hbe0e;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f18;
            case (mant_lo3)
              3'h1: pos_word = 16'h4029;
              3'h2: pos_word = 16'hc046;
              3'h3: pos_word = 16'hbf29;
              3'h4: pos_word = 16'h3db7;
              3'h5: pos_word = 16'h3f75;
              3'h6: pos_word = 16'h40ec;
              3'h7: pos_word = 16'hbfd6;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbec0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea7;
              3'h2: pos_word = 16'h3fc3;
              3'h3: pos_word = 16'hc12d;
              3'h4: pos_word = 16'hbf85;
              3'h5: pos_word = 16'hbe07;
              3'h6: pos_word = 16'h3f1a;
              3'h7: pos_word = 16'h402d;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc042;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf27;
              3'h2: pos_word = 16'h3dc4;
              3'h3: pos_word = 16'h3f78;
              3'h4: pos_word = 16'h40f8;
              3'h5: pos_word = 16'hbfd3;
              3'h6: pos_word = 16'hbebc;
              3'h7: pos_word = 16'h3eab;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fc5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc122;
              3'h2: pos_word = 16'hbf83;
              3'h3: pos_word = 16'hbe01;
              3'h4: pos_word = 16'h3f1c;
              3'h5: pos_word = 16'h4030;
              3'h6: pos_word = 16'hc03e;
              3'h7: pos_word = 16'hbf25;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3dd1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7b;
              3'h2: pos_word = 16'h4103;
              3'h3: pos_word = 16'hbfd0;
              3'h4: pos_word = 16'hbeb8;
              3'h5: pos_word = 16'h3eae;
              3'h6: pos_word = 16'h3fc8;
              3'h7: pos_word = 16'hc118;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf82;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdf4;
              3'h2: pos_word = 16'h3f1f;
              3'h3: pos_word = 16'h4034;
              3'h4: pos_word = 16'hc03a;
              3'h5: pos_word = 16'hbf23;
              3'h6: pos_word = 16'h3dde;
              3'h7: pos_word = 16'h3f7e;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h410a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfcd;
              3'h2: pos_word = 16'hbeb5;
              3'h3: pos_word = 16'h3eb2;
              3'h4: pos_word = 16'h3fcb;
              3'h5: pos_word = 16'hc10f;
              3'h6: pos_word = 16'hbf80;
              3'h7: pos_word = 16'hbde7;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f21;
            case (mant_lo3)
              3'h1: pos_word = 16'h4037;
              3'h2: pos_word = 16'hc036;
              3'h3: pos_word = 16'hbf20;
              3'h4: pos_word = 16'h3deb;
              3'h5: pos_word = 16'h3f81;
              3'h6: pos_word = 16'h4112;
              3'h7: pos_word = 16'hbfca;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9c: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbeb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fce;
              3'h2: pos_word = 16'hbf7d;
              3'h3: pos_word = 16'h3f23;
              3'h4: pos_word = 16'hc033;
              3'h5: pos_word = 16'h3df8;
              3'h6: pos_word = 16'h411b;
              3'h7: pos_word = 16'hbead;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fd1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf7a;
              3'h2: pos_word = 16'h3f26;
              3'h3: pos_word = 16'hc02f;
              3'h4: pos_word = 16'h3e03;
              3'h5: pos_word = 16'h4125;
              3'h6: pos_word = 16'hbeaa;
              3'h7: pos_word = 16'h3fd4;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf77;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f28;
              3'h2: pos_word = 16'hc02c;
              3'h3: pos_word = 16'h3e09;
              3'h4: pos_word = 16'h4131;
              3'h5: pos_word = 16'hbea6;
              3'h6: pos_word = 16'h3fd7;
              3'h7: pos_word = 16'hbf74;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f2a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc028;
              3'h2: pos_word = 16'h3e10;
              3'h3: pos_word = 16'h413f;
              3'h4: pos_word = 16'hbea2;
              3'h5: pos_word = 16'h3fda;
              3'h6: pos_word = 16'hbf71;
              3'h7: pos_word = 16'h3f2d;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc025;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e17;
              3'h2: pos_word = 16'h414e;
              3'h3: pos_word = 16'hbe9f;
              3'h4: pos_word = 16'h3fdd;
              3'h5: pos_word = 16'hbf6d;
              3'h6: pos_word = 16'h3f2f;
              3'h7: pos_word = 16'hc022;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3e1d;
            case (mant_lo3)
              3'h1: pos_word = 16'h4161;
              3'h2: pos_word = 16'hbe9b;
              3'h3: pos_word = 16'h3fe1;
              3'h4: pos_word = 16'hbf6a;
              3'h5: pos_word = 16'h3f31;
              3'h6: pos_word = 16'hc01f;
              3'h7: pos_word = 16'h3e24;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4177;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe98;
              3'h2: pos_word = 16'h3fe4;
              3'h3: pos_word = 16'hbf68;
              3'h4: pos_word = 16'h3f34;
              3'h5: pos_word = 16'hc01c;
              3'h6: pos_word = 16'h3e2b;
              3'h7: pos_word = 16'h4189;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe94;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe7;
              3'h2: pos_word = 16'hbf65;
              3'h3: pos_word = 16'h3f36;
              3'h4: pos_word = 16'hc01a;
              3'h5: pos_word = 16'h3e31;
              3'h6: pos_word = 16'h419a;
              3'h7: pos_word = 16'hbe91;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3feb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf62;
              3'h2: pos_word = 16'h3f39;
              3'h3: pos_word = 16'hc017;
              3'h4: pos_word = 16'h3e38;
              3'h5: pos_word = 16'h41af;
              3'h6: pos_word = 16'hbe8d;
              3'h7: pos_word = 16'h3fee;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf5f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3b;
              3'h2: pos_word = 16'hc014;
              3'h3: pos_word = 16'h3e3f;
              3'h4: pos_word = 16'h41cb;
              3'h5: pos_word = 16'hbe8a;
              3'h6: pos_word = 16'h3ff2;
              3'h7: pos_word = 16'hbf5c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f3e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc012;
              3'h2: pos_word = 16'h3e45;
              3'h3: pos_word = 16'h41f3;
              3'h4: pos_word = 16'hbe86;
              3'h5: pos_word = 16'h3ff6;
              3'h6: pos_word = 16'hbf59;
              3'h7: pos_word = 16'h3f40;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc00f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e4c;
              3'h2: pos_word = 16'h4216;
              3'h3: pos_word = 16'hbe83;
              3'h4: pos_word = 16'h3ffa;
              3'h5: pos_word = 16'hbf56;
              3'h6: pos_word = 16'h3f43;
              3'h7: pos_word = 16'hc00d;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e53;
            case (mant_lo3)
              3'h1: pos_word = 16'h4245;
              3'h2: pos_word = 16'hbe7f;
              3'h3: pos_word = 16'h3ffe;
              3'h4: pos_word = 16'hbf54;
              3'h5: pos_word = 16'h3f45;
              3'h6: pos_word = 16'hc00a;
              3'h7: pos_word = 16'h3e5a;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4290;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe78;
              3'h2: pos_word = 16'h4001;
              3'h3: pos_word = 16'hbf51;
              3'h4: pos_word = 16'h3f48;
              3'h5: pos_word = 16'hc008;
              3'h6: pos_word = 16'h3e61;
              3'h7: pos_word = 16'h4304;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe71;
            case (mant_lo3)
              3'h1: pos_word = 16'h4003;
              3'h2: pos_word = 16'hbf4e;
              3'h3: pos_word = 16'h3f4b;
              3'h4: pos_word = 16'hc006;
              3'h5: pos_word = 16'h3e67;
              3'h6: pos_word = 16'h444e;
              3'h7: pos_word = 16'hbe6a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4005;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4c;
              3'h2: pos_word = 16'h3f4d;
              3'h3: pos_word = 16'hc004;
              3'h4: pos_word = 16'h3e6e;
              3'h5: pos_word = 16'hc343;
              3'h6: pos_word = 16'hbe63;
              3'h7: pos_word = 16'h4007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9d: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf49;
            case (mant_lo3)
              3'h1: pos_word = 16'hc002;
              3'h2: pos_word = 16'hc2ae;
              3'h3: pos_word = 16'h400a;
              3'h4: pos_word = 16'h3f53;
              3'h5: pos_word = 16'h3e7c;
              3'h6: pos_word = 16'hbe56;
              3'h7: pos_word = 16'hbf44;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbffb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc225;
              3'h2: pos_word = 16'h400e;
              3'h3: pos_word = 16'h3f58;
              3'h4: pos_word = 16'h3e85;
              3'h5: pos_word = 16'hbe48;
              3'h6: pos_word = 16'hbf3f;
              3'h7: pos_word = 16'hbff4;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc1d9;
            case (mant_lo3)
              3'h1: pos_word = 16'h4013;
              3'h2: pos_word = 16'h3f5e;
              3'h3: pos_word = 16'h3e8c;
              3'h4: pos_word = 16'hbe3b;
              3'h5: pos_word = 16'hbf3a;
              3'h6: pos_word = 16'hbfec;
              3'h7: pos_word = 16'hc1a1;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4018;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f63;
              3'h2: pos_word = 16'h3e93;
              3'h3: pos_word = 16'hbe2d;
              3'h4: pos_word = 16'hbf35;
              3'h5: pos_word = 16'hbfe5;
              3'h6: pos_word = 16'hc180;
              3'h7: pos_word = 16'h401e;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f69;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e9a;
              3'h2: pos_word = 16'hbe20;
              3'h3: pos_word = 16'hbf30;
              3'h4: pos_word = 16'hbfdf;
              3'h5: pos_word = 16'hc155;
              3'h6: pos_word = 16'h4024;
              3'h7: pos_word = 16'h3f6f;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3ea1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe13;
              3'h2: pos_word = 16'hbf2b;
              3'h3: pos_word = 16'hbfd8;
              3'h4: pos_word = 16'hc136;
              3'h5: pos_word = 16'h402a;
              3'h6: pos_word = 16'h3f76;
              3'h7: pos_word = 16'h3ea8;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe05;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf26;
              3'h2: pos_word = 16'hbfd2;
              3'h3: pos_word = 16'hc11f;
              3'h4: pos_word = 16'h4031;
              3'h5: pos_word = 16'h3f7c;
              3'h6: pos_word = 16'h3eb0;
              3'h7: pos_word = 16'hbdf0;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfcc;
              3'h2: pos_word = 16'hc10d;
              3'h3: pos_word = 16'h4039;
              3'h4: pos_word = 16'h3f81;
              3'h5: pos_word = 16'h3eb7;
              3'h6: pos_word = 16'hbdd6;
              3'h7: pos_word = 16'hbf1d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfc6;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0fd;
              3'h2: pos_word = 16'h4040;
              3'h3: pos_word = 16'h3f84;
              3'h4: pos_word = 16'h3ebe;
              3'h5: pos_word = 16'hbdbc;
              3'h6: pos_word = 16'hbf19;
              3'h7: pos_word = 16'hbfc1;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc0e6;
            case (mant_lo3)
              3'h1: pos_word = 16'h4049;
              3'h2: pos_word = 16'h3f88;
              3'h3: pos_word = 16'h3ec6;
              3'h4: pos_word = 16'hbda1;
              3'h5: pos_word = 16'hbf14;
              3'h6: pos_word = 16'hbfbc;
              3'h7: pos_word = 16'hc0d2;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4052;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8b;
              3'h2: pos_word = 16'h3ecd;
              3'h3: pos_word = 16'hbd87;
              3'h4: pos_word = 16'hbf10;
              3'h5: pos_word = 16'hbfb7;
              3'h6: pos_word = 16'hc0c1;
              3'h7: pos_word = 16'h405c;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f8f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed5;
              3'h2: pos_word = 16'hbd5a;
              3'h3: pos_word = 16'hbf0c;
              3'h4: pos_word = 16'hbfb2;
              3'h5: pos_word = 16'hc0b3;
              3'h6: pos_word = 16'h4067;
              3'h7: pos_word = 16'h3f93;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3edc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd26;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'hbfad;
              3'h4: pos_word = 16'hc0a7;
              3'h5: pos_word = 16'h4073;
              3'h6: pos_word = 16'h3f97;
              3'h7: pos_word = 16'h3ee4;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbce4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf04;
              3'h2: pos_word = 16'hbfa9;
              3'h3: pos_word = 16'hc09c;
              3'h4: pos_word = 16'h4080;
              3'h5: pos_word = 16'h3f9a;
              3'h6: pos_word = 16'h3eec;
              3'h7: pos_word = 16'hbc78;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbeff;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa4;
              3'h2: pos_word = 16'hc093;
              3'h3: pos_word = 16'h4087;
              3'h4: pos_word = 16'h3f9f;
              3'h5: pos_word = 16'h3ef4;
              3'h6: pos_word = 16'hbb1f;
              3'h7: pos_word = 16'hbef7;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfa0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc08a;
              3'h2: pos_word = 16'h408f;
              3'h3: pos_word = 16'h3fa3;
              3'h4: pos_word = 16'h3efc;
              3'h5: pos_word = 16'h3c28;
              3'h6: pos_word = 16'hbeef;
              3'h7: pos_word = 16'hbf9c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9e: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc083;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa7;
              3'h2: pos_word = 16'h3cbc;
              3'h3: pos_word = 16'hbf98;
              3'h4: pos_word = 16'h40a3;
              3'h5: pos_word = 16'h3f06;
              3'h6: pos_word = 16'hbedf;
              3'h7: pos_word = 16'hc06b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fb0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d46;
              3'h2: pos_word = 16'hbf90;
              3'h3: pos_word = 16'h40bc;
              3'h4: pos_word = 16'h3f0f;
              3'h5: pos_word = 16'hbed0;
              3'h6: pos_word = 16'hc056;
              3'h7: pos_word = 16'h3fba;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3d97;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf89;
              3'h2: pos_word = 16'h40de;
              3'h3: pos_word = 16'h3f17;
              3'h4: pos_word = 16'hbec1;
              3'h5: pos_word = 16'hc044;
              3'h6: pos_word = 16'h3fc4;
              3'h7: pos_word = 16'h3dcc;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf82;
            case (mant_lo3)
              3'h1: pos_word = 16'h4107;
              3'h2: pos_word = 16'h3f20;
              3'h3: pos_word = 16'hbeb2;
              3'h4: pos_word = 16'hc034;
              3'h5: pos_word = 16'h3fd0;
              3'h6: pos_word = 16'h3e00;
              3'h7: pos_word = 16'hbf78;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h412c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f29;
              3'h2: pos_word = 16'hbea4;
              3'h3: pos_word = 16'hc026;
              3'h4: pos_word = 16'h3fdc;
              3'h5: pos_word = 16'h3e1b;
              3'h6: pos_word = 16'hbf6c;
              3'h7: pos_word = 16'h416e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f33;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe96;
              3'h2: pos_word = 16'hc01b;
              3'h3: pos_word = 16'h3fea;
              3'h4: pos_word = 16'h3e35;
              3'h5: pos_word = 16'hbf60;
              3'h6: pos_word = 16'h41c0;
              3'h7: pos_word = 16'h3f3d;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe88;
            case (mant_lo3)
              3'h1: pos_word = 16'hc010;
              3'h2: pos_word = 16'h3ff8;
              3'h3: pos_word = 16'h3e50;
              3'h4: pos_word = 16'hbf55;
              3'h5: pos_word = 16'h4275;
              3'h6: pos_word = 16'h3f47;
              3'h7: pos_word = 16'hbe74;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc007;
            case (mant_lo3)
              3'h1: pos_word = 16'h4004;
              3'h2: pos_word = 16'h3e6c;
              3'h3: pos_word = 16'hbf4a;
              3'h4: pos_word = 16'hc2dd;
              3'h5: pos_word = 16'h3f52;
              3'h6: pos_word = 16'hbe58;
              3'h7: pos_word = 16'hbffd;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h400d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e84;
              3'h2: pos_word = 16'hbf40;
              3'h3: pos_word = 16'hc1e8;
              3'h4: pos_word = 16'h3f5d;
              3'h5: pos_word = 16'hbe3d;
              3'h6: pos_word = 16'hbfee;
              3'h7: pos_word = 16'h4017;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3e92;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf36;
              3'h2: pos_word = 16'hc185;
              3'h3: pos_word = 16'h3f68;
              3'h4: pos_word = 16'hbe22;
              3'h5: pos_word = 16'hbfe0;
              3'h6: pos_word = 16'h4023;
              3'h7: pos_word = 16'h3ea0;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc13b;
              3'h2: pos_word = 16'h3f74;
              3'h3: pos_word = 16'hbe08;
              3'h4: pos_word = 16'hbfd3;
              3'h5: pos_word = 16'h4030;
              3'h6: pos_word = 16'h3eae;
              3'h7: pos_word = 16'hbf23;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc110;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f81;
              3'h2: pos_word = 16'hbddb;
              3'h3: pos_word = 16'hbfc8;
              3'h4: pos_word = 16'h403f;
              3'h5: pos_word = 16'h3ebd;
              3'h6: pos_word = 16'hbf1a;
              3'h7: pos_word = 16'hc0ea;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f87;
            case (mant_lo3)
              3'h1: pos_word = 16'hbda6;
              3'h2: pos_word = 16'hbfbd;
              3'h3: pos_word = 16'h4050;
              3'h4: pos_word = 16'h3ecc;
              3'h5: pos_word = 16'hbf11;
              3'h6: pos_word = 16'hc0c4;
              3'h7: pos_word = 16'h3f8e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbd64;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb3;
              3'h2: pos_word = 16'h4065;
              3'h3: pos_word = 16'h3edb;
              3'h4: pos_word = 16'hbf09;
              3'h5: pos_word = 16'hc0a9;
              3'h6: pos_word = 16'h3f96;
              3'h7: pos_word = 16'hbcf8;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfaa;
            case (mant_lo3)
              3'h1: pos_word = 16'h407d;
              3'h2: pos_word = 16'h3eea;
              3'h3: pos_word = 16'hbf00;
              3'h4: pos_word = 16'hc094;
              3'h5: pos_word = 16'h3f9e;
              3'h6: pos_word = 16'hbb9f;
              3'h7: pos_word = 16'hbfa1;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h408e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efa;
              3'h2: pos_word = 16'hbef1;
              3'h3: pos_word = 16'hc084;
              3'h4: pos_word = 16'h3fa6;
              3'h5: pos_word = 16'h3ca8;
              3'h6: pos_word = 16'hbf99;
              3'h7: pos_word = 16'h40a1;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9f: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f05;
            case (mant_lo3)
              3'h1: pos_word = 16'hc06e;
              3'h2: pos_word = 16'h3d3c;
              3'h3: pos_word = 16'h40b9;
              3'h4: pos_word = 16'hbed1;
              3'h5: pos_word = 16'h3fb9;
              3'h6: pos_word = 16'hbf8a;
              3'h7: pos_word = 16'h3f16;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc045;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dc7;
              3'h2: pos_word = 16'h4104;
              3'h3: pos_word = 16'hbeb4;
              3'h4: pos_word = 16'h3fcf;
              3'h5: pos_word = 16'hbf79;
              3'h6: pos_word = 16'h3f28;
              3'h7: pos_word = 16'hc028;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e18;
            case (mant_lo3)
              3'h1: pos_word = 16'h4166;
              3'h2: pos_word = 16'hbe97;
              3'h3: pos_word = 16'h3fe8;
              3'h4: pos_word = 16'hbf61;
              3'h5: pos_word = 16'h3f3c;
              3'h6: pos_word = 16'hc011;
              3'h7: pos_word = 16'h3e4e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4255;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe76;
              3'h2: pos_word = 16'h4003;
              3'h3: pos_word = 16'hbf4b;
              3'h4: pos_word = 16'h3f50;
              3'h5: pos_word = 16'hbffe;
              3'h6: pos_word = 16'h3e82;
              3'h7: pos_word = 16'hc1fa;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbe40;
            case (mant_lo3)
              3'h1: pos_word = 16'h4016;
              3'h2: pos_word = 16'hbf37;
              3'h3: pos_word = 16'h3f67;
              3'h4: pos_word = 16'hbfe1;
              3'h5: pos_word = 16'h3e9e;
              3'h6: pos_word = 16'hc141;
              3'h7: pos_word = 16'hbe0a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h402f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf24;
              3'h2: pos_word = 16'h3f80;
              3'h3: pos_word = 16'hbfc9;
              3'h4: pos_word = 16'h3ebb;
              3'h5: pos_word = 16'hc0ee;
              3'h6: pos_word = 16'hbdab;
              3'h7: pos_word = 16'h404e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf12;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8e;
              3'h2: pos_word = 16'hbfb4;
              3'h3: pos_word = 16'h3ed9;
              3'h4: pos_word = 16'hc0ac;
              3'h5: pos_word = 16'hbd06;
              3'h6: pos_word = 16'h407b;
              3'h7: pos_word = 16'hbf01;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f9d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa2;
              3'h2: pos_word = 16'h3ef9;
              3'h3: pos_word = 16'hc086;
              3'h4: pos_word = 16'h3c94;
              3'h5: pos_word = 16'h409f;
              3'h6: pos_word = 16'hbee2;
              3'h7: pos_word = 16'h3fae;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0d;
              3'h2: pos_word = 16'hc05a;
              3'h3: pos_word = 16'h3d8d;
              3'h4: pos_word = 16'h40d6;
              3'h5: pos_word = 16'hbec4;
              3'h6: pos_word = 16'h3fc2;
              3'h7: pos_word = 16'hbf84;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f1e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc037;
              3'h2: pos_word = 16'h3df6;
              3'h3: pos_word = 16'h4124;
              3'h4: pos_word = 16'hbea7;
              3'h5: pos_word = 16'h3fda;
              3'h6: pos_word = 16'hbf6e;
              3'h7: pos_word = 16'h3f31;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc01d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e30;
              3'h2: pos_word = 16'h41ac;
              3'h3: pos_word = 16'hbe8a;
              3'h4: pos_word = 16'h3ff5;
              3'h5: pos_word = 16'hbf57;
              3'h6: pos_word = 16'h3f45;
              3'h7: pos_word = 16'hc008;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e66;
            case (mant_lo3)
              3'h1: pos_word = 16'hc36e;
              3'h2: pos_word = 16'hbe5d;
              3'h3: pos_word = 16'h400c;
              3'h4: pos_word = 16'hbf41;
              3'h5: pos_word = 16'h3f5a;
              3'h6: pos_word = 16'hbff0;
              3'h7: pos_word = 16'h3e8f;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc191;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe27;
              3'h2: pos_word = 16'h4021;
              3'h3: pos_word = 16'hbf2e;
              3'h4: pos_word = 16'h3f72;
              3'h5: pos_word = 16'hbfd5;
              3'h6: pos_word = 16'h3eab;
              3'h7: pos_word = 16'hc117;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbde5;
            case (mant_lo3)
              3'h1: pos_word = 16'h403c;
              3'h2: pos_word = 16'hbf1b;
              3'h3: pos_word = 16'h3f86;
              3'h4: pos_word = 16'hbfbf;
              3'h5: pos_word = 16'h3ec9;
              3'h6: pos_word = 16'hc0cb;
              3'h7: pos_word = 16'hbd78;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4061;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0a;
              3'h2: pos_word = 16'h3f94;
              3'h3: pos_word = 16'hbfab;
              3'h4: pos_word = 16'h3ee7;
              3'h5: pos_word = 16'hc098;
              3'h6: pos_word = 16'hbc1f;
              3'h7: pos_word = 16'h408b;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbef4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa5;
              3'h2: pos_word = 16'hbf9a;
              3'h3: pos_word = 16'h3f04;
              3'h4: pos_word = 16'hc072;
              3'h5: pos_word = 16'h3d28;
              3'h6: pos_word = 16'h40b4;
              3'h7: pos_word = 16'hbed4;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha0: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fb7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f15;
              3'h2: pos_word = 16'h3dbd;
              3'h3: pos_word = 16'hbeb6;
              3'h4: pos_word = 16'hbf7c;
              3'h5: pos_word = 16'hc02a;
              3'h6: pos_word = 16'h4157;
              3'h7: pos_word = 16'h3fe6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f3a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e49;
              3'h2: pos_word = 16'hbe7b;
              3'h3: pos_word = 16'hbf4d;
              3'h4: pos_word = 16'hc001;
              3'h5: pos_word = 16'hc213;
              3'h6: pos_word = 16'h4014;
              3'h7: pos_word = 16'h3f65;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e9c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe0f;
              3'h2: pos_word = 16'hbf25;
              3'h3: pos_word = 16'hbfcb;
              3'h4: pos_word = 16'hc0f7;
              3'h5: pos_word = 16'h404b;
              3'h6: pos_word = 16'h3f8c;
              3'h7: pos_word = 16'h3ed7;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbd1a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf03;
              3'h2: pos_word = 16'hbfa3;
              3'h3: pos_word = 16'hc088;
              3'h4: pos_word = 16'h409b;
              3'h5: pos_word = 16'h3fad;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h3d83;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbec7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf85;
              3'h2: pos_word = 16'hc03a;
              3'h3: pos_word = 16'h411c;
              3'h4: pos_word = 16'h3fd7;
              3'h5: pos_word = 16'h3f2f;
              3'h6: pos_word = 16'h3e2b;
              3'h7: pos_word = 16'hbe8d;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf59;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00a;
              3'h2: pos_word = 16'h44c0;
              3'h3: pos_word = 16'h400a;
              3'h4: pos_word = 16'h3f58;
              3'h5: pos_word = 16'h3e8c;
              3'h6: pos_word = 16'hbe2d;
              3'h7: pos_word = 16'hbf30;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfd8;
            case (mant_lo3)
              3'h1: pos_word = 16'hc11e;
              3'h2: pos_word = 16'h4039;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'h3ec6;
              3'h5: pos_word = 16'hbd86;
              3'h6: pos_word = 16'hbf0c;
              3'h7: pos_word = 16'hbfad;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc09c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4088;
              3'h2: pos_word = 16'h3fa3;
              3'h3: pos_word = 16'h3f02;
              3'h4: pos_word = 16'h3d15;
              3'h5: pos_word = 16'hbed7;
              3'h6: pos_word = 16'hbf8d;
              3'h7: pos_word = 16'hc04c;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h40f5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fca;
              3'h2: pos_word = 16'h3f25;
              3'h3: pos_word = 16'h3e0e;
              3'h4: pos_word = 16'hbe9c;
              3'h5: pos_word = 16'hbf65;
              3'h6: pos_word = 16'hc015;
              3'h7: pos_word = 16'h420c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4000;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4c;
              3'h2: pos_word = 16'h3e7a;
              3'h3: pos_word = 16'hbe4a;
              3'h4: pos_word = 16'hbf3a;
              3'h5: pos_word = 16'hbfe6;
              3'h6: pos_word = 16'hc15a;
              3'h7: pos_word = 16'h4029;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f7b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb6;
              3'h2: pos_word = 16'hbdbf;
              3'h3: pos_word = 16'hbf15;
              3'h4: pos_word = 16'hbfb8;
              3'h5: pos_word = 16'hc0b5;
              3'h6: pos_word = 16'h4071;
              3'h7: pos_word = 16'h3f9a;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ef3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3c0a;
              3'h2: pos_word = 16'hbee8;
              3'h3: pos_word = 16'hbf95;
              3'h4: pos_word = 16'hc062;
              3'h5: pos_word = 16'h40c9;
              3'h6: pos_word = 16'h3fbe;
              3'h7: pos_word = 16'h3f1b;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3de2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeac;
              3'h2: pos_word = 16'hbf73;
              3'h3: pos_word = 16'hc021;
              3'h4: pos_word = 16'h418e;
              3'h5: pos_word = 16'h3ff0;
              3'h6: pos_word = 16'h3f41;
              3'h7: pos_word = 16'h3e5c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe68;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf45;
              3'h2: pos_word = 16'hbff6;
              3'h3: pos_word = 16'hc1b0;
              3'h4: pos_word = 16'h401c;
              3'h5: pos_word = 16'h3f6d;
              3'h6: pos_word = 16'h3ea6;
              3'h7: pos_word = 16'hbdf9;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf1f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc3;
              3'h2: pos_word = 16'hc0d8;
              3'h3: pos_word = 16'h4059;
              3'h4: pos_word = 16'h3f91;
              3'h5: pos_word = 16'h3ee1;
              3'h6: pos_word = 16'hbc9f;
              3'h7: pos_word = 16'hbefa;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf9d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc07c;
              3'h2: pos_word = 16'h40aa;
              3'h3: pos_word = 16'h3fb3;
              3'h4: pos_word = 16'h3f11;
              3'h5: pos_word = 16'h3da9;
              3'h6: pos_word = 16'hbebc;
              3'h7: pos_word = 16'hbf80;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha1: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc02f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe0;
              3'h2: pos_word = 16'h3e3e;
              3'h3: pos_word = 16'hbf51;
              3'h4: pos_word = 16'hc265;
              3'h5: pos_word = 16'h3f60;
              3'h6: pos_word = 16'hbe1a;
              3'h7: pos_word = 16'hbfcf;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h4044;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed1;
              3'h2: pos_word = 16'hbf06;
              3'h3: pos_word = 16'hc08f;
              3'h4: pos_word = 16'h3fa9;
              3'h5: pos_word = 16'h3d5f;
              3'h6: pos_word = 16'hbf88;
              3'h7: pos_word = 16'h410e;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe92;
              3'h2: pos_word = 16'hc00e;
              3'h3: pos_word = 16'h4006;
              3'h4: pos_word = 16'h3e87;
              3'h5: pos_word = 16'hbf33;
              3'h6: pos_word = 16'hc12f;
              3'h7: pos_word = 16'h3f82;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbd9a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb1;
              3'h2: pos_word = 16'h4082;
              3'h3: pos_word = 16'h3efe;
              3'h4: pos_word = 16'hbedd;
              3'h5: pos_word = 16'hc053;
              3'h6: pos_word = 16'h3fc6;
              3'h7: pos_word = 16'h3e04;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf6a;
            case (mant_lo3)
              3'h1: pos_word = 16'h41d1;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'hbe54;
              3'h4: pos_word = 16'hbfec;
              3'h5: pos_word = 16'h4025;
              3'h6: pos_word = 16'h3eb0;
              3'h7: pos_word = 16'hbf18;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0c0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f97;
              3'h2: pos_word = 16'hbaab;
              3'h3: pos_word = 16'hbf98;
              3'h4: pos_word = 16'h40bd;
              3'h5: pos_word = 16'h3f18;
              3'h6: pos_word = 16'hbeb2;
              3'h7: pos_word = 16'hc026;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3fea;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e52;
              3'h2: pos_word = 16'hbf49;
              3'h3: pos_word = 16'hc1e1;
              3'h4: pos_word = 16'h3f69;
              3'h5: pos_word = 16'hbe07;
              3'h6: pos_word = 16'hbfc7;
              3'h7: pos_word = 16'h4051;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3edc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf00;
              3'h2: pos_word = 16'hc083;
              3'h3: pos_word = 16'h3fb0;
              3'h4: pos_word = 16'h3d95;
              3'h5: pos_word = 16'hbf83;
              3'h6: pos_word = 16'h412a;
              3'h7: pos_word = 16'h3f32;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe88;
            case (mant_lo3)
              3'h1: pos_word = 16'hc007;
              3'h2: pos_word = 16'h400d;
              3'h3: pos_word = 16'h3e91;
              3'h4: pos_word = 16'hbf2c;
              3'h5: pos_word = 16'hc112;
              3'h6: pos_word = 16'h3f87;
              3'h7: pos_word = 16'hbd6a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfaa;
            case (mant_lo3)
              3'h1: pos_word = 16'h408d;
              3'h2: pos_word = 16'h3f05;
              3'h3: pos_word = 16'hbed2;
              3'h4: pos_word = 16'hc046;
              3'h5: pos_word = 16'h3fce;
              3'h6: pos_word = 16'h3e17;
              3'h7: pos_word = 16'hbf62;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4247;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f50;
              3'h2: pos_word = 16'hbe41;
              3'h3: pos_word = 16'hbfe2;
              3'h4: pos_word = 16'h402e;
              3'h5: pos_word = 16'h3ebb;
              3'h6: pos_word = 16'hbf12;
              3'h7: pos_word = 16'hc0ad;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f9d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3c8a;
              3'h2: pos_word = 16'hbf92;
              3'h3: pos_word = 16'h40d4;
              3'h4: pos_word = 16'h3f1e;
              3'h5: pos_word = 16'hbea7;
              3'h6: pos_word = 16'hc01d;
              3'h7: pos_word = 16'h3ff5;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e65;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf42;
              3'h2: pos_word = 16'hc195;
              3'h3: pos_word = 16'h3f71;
              3'h4: pos_word = 16'hbde8;
              3'h5: pos_word = 16'hbfbf;
              3'h6: pos_word = 16'h405f;
              3'h7: pos_word = 16'h3ee7;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbef4;
            case (mant_lo3)
              3'h1: pos_word = 16'hc074;
              3'h2: pos_word = 16'h3fb7;
              3'h3: pos_word = 16'h3dba;
              3'h4: pos_word = 16'hbf7c;
              3'h5: pos_word = 16'h4153;
              3'h6: pos_word = 16'h3f39;
              3'h7: pos_word = 16'hbe7d;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc001;
            case (mant_lo3)
              3'h1: pos_word = 16'h4014;
              3'h2: pos_word = 16'h3e9b;
              3'h3: pos_word = 16'hbf26;
              3'h4: pos_word = 16'hc0fa;
              3'h5: pos_word = 16'h3f8c;
              3'h6: pos_word = 16'hbd1f;
              3'h7: pos_word = 16'hbfa4;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h409a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0b;
              3'h2: pos_word = 16'hbec7;
              3'h3: pos_word = 16'hc03a;
              3'h4: pos_word = 16'h3fd7;
              3'h5: pos_word = 16'h3e2a;
              3'h6: pos_word = 16'hbf59;
              3'h7: pos_word = 16'h4400;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha2: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f58;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd8;
              3'h2: pos_word = 16'h3ec5;
              3'h3: pos_word = 16'hc09d;
              3'h4: pos_word = 16'h3d0f;
              3'h5: pos_word = 16'h40f2;
              3'h6: pos_word = 16'hbe9d;
              3'h7: pos_word = 16'h4000;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf3b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7a;
              3'h2: pos_word = 16'hbfb8;
              3'h3: pos_word = 16'h3ef2;
              3'h4: pos_word = 16'hc063;
              3'h5: pos_word = 16'h3de0;
              3'h6: pos_word = 16'h418b;
              3'h7: pos_word = 16'hbe69;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h401c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf1f;
              3'h2: pos_word = 16'h3f91;
              3'h3: pos_word = 16'hbf9e;
              3'h4: pos_word = 16'h3f11;
              3'h5: pos_word = 16'hc030;
              3'h6: pos_word = 16'h3e3d;
              3'h7: pos_word = 16'hc277;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe1b;
            case (mant_lo3)
              3'h1: pos_word = 16'h4043;
              3'h2: pos_word = 16'hbf06;
              3'h3: pos_word = 16'h3fa9;
              3'h4: pos_word = 16'hbf88;
              3'h5: pos_word = 16'h3f2b;
              3'h6: pos_word = 16'hc00e;
              3'h7: pos_word = 16'h3e86;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc131;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd9d;
              3'h2: pos_word = 16'h4081;
              3'h3: pos_word = 16'hbede;
              3'h4: pos_word = 16'h3fc5;
              3'h5: pos_word = 16'hbf6b;
              3'h6: pos_word = 16'h3f48;
              3'h7: pos_word = 16'hbfec;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3eaf;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c2;
              3'h2: pos_word = 16'hbb2b;
              3'h3: pos_word = 16'h40bc;
              3'h4: pos_word = 16'hbeb2;
              3'h5: pos_word = 16'h3fe9;
              3'h6: pos_word = 16'hbf4a;
              3'h7: pos_word = 16'h3f68;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfc8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3edb;
              3'h2: pos_word = 16'hc084;
              3'h3: pos_word = 16'h3d92;
              3'h4: pos_word = 16'h4128;
              3'h5: pos_word = 16'hbe89;
              3'h6: pos_word = 16'h400c;
              3'h7: pos_word = 16'hbf2d;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f87;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfab;
              3'h2: pos_word = 16'h3f05;
              3'h3: pos_word = 16'hc047;
              3'h4: pos_word = 16'h3e15;
              3'h5: pos_word = 16'h423b;
              3'h6: pos_word = 16'hbe43;
              3'h7: pos_word = 16'h402d;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf13;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9c;
              3'h2: pos_word = 16'hbf93;
              3'h3: pos_word = 16'h3f1d;
              3'h4: pos_word = 16'hc01e;
              3'h5: pos_word = 16'h3e64;
              3'h6: pos_word = 16'hc199;
              3'h7: pos_word = 16'hbdea;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h405e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef5;
              3'h2: pos_word = 16'h3fb6;
              3'h3: pos_word = 16'hbf7d;
              3'h4: pos_word = 16'h3f39;
              3'h5: pos_word = 16'hc002;
              3'h6: pos_word = 16'h3e9a;
              3'h7: pos_word = 16'hc0fc;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbd25;
            case (mant_lo3)
              3'h1: pos_word = 16'h4099;
              3'h2: pos_word = 16'hbec8;
              3'h3: pos_word = 16'h3fd6;
              3'h4: pos_word = 16'hbf5a;
              3'h5: pos_word = 16'h3f57;
              3'h6: pos_word = 16'hbfd9;
              3'h7: pos_word = 16'h3ec4;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc09e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d0a;
              3'h2: pos_word = 16'h40f0;
              3'h3: pos_word = 16'hbe9e;
              3'h4: pos_word = 16'h3fff;
              3'h5: pos_word = 16'hbf3b;
              3'h6: pos_word = 16'h3f7a;
              3'h7: pos_word = 16'hbfb9;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3ef1;
            case (mant_lo3)
              3'h1: pos_word = 16'hc064;
              3'h2: pos_word = 16'h3ddd;
              3'h3: pos_word = 16'h4188;
              3'h4: pos_word = 16'hbe6b;
              3'h5: pos_word = 16'h401b;
              3'h6: pos_word = 16'hbf20;
              3'h7: pos_word = 16'h3f91;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf9e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f10;
              3'h2: pos_word = 16'hc031;
              3'h3: pos_word = 16'h3e3c;
              3'h4: pos_word = 16'hc287;
              3'h5: pos_word = 16'hbe1c;
              3'h6: pos_word = 16'h4043;
              3'h7: pos_word = 16'hbf07;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fa8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf88;
              3'h2: pos_word = 16'h3f2b;
              3'h3: pos_word = 16'hc00f;
              3'h4: pos_word = 16'h3e85;
              3'h5: pos_word = 16'hc134;
              3'h6: pos_word = 16'hbd9f;
              3'h7: pos_word = 16'h4081;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbedf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc5;
              3'h2: pos_word = 16'hbf6b;
              3'h3: pos_word = 16'h3f47;
              3'h4: pos_word = 16'hbfed;
              3'h5: pos_word = 16'h3eaf;
              3'h6: pos_word = 16'hc0c3;
              3'h7: pos_word = 16'hbb80;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha3: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h40ba;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe9;
              3'h2: pos_word = 16'h3f68;
              3'h3: pos_word = 16'h3eda;
              3'h4: pos_word = 16'h3d8f;
              3'h5: pos_word = 16'hbe8a;
              3'h6: pos_word = 16'hbf2d;
              3'h7: pos_word = 16'hbfab;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc048;
            case (mant_lo3)
              3'h1: pos_word = 16'h4230;
              3'h2: pos_word = 16'h402c;
              3'h3: pos_word = 16'h3f9c;
              3'h4: pos_word = 16'h3f1d;
              3'h5: pos_word = 16'h3e62;
              3'h6: pos_word = 16'hbded;
              3'h7: pos_word = 16'hbef6;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf7e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc002;
              3'h2: pos_word = 16'hc0ff;
              3'h3: pos_word = 16'h4098;
              3'h4: pos_word = 16'h3fd5;
              3'h5: pos_word = 16'h3f57;
              3'h6: pos_word = 16'h3ec4;
              3'h7: pos_word = 16'h3d04;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe9f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3c;
              3'h2: pos_word = 16'hbfb9;
              3'h3: pos_word = 16'hc065;
              3'h4: pos_word = 16'h4185;
              3'h5: pos_word = 16'h401a;
              3'h6: pos_word = 16'h3f90;
              3'h7: pos_word = 16'h3f10;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e3a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe1e;
              3'h2: pos_word = 16'hbf07;
              3'h3: pos_word = 16'hbf89;
              3'h4: pos_word = 16'hc00f;
              3'h5: pos_word = 16'hc137;
              3'h6: pos_word = 16'h4080;
              3'h7: pos_word = 16'h3fc4;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f47;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eae;
              3'h2: pos_word = 16'hbbab;
              3'h3: pos_word = 16'hbeb4;
              3'h4: pos_word = 16'hbf4b;
              3'h5: pos_word = 16'hbfc9;
              3'h6: pos_word = 16'hc086;
              3'h7: pos_word = 16'h4123;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h400b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f86;
              3'h2: pos_word = 16'h3f04;
              3'h3: pos_word = 16'h3e13;
              3'h4: pos_word = 16'hbe45;
              3'h5: pos_word = 16'hbf14;
              3'h6: pos_word = 16'hbf93;
              3'h7: pos_word = 16'hc01f;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc1a0;
            case (mant_lo3)
              3'h1: pos_word = 16'h405c;
              3'h2: pos_word = 16'h3fb5;
              3'h3: pos_word = 16'h3f38;
              3'h4: pos_word = 16'h3e99;
              3'h5: pos_word = 16'hbd2f;
              3'h6: pos_word = 16'hbeca;
              3'h7: pos_word = 16'hbf5b;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfda;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a0;
              3'h2: pos_word = 16'h40eb;
              3'h3: pos_word = 16'h3ffd;
              3'h4: pos_word = 16'h3f78;
              3'h5: pos_word = 16'h3eef;
              3'h6: pos_word = 16'h3dd7;
              3'h7: pos_word = 16'hbe6d;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf21;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9f;
              3'h2: pos_word = 16'hc032;
              3'h3: pos_word = 16'hc2a3;
              3'h4: pos_word = 16'h4041;
              3'h5: pos_word = 16'h3fa7;
              3'h6: pos_word = 16'h3f2a;
              3'h7: pos_word = 16'h3e84;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbda5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee0;
              3'h2: pos_word = 16'hbf6c;
              3'h3: pos_word = 16'hbfef;
              3'h4: pos_word = 16'hc0c7;
              3'h5: pos_word = 16'h40b7;
              3'h6: pos_word = 16'h3fe7;
              3'h7: pos_word = 16'h3f66;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ed8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d8a;
              3'h2: pos_word = 16'hbe8b;
              3'h3: pos_word = 16'hbf2e;
              3'h4: pos_word = 16'hbfac;
              3'h5: pos_word = 16'hc04a;
              3'h6: pos_word = 16'h421e;
              3'h7: pos_word = 16'h402b;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f9b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1c;
              3'h2: pos_word = 16'h3e5f;
              3'h3: pos_word = 16'hbdf2;
              3'h4: pos_word = 16'hbef8;
              3'h5: pos_word = 16'hbf7f;
              3'h6: pos_word = 16'hc003;
              3'h7: pos_word = 16'hc102;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4096;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd4;
              3'h2: pos_word = 16'h3f55;
              3'h3: pos_word = 16'h3ec2;
              3'h4: pos_word = 16'h3cf4;
              3'h5: pos_word = 16'hbea0;
              3'h6: pos_word = 16'hbf3d;
              3'h7: pos_word = 16'hbfba;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc067;
            case (mant_lo3)
              3'h1: pos_word = 16'h417e;
              3'h2: pos_word = 16'h4019;
              3'h3: pos_word = 16'h3f90;
              3'h4: pos_word = 16'h3f0f;
              3'h5: pos_word = 16'h3e37;
              3'h6: pos_word = 16'hbe20;
              3'h7: pos_word = 16'hbf08;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf89;
            case (mant_lo3)
              3'h1: pos_word = 16'hc010;
              3'h2: pos_word = 16'hc13c;
              3'h3: pos_word = 16'h407d;
              3'h4: pos_word = 16'h3fc3;
              3'h5: pos_word = 16'h3f46;
              3'h6: pos_word = 16'h3eac;
              3'h7: pos_word = 16'hbc00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha4: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbeb5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfca;
              3'h2: pos_word = 16'h411f;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'h3e10;
              3'h5: pos_word = 16'hbf14;
              3'h6: pos_word = 16'hc020;
              3'h7: pos_word = 16'h405a;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f37;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd3a;
              3'h2: pos_word = 16'hbf5c;
              3'h3: pos_word = 16'hc0a2;
              3'h4: pos_word = 16'h3ffc;
              3'h5: pos_word = 16'h3eee;
              3'h6: pos_word = 16'hbe70;
              3'h7: pos_word = 16'hbfa0;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc2cf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa6;
              3'h2: pos_word = 16'h3e83;
              3'h3: pos_word = 16'hbee2;
              3'h4: pos_word = 16'hbff0;
              3'h5: pos_word = 16'h40b5;
              3'h6: pos_word = 16'h3f65;
              3'h7: pos_word = 16'h3d85;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf2f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc04b;
              3'h2: pos_word = 16'h402a;
              3'h3: pos_word = 16'h3f1b;
              3'h4: pos_word = 16'hbdf8;
              3'h5: pos_word = 16'hbf80;
              3'h6: pos_word = 16'hc105;
              3'h7: pos_word = 16'h3fd3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ec1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea1;
              3'h2: pos_word = 16'hbfbb;
              3'h3: pos_word = 16'h4174;
              3'h4: pos_word = 16'h3f8f;
              3'h5: pos_word = 16'h3e35;
              3'h6: pos_word = 16'hbf09;
              3'h7: pos_word = 16'hc011;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h407a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f45;
              3'h2: pos_word = 16'hbc2b;
              3'h3: pos_word = 16'hbf4d;
              3'h4: pos_word = 16'hc089;
              3'h5: pos_word = 16'h4009;
              3'h6: pos_word = 16'h3f02;
              3'h7: pos_word = 16'hbe4b;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf95;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1b3;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'h3e96;
              3'h4: pos_word = 16'hbecd;
              3'h5: pos_word = 16'hbfdd;
              3'h6: pos_word = 16'h40e2;
              3'h7: pos_word = 16'h3f76;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3dcd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf23;
              3'h2: pos_word = 16'hc035;
              3'h3: pos_word = 16'h403e;
              3'h4: pos_word = 16'h3f28;
              3'h5: pos_word = 16'hbdb0;
              3'h6: pos_word = 16'hbf6f;
              3'h7: pos_word = 16'hc0cd;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3fe4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed5;
              3'h2: pos_word = 16'hbe8e;
              3'h3: pos_word = 16'hbfae;
              3'h4: pos_word = 16'h4203;
              3'h5: pos_word = 16'h3f99;
              3'h6: pos_word = 16'h3e5a;
              3'h7: pos_word = 16'hbefb;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc005;
            case (mant_lo3)
              3'h1: pos_word = 16'h4092;
              3'h2: pos_word = 16'h3f53;
              3'h3: pos_word = 16'h3cc9;
              3'h4: pos_word = 16'hbf3f;
              3'h5: pos_word = 16'hc06c;
              3'h6: pos_word = 16'h4017;
              3'h7: pos_word = 16'h3f0d;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe26;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8b;
              3'h2: pos_word = 16'hc149;
              3'h3: pos_word = 16'h3fc1;
              3'h4: pos_word = 16'h3ea9;
              3'h5: pos_word = 16'hbeb8;
              3'h6: pos_word = 16'hbfcc;
              3'h7: pos_word = 16'h4117;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f84;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0b;
              3'h2: pos_word = 16'hbf16;
              3'h3: pos_word = 16'hc023;
              3'h4: pos_word = 16'h4056;
              3'h5: pos_word = 16'h3f35;
              3'h6: pos_word = 16'hbd4f;
              3'h7: pos_word = 16'hbf5f;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc0a7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff8;
              3'h2: pos_word = 16'h3eeb;
              3'h3: pos_word = 16'hbe76;
              3'h4: pos_word = 16'hbfa2;
              3'h5: pos_word = 16'hc361;
              3'h6: pos_word = 16'h3fa5;
              3'h7: pos_word = 16'h3e80;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbee5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff3;
              3'h2: pos_word = 16'h40af;
              3'h3: pos_word = 16'h3f63;
              3'h4: pos_word = 16'h3d74;
              3'h5: pos_word = 16'hbf31;
              3'h6: pos_word = 16'hc04f;
              3'h7: pos_word = 16'h4027;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f19;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe01;
              3'h2: pos_word = 16'hbf81;
              3'h3: pos_word = 16'hc10b;
              3'h4: pos_word = 16'h3fd0;
              3'h5: pos_word = 16'h3ebe;
              3'h6: pos_word = 16'hbea4;
              3'h7: pos_word = 16'hbfbd;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4162;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8d;
              3'h2: pos_word = 16'h3e2f;
              3'h3: pos_word = 16'hbf0a;
              3'h4: pos_word = 16'hc013;
              3'h5: pos_word = 16'h4075;
              3'h6: pos_word = 16'h3f42;
              3'h7: pos_word = 16'hbc80;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha5: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf4f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4008;
              3'h2: pos_word = 16'hbe50;
              3'h3: pos_word = 16'hc1cb;
              3'h4: pos_word = 16'h3e93;
              3'h5: pos_word = 16'hbfe0;
              3'h6: pos_word = 16'h3f73;
              3'h7: pos_word = 16'hbf24;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h403a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdba;
              3'h2: pos_word = 16'hc0d5;
              3'h3: pos_word = 16'h3ed2;
              3'h4: pos_word = 16'hbfb0;
              3'h5: pos_word = 16'h3f98;
              3'h6: pos_word = 16'hbefe;
              3'h7: pos_word = 16'h408f;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3c9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc071;
              3'h2: pos_word = 16'h3f0c;
              3'h3: pos_word = 16'hbf8c;
              3'h4: pos_word = 16'h3fbf;
              3'h5: pos_word = 16'hbebb;
              3'h6: pos_word = 16'h4110;
              3'h7: pos_word = 16'h3e05;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc025;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f33;
              3'h2: pos_word = 16'hbf61;
              3'h3: pos_word = 16'h3ff5;
              3'h4: pos_word = 16'hbe7c;
              3'h5: pos_word = 16'h44a6;
              3'h6: pos_word = 16'h3e7a;
              3'h7: pos_word = 16'hbff6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f60;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf33;
              3'h2: pos_word = 16'h4025;
              3'h3: pos_word = 16'hbe07;
              3'h4: pos_word = 16'hc112;
              3'h5: pos_word = 16'h3ebb;
              3'h6: pos_word = 16'hbfbf;
              3'h7: pos_word = 16'h3f8c;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf0c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4070;
              3'h2: pos_word = 16'hbcab;
              3'h3: pos_word = 16'hc090;
              3'h4: pos_word = 16'h3efd;
              3'h5: pos_word = 16'hbf98;
              3'h6: pos_word = 16'h3faf;
              3'h7: pos_word = 16'hbed3;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h40d2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3db7;
              3'h2: pos_word = 16'hc03b;
              3'h3: pos_word = 16'h3f24;
              3'h4: pos_word = 16'hbf74;
              3'h5: pos_word = 16'h3fdf;
              3'h6: pos_word = 16'hbe94;
              3'h7: pos_word = 16'h41c3;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc008;
              3'h2: pos_word = 16'h3f4f;
              3'h3: pos_word = 16'hbf43;
              3'h4: pos_word = 16'h4013;
              3'h5: pos_word = 16'hbe31;
              3'h6: pos_word = 16'hc167;
              3'h7: pos_word = 16'h3ea4;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfd1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f81;
              3'h2: pos_word = 16'hbf1a;
              3'h3: pos_word = 16'h404e;
              3'h4: pos_word = 16'hbd7a;
              3'h5: pos_word = 16'hc0b1;
              3'h6: pos_word = 16'h3ee4;
              3'h7: pos_word = 16'hbfa5;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fa1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeec;
              3'h2: pos_word = 16'h40a5;
              3'h3: pos_word = 16'h3d49;
              3'h4: pos_word = 16'hc057;
              3'h5: pos_word = 16'h3f16;
              3'h6: pos_word = 16'hbf84;
              3'h7: pos_word = 16'h3fcc;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbeaa;
            case (mant_lo3)
              3'h1: pos_word = 16'h4145;
              3'h2: pos_word = 16'h3e24;
              3'h3: pos_word = 16'hc018;
              3'h4: pos_word = 16'h3f3e;
              3'h5: pos_word = 16'hbf54;
              3'h6: pos_word = 16'h4004;
              3'h7: pos_word = 16'hbe5b;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc20a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e8d;
              3'h2: pos_word = 16'hbfe5;
              3'h3: pos_word = 16'h3f6e;
              3'h4: pos_word = 16'hbf28;
              3'h5: pos_word = 16'h4034;
              3'h6: pos_word = 16'hbdd0;
              3'h7: pos_word = 16'hc0e5;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3ecc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb4;
              3'h2: pos_word = 16'h3f94;
              3'h3: pos_word = 16'hbf02;
              3'h4: pos_word = 16'h4088;
              3'h5: pos_word = 16'h3c12;
              3'h6: pos_word = 16'hc07c;
              3'h7: pos_word = 16'h3f08;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf8f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbb;
              3'h2: pos_word = 16'hbec1;
              3'h3: pos_word = 16'h4103;
              3'h4: pos_word = 16'h3df5;
              3'h5: pos_word = 16'hc02b;
              3'h6: pos_word = 16'h3f2f;
              3'h7: pos_word = 16'hbf66;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fef;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe83;
              3'h2: pos_word = 16'h42b3;
              3'h3: pos_word = 16'h3e6f;
              3'h4: pos_word = 16'hbffd;
              3'h5: pos_word = 16'h3f5c;
              3'h6: pos_word = 16'hbf37;
              3'h7: pos_word = 16'h4020;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe12;
            case (mant_lo3)
              3'h1: pos_word = 16'hc121;
              3'h2: pos_word = 16'h3eb5;
              3'h3: pos_word = 16'hbfc4;
              3'h4: pos_word = 16'h3f89;
              3'h5: pos_word = 16'hbf10;
              3'h6: pos_word = 16'h4066;
              3'h7: pos_word = 16'hbd00;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha6: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc097;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9b;
              3'h2: pos_word = 16'hbed9;
              3'h3: pos_word = 16'h3da2;
              3'h4: pos_word = 16'h3f20;
              3'h5: pos_word = 16'h3fda;
              3'h6: pos_word = 16'h419c;
              3'h7: pos_word = 16'hc00c;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf47;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe3c;
              3'h2: pos_word = 16'h3e9e;
              3'h3: pos_word = 16'h3f7d;
              3'h4: pos_word = 16'h4047;
              3'h5: pos_word = 16'hc0bc;
              3'h6: pos_word = 16'hbfa9;
              3'h7: pos_word = 16'hbef2;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3d1e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f12;
              3'h2: pos_word = 16'h3fc7;
              3'h3: pos_word = 16'h412e;
              3'h4: pos_word = 16'hc01c;
              3'h5: pos_word = 16'hbf58;
              3'h6: pos_word = 16'hbe67;
              3'h7: pos_word = 16'h3e87;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f69;
            case (mant_lo3)
              3'h1: pos_word = 16'h402e;
              3'h2: pos_word = 16'hc0f7;
              3'h3: pos_word = 16'hbfb8;
              3'h4: pos_word = 16'hbf06;
              3'h5: pos_word = 16'hbac6;
              3'h6: pos_word = 16'h3f05;
              3'h7: pos_word = 16'h3fb6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h40f2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc030;
              3'h2: pos_word = 16'hbf6b;
              3'h3: pos_word = 16'hbe89;
              3'h4: pos_word = 16'h3e63;
              3'h5: pos_word = 16'h3f57;
              3'h6: pos_word = 16'h401b;
              3'h7: pos_word = 16'hc134;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfc8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf13;
              3'h2: pos_word = 16'hbd2b;
              3'h3: pos_word = 16'h3ef0;
              3'h4: pos_word = 16'h3fa8;
              3'h5: pos_word = 16'h40b8;
              3'h6: pos_word = 16'hc049;
              3'h7: pos_word = 16'hbf7e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e39;
              3'h2: pos_word = 16'h3f46;
              3'h3: pos_word = 16'h400b;
              3'h4: pos_word = 16'hc1a6;
              3'h5: pos_word = 16'hbfdb;
              3'h6: pos_word = 16'hbf21;
              3'h7: pos_word = 16'hbda8;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ed8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9a;
              3'h2: pos_word = 16'h4095;
              3'h3: pos_word = 16'hc069;
              3'h4: pos_word = 16'hbf8a;
              3'h5: pos_word = 16'hbeb6;
              3'h6: pos_word = 16'h3e0e;
              3'h7: pos_word = 16'h3f36;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3ffb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc2f5;
              3'h2: pos_word = 16'hbff1;
              3'h3: pos_word = 16'hbf30;
              3'h4: pos_word = 16'hbdfb;
              3'h5: pos_word = 16'h3ec0;
              3'h6: pos_word = 16'h3f8e;
              3'h7: pos_word = 16'h4079;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc08a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf95;
              3'h2: pos_word = 16'hbece;
              3'h3: pos_word = 16'h3dca;
              3'h4: pos_word = 16'h3f27;
              3'h5: pos_word = 16'h3fe4;
              3'h6: pos_word = 16'h41fa;
              3'h7: pos_word = 16'hc005;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf40;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe27;
              3'h2: pos_word = 16'h3ea9;
              3'h3: pos_word = 16'h3f83;
              3'h4: pos_word = 16'h4055;
              3'h5: pos_word = 16'hc0a8;
              3'h6: pos_word = 16'hbfa2;
              3'h7: pos_word = 16'hbee6;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3d6e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f19;
              3'h2: pos_word = 16'h3fd0;
              3'h3: pos_word = 16'h415d;
              3'h4: pos_word = 16'hc014;
              3'h5: pos_word = 16'hbf50;
              3'h6: pos_word = 16'hbe52;
              3'h7: pos_word = 16'h3e92;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f72;
            case (mant_lo3)
              3'h1: pos_word = 16'h4039;
              3'h2: pos_word = 16'hc0d7;
              3'h3: pos_word = 16'hbfb0;
              3'h4: pos_word = 16'hbeff;
              3'h5: pos_word = 16'h3c92;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h3fbe;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h410e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc026;
              3'h2: pos_word = 16'hbf62;
              3'h3: pos_word = 16'hbe7d;
              3'h4: pos_word = 16'h3e78;
              3'h5: pos_word = 16'h3f60;
              3'h6: pos_word = 16'h4024;
              3'h7: pos_word = 16'hc114;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfc0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0d;
              3'h2: pos_word = 16'hbcb7;
              3'h3: pos_word = 16'h3efc;
              3'h4: pos_word = 16'h3faf;
              3'h5: pos_word = 16'h40d0;
              3'h6: pos_word = 16'hc03c;
              3'h7: pos_word = 16'hbf75;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e4d;
              3'h2: pos_word = 16'h3f4e;
              3'h3: pos_word = 16'h4012;
              3'h4: pos_word = 16'hc16c;
              3'h5: pos_word = 16'hbfd2;
              3'h6: pos_word = 16'hbf1a;
              3'h7: pos_word = 16'hbd80;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha7: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3ee3;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a4;
              3'h2: pos_word = 16'hbf85;
              3'h3: pos_word = 16'h3e23;
              3'h4: pos_word = 16'h4004;
              3'h5: pos_word = 16'hbfe6;
              3'h6: pos_word = 16'hbdd3;
              3'h7: pos_word = 16'h3f94;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc07d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec2;
              3'h2: pos_word = 16'h3f2e;
              3'h3: pos_word = 16'h429e;
              3'h4: pos_word = 16'hbf38;
              3'h5: pos_word = 16'h3eb4;
              3'h6: pos_word = 16'h4065;
              3'h7: pos_word = 16'hbf9c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3d9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd9;
              3'h2: pos_word = 16'hc00d;
              3'h3: pos_word = 16'hbe3d;
              3'h4: pos_word = 16'h3f7c;
              3'h5: pos_word = 16'hc0be;
              3'h6: pos_word = 16'hbef3;
              3'h7: pos_word = 16'h3f12;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h412c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf59;
              3'h2: pos_word = 16'h3e87;
              3'h3: pos_word = 16'h402e;
              3'h4: pos_word = 16'hbfb8;
              3'h5: pos_word = 16'hbb46;
              3'h6: pos_word = 16'h3fb6;
              3'h7: pos_word = 16'hc031;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbe8a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f56;
              3'h2: pos_word = 16'hc138;
              3'h3: pos_word = 16'hbf14;
              3'h4: pos_word = 16'h3eef;
              3'h5: pos_word = 16'h40b7;
              3'h6: pos_word = 16'hbf7f;
              3'h7: pos_word = 16'h3e37;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h400a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfdc;
              3'h2: pos_word = 16'hbdab;
              3'h3: pos_word = 16'h3f9a;
              3'h4: pos_word = 16'hc06a;
              3'h5: pos_word = 16'hbeb7;
              3'h6: pos_word = 16'h3f36;
              3'h7: pos_word = 16'hc317;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf31;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ebf;
              3'h2: pos_word = 16'h4077;
              3'h3: pos_word = 16'hbf96;
              3'h4: pos_word = 16'h3dc6;
              3'h5: pos_word = 16'h3fe3;
              3'h6: pos_word = 16'hc006;
              3'h7: pos_word = 16'hbe29;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f83;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0aa;
              3'h2: pos_word = 16'hbee7;
              3'h3: pos_word = 16'h3f18;
              3'h4: pos_word = 16'h4159;
              3'h5: pos_word = 16'hbf51;
              3'h6: pos_word = 16'h3e91;
              3'h7: pos_word = 16'h4039;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3c86;
              3'h2: pos_word = 16'h3fbe;
              3'h3: pos_word = 16'hc027;
              3'h4: pos_word = 16'hbe7f;
              3'h5: pos_word = 16'h3f5f;
              3'h6: pos_word = 16'hc116;
              3'h7: pos_word = 16'hbf0d;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3efb;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ce;
              3'h2: pos_word = 16'hbf75;
              3'h3: pos_word = 16'h3e4c;
              3'h4: pos_word = 16'h4012;
              3'h5: pos_word = 16'hbfd3;
              3'h6: pos_word = 16'hbd83;
              3'h7: pos_word = 16'h3fa0;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc05a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeac;
              3'h2: pos_word = 16'h3f3d;
              3'h3: pos_word = 16'hc21a;
              3'h4: pos_word = 16'hbf29;
              3'h5: pos_word = 16'h3eca;
              3'h6: pos_word = 16'h4086;
              3'h7: pos_word = 16'hbf90;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3dee;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fed;
              3'h2: pos_word = 16'hbffe;
              3'h3: pos_word = 16'hbe15;
              3'h4: pos_word = 16'h3f88;
              3'h5: pos_word = 16'hc099;
              3'h6: pos_word = 16'hbedb;
              3'h7: pos_word = 16'h3f1f;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4193;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf49;
              3'h2: pos_word = 16'h3e9c;
              3'h3: pos_word = 16'h4045;
              3'h4: pos_word = 16'hbfaa;
              3'h5: pos_word = 16'h3d12;
              3'h6: pos_word = 16'h3fc6;
              3'h7: pos_word = 16'hc01e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe6a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f68;
              3'h2: pos_word = 16'hc0fe;
              3'h3: pos_word = 16'hbf07;
              3'h4: pos_word = 16'h3f04;
              3'h5: pos_word = 16'h40ec;
              3'h6: pos_word = 16'hbf6c;
              3'h7: pos_word = 16'h3e60;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h401a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfca;
              3'h2: pos_word = 16'hbd37;
              3'h3: pos_word = 16'h3fa7;
              3'h4: pos_word = 16'hc04b;
              3'h5: pos_word = 16'hbea1;
              3'h6: pos_word = 16'h3f45;
              3'h7: pos_word = 16'hc1b1;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed6;
              3'h2: pos_word = 16'h4093;
              3'h3: pos_word = 16'hbf8b;
              3'h4: pos_word = 16'h3e0b;
              3'h5: pos_word = 16'h3ff9;
              3'h6: pos_word = 16'hbff3;
              3'h7: pos_word = 16'hbe01;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha8: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f8e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed0;
              3'h2: pos_word = 16'h41e4;
              3'h3: pos_word = 16'h3ea7;
              3'h4: pos_word = 16'hbfa3;
              3'h5: pos_word = 16'h3fce;
              3'h6: pos_word = 16'hbe55;
              3'h7: pos_word = 16'hc0db;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f0a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf63;
              3'h2: pos_word = 16'h4022;
              3'h3: pos_word = 16'hbcd0;
              3'h4: pos_word = 16'hc03e;
              3'h5: pos_word = 16'h3f4d;
              3'h6: pos_word = 16'hbf1b;
              3'h7: pos_word = 16'h40a2;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e20;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe8;
              3'h2: pos_word = 16'h3f93;
              3'h3: pos_word = 16'hbec4;
              3'h4: pos_word = 16'h427f;
              3'h5: pos_word = 16'h3eb2;
              3'h6: pos_word = 16'hbf9d;
              3'h7: pos_word = 16'h3fd7;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe41;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c1;
              3'h2: pos_word = 16'h3f11;
              3'h3: pos_word = 16'hbf5a;
              3'h4: pos_word = 16'h402c;
              3'h5: pos_word = 16'hbbc6;
              3'h6: pos_word = 16'hc033;
              3'h7: pos_word = 16'h3f55;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf15;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b4;
              3'h2: pos_word = 16'h3e34;
              3'h3: pos_word = 16'hbfdd;
              3'h4: pos_word = 16'h3f99;
              3'h5: pos_word = 16'hbeb9;
              3'h6: pos_word = 16'hc38a;
              3'h7: pos_word = 16'h3ebd;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf97;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe1;
              3'h2: pos_word = 16'hbe2c;
              3'h3: pos_word = 16'hc0ac;
              3'h4: pos_word = 16'h3f17;
              3'h5: pos_word = 16'hbf52;
              3'h6: pos_word = 16'h4037;
              3'h7: pos_word = 16'h3c5a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc028;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f5e;
              3'h2: pos_word = 16'hbf0e;
              3'h3: pos_word = 16'h40ca;
              3'h4: pos_word = 16'h3e48;
              3'h5: pos_word = 16'hbfd4;
              3'h6: pos_word = 16'h3f9f;
              3'h7: pos_word = 16'hbeae;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc22e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec8;
              3'h2: pos_word = 16'hbf91;
              3'h3: pos_word = 16'h3fec;
              3'h4: pos_word = 16'hbe18;
              3'h5: pos_word = 16'hc09c;
              3'h6: pos_word = 16'h3f1e;
              3'h7: pos_word = 16'hbf4a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4043;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d06;
              3'h2: pos_word = 16'hc01f;
              3'h3: pos_word = 16'h3f66;
              3'h4: pos_word = 16'hbf08;
              3'h5: pos_word = 16'h40e7;
              3'h6: pos_word = 16'h3e5d;
              3'h7: pos_word = 16'hbfcb;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fa6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea3;
              3'h2: pos_word = 16'hc1bd;
              3'h3: pos_word = 16'h3ed4;
              3'h4: pos_word = 16'hbf8b;
              3'h5: pos_word = 16'h3ff7;
              3'h6: pos_word = 16'hbe04;
              3'h7: pos_word = 16'hc08e;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f25;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf42;
              3'h2: pos_word = 16'h4050;
              3'h3: pos_word = 16'h3d55;
              3'h4: pos_word = 16'hc017;
              3'h5: pos_word = 16'h3f70;
              3'h6: pos_word = 16'hbf02;
              3'h7: pos_word = 16'h4107;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e72;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc3;
              3'h2: pos_word = 16'h3fac;
              3'h3: pos_word = 16'hbe98;
              3'h4: pos_word = 16'hc182;
              3'h5: pos_word = 16'h3ee0;
              3'h6: pos_word = 16'hbf86;
              3'h7: pos_word = 16'h4002;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbddf;
            case (mant_lo3)
              3'h1: pos_word = 16'hc082;
              3'h2: pos_word = 16'h3f2c;
              3'h3: pos_word = 16'hbf3a;
              3'h4: pos_word = 16'h405f;
              3'h5: pos_word = 16'h3d92;
              3'h6: pos_word = 16'hc00f;
              3'h7: pos_word = 16'h3f79;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbef7;
            case (mant_lo3)
              3'h1: pos_word = 16'h4121;
              3'h2: pos_word = 16'h3e83;
              3'h3: pos_word = 16'hbfbb;
              3'h4: pos_word = 16'h3fb4;
              3'h5: pos_word = 16'hbe8d;
              3'h6: pos_word = 16'hc145;
              3'h7: pos_word = 16'h3eeb;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf81;
            case (mant_lo3)
              3'h1: pos_word = 16'h4008;
              3'h2: pos_word = 16'hbdb7;
              3'h3: pos_word = 16'hc070;
              3'h4: pos_word = 16'h3f33;
              3'h5: pos_word = 16'hbf33;
              3'h6: pos_word = 16'h4071;
              3'h7: pos_word = 16'h3dba;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc008;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f81;
              3'h2: pos_word = 16'hbeeb;
              3'h3: pos_word = 16'h4148;
              3'h4: pos_word = 16'h3e8e;
              3'h5: pos_word = 16'hbfb3;
              3'h6: pos_word = 16'h3fbb;
              3'h7: pos_word = 16'hbe83;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha9: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc11f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf78;
              3'h2: pos_word = 16'hbd90;
              3'h3: pos_word = 16'h3f3b;
              3'h4: pos_word = 16'h4083;
              3'h5: pos_word = 16'hc001;
              3'h6: pos_word = 16'hbedf;
              3'h7: pos_word = 16'h3e99;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fc3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc105;
              3'h2: pos_word = 16'hbf6f;
              3'h3: pos_word = 16'hbd50;
              3'h4: pos_word = 16'h3f42;
              3'h5: pos_word = 16'h408e;
              3'h6: pos_word = 16'hbff6;
              3'h7: pos_word = 16'hbed3;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ea3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcc;
              3'h2: pos_word = 16'hc0e5;
              3'h3: pos_word = 16'hbf66;
              3'h4: pos_word = 16'hbd01;
              3'h5: pos_word = 16'h3f4a;
              3'h6: pos_word = 16'h409d;
              3'h7: pos_word = 16'hbfeb;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbec8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eae;
              3'h2: pos_word = 16'h3fd5;
              3'h3: pos_word = 16'hc0c9;
              3'h4: pos_word = 16'hbf5d;
              3'h5: pos_word = 16'hbc46;
              3'h6: pos_word = 16'h3f53;
              3'h7: pos_word = 16'h40ae;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbfe1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebc;
              3'h2: pos_word = 16'h3eba;
              3'h3: pos_word = 16'h3fde;
              3'h4: pos_word = 16'hc0b2;
              3'h5: pos_word = 16'hbf55;
              3'h6: pos_word = 16'h3bed;
              3'h7: pos_word = 16'h3f5b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h40c3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd7;
              3'h2: pos_word = 16'hbeb1;
              3'h3: pos_word = 16'h3ec5;
              3'h4: pos_word = 16'h3fe8;
              3'h5: pos_word = 16'hc0a1;
              3'h6: pos_word = 16'hbf4c;
              3'h7: pos_word = 16'h3cda;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f64;
            case (mant_lo3)
              3'h1: pos_word = 16'h40dd;
              3'h2: pos_word = 16'hbfce;
              3'h3: pos_word = 16'hbea6;
              3'h4: pos_word = 16'h3ed0;
              3'h5: pos_word = 16'h3ff3;
              3'h6: pos_word = 16'hc092;
              3'h7: pos_word = 16'hbf44;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3d3c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6d;
              3'h2: pos_word = 16'h4100;
              3'h3: pos_word = 16'hbfc5;
              3'h4: pos_word = 16'hbe9b;
              3'h5: pos_word = 16'h3edc;
              3'h6: pos_word = 16'h3fff;
              3'h7: pos_word = 16'hc085;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf3d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d86;
              3'h2: pos_word = 16'h3f76;
              3'h3: pos_word = 16'h4118;
              3'h4: pos_word = 16'hbfbd;
              3'h5: pos_word = 16'hbe91;
              3'h6: pos_word = 16'h3ee8;
              3'h7: pos_word = 16'h4006;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc076;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf35;
              3'h2: pos_word = 16'h3dad;
              3'h3: pos_word = 16'h3f80;
              3'h4: pos_word = 16'h413a;
              3'h5: pos_word = 16'hbfb5;
              3'h6: pos_word = 16'hbe86;
              3'h7: pos_word = 16'h3ef4;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h400d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc064;
              3'h2: pos_word = 16'hbf2e;
              3'h3: pos_word = 16'h3dd5;
              3'h4: pos_word = 16'h3f85;
              3'h5: pos_word = 16'h4171;
              3'h6: pos_word = 16'hbfae;
              3'h7: pos_word = 16'hbe77;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f00;
            case (mant_lo3)
              3'h1: pos_word = 16'h4015;
              3'h2: pos_word = 16'hc054;
              3'h3: pos_word = 16'hbf27;
              3'h4: pos_word = 16'h3dfd;
              3'h5: pos_word = 16'h3f8a;
              3'h6: pos_word = 16'h41aa;
              3'h7: pos_word = 16'hbfa7;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbe62;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f06;
              3'h2: pos_word = 16'h401d;
              3'h3: pos_word = 16'hc046;
              3'h4: pos_word = 16'hbf20;
              3'h5: pos_word = 16'h3e13;
              3'h6: pos_word = 16'h3f90;
              3'h7: pos_word = 16'h4210;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfa1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe4d;
              3'h2: pos_word = 16'h3f0d;
              3'h3: pos_word = 16'h4026;
              3'h4: pos_word = 16'hc03a;
              3'h5: pos_word = 16'hbf19;
              3'h6: pos_word = 16'h3e27;
              3'h7: pos_word = 16'h3f95;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h42ec;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9b;
              3'h2: pos_word = 16'hbe39;
              3'h3: pos_word = 16'h3f13;
              3'h4: pos_word = 16'h4030;
              3'h5: pos_word = 16'hc02f;
              3'h6: pos_word = 16'hbf12;
              3'h7: pos_word = 16'h3e3b;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f9b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc2b8;
              3'h2: pos_word = 16'hbf95;
              3'h3: pos_word = 16'hbe25;
              3'h4: pos_word = 16'h3f1a;
              3'h5: pos_word = 16'h403b;
              3'h6: pos_word = 16'hc025;
              3'h7: pos_word = 16'hbf0c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'haa: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e50;
            case (mant_lo3)
              3'h1: pos_word = 16'hc205;
              3'h2: pos_word = 16'hbe10;
              3'h3: pos_word = 16'h4048;
              3'h4: pos_word = 16'hbf05;
              3'h5: pos_word = 16'h3fa8;
              3'h6: pos_word = 16'hbf89;
              3'h7: pos_word = 16'h3f28;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc014;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e7a;
              3'h2: pos_word = 16'hc168;
              3'h3: pos_word = 16'hbdd0;
              3'h4: pos_word = 16'h4066;
              3'h5: pos_word = 16'hbef2;
              3'h6: pos_word = 16'h3fb6;
              3'h7: pos_word = 16'hbf7e;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f36;
            case (mant_lo3)
              3'h1: pos_word = 16'hc005;
              3'h2: pos_word = 16'h3e92;
              3'h3: pos_word = 16'hc114;
              3'h4: pos_word = 16'hbd81;
              3'h5: pos_word = 16'h4087;
              3'h6: pos_word = 16'hbeda;
              3'h7: pos_word = 16'h3fc6;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf6c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f45;
              3'h2: pos_word = 16'hbff2;
              3'h3: pos_word = 16'h3ea8;
              3'h4: pos_word = 16'hc0da;
              3'h5: pos_word = 16'hbcc6;
              3'h6: pos_word = 16'h40a3;
              3'h7: pos_word = 16'hbec3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fd8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5a;
              3'h2: pos_word = 16'h3f56;
              3'h3: pos_word = 16'hbfdd;
              3'h4: pos_word = 16'h3ebe;
              3'h5: pos_word = 16'hc0ab;
              3'h6: pos_word = 16'h3c6d;
              3'h7: pos_word = 16'h40cc;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbead;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fec;
              3'h2: pos_word = 16'hbf49;
              3'h3: pos_word = 16'h3f67;
              3'h4: pos_word = 16'hbfca;
              3'h5: pos_word = 16'h3ed5;
              3'h6: pos_word = 16'hc08d;
              3'h7: pos_word = 16'h3d5a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4108;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe97;
              3'h2: pos_word = 16'h4002;
              3'h3: pos_word = 16'hbf3a;
              3'h4: pos_word = 16'h3f7a;
              3'h5: pos_word = 16'hbfba;
              3'h6: pos_word = 16'h3eec;
              3'h7: pos_word = 16'hc06f;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3dbc;
            case (mant_lo3)
              3'h1: pos_word = 16'h414b;
              3'h2: pos_word = 16'hbe82;
              3'h3: pos_word = 16'h4010;
              3'h4: pos_word = 16'hbf2b;
              3'h5: pos_word = 16'h3f87;
              3'h6: pos_word = 16'hbfac;
              3'h7: pos_word = 16'h3f02;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc04e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e06;
              3'h2: pos_word = 16'h41c9;
              3'h3: pos_word = 16'hbe5a;
              3'h4: pos_word = 16'h4020;
              3'h5: pos_word = 16'hbf1d;
              3'h6: pos_word = 16'h3f92;
              3'h7: pos_word = 16'hbf9e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f0f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc035;
              3'h2: pos_word = 16'h3e2f;
              3'h3: pos_word = 16'h444b;
              3'h4: pos_word = 16'hbe31;
              3'h5: pos_word = 16'h4034;
              3'h6: pos_word = 16'hbf10;
              3'h7: pos_word = 16'h3f9e;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1c;
              3'h2: pos_word = 16'hc021;
              3'h3: pos_word = 16'h3e58;
              3'h4: pos_word = 16'hc1d6;
              3'h5: pos_word = 16'hbe09;
              3'h6: pos_word = 16'h404d;
              3'h7: pos_word = 16'hbf03;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fab;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf87;
              3'h2: pos_word = 16'h3f2a;
              3'h3: pos_word = 16'hc011;
              3'h4: pos_word = 16'h3e81;
              3'h5: pos_word = 16'hc152;
              3'h6: pos_word = 16'hbdc2;
              3'h7: pos_word = 16'h406c;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbeee;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb9;
              3'h2: pos_word = 16'hbf7b;
              3'h3: pos_word = 16'h3f39;
              3'h4: pos_word = 16'hc003;
              3'h5: pos_word = 16'h3e96;
              3'h6: pos_word = 16'hc10b;
              3'h7: pos_word = 16'hbd64;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h408b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed6;
              3'h2: pos_word = 16'h3fc9;
              3'h3: pos_word = 16'hbf68;
              3'h4: pos_word = 16'h3f48;
              3'h5: pos_word = 16'hbfee;
              3'h6: pos_word = 16'h3eac;
              3'h7: pos_word = 16'hc0cf;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbc8b;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a9;
              3'h2: pos_word = 16'hbebf;
              3'h3: pos_word = 16'h3fdc;
              3'h4: pos_word = 16'hbf57;
              3'h5: pos_word = 16'h3f59;
              3'h6: pos_word = 16'hbfd9;
              3'h7: pos_word = 16'h3ec2;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc0a5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3cb2;
              3'h2: pos_word = 16'h40d6;
              3'h3: pos_word = 16'hbea9;
              3'h4: pos_word = 16'h3ff1;
              3'h5: pos_word = 16'hbf46;
              3'h6: pos_word = 16'h3f6a;
              3'h7: pos_word = 16'hbfc7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hab: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3ed9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d77;
              3'h2: pos_word = 16'hbe93;
              3'h3: pos_word = 16'hbf37;
              3'h4: pos_word = 16'hbfb7;
              3'h5: pos_word = 16'hc068;
              3'h6: pos_word = 16'h4160;
              3'h7: pos_word = 16'h4013;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f89;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f05;
              3'h2: pos_word = 16'h3e0e;
              3'h3: pos_word = 16'hbe53;
              3'h4: pos_word = 16'hbf1b;
              3'h5: pos_word = 16'hbf9c;
              3'h6: pos_word = 16'hc031;
              3'h7: pos_word = 16'hc327;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4038;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa0;
              3'h2: pos_word = 16'h3f1f;
              3'h3: pos_word = 16'h3e5f;
              3'h4: pos_word = 16'hbe01;
              3'h5: pos_word = 16'hbf01;
              3'h6: pos_word = 16'hbf86;
              3'h7: pos_word = 16'hc00e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc140;
            case (mant_lo3)
              3'h1: pos_word = 16'h4073;
              3'h2: pos_word = 16'h3fbc;
              3'h3: pos_word = 16'h3f3c;
              3'h4: pos_word = 16'h3e9a;
              3'h5: pos_word = 16'hbd46;
              3'h6: pos_word = 16'hbed2;
              3'h7: pos_word = 16'hbf65;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbfea;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c6;
              3'h2: pos_word = 16'h40b0;
              3'h3: pos_word = 16'h3fdf;
              3'h4: pos_word = 16'h3f5c;
              3'h5: pos_word = 16'h3ec6;
              3'h6: pos_word = 16'h3ced;
              3'h7: pos_word = 16'hbea5;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf43;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc4;
              3'h2: pos_word = 16'hc084;
              3'h3: pos_word = 16'h411b;
              3'h4: pos_word = 16'h4007;
              3'h5: pos_word = 16'h3f80;
              3'h6: pos_word = 16'h3ef5;
              3'h7: pos_word = 16'h3dda;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe74;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf26;
              3'h2: pos_word = 16'hbfa6;
              3'h3: pos_word = 16'hc044;
              3'h4: pos_word = 16'h421d;
              3'h5: pos_word = 16'h4027;
              3'h6: pos_word = 16'h3f96;
              3'h7: pos_word = 16'h3f14;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e3e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe22;
              3'h2: pos_word = 16'hbf0b;
              3'h3: pos_word = 16'hbf8e;
              3'h4: pos_word = 16'hc01b;
              3'h5: pos_word = 16'hc19a;
              3'h6: pos_word = 16'h4058;
              3'h7: pos_word = 16'h3fb0;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f30;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e89;
              3'h2: pos_word = 16'hbda4;
              3'h3: pos_word = 16'hbee5;
              3'h4: pos_word = 16'hbf74;
              3'h5: pos_word = 16'hbffc;
              3'h6: pos_word = 16'hc0f6;
              3'h7: pos_word = 16'h4095;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fd0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4e;
              3'h2: pos_word = 16'h3eb4;
              3'h3: pos_word = 16'hbb22;
              3'h4: pos_word = 16'hbeb7;
              3'h5: pos_word = 16'hbf50;
              3'h6: pos_word = 16'hbfd2;
              3'h7: pos_word = 16'hc099;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h40ed;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff9;
              3'h2: pos_word = 16'h3f71;
              3'h3: pos_word = 16'h3ee2;
              3'h4: pos_word = 16'h3d99;
              3'h5: pos_word = 16'hbe8b;
              3'h6: pos_word = 16'hbf31;
              3'h7: pos_word = 16'hbfb2;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc05c;
            case (mant_lo3)
              3'h1: pos_word = 16'h418d;
              3'h2: pos_word = 16'h4019;
              3'h3: pos_word = 16'h3f8d;
              3'h4: pos_word = 16'h3f09;
              3'h5: pos_word = 16'h3e1d;
              3'h6: pos_word = 16'hbe43;
              3'h7: pos_word = 16'hbf16;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf98;
            case (mant_lo3)
              3'h1: pos_word = 16'hc02a;
              3'h2: pos_word = 16'hc243;
              3'h3: pos_word = 16'h4041;
              3'h4: pos_word = 16'h3fa5;
              3'h5: pos_word = 16'h3f24;
              3'h6: pos_word = 16'h3e6f;
              3'h7: pos_word = 16'hbde5;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbef8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf82;
              3'h2: pos_word = 16'hc009;
              3'h3: pos_word = 16'hc123;
              3'h4: pos_word = 16'h4081;
              3'h5: pos_word = 16'h3fc2;
              3'h6: pos_word = 16'h3f41;
              3'h7: pos_word = 16'h3ea2;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbd0b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec9;
              3'h2: pos_word = 16'hbf5e;
              3'h3: pos_word = 16'hbfe2;
              3'h4: pos_word = 16'hc0b5;
              3'h5: pos_word = 16'h40c0;
              3'h6: pos_word = 16'h3fe7;
              3'h7: pos_word = 16'h3f63;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3ecf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d32;
              3'h2: pos_word = 16'hbe9d;
              3'h3: pos_word = 16'hbf3e;
              3'h4: pos_word = 16'hbfbe;
              3'h5: pos_word = 16'hc078;
              3'h6: pos_word = 16'h4135;
              3'h7: pos_word = 16'h400c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hac: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f84;
            case (mant_lo3)
              3'h1: pos_word = 16'h3df8;
              3'h2: pos_word = 16'hbf21;
              3'h3: pos_word = 16'hc03b;
              3'h4: pos_word = 16'h402f;
              3'h5: pos_word = 16'h3f19;
              3'h6: pos_word = 16'hbe13;
              3'h7: pos_word = 16'hbf8a;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc171;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb5;
              3'h2: pos_word = 16'h3e91;
              3'h3: pos_word = 16'hbedc;
              3'h4: pos_word = 16'hbff3;
              3'h5: pos_word = 16'h40a0;
              3'h6: pos_word = 16'h3f55;
              3'h7: pos_word = 16'h3c45;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf4a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc08f;
              3'h2: pos_word = 16'h4001;
              3'h3: pos_word = 16'h3eeb;
              3'h4: pos_word = 16'hbe83;
              3'h5: pos_word = 16'hbfac;
              3'h6: pos_word = 16'h41bd;
              3'h7: pos_word = 16'h3f91;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf11;
              3'h2: pos_word = 16'hc022;
              3'h3: pos_word = 16'h404b;
              3'h4: pos_word = 16'h3f29;
              3'h5: pos_word = 16'hbdc7;
              3'h6: pos_word = 16'hbf7c;
              3'h7: pos_word = 16'hc10e;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fc8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eaa;
              3'h2: pos_word = 16'hbec1;
              3'h3: pos_word = 16'hbfda;
              3'h4: pos_word = 16'h40d2;
              3'h5: pos_word = 16'h3f69;
              3'h6: pos_word = 16'h3d6d;
              3'h7: pos_word = 16'hbf38;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc06a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4012;
              3'h2: pos_word = 16'h3f04;
              3'h3: pos_word = 16'hbe55;
              3'h4: pos_word = 16'hbf9d;
              3'h5: pos_word = 16'hc38e;
              3'h6: pos_word = 16'h3f9f;
              3'h7: pos_word = 16'h3e5d;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf02;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00f;
              3'h2: pos_word = 16'h4071;
              3'h3: pos_word = 16'h3f3b;
              3'h4: pos_word = 16'hbd50;
              3'h5: pos_word = 16'hbf66;
              3'h6: pos_word = 16'hc0c9;
              3'h7: pos_word = 16'h3fde;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ec5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea6;
              3'h2: pos_word = 16'hbfc5;
              3'h3: pos_word = 16'h4118;
              3'h4: pos_word = 16'h3f80;
              3'h5: pos_word = 16'h3dd5;
              3'h6: pos_word = 16'hbf27;
              3'h7: pos_word = 16'hc046;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4026;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f13;
              3'h2: pos_word = 16'hbe25;
              3'h3: pos_word = 16'hbf8f;
              3'h4: pos_word = 16'hc1a2;
              3'h5: pos_word = 16'h3faf;
              3'h6: pos_word = 16'h3e87;
              3'h7: pos_word = 16'hbee6;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbffe;
            case (mant_lo3)
              3'h1: pos_word = 16'h4093;
              3'h2: pos_word = 16'h3f4d;
              3'h3: pos_word = 16'hbba2;
              3'h4: pos_word = 16'hbf52;
              3'h5: pos_word = 16'hc09b;
              3'h6: pos_word = 16'h3ff8;
              3'h7: pos_word = 16'h3ee0;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe8d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb3;
              3'h2: pos_word = 16'h4187;
              3'h3: pos_word = 16'h3f8c;
              3'h4: pos_word = 16'h3e1a;
              3'h5: pos_word = 16'hbf16;
              3'h6: pos_word = 16'hc02b;
              3'h7: pos_word = 16'h4040;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f23;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdea;
              3'h2: pos_word = 16'hbf82;
              3'h3: pos_word = 16'hc127;
              3'h4: pos_word = 16'h3fc1;
              3'h5: pos_word = 16'h3ea1;
              3'h6: pos_word = 16'hbecb;
              3'h7: pos_word = 16'hbfe3;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h40bd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f61;
              3'h2: pos_word = 16'h3d28;
              3'h3: pos_word = 16'hbf3f;
              3'h4: pos_word = 16'hc07b;
              3'h5: pos_word = 16'h400b;
              3'h6: pos_word = 16'h3efd;
              3'h7: pos_word = 16'hbe67;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfa2;
            case (mant_lo3)
              3'h1: pos_word = 16'h4295;
              3'h2: pos_word = 16'h3f9a;
              3'h3: pos_word = 16'h3e4b;
              3'h4: pos_word = 16'hbf07;
              3'h5: pos_word = 16'hc016;
              3'h6: pos_word = 16'h4061;
              3'h7: pos_word = 16'h3f34;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbd8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6e;
              3'h2: pos_word = 16'hc0e1;
              3'h3: pos_word = 16'h3fd6;
              3'h4: pos_word = 16'h3ebb;
              3'h5: pos_word = 16'hbeb0;
              3'h6: pos_word = 16'hbfcd;
              3'h7: pos_word = 16'h4102;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f77;
            case (mant_lo3)
              3'h1: pos_word = 16'h3db2;
              3'h2: pos_word = 16'hbf2d;
              3'h3: pos_word = 16'hc052;
              3'h4: pos_word = 16'h401e;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'hbe37;
              3'h7: pos_word = 16'hbf94;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'had: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc1f6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e7c;
              3'h2: pos_word = 16'hc004;
              3'h3: pos_word = 16'h3f46;
              3'h4: pos_word = 16'hbf59;
              3'h5: pos_word = 16'h3fee;
              3'h6: pos_word = 16'hbe96;
              3'h7: pos_word = 16'h4152;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e09;
            case (mant_lo3)
              3'h1: pos_word = 16'hc034;
              3'h2: pos_word = 16'h3f1d;
              3'h3: pos_word = 16'hbf87;
              3'h4: pos_word = 16'h3fba;
              3'h5: pos_word = 16'hbed5;
              3'h6: pos_word = 16'h40ab;
              3'h7: pos_word = 16'h3cc5;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc087;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ef2;
              3'h2: pos_word = 16'hbfa8;
              3'h3: pos_word = 16'h3f95;
              3'h4: pos_word = 16'hbf0d;
              3'h5: pos_word = 16'h4054;
              3'h6: pos_word = 16'hbdae;
              3'h7: pos_word = 16'hc100;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3eb1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd5;
              3'h2: pos_word = 16'h3f6f;
              3'h3: pos_word = 16'hbf33;
              3'h4: pos_word = 16'h4016;
              3'h5: pos_word = 16'hbe48;
              3'h6: pos_word = 16'hc281;
              3'h7: pos_word = 16'h3e6a;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc00a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3f;
              3'h2: pos_word = 16'hbf60;
              3'h3: pos_word = 16'h3fe4;
              3'h4: pos_word = 16'hbea0;
              3'h5: pos_word = 16'h412b;
              3'h6: pos_word = 16'h3dee;
              3'h7: pos_word = 16'hc03e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f17;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8c;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'hbedf;
              3'h4: pos_word = 16'h409c;
              3'h5: pos_word = 16'h3be7;
              3'h6: pos_word = 16'hc092;
              3'h7: pos_word = 16'h3ee8;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfae;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f90;
              3'h2: pos_word = 16'hbf12;
              3'h3: pos_word = 16'h4047;
              3'h4: pos_word = 16'hbdd1;
              3'h5: pos_word = 16'hc115;
              3'h6: pos_word = 16'h3ea7;
              3'h7: pos_word = 16'hbfdd;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f67;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3a;
              3'h2: pos_word = 16'h4010;
              3'h3: pos_word = 16'hbe5b;
              3'h4: pos_word = 16'h4432;
              3'h5: pos_word = 16'h3e58;
              3'h6: pos_word = 16'hc011;
              3'h7: pos_word = 16'h3f39;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf68;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fdc;
              3'h2: pos_word = 16'hbea9;
              3'h3: pos_word = 16'h4111;
              3'h4: pos_word = 16'h3dcb;
              3'h5: pos_word = 16'hc049;
              3'h6: pos_word = 16'h3f11;
              3'h7: pos_word = 16'hbf90;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fad;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee9;
              3'h2: pos_word = 16'h4090;
              3'h3: pos_word = 16'hbc22;
              3'h4: pos_word = 16'hc09f;
              3'h5: pos_word = 16'h3edd;
              3'h6: pos_word = 16'hbfb5;
              3'h7: pos_word = 16'h3f8b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf18;
            case (mant_lo3)
              3'h1: pos_word = 16'h403c;
              3'h2: pos_word = 16'hbdf4;
              3'h3: pos_word = 16'hc131;
              3'h4: pos_word = 16'h3e9e;
              3'h5: pos_word = 16'hbfe6;
              3'h6: pos_word = 16'h3f5f;
              3'h7: pos_word = 16'hbf41;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4009;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe6d;
              3'h2: pos_word = 16'h425a;
              3'h3: pos_word = 16'h3e46;
              3'h4: pos_word = 16'hc018;
              3'h5: pos_word = 16'h3f32;
              3'h6: pos_word = 16'hbf70;
              3'h7: pos_word = 16'h3fd3;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbeb3;
            case (mant_lo3)
              3'h1: pos_word = 16'h40fb;
              3'h2: pos_word = 16'h3da8;
              3'h3: pos_word = 16'hc056;
              3'h4: pos_word = 16'h3f0c;
              3'h5: pos_word = 16'hbf95;
              3'h6: pos_word = 16'h3fa7;
              3'h7: pos_word = 16'hbef4;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4085;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcdc;
              3'h2: pos_word = 16'hc0ae;
              3'h3: pos_word = 16'h3ed3;
              3'h4: pos_word = 16'hbfbb;
              3'h5: pos_word = 16'h3f86;
              3'h6: pos_word = 16'hbf1e;
              3'h7: pos_word = 16'h4032;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe0c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc15a;
              3'h2: pos_word = 16'h3e94;
              3'h3: pos_word = 16'hbfef;
              3'h4: pos_word = 16'h3f58;
              3'h5: pos_word = 16'hbf47;
              3'h6: pos_word = 16'h4003;
              3'h7: pos_word = 16'hbe7f;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h41e3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e34;
              3'h2: pos_word = 16'hc01f;
              3'h3: pos_word = 16'h3f2c;
              3'h4: pos_word = 16'hbf79;
              3'h5: pos_word = 16'h3fcb;
              3'h6: pos_word = 16'hbebd;
              3'h7: pos_word = 16'h40dd;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hae: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3d85;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f06;
              3'h2: pos_word = 16'h3fa1;
              3'h3: pos_word = 16'h4078;
              3'h4: pos_word = 16'hc0c0;
              3'h5: pos_word = 16'hbfc2;
              3'h6: pos_word = 16'hbf24;
              3'h7: pos_word = 16'hbe1d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e8b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f50;
              3'h2: pos_word = 16'h3ffc;
              3'h3: pos_word = 16'h4199;
              3'h4: pos_word = 16'hc027;
              3'h5: pos_word = 16'hbf81;
              3'h6: pos_word = 16'hbec6;
              3'h7: pos_word = 16'h3d45;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f01;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9c;
              3'h2: pos_word = 16'h4068;
              3'h3: pos_word = 16'hc0d6;
              3'h4: pos_word = 16'hbfc9;
              3'h5: pos_word = 16'hbf2a;
              3'h6: pos_word = 16'hbe2f;
              3'h7: pos_word = 16'h3e82;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f49;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff2;
              3'h2: pos_word = 16'h4167;
              3'h3: pos_word = 16'hc030;
              3'h4: pos_word = 16'hbf85;
              3'h5: pos_word = 16'hbed0;
              3'h6: pos_word = 16'h3cff;
              3'h7: pos_word = 16'h3ef7;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f97;
            case (mant_lo3)
              3'h1: pos_word = 16'h4059;
              3'h2: pos_word = 16'hc0f2;
              3'h3: pos_word = 16'hbfd1;
              3'h4: pos_word = 16'hbf31;
              3'h5: pos_word = 16'hbe41;
              3'h6: pos_word = 16'h3e71;
              3'h7: pos_word = 16'h3f42;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3fe8;
            case (mant_lo3)
              3'h1: pos_word = 16'h4139;
              3'h2: pos_word = 16'hc03a;
              3'h3: pos_word = 16'hbf8a;
              3'h4: pos_word = 16'hbedb;
              3'h5: pos_word = 16'h3c67;
              3'h6: pos_word = 16'h3eec;
              3'h7: pos_word = 16'h3f92;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h404c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc10b;
              3'h2: pos_word = 16'hbfd9;
              3'h3: pos_word = 16'hbf37;
              3'h4: pos_word = 16'hbe53;
              3'h5: pos_word = 16'h3e5f;
              3'h6: pos_word = 16'h3f3c;
              3'h7: pos_word = 16'h3fdf;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h411b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc045;
              3'h2: pos_word = 16'hbf8e;
              3'h3: pos_word = 16'hbee5;
              3'h4: pos_word = 16'hbb38;
              3'h5: pos_word = 16'h3ee2;
              3'h6: pos_word = 16'h3f8d;
              3'h7: pos_word = 16'h4041;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc124;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe2;
              3'h2: pos_word = 16'hbf3e;
              3'h3: pos_word = 16'hbe65;
              3'h4: pos_word = 16'h3e4d;
              3'h5: pos_word = 16'h3f35;
              3'h6: pos_word = 16'h3fd7;
              3'h7: pos_word = 16'h4105;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc051;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf93;
              3'h2: pos_word = 16'hbeef;
              3'h3: pos_word = 16'hbca2;
              3'h4: pos_word = 16'h3ed7;
              3'h5: pos_word = 16'h3f88;
              3'h6: pos_word = 16'h4036;
              3'h7: pos_word = 16'hc146;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfeb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf45;
              3'h2: pos_word = 16'hbe77;
              3'h3: pos_word = 16'h3e3b;
              3'h4: pos_word = 16'h3f2f;
              3'h5: pos_word = 16'h3fcf;
              3'h6: pos_word = 16'h40e8;
              3'h7: pos_word = 16'hc05e;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf98;
            case (mant_lo3)
              3'h1: pos_word = 16'hbefa;
              3'h2: pos_word = 16'hbd16;
              3'h3: pos_word = 16'h3ecd;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'h402d;
              3'h6: pos_word = 16'hc17c;
              3'h7: pos_word = 16'hbff5;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf4c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe85;
              3'h2: pos_word = 16'h3e29;
              3'h3: pos_word = 16'h3f28;
              3'h4: pos_word = 16'h3fc7;
              3'h5: pos_word = 16'h40ce;
              3'h6: pos_word = 16'hc06d;
              3'h7: pos_word = 16'hbf9e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf02;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd5c;
              3'h2: pos_word = 16'h3ec3;
              3'h3: pos_word = 16'h3f7e;
              3'h4: pos_word = 16'h4024;
              3'h5: pos_word = 16'hc1ac;
              3'h6: pos_word = 16'hc000;
              3'h7: pos_word = 16'hbf53;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe8e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e17;
              3'h2: pos_word = 16'h3f22;
              3'h3: pos_word = 16'h3fc0;
              3'h4: pos_word = 16'h40ba;
              3'h5: pos_word = 16'hc07e;
              3'h6: pos_word = 16'hbfa3;
              3'h7: pos_word = 16'hbf08;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbd91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb9;
              3'h2: pos_word = 16'h3f76;
              3'h3: pos_word = 16'h401d;
              3'h4: pos_word = 16'hc207;
              3'h5: pos_word = 16'hc005;
              3'h6: pos_word = 16'hbf5a;
              3'h7: pos_word = 16'hbe98;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'haf: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e06;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb9;
              3'h2: pos_word = 16'hc089;
              3'h3: pos_word = 16'hbf0e;
              3'h4: pos_word = 16'h3eb0;
              3'h5: pos_word = 16'h4015;
              3'h6: pos_word = 16'hc00b;
              3'h7: pos_word = 16'hbea1;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f16;
            case (mant_lo3)
              3'h1: pos_word = 16'h409a;
              3'h2: pos_word = 16'hbfaf;
              3'h3: pos_word = 16'hbdd7;
              3'h4: pos_word = 16'h3f66;
              3'h5: pos_word = 16'h436d;
              3'h6: pos_word = 16'hbf6a;
              3'h7: pos_word = 16'h3dc5;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3fac;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a1;
              3'h2: pos_word = 16'hbf19;
              3'h3: pos_word = 16'h3e9c;
              3'h4: pos_word = 16'h4008;
              3'h5: pos_word = 16'hc019;
              3'h6: pos_word = 16'hbeb4;
              3'h7: pos_word = 16'h3f0b;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4084;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbc;
              3'h2: pos_word = 16'hbe0f;
              3'h3: pos_word = 16'h3f56;
              3'h4: pos_word = 16'h41d2;
              3'h5: pos_word = 16'hbf7a;
              3'h6: pos_word = 16'h3d7f;
              3'h7: pos_word = 16'h3fa1;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc0c3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf25;
              3'h2: pos_word = 16'h3e8a;
              3'h3: pos_word = 16'h3ffa;
              3'h4: pos_word = 16'hc029;
              3'h5: pos_word = 16'hbec8;
              3'h6: pos_word = 16'h3f00;
              3'h7: pos_word = 16'h4065;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfcb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe32;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'h415e;
              3'h4: pos_word = 16'hbf86;
              3'h5: pos_word = 16'h3ce8;
              3'h6: pos_word = 16'h3f96;
              3'h7: pos_word = 16'hc0f8;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf32;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e6e;
              3'h2: pos_word = 16'h3fe7;
              3'h3: pos_word = 16'hc03c;
              3'h4: pos_word = 16'hbedc;
              3'h5: pos_word = 16'h3eea;
              3'h6: pos_word = 16'h404a;
              3'h7: pos_word = 16'hbfdb;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe56;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'h4117;
              3'h3: pos_word = 16'hbf8f;
              3'h4: pos_word = 16'hbbb8;
              3'h5: pos_word = 16'h3f8c;
              3'h6: pos_word = 16'hc129;
              3'h7: pos_word = 16'hbf3f;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3e4a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd5;
              3'h2: pos_word = 16'hc053;
              3'h3: pos_word = 16'hbef1;
              3'h4: pos_word = 16'h3ed6;
              3'h5: pos_word = 16'h4035;
              3'h6: pos_word = 16'hbfed;
              3'h7: pos_word = 16'hbe7a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f2d;
            case (mant_lo3)
              3'h1: pos_word = 16'h40e4;
              3'h2: pos_word = 16'hbf99;
              3'h3: pos_word = 16'hbd22;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'hc184;
              3'h6: pos_word = 16'hbf4d;
              3'h7: pos_word = 16'h3e26;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3fc6;
            case (mant_lo3)
              3'h1: pos_word = 16'hc06f;
              3'h2: pos_word = 16'hbf03;
              3'h3: pos_word = 16'h3ec1;
              3'h4: pos_word = 16'h4023;
              3'h5: pos_word = 16'hc001;
              3'h6: pos_word = 16'hbe90;
              3'h7: pos_word = 16'h3f21;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h40b7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa4;
              3'h2: pos_word = 16'hbd97;
              3'h3: pos_word = 16'h3f74;
              3'h4: pos_word = 16'hc215;
              3'h5: pos_word = 16'hbf5b;
              3'h6: pos_word = 16'h3e03;
              3'h7: pos_word = 16'h3fb8;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc08a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0f;
              3'h2: pos_word = 16'h3eae;
              3'h3: pos_word = 16'h4014;
              3'h4: pos_word = 16'hc00c;
              3'h5: pos_word = 16'hbea3;
              3'h6: pos_word = 16'h3f15;
              3'h7: pos_word = 16'h4098;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfb0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbddc;
              3'h2: pos_word = 16'h3f64;
              3'h3: pos_word = 16'h430e;
              3'h4: pos_word = 16'hbf6b;
              3'h5: pos_word = 16'h3dbf;
              3'h6: pos_word = 16'h3fab;
              3'h7: pos_word = 16'hc0a3;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf1a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e9b;
              3'h2: pos_word = 16'h4007;
              3'h3: pos_word = 16'hc01a;
              3'h4: pos_word = 16'hbeb6;
              3'h5: pos_word = 16'h3f0a;
              3'h6: pos_word = 16'h4082;
              3'h7: pos_word = 16'hbfbd;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe11;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f55;
              3'h2: pos_word = 16'h41c4;
              3'h3: pos_word = 16'hbf7b;
              3'h4: pos_word = 16'h3d73;
              3'h5: pos_word = 16'h3fa0;
              3'h6: pos_word = 16'hc0c7;
              3'h7: pos_word = 16'hbf26;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb0: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e88;
            case (mant_lo3)
              3'h1: pos_word = 16'hc02a;
              3'h2: pos_word = 16'h3efe;
              3'h3: pos_word = 16'hbfcc;
              3'h4: pos_word = 16'h3f47;
              3'h5: pos_word = 16'hbf86;
              3'h6: pos_word = 16'h3f95;
              3'h7: pos_word = 16'hbf33;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fe5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbede;
              3'h2: pos_word = 16'h4048;
              3'h3: pos_word = 16'hbe59;
              3'h4: pos_word = 16'h4113;
              3'h5: pos_word = 16'hbc0a;
              3'h6: pos_word = 16'hc12e;
              3'h7: pos_word = 16'h3e47;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc055;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed4;
              3'h2: pos_word = 16'hbfee;
              3'h3: pos_word = 16'h3f2c;
              3'h4: pos_word = 16'hbf9a;
              3'h5: pos_word = 16'h3f82;
              3'h6: pos_word = 16'hbf4e;
              3'h7: pos_word = 16'h3fc5;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf04;
            case (mant_lo3)
              3'h1: pos_word = 16'h4022;
              3'h2: pos_word = 16'hbe91;
              3'h3: pos_word = 16'h40b4;
              3'h4: pos_word = 16'hbd9c;
              3'h5: pos_word = 16'hc226;
              3'h6: pos_word = 16'h3e00;
              3'h7: pos_word = 16'hc08c;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3eac;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00d;
              3'h2: pos_word = 16'h3f14;
              3'h3: pos_word = 16'hbfb1;
              3'h4: pos_word = 16'h3f63;
              3'h5: pos_word = 16'hbf6c;
              3'h6: pos_word = 16'h3faa;
              3'h7: pos_word = 16'hbf1b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4006;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb8;
              3'h2: pos_word = 16'h4080;
              3'h3: pos_word = 16'hbe14;
              3'h4: pos_word = 16'h41b7;
              3'h5: pos_word = 16'h3d68;
              3'h6: pos_word = 16'hc0cb;
              3'h7: pos_word = 16'h3e87;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc02c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efc;
              3'h2: pos_word = 16'hbfcd;
              3'h3: pos_word = 16'h3f46;
              3'h4: pos_word = 16'hbf87;
              3'h5: pos_word = 16'h3f94;
              3'h6: pos_word = 16'hbf34;
              3'h7: pos_word = 16'h3fe4;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbee0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4047;
              3'h2: pos_word = 16'hbe5c;
              3'h3: pos_word = 16'h410f;
              3'h4: pos_word = 16'hbc38;
              3'h5: pos_word = 16'hc133;
              3'h6: pos_word = 16'h3e44;
              3'h7: pos_word = 16'hc057;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3ed2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff0;
              3'h2: pos_word = 16'h3f2b;
              3'h3: pos_word = 16'hbf9b;
              3'h4: pos_word = 16'h3f81;
              3'h5: pos_word = 16'hbf4f;
              3'h6: pos_word = 16'h3fc3;
              3'h7: pos_word = 16'hbf05;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4020;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe93;
              3'h2: pos_word = 16'h40b1;
              3'h3: pos_word = 16'hbda2;
              3'h4: pos_word = 16'hc23c;
              3'h5: pos_word = 16'h3dfa;
              3'h6: pos_word = 16'hc08e;
              3'h7: pos_word = 16'h3eab;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc00f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f13;
              3'h2: pos_word = 16'hbfb2;
              3'h3: pos_word = 16'h3f62;
              3'h4: pos_word = 16'hbf6e;
              3'h5: pos_word = 16'h3fa9;
              3'h6: pos_word = 16'hbf1c;
              3'h7: pos_word = 16'h4005;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbeb9;
            case (mant_lo3)
              3'h1: pos_word = 16'h407e;
              3'h2: pos_word = 16'hbe17;
              3'h3: pos_word = 16'h41ac;
              3'h4: pos_word = 16'h3d5c;
              3'h5: pos_word = 16'hc0ce;
              3'h6: pos_word = 16'h3e85;
              3'h7: pos_word = 16'hc02d;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3efa;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfcf;
              3'h2: pos_word = 16'h3f45;
              3'h3: pos_word = 16'hbf88;
              3'h4: pos_word = 16'h3f93;
              3'h5: pos_word = 16'hbf35;
              3'h6: pos_word = 16'h3fe2;
              3'h7: pos_word = 16'hbee1;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4045;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5f;
              3'h2: pos_word = 16'h410b;
              3'h3: pos_word = 16'hbc66;
              3'h4: pos_word = 16'hc139;
              3'h5: pos_word = 16'h3e41;
              3'h6: pos_word = 16'hc059;
              3'h7: pos_word = 16'h3ed1;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbff2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2a;
              3'h2: pos_word = 16'hbf9c;
              3'h3: pos_word = 16'h3f81;
              3'h4: pos_word = 16'hbf50;
              3'h5: pos_word = 16'h3fc2;
              3'h6: pos_word = 16'hbf06;
              3'h7: pos_word = 16'h401f;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe94;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ae;
              3'h2: pos_word = 16'hbda8;
              3'h3: pos_word = 16'hc259;
              3'h4: pos_word = 16'h3df4;
              3'h5: pos_word = 16'hc090;
              3'h6: pos_word = 16'h3ea9;
              3'h7: pos_word = 16'hc010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb1: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f12;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f60;
              3'h2: pos_word = 16'h3fa8;
              3'h3: pos_word = 16'h4004;
              3'h4: pos_word = 16'h407b;
              3'h5: pos_word = 16'h41a2;
              3'h6: pos_word = 16'hc0d2;
              3'h7: pos_word = 16'hc02f;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbfd0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf89;
              3'h2: pos_word = 16'hbf36;
              3'h3: pos_word = 16'hbee3;
              3'h4: pos_word = 16'hbe62;
              3'h5: pos_word = 16'hbc8a;
              3'h6: pos_word = 16'h3e3e;
              3'h7: pos_word = 16'h3ecf;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f29;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f80;
              3'h2: pos_word = 16'h3fc1;
              3'h3: pos_word = 16'h401e;
              3'h4: pos_word = 16'h40ab;
              3'h5: pos_word = 16'hc280;
              3'h6: pos_word = 16'hc092;
              3'h7: pos_word = 16'hc011;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfb4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf70;
              3'h2: pos_word = 16'hbf1e;
              3'h3: pos_word = 16'hbebc;
              3'h4: pos_word = 16'hbe1d;
              3'h5: pos_word = 16'h3d45;
              3'h6: pos_word = 16'h3e82;
              3'h7: pos_word = 16'h3ef7;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f42;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f92;
              3'h2: pos_word = 16'h3fdf;
              3'h3: pos_word = 16'h4041;
              3'h4: pos_word = 16'h4105;
              3'h5: pos_word = 16'hc146;
              3'h6: pos_word = 16'hc05e;
              3'h7: pos_word = 16'hbff5;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf53;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'hbe98;
              3'h4: pos_word = 16'hbdb3;
              3'h5: pos_word = 16'h3de8;
              3'h6: pos_word = 16'h3ea6;
              3'h7: pos_word = 16'h3f10;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f5e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa6;
              3'h2: pos_word = 16'h4003;
              3'h3: pos_word = 16'h4075;
              3'h4: pos_word = 16'h4191;
              3'h5: pos_word = 16'hc0da;
              3'h6: pos_word = 16'hc032;
              3'h7: pos_word = 16'hbfd3;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf8a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf38;
              3'h2: pos_word = 16'hbee7;
              3'h3: pos_word = 16'hbe68;
              3'h4: pos_word = 16'hbcb8;
              3'h5: pos_word = 16'h3e38;
              3'h6: pos_word = 16'h3ecc;
              3'h7: pos_word = 16'h3f27;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f7d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbf;
              3'h2: pos_word = 16'h401b;
              3'h3: pos_word = 16'h40a6;
              3'h4: pos_word = 16'hc2c8;
              3'h5: pos_word = 16'hc096;
              3'h6: pos_word = 16'hc013;
              3'h7: pos_word = 16'hbfb7;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf73;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf20;
              3'h2: pos_word = 16'hbec0;
              3'h3: pos_word = 16'hbe23;
              3'h4: pos_word = 16'h3d2e;
              3'h5: pos_word = 16'h3e7e;
              3'h6: pos_word = 16'h3ef3;
              3'h7: pos_word = 16'h3f40;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f90;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fdc;
              3'h2: pos_word = 16'h403d;
              3'h3: pos_word = 16'h40fe;
              3'h4: pos_word = 16'hc155;
              3'h5: pos_word = 16'hc063;
              3'h6: pos_word = 16'hbff8;
              3'h7: pos_word = 16'hbfa0;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf55;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0a;
              3'h2: pos_word = 16'hbe9b;
              3'h3: pos_word = 16'hbdbf;
              3'h4: pos_word = 16'h3ddd;
              3'h5: pos_word = 16'h3ea3;
              3'h6: pos_word = 16'h3f0f;
              3'h7: pos_word = 16'h3f5b;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fa4;
            case (mant_lo3)
              3'h1: pos_word = 16'h4001;
              3'h2: pos_word = 16'h4070;
              3'h3: pos_word = 16'h4184;
              3'h4: pos_word = 16'hc0e3;
              3'h5: pos_word = 16'hc035;
              3'h6: pos_word = 16'hbfd5;
              3'h7: pos_word = 16'hbf8c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf3a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeea;
              3'h2: pos_word = 16'hbe6e;
              3'h3: pos_word = 16'hbce6;
              3'h4: pos_word = 16'h3e32;
              3'h5: pos_word = 16'h3ec8;
              3'h6: pos_word = 16'h3f25;
              3'h7: pos_word = 16'h3f7a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fbc;
            case (mant_lo3)
              3'h1: pos_word = 16'h4019;
              3'h2: pos_word = 16'h40a1;
              3'h3: pos_word = 16'hc364;
              3'h4: pos_word = 16'hc09a;
              3'h5: pos_word = 16'hc015;
              3'h6: pos_word = 16'hbfb9;
              3'h7: pos_word = 16'hbf76;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec3;
              3'h2: pos_word = 16'hbe29;
              3'h3: pos_word = 16'h3d17;
              3'h4: pos_word = 16'h3e78;
              3'h5: pos_word = 16'h3ef0;
              3'h6: pos_word = 16'h3f3e;
              3'h7: pos_word = 16'h3f8e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb2: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fda;
            case (mant_lo3)
              3'h1: pos_word = 16'h40f3;
              3'h2: pos_word = 16'hc068;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'hbf0c;
              3'h5: pos_word = 16'hbdcb;
              3'h6: pos_word = 16'h3ea0;
              3'h7: pos_word = 16'h3f59;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3ffe;
            case (mant_lo3)
              3'h1: pos_word = 16'h4171;
              3'h2: pos_word = 16'hc038;
              3'h3: pos_word = 16'hbf8d;
              3'h4: pos_word = 16'hbeee;
              3'h5: pos_word = 16'hbd0a;
              3'h6: pos_word = 16'h3ec5;
              3'h7: pos_word = 16'h3f77;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4017;
            case (mant_lo3)
              3'h1: pos_word = 16'h444a;
              3'h2: pos_word = 16'hc018;
              3'h3: pos_word = 16'hbf78;
              3'h4: pos_word = 16'hbec6;
              3'h5: pos_word = 16'h3d00;
              3'h6: pos_word = 16'h3eec;
              3'h7: pos_word = 16'h3f8d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4037;
            case (mant_lo3)
              3'h1: pos_word = 16'hc17b;
              3'h2: pos_word = 16'hbfff;
              3'h3: pos_word = 16'hbf5a;
              3'h4: pos_word = 16'hbea1;
              3'h5: pos_word = 16'h3dc6;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h3fa1;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4065;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0f7;
              3'h2: pos_word = 16'hbfdb;
              3'h3: pos_word = 16'hbf3f;
              3'h4: pos_word = 16'hbe7a;
              3'h5: pos_word = 16'h3e26;
              3'h6: pos_word = 16'h3f21;
              3'h7: pos_word = 16'h3fb8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4098;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a3;
              3'h2: pos_word = 16'hbfbd;
              3'h3: pos_word = 16'hbf26;
              3'h4: pos_word = 16'hbe35;
              3'h5: pos_word = 16'h3e6b;
              3'h6: pos_word = 16'h3f39;
              3'h7: pos_word = 16'h3fd4;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h40df;
            case (mant_lo3)
              3'h1: pos_word = 16'hc072;
              3'h2: pos_word = 16'hbfa5;
              3'h3: pos_word = 16'hbf0f;
              3'h4: pos_word = 16'hbde2;
              3'h5: pos_word = 16'h3e99;
              3'h6: pos_word = 16'h3f54;
              3'h7: pos_word = 16'h3ff7;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h414e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03f;
              3'h2: pos_word = 16'hbf91;
              3'h3: pos_word = 16'hbef5;
              3'h4: pos_word = 16'hbd38;
              3'h5: pos_word = 16'h3ebe;
              3'h6: pos_word = 16'h3f72;
              3'h7: pos_word = 16'h4012;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h42a0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01c;
              3'h2: pos_word = 16'hbf7e;
              3'h3: pos_word = 16'hbecd;
              3'h4: pos_word = 16'h3ca4;
              3'h5: pos_word = 16'h3ee5;
              3'h6: pos_word = 16'h3f8a;
              3'h7: pos_word = 16'h4030;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc198;
            case (mant_lo3)
              3'h1: pos_word = 16'hc003;
              3'h2: pos_word = 16'hbf5f;
              3'h3: pos_word = 16'hbea7;
              3'h4: pos_word = 16'h3dae;
              3'h5: pos_word = 16'h3f07;
              3'h6: pos_word = 16'h3f9d;
              3'h7: pos_word = 16'h405c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc108;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe0;
              3'h2: pos_word = 16'hbf43;
              3'h3: pos_word = 16'hbe83;
              3'h4: pos_word = 16'h3e1b;
              3'h5: pos_word = 16'h3f1d;
              3'h6: pos_word = 16'h3fb4;
              3'h7: pos_word = 16'h4090;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc0ae;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc2;
              3'h2: pos_word = 16'hbf2a;
              3'h3: pos_word = 16'hbe41;
              3'h4: pos_word = 16'h3e5f;
              3'h5: pos_word = 16'h3f35;
              3'h6: pos_word = 16'h3fcf;
              3'h7: pos_word = 16'h40cf;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc07e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa9;
              3'h2: pos_word = 16'hbf13;
              3'h3: pos_word = 16'hbdf9;
              3'h4: pos_word = 16'h3e93;
              3'h5: pos_word = 16'h3f4f;
              3'h6: pos_word = 16'h3ff0;
              3'h7: pos_word = 16'h4134;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc046;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf94;
              3'h2: pos_word = 16'hbefc;
              3'h3: pos_word = 16'hbd66;
              3'h4: pos_word = 16'h3eb8;
              3'h5: pos_word = 16'h3f6c;
              3'h6: pos_word = 16'h400e;
              3'h7: pos_word = 16'h4229;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc022;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf82;
              3'h2: pos_word = 16'hbed4;
              3'h3: pos_word = 16'h3c10;
              3'h4: pos_word = 16'h3ede;
              3'h5: pos_word = 16'h3f87;
              3'h6: pos_word = 16'h402a;
              3'h7: pos_word = 16'hc1c2;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc007;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf64;
              3'h2: pos_word = 16'hbeae;
              3'h3: pos_word = 16'h3d97;
              3'h4: pos_word = 16'h3f03;
              3'h5: pos_word = 16'h3f99;
              3'h6: pos_word = 16'h4053;
              3'h7: pos_word = 16'hc116;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb3: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbfe6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe89;
              3'h2: pos_word = 16'h3f19;
              3'h3: pos_word = 16'h4089;
              3'h4: pos_word = 16'hbfc7;
              3'h5: pos_word = 16'hbe4d;
              3'h6: pos_word = 16'h3f31;
              3'h7: pos_word = 16'h40c0;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbfad;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe08;
              3'h2: pos_word = 16'h3f4b;
              3'h3: pos_word = 16'h4120;
              3'h4: pos_word = 16'hbf97;
              3'h5: pos_word = 16'hbd8a;
              3'h6: pos_word = 16'h3f67;
              3'h7: pos_word = 16'h41e5;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf85;
            case (mant_lo3)
              3'h1: pos_word = 16'hbb22;
              3'h2: pos_word = 16'h3f84;
              3'h3: pos_word = 16'hc205;
              3'h4: pos_word = 16'hbf69;
              3'h5: pos_word = 16'h3d80;
              3'h6: pos_word = 16'h3f96;
              3'h7: pos_word = 16'hc128;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf4d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e03;
              3'h2: pos_word = 16'h3fab;
              3'h3: pos_word = 16'hc0c6;
              3'h4: pos_word = 16'hbf33;
              3'h5: pos_word = 16'h3e47;
              3'h6: pos_word = 16'h3fc5;
              3'h7: pos_word = 16'hc08c;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf1b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e87;
              3'h2: pos_word = 16'h3fe4;
              3'h3: pos_word = 16'hc057;
              3'h4: pos_word = 16'hbf05;
              3'h5: pos_word = 16'h3eab;
              3'h6: pos_word = 16'h4006;
              3'h7: pos_word = 16'hc02d;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbee1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed1;
              3'h2: pos_word = 16'h401f;
              3'h3: pos_word = 16'hc00f;
              3'h4: pos_word = 16'hbebb;
              3'h5: pos_word = 16'h3ef9;
              3'h6: pos_word = 16'h4043;
              3'h7: pos_word = 16'hbff3;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe96;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f12;
              3'h2: pos_word = 16'h4078;
              3'h3: pos_word = 16'hbfd1;
              3'h4: pos_word = 16'hbe65;
              3'h5: pos_word = 16'h3f28;
              3'h6: pos_word = 16'h40a9;
              3'h7: pos_word = 16'hbfb5;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe20;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f41;
              3'h2: pos_word = 16'h4102;
              3'h3: pos_word = 16'hbf9f;
              3'h4: pos_word = 16'hbdb9;
              3'h5: pos_word = 16'h3f5d;
              3'h6: pos_word = 16'h418b;
              3'h7: pos_word = 16'hbf8b;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbccc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7c;
              3'h2: pos_word = 16'hc305;
              3'h3: pos_word = 16'hbf74;
              3'h4: pos_word = 16'h3d24;
              3'h5: pos_word = 16'h3f8f;
              3'h6: pos_word = 16'hc15c;
              3'h7: pos_word = 16'hbf56;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3dd8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa3;
              3'h2: pos_word = 16'hc0e7;
              3'h3: pos_word = 16'hbf3b;
              3'h4: pos_word = 16'h3e30;
              3'h5: pos_word = 16'h3fbb;
              3'h6: pos_word = 16'hc09c;
              3'h7: pos_word = 16'hbf23;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3e75;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd8;
              3'h2: pos_word = 16'hc06a;
              3'h3: pos_word = 16'hbf0c;
              3'h4: pos_word = 16'h3e9e;
              3'h5: pos_word = 16'h3ffc;
              3'h6: pos_word = 16'hc03a;
              3'h7: pos_word = 16'hbeef;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ec3;
            case (mant_lo3)
              3'h1: pos_word = 16'h4015;
              3'h2: pos_word = 16'hc019;
              3'h3: pos_word = 16'hbec8;
              3'h4: pos_word = 16'h3eeb;
              3'h5: pos_word = 16'h4035;
              3'h6: pos_word = 16'hc001;
              3'h7: pos_word = 16'hbea2;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f0a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4063;
              3'h2: pos_word = 16'hbfdc;
              3'h3: pos_word = 16'hbe7d;
              3'h4: pos_word = 16'h3f20;
              3'h5: pos_word = 16'h4096;
              3'h6: pos_word = 16'hbfbe;
              3'h7: pos_word = 16'hbe37;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f38;
            case (mant_lo3)
              3'h1: pos_word = 16'h40db;
              3'h2: pos_word = 16'hbfa6;
              3'h3: pos_word = 16'hbde7;
              3'h4: pos_word = 16'h3f53;
              3'h5: pos_word = 16'h4148;
              3'h6: pos_word = 16'hbf91;
              3'h7: pos_word = 16'hbd42;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f71;
            case (mant_lo3)
              3'h1: pos_word = 16'h4286;
              3'h2: pos_word = 16'hbf7f;
              3'h3: pos_word = 16'h3c90;
              3'h4: pos_word = 16'h3f89;
              3'h5: pos_word = 16'hc1a0;
              3'h6: pos_word = 16'hbf60;
              3'h7: pos_word = 16'h3da9;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f9c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc10b;
              3'h2: pos_word = 16'hbf44;
              3'h3: pos_word = 16'h3e18;
              3'h4: pos_word = 16'h3fb3;
              3'h5: pos_word = 16'hc0b0;
              3'h6: pos_word = 16'hbf2b;
              3'h7: pos_word = 16'h3e5d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb4: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fce;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf14;
              3'h2: pos_word = 16'h3fef;
              3'h3: pos_word = 16'hbefd;
              3'h4: pos_word = 16'h400d;
              3'h5: pos_word = 16'hbed5;
              3'h6: pos_word = 16'h4029;
              3'h7: pos_word = 16'hbeaf;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h4051;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe8b;
              3'h2: pos_word = 16'h4087;
              3'h3: pos_word = 16'hbe4f;
              3'h4: pos_word = 16'h40be;
              3'h5: pos_word = 16'hbe0b;
              3'h6: pos_word = 16'h411c;
              3'h7: pos_word = 16'hbd8f;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h41d6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbba2;
              3'h2: pos_word = 16'hc211;
              3'h3: pos_word = 16'h3d76;
              3'h4: pos_word = 16'hc12d;
              3'h5: pos_word = 16'h3e01;
              3'h6: pos_word = 16'hc0ca;
              3'h7: pos_word = 16'h3e45;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc08e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e85;
              3'h2: pos_word = 16'hc059;
              3'h3: pos_word = 16'h3eaa;
              3'h4: pos_word = 16'hc02e;
              3'h5: pos_word = 16'h3ecf;
              3'h6: pos_word = 16'hc010;
              3'h7: pos_word = 16'h3ef7;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbff5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f11;
              3'h2: pos_word = 16'hbfd2;
              3'h3: pos_word = 16'h3f28;
              3'h4: pos_word = 16'hbfb6;
              3'h5: pos_word = 16'h3f40;
              3'h6: pos_word = 16'hbf9f;
              3'h7: pos_word = 16'h3f5c;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf8c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7a;
              3'h2: pos_word = 16'hbf75;
              3'h3: pos_word = 16'h3f8f;
              3'h4: pos_word = 16'hbf57;
              3'h5: pos_word = 16'h3fa3;
              3'h6: pos_word = 16'hbf3c;
              3'h7: pos_word = 16'h3fba;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf24;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd7;
              3'h2: pos_word = 16'hbf0d;
              3'h3: pos_word = 16'h3ffb;
              3'h4: pos_word = 16'hbef1;
              3'h5: pos_word = 16'h4014;
              3'h6: pos_word = 16'hbec9;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbea4;
            case (mant_lo3)
              3'h1: pos_word = 16'h4061;
              3'h2: pos_word = 16'hbe80;
              3'h3: pos_word = 16'h4095;
              3'h4: pos_word = 16'hbe3a;
              3'h5: pos_word = 16'h40d8;
              3'h6: pos_word = 16'hbdec;
              3'h7: pos_word = 16'h4142;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbd4c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4266;
              3'h2: pos_word = 16'h3c77;
              3'h3: pos_word = 16'hc1a8;
              3'h4: pos_word = 16'h3da4;
              3'h5: pos_word = 16'hc10e;
              3'h6: pos_word = 16'h3e15;
              3'h7: pos_word = 16'hc0b3;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3e5a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc081;
              3'h2: pos_word = 16'h3e90;
              3'h3: pos_word = 16'hc04a;
              3'h4: pos_word = 16'h3eb5;
              3'h5: pos_word = 16'hc024;
              3'h6: pos_word = 16'h3edb;
              3'h7: pos_word = 16'hc009;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f02;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe9;
              3'h2: pos_word = 16'h3f18;
              3'h3: pos_word = 16'hbfc9;
              3'h4: pos_word = 16'h3f2f;
              3'h5: pos_word = 16'hbfaf;
              3'h6: pos_word = 16'h3f48;
              3'h7: pos_word = 16'hbf99;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f65;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'h3f82;
              3'h3: pos_word = 16'hbf6c;
              3'h4: pos_word = 16'h3f94;
              3'h5: pos_word = 16'hbf4f;
              3'h6: pos_word = 16'h3faa;
              3'h7: pos_word = 16'hbf35;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fc3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf1d;
              3'h2: pos_word = 16'h3fe1;
              3'h3: pos_word = 16'hbf07;
              3'h4: pos_word = 16'h4004;
              3'h5: pos_word = 16'hbee4;
              3'h6: pos_word = 16'h401d;
              3'h7: pos_word = 16'hbebe;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4040;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe99;
              3'h2: pos_word = 16'h4073;
              3'h3: pos_word = 16'hbe6a;
              3'h4: pos_word = 16'h40a4;
              3'h5: pos_word = 16'hbe25;
              3'h6: pos_word = 16'h40fa;
              3'h7: pos_word = 16'hbdc3;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4180;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcf5;
              3'h2: pos_word = 16'hc3c1;
              3'h3: pos_word = 16'h3d10;
              3'h4: pos_word = 16'hc16d;
              3'h5: pos_word = 16'h3dcd;
              3'h6: pos_word = 16'hc0f0;
              3'h7: pos_word = 16'h3e2a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc0a0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e70;
              3'h2: pos_word = 16'hc06e;
              3'h3: pos_word = 16'h3e9b;
              3'h4: pos_word = 16'hc03d;
              3'h5: pos_word = 16'h3ec1;
              3'h6: pos_word = 16'hc01b;
              3'h7: pos_word = 16'h3ee7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb5: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc002;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfdf;
              3'h2: pos_word = 16'hbfc0;
              3'h3: pos_word = 16'hbfa8;
              3'h4: pos_word = 16'hbf93;
              3'h5: pos_word = 16'hbf81;
              3'h6: pos_word = 16'hbf62;
              3'h7: pos_word = 16'hbf46;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf2d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf16;
              3'h2: pos_word = 16'hbf00;
              3'h3: pos_word = 16'hbed8;
              3'h4: pos_word = 16'hbeb2;
              3'h5: pos_word = 16'hbe8d;
              3'h6: pos_word = 16'hbe55;
              3'h7: pos_word = 16'hbe10;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbd99;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc22;
              3'h2: pos_word = 16'h3d62;
              3'h3: pos_word = 16'h3df7;
              3'h4: pos_word = 16'h3e40;
              3'h5: pos_word = 16'h3e83;
              3'h6: pos_word = 16'h3ea7;
              3'h7: pos_word = 16'h3ecc;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3ef4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0f;
              3'h2: pos_word = 16'h3f26;
              3'h3: pos_word = 16'h3f3e;
              3'h4: pos_word = 16'h3f5a;
              3'h5: pos_word = 16'h3f78;
              3'h6: pos_word = 16'h3f8d;
              3'h7: pos_word = 16'h3fa1;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fb8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd5;
              3'h2: pos_word = 16'h3ff8;
              3'h3: pos_word = 16'h4012;
              3'h4: pos_word = 16'h4031;
              3'h5: pos_word = 16'h405d;
              3'h6: pos_word = 16'h4091;
              3'h7: pos_word = 16'h40d1;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4137;
            case (mant_lo3)
              3'h1: pos_word = 16'h4233;
              3'h2: pos_word = 16'hc1bc;
              3'h3: pos_word = 16'hc114;
              3'h4: pos_word = 16'hc0b8;
              3'h5: pos_word = 16'hc084;
              3'h6: pos_word = 16'hc04d;
              3'h7: pos_word = 16'hc026;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc00b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfec;
              3'h2: pos_word = 16'hbfcb;
              3'h3: pos_word = 16'hbfb1;
              3'h4: pos_word = 16'hbf9a;
              3'h5: pos_word = 16'hbf88;
              3'h6: pos_word = 16'hbf6e;
              3'h7: pos_word = 16'hbf51;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf36;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf1e;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'hbee7;
              3'h4: pos_word = 16'hbec0;
              3'h5: pos_word = 16'hbe9b;
              3'h6: pos_word = 16'hbe6f;
              3'h7: pos_word = 16'hbe2a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbdcd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd0f;
              3'h2: pos_word = 16'h3cf7;
              3'h3: pos_word = 16'h3dc3;
              3'h4: pos_word = 16'h3e25;
              3'h5: pos_word = 16'h3e6a;
              3'h6: pos_word = 16'h3e99;
              3'h7: pos_word = 16'h3ebe;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3ee4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f07;
              3'h2: pos_word = 16'h3f1d;
              3'h3: pos_word = 16'h3f35;
              3'h4: pos_word = 16'h3f4f;
              3'h5: pos_word = 16'h3f6c;
              3'h6: pos_word = 16'h3f86;
              3'h7: pos_word = 16'h3f99;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3faf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc9;
              3'h2: pos_word = 16'h3fe9;
              3'h3: pos_word = 16'h4009;
              3'h4: pos_word = 16'h4024;
              3'h5: pos_word = 16'h404a;
              3'h6: pos_word = 16'h4082;
              3'h7: pos_word = 16'h40b3;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h410e;
            case (mant_lo3)
              3'h1: pos_word = 16'h41a9;
              3'h2: pos_word = 16'hc263;
              3'h3: pos_word = 16'hc141;
              3'h4: pos_word = 16'hc0d7;
              3'h5: pos_word = 16'hc094;
              3'h6: pos_word = 16'hc061;
              3'h7: pos_word = 16'hc034;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc014;
            case (mant_lo3)
              3'h1: pos_word = 16'hbffb;
              3'h2: pos_word = 16'hbfd7;
              3'h3: pos_word = 16'hbfba;
              3'h4: pos_word = 16'hbfa3;
              3'h5: pos_word = 16'hbf8e;
              3'h6: pos_word = 16'hbf7a;
              3'h7: pos_word = 16'hbf5c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf40;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf27;
              3'h2: pos_word = 16'hbf11;
              3'h3: pos_word = 16'hbef7;
              3'h4: pos_word = 16'hbecf;
              3'h5: pos_word = 16'hbea9;
              3'h6: pos_word = 16'hbe85;
              3'h7: pos_word = 16'hbe45;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe00;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd75;
              3'h2: pos_word = 16'h3baa;
              3'h3: pos_word = 16'h3d90;
              3'h4: pos_word = 16'h3e0b;
              3'h5: pos_word = 16'h3e50;
              3'h6: pos_word = 16'h3e8b;
              3'h7: pos_word = 16'h3eaf;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3ed5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efd;
              3'h2: pos_word = 16'h3f14;
              3'h3: pos_word = 16'h3f2b;
              3'h4: pos_word = 16'h3f44;
              3'h5: pos_word = 16'h3f60;
              3'h6: pos_word = 16'h3f7f;
              3'h7: pos_word = 16'h3f91;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb6: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fa6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fdc;
              3'h2: pos_word = 16'h4019;
              3'h3: pos_word = 16'h406a;
              3'h4: pos_word = 16'h40e8;
              3'h5: pos_word = 16'h4309;
              3'h6: pos_word = 16'hc102;
              3'h7: pos_word = 16'hc078;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc01f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe4;
              3'h2: pos_word = 16'hbfab;
              3'h3: pos_word = 16'hbf84;
              3'h4: pos_word = 16'hbf4a;
              3'h5: pos_word = 16'hbf19;
              3'h6: pos_word = 16'hbede;
              3'h7: pos_word = 16'hbe93;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe1a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbca2;
              3'h2: pos_word = 16'h3de2;
              3'h3: pos_word = 16'h3e7b;
              3'h4: pos_word = 16'h3ec6;
              3'h5: pos_word = 16'h3f0c;
              3'h6: pos_word = 16'h3f3a;
              3'h7: pos_word = 16'h3f73;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f9e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd0;
              3'h2: pos_word = 16'h400f;
              3'h3: pos_word = 16'h4055;
              3'h4: pos_word = 16'h40c4;
              3'h5: pos_word = 16'h41f8;
              3'h6: pos_word = 16'hc123;
              3'h7: pos_word = 16'hc08a;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc02b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff2;
              3'h2: pos_word = 16'hbfb4;
              3'h3: pos_word = 16'hbf8a;
              3'h4: pos_word = 16'hbf55;
              3'h5: pos_word = 16'hbf22;
              3'h6: pos_word = 16'hbeed;
              3'h7: pos_word = 16'hbea1;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe35;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd37;
              3'h2: pos_word = 16'h3daf;
              3'h3: pos_word = 16'h3e60;
              3'h4: pos_word = 16'h3eb8;
              3'h5: pos_word = 16'h3f04;
              3'h6: pos_word = 16'h3f31;
              3'h7: pos_word = 16'h3f67;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f96;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc5;
              3'h2: pos_word = 16'h4006;
              3'h3: pos_word = 16'h4043;
              3'h4: pos_word = 16'h40a9;
              3'h5: pos_word = 16'h418c;
              3'h6: pos_word = 16'hc15c;
              3'h7: pos_word = 16'hc09c;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc039;
            case (mant_lo3)
              3'h1: pos_word = 16'hc000;
              3'h2: pos_word = 16'hbfbe;
              3'h3: pos_word = 16'hbf91;
              3'h4: pos_word = 16'hbf60;
              3'h5: pos_word = 16'hbf2b;
              3'h6: pos_word = 16'hbefd;
              3'h7: pos_word = 16'hbeaf;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd8f;
              3'h2: pos_word = 16'h3d77;
              3'h3: pos_word = 16'h3e45;
              3'h4: pos_word = 16'h3eaa;
              3'h5: pos_word = 16'h3ef7;
              3'h6: pos_word = 16'h3f28;
              3'h7: pos_word = 16'h3f5c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f8f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fba;
              3'h2: pos_word = 16'h3ffb;
              3'h3: pos_word = 16'h4034;
              3'h4: pos_word = 16'h4095;
              3'h5: pos_word = 16'h4142;
              3'h6: pos_word = 16'hc1a7;
              3'h7: pos_word = 16'hc0b2;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc04a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc009;
              3'h2: pos_word = 16'hbfc9;
              3'h3: pos_word = 16'hbf99;
              3'h4: pos_word = 16'hbf6c;
              3'h5: pos_word = 16'hbf34;
              3'h6: pos_word = 16'hbf07;
              3'h7: pos_word = 16'hbebd;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbe6a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdc2;
              3'h2: pos_word = 16'h3d11;
              3'h3: pos_word = 16'h3e2b;
              3'h4: pos_word = 16'h3e9c;
              3'h5: pos_word = 16'h3ee8;
              3'h6: pos_word = 16'h3f1f;
              3'h7: pos_word = 16'h3f51;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f88;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb1;
              3'h2: pos_word = 16'h3fec;
              3'h3: pos_word = 16'h4027;
              3'h4: pos_word = 16'h4085;
              3'h5: pos_word = 16'h4115;
              3'h6: pos_word = 16'hc22f;
              3'h7: pos_word = 16'hc0d0;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc05c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc012;
              3'h2: pos_word = 16'hbfd4;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'hbf78;
              3'h5: pos_word = 16'hbf3e;
              3'h6: pos_word = 16'hbf0f;
              3'h7: pos_word = 16'hbecc;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe82;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdf6;
              3'h2: pos_word = 16'h3c2a;
              3'h3: pos_word = 16'h3e11;
              3'h4: pos_word = 16'h3e8e;
              3'h5: pos_word = 16'h3ed8;
              3'h6: pos_word = 16'h3f16;
              3'h7: pos_word = 16'h3f47;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f81;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa8;
              3'h2: pos_word = 16'h3fdf;
              3'h3: pos_word = 16'h401b;
              3'h4: pos_word = 16'h406f;
              3'h5: pos_word = 16'h40f1;
              3'h6: pos_word = 16'h43ee;
              3'h7: pos_word = 16'hc0f9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb7: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc073;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe1;
              3'h2: pos_word = 16'hbf82;
              3'h3: pos_word = 16'hbf17;
              3'h4: pos_word = 16'hbe90;
              3'h5: pos_word = 16'hbc6f;
              3'h6: pos_word = 16'h3e80;
              3'h7: pos_word = 16'h3f0d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f76;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd2;
              3'h2: pos_word = 16'h4059;
              3'h3: pos_word = 16'h4214;
              3'h4: pos_word = 16'hc087;
              3'h5: pos_word = 16'hbfef;
              3'h6: pos_word = 16'hbf89;
              3'h7: pos_word = 16'hbf20;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd22;
              3'h2: pos_word = 16'h3e65;
              3'h3: pos_word = 16'h3f05;
              3'h4: pos_word = 16'h3f6a;
              3'h5: pos_word = 16'h3fc7;
              3'h6: pos_word = 16'h4047;
              3'h7: pos_word = 16'h419a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc098;
            case (mant_lo3)
              3'h1: pos_word = 16'hbffe;
              3'h2: pos_word = 16'hbf90;
              3'h3: pos_word = 16'hbf29;
              3'h4: pos_word = 16'hbeac;
              3'h5: pos_word = 16'hbd84;
              3'h6: pos_word = 16'h3e4b;
              3'h7: pos_word = 16'h3efa;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f5e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbd;
              3'h2: pos_word = 16'h4037;
              3'h3: pos_word = 16'h4150;
              3'h4: pos_word = 16'hc0ad;
              3'h5: pos_word = 16'hc007;
              3'h6: pos_word = 16'hbf97;
              3'h7: pos_word = 16'hbf32;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbeba;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb8;
              3'h2: pos_word = 16'h3e30;
              3'h3: pos_word = 16'h3eeb;
              3'h4: pos_word = 16'h3f53;
              3'h5: pos_word = 16'h3fb3;
              3'h6: pos_word = 16'h4029;
              3'h7: pos_word = 16'h411d;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc0c9;
            case (mant_lo3)
              3'h1: pos_word = 16'hc010;
              3'h2: pos_word = 16'hbf9f;
              3'h3: pos_word = 16'hbf3c;
              3'h4: pos_word = 16'hbec9;
              3'h5: pos_word = 16'hbdeb;
              3'h6: pos_word = 16'h3e16;
              3'h7: pos_word = 16'h3edc;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f49;
            case (mant_lo3)
              3'h1: pos_word = 16'h3faa;
              3'h2: pos_word = 16'h401d;
              3'h3: pos_word = 16'h40fb;
              3'h4: pos_word = 16'hc0ef;
              3'h5: pos_word = 16'hc01b;
              3'h6: pos_word = 16'hbfa8;
              3'h7: pos_word = 16'hbf46;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbed8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe10;
              3'h2: pos_word = 16'h3df8;
              3'h3: pos_word = 16'h3ecd;
              3'h4: pos_word = 16'h3f3f;
              3'h5: pos_word = 16'h3fa1;
              3'h6: pos_word = 16'h4013;
              3'h7: pos_word = 16'h40d1;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc114;
            case (mant_lo3)
              3'h1: pos_word = 16'hc026;
              3'h2: pos_word = 16'hbfb1;
              3'h3: pos_word = 16'hbf51;
              3'h4: pos_word = 16'hbee7;
              3'h5: pos_word = 16'hbe2a;
              3'h6: pos_word = 16'h3dc4;
              3'h7: pos_word = 16'h3ebe;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f35;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f99;
              3'h2: pos_word = 16'h4009;
              3'h3: pos_word = 16'h40b3;
              3'h4: pos_word = 16'hc140;
              3'h5: pos_word = 16'hc033;
              3'h6: pos_word = 16'hbfba;
              3'h7: pos_word = 16'hbf5b;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbef7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe44;
              3'h2: pos_word = 16'h3d91;
              3'h3: pos_word = 16'h3eb0;
              3'h4: pos_word = 16'h3f2b;
              3'h5: pos_word = 16'h3f92;
              3'h6: pos_word = 16'h4001;
              3'h7: pos_word = 16'h409d;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc189;
            case (mant_lo3)
              3'h1: pos_word = 16'hc043;
              3'h2: pos_word = 16'hbfc4;
              3'h3: pos_word = 16'hbf67;
              3'h4: pos_word = 16'hbf03;
              3'h5: pos_word = 16'hbe5f;
              3'h6: pos_word = 16'h3d3b;
              3'h7: pos_word = 16'h3ea1;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f22;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8b;
              3'h2: pos_word = 16'h3ff2;
              3'h3: pos_word = 16'h408b;
              3'h4: pos_word = 16'hc1f1;
              3'h5: pos_word = 16'hc054;
              3'h6: pos_word = 16'hbfd0;
              3'h7: pos_word = 16'hbf73;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf0b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe79;
              3'h2: pos_word = 16'h3caa;
              3'h3: pos_word = 16'h3e93;
              3'h4: pos_word = 16'h3f1a;
              3'h5: pos_word = 16'h3f84;
              3'h6: pos_word = 16'h3fe4;
              3'h7: pos_word = 16'h4079;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc2f2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc069;
              3'h2: pos_word = 16'hbfdc;
              3'h3: pos_word = 16'hbf7f;
              3'h4: pos_word = 16'hbf14;
              3'h5: pos_word = 16'hbe8a;
              3'h6: pos_word = 16'hbb8a;
              3'h7: pos_word = 16'h3e86;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb8: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f11;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd7;
              3'h2: pos_word = 16'h4270;
              3'h3: pos_word = 16'hbfe9;
              3'h4: pos_word = 16'hbf1c;
              3'h5: pos_word = 16'hbcef;
              3'h6: pos_word = 16'h3f09;
              3'h7: pos_word = 16'h3fcc;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h41c0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff7;
              3'h2: pos_word = 16'hbf25;
              3'h3: pos_word = 16'hbd5e;
              3'h4: pos_word = 16'h3f01;
              3'h5: pos_word = 16'h3fc1;
              3'h6: pos_word = 16'h4170;
              3'h7: pos_word = 16'hc004;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf2f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbda2;
              3'h2: pos_word = 16'h3ef1;
              3'h3: pos_word = 16'h3fb7;
              3'h4: pos_word = 16'h412e;
              3'h5: pos_word = 16'hc00c;
              3'h6: pos_word = 16'hbf38;
              3'h7: pos_word = 16'hbdd6;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3ee2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fad;
              3'h2: pos_word = 16'h4109;
              3'h3: pos_word = 16'hc016;
              3'h4: pos_word = 16'hbf42;
              3'h5: pos_word = 16'hbe05;
              3'h6: pos_word = 16'h3ed3;
              3'h7: pos_word = 16'h3fa5;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h40e1;
            case (mant_lo3)
              3'h1: pos_word = 16'hc021;
              3'h2: pos_word = 16'hbf4c;
              3'h3: pos_word = 16'hbe1f;
              3'h4: pos_word = 16'h3ec4;
              3'h5: pos_word = 16'h3f9c;
              3'h6: pos_word = 16'h40bf;
              3'h7: pos_word = 16'hc02e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf57;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe39;
              3'h2: pos_word = 16'h3eb6;
              3'h3: pos_word = 16'h3f95;
              3'h4: pos_word = 16'h40a5;
              3'h5: pos_word = 16'hc03c;
              3'h6: pos_word = 16'hbf62;
              3'h7: pos_word = 16'hbe54;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3ea7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8d;
              3'h2: pos_word = 16'h4092;
              3'h3: pos_word = 16'hc04d;
              3'h4: pos_word = 16'hbf6e;
              3'h5: pos_word = 16'hbe6e;
              3'h6: pos_word = 16'h3e99;
              3'h7: pos_word = 16'h3f87;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4082;
            case (mant_lo3)
              3'h1: pos_word = 16'hc060;
              3'h2: pos_word = 16'hbf7a;
              3'h3: pos_word = 16'hbe85;
              3'h4: pos_word = 16'h3e8b;
              3'h5: pos_word = 16'h3f80;
              3'h6: pos_word = 16'h406b;
              3'h7: pos_word = 16'hc077;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf83;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe92;
              3'h2: pos_word = 16'h3e7c;
              3'h3: pos_word = 16'h3f74;
              3'h4: pos_word = 16'h4056;
              3'h5: pos_word = 16'hc08a;
              3'h6: pos_word = 16'hbf8a;
              3'h7: pos_word = 16'hbea0;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3e61;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f68;
              3'h2: pos_word = 16'h4044;
              3'h3: pos_word = 16'hc09b;
              3'h4: pos_word = 16'hbf91;
              3'h5: pos_word = 16'hbeae;
              3'h6: pos_word = 16'h3e46;
              3'h7: pos_word = 16'h3f5c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4034;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0b1;
              3'h2: pos_word = 16'hbf99;
              3'h3: pos_word = 16'hbebd;
              3'h4: pos_word = 16'h3e2c;
              3'h5: pos_word = 16'h3f51;
              3'h6: pos_word = 16'h4027;
              3'h7: pos_word = 16'hc0cf;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfa1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbecb;
              3'h2: pos_word = 16'h3e12;
              3'h3: pos_word = 16'h3f47;
              3'h4: pos_word = 16'h401b;
              3'h5: pos_word = 16'hc0f7;
              3'h6: pos_word = 16'hbfa9;
              3'h7: pos_word = 16'hbeda;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3def;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3d;
              3'h2: pos_word = 16'h4011;
              3'h3: pos_word = 16'hc11a;
              3'h4: pos_word = 16'hbfb2;
              3'h5: pos_word = 16'hbeea;
              3'h6: pos_word = 16'h3dbc;
              3'h7: pos_word = 16'h3f33;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4008;
            case (mant_lo3)
              3'h1: pos_word = 16'hc14a;
              3'h2: pos_word = 16'hbfbc;
              3'h3: pos_word = 16'hbef9;
              3'h4: pos_word = 16'h3d88;
              3'h5: pos_word = 16'h3f2a;
              3'h6: pos_word = 16'h3fff;
              3'h7: pos_word = 16'hc194;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfc6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf05;
              3'h2: pos_word = 16'h3d2a;
              3'h3: pos_word = 16'h3f21;
              3'h4: pos_word = 16'h3ff0;
              3'h5: pos_word = 16'hc20a;
              3'h6: pos_word = 16'hbfd2;
              3'h7: pos_word = 16'hbf0d;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3c87;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f18;
              3'h2: pos_word = 16'h3fe2;
              3'h3: pos_word = 16'hc377;
              3'h4: pos_word = 16'hbfde;
              3'h5: pos_word = 16'hbf15;
              3'h6: pos_word = 16'hbc0a;
              3'h7: pos_word = 16'h3f10;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb9: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fd5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfeb;
              3'h2: pos_word = 16'hbd09;
              3'h3: pos_word = 16'h3fca;
              3'h4: pos_word = 16'hbffa;
              3'h5: pos_word = 16'hbd6f;
              3'h6: pos_word = 16'h3fbf;
              3'h7: pos_word = 16'hc005;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbdab;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb5;
              3'h2: pos_word = 16'hc00e;
              3'h3: pos_word = 16'hbdde;
              3'h4: pos_word = 16'h3fac;
              3'h5: pos_word = 16'hc018;
              3'h6: pos_word = 16'hbe09;
              3'h7: pos_word = 16'h3fa3;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc023;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe23;
              3'h2: pos_word = 16'h3f9b;
              3'h3: pos_word = 16'hc030;
              3'h4: pos_word = 16'hbe3d;
              3'h5: pos_word = 16'h3f93;
              3'h6: pos_word = 16'hc03f;
              3'h7: pos_word = 16'hbe58;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc050;
              3'h2: pos_word = 16'hbe73;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'hc064;
              3'h5: pos_word = 16'hbe87;
              3'h6: pos_word = 16'h3f7e;
              3'h7: pos_word = 16'hc07b;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbe95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f71;
              3'h2: pos_word = 16'hc08c;
              3'h3: pos_word = 16'hbea3;
              3'h4: pos_word = 16'h3f66;
              3'h5: pos_word = 16'hc09e;
              3'h6: pos_word = 16'hbeb1;
              3'h7: pos_word = 16'h3f5a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0b6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebf;
              3'h2: pos_word = 16'h3f50;
              3'h3: pos_word = 16'hc0d5;
              3'h4: pos_word = 16'hbece;
              3'h5: pos_word = 16'h3f45;
              3'h6: pos_word = 16'hc100;
              3'h7: pos_word = 16'hbedd;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f3b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc120;
              3'h2: pos_word = 16'hbeec;
              3'h3: pos_word = 16'h3f32;
              3'h4: pos_word = 16'hc156;
              3'h5: pos_word = 16'hbefc;
              3'h6: pos_word = 16'h3f28;
              3'h7: pos_word = 16'hc1a1;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf06;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1f;
              3'h2: pos_word = 16'hc221;
              3'h3: pos_word = 16'hbf0e;
              3'h4: pos_word = 16'h3f17;
              3'h5: pos_word = 16'h45c2;
              3'h6: pos_word = 16'hbf17;
              3'h7: pos_word = 16'h3f0e;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h421f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf1f;
              3'h2: pos_word = 16'h3f06;
              3'h3: pos_word = 16'h41a0;
              3'h4: pos_word = 16'hbf28;
              3'h5: pos_word = 16'h3efc;
              3'h6: pos_word = 16'h4155;
              3'h7: pos_word = 16'hbf32;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3eec;
            case (mant_lo3)
              3'h1: pos_word = 16'h4120;
              3'h2: pos_word = 16'hbf3b;
              3'h3: pos_word = 16'h3edd;
              3'h4: pos_word = 16'h40ff;
              3'h5: pos_word = 16'hbf45;
              3'h6: pos_word = 16'h3ece;
              3'h7: pos_word = 16'h40d4;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf50;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ebf;
              3'h2: pos_word = 16'h40b5;
              3'h3: pos_word = 16'hbf5b;
              3'h4: pos_word = 16'h3eb1;
              3'h5: pos_word = 16'h409e;
              3'h6: pos_word = 16'hbf66;
              3'h7: pos_word = 16'h3ea3;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h408c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf72;
              3'h2: pos_word = 16'h3e95;
              3'h3: pos_word = 16'h407b;
              3'h4: pos_word = 16'hbf7e;
              3'h5: pos_word = 16'h3e87;
              3'h6: pos_word = 16'h4063;
              3'h7: pos_word = 16'hbf85;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e72;
            case (mant_lo3)
              3'h1: pos_word = 16'h404f;
              3'h2: pos_word = 16'hbf8c;
              3'h3: pos_word = 16'h3e58;
              3'h4: pos_word = 16'h403e;
              3'h5: pos_word = 16'hbf94;
              3'h6: pos_word = 16'h3e3d;
              3'h7: pos_word = 16'h4030;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf9b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e23;
              3'h2: pos_word = 16'h4023;
              3'h3: pos_word = 16'hbfa3;
              3'h4: pos_word = 16'h3e09;
              3'h5: pos_word = 16'h4018;
              3'h6: pos_word = 16'hbfac;
              3'h7: pos_word = 16'h3dde;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h400e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb5;
              3'h2: pos_word = 16'h3daa;
              3'h3: pos_word = 16'h4005;
              3'h4: pos_word = 16'hbfbf;
              3'h5: pos_word = 16'h3d6e;
              3'h6: pos_word = 16'h3ffa;
              3'h7: pos_word = 16'hbfca;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3d07;
            case (mant_lo3)
              3'h1: pos_word = 16'h3feb;
              3'h2: pos_word = 16'hbfd6;
              3'h3: pos_word = 16'h3c05;
              3'h4: pos_word = 16'h3fde;
              3'h5: pos_word = 16'hbfe2;
              3'h6: pos_word = 16'hbc8a;
              3'h7: pos_word = 16'h3fd1;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hba: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbff0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc6;
              3'h2: pos_word = 16'hbd89;
              3'h3: pos_word = 16'hc008;
              3'h4: pos_word = 16'h3fb2;
              3'h5: pos_word = 16'hbdf0;
              3'h6: pos_word = 16'hc01c;
              3'h7: pos_word = 16'h3fa0;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbe2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc035;
              3'h2: pos_word = 16'h3f91;
              3'h3: pos_word = 16'hbe61;
              3'h4: pos_word = 16'hc056;
              3'h5: pos_word = 16'h3f83;
              3'h6: pos_word = 16'hbe8c;
              3'h7: pos_word = 16'hc082;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f6d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea7;
              3'h2: pos_word = 16'hc0a6;
              3'h3: pos_word = 16'h3f57;
              3'h4: pos_word = 16'hbec4;
              3'h5: pos_word = 16'hc0e1;
              3'h6: pos_word = 16'h3f42;
              3'h7: pos_word = 16'hbee2;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc12f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2e;
              3'h2: pos_word = 16'hbf01;
              3'h3: pos_word = 16'hc1c2;
              3'h4: pos_word = 16'h3f1c;
              3'h5: pos_word = 16'hbf11;
              3'h6: pos_word = 16'h42e9;
              3'h7: pos_word = 16'h3f0b;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'h4189;
              3'h2: pos_word = 16'h3ef6;
              3'h3: pos_word = 16'hbf35;
              3'h4: pos_word = 16'h4113;
              3'h5: pos_word = 16'h3ed8;
              3'h6: pos_word = 16'hbf49;
              3'h7: pos_word = 16'h40c9;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3eba;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5e;
              3'h2: pos_word = 16'h4098;
              3'h3: pos_word = 16'h3e9e;
              3'h4: pos_word = 16'hbf76;
              3'h5: pos_word = 16'h4073;
              3'h6: pos_word = 16'h3e82;
              3'h7: pos_word = 16'hbf88;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4049;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e4f;
              3'h2: pos_word = 16'hbf96;
              3'h3: pos_word = 16'h402b;
              3'h4: pos_word = 16'h3e1a;
              3'h5: pos_word = 16'hbfa6;
              3'h6: pos_word = 16'h4014;
              3'h7: pos_word = 16'h3dcc;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfb9;
            case (mant_lo3)
              3'h1: pos_word = 16'h4002;
              3'h2: pos_word = 16'h3d4b;
              3'h3: pos_word = 16'hbfce;
              3'h4: pos_word = 16'h3fe6;
              3'h5: pos_word = 16'hb9a9;
              3'h6: pos_word = 16'hbfe7;
              3'h7: pos_word = 16'h3fcd;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbd4e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc002;
              3'h2: pos_word = 16'h3fb8;
              3'h3: pos_word = 16'hbdce;
              3'h4: pos_word = 16'hc015;
              3'h5: pos_word = 16'h3fa6;
              3'h6: pos_word = 16'hbe1b;
              3'h7: pos_word = 16'hc02c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f96;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe4f;
              3'h2: pos_word = 16'hc04a;
              3'h3: pos_word = 16'h3f88;
              3'h4: pos_word = 16'hbe83;
              3'h5: pos_word = 16'hc073;
              3'h6: pos_word = 16'h3f75;
              3'h7: pos_word = 16'hbe9e;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc098;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f5e;
              3'h2: pos_word = 16'hbebb;
              3'h3: pos_word = 16'hc0c9;
              3'h4: pos_word = 16'h3f49;
              3'h5: pos_word = 16'hbed8;
              3'h6: pos_word = 16'hc114;
              3'h7: pos_word = 16'h3f35;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbef7;
            case (mant_lo3)
              3'h1: pos_word = 16'hc18a;
              3'h2: pos_word = 16'h3f22;
              3'h3: pos_word = 16'hbf0c;
              3'h4: pos_word = 16'hc2fc;
              3'h5: pos_word = 16'h3f11;
              3'h6: pos_word = 16'hbf1d;
              3'h7: pos_word = 16'h41bf;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f00;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2f;
              3'h2: pos_word = 16'h412e;
              3'h3: pos_word = 16'h3ee2;
              3'h4: pos_word = 16'hbf42;
              3'h5: pos_word = 16'h40e0;
              3'h6: pos_word = 16'h3ec4;
              3'h7: pos_word = 16'hbf57;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h40a5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea7;
              3'h2: pos_word = 16'hbf6e;
              3'h3: pos_word = 16'h4082;
              3'h4: pos_word = 16'h3e8b;
              3'h5: pos_word = 16'hbf83;
              3'h6: pos_word = 16'h4055;
              3'h7: pos_word = 16'h3e60;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf91;
            case (mant_lo3)
              3'h1: pos_word = 16'h4034;
              3'h2: pos_word = 16'h3e2b;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'h401b;
              3'h5: pos_word = 16'h3def;
              3'h6: pos_word = 16'hbfb2;
              3'h7: pos_word = 16'h4008;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3d88;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc6;
              3'h2: pos_word = 16'h3ff0;
              3'h3: pos_word = 16'h3c85;
              3'h4: pos_word = 16'hbfde;
              3'h5: pos_word = 16'h3fd5;
              3'h6: pos_word = 16'hbd0a;
              3'h7: pos_word = 16'hbffa;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbb: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fbf;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00e;
              3'h2: pos_word = 16'hbe09;
              3'h3: pos_word = 16'h3f9b;
              3'h4: pos_word = 16'hc03f;
              3'h5: pos_word = 16'hbe73;
              3'h6: pos_word = 16'h3f7e;
              3'h7: pos_word = 16'hc08c;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbeb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4f;
              3'h2: pos_word = 16'hc100;
              3'h3: pos_word = 16'hbeec;
              3'h4: pos_word = 16'h3f28;
              3'h5: pos_word = 16'hc224;
              3'h6: pos_word = 16'hbf17;
              3'h7: pos_word = 16'h3f06;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4154;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3b;
              3'h2: pos_word = 16'h3ece;
              3'h3: pos_word = 16'h40b5;
              3'h4: pos_word = 16'hbf66;
              3'h5: pos_word = 16'h3e94;
              3'h6: pos_word = 16'h4063;
              3'h7: pos_word = 16'hbf8c;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e3d;
            case (mant_lo3)
              3'h1: pos_word = 16'h4023;
              3'h2: pos_word = 16'hbfac;
              3'h3: pos_word = 16'h3daa;
              3'h4: pos_word = 16'h3ff9;
              3'h5: pos_word = 16'hbfd6;
              3'h6: pos_word = 16'hbc8d;
              3'h7: pos_word = 16'h3fc6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc008;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdf1;
              3'h2: pos_word = 16'h3fa0;
              3'h3: pos_word = 16'hc035;
              3'h4: pos_word = 16'hbe61;
              3'h5: pos_word = 16'h3f83;
              3'h6: pos_word = 16'hc083;
              3'h7: pos_word = 16'hbea8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f57;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0e2;
              3'h2: pos_word = 16'hbee2;
              3'h3: pos_word = 16'h3f2e;
              3'h4: pos_word = 16'hc1c3;
              3'h5: pos_word = 16'hbf11;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h4188;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf35;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed7;
              3'h2: pos_word = 16'h40c8;
              3'h3: pos_word = 16'hbf5e;
              3'h4: pos_word = 16'h3e9e;
              3'h5: pos_word = 16'h4072;
              3'h6: pos_word = 16'hbf88;
              3'h7: pos_word = 16'h3e4e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h402b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa6;
              3'h2: pos_word = 16'h3dcc;
              3'h3: pos_word = 16'h4002;
              3'h4: pos_word = 16'hbfce;
              3'h5: pos_word = 16'hba29;
              3'h6: pos_word = 16'h3fcd;
              3'h7: pos_word = 16'hc002;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbdce;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa6;
              3'h2: pos_word = 16'hc02c;
              3'h3: pos_word = 16'hbe50;
              3'h4: pos_word = 16'h3f87;
              3'h5: pos_word = 16'hc074;
              3'h6: pos_word = 16'hbe9e;
              3'h7: pos_word = 16'h3f5e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc0ca;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed8;
              3'h2: pos_word = 16'h3f35;
              3'h3: pos_word = 16'hc18b;
              3'h4: pos_word = 16'hbf0c;
              3'h5: pos_word = 16'h3f11;
              3'h6: pos_word = 16'h41bd;
              3'h7: pos_word = 16'hbf2f;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3ee1;
            case (mant_lo3)
              3'h1: pos_word = 16'h40e0;
              3'h2: pos_word = 16'hbf57;
              3'h3: pos_word = 16'h3ea7;
              3'h4: pos_word = 16'h4082;
              3'h5: pos_word = 16'hbf83;
              3'h6: pos_word = 16'h3e60;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfa1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dee;
              3'h2: pos_word = 16'h4008;
              3'h3: pos_word = 16'hbfc7;
              3'h4: pos_word = 16'h3c82;
              3'h5: pos_word = 16'h3fd5;
              3'h6: pos_word = 16'hbffa;
              3'h7: pos_word = 16'hbdac;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fac;
            case (mant_lo3)
              3'h1: pos_word = 16'hc023;
              3'h2: pos_word = 16'hbe3e;
              3'h3: pos_word = 16'h3f8c;
              3'h4: pos_word = 16'hc064;
              3'h5: pos_word = 16'hbe95;
              3'h6: pos_word = 16'h3f65;
              3'h7: pos_word = 16'hc0b6;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbece;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3b;
              3'h2: pos_word = 16'hc158;
              3'h3: pos_word = 16'hbf06;
              3'h4: pos_word = 16'h3f16;
              3'h5: pos_word = 16'h421b;
              3'h6: pos_word = 16'hbf29;
              3'h7: pos_word = 16'h3eec;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h40fe;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf50;
              3'h2: pos_word = 16'h3eb0;
              3'h3: pos_word = 16'h408c;
              3'h4: pos_word = 16'hbf7e;
              3'h5: pos_word = 16'h3e72;
              3'h6: pos_word = 16'h403e;
              3'h7: pos_word = 16'hbf9b;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e08;
            case (mant_lo3)
              3'h1: pos_word = 16'h400e;
              3'h2: pos_word = 16'hbfbf;
              3'h3: pos_word = 16'h3d05;
              3'h4: pos_word = 16'h3fdd;
              3'h5: pos_word = 16'hbff0;
              3'h6: pos_word = 16'hbd8a;
              3'h7: pos_word = 16'h3fb2;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbc: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc01c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f91;
              3'h2: pos_word = 16'hbe8c;
              3'h3: pos_word = 16'hc0a6;
              3'h4: pos_word = 16'h3f42;
              3'h5: pos_word = 16'hbf01;
              3'h6: pos_word = 16'h42d9;
              3'h7: pos_word = 16'h3ef6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf49;
            case (mant_lo3)
              3'h1: pos_word = 16'h4097;
              3'h2: pos_word = 16'h3e82;
              3'h3: pos_word = 16'hbf96;
              3'h4: pos_word = 16'h4014;
              3'h5: pos_word = 16'h3d48;
              3'h6: pos_word = 16'hbfe7;
              3'h7: pos_word = 16'h3fb8;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe1b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc04a;
              3'h2: pos_word = 16'h3f75;
              3'h3: pos_word = 16'hbebb;
              3'h4: pos_word = 16'hc115;
              3'h5: pos_word = 16'h3f22;
              3'h6: pos_word = 16'hbf1d;
              3'h7: pos_word = 16'h412d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3ec3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6e;
              3'h2: pos_word = 16'h4055;
              3'h3: pos_word = 16'h3e2b;
              3'h4: pos_word = 16'hbfb2;
              3'h5: pos_word = 16'h3fef;
              3'h6: pos_word = 16'hbd0d;
              3'h7: pos_word = 16'hc00e;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f9b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe74;
              3'h2: pos_word = 16'hc08d;
              3'h3: pos_word = 16'h3f4f;
              3'h4: pos_word = 16'hbeed;
              3'h5: pos_word = 16'hc228;
              3'h6: pos_word = 16'h3f06;
              3'h7: pos_word = 16'hbf3c;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h40b4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e94;
              3'h2: pos_word = 16'hbf8d;
              3'h3: pos_word = 16'h4023;
              3'h4: pos_word = 16'h3da8;
              3'h5: pos_word = 16'hbfd6;
              3'h6: pos_word = 16'h3fc6;
              3'h7: pos_word = 16'hbdf2;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc035;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f83;
              3'h2: pos_word = 16'hbea8;
              3'h3: pos_word = 16'hc0e3;
              3'h4: pos_word = 16'h3f2e;
              3'h5: pos_word = 16'hbf11;
              3'h6: pos_word = 16'h4186;
              3'h7: pos_word = 16'h3ed7;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf5f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4072;
              3'h2: pos_word = 16'h3e4e;
              3'h3: pos_word = 16'hbfa7;
              3'h4: pos_word = 16'h4002;
              3'h5: pos_word = 16'hbaa9;
              3'h6: pos_word = 16'hc003;
              3'h7: pos_word = 16'h3fa6;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe50;
            case (mant_lo3)
              3'h1: pos_word = 16'hc074;
              3'h2: pos_word = 16'h3f5e;
              3'h3: pos_word = 16'hbed9;
              3'h4: pos_word = 16'hc18d;
              3'h5: pos_word = 16'h3f11;
              3'h6: pos_word = 16'hbf2f;
              3'h7: pos_word = 16'h40df;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3ea7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf84;
              3'h2: pos_word = 16'h4034;
              3'h3: pos_word = 16'h3ded;
              3'h4: pos_word = 16'hbfc7;
              3'h5: pos_word = 16'h3fd5;
              3'h6: pos_word = 16'hbdad;
              3'h7: pos_word = 16'hc024;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe95;
              3'h2: pos_word = 16'hc0b7;
              3'h3: pos_word = 16'h3f3b;
              3'h4: pos_word = 16'hbf06;
              3'h5: pos_word = 16'h4218;
              3'h6: pos_word = 16'h3eeb;
              3'h7: pos_word = 16'hbf50;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h408b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e71;
              3'h2: pos_word = 16'hbf9c;
              3'h3: pos_word = 16'h400d;
              3'h4: pos_word = 16'h3d02;
              3'h5: pos_word = 16'hbff1;
              3'h6: pos_word = 16'h3fb1;
              3'h7: pos_word = 16'hbe2d;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc057;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6d;
              3'h2: pos_word = 16'hbec5;
              3'h3: pos_word = 16'hc132;
              3'h4: pos_word = 16'h3f1c;
              3'h5: pos_word = 16'hbf23;
              3'h6: pos_word = 16'h4111;
              3'h7: pos_word = 16'h3eb9;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf76;
            case (mant_lo3)
              3'h1: pos_word = 16'h4048;
              3'h2: pos_word = 16'h3e19;
              3'h3: pos_word = 16'hbfb9;
              3'h4: pos_word = 16'h3fe6;
              3'h5: pos_word = 16'hbd53;
              3'h6: pos_word = 16'hc015;
              3'h7: pos_word = 16'h3f96;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe83;
            case (mant_lo3)
              3'h1: pos_word = 16'hc099;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'hbef8;
              3'h4: pos_word = 16'hc316;
              3'h5: pos_word = 16'h3f00;
              3'h6: pos_word = 16'hbf43;
              3'h7: pos_word = 16'h40a4;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf92;
              3'h2: pos_word = 16'h401b;
              3'h3: pos_word = 16'h3d85;
              3'h4: pos_word = 16'hbfdf;
              3'h5: pos_word = 16'h3fbe;
              3'h6: pos_word = 16'hbe0b;
              3'h7: pos_word = 16'hc040;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbd: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f7d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc102;
              3'h2: pos_word = 16'hbf17;
              3'h3: pos_word = 16'h3ecd;
              3'h4: pos_word = 16'h4062;
              3'h5: pos_word = 16'hbfad;
              3'h6: pos_word = 16'hbc97;
              3'h7: pos_word = 16'h3fa0;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc083;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee3;
              3'h2: pos_word = 16'h3f0b;
              3'h3: pos_word = 16'h40c7;
              3'h4: pos_word = 16'hbf88;
              3'h5: pos_word = 16'h3dc9;
              3'h6: pos_word = 16'h3fcd;
              3'h7: pos_word = 16'hc02c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe9f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f34;
              3'h2: pos_word = 16'h41b8;
              3'h3: pos_word = 16'hbf58;
              3'h4: pos_word = 16'h3e5f;
              3'h5: pos_word = 16'h4007;
              3'h6: pos_word = 16'hbffb;
              3'h7: pos_word = 16'hbe40;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f65;
            case (mant_lo3)
              3'h1: pos_word = 16'hc15c;
              3'h2: pos_word = 16'hbf29;
              3'h3: pos_word = 16'h3eb0;
              3'h4: pos_word = 16'h403d;
              3'h5: pos_word = 16'hbfc0;
              3'h6: pos_word = 16'hbd8d;
              3'h7: pos_word = 16'h3f90;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc0a7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf01;
              3'h2: pos_word = 16'h3ef5;
              3'h3: pos_word = 16'h4096;
              3'h4: pos_word = 16'hbf97;
              3'h5: pos_word = 16'h3d43;
              3'h6: pos_word = 16'h3fb8;
              3'h7: pos_word = 16'hc04b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbebc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f22;
              3'h2: pos_word = 16'h412a;
              3'h3: pos_word = 16'hbf6f;
              3'h4: pos_word = 16'h3e29;
              3'h5: pos_word = 16'h3fee;
              3'h6: pos_word = 16'hc00f;
              3'h7: pos_word = 16'hbe75;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc232;
              3'h2: pos_word = 16'hbf3c;
              3'h3: pos_word = 16'h3e93;
              3'h4: pos_word = 16'h4022;
              3'h5: pos_word = 16'hbfd7;
              3'h6: pos_word = 16'hbdf5;
              3'h7: pos_word = 16'h3f83;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc0e5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf12;
              3'h2: pos_word = 16'h3ed6;
              3'h3: pos_word = 16'h4070;
              3'h4: pos_word = 16'hbfa7;
              3'h5: pos_word = 16'hbb29;
              3'h6: pos_word = 16'h3fa5;
              3'h7: pos_word = 16'hc075;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbed9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f10;
              3'h2: pos_word = 16'h40dd;
              3'h3: pos_word = 16'hbf84;
              3'h4: pos_word = 16'h3dea;
              3'h5: pos_word = 16'h3fd4;
              3'h6: pos_word = 16'hc024;
              3'h7: pos_word = 16'hbe96;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f3a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4211;
              3'h2: pos_word = 16'hbf51;
              3'h3: pos_word = 16'h3e70;
              3'h4: pos_word = 16'h400d;
              3'h5: pos_word = 16'hbff1;
              3'h6: pos_word = 16'hbe2f;
              3'h7: pos_word = 16'h3f6c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc134;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf23;
              3'h2: pos_word = 16'h3eb9;
              3'h3: pos_word = 16'h4048;
              3'h4: pos_word = 16'hbfba;
              3'h5: pos_word = 16'hbd58;
              3'h6: pos_word = 16'h3f95;
              3'h7: pos_word = 16'hc09a;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbef8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eff;
              3'h2: pos_word = 16'h40a3;
              3'h3: pos_word = 16'hbf92;
              3'h4: pos_word = 16'h3d82;
              3'h5: pos_word = 16'h3fbe;
              3'h6: pos_word = 16'hc040;
              3'h7: pos_word = 16'hbeb3;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f27;
            case (mant_lo3)
              3'h1: pos_word = 16'h414d;
              3'h2: pos_word = 16'hbf67;
              3'h3: pos_word = 16'h3e3a;
              3'h4: pos_word = 16'h3ff8;
              3'h5: pos_word = 16'hc009;
              3'h6: pos_word = 16'hbe64;
              3'h7: pos_word = 16'h3f55;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc1d0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf36;
              3'h2: pos_word = 16'h3e9c;
              3'h3: pos_word = 16'h402a;
              3'h4: pos_word = 16'hbfcf;
              3'h5: pos_word = 16'hbdd4;
              3'h6: pos_word = 16'h3f87;
              3'h7: pos_word = 16'hc0cd;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf0c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee0;
              3'h2: pos_word = 16'h4080;
              3'h3: pos_word = 16'hbfa2;
              3'h4: pos_word = 16'h3c5a;
              3'h5: pos_word = 16'h3fab;
              3'h6: pos_word = 16'hc066;
              3'h7: pos_word = 16'hbed0;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f15;
            case (mant_lo3)
              3'h1: pos_word = 16'h40f9;
              3'h2: pos_word = 16'hbf80;
              3'h3: pos_word = 16'h3e05;
              3'h4: pos_word = 16'h3fdc;
              3'h5: pos_word = 16'hc01d;
              3'h6: pos_word = 16'hbe8d;
              3'h7: pos_word = 16'h3f41;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbe: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h42a9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e80;
              3'h2: pos_word = 16'hbfe8;
              3'h3: pos_word = 16'h3f74;
              3'h4: pos_word = 16'hbf1e;
              3'h5: pos_word = 16'h4053;
              3'h6: pos_word = 16'hbd17;
              3'h7: pos_word = 16'hc08f;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f05;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8d;
              3'h2: pos_word = 16'h3fc5;
              3'h3: pos_word = 16'hbea9;
              3'h4: pos_word = 16'h4181;
              3'h5: pos_word = 16'h3e4b;
              3'h6: pos_word = 16'hc003;
              3'h7: pos_word = 16'h3f5c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf30;
            case (mant_lo3)
              3'h1: pos_word = 16'h4032;
              3'h2: pos_word = 16'hbdb3;
              3'h3: pos_word = 16'hc0ba;
              3'h4: pos_word = 16'h3eea;
              3'h5: pos_word = 16'hbf9c;
              3'h6: pos_word = 16'h3fb1;
              3'h7: pos_word = 16'hbec6;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h410e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e16;
              3'h2: pos_word = 16'hc016;
              3'h3: pos_word = 16'h3f47;
              3'h4: pos_word = 16'hbf44;
              3'h5: pos_word = 16'h401a;
              3'h6: pos_word = 16'hbe0d;
              3'h7: pos_word = 16'hc104;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ecb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfae;
              3'h2: pos_word = 16'h3f9f;
              3'h3: pos_word = 16'hbee5;
              3'h4: pos_word = 16'h40c3;
              3'h5: pos_word = 16'h3dc4;
              3'h6: pos_word = 16'hc02e;
              3'h7: pos_word = 16'h3f33;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf59;
            case (mant_lo3)
              3'h1: pos_word = 16'h4006;
              3'h2: pos_word = 16'hbe42;
              3'h3: pos_word = 16'hc164;
              3'h4: pos_word = 16'h3eae;
              3'h5: pos_word = 16'hbfc1;
              3'h6: pos_word = 16'h3f90;
              3'h7: pos_word = 16'hbf02;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4094;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d39;
              3'h2: pos_word = 16'hc04d;
              3'h3: pos_word = 16'h3f21;
              3'h4: pos_word = 16'hbf70;
              3'h5: pos_word = 16'h3fed;
              3'h6: pos_word = 16'hbe78;
              3'h7: pos_word = 16'hc249;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e92;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd8;
              3'h2: pos_word = 16'h3f82;
              3'h3: pos_word = 16'hbf13;
              3'h4: pos_word = 16'h406e;
              3'h5: pos_word = 16'hbba9;
              3'h6: pos_word = 16'hc078;
              3'h7: pos_word = 16'h3f0f;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf85;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd3;
              3'h2: pos_word = 16'hbe98;
              3'h3: pos_word = 16'h4204;
              3'h4: pos_word = 16'h3e6d;
              3'h5: pos_word = 16'hbff3;
              3'h6: pos_word = 16'h3f6b;
              3'h7: pos_word = 16'hbf24;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4046;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd63;
              3'h2: pos_word = 16'hc09c;
              3'h3: pos_word = 16'h3efe;
              3'h4: pos_word = 16'hbf93;
              3'h5: pos_word = 16'h3fbd;
              3'h6: pos_word = 16'hbeb4;
              3'h7: pos_word = 16'h4146;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3e37;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00a;
              3'h2: pos_word = 16'h3f54;
              3'h3: pos_word = 16'hbf37;
              3'h4: pos_word = 16'h4028;
              3'h5: pos_word = 16'hbdd9;
              3'h6: pos_word = 16'hc0d1;
              3'h7: pos_word = 16'h3ede;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfa2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3faa;
              3'h2: pos_word = 16'hbed1;
              3'h3: pos_word = 16'h40f4;
              3'h4: pos_word = 16'h3e03;
              3'h5: pos_word = 16'hc01e;
              3'h6: pos_word = 16'h3f3f;
              3'h7: pos_word = 16'hbf4b;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4012;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe21;
              3'h2: pos_word = 16'hc11c;
              3'h3: pos_word = 16'h3ec0;
              3'h4: pos_word = 16'hbfb4;
              3'h5: pos_word = 16'h3f99;
              3'h6: pos_word = 16'hbef0;
              3'h7: pos_word = 16'h40af;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3d9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc038;
              3'h2: pos_word = 16'h3f2c;
              3'h3: pos_word = 16'hbf61;
              3'h4: pos_word = 16'h4000;
              3'h5: pos_word = 16'hbe56;
              3'h6: pos_word = 16'hc19b;
              3'h7: pos_word = 16'h3ea4;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfc9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8a;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'h4088;
              3'h4: pos_word = 16'h3cda;
              3'h5: pos_word = 16'hc05b;
              3'h6: pos_word = 16'h3f1a;
              3'h7: pos_word = 16'hbf79;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3fe3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe86;
              3'h2: pos_word = 16'hc427;
              3'h3: pos_word = 16'h3e88;
              3'h4: pos_word = 16'hbfe1;
              3'h5: pos_word = 16'h3f7a;
              3'h6: pos_word = 16'hbf19;
              3'h7: pos_word = 16'h405e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbf: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbcc1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f09;
              3'h2: pos_word = 16'h3fca;
              3'h3: pos_word = 16'h41a4;
              3'h4: pos_word = 16'hbffe;
              3'h5: pos_word = 16'hbf2b;
              3'h6: pos_word = 16'hbd97;
              3'h7: pos_word = 16'h3ef2;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fb6;
            case (mant_lo3)
              3'h1: pos_word = 16'h4121;
              3'h2: pos_word = 16'hc011;
              3'h3: pos_word = 16'hbf3e;
              3'h4: pos_word = 16'hbdff;
              3'h5: pos_word = 16'h3ed3;
              3'h6: pos_word = 16'h3fa3;
              3'h7: pos_word = 16'h40d5;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc027;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf53;
              3'h2: pos_word = 16'hbe34;
              3'h3: pos_word = 16'h3eb6;
              3'h4: pos_word = 16'h3f94;
              3'h5: pos_word = 16'h409e;
              3'h6: pos_word = 16'hc044;
              3'h7: pos_word = 16'hbf6a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe6a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e99;
              3'h2: pos_word = 16'h3f85;
              3'h3: pos_word = 16'h407b;
              3'h4: pos_word = 16'hc06b;
              3'h5: pos_word = 16'hbf81;
              3'h6: pos_word = 16'hbe90;
              3'h7: pos_word = 16'h3e7b;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f71;
            case (mant_lo3)
              3'h1: pos_word = 16'h404f;
              3'h2: pos_word = 16'hc092;
              3'h3: pos_word = 16'hbf8f;
              3'h4: pos_word = 16'hbeac;
              3'h5: pos_word = 16'h3e45;
              3'h6: pos_word = 16'h3f5a;
              3'h7: pos_word = 16'h402f;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0c0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9e;
              3'h2: pos_word = 16'hbeca;
              3'h3: pos_word = 16'h3e11;
              3'h4: pos_word = 16'h3f45;
              3'h5: pos_word = 16'h4017;
              3'h6: pos_word = 16'hc10a;
              3'h7: pos_word = 16'hbfaf;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbee8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3db9;
              3'h2: pos_word = 16'h3f31;
              3'h3: pos_word = 16'h4004;
              3'h4: pos_word = 16'hc176;
              3'h5: pos_word = 16'hbfc3;
              3'h6: pos_word = 16'hbf04;
              3'h7: pos_word = 16'h3d23;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f1f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fea;
              3'h2: pos_word = 16'hc287;
              3'h3: pos_word = 16'hbfda;
              3'h4: pos_word = 16'hbf14;
              3'h5: pos_word = 16'hbc29;
              3'h6: pos_word = 16'h3f0d;
              3'h7: pos_word = 16'h3fd0;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h41e2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff6;
              3'h2: pos_word = 16'hbf26;
              3'h3: pos_word = 16'hbd78;
              3'h4: pos_word = 16'h3efa;
              3'h5: pos_word = 16'h3fbb;
              3'h6: pos_word = 16'h413a;
              3'h7: pos_word = 16'hc00c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf39;
            case (mant_lo3)
              3'h1: pos_word = 16'hbde4;
              3'h2: pos_word = 16'h3edb;
              3'h3: pos_word = 16'h3fa8;
              3'h4: pos_word = 16'h40ea;
              3'h5: pos_word = 16'hc020;
              3'h6: pos_word = 16'hbf4d;
              3'h7: pos_word = 16'hbe26;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3ebd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f98;
              3'h2: pos_word = 16'h40aa;
              3'h3: pos_word = 16'hc03b;
              3'h4: pos_word = 16'hbf63;
              3'h5: pos_word = 16'hbe5b;
              3'h6: pos_word = 16'h3ea1;
              3'h7: pos_word = 16'h3f89;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4085;
            case (mant_lo3)
              3'h1: pos_word = 16'hc05f;
              3'h2: pos_word = 16'hbf7b;
              3'h3: pos_word = 16'hbe89;
              3'h4: pos_word = 16'h3e85;
              3'h5: pos_word = 16'h3f78;
              3'h6: pos_word = 16'h4059;
              3'h7: pos_word = 16'hc089;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea5;
              3'h2: pos_word = 16'h3e54;
              3'h3: pos_word = 16'h3f60;
              3'h4: pos_word = 16'h4037;
              3'h5: pos_word = 16'hc0b1;
              3'h6: pos_word = 16'hbf9a;
              3'h7: pos_word = 16'hbec2;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3e1f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4a;
              3'h2: pos_word = 16'h401d;
              3'h3: pos_word = 16'hc0f8;
              3'h4: pos_word = 16'hbfab;
              3'h5: pos_word = 16'hbee0;
              3'h6: pos_word = 16'h3dd4;
              3'h7: pos_word = 16'h3f36;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4009;
            case (mant_lo3)
              3'h1: pos_word = 16'hc14c;
              3'h2: pos_word = 16'hbfbe;
              3'h3: pos_word = 16'hbeff;
              3'h4: pos_word = 16'h3d5a;
              3'h5: pos_word = 16'h3f24;
              3'h6: pos_word = 16'h3ff2;
              3'h7: pos_word = 16'hc20e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfd4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf10;
              3'h2: pos_word = 16'h3b44;
              3'h3: pos_word = 16'h3f12;
              3'h4: pos_word = 16'h3fd7;
              3'h5: pos_word = 16'h4235;
              3'h6: pos_word = 16'hbfee;
              3'h7: pos_word = 16'hbf21;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc0: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbd41;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc0;
              3'h2: pos_word = 16'hc007;
              3'h3: pos_word = 16'hbdc8;
              3'h4: pos_word = 16'h3fad;
              3'h5: pos_word = 16'hc01a;
              3'h6: pos_word = 16'hbe18;
              3'h7: pos_word = 16'h3f9c;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc033;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe4d;
              3'h2: pos_word = 16'h3f8d;
              3'h3: pos_word = 16'hc055;
              3'h4: pos_word = 16'hbe82;
              3'h5: pos_word = 16'h3f7f;
              3'h6: pos_word = 16'hc082;
              3'h7: pos_word = 16'hbe9d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f66;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a5;
              3'h2: pos_word = 16'hbeba;
              3'h3: pos_word = 16'h3f50;
              3'h4: pos_word = 16'hc0e0;
              3'h5: pos_word = 16'hbed8;
              3'h6: pos_word = 16'h3f3b;
              3'h7: pos_word = 16'hc12e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbef7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f28;
              3'h2: pos_word = 16'hc1c1;
              3'h3: pos_word = 16'hbf0c;
              3'h4: pos_word = 16'h3f17;
              3'h5: pos_word = 16'h42e3;
              3'h6: pos_word = 16'hbf1d;
              3'h7: pos_word = 16'h3f06;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4187;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2f;
              3'h2: pos_word = 16'h3eec;
              3'h3: pos_word = 16'h4112;
              3'h4: pos_word = 16'hbf42;
              3'h5: pos_word = 16'h3ecd;
              3'h6: pos_word = 16'h40c7;
              3'h7: pos_word = 16'hbf58;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3eb0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4096;
              3'h2: pos_word = 16'hbf6e;
              3'h3: pos_word = 16'h3e94;
              3'h4: pos_word = 16'h4071;
              3'h5: pos_word = 16'hbf84;
              3'h6: pos_word = 16'h3e70;
              3'h7: pos_word = 16'h4048;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e3b;
              3'h2: pos_word = 16'h402a;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'h3e06;
              3'h5: pos_word = 16'h4013;
              3'h6: pos_word = 16'hbfb3;
              3'h7: pos_word = 16'h3da4;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4001;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc8;
              3'h2: pos_word = 16'h3cf2;
              3'h3: pos_word = 16'h3fe4;
              3'h4: pos_word = 16'hbfe0;
              3'h5: pos_word = 16'hbca9;
              3'h6: pos_word = 16'h3fcc;
              3'h7: pos_word = 16'hbffc;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbd91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb7;
              3'h2: pos_word = 16'hc010;
              3'h3: pos_word = 16'hbdf9;
              3'h4: pos_word = 16'h3fa4;
              3'h5: pos_word = 16'hc025;
              3'h6: pos_word = 16'hbe31;
              3'h7: pos_word = 16'h3f94;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc042;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe66;
              3'h2: pos_word = 16'h3f86;
              3'h3: pos_word = 16'hc068;
              3'h4: pos_word = 16'hbe8f;
              3'h5: pos_word = 16'h3f73;
              3'h6: pos_word = 16'hc090;
              3'h7: pos_word = 16'hbeab;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f5b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0bc;
              3'h2: pos_word = 16'hbec8;
              3'h3: pos_word = 16'h3f46;
              3'h4: pos_word = 16'hc107;
              3'h5: pos_word = 16'hbee6;
              3'h6: pos_word = 16'h3f32;
              3'h7: pos_word = 16'hc16b;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf03;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f20;
              3'h2: pos_word = 16'hc261;
              3'h3: pos_word = 16'hbf13;
              3'h4: pos_word = 16'h3f0e;
              3'h5: pos_word = 16'h41f7;
              3'h6: pos_word = 16'hbf25;
              3'h7: pos_word = 16'h3efc;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4141;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf38;
              3'h2: pos_word = 16'h3edd;
              3'h3: pos_word = 16'h40f0;
              3'h4: pos_word = 16'hbf4c;
              3'h5: pos_word = 16'h3ebf;
              3'h6: pos_word = 16'h40ad;
              3'h7: pos_word = 16'hbf62;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ea2;
            case (mant_lo3)
              3'h1: pos_word = 16'h4087;
              3'h2: pos_word = 16'hbf7a;
              3'h3: pos_word = 16'h3e87;
              3'h4: pos_word = 16'h405c;
              3'h5: pos_word = 16'hbf8a;
              3'h6: pos_word = 16'h3e57;
              3'h7: pos_word = 16'h4039;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf99;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e22;
              3'h2: pos_word = 16'h401f;
              3'h3: pos_word = 16'hbfaa;
              3'h4: pos_word = 16'h3ddb;
              3'h5: pos_word = 16'h400a;
              3'h6: pos_word = 16'hbfbd;
              3'h7: pos_word = 16'h3d66;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3ff3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd3;
              3'h2: pos_word = 16'h3bc4;
              3'h3: pos_word = 16'h3fd8;
              3'h4: pos_word = 16'hbfec;
              3'h5: pos_word = 16'hbd35;
              3'h6: pos_word = 16'h3fc1;
              3'h7: pos_word = 16'hc006;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc1: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbdc2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc019;
              3'h2: pos_word = 16'h3f9d;
              3'h3: pos_word = 16'hbe4a;
              3'h4: pos_word = 16'hc052;
              3'h5: pos_word = 16'h3f80;
              3'h6: pos_word = 16'hbe9c;
              3'h7: pos_word = 16'hc0a2;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f51;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed6;
              3'h2: pos_word = 16'hc129;
              3'h3: pos_word = 16'h3f29;
              3'h4: pos_word = 16'hbf0b;
              3'h5: pos_word = 16'h432c;
              3'h6: pos_word = 16'h3f07;
              3'h7: pos_word = 16'hbf2e;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4116;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ecf;
              3'h2: pos_word = 16'hbf56;
              3'h3: pos_word = 16'h4099;
              3'h4: pos_word = 16'h3e95;
              3'h5: pos_word = 16'hbf83;
              3'h6: pos_word = 16'h404a;
              3'h7: pos_word = 16'h3e3e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfa0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4014;
              3'h2: pos_word = 16'h3daa;
              3'h3: pos_word = 16'hbfc6;
              3'h4: pos_word = 16'h3fe6;
              3'h5: pos_word = 16'hbc90;
              3'h6: pos_word = 16'hbffa;
              3'h7: pos_word = 16'h3fb8;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbdf3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc024;
              3'h2: pos_word = 16'h3f95;
              3'h3: pos_word = 16'hbe63;
              3'h4: pos_word = 16'hc066;
              3'h5: pos_word = 16'h3f74;
              3'h6: pos_word = 16'hbea9;
              3'h7: pos_word = 16'hc0b9;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f47;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee4;
              3'h2: pos_word = 16'hc161;
              3'h3: pos_word = 16'h3f21;
              3'h4: pos_word = 16'hbf12;
              3'h5: pos_word = 16'h4208;
              3'h6: pos_word = 16'h3efe;
              3'h7: pos_word = 16'hbf37;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h40f5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec1;
              3'h2: pos_word = 16'hbf61;
              3'h3: pos_word = 16'h4089;
              3'h4: pos_word = 16'h3e88;
              3'h5: pos_word = 16'hbf89;
              3'h6: pos_word = 16'h403a;
              3'h7: pos_word = 16'h3e25;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfa8;
            case (mant_lo3)
              3'h1: pos_word = 16'h400b;
              3'h2: pos_word = 16'h3d73;
              3'h3: pos_word = 16'hbfd1;
              3'h4: pos_word = 16'h3fda;
              3'h5: pos_word = 16'hbd29;
              3'h6: pos_word = 16'hc005;
              3'h7: pos_word = 16'h3faf;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe12;
            case (mant_lo3)
              3'h1: pos_word = 16'hc030;
              3'h2: pos_word = 16'h3f8e;
              3'h3: pos_word = 16'hbe7d;
              3'h4: pos_word = 16'hc07d;
              3'h5: pos_word = 16'h3f69;
              3'h6: pos_word = 16'hbeb6;
              3'h7: pos_word = 16'hc0d7;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f3e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef3;
              3'h2: pos_word = 16'hc1a9;
              3'h3: pos_word = 16'h3f19;
              3'h4: pos_word = 16'hbf1b;
              3'h5: pos_word = 16'h4197;
              3'h6: pos_word = 16'h3eef;
              3'h7: pos_word = 16'hbf40;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h40cf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb3;
              3'h2: pos_word = 16'hbf6c;
              3'h3: pos_word = 16'h4077;
              3'h4: pos_word = 16'h3e77;
              3'h5: pos_word = 16'hbf90;
              3'h6: pos_word = 16'h402d;
              3'h7: pos_word = 16'h3e0c;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h4003;
              3'h2: pos_word = 16'h3d12;
              3'h3: pos_word = 16'hbfdd;
              3'h4: pos_word = 16'h3fce;
              3'h5: pos_word = 16'hbd85;
              3'h6: pos_word = 16'hc00d;
              3'h7: pos_word = 16'h3fa7;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbe2b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03e;
              3'h2: pos_word = 16'h3f88;
              3'h3: pos_word = 16'hbe8b;
              3'h4: pos_word = 16'hc08c;
              3'h5: pos_word = 16'h3f5e;
              3'h6: pos_word = 16'hbec4;
              3'h7: pos_word = 16'hc100;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f35;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf01;
              3'h2: pos_word = 16'hc228;
              3'h3: pos_word = 16'h3f11;
              3'h4: pos_word = 16'hbf23;
              3'h5: pos_word = 16'h4150;
              3'h6: pos_word = 16'h3ee1;
              3'h7: pos_word = 16'hbf4a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h40b3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea6;
              3'h2: pos_word = 16'hbf77;
              3'h3: pos_word = 16'h4061;
              3'h4: pos_word = 16'h3e5d;
              3'h5: pos_word = 16'hbf97;
              3'h6: pos_word = 16'h4021;
              3'h7: pos_word = 16'h3de7;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfba;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff7;
              3'h2: pos_word = 16'h3c44;
              3'h3: pos_word = 16'hbfe9;
              3'h4: pos_word = 16'h3fc4;
              3'h5: pos_word = 16'hbdb6;
              3'h6: pos_word = 16'hc017;
              3'h7: pos_word = 16'h3f9f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc2: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe44;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f82;
              3'h2: pos_word = 16'hc09d;
              3'h3: pos_word = 16'hbed2;
              3'h4: pos_word = 16'h3f2c;
              3'h5: pos_word = 16'hc5b9;
              3'h6: pos_word = 16'hbf2c;
              3'h7: pos_word = 16'h3ed2;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h409d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf81;
              3'h2: pos_word = 16'h3e44;
              3'h3: pos_word = 16'h4017;
              3'h4: pos_word = 16'hbfc4;
              3'h5: pos_word = 16'hbc3f;
              3'h6: pos_word = 16'h3fba;
              3'h7: pos_word = 16'hc021;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe5d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f77;
              3'h2: pos_word = 16'hc0b3;
              3'h3: pos_word = 16'hbee0;
              3'h4: pos_word = 16'h3f23;
              3'h5: pos_word = 16'h422b;
              3'h6: pos_word = 16'hbf34;
              3'h7: pos_word = 16'h3ec4;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h408c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf88;
              3'h2: pos_word = 16'h3e2b;
              3'h3: pos_word = 16'h400d;
              3'h4: pos_word = 16'hbfce;
              3'h5: pos_word = 16'hbd10;
              3'h6: pos_word = 16'h3fb1;
              3'h7: pos_word = 16'hc02d;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbe76;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6c;
              3'h2: pos_word = 16'hc0ce;
              3'h3: pos_word = 16'hbeef;
              3'h4: pos_word = 16'h3f1b;
              3'h5: pos_word = 16'h41aa;
              3'h6: pos_word = 16'hbf3e;
              3'h7: pos_word = 16'h3eb7;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h407d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8e;
              3'h2: pos_word = 16'h3e12;
              3'h3: pos_word = 16'h4005;
              3'h4: pos_word = 16'hbfda;
              3'h5: pos_word = 16'hbd71;
              3'h6: pos_word = 16'h3fa9;
              3'h7: pos_word = 16'hc03a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe88;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f61;
              3'h2: pos_word = 16'hc0f4;
              3'h3: pos_word = 16'hbefe;
              3'h4: pos_word = 16'h3f13;
              3'h5: pos_word = 16'h4162;
              3'h6: pos_word = 16'hbf47;
              3'h7: pos_word = 16'h3ea9;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4066;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf95;
              3'h2: pos_word = 16'h3df4;
              3'h3: pos_word = 16'h3ffb;
              3'h4: pos_word = 16'hbfe6;
              3'h5: pos_word = 16'hbda9;
              3'h6: pos_word = 16'h3fa1;
              3'h7: pos_word = 16'hc04a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f56;
              3'h2: pos_word = 16'hc116;
              3'h3: pos_word = 16'hbf07;
              3'h4: pos_word = 16'h3f0b;
              3'h5: pos_word = 16'h4129;
              3'h6: pos_word = 16'hbf51;
              3'h7: pos_word = 16'h3e9c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4053;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9d;
              3'h2: pos_word = 16'h3dc3;
              3'h3: pos_word = 16'h3fed;
              3'h4: pos_word = 16'hbff3;
              3'h5: pos_word = 16'hbdda;
              3'h6: pos_word = 16'h3f99;
              3'h7: pos_word = 16'hc05b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbea2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4c;
              3'h2: pos_word = 16'hc140;
              3'h3: pos_word = 16'hbf0e;
              3'h4: pos_word = 16'h3f03;
              3'h5: pos_word = 16'h4107;
              3'h6: pos_word = 16'hbf5b;
              3'h7: pos_word = 16'h3e8f;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4042;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa4;
              3'h2: pos_word = 16'h3d92;
              3'h3: pos_word = 16'h3fe0;
              3'h4: pos_word = 16'hc001;
              3'h5: pos_word = 16'hbe05;
              3'h6: pos_word = 16'h3f92;
              3'h7: pos_word = 16'hc070;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbeb0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f43;
              3'h2: pos_word = 16'hc187;
              3'h3: pos_word = 16'hbf16;
              3'h4: pos_word = 16'h3ef7;
              3'h5: pos_word = 16'h40e1;
              3'h6: pos_word = 16'hbf66;
              3'h7: pos_word = 16'h3e82;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4034;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfad;
              3'h2: pos_word = 16'h3d43;
              3'h3: pos_word = 16'h3fd4;
              3'h4: pos_word = 16'hc009;
              3'h5: pos_word = 16'hbe1e;
              3'h6: pos_word = 16'h3f8b;
              3'h7: pos_word = 16'hc085;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbebd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f39;
              3'h2: pos_word = 16'hc1e0;
              3'h3: pos_word = 16'hbf1f;
              3'h4: pos_word = 16'h3ee8;
              3'h5: pos_word = 16'h40c0;
              3'h6: pos_word = 16'hbf71;
              3'h7: pos_word = 16'h3e6a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4027;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb5;
              3'h2: pos_word = 16'h3cc4;
              3'h3: pos_word = 16'h3fc9;
              3'h4: pos_word = 16'hc012;
              3'h5: pos_word = 16'hbe37;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'hc094;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc3: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbecb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc2a5;
              3'h2: pos_word = 16'h3eda;
              3'h3: pos_word = 16'hbf7d;
              3'h4: pos_word = 16'h401c;
              3'h5: pos_word = 16'h39b1;
              3'h6: pos_word = 16'hc01c;
              3'h7: pos_word = 16'h3f7d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbed9;
            case (mant_lo3)
              3'h1: pos_word = 16'h42ae;
              3'h2: pos_word = 16'h3ecb;
              3'h3: pos_word = 16'hbf85;
              3'h4: pos_word = 16'h4012;
              3'h5: pos_word = 16'hbcbf;
              3'h6: pos_word = 16'hc027;
              3'h7: pos_word = 16'h3f71;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbee8;
            case (mant_lo3)
              3'h1: pos_word = 16'h41e4;
              3'h2: pos_word = 16'h3ebe;
              3'h3: pos_word = 16'hbf8b;
              3'h4: pos_word = 16'h4009;
              3'h5: pos_word = 16'hbd40;
              3'h6: pos_word = 16'hc033;
              3'h7: pos_word = 16'h3f66;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbef6;
            case (mant_lo3)
              3'h1: pos_word = 16'h4188;
              3'h2: pos_word = 16'h3eb0;
              3'h3: pos_word = 16'hbf92;
              3'h4: pos_word = 16'h4001;
              3'h5: pos_word = 16'hbd91;
              3'h6: pos_word = 16'hc042;
              3'h7: pos_word = 16'h3f5c;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf03;
            case (mant_lo3)
              3'h1: pos_word = 16'h4142;
              3'h2: pos_word = 16'h3ea3;
              3'h3: pos_word = 16'hbf99;
              3'h4: pos_word = 16'h3ff4;
              3'h5: pos_word = 16'hbdc1;
              3'h6: pos_word = 16'hc052;
              3'h7: pos_word = 16'h3f51;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf0a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4117;
              3'h2: pos_word = 16'h3e95;
              3'h3: pos_word = 16'hbfa0;
              3'h4: pos_word = 16'h3fe6;
              3'h5: pos_word = 16'hbdf2;
              3'h6: pos_word = 16'hc065;
              3'h7: pos_word = 16'h3f47;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf12;
            case (mant_lo3)
              3'h1: pos_word = 16'h40f6;
              3'h2: pos_word = 16'h3e88;
              3'h3: pos_word = 16'hbfa8;
              3'h4: pos_word = 16'h3fda;
              3'h5: pos_word = 16'hbe12;
              3'h6: pos_word = 16'hc07c;
              3'h7: pos_word = 16'h3f3e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf1a;
            case (mant_lo3)
              3'h1: pos_word = 16'h40cf;
              3'h2: pos_word = 16'h3e77;
              3'h3: pos_word = 16'hbfb1;
              3'h4: pos_word = 16'h3fcf;
              3'h5: pos_word = 16'hbe2a;
              3'h6: pos_word = 16'hc08c;
              3'h7: pos_word = 16'h3f35;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf23;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b3;
              3'h2: pos_word = 16'h3e5e;
              3'h3: pos_word = 16'hbfba;
              3'h4: pos_word = 16'h3fc4;
              3'h5: pos_word = 16'hbe43;
              3'h6: pos_word = 16'hc09d;
              3'h7: pos_word = 16'h3f2c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf2b;
            case (mant_lo3)
              3'h1: pos_word = 16'h409e;
              3'h2: pos_word = 16'h3e44;
              3'h3: pos_word = 16'hbfc4;
              3'h4: pos_word = 16'h3fba;
              3'h5: pos_word = 16'hbe5c;
              3'h6: pos_word = 16'hc0b2;
              3'h7: pos_word = 16'h3f23;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf34;
            case (mant_lo3)
              3'h1: pos_word = 16'h408d;
              3'h2: pos_word = 16'h3e2b;
              3'h3: pos_word = 16'hbfce;
              3'h4: pos_word = 16'h3fb1;
              3'h5: pos_word = 16'hbe76;
              3'h6: pos_word = 16'hc0ce;
              3'h7: pos_word = 16'h3f1b;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf3d;
            case (mant_lo3)
              3'h1: pos_word = 16'h407d;
              3'h2: pos_word = 16'h3e13;
              3'h3: pos_word = 16'hbfd9;
              3'h4: pos_word = 16'h3fa9;
              3'h5: pos_word = 16'hbe88;
              3'h6: pos_word = 16'hc0f4;
              3'h7: pos_word = 16'h3f13;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf47;
            case (mant_lo3)
              3'h1: pos_word = 16'h4066;
              3'h2: pos_word = 16'h3df4;
              3'h3: pos_word = 16'hbfe6;
              3'h4: pos_word = 16'h3fa1;
              3'h5: pos_word = 16'hbe95;
              3'h6: pos_word = 16'hc115;
              3'h7: pos_word = 16'h3f0b;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf51;
            case (mant_lo3)
              3'h1: pos_word = 16'h4053;
              3'h2: pos_word = 16'h3dc3;
              3'h3: pos_word = 16'hbff3;
              3'h4: pos_word = 16'h3f99;
              3'h5: pos_word = 16'hbea2;
              3'h6: pos_word = 16'hc140;
              3'h7: pos_word = 16'h3f03;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf5b;
            case (mant_lo3)
              3'h1: pos_word = 16'h4042;
              3'h2: pos_word = 16'h3d93;
              3'h3: pos_word = 16'hc001;
              3'h4: pos_word = 16'h3f92;
              3'h5: pos_word = 16'hbeaf;
              3'h6: pos_word = 16'hc186;
              3'h7: pos_word = 16'h3ef7;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf66;
            case (mant_lo3)
              3'h1: pos_word = 16'h4034;
              3'h2: pos_word = 16'h3d44;
              3'h3: pos_word = 16'hc009;
              3'h4: pos_word = 16'h3f8b;
              3'h5: pos_word = 16'hbebd;
              3'h6: pos_word = 16'hc1de;
              3'h7: pos_word = 16'h3ee8;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc4: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf71;
            case (mant_lo3)
              3'h1: pos_word = 16'h3cc7;
              3'h2: pos_word = 16'h3f85;
              3'h3: pos_word = 16'hc2a0;
              3'h4: pos_word = 16'hbf7d;
              3'h5: pos_word = 16'h3a31;
              3'h6: pos_word = 16'h3f7d;
              3'h7: pos_word = 16'h42b4;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf84;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcbc;
              3'h2: pos_word = 16'h3f72;
              3'h3: pos_word = 16'h41e6;
              3'h4: pos_word = 16'hbf8b;
              3'h5: pos_word = 16'hbd3f;
              3'h6: pos_word = 16'h3f66;
              3'h7: pos_word = 16'h4189;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf92;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd90;
              3'h2: pos_word = 16'h3f5c;
              3'h3: pos_word = 16'h4143;
              3'h4: pos_word = 16'hbf99;
              3'h5: pos_word = 16'hbdc1;
              3'h6: pos_word = 16'h3f51;
              3'h7: pos_word = 16'h4117;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfa0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdf1;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'h40f6;
              3'h4: pos_word = 16'hbfa8;
              3'h5: pos_word = 16'hbe11;
              3'h6: pos_word = 16'h3f3e;
              3'h7: pos_word = 16'h40d0;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbfb1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe2a;
              3'h2: pos_word = 16'h3f35;
              3'h3: pos_word = 16'h40b4;
              3'h4: pos_word = 16'hbfba;
              3'h5: pos_word = 16'hbe43;
              3'h6: pos_word = 16'h3f2c;
              3'h7: pos_word = 16'h409e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfc4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5c;
              3'h2: pos_word = 16'h3f23;
              3'h3: pos_word = 16'h408d;
              3'h4: pos_word = 16'hbfce;
              3'h5: pos_word = 16'hbe76;
              3'h6: pos_word = 16'h3f1b;
              3'h7: pos_word = 16'h407e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfd9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe88;
              3'h2: pos_word = 16'h3f13;
              3'h3: pos_word = 16'h4067;
              3'h4: pos_word = 16'hbfe5;
              3'h5: pos_word = 16'hbe95;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h4053;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbff3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea2;
              3'h2: pos_word = 16'h3f03;
              3'h3: pos_word = 16'h4042;
              3'h4: pos_word = 16'hc001;
              3'h5: pos_word = 16'hbeaf;
              3'h6: pos_word = 16'h3ef7;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc009;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebd;
              3'h2: pos_word = 16'h3ee8;
              3'h3: pos_word = 16'h4027;
              3'h4: pos_word = 16'hc012;
              3'h5: pos_word = 16'hbecb;
              3'h6: pos_word = 16'h3eda;
              3'h7: pos_word = 16'h401c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc01b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed9;
              3'h2: pos_word = 16'h3ecc;
              3'h3: pos_word = 16'h4012;
              3'h4: pos_word = 16'hc026;
              3'h5: pos_word = 16'hbee7;
              3'h6: pos_word = 16'h3ebe;
              3'h7: pos_word = 16'h4009;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc033;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef6;
              3'h2: pos_word = 16'h3eb0;
              3'h3: pos_word = 16'h4001;
              3'h4: pos_word = 16'hc041;
              3'h5: pos_word = 16'hbf02;
              3'h6: pos_word = 16'h3ea3;
              3'h7: pos_word = 16'h3ff4;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc052;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0a;
              3'h2: pos_word = 16'h3e96;
              3'h3: pos_word = 16'h3fe7;
              3'h4: pos_word = 16'hc065;
              3'h5: pos_word = 16'hbf12;
              3'h6: pos_word = 16'h3e89;
              3'h7: pos_word = 16'h3fda;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc07c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf1a;
              3'h2: pos_word = 16'h3e78;
              3'h3: pos_word = 16'h3fcf;
              3'h4: pos_word = 16'hc08b;
              3'h5: pos_word = 16'hbf23;
              3'h6: pos_word = 16'h3e5e;
              3'h7: pos_word = 16'h3fc4;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc09c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2b;
              3'h2: pos_word = 16'h3e45;
              3'h3: pos_word = 16'h3fbb;
              3'h4: pos_word = 16'hc0b2;
              3'h5: pos_word = 16'hbf34;
              3'h6: pos_word = 16'h3e2c;
              3'h7: pos_word = 16'h3fb2;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc0cd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3d;
              3'h2: pos_word = 16'h3e13;
              3'h3: pos_word = 16'h3fa9;
              3'h4: pos_word = 16'hc0f3;
              3'h5: pos_word = 16'hbf47;
              3'h6: pos_word = 16'h3df6;
              3'h7: pos_word = 16'h3fa1;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc114;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf51;
              3'h2: pos_word = 16'h3dc5;
              3'h3: pos_word = 16'h3f99;
              3'h4: pos_word = 16'hc13e;
              3'h5: pos_word = 16'hbf5b;
              3'h6: pos_word = 16'h3d94;
              3'h7: pos_word = 16'h3f92;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc5: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc184;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d47;
              3'h2: pos_word = 16'hc1da;
              3'h3: pos_word = 16'h3ccc;
              3'h4: pos_word = 16'hc298;
              3'h5: pos_word = 16'h3ab1;
              3'h6: pos_word = 16'h42bf;
              3'h7: pos_word = 16'hbcb6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h41eb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd3c;
              3'h2: pos_word = 16'h418b;
              3'h3: pos_word = 16'hbd8e;
              3'h4: pos_word = 16'h4144;
              3'h5: pos_word = 16'hbdbf;
              3'h6: pos_word = 16'h4118;
              3'h7: pos_word = 16'hbdf0;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h40f8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe11;
              3'h2: pos_word = 16'h40d1;
              3'h3: pos_word = 16'hbe29;
              3'h4: pos_word = 16'h40b4;
              3'h5: pos_word = 16'hbe42;
              3'h6: pos_word = 16'h409e;
              3'h7: pos_word = 16'hbe5b;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h408d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe75;
              3'h2: pos_word = 16'h407e;
              3'h3: pos_word = 16'hbe87;
              3'h4: pos_word = 16'h4067;
              3'h5: pos_word = 16'hbe94;
              3'h6: pos_word = 16'h4054;
              3'h7: pos_word = 16'hbea1;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4043;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeaf;
              3'h2: pos_word = 16'h4034;
              3'h3: pos_word = 16'hbebc;
              3'h4: pos_word = 16'h4028;
              3'h5: pos_word = 16'hbeca;
              3'h6: pos_word = 16'h401d;
              3'h7: pos_word = 16'hbed8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4013;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee7;
              3'h2: pos_word = 16'h400a;
              3'h3: pos_word = 16'hbef5;
              3'h4: pos_word = 16'h4002;
              3'h5: pos_word = 16'hbf02;
              3'h6: pos_word = 16'h3ff4;
              3'h7: pos_word = 16'hbf0a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3fe7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf12;
              3'h2: pos_word = 16'h3fdb;
              3'h3: pos_word = 16'hbf1a;
              3'h4: pos_word = 16'h3fcf;
              3'h5: pos_word = 16'hbf22;
              3'h6: pos_word = 16'h3fc5;
              3'h7: pos_word = 16'hbf2b;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3fbb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf34;
              3'h2: pos_word = 16'h3fb2;
              3'h3: pos_word = 16'hbf3d;
              3'h4: pos_word = 16'h3fa9;
              3'h5: pos_word = 16'hbf46;
              3'h6: pos_word = 16'h3fa1;
              3'h7: pos_word = 16'hbf50;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f9a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5b;
              3'h2: pos_word = 16'h3f92;
              3'h3: pos_word = 16'hbf65;
              3'h4: pos_word = 16'h3f8c;
              3'h5: pos_word = 16'hbf70;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'hbf7c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f7e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf84;
              3'h2: pos_word = 16'h3f72;
              3'h3: pos_word = 16'hbf8a;
              3'h4: pos_word = 16'h3f67;
              3'h5: pos_word = 16'hbf91;
              3'h6: pos_word = 16'h3f5c;
              3'h7: pos_word = 16'hbf98;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f52;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa0;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'hbfa8;
              3'h4: pos_word = 16'h3f3f;
              3'h5: pos_word = 16'hbfb0;
              3'h6: pos_word = 16'h3f35;
              3'h7: pos_word = 16'hbfb9;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc3;
              3'h2: pos_word = 16'h3f24;
              3'h3: pos_word = 16'hbfcd;
              3'h4: pos_word = 16'h3f1b;
              3'h5: pos_word = 16'hbfd9;
              3'h6: pos_word = 16'h3f13;
              3'h7: pos_word = 16'hbfe5;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f0b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff2;
              3'h2: pos_word = 16'h3f04;
              3'h3: pos_word = 16'hc000;
              3'h4: pos_word = 16'h3ef8;
              3'h5: pos_word = 16'hc008;
              3'h6: pos_word = 16'h3ee9;
              3'h7: pos_word = 16'hc011;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3edb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01b;
              3'h2: pos_word = 16'h3ecd;
              3'h3: pos_word = 16'hc026;
              3'h4: pos_word = 16'h3ebf;
              3'h5: pos_word = 16'hc032;
              3'h6: pos_word = 16'h3eb1;
              3'h7: pos_word = 16'hc040;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3ea4;
            case (mant_lo3)
              3'h1: pos_word = 16'hc051;
              3'h2: pos_word = 16'h3e97;
              3'h3: pos_word = 16'hc064;
              3'h4: pos_word = 16'h3e89;
              3'h5: pos_word = 16'hc07a;
              3'h6: pos_word = 16'h3e79;
              3'h7: pos_word = 16'hc08b;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e60;
            case (mant_lo3)
              3'h1: pos_word = 16'hc09b;
              3'h2: pos_word = 16'h3e47;
              3'h3: pos_word = 16'hc0b0;
              3'h4: pos_word = 16'h3e2e;
              3'h5: pos_word = 16'hc0cb;
              3'h6: pos_word = 16'h3e15;
              3'h7: pos_word = 16'hc0f0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc6: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3df8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dc7;
              3'h2: pos_word = 16'h3d97;
              3'h3: pos_word = 16'h3d4d;
              3'h4: pos_word = 16'h3cd8;
              3'h5: pos_word = 16'h3b31;
              3'h6: pos_word = 16'hbcab;
              3'h7: pos_word = 16'hbd36;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbd8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdbc;
              3'h2: pos_word = 16'hbded;
              3'h3: pos_word = 16'hbe0f;
              3'h4: pos_word = 16'hbe28;
              3'h5: pos_word = 16'hbe41;
              3'h6: pos_word = 16'hbe5a;
              3'h7: pos_word = 16'hbe73;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe87;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe94;
              3'h2: pos_word = 16'hbea1;
              3'h3: pos_word = 16'hbeae;
              3'h4: pos_word = 16'hbebc;
              3'h5: pos_word = 16'hbec9;
              3'h6: pos_word = 16'hbed8;
              3'h7: pos_word = 16'hbee6;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbef5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf02;
              3'h2: pos_word = 16'hbf0a;
              3'h3: pos_word = 16'hbf11;
              3'h4: pos_word = 16'hbf19;
              3'h5: pos_word = 16'hbf22;
              3'h6: pos_word = 16'hbf2a;
              3'h7: pos_word = 16'hbf33;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf3c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf46;
              3'h2: pos_word = 16'hbf50;
              3'h3: pos_word = 16'hbf5a;
              3'h4: pos_word = 16'hbf65;
              3'h5: pos_word = 16'hbf70;
              3'h6: pos_word = 16'hbf7b;
              3'h7: pos_word = 16'hbf84;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf8a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf91;
              3'h2: pos_word = 16'hbf98;
              3'h3: pos_word = 16'hbf9f;
              3'h4: pos_word = 16'hbfa7;
              3'h5: pos_word = 16'hbfb0;
              3'h6: pos_word = 16'hbfb9;
              3'h7: pos_word = 16'hbfc2;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfcd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd8;
              3'h2: pos_word = 16'hbfe4;
              3'h3: pos_word = 16'hbff1;
              3'h4: pos_word = 16'hc000;
              3'h5: pos_word = 16'hc008;
              3'h6: pos_word = 16'hc010;
              3'h7: pos_word = 16'hc01a;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc025;
            case (mant_lo3)
              3'h1: pos_word = 16'hc031;
              3'h2: pos_word = 16'hc03f;
              3'h3: pos_word = 16'hc050;
              3'h4: pos_word = 16'hc062;
              3'h5: pos_word = 16'hc079;
              3'h6: pos_word = 16'hc08a;
              3'h7: pos_word = 16'hc09a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc0af;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0ca;
              3'h2: pos_word = 16'hc0ee;
              3'h3: pos_word = 16'hc111;
              3'h4: pos_word = 16'hc138;
              3'h5: pos_word = 16'hc17d;
              3'h6: pos_word = 16'hc1cb;
              3'h7: pos_word = 16'hc27c;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4301;
            case (mant_lo3)
              3'h1: pos_word = 16'h41ff;
              3'h2: pos_word = 16'h4191;
              3'h3: pos_word = 16'h414b;
              3'h4: pos_word = 16'h411c;
              3'h5: pos_word = 16'h40fd;
              3'h6: pos_word = 16'h40d5;
              3'h7: pos_word = 16'h40b7;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h40a1;
            case (mant_lo3)
              3'h1: pos_word = 16'h408f;
              3'h2: pos_word = 16'h4081;
              3'h3: pos_word = 16'h406a;
              3'h4: pos_word = 16'h4056;
              3'h5: pos_word = 16'h4045;
              3'h6: pos_word = 16'h4036;
              3'h7: pos_word = 16'h4029;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h401e;
            case (mant_lo3)
              3'h1: pos_word = 16'h4014;
              3'h2: pos_word = 16'h400b;
              3'h3: pos_word = 16'h4002;
              3'h4: pos_word = 16'h3ff6;
              3'h5: pos_word = 16'h3fe8;
              3'h6: pos_word = 16'h3fdc;
              3'h7: pos_word = 16'h3fd1;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fc6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbc;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'h3faa;
              3'h4: pos_word = 16'h3fa2;
              3'h5: pos_word = 16'h3f9a;
              3'h6: pos_word = 16'h3f93;
              3'h7: pos_word = 16'h3f8c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f86;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7f;
              3'h2: pos_word = 16'h3f74;
              3'h3: pos_word = 16'h3f68;
              3'h4: pos_word = 16'h3f5e;
              3'h5: pos_word = 16'h3f53;
              3'h6: pos_word = 16'h3f49;
              3'h7: pos_word = 16'h3f40;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f36;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2d;
              3'h2: pos_word = 16'h3f25;
              3'h3: pos_word = 16'h3f1c;
              3'h4: pos_word = 16'h3f14;
              3'h5: pos_word = 16'h3f0c;
              3'h6: pos_word = 16'h3f04;
              3'h7: pos_word = 16'h3efa;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3eeb;
            case (mant_lo3)
              3'h1: pos_word = 16'h3edc;
              3'h2: pos_word = 16'h3ece;
              3'h3: pos_word = 16'h3ec0;
              3'h4: pos_word = 16'h3eb3;
              3'h5: pos_word = 16'h3ea5;
              3'h6: pos_word = 16'h3e98;
              3'h7: pos_word = 16'h3e8b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc7: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e7c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e49;
              3'h2: pos_word = 16'h3e18;
              3'h3: pos_word = 16'h3dcd;
              3'h4: pos_word = 16'h3d58;
              3'h5: pos_word = 16'h3bb1;
              3'h6: pos_word = 16'hbd2b;
              3'h7: pos_word = 16'hbdb7;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbe0c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe3e;
              3'h2: pos_word = 16'hbe70;
              3'h3: pos_word = 16'hbe92;
              3'h4: pos_word = 16'hbead;
              3'h5: pos_word = 16'hbec8;
              3'h6: pos_word = 16'hbee4;
              3'h7: pos_word = 16'hbf01;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf10;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf21;
              3'h2: pos_word = 16'hbf32;
              3'h3: pos_word = 16'hbf45;
              3'h4: pos_word = 16'hbf59;
              3'h5: pos_word = 16'hbf6e;
              3'h6: pos_word = 16'hbf83;
              3'h7: pos_word = 16'hbf90;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfaf;
              3'h2: pos_word = 16'hbfc1;
              3'h3: pos_word = 16'hbfd7;
              3'h4: pos_word = 16'hbff0;
              3'h5: pos_word = 16'hc007;
              3'h6: pos_word = 16'hc019;
              3'h7: pos_word = 16'hc030;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc04e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc076;
              3'h2: pos_word = 16'hc098;
              3'h3: pos_word = 16'hc0c6;
              3'h4: pos_word = 16'hc10d;
              3'h5: pos_word = 16'hc173;
              3'h6: pos_word = 16'hc258;
              3'h7: pos_word = 16'h420c;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4153;
            case (mant_lo3)
              3'h1: pos_word = 16'h4101;
              3'h2: pos_word = 16'h40ba;
              3'h3: pos_word = 16'h4091;
              3'h4: pos_word = 16'h406c;
              3'h5: pos_word = 16'h4047;
              3'h6: pos_word = 16'h402b;
              3'h7: pos_word = 16'h4015;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4003;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fea;
              3'h2: pos_word = 16'h3fd2;
              3'h3: pos_word = 16'h3fbd;
              3'h4: pos_word = 16'h3fab;
              3'h5: pos_word = 16'h3f9b;
              3'h6: pos_word = 16'h3f8d;
              3'h7: pos_word = 16'h3f80;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f6a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f54;
              3'h2: pos_word = 16'h3f41;
              3'h3: pos_word = 16'h3f2e;
              3'h4: pos_word = 16'h3f1d;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'h3efb;
              3'h7: pos_word = 16'h3ede;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3ec2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea7;
              3'h2: pos_word = 16'h3e8c;
              3'h3: pos_word = 16'h3e66;
              3'h4: pos_word = 16'h3e33;
              3'h5: pos_word = 16'h3e02;
              3'h6: pos_word = 16'h3da2;
              3'h7: pos_word = 16'h3d02;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbc7e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd81;
              3'h2: pos_word = 16'hbde2;
              3'h3: pos_word = 16'hbe22;
              3'h4: pos_word = 16'hbe54;
              3'h5: pos_word = 16'hbe84;
              3'h6: pos_word = 16'hbe9e;
              3'h7: pos_word = 16'hbeb9;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbed4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef1;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'hbf18;
              3'h4: pos_word = 16'hbf28;
              3'h5: pos_word = 16'hbf3a;
              3'h6: pos_word = 16'hbf4d;
              3'h7: pos_word = 16'hbf62;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf79;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf89;
              3'h2: pos_word = 16'hbf96;
              3'h3: pos_word = 16'hbfa5;
              3'h4: pos_word = 16'hbfb7;
              3'h5: pos_word = 16'hbfca;
              3'h6: pos_word = 16'hbfe1;
              3'h7: pos_word = 16'hbffc;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc00e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc022;
              3'h2: pos_word = 16'hc03c;
              3'h3: pos_word = 16'hc05e;
              3'h4: pos_word = 16'hc086;
              3'h5: pos_word = 16'hc0aa;
              3'h6: pos_word = 16'hc0e4;
              3'h7: pos_word = 16'hc12d;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc1b2;
            case (mant_lo3)
              3'h1: pos_word = 16'h43d5;
              3'h2: pos_word = 16'h41a1;
              3'h3: pos_word = 16'h4125;
              3'h4: pos_word = 16'h40dd;
              3'h5: pos_word = 16'h40a5;
              3'h6: pos_word = 16'h4084;
              3'h7: pos_word = 16'h405a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4039;
            case (mant_lo3)
              3'h1: pos_word = 16'h4020;
              3'h2: pos_word = 16'h400d;
              3'h3: pos_word = 16'h3ff9;
              3'h4: pos_word = 16'h3fdf;
              3'h5: pos_word = 16'h3fc8;
              3'h6: pos_word = 16'h3fb5;
              3'h7: pos_word = 16'h3fa4;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f87;
              3'h2: pos_word = 16'h3f76;
              3'h3: pos_word = 16'h3f60;
              3'h4: pos_word = 16'h3f4b;
              3'h5: pos_word = 16'h3f38;
              3'h6: pos_word = 16'h3f27;
              3'h7: pos_word = 16'h3f16;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc8: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f06;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed2;
              3'h2: pos_word = 16'h3e9b;
              3'h3: pos_word = 16'h3e4f;
              3'h4: pos_word = 16'h3dd8;
              3'h5: pos_word = 16'h3c31;
              3'h6: pos_word = 16'hbdac;
              3'h7: pos_word = 16'hbe38;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbe8f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec5;
              3'h2: pos_word = 16'hbefe;
              3'h3: pos_word = 16'hbf1f;
              3'h4: pos_word = 16'hbf43;
              3'h5: pos_word = 16'hbf6c;
              3'h6: pos_word = 16'hbf8e;
              3'h7: pos_word = 16'hbfad;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfd4;
            case (mant_lo3)
              3'h1: pos_word = 16'hc005;
              3'h2: pos_word = 16'hc02d;
              3'h3: pos_word = 16'hc071;
              3'h4: pos_word = 16'hc0c0;
              3'h5: pos_word = 16'hc160;
              3'h6: pos_word = 16'h422c;
              3'h7: pos_word = 16'h4107;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4095;
            case (mant_lo3)
              3'h1: pos_word = 16'h404a;
              3'h2: pos_word = 16'h4017;
              3'h3: pos_word = 16'h3fed;
              3'h4: pos_word = 16'h3fbf;
              3'h5: pos_word = 16'h3f9d;
              3'h6: pos_word = 16'h3f82;
              3'h7: pos_word = 16'h3f57;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f30;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0f;
              3'h2: pos_word = 16'h3ee1;
              3'h3: pos_word = 16'h3eaa;
              3'h4: pos_word = 16'h3e6b;
              3'h5: pos_word = 16'h3e07;
              3'h6: pos_word = 16'h3d18;
              3'h7: pos_word = 16'hbd6b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe1d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe81;
              3'h2: pos_word = 16'hbeb5;
              3'h3: pos_word = 16'hbeee;
              3'h4: pos_word = 16'hbf16;
              3'h5: pos_word = 16'hbf38;
              3'h6: pos_word = 16'hbf60;
              3'h7: pos_word = 16'hbf87;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfa4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc8;
              3'h2: pos_word = 16'hbff9;
              3'h3: pos_word = 16'hc020;
              3'h4: pos_word = 16'hc059;
              3'h5: pos_word = 16'hc0a5;
              3'h6: pos_word = 16'hc124;
              3'h7: pos_word = 16'hc3a4;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h412f;
            case (mant_lo3)
              3'h1: pos_word = 16'h40aa;
              3'h2: pos_word = 16'h405e;
              3'h3: pos_word = 16'h4023;
              3'h4: pos_word = 16'h3ffd;
              3'h5: pos_word = 16'h3fcb;
              3'h6: pos_word = 16'h3fa6;
              3'h7: pos_word = 16'h3f89;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f62;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3b;
              3'h2: pos_word = 16'h3f18;
              3'h3: pos_word = 16'h3ef2;
              3'h4: pos_word = 16'h3eb9;
              3'h5: pos_word = 16'h3e84;
              3'h6: pos_word = 16'h3e23;
              3'h7: pos_word = 16'h3d82;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbcfe;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe01;
              3'h2: pos_word = 16'hbe65;
              3'h3: pos_word = 16'hbea6;
              3'h4: pos_word = 16'hbede;
              3'h5: pos_word = 16'hbf0d;
              3'h6: pos_word = 16'hbf2e;
              3'h7: pos_word = 16'hbf54;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf80;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9b;
              3'h2: pos_word = 16'hbfbd;
              3'h3: pos_word = 16'hbfea;
              3'h4: pos_word = 16'hc014;
              3'h5: pos_word = 16'hc046;
              3'h6: pos_word = 16'hc090;
              3'h7: pos_word = 16'hc101;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc208;
            case (mant_lo3)
              3'h1: pos_word = 16'h4176;
              3'h2: pos_word = 16'h40c7;
              3'h3: pos_word = 16'h4077;
              3'h4: pos_word = 16'h4030;
              3'h5: pos_word = 16'h4007;
              3'h6: pos_word = 16'h3fd7;
              3'h7: pos_word = 16'h3faf;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f90;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6f;
              3'h2: pos_word = 16'h3f45;
              3'h3: pos_word = 16'h3f21;
              3'h4: pos_word = 16'h3f01;
              3'h5: pos_word = 16'h3ec8;
              3'h6: pos_word = 16'h3e92;
              3'h7: pos_word = 16'h3e3f;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3db8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbb9a;
              3'h2: pos_word = 16'hbdcc;
              3'h3: pos_word = 16'hbe49;
              3'h4: pos_word = 16'hbe98;
              3'h5: pos_word = 16'hbece;
              3'h6: pos_word = 16'hbf04;
              3'h7: pos_word = 16'hbf24;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf49;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf73;
              3'h2: pos_word = 16'hbf93;
              3'h3: pos_word = 16'hbfb3;
              3'h4: pos_word = 16'hbfdc;
              3'h5: pos_word = 16'hc00a;
              3'h6: pos_word = 16'hc036;
              3'h7: pos_word = 16'hc080;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc0d4;
            case (mant_lo3)
              3'h1: pos_word = 16'hc190;
              3'h2: pos_word = 16'h41ce;
              3'h3: pos_word = 16'h40ef;
              3'h4: pos_word = 16'h408a;
              3'h5: pos_word = 16'h4040;
              3'h6: pos_word = 16'h4011;
              3'h7: pos_word = 16'h3fe4;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hc9: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fb9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7c;
              3'h2: pos_word = 16'h3f2b;
              3'h3: pos_word = 16'h3ed8;
              3'h4: pos_word = 16'h3e5b;
              3'h5: pos_word = 16'h3cb1;
              3'h6: pos_word = 16'hbe2d;
              3'h7: pos_word = 16'hbebe;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf1b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf67;
              3'h2: pos_word = 16'hbfa9;
              3'h3: pos_word = 16'hc001;
              3'h4: pos_word = 16'hc067;
              3'h5: pos_word = 16'hc143;
              3'h6: pos_word = 16'h4115;
              3'h7: pos_word = 16'h4052;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ff3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa0;
              3'h2: pos_word = 16'h3f5b;
              3'h3: pos_word = 16'h3f13;
              3'h4: pos_word = 16'h3eb0;
              3'h5: pos_word = 16'h3e13;
              3'h6: pos_word = 16'hbd3f;
              3'h7: pos_word = 16'hbe76;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbee7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf34;
              3'h2: pos_word = 16'hbf84;
              3'h3: pos_word = 16'hbfc3;
              3'h4: pos_word = 16'hc01b;
              3'h5: pos_word = 16'hc09c;
              3'h6: pos_word = 16'hc290;
              3'h7: pos_word = 16'h40b5;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4028;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd0;
              3'h2: pos_word = 16'h3f8c;
              3'h3: pos_word = 16'h3f3f;
              3'h4: pos_word = 16'h3ef8;
              3'h5: pos_word = 16'h3e8a;
              3'h6: pos_word = 16'h3d98;
              3'h7: pos_word = 16'hbdec;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbea0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf09;
              3'h2: pos_word = 16'hbf4f;
              3'h3: pos_word = 16'hbf98;
              3'h4: pos_word = 16'hbfe4;
              3'h5: pos_word = 16'hc03f;
              3'h6: pos_word = 16'hc0ec;
              3'h7: pos_word = 16'h4193;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4081;
            case (mant_lo3)
              3'h1: pos_word = 16'h400b;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'h3f74;
              3'h4: pos_word = 16'h3f25;
              3'h5: pos_word = 16'h3ecf;
              3'h6: pos_word = 16'h3e4a;
              3'h7: pos_word = 16'h3bc8;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe3d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec7;
              3'h2: pos_word = 16'hbf21;
              3'h3: pos_word = 16'hbf6e;
              3'h4: pos_word = 16'hbfaf;
              3'h5: pos_word = 16'hc007;
              3'h6: pos_word = 16'hc075;
              3'h7: pos_word = 16'hc170;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4102;
            case (mant_lo3)
              3'h1: pos_word = 16'h4047;
              3'h2: pos_word = 16'h3fea;
              3'h3: pos_word = 16'h3f9b;
              3'h4: pos_word = 16'h3f55;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'h3ea7;
              3'h7: pos_word = 16'h3e03;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbd7e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe83;
              3'h2: pos_word = 16'hbef1;
              3'h3: pos_word = 16'hbf3a;
              3'h4: pos_word = 16'hbf88;
              3'h5: pos_word = 16'hbfca;
              3'h6: pos_word = 16'hc022;
              3'h7: pos_word = 16'hc0a9;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4417;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a6;
              3'h2: pos_word = 16'h4021;
              3'h3: pos_word = 16'h3fc9;
              3'h4: pos_word = 16'h3f88;
              3'h5: pos_word = 16'h3f39;
              3'h6: pos_word = 16'h3eef;
              3'h7: pos_word = 16'h3e81;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3d71;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe06;
              3'h2: pos_word = 16'hbea9;
              3'h3: pos_word = 16'hbf0e;
              3'h4: pos_word = 16'hbf56;
              3'h5: pos_word = 16'hbf9d;
              3'h6: pos_word = 16'hbfec;
              3'h7: pos_word = 16'hc049;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc106;
            case (mant_lo3)
              3'h1: pos_word = 16'h4165;
              3'h2: pos_word = 16'h4072;
              3'h3: pos_word = 16'h4005;
              3'h4: pos_word = 16'h3fad;
              3'h5: pos_word = 16'h3f6c;
              3'h6: pos_word = 16'h3f1f;
              3'h7: pos_word = 16'h3ec6;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3e3a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc1a;
              3'h2: pos_word = 16'hbe4e;
              3'h3: pos_word = 16'hbed1;
              3'h4: pos_word = 16'hbf26;
              3'h5: pos_word = 16'hbf76;
              3'h6: pos_word = 16'hbfb4;
              3'h7: pos_word = 16'hc00c;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc083;
            case (mant_lo3)
              3'h1: pos_word = 16'hc19d;
              3'h2: pos_word = 16'h40e7;
              3'h3: pos_word = 16'h403d;
              3'h4: pos_word = 16'h3fe2;
              3'h5: pos_word = 16'h3f97;
              3'h6: pos_word = 16'h3f4e;
              3'h7: pos_word = 16'h3f08;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e9e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3de5;
              3'h2: pos_word = 16'hbd9f;
              3'h3: pos_word = 16'hbe8c;
              3'h4: pos_word = 16'hbefb;
              3'h5: pos_word = 16'hbf40;
              3'h6: pos_word = 16'hbf8d;
              3'h7: pos_word = 16'hbfd1;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hca: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc02a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4269;
              3'h2: pos_word = 16'h401a;
              3'h3: pos_word = 16'h3f83;
              3'h4: pos_word = 16'h3ee5;
              3'h5: pos_word = 16'h3d31;
              3'h6: pos_word = 16'hbeb2;
              3'h7: pos_word = 16'hbf5d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbff5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc11a;
              3'h2: pos_word = 16'h4064;
              3'h3: pos_word = 16'h3fa8;
              3'h4: pos_word = 16'h3f1a;
              3'h5: pos_word = 16'h3e29;
              3'h6: pos_word = 16'hbe5e;
              3'h7: pos_word = 16'hbf2c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfba;
            case (mant_lo3)
              3'h1: pos_word = 16'hc08c;
              3'h2: pos_word = 16'h40cf;
              3'h3: pos_word = 16'h3fda;
              3'h4: pos_word = 16'h3f48;
              3'h5: pos_word = 16'h3e96;
              3'h6: pos_word = 16'hbdbf;
              3'h7: pos_word = 16'hbf02;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf91;
            case (mant_lo3)
              3'h1: pos_word = 16'hc032;
              3'h2: pos_word = 16'h41f5;
              3'h3: pos_word = 16'h4013;
              3'h4: pos_word = 16'h3f7f;
              3'h5: pos_word = 16'h3edc;
              3'h6: pos_word = 16'h3ce3;
              3'h7: pos_word = 16'hbebb;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf64;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfff;
              3'h2: pos_word = 16'hc135;
              3'h3: pos_word = 16'h4057;
              3'h4: pos_word = 16'h3fa3;
              3'h5: pos_word = 16'h3f15;
              3'h6: pos_word = 16'h3e19;
              3'h7: pos_word = 16'hbe6f;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf32;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc1;
              3'h2: pos_word = 16'hc097;
              3'h3: pos_word = 16'h40bc;
              3'h4: pos_word = 16'h3fd2;
              3'h5: pos_word = 16'h3f41;
              3'h6: pos_word = 16'h3e8d;
              3'h7: pos_word = 16'hbddf;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf07;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf96;
              3'h2: pos_word = 16'hc03b;
              3'h3: pos_word = 16'h41a6;
              3'h4: pos_word = 16'h400d;
              3'h5: pos_word = 16'h3f77;
              3'h6: pos_word = 16'h3ed2;
              3'h7: pos_word = 16'h3c48;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbec4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6b;
              3'h2: pos_word = 16'hc004;
              3'h3: pos_word = 16'hc15c;
              3'h4: pos_word = 16'h404b;
              3'h5: pos_word = 16'h3f9d;
              3'h6: pos_word = 16'h3f0f;
              3'h7: pos_word = 16'h3e09;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe80;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf38;
              3'h2: pos_word = 16'hbfc7;
              3'h3: pos_word = 16'hc0a4;
              3'h4: pos_word = 16'h40ac;
              3'h5: pos_word = 16'h3fcb;
              3'h6: pos_word = 16'h3f3b;
              3'h7: pos_word = 16'h3e85;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbdff;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0c;
              3'h2: pos_word = 16'hbf9b;
              3'h3: pos_word = 16'hc045;
              3'h4: pos_word = 16'h417b;
              3'h5: pos_word = 16'h4007;
              3'h6: pos_word = 16'h3f6f;
              3'h7: pos_word = 16'h3ec9;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbb59;
            case (mant_lo3)
              3'h1: pos_word = 16'hbecd;
              3'h2: pos_word = 16'hbf73;
              3'h3: pos_word = 16'hc00a;
              3'h4: pos_word = 16'hc18c;
              3'h5: pos_word = 16'h4041;
              3'h6: pos_word = 16'h3f99;
              3'h7: pos_word = 16'h3f0a;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3df2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe88;
              3'h2: pos_word = 16'hbf3e;
              3'h3: pos_word = 16'hbfce;
              3'h4: pos_word = 16'hc0b2;
              3'h5: pos_word = 16'h409e;
              3'h6: pos_word = 16'h3fc4;
              3'h7: pos_word = 16'h3f35;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e79;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe10;
              3'h2: pos_word = 16'hbf12;
              3'h3: pos_word = 16'hbfa0;
              3'h4: pos_word = 16'hc050;
              3'h5: pos_word = 16'h414a;
              3'h6: pos_word = 16'h4002;
              3'h7: pos_word = 16'h3f68;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ec0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc9a;
              3'h2: pos_word = 16'hbed6;
              3'h3: pos_word = 16'hbf7a;
              3'h4: pos_word = 16'hc010;
              3'h5: pos_word = 16'hc1c1;
              3'h6: pos_word = 16'h4037;
              3'h7: pos_word = 16'h3f94;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f05;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dd1;
              3'h2: pos_word = 16'hbe91;
              3'h3: pos_word = 16'hbf44;
              3'h4: pos_word = 16'hbfd6;
              3'h5: pos_word = 16'hc0c4;
              3'h6: pos_word = 16'h4092;
              3'h7: pos_word = 16'h3fbe;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f2f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e68;
              3'h2: pos_word = 16'hbe20;
              3'h3: pos_word = 16'hbf17;
              3'h4: pos_word = 16'hbfa5;
              3'h5: pos_word = 16'hc05c;
              3'h6: pos_word = 16'h4128;
              3'h7: pos_word = 16'h3ffb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hcb: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f61;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd0d;
              3'h2: pos_word = 16'hbf81;
              3'h3: pos_word = 16'hc21a;
              3'h4: pos_word = 16'h3f8f;
              3'h5: pos_word = 16'h3db1;
              3'h6: pos_word = 16'hbf4a;
              3'h7: pos_word = 16'hc0d9;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fb8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e57;
              3'h2: pos_word = 16'hbf1c;
              3'h3: pos_word = 16'hc06a;
              3'h4: pos_word = 16'h3ff1;
              3'h5: pos_word = 16'h3eae;
              3'h6: pos_word = 16'hbee9;
              3'h7: pos_word = 16'hc01d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4026;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ef6;
              3'h2: pos_word = 16'hbea2;
              3'h3: pos_word = 16'hbfe5;
              3'h4: pos_word = 16'h407e;
              3'h5: pos_word = 16'h3f24;
              3'h6: pos_word = 16'hbe41;
              3'h7: pos_word = 16'hbfb0;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h40fd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f53;
              3'h2: pos_word = 16'hbd86;
              3'h3: pos_word = 16'hbf89;
              3'h4: pos_word = 16'h4349;
              3'h5: pos_word = 16'h3f87;
              3'h6: pos_word = 16'h3d63;
              3'h7: pos_word = 16'hbf58;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc10a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fac;
              3'h2: pos_word = 16'h3e36;
              3'h3: pos_word = 16'hbf27;
              3'h4: pos_word = 16'hc085;
              3'h5: pos_word = 16'h3fe0;
              3'h6: pos_word = 16'h3e9d;
              3'h7: pos_word = 16'hbefd;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc02c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4018;
              3'h2: pos_word = 16'h3ee3;
              3'h3: pos_word = 16'hbeb4;
              3'h4: pos_word = 16'hbff7;
              3'h5: pos_word = 16'h4061;
              3'h6: pos_word = 16'h3f19;
              3'h7: pos_word = 16'hbe62;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfbc;
            case (mant_lo3)
              3'h1: pos_word = 16'h40cb;
              3'h2: pos_word = 16'h3f46;
              3'h3: pos_word = 16'hbdc6;
              3'h4: pos_word = 16'hbf92;
              3'h5: pos_word = 16'h41de;
              3'h6: pos_word = 16'h3f7d;
              3'h7: pos_word = 16'h3cc8;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf65;
            case (mant_lo3)
              3'h1: pos_word = 16'hc13c;
              3'h2: pos_word = 16'h3fa1;
              3'h3: pos_word = 16'h3e16;
              3'h4: pos_word = 16'hbf33;
              3'h5: pos_word = 16'hc09a;
              3'h6: pos_word = 16'h3fd1;
              3'h7: pos_word = 16'h3e8b;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf08;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03d;
              3'h2: pos_word = 16'h400c;
              3'h3: pos_word = 16'h3ed0;
              3'h4: pos_word = 16'hbec6;
              3'h5: pos_word = 16'hc006;
              3'h6: pos_word = 16'h4049;
              3'h7: pos_word = 16'h3f0e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe82;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc9;
              3'h2: pos_word = 16'h40a8;
              3'h3: pos_word = 16'h3f3a;
              3'h4: pos_word = 16'hbe03;
              3'h5: pos_word = 16'hbf9c;
              3'h6: pos_word = 16'h416f;
              3'h7: pos_word = 16'h3f6e;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbbd9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf74;
              3'h2: pos_word = 16'hc195;
              3'h3: pos_word = 16'h3f98;
              3'h4: pos_word = 16'h3deb;
              3'h5: pos_word = 16'hbf3f;
              3'h6: pos_word = 16'hc0b6;
              3'h7: pos_word = 16'h3fc3;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e75;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf13;
              3'h2: pos_word = 16'hc053;
              3'h3: pos_word = 16'h4001;
              3'h4: pos_word = 16'h3ebe;
              3'h5: pos_word = 16'hbed8;
              3'h6: pos_word = 16'hc011;
              3'h7: pos_word = 16'h4035;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f04;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe93;
              3'h2: pos_word = 16'hbfd7;
              3'h3: pos_word = 16'h4090;
              3'h4: pos_word = 16'h3f2e;
              3'h5: pos_word = 16'hbe24;
              3'h6: pos_word = 16'hbfa6;
              3'h7: pos_word = 16'h4123;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f5f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd1a;
              3'h2: pos_word = 16'hbf82;
              3'h3: pos_word = 16'hc230;
              3'h4: pos_word = 16'h3f8e;
              3'h5: pos_word = 16'h3dab;
              3'h6: pos_word = 16'hbf4c;
              3'h7: pos_word = 16'hc0de;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fb6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e54;
              3'h2: pos_word = 16'hbf1d;
              3'h3: pos_word = 16'hc06d;
              3'h4: pos_word = 16'h3fef;
              3'h5: pos_word = 16'h3eac;
              3'h6: pos_word = 16'hbeeb;
              3'h7: pos_word = 16'hc01e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4025;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ef4;
              3'h2: pos_word = 16'hbea4;
              3'h3: pos_word = 16'hbfe7;
              3'h4: pos_word = 16'h407b;
              3'h5: pos_word = 16'h3f23;
              3'h6: pos_word = 16'hbe44;
              3'h7: pos_word = 16'hbfb1;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hcc: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h40f7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd8d;
              3'h2: pos_word = 16'h42f1;
              3'h3: pos_word = 16'h3d55;
              3'h4: pos_word = 16'hc10e;
              3'h5: pos_word = 16'h3e33;
              3'h6: pos_word = 16'hc087;
              3'h7: pos_word = 16'h3e9b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc02d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee1;
              3'h2: pos_word = 16'hbff9;
              3'h3: pos_word = 16'h3f18;
              3'h4: pos_word = 16'hbfbd;
              3'h5: pos_word = 16'h3f45;
              3'h6: pos_word = 16'hbf93;
              3'h7: pos_word = 16'h3f7b;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf67;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa0;
              3'h2: pos_word = 16'hbf34;
              3'h3: pos_word = 16'h3fcf;
              3'h4: pos_word = 16'hbf09;
              3'h5: pos_word = 16'h400b;
              3'h6: pos_word = 16'hbec8;
              3'h7: pos_word = 16'h4047;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe83;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a5;
              3'h2: pos_word = 16'hbe07;
              3'h3: pos_word = 16'h4163;
              3'h4: pos_word = 16'hbc23;
              3'h5: pos_word = 16'hc19f;
              3'h6: pos_word = 16'h3de4;
              3'h7: pos_word = 16'hc0b9;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e71;
            case (mant_lo3)
              3'h1: pos_word = 16'hc055;
              3'h2: pos_word = 16'h3ebc;
              3'h3: pos_word = 16'hc012;
              3'h4: pos_word = 16'h3f03;
              3'h5: pos_word = 16'hbfd9;
              3'h6: pos_word = 16'h3f2d;
              3'h7: pos_word = 16'hbfa7;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f5e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf83;
              3'h2: pos_word = 16'h3f8d;
              3'h3: pos_word = 16'hbf4d;
              3'h4: pos_word = 16'h3fb5;
              3'h5: pos_word = 16'hbf1f;
              3'h6: pos_word = 16'h3fed;
              3'h7: pos_word = 16'hbeed;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4023;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea6;
              3'h2: pos_word = 16'h4078;
              3'h3: pos_word = 16'hbe48;
              3'h4: pos_word = 16'h40f0;
              3'h5: pos_word = 16'hbd94;
              3'h6: pos_word = 16'h42ac;
              3'h7: pos_word = 16'h3d48;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc112;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e2f;
              3'h2: pos_word = 16'hc089;
              3'h3: pos_word = 16'h3e99;
              3'h4: pos_word = 16'hc02f;
              3'h5: pos_word = 16'h3edf;
              3'h6: pos_word = 16'hbffb;
              3'h7: pos_word = 16'h3f17;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfbe;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f44;
              3'h2: pos_word = 16'hbf94;
              3'h3: pos_word = 16'h3f7a;
              3'h4: pos_word = 16'hbf69;
              3'h5: pos_word = 16'h3f9f;
              3'h6: pos_word = 16'hbf36;
              3'h7: pos_word = 16'h3fce;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf0b;
            case (mant_lo3)
              3'h1: pos_word = 16'h4009;
              3'h2: pos_word = 16'hbeca;
              3'h3: pos_word = 16'h4044;
              3'h4: pos_word = 16'hbe85;
              3'h5: pos_word = 16'h40a3;
              3'h6: pos_word = 16'hbe0a;
              3'h7: pos_word = 16'h4159;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbc59;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1aa;
              3'h2: pos_word = 16'h3ddd;
              3'h3: pos_word = 16'hc0bd;
              3'h4: pos_word = 16'h3e6e;
              3'h5: pos_word = 16'hc058;
              3'h6: pos_word = 16'h3eba;
              3'h7: pos_word = 16'hc014;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f02;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfdb;
              3'h2: pos_word = 16'h3f2b;
              3'h3: pos_word = 16'hbfa8;
              3'h4: pos_word = 16'h3f5c;
              3'h5: pos_word = 16'hbf84;
              3'h6: pos_word = 16'h3f8c;
              3'h7: pos_word = 16'hbf4f;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3fb4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf20;
              3'h2: pos_word = 16'h3fec;
              3'h3: pos_word = 16'hbeef;
              3'h4: pos_word = 16'h4022;
              3'h5: pos_word = 16'hbea8;
              3'h6: pos_word = 16'h4074;
              3'h7: pos_word = 16'hbe4b;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h40ea;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd9a;
              3'h2: pos_word = 16'h4286;
              3'h3: pos_word = 16'h3d3a;
              3'h4: pos_word = 16'hc117;
              3'h5: pos_word = 16'h3e2c;
              3'h6: pos_word = 16'hc08b;
              3'h7: pos_word = 16'h3e97;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc031;
            case (mant_lo3)
              3'h1: pos_word = 16'h3edd;
              3'h2: pos_word = 16'hbffd;
              3'h3: pos_word = 16'h3f15;
              3'h4: pos_word = 16'hbfc0;
              3'h5: pos_word = 16'h3f42;
              3'h6: pos_word = 16'hbf95;
              3'h7: pos_word = 16'h3f78;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf6a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9e;
              3'h2: pos_word = 16'hbf37;
              3'h3: pos_word = 16'h3fcc;
              3'h4: pos_word = 16'hbf0c;
              3'h5: pos_word = 16'h4008;
              3'h6: pos_word = 16'hbecc;
              3'h7: pos_word = 16'h4042;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hcd: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe87;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe0d;
              3'h2: pos_word = 16'hbc88;
              3'h3: pos_word = 16'h3dd6;
              3'h4: pos_word = 16'h3e6a;
              3'h5: pos_word = 16'h3eb8;
              3'h6: pos_word = 16'h3f01;
              3'h7: pos_word = 16'h3f2a;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f5b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8b;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'h3fea;
              3'h4: pos_word = 16'h4020;
              3'h5: pos_word = 16'h4071;
              3'h6: pos_word = 16'h40e5;
              3'h7: pos_word = 16'h425b;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc11c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc08d;
              3'h2: pos_word = 16'hc033;
              3'h3: pos_word = 16'hbfff;
              3'h4: pos_word = 16'hbfc1;
              3'h5: pos_word = 16'hbf96;
              3'h6: pos_word = 16'hbf6c;
              3'h7: pos_word = 16'hbf38;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf0d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbece;
              3'h2: pos_word = 16'hbe89;
              3'h3: pos_word = 16'hbe11;
              3'h4: pos_word = 16'hbca3;
              3'h5: pos_word = 16'h3dcf;
              3'h6: pos_word = 16'h3e67;
              3'h7: pos_word = 16'h3eb6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f00;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f29;
              3'h2: pos_word = 16'h3f5a;
              3'h3: pos_word = 16'h3f8b;
              3'h4: pos_word = 16'h3fb1;
              3'h5: pos_word = 16'h3fe8;
              3'h6: pos_word = 16'h401f;
              3'h7: pos_word = 16'h406e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h40df;
            case (mant_lo3)
              3'h1: pos_word = 16'h423a;
              3'h2: pos_word = 16'hc121;
              3'h3: pos_word = 16'hc08f;
              3'h4: pos_word = 16'hc035;
              3'h5: pos_word = 16'hc001;
              3'h6: pos_word = 16'hbfc3;
              3'h7: pos_word = 16'hbf97;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf6d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf39;
              3'h2: pos_word = 16'hbf0e;
              3'h3: pos_word = 16'hbed0;
              3'h4: pos_word = 16'hbe8b;
              3'h5: pos_word = 16'hbe14;
              3'h6: pos_word = 16'hbcbe;
              3'h7: pos_word = 16'h3dc8;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e63;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb4;
              3'h2: pos_word = 16'h3efd;
              3'h3: pos_word = 16'h3f28;
              3'h4: pos_word = 16'h3f58;
              3'h5: pos_word = 16'h3f8a;
              3'h6: pos_word = 16'h3fb0;
              3'h7: pos_word = 16'h3fe6;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h401d;
            case (mant_lo3)
              3'h1: pos_word = 16'h406b;
              3'h2: pos_word = 16'h40da;
              3'h3: pos_word = 16'h4221;
              3'h4: pos_word = 16'hc126;
              3'h5: pos_word = 16'hc091;
              3'h6: pos_word = 16'hc037;
              3'h7: pos_word = 16'hc002;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfc4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf98;
              3'h2: pos_word = 16'hbf6f;
              3'h3: pos_word = 16'hbf3b;
              3'h4: pos_word = 16'hbf0f;
              3'h5: pos_word = 16'hbed2;
              3'h6: pos_word = 16'hbe8d;
              3'h7: pos_word = 16'hbe18;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbcd9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dc1;
              3'h2: pos_word = 16'h3e5f;
              3'h3: pos_word = 16'h3eb3;
              3'h4: pos_word = 16'h3efb;
              3'h5: pos_word = 16'h3f27;
              3'h6: pos_word = 16'h3f57;
              3'h7: pos_word = 16'h3f89;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3faf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe4;
              3'h2: pos_word = 16'h401c;
              3'h3: pos_word = 16'h4068;
              3'h4: pos_word = 16'h40d5;
              3'h5: pos_word = 16'h420e;
              3'h6: pos_word = 16'hc12c;
              3'h7: pos_word = 16'hc094;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc038;
            case (mant_lo3)
              3'h1: pos_word = 16'hc003;
              3'h2: pos_word = 16'hbfc5;
              3'h3: pos_word = 16'hbf99;
              3'h4: pos_word = 16'hbf70;
              3'h5: pos_word = 16'hbf3c;
              3'h6: pos_word = 16'hbf10;
              3'h7: pos_word = 16'hbed4;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe8e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe1b;
              3'h2: pos_word = 16'hbcf5;
              3'h3: pos_word = 16'h3dbb;
              3'h4: pos_word = 16'h3e5c;
              3'h5: pos_word = 16'h3eb1;
              3'h6: pos_word = 16'h3ef9;
              3'h7: pos_word = 16'h3f25;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f55;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f88;
              3'h2: pos_word = 16'h3fae;
              3'h3: pos_word = 16'h3fe3;
              3'h4: pos_word = 16'h401a;
              3'h5: pos_word = 16'h4065;
              3'h6: pos_word = 16'h40d1;
              3'h7: pos_word = 16'h41fe;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc133;
            case (mant_lo3)
              3'h1: pos_word = 16'hc096;
              3'h2: pos_word = 16'hc03a;
              3'h3: pos_word = 16'hc004;
              3'h4: pos_word = 16'hbfc7;
              3'h5: pos_word = 16'hbf9a;
              3'h6: pos_word = 16'hbf72;
              3'h7: pos_word = 16'hbf3d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hce: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf11;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe90;
              3'h2: pos_word = 16'hbd08;
              3'h3: pos_word = 16'h3e58;
              3'h4: pos_word = 16'h3ef7;
              3'h5: pos_word = 16'h3f54;
              3'h6: pos_word = 16'h3fad;
              3'h7: pos_word = 16'h4019;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h40cc;
            case (mant_lo3)
              3'h1: pos_word = 16'hc13a;
              3'h2: pos_word = 16'hc03d;
              3'h3: pos_word = 16'hbfc8;
              3'h4: pos_word = 16'hbf74;
              3'h5: pos_word = 16'hbf12;
              3'h6: pos_word = 16'hbe92;
              3'h7: pos_word = 16'hbd15;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e55;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ef5;
              3'h2: pos_word = 16'h3f52;
              3'h3: pos_word = 16'h3fab;
              3'h4: pos_word = 16'h4017;
              3'h5: pos_word = 16'h40c8;
              3'h6: pos_word = 16'hc141;
              3'h7: pos_word = 16'hc03f;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfca;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf75;
              3'h2: pos_word = 16'hbf13;
              3'h3: pos_word = 16'hbe94;
              3'h4: pos_word = 16'hbd23;
              3'h5: pos_word = 16'h3e51;
              3'h6: pos_word = 16'h3ef3;
              3'h7: pos_word = 16'h3f51;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3faa;
            case (mant_lo3)
              3'h1: pos_word = 16'h4016;
              3'h2: pos_word = 16'h40c4;
              3'h3: pos_word = 16'hc149;
              3'h4: pos_word = 16'hc041;
              3'h5: pos_word = 16'hbfcb;
              3'h6: pos_word = 16'hbf77;
              3'h7: pos_word = 16'hbf15;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe96;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd31;
              3'h2: pos_word = 16'h3e4e;
              3'h3: pos_word = 16'h3ef1;
              3'h4: pos_word = 16'h3f4f;
              3'h5: pos_word = 16'h3fa9;
              3'h6: pos_word = 16'h4015;
              3'h7: pos_word = 16'h40c0;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc152;
            case (mant_lo3)
              3'h1: pos_word = 16'hc043;
              3'h2: pos_word = 16'hbfcd;
              3'h3: pos_word = 16'hbf79;
              3'h4: pos_word = 16'hbf16;
              3'h5: pos_word = 16'hbe98;
              3'h6: pos_word = 16'hbd3e;
              3'h7: pos_word = 16'h3e4a;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3eef;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4e;
              3'h2: pos_word = 16'h3fa8;
              3'h3: pos_word = 16'h4013;
              3'h4: pos_word = 16'h40bc;
              3'h5: pos_word = 16'hc15c;
              3'h6: pos_word = 16'hc045;
              3'h7: pos_word = 16'hbfce;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf7a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf17;
              3'h2: pos_word = 16'hbe99;
              3'h3: pos_word = 16'hbd4c;
              3'h4: pos_word = 16'h3e47;
              3'h5: pos_word = 16'h3eed;
              3'h6: pos_word = 16'h3f4d;
              3'h7: pos_word = 16'h3fa7;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4012;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b8;
              3'h2: pos_word = 16'hc166;
              3'h3: pos_word = 16'hc047;
              3'h4: pos_word = 16'hbfd0;
              3'h5: pos_word = 16'hbf7c;
              3'h6: pos_word = 16'hbf18;
              3'h7: pos_word = 16'hbe9b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbd5a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e43;
              3'h2: pos_word = 16'h3eeb;
              3'h3: pos_word = 16'h3f4b;
              3'h4: pos_word = 16'h3fa6;
              3'h5: pos_word = 16'h4011;
              3'h6: pos_word = 16'h40b5;
              3'h7: pos_word = 16'hc172;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc04a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd1;
              3'h2: pos_word = 16'hbf7e;
              3'h3: pos_word = 16'hbf19;
              3'h4: pos_word = 16'hbe9d;
              3'h5: pos_word = 16'hbd67;
              3'h6: pos_word = 16'h3e40;
              3'h7: pos_word = 16'h3ee9;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f4a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa4;
              3'h2: pos_word = 16'h400f;
              3'h3: pos_word = 16'h40b1;
              3'h4: pos_word = 16'hc17f;
              3'h5: pos_word = 16'hc04c;
              3'h6: pos_word = 16'hbfd3;
              3'h7: pos_word = 16'hbf7f;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf1a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9f;
              3'h2: pos_word = 16'hbd75;
              3'h3: pos_word = 16'h3e3c;
              3'h4: pos_word = 16'h3ee7;
              3'h5: pos_word = 16'h3f49;
              3'h6: pos_word = 16'h3fa3;
              3'h7: pos_word = 16'h400e;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h40ae;
            case (mant_lo3)
              3'h1: pos_word = 16'hc187;
              3'h2: pos_word = 16'hc04e;
              3'h3: pos_word = 16'hbfd4;
              3'h4: pos_word = 16'hbf80;
              3'h5: pos_word = 16'hbf1b;
              3'h6: pos_word = 16'hbea1;
              3'h7: pos_word = 16'hbd81;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e39;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee5;
              3'h2: pos_word = 16'h3f47;
              3'h3: pos_word = 16'h3fa2;
              3'h4: pos_word = 16'h400d;
              3'h5: pos_word = 16'h40ab;
              3'h6: pos_word = 16'hc18f;
              3'h7: pos_word = 16'hc051;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hcf: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbfd6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf1d;
              3'h2: pos_word = 16'hbd88;
              3'h3: pos_word = 16'h3ee2;
              3'h4: pos_word = 16'h3fa1;
              3'h5: pos_word = 16'h40a8;
              3'h6: pos_word = 16'hc053;
              3'h7: pos_word = 16'hbf82;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbea5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e32;
              3'h2: pos_word = 16'h3f44;
              3'h3: pos_word = 16'h400a;
              3'h4: pos_word = 16'hc1a2;
              3'h5: pos_word = 16'hbfd9;
              3'h6: pos_word = 16'hbf1f;
              3'h7: pos_word = 16'hbd96;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ede;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9f;
              3'h2: pos_word = 16'h40a2;
              3'h3: pos_word = 16'hc058;
              3'h4: pos_word = 16'hbf84;
              3'h5: pos_word = 16'hbea8;
              3'h6: pos_word = 16'h3e2b;
              3'h7: pos_word = 16'h3f42;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4008;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1bb;
              3'h2: pos_word = 16'hbfdd;
              3'h3: pos_word = 16'hbf21;
              3'h4: pos_word = 16'hbda3;
              3'h5: pos_word = 16'h3eda;
              3'h6: pos_word = 16'h3f9d;
              3'h7: pos_word = 16'h409c;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc05e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'hbeac;
              3'h3: pos_word = 16'h3e24;
              3'h4: pos_word = 16'h3f3f;
              3'h5: pos_word = 16'h4006;
              3'h6: pos_word = 16'hc1dd;
              3'h7: pos_word = 16'hbfe0;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf24;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb1;
              3'h2: pos_word = 16'h3ed6;
              3'h3: pos_word = 16'h3f9b;
              3'h4: pos_word = 16'h4097;
              3'h5: pos_word = 16'hc063;
              3'h6: pos_word = 16'hbf87;
              3'h7: pos_word = 16'hbeb0;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e1d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3c;
              3'h2: pos_word = 16'h4003;
              3'h3: pos_word = 16'hc207;
              3'h4: pos_word = 16'hbfe4;
              3'h5: pos_word = 16'hbf26;
              3'h6: pos_word = 16'hbdbf;
              3'h7: pos_word = 16'h3ed2;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f99;
            case (mant_lo3)
              3'h1: pos_word = 16'h4092;
              3'h2: pos_word = 16'hc069;
              3'h3: pos_word = 16'hbf89;
              3'h4: pos_word = 16'hbeb4;
              3'h5: pos_word = 16'h3e16;
              3'h6: pos_word = 16'h3f3a;
              3'h7: pos_word = 16'h4001;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc22f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe7;
              3'h2: pos_word = 16'hbf29;
              3'h3: pos_word = 16'hbdcc;
              3'h4: pos_word = 16'h3ece;
              3'h5: pos_word = 16'h3f97;
              3'h6: pos_word = 16'h408e;
              3'h7: pos_word = 16'hc070;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb8;
              3'h2: pos_word = 16'h3e0f;
              3'h3: pos_word = 16'h3f37;
              3'h4: pos_word = 16'h3ffe;
              3'h5: pos_word = 16'hc276;
              3'h6: pos_word = 16'hbfeb;
              3'h7: pos_word = 16'hbf2b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbdda;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ecb;
              3'h2: pos_word = 16'h3f95;
              3'h3: pos_word = 16'h408a;
              3'h4: pos_word = 16'hc076;
              3'h5: pos_word = 16'hbf8d;
              3'h6: pos_word = 16'hbebb;
              3'h7: pos_word = 16'h3e08;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f35;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ffa;
              3'h2: pos_word = 16'hc2d0;
              3'h3: pos_word = 16'hbfef;
              3'h4: pos_word = 16'hbf2d;
              3'h5: pos_word = 16'hbde8;
              3'h6: pos_word = 16'h3ec7;
              3'h7: pos_word = 16'h3f93;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4086;
            case (mant_lo3)
              3'h1: pos_word = 16'hc07d;
              3'h2: pos_word = 16'hbf8f;
              3'h3: pos_word = 16'hbebf;
              3'h4: pos_word = 16'h3e01;
              3'h5: pos_word = 16'h3f32;
              3'h6: pos_word = 16'h3ff6;
              3'h7: pos_word = 16'hc3a7;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbff2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf30;
              3'h2: pos_word = 16'hbdf6;
              3'h3: pos_word = 16'h3ec3;
              3'h4: pos_word = 16'h3f91;
              3'h5: pos_word = 16'h4082;
              3'h6: pos_word = 16'hc082;
              3'h7: pos_word = 16'hbf91;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbec3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3df4;
              3'h2: pos_word = 16'h3f30;
              3'h3: pos_word = 16'h3ff2;
              3'h4: pos_word = 16'h4389;
              3'h5: pos_word = 16'hbff6;
              3'h6: pos_word = 16'hbf32;
              3'h7: pos_word = 16'hbe02;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3ebf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8f;
              3'h2: pos_word = 16'h407c;
              3'h3: pos_word = 16'hc086;
              3'h4: pos_word = 16'hbf93;
              3'h5: pos_word = 16'hbec7;
              3'h6: pos_word = 16'h3de7;
              3'h7: pos_word = 16'h3f2d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd0: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fee;
            case (mant_lo3)
              3'h1: pos_word = 16'hbffa;
              3'h2: pos_word = 16'hbe09;
              3'h3: pos_word = 16'h3f8d;
              3'h4: pos_word = 16'hc08a;
              3'h5: pos_word = 16'hbecb;
              3'h6: pos_word = 16'h3f2b;
              3'h7: pos_word = 16'h426d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf38;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb7;
              3'h2: pos_word = 16'h406f;
              3'h3: pos_word = 16'hbf97;
              3'h4: pos_word = 16'h3dcb;
              3'h5: pos_word = 16'h3fe7;
              3'h6: pos_word = 16'hc001;
              3'h7: pos_word = 16'hbe16;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f89;
            case (mant_lo3)
              3'h1: pos_word = 16'hc093;
              3'h2: pos_word = 16'hbed3;
              3'h3: pos_word = 16'h3f26;
              3'h4: pos_word = 16'h4205;
              3'h5: pos_word = 16'hbf3d;
              3'h6: pos_word = 16'h3eb0;
              3'h7: pos_word = 16'h4063;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf9b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3db0;
              3'h2: pos_word = 16'h3fe0;
              3'h3: pos_word = 16'hc006;
              3'h4: pos_word = 16'hbe24;
              3'h5: pos_word = 16'h3f86;
              3'h6: pos_word = 16'hc09d;
              3'h7: pos_word = 16'hbedb;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f21;
            case (mant_lo3)
              3'h1: pos_word = 16'h41b8;
              3'h2: pos_word = 16'hbf42;
              3'h3: pos_word = 16'h3ea8;
              3'h4: pos_word = 16'h4058;
              3'h5: pos_word = 16'hbf9f;
              3'h6: pos_word = 16'h3d94;
              3'h7: pos_word = 16'h3fd9;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc00b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe32;
              3'h2: pos_word = 16'h3f82;
              3'h3: pos_word = 16'hc0a8;
              3'h4: pos_word = 16'hbee3;
              3'h5: pos_word = 16'h3f1c;
              3'h6: pos_word = 16'h418d;
              3'h7: pos_word = 16'hbf47;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3ea0;
            case (mant_lo3)
              3'h1: pos_word = 16'h404e;
              3'h2: pos_word = 16'hbfa3;
              3'h3: pos_word = 16'h3d72;
              3'h4: pos_word = 16'h3fd3;
              3'h5: pos_word = 16'hc010;
              3'h6: pos_word = 16'hbe40;
              3'h7: pos_word = 16'h3f7d;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc0b5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeeb;
              3'h2: pos_word = 16'h3f18;
              3'h3: pos_word = 16'h4164;
              3'h4: pos_word = 16'hbf4d;
              3'h5: pos_word = 16'h3e99;
              3'h6: pos_word = 16'h4045;
              3'h7: pos_word = 16'hbfa8;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3d3c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcc;
              3'h2: pos_word = 16'hc015;
              3'h3: pos_word = 16'hbe4e;
              3'h4: pos_word = 16'h3f77;
              3'h5: pos_word = 16'hc0c4;
              3'h6: pos_word = 16'hbef3;
              3'h7: pos_word = 16'h3f13;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4140;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf53;
              3'h2: pos_word = 16'h3e92;
              3'h3: pos_word = 16'h403c;
              3'h4: pos_word = 16'hbfad;
              3'h5: pos_word = 16'h3d05;
              3'h6: pos_word = 16'h3fc7;
              3'h7: pos_word = 16'hc01a;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe5d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f70;
              3'h2: pos_word = 16'hc0d6;
              3'h3: pos_word = 16'hbefc;
              3'h4: pos_word = 16'h3f0f;
              3'h5: pos_word = 16'h4125;
              3'h6: pos_word = 16'hbf58;
              3'h7: pos_word = 16'h3e8a;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4034;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb2;
              3'h2: pos_word = 16'h3c9e;
              3'h3: pos_word = 16'h3fc1;
              3'h4: pos_word = 16'hc020;
              3'h5: pos_word = 16'hbe6b;
              3'h6: pos_word = 16'h3f6a;
              3'h7: pos_word = 16'hc0ec;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf02;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0a;
              3'h2: pos_word = 16'h4111;
              3'h3: pos_word = 16'hbf5e;
              3'h4: pos_word = 16'h3e83;
              3'h5: pos_word = 16'h402d;
              3'h6: pos_word = 16'hbfb7;
              3'h7: pos_word = 16'h3bc4;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3fbb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc027;
              3'h2: pos_word = 16'hbe79;
              3'h3: pos_word = 16'h3f64;
              3'h4: pos_word = 16'hc103;
              3'h5: pos_word = 16'hbf06;
              3'h6: pos_word = 16'h3f06;
              3'h7: pos_word = 16'h4101;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf64;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e78;
              3'h2: pos_word = 16'h4026;
              3'h3: pos_word = 16'hbfbc;
              3'h4: pos_word = 16'hbbee;
              3'h5: pos_word = 16'h3fb6;
              3'h6: pos_word = 16'hc02e;
              3'h7: pos_word = 16'hbe84;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f5e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc113;
              3'h2: pos_word = 16'hbf0b;
              3'h3: pos_word = 16'h3f02;
              3'h4: pos_word = 16'h40e9;
              3'h5: pos_word = 16'hbf6a;
              3'h6: pos_word = 16'h3e69;
              3'h7: pos_word = 16'h4020;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd1: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbfc1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb1;
              3'h2: pos_word = 16'hbe8b;
              3'h3: pos_word = 16'hc128;
              3'h4: pos_word = 16'h3efb;
              3'h5: pos_word = 16'hbf71;
              3'h6: pos_word = 16'h401a;
              3'h7: pos_word = 16'hbd0b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc03d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f52;
              3'h2: pos_word = 16'hbf14;
              3'h3: pos_word = 16'h40c3;
              3'h4: pos_word = 16'h3e4d;
              3'h5: pos_word = 16'hbfcd;
              3'h6: pos_word = 16'h3fa8;
              3'h7: pos_word = 16'hbe9a;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc169;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eea;
              3'h2: pos_word = 16'hbf7e;
              3'h3: pos_word = 16'h400f;
              3'h4: pos_word = 16'hbd77;
              3'h5: pos_word = 16'hc04f;
              3'h6: pos_word = 16'h3f47;
              3'h7: pos_word = 16'hbf1d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h40a7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e31;
              3'h2: pos_word = 16'hbfda;
              3'h3: pos_word = 16'h3f9f;
              3'h4: pos_word = 16'hbea9;
              3'h5: pos_word = 16'hc1be;
              3'h6: pos_word = 16'h3eda;
              3'h7: pos_word = 16'hbf86;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4005;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb2;
              3'h2: pos_word = 16'hc064;
              3'h3: pos_word = 16'h3f3c;
              3'h4: pos_word = 16'hbf26;
              3'h5: pos_word = 16'h4092;
              3'h6: pos_word = 16'h3e15;
              3'h7: pos_word = 16'hbfe8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f96;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb8;
              3'h2: pos_word = 16'hc280;
              3'h3: pos_word = 16'h3eca;
              3'h4: pos_word = 16'hbf8d;
              3'h5: pos_word = 16'h3ffa;
              3'h6: pos_word = 16'hbde9;
              3'h7: pos_word = 16'hc07e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f32;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf30;
              3'h2: pos_word = 16'h4081;
              3'h3: pos_word = 16'h3df3;
              3'h4: pos_word = 16'hbff7;
              3'h5: pos_word = 16'h3f8f;
              3'h6: pos_word = 16'hbec7;
              3'h7: pos_word = 16'h42b7;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ebb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf95;
              3'h2: pos_word = 16'h3fea;
              3'h3: pos_word = 16'hbe10;
              3'h4: pos_word = 16'hc08f;
              3'h5: pos_word = 16'h3f28;
              3'h6: pos_word = 16'hbf3a;
              3'h7: pos_word = 16'h4068;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3dbc;
            case (mant_lo3)
              3'h1: pos_word = 16'hc004;
              3'h2: pos_word = 16'h3f87;
              3'h3: pos_word = 16'hbed7;
              3'h4: pos_word = 16'h41d6;
              3'h5: pos_word = 16'h3eab;
              3'h6: pos_word = 16'hbf9d;
              3'h7: pos_word = 16'h3fdc;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a3;
              3'h2: pos_word = 16'h3f1f;
              3'h3: pos_word = 16'hbf45;
              3'h4: pos_word = 16'h4052;
              3'h5: pos_word = 16'h3d85;
              3'h6: pos_word = 16'hc00d;
              3'h7: pos_word = 16'h3f80;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbee7;
            case (mant_lo3)
              3'h1: pos_word = 16'h417a;
              3'h2: pos_word = 16'h3e9c;
              3'h3: pos_word = 16'hbfa6;
              3'h4: pos_word = 16'h3fcf;
              3'h5: pos_word = 16'hbe48;
              3'h6: pos_word = 16'hc0bd;
              3'h7: pos_word = 16'h3f15;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf50;
            case (mant_lo3)
              3'h1: pos_word = 16'h4040;
              3'h2: pos_word = 16'h3d1e;
              3'h3: pos_word = 16'hc018;
              3'h4: pos_word = 16'h3f73;
              3'h5: pos_word = 16'hbef8;
              3'h6: pos_word = 16'h4130;
              3'h7: pos_word = 16'h3e8e;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbfaf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc3;
              3'h2: pos_word = 16'hbe64;
              3'h3: pos_word = 16'hc0e1;
              3'h4: pos_word = 16'h3f0c;
              3'h5: pos_word = 16'hbf5c;
              3'h6: pos_word = 16'h4030;
              3'h7: pos_word = 16'h3c44;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc024;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f66;
              3'h2: pos_word = 16'hbf04;
              3'h3: pos_word = 16'h4108;
              3'h4: pos_word = 16'h3e7e;
              3'h5: pos_word = 16'hbfba;
              3'h6: pos_word = 16'h3fb9;
              3'h7: pos_word = 16'hbe81;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc10b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f04;
              3'h2: pos_word = 16'hbf68;
              3'h3: pos_word = 16'h4023;
              3'h4: pos_word = 16'hbc6e;
              3'h5: pos_word = 16'hc032;
              3'h6: pos_word = 16'h3f5a;
              3'h7: pos_word = 16'hbf0d;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h40dd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e62;
              3'h2: pos_word = 16'hbfc4;
              3'h3: pos_word = 16'h3fae;
              3'h4: pos_word = 16'hbe8f;
              3'h5: pos_word = 16'hc136;
              3'h6: pos_word = 16'h3ef6;
              3'h7: pos_word = 16'hbf74;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd2: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h4017;
            case (mant_lo3)
              3'h1: pos_word = 16'hc042;
              3'h2: pos_word = 16'hbf16;
              3'h3: pos_word = 16'h3e45;
              3'h4: pos_word = 16'h3fa5;
              3'h5: pos_word = 16'hc182;
              3'h6: pos_word = 16'hbf81;
              3'h7: pos_word = 16'hbd8b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f44;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a1;
              3'h2: pos_word = 16'hbfdd;
              3'h3: pos_word = 16'hbead;
              3'h4: pos_word = 16'h3ed6;
              3'h5: pos_word = 16'h4003;
              3'h6: pos_word = 16'hc06b;
              3'h7: pos_word = 16'hbf29;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e0e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f94;
              3'h2: pos_word = 16'hc2f0;
              3'h3: pos_word = 16'hbf8f;
              3'h4: pos_word = 16'hbdf8;
              3'h5: pos_word = 16'h3f2f;
              3'h6: pos_word = 16'h407b;
              3'h7: pos_word = 16'hbffb;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbecc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb6;
              3'h2: pos_word = 16'h3fe6;
              3'h3: pos_word = 16'hc094;
              3'h4: pos_word = 16'hbf3d;
              3'h5: pos_word = 16'h3dad;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'h41b3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbfa0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe34;
              3'h2: pos_word = 16'h3f1c;
              3'h3: pos_word = 16'h404d;
              3'h4: pos_word = 16'hc010;
              3'h5: pos_word = 16'hbeec;
              3'h6: pos_word = 16'h3e98;
              3'h7: pos_word = 16'h3fcc;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0c6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf53;
              3'h2: pos_word = 16'h3d00;
              3'h3: pos_word = 16'h3f70;
              3'h4: pos_word = 16'h4123;
              3'h5: pos_word = 16'hbfb2;
              3'h6: pos_word = 16'hbe6c;
              3'h7: pos_word = 16'h3f0a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h402c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc027;
              3'h2: pos_word = 16'hbf07;
              3'h3: pos_word = 16'h3e76;
              3'h4: pos_word = 16'h3fb6;
              3'h5: pos_word = 16'hc115;
              3'h6: pos_word = 16'hbf6b;
              3'h7: pos_word = 16'hbcb3;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f57;
            case (mant_lo3)
              3'h1: pos_word = 16'h40d3;
              3'h2: pos_word = 16'hbfc8;
              3'h3: pos_word = 16'hbe93;
              3'h4: pos_word = 16'h3ef2;
              3'h5: pos_word = 16'h4014;
              3'h6: pos_word = 16'hc046;
              3'h7: pos_word = 16'hbf19;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3e3e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa3;
              3'h2: pos_word = 16'hc194;
              3'h3: pos_word = 16'hbf83;
              3'h4: pos_word = 16'hbd9a;
              3'h5: pos_word = 16'h3f41;
              3'h6: pos_word = 16'h409b;
              3'h7: pos_word = 16'hbfe1;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbeb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed1;
              3'h2: pos_word = 16'h4001;
              3'h3: pos_word = 16'hc072;
              3'h4: pos_word = 16'hbf2c;
              3'h5: pos_word = 16'h3e06;
              3'h6: pos_word = 16'h3f92;
              3'h7: pos_word = 16'hc46b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf91;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe04;
              3'h2: pos_word = 16'h3f2d;
              3'h3: pos_word = 16'h4074;
              3'h4: pos_word = 16'hc000;
              3'h5: pos_word = 16'hbed0;
              3'h6: pos_word = 16'h3eb2;
              3'h7: pos_word = 16'h3fe2;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc099;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf40;
              3'h2: pos_word = 16'h3d9e;
              3'h3: pos_word = 16'h3f83;
              3'h4: pos_word = 16'h419a;
              3'h5: pos_word = 16'hbfa2;
              3'h6: pos_word = 16'hbe3b;
              3'h7: pos_word = 16'h3f19;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4048;
            case (mant_lo3)
              3'h1: pos_word = 16'hc013;
              3'h2: pos_word = 16'hbef0;
              3'h3: pos_word = 16'h3e94;
              3'h4: pos_word = 16'h3fc9;
              3'h5: pos_word = 16'hc0d0;
              3'h6: pos_word = 16'hbf56;
              3'h7: pos_word = 16'h3cc4;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f6c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4118;
              3'h2: pos_word = 16'hbfb5;
              3'h3: pos_word = 16'hbe74;
              3'h4: pos_word = 16'h3f08;
              3'h5: pos_word = 16'h4028;
              3'h6: pos_word = 16'hc02b;
              3'h7: pos_word = 16'hbf09;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3e6f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb3;
              3'h2: pos_word = 16'hc120;
              3'h3: pos_word = 16'hbf6e;
              3'h4: pos_word = 16'hbcee;
              3'h5: pos_word = 16'h3f54;
              3'h6: pos_word = 16'h40c9;
              3'h7: pos_word = 16'hbfcb;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbe97;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eed;
              3'h2: pos_word = 16'h4011;
              3'h3: pos_word = 16'hc04b;
              3'h4: pos_word = 16'hbf1b;
              3'h5: pos_word = 16'h3e36;
              3'h6: pos_word = 16'h3fa0;
              3'h7: pos_word = 16'hc1ab;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd3: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf85;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3e;
              3'h2: pos_word = 16'hbfe5;
              3'h3: pos_word = 16'h3ecd;
              3'h4: pos_word = 16'hc079;
              3'h5: pos_word = 16'h3dfd;
              3'h6: pos_word = 16'h4321;
              3'h7: pos_word = 16'hbe0b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h406d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed4;
              3'h2: pos_word = 16'h3fde;
              3'h3: pos_word = 16'hbf43;
              3'h4: pos_word = 16'h3f81;
              3'h5: pos_word = 16'hbfa4;
              3'h6: pos_word = 16'h3f17;
              3'h7: pos_word = 16'hc016;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e90;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0da;
              3'h2: pos_word = 16'h3c89;
              3'h3: pos_word = 16'h410e;
              3'h4: pos_word = 16'hbe7c;
              3'h5: pos_word = 16'h4025;
              3'h6: pos_word = 16'hbf0c;
              3'h7: pos_word = 16'h3fb0;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf72;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f51;
              3'h2: pos_word = 16'hbfce;
              3'h3: pos_word = 16'h3ee9;
              3'h4: pos_word = 16'hc051;
              3'h5: pos_word = 16'h3e2e;
              3'h6: pos_word = 16'hc1ca;
              3'h7: pos_word = 16'hbdb8;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4090;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb9;
              3'h2: pos_word = 16'h3ff8;
              3'h3: pos_word = 16'hbf31;
              3'h4: pos_word = 16'h3f8e;
              3'h5: pos_word = 16'hbf96;
              3'h6: pos_word = 16'h3f27;
              3'h7: pos_word = 16'hc005;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3eaa;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a5;
              3'h2: pos_word = 16'h3d80;
              3'h3: pos_word = 16'h4170;
              3'h4: pos_word = 16'hbe4b;
              3'h5: pos_word = 16'h403e;
              3'h6: pos_word = 16'hbefa;
              3'h7: pos_word = 16'h3fc2;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf5d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f65;
              3'h2: pos_word = 16'hbfbb;
              3'h3: pos_word = 16'h3f03;
              3'h4: pos_word = 16'hc033;
              3'h5: pos_word = 16'h3e5f;
              3'h6: pos_word = 16'hc13b;
              3'h7: pos_word = 16'hbd33;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h40b8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9f;
              3'h2: pos_word = 16'h400b;
              3'h3: pos_word = 16'hbf20;
              3'h4: pos_word = 16'h3f9c;
              3'h5: pos_word = 16'hbf89;
              3'h6: pos_word = 16'h3f38;
              3'h7: pos_word = 16'hbfed;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3ec4;
            case (mant_lo3)
              3'h1: pos_word = 16'hc084;
              3'h2: pos_word = 16'h3ddf;
              3'h3: pos_word = 16'h4241;
              3'h4: pos_word = 16'hbe1b;
              3'h5: pos_word = 16'h4060;
              3'h6: pos_word = 16'hbedd;
              3'h7: pos_word = 16'h3fd7;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf49;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7b;
              3'h2: pos_word = 16'hbfa9;
              3'h3: pos_word = 16'h3f12;
              3'h4: pos_word = 16'hc01c;
              3'h5: pos_word = 16'h3e88;
              3'h6: pos_word = 16'hc0f3;
              3'h7: pos_word = 16'h3b0b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h40fb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe86;
              3'h2: pos_word = 16'h401e;
              3'h3: pos_word = 16'hbf10;
              3'h4: pos_word = 16'h3fab;
              3'h5: pos_word = 16'hbf79;
              3'h6: pos_word = 16'h3f4b;
              3'h7: pos_word = 16'hbfd5;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ee0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc05c;
              3'h2: pos_word = 16'h3e1f;
              3'h3: pos_word = 16'hc220;
              3'h4: pos_word = 16'hbdd6;
              3'h5: pos_word = 16'h4087;
              3'h6: pos_word = 16'hbec2;
              3'h7: pos_word = 16'h3fef;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf37;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8a;
              3'h2: pos_word = 16'hbf9a;
              3'h3: pos_word = 16'h3f22;
              3'h4: pos_word = 16'hc00a;
              3'h5: pos_word = 16'h3ea2;
              3'h6: pos_word = 16'hc0b3;
              3'h7: pos_word = 16'h3d44;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4145;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5a;
              3'h2: pos_word = 16'h4035;
              3'h3: pos_word = 16'hbf01;
              3'h4: pos_word = 16'h3fbc;
              3'h5: pos_word = 16'hbf63;
              3'h6: pos_word = 16'h3f5f;
              3'h7: pos_word = 16'hbfc1;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3efc;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03c;
              3'h2: pos_word = 16'h3e4f;
              3'h3: pos_word = 16'hc162;
              3'h4: pos_word = 16'hbd6f;
              3'h5: pos_word = 16'h40a9;
              3'h6: pos_word = 16'hbea8;
              3'h7: pos_word = 16'h4006;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf26;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f97;
              3'h2: pos_word = 16'hbf8d;
              3'h3: pos_word = 16'h3f33;
              3'h4: pos_word = 16'hbff5;
              3'h5: pos_word = 16'h3ebc;
              3'h6: pos_word = 16'hc08d;
              3'h7: pos_word = 16'h3dc0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd4: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h41e2;
            case (mant_lo3)
              3'h1: pos_word = 16'h4054;
              3'h2: pos_word = 16'h3fd0;
              3'h3: pos_word = 16'h3f74;
              3'h4: pos_word = 16'h3f0d;
              3'h5: pos_word = 16'h3e80;
              3'h6: pos_word = 16'hbc4c;
              3'h7: pos_word = 16'hbe8e;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf15;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf80;
              3'h2: pos_word = 16'hbfdc;
              3'h3: pos_word = 16'hc069;
              3'h4: pos_word = 16'hc2bf;
              3'h5: pos_word = 16'h407d;
              3'h6: pos_word = 16'h3fe7;
              3'h7: pos_word = 16'h3f86;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f1d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e9a;
              3'h2: pos_word = 16'h3d09;
              3'h3: pos_word = 16'hbe6a;
              3'h4: pos_word = 16'hbf06;
              3'h5: pos_word = 16'hbf6a;
              3'h6: pos_word = 16'hbfc7;
              3'h7: pos_word = 16'hc045;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc18e;
            case (mant_lo3)
              3'h1: pos_word = 16'h409c;
              3'h2: pos_word = 16'h4001;
              3'h3: pos_word = 16'h3f93;
              3'h4: pos_word = 16'h3f2d;
              3'h5: pos_word = 16'h3eb3;
              3'h6: pos_word = 16'h3da2;
              3'h7: pos_word = 16'hbe39;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbeef;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf55;
              3'h2: pos_word = 16'hbfb4;
              3'h3: pos_word = 16'hc02a;
              3'h4: pos_word = 16'hc11c;
              3'h5: pos_word = 16'h40cc;
              3'h6: pos_word = 16'h4012;
              3'h7: pos_word = 16'h3fa1;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f3f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ece;
              3'h2: pos_word = 16'h3e01;
              3'h3: pos_word = 16'hbe09;
              3'h4: pos_word = 16'hbed3;
              3'h5: pos_word = 16'hbf42;
              3'h6: pos_word = 16'hbfa4;
              3'h7: pos_word = 16'hc015;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc0d7;
            case (mant_lo3)
              3'h1: pos_word = 16'h4111;
              3'h2: pos_word = 16'h4026;
              3'h3: pos_word = 16'h3fb1;
              3'h4: pos_word = 16'h3f52;
              3'h5: pos_word = 16'h3eea;
              3'h6: pos_word = 16'h3e30;
              3'h7: pos_word = 16'hbdb3;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbeb8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf30;
              3'h2: pos_word = 16'hbf95;
              3'h3: pos_word = 16'hc004;
              3'h4: pos_word = 16'hc0a3;
              3'h5: pos_word = 16'h4178;
              3'h6: pos_word = 16'h4040;
              3'h7: pos_word = 16'h3fc3;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f66;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f03;
              3'h2: pos_word = 16'h3e61;
              3'h3: pos_word = 16'hbd2a;
              3'h4: pos_word = 16'hbe9e;
              3'h5: pos_word = 16'hbf20;
              3'h6: pos_word = 16'hbf88;
              3'h7: pos_word = 16'hbfec;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc083;
            case (mant_lo3)
              3'h1: pos_word = 16'h4257;
              3'h2: pos_word = 16'h4061;
              3'h3: pos_word = 16'h3fd8;
              3'h4: pos_word = 16'h3f7c;
              3'h5: pos_word = 16'h3f13;
              3'h6: pos_word = 16'h3e89;
              3'h7: pos_word = 16'h3b8b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe85;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf10;
              3'h2: pos_word = 16'hbf78;
              3'h3: pos_word = 16'hbfd4;
              3'h4: pos_word = 16'hc05a;
              3'h5: pos_word = 16'hc213;
              3'h6: pos_word = 16'h4088;
              3'h7: pos_word = 16'h3ff1;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f8a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f23;
              3'h2: pos_word = 16'h3ea3;
              3'h3: pos_word = 16'h3d4d;
              3'h4: pos_word = 16'hbe58;
              3'h5: pos_word = 16'hbf01;
              3'h6: pos_word = 16'hbf62;
              3'h7: pos_word = 16'hbfc0;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc03a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc15b;
              3'h2: pos_word = 16'h40ab;
              3'h3: pos_word = 16'h4007;
              3'h4: pos_word = 16'h3f98;
              3'h5: pos_word = 16'h3f34;
              3'h6: pos_word = 16'h3ebd;
              3'h7: pos_word = 16'h3dc5;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe28;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee5;
              3'h2: pos_word = 16'hbf4e;
              3'h3: pos_word = 16'hbfae;
              3'h4: pos_word = 16'hc022;
              3'h5: pos_word = 16'hc106;
              3'h6: pos_word = 16'h40e4;
              3'h7: pos_word = 16'h4019;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fa7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f46;
              3'h2: pos_word = 16'h3ed8;
              3'h3: pos_word = 16'h3e12;
              3'h4: pos_word = 16'hbdef;
              3'h5: pos_word = 16'hbec9;
              3'h6: pos_word = 16'hbf3c;
              3'h7: pos_word = 16'hbf9e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc00e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c1;
              3'h2: pos_word = 16'h412b;
              3'h3: pos_word = 16'h402f;
              3'h4: pos_word = 16'h3fb7;
              3'h5: pos_word = 16'h3f59;
              3'h6: pos_word = 16'h3ef4;
              3'h7: pos_word = 16'h3e42;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd5: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbd91;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2a;
              3'h2: pos_word = 16'hbffd;
              3'h3: pos_word = 16'h41a7;
              3'h4: pos_word = 16'h3fca;
              3'h5: pos_word = 16'h3f09;
              3'h6: pos_word = 16'hbccc;
              3'h7: pos_word = 16'hbf1a;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbfe3;
            case (mant_lo3)
              3'h1: pos_word = 16'h43ff;
              3'h2: pos_word = 16'h3fe1;
              3'h3: pos_word = 16'h3f18;
              3'h4: pos_word = 16'h3cab;
              3'h5: pos_word = 16'hbf0a;
              3'h6: pos_word = 16'hbfcc;
              3'h7: pos_word = 16'hc1b6;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ffb;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f29;
              3'h2: pos_word = 16'h3d89;
              3'h3: pos_word = 16'hbef7;
              3'h4: pos_word = 16'hbfb9;
              3'h5: pos_word = 16'hc132;
              3'h6: pos_word = 16'h400d;
              3'h7: pos_word = 16'h3f3a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3de7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbedb;
              3'h2: pos_word = 16'hbfa8;
              3'h3: pos_word = 16'hc0eb;
              3'h4: pos_word = 16'h4020;
              3'h5: pos_word = 16'h3f4d;
              3'h6: pos_word = 16'h3e23;
              3'h7: pos_word = 16'hbebf;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf99;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0af;
              3'h2: pos_word = 16'h4038;
              3'h3: pos_word = 16'h3f61;
              3'h4: pos_word = 16'h3e54;
              3'h5: pos_word = 16'hbea5;
              3'h6: pos_word = 16'hbf8b;
              3'h7: pos_word = 16'hc08b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4057;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f76;
              3'h2: pos_word = 16'h3e83;
              3'h3: pos_word = 16'hbe8c;
              3'h4: pos_word = 16'hbf7e;
              3'h5: pos_word = 16'hc065;
              3'h6: pos_word = 16'h4081;
              3'h7: pos_word = 16'h3f87;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e9c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe65;
              3'h2: pos_word = 16'hbf68;
              3'h3: pos_word = 16'hc042;
              3'h4: pos_word = 16'h40a0;
              3'h5: pos_word = 16'h3f94;
              3'h6: pos_word = 16'h3eb6;
              3'h7: pos_word = 16'hbe35;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf54;
            case (mant_lo3)
              3'h1: pos_word = 16'hc028;
              3'h2: pos_word = 16'h40d1;
              3'h3: pos_word = 16'h3fa2;
              3'h4: pos_word = 16'h3ed1;
              3'h5: pos_word = 16'hbe05;
              3'h6: pos_word = 16'hbf41;
              3'h7: pos_word = 16'hc013;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4116;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb3;
              3'h2: pos_word = 16'h3eed;
              3'h3: pos_word = 16'hbdaa;
              3'h4: pos_word = 16'hbf2f;
              3'h5: pos_word = 16'hc003;
              3'h6: pos_word = 16'h4185;
              3'h7: pos_word = 16'h3fc5;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f05;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd19;
              3'h2: pos_word = 16'hbf1e;
              3'h3: pos_word = 16'hbfe9;
              3'h4: pos_word = 16'h428b;
              3'h5: pos_word = 16'h3fda;
              3'h6: pos_word = 16'h3f14;
              3'h7: pos_word = 16'h3c0b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf0e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd2;
              3'h2: pos_word = 16'hc1ff;
              3'h3: pos_word = 16'h3ff3;
              3'h4: pos_word = 16'h3f24;
              3'h5: pos_word = 16'h3d5f;
              3'h6: pos_word = 16'hbeff;
              3'h7: pos_word = 16'hbfbe;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc14f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4008;
              3'h2: pos_word = 16'h3f35;
              3'h3: pos_word = 16'h3dce;
              3'h4: pos_word = 16'hbee2;
              3'h5: pos_word = 16'hbfac;
              3'h6: pos_word = 16'hc101;
              3'h7: pos_word = 16'h401a;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f47;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e16;
              3'h2: pos_word = 16'hbec7;
              3'h3: pos_word = 16'hbf9d;
              3'h4: pos_word = 16'hc0bc;
              3'h5: pos_word = 16'h4031;
              3'h6: pos_word = 16'h3f5b;
              3'h7: pos_word = 16'h3e47;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbeac;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8f;
              3'h2: pos_word = 16'hc093;
              3'h3: pos_word = 16'h404e;
              3'h4: pos_word = 16'h3f70;
              3'h5: pos_word = 16'h3e78;
              3'h6: pos_word = 16'hbe92;
              3'h7: pos_word = 16'hbf82;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc070;
            case (mant_lo3)
              3'h1: pos_word = 16'h4075;
              3'h2: pos_word = 16'h3f84;
              3'h3: pos_word = 16'h3e95;
              3'h4: pos_word = 16'hbe73;
              3'h5: pos_word = 16'hbf6e;
              3'h6: pos_word = 16'hc04b;
              3'h7: pos_word = 16'h4096;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f90;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eaf;
              3'h2: pos_word = 16'hbe42;
              3'h3: pos_word = 16'hbf59;
              3'h4: pos_word = 16'hc02e;
              3'h5: pos_word = 16'h40c1;
              3'h6: pos_word = 16'h3f9e;
              3'h7: pos_word = 16'h3ec9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd6: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe12;
            case (mant_lo3)
              3'h1: pos_word = 16'hc018;
              3'h2: pos_word = 16'h3fae;
              3'h3: pos_word = 16'hbdc4;
              3'h4: pos_word = 16'hc007;
              3'h5: pos_word = 16'h3fc0;
              3'h6: pos_word = 16'hbd4c;
              3'h7: pos_word = 16'hbff0;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fd4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbb81;
              3'h2: pos_word = 16'hbfd8;
              3'h3: pos_word = 16'h3fec;
              3'h4: pos_word = 16'h3d2c;
              3'h5: pos_word = 16'hbfc3;
              3'h6: pos_word = 16'h4004;
              3'h7: pos_word = 16'h3db4;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfb1;
            case (mant_lo3)
              3'h1: pos_word = 16'h4015;
              3'h2: pos_word = 16'h3e09;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'h402a;
              3'h5: pos_word = 16'h3e39;
              3'h6: pos_word = 16'hbf93;
              3'h7: pos_word = 16'h4045;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3e6a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'h4069;
              3'h3: pos_word = 16'h3e8e;
              3'h4: pos_word = 16'hbf74;
              3'h5: pos_word = 16'h408e;
              3'h6: pos_word = 16'h3ea8;
              3'h7: pos_word = 16'hbf5e;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h40b3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec2;
              3'h2: pos_word = 16'hbf4b;
              3'h3: pos_word = 16'h40f3;
              3'h4: pos_word = 16'h3edd;
              3'h5: pos_word = 16'hbf38;
              3'h6: pos_word = 16'h413c;
              3'h7: pos_word = 16'h3efa;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf27;
            case (mant_lo3)
              3'h1: pos_word = 16'h41cc;
              3'h2: pos_word = 16'h3f0c;
              3'h3: pos_word = 16'hbf17;
              3'h4: pos_word = 16'hc319;
              3'h5: pos_word = 16'h3f1b;
              3'h6: pos_word = 16'hbf07;
              3'h7: pos_word = 16'hc199;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef2;
              3'h2: pos_word = 16'hc123;
              3'h3: pos_word = 16'h3f3d;
              3'h4: pos_word = 16'hbed5;
              3'h5: pos_word = 16'hc0dd;
              3'h6: pos_word = 16'h3f50;
              3'h7: pos_word = 16'hbeba;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc0a7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f64;
              3'h2: pos_word = 16'hbea0;
              3'h3: pos_word = 16'hc085;
              3'h4: pos_word = 16'h3f7a;
              3'h5: pos_word = 16'hbe87;
              3'h6: pos_word = 16'hc05e;
              3'h7: pos_word = 16'h3f89;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe5c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03d;
              3'h2: pos_word = 16'h3f96;
              3'h3: pos_word = 16'hbe2c;
              3'h4: pos_word = 16'hc024;
              3'h5: pos_word = 16'h3fa5;
              3'h6: pos_word = 16'hbdf8;
              3'h7: pos_word = 16'hc010;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fb6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd99;
              3'h2: pos_word = 16'hc000;
              3'h3: pos_word = 16'h3fc9;
              3'h4: pos_word = 16'hbcec;
              3'h5: pos_word = 16'hbfe5;
              3'h6: pos_word = 16'h3fdf;
              3'h7: pos_word = 16'h3c8b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfce;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff8;
              3'h2: pos_word = 16'h3d81;
              3'h3: pos_word = 16'hbfba;
              3'h4: pos_word = 16'h400b;
              3'h5: pos_word = 16'h3ddf;
              3'h6: pos_word = 16'hbfa9;
              3'h7: pos_word = 16'h401e;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3e1f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9a;
              3'h2: pos_word = 16'h4036;
              3'h3: pos_word = 16'h3e50;
              3'h4: pos_word = 16'hbf8c;
              3'h5: pos_word = 16'h4054;
              3'h6: pos_word = 16'h3e80;
              3'h7: pos_word = 16'hbf80;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h407e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e9a;
              3'h2: pos_word = 16'hbf6a;
              3'h3: pos_word = 16'h409d;
              3'h4: pos_word = 16'h3eb4;
              3'h5: pos_word = 16'hbf55;
              3'h6: pos_word = 16'h40cc;
              3'h7: pos_word = 16'h3ece;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf42;
            case (mant_lo3)
              3'h1: pos_word = 16'h4111;
              3'h2: pos_word = 16'h3eea;
              3'h3: pos_word = 16'hbf30;
              3'h4: pos_word = 16'h4179;
              3'h5: pos_word = 16'h3f04;
              3'h6: pos_word = 16'hbf1f;
              3'h7: pos_word = 16'h425a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f13;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf10;
              3'h2: pos_word = 16'hc212;
              3'h3: pos_word = 16'h3f23;
              3'h4: pos_word = 16'hbf01;
              3'h5: pos_word = 16'hc15a;
              3'h6: pos_word = 16'h3f34;
              3'h7: pos_word = 16'hbee5;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc106;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f46;
              3'h2: pos_word = 16'hbec9;
              3'h3: pos_word = 16'hc0c0;
              3'h4: pos_word = 16'h3f59;
              3'h5: pos_word = 16'hbeae;
              3'h6: pos_word = 16'hc096;
              3'h7: pos_word = 16'h3f6e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd7: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f83;
              3'h2: pos_word = 16'hc04d;
              3'h3: pos_word = 16'hbe46;
              3'h4: pos_word = 16'h3f9d;
              3'h5: pos_word = 16'hc01a;
              3'h6: pos_word = 16'hbdcc;
              3'h7: pos_word = 16'h3fbe;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbff3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc01;
              3'h2: pos_word = 16'h3fea;
              3'h3: pos_word = 16'hbfc5;
              3'h4: pos_word = 16'h3dac;
              3'h5: pos_word = 16'h4014;
              3'h6: pos_word = 16'hbfa2;
              3'h7: pos_word = 16'h3e35;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4043;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf87;
              3'h2: pos_word = 16'h3e8c;
              3'h3: pos_word = 16'h408b;
              3'h4: pos_word = 16'hbf60;
              3'h5: pos_word = 16'h3ec0;
              3'h6: pos_word = 16'h40ec;
              3'h7: pos_word = 16'hbf3a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3ef7;
            case (mant_lo3)
              3'h1: pos_word = 16'h41b9;
              3'h2: pos_word = 16'hbf18;
              3'h3: pos_word = 16'h3f1a;
              3'h4: pos_word = 16'hc1a5;
              3'h5: pos_word = 16'hbef4;
              3'h6: pos_word = 16'h3f3c;
              3'h7: pos_word = 16'hc0e3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbebd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f63;
              3'h2: pos_word = 16'hc088;
              3'h3: pos_word = 16'hbe89;
              3'h4: pos_word = 16'h3f88;
              3'h5: pos_word = 16'hc03f;
              3'h6: pos_word = 16'hbe30;
              3'h7: pos_word = 16'h3fa4;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc011;
            case (mant_lo3)
              3'h1: pos_word = 16'hbda1;
              3'h2: pos_word = 16'h3fc7;
              3'h3: pos_word = 16'hbfe7;
              3'h4: pos_word = 16'h3c56;
              3'h5: pos_word = 16'h3ff6;
              3'h6: pos_word = 16'hbfbc;
              3'h7: pos_word = 16'h3dd7;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h401c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9b;
              3'h2: pos_word = 16'h3e4c;
              3'h3: pos_word = 16'h4051;
              3'h4: pos_word = 16'hbf81;
              3'h5: pos_word = 16'h3e98;
              3'h6: pos_word = 16'h409a;
              3'h7: pos_word = 16'hbf57;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ecc;
            case (mant_lo3)
              3'h1: pos_word = 16'h410c;
              3'h2: pos_word = 16'hbf32;
              3'h3: pos_word = 16'h3f02;
              3'h4: pos_word = 16'h4234;
              3'h5: pos_word = 16'hbf11;
              3'h6: pos_word = 16'h3f21;
              3'h7: pos_word = 16'hc166;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbee7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f44;
              3'h2: pos_word = 16'hc0c5;
              3'h3: pos_word = 16'hbeb1;
              3'h4: pos_word = 16'h3f6c;
              3'h5: pos_word = 16'hc078;
              3'h6: pos_word = 16'hbe7b;
              3'h7: pos_word = 16'h3f8e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc033;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe1a;
              3'h2: pos_word = 16'h3fab;
              3'h3: pos_word = 16'hc00a;
              3'h4: pos_word = 16'hbd6c;
              3'h5: pos_word = 16'h3fd0;
              3'h6: pos_word = 16'hbfdc;
              3'h7: pos_word = 16'h3d0b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4001;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb4;
              3'h2: pos_word = 16'h3e01;
              3'h3: pos_word = 16'h4026;
              3'h4: pos_word = 16'hbf95;
              3'h5: pos_word = 16'h3e62;
              3'h6: pos_word = 16'h4062;
              3'h7: pos_word = 16'hbf78;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ea3;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ac;
              3'h2: pos_word = 16'hbf4e;
              3'h3: pos_word = 16'h3ed9;
              3'h4: pos_word = 16'h412c;
              3'h5: pos_word = 16'hbf2a;
              3'h6: pos_word = 16'h3f09;
              3'h7: pos_word = 16'h443e;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf0a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f29;
              3'h2: pos_word = 16'hc131;
              3'h3: pos_word = 16'hbeda;
              3'h4: pos_word = 16'h3f4d;
              3'h5: pos_word = 16'hc0ae;
              3'h6: pos_word = 16'hbea5;
              3'h7: pos_word = 16'h3f76;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc064;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe65;
              3'h2: pos_word = 16'h3f94;
              3'h3: pos_word = 16'hc028;
              3'h4: pos_word = 16'hbe04;
              3'h5: pos_word = 16'h3fb3;
              3'h6: pos_word = 16'hc002;
              3'h7: pos_word = 16'hbd16;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fdb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd2;
              3'h2: pos_word = 16'h3d61;
              3'h3: pos_word = 16'h4009;
              3'h4: pos_word = 16'hbfac;
              3'h5: pos_word = 16'h3e17;
              3'h6: pos_word = 16'h4031;
              3'h7: pos_word = 16'hbf8f;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e78;
            case (mant_lo3)
              3'h1: pos_word = 16'h4075;
              3'h2: pos_word = 16'hbf6e;
              3'h3: pos_word = 16'h3eaf;
              3'h4: pos_word = 16'h40c2;
              3'h5: pos_word = 16'hbf45;
              3'h6: pos_word = 16'h3ee5;
              3'h7: pos_word = 16'h415e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd8: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'hc24c;
              3'h2: pos_word = 16'h3f31;
              3'h3: pos_word = 16'hbece;
              3'h4: pos_word = 16'hc09c;
              3'h5: pos_word = 16'h3f81;
              3'h6: pos_word = 16'hbe4e;
              3'h7: pos_word = 16'hc01e;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fbb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc81;
              3'h2: pos_word = 16'hbfc8;
              3'h3: pos_word = 16'h4010;
              3'h4: pos_word = 16'h3e2d;
              3'h5: pos_word = 16'hbf89;
              3'h6: pos_word = 16'h4086;
              3'h7: pos_word = 16'h3ebb;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf3d;
            case (mant_lo3)
              3'h1: pos_word = 16'h419d;
              3'h2: pos_word = 16'h3f17;
              3'h3: pos_word = 16'hbef9;
              3'h4: pos_word = 16'hc0f1;
              3'h5: pos_word = 16'h3f5f;
              3'h6: pos_word = 16'hbe8d;
              3'h7: pos_word = 16'hc044;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fa1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb1;
              3'h2: pos_word = 16'hbfeb;
              3'h3: pos_word = 16'h3ff1;
              3'h4: pos_word = 16'h3dc7;
              3'h5: pos_word = 16'hbf9e;
              3'h6: pos_word = 16'h404b;
              3'h7: pos_word = 16'h3e93;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf5a;
            case (mant_lo3)
              3'h1: pos_word = 16'h4103;
              3'h2: pos_word = 16'h3f00;
              3'h3: pos_word = 16'hbf14;
              3'h4: pos_word = 16'hc182;
              3'h5: pos_word = 16'h3f41;
              3'h6: pos_word = 16'hbeb5;
              3'h7: pos_word = 16'hc080;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe22;
              3'h2: pos_word = 16'hc00c;
              3'h3: pos_word = 16'h3fcd;
              3'h4: pos_word = 16'h3cd6;
              3'h5: pos_word = 16'hbfb7;
              3'h6: pos_word = 16'h4022;
              3'h7: pos_word = 16'h3e59;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf7c;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a4;
              3'h2: pos_word = 16'h3ed4;
              3'h3: pos_word = 16'hbf2d;
              3'h4: pos_word = 16'h42da;
              3'h5: pos_word = 16'h3f26;
              3'h6: pos_word = 16'hbedf;
              3'h7: pos_word = 16'hc0b6;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f73;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe6d;
              3'h2: pos_word = 16'hc02c;
              3'h3: pos_word = 16'h3fb0;
              3'h4: pos_word = 16'hbd36;
              3'h5: pos_word = 16'hbfd5;
              3'h6: pos_word = 16'h4006;
              3'h7: pos_word = 16'h3e0f;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf91;
            case (mant_lo3)
              3'h1: pos_word = 16'h406e;
              3'h2: pos_word = 16'h3eab;
              3'h3: pos_word = 16'hbf49;
              3'h4: pos_word = 16'h4148;
              3'h5: pos_word = 16'h3f0d;
              3'h6: pos_word = 16'hbf06;
              3'h7: pos_word = 16'hc11a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f52;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9d;
              3'h2: pos_word = 16'hc059;
              3'h3: pos_word = 16'h3f98;
              3'h4: pos_word = 16'hbded;
              3'h5: pos_word = 16'hbffc;
              3'h6: pos_word = 16'h3fe1;
              3'h7: pos_word = 16'h3d8b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfa7;
            case (mant_lo3)
              3'h1: pos_word = 16'h4039;
              3'h2: pos_word = 16'h3e83;
              3'h3: pos_word = 16'hbf67;
              3'h4: pos_word = 16'h40d3;
              3'h5: pos_word = 16'h3eed;
              3'h6: pos_word = 16'hbf1e;
              3'h7: pos_word = 16'hc1f5;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f36;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec6;
              3'h2: pos_word = 16'hc092;
              3'h3: pos_word = 16'h3f84;
              3'h4: pos_word = 16'hbe40;
              3'h5: pos_word = 16'hc018;
              3'h6: pos_word = 16'h3fc0;
              3'h7: pos_word = 16'hbb2c;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbfc3;
            case (mant_lo3)
              3'h1: pos_word = 16'h4016;
              3'h2: pos_word = 16'h3e3b;
              3'h3: pos_word = 16'hbf85;
              3'h4: pos_word = 16'h408e;
              3'h5: pos_word = 16'h3ec3;
              3'h6: pos_word = 16'hbf38;
              3'h7: pos_word = 16'h41d3;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f1c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef1;
              3'h2: pos_word = 16'hc0db;
              3'h3: pos_word = 16'h3f65;
              3'h4: pos_word = 16'hbe86;
              3'h5: pos_word = 16'hc03c;
              3'h6: pos_word = 16'h3fa6;
              3'h7: pos_word = 16'hbd96;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfe4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff9;
              3'h2: pos_word = 16'h3de2;
              3'h3: pos_word = 16'hbf9a;
              3'h4: pos_word = 16'h4055;
              3'h5: pos_word = 16'h3e9a;
              3'h6: pos_word = 16'hbf55;
              3'h7: pos_word = 16'h4113;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f04;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0f;
              3'h2: pos_word = 16'hc156;
              3'h3: pos_word = 16'h3f46;
              3'h4: pos_word = 16'hbeae;
              3'h5: pos_word = 16'hc073;
              3'h6: pos_word = 16'h3f8f;
              3'h7: pos_word = 16'hbe14;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hd9: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc008;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d21;
              3'h2: pos_word = 16'h4029;
              3'h3: pos_word = 16'hbf75;
              3'h4: pos_word = 16'h3edc;
              3'h5: pos_word = 16'hc380;
              3'h6: pos_word = 16'hbed7;
              3'h7: pos_word = 16'h3f79;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc025;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd01;
              3'h2: pos_word = 16'h400a;
              3'h3: pos_word = 16'hbf8d;
              3'h4: pos_word = 16'h3eb2;
              3'h5: pos_word = 16'h416f;
              3'h6: pos_word = 16'hbf01;
              3'h7: pos_word = 16'h3f58;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc04f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdd2;
              3'h2: pos_word = 16'h3fe8;
              3'h3: pos_word = 16'hbfa3;
              3'h4: pos_word = 16'h3e8a;
              3'h5: pos_word = 16'h40e8;
              3'h6: pos_word = 16'hbf19;
              3'h7: pos_word = 16'h3f3b;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc089;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe33;
              3'h2: pos_word = 16'h3fc6;
              3'h3: pos_word = 16'hbfbd;
              3'h4: pos_word = 16'h3e49;
              3'h5: pos_word = 16'h4098;
              3'h6: pos_word = 16'hbf33;
              3'h7: pos_word = 16'h3f20;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc0c9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe7e;
              3'h2: pos_word = 16'h3faa;
              3'h3: pos_word = 16'hbfdd;
              3'h4: pos_word = 16'h3dfd;
              3'h5: pos_word = 16'h4060;
              3'h6: pos_word = 16'hbf4f;
              3'h7: pos_word = 16'h3f08;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc136;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea6;
              3'h2: pos_word = 16'h3f93;
              3'h3: pos_word = 16'hc003;
              3'h4: pos_word = 16'h3d56;
              3'h5: pos_word = 16'h4030;
              3'h6: pos_word = 16'hbf6f;
              3'h7: pos_word = 16'h3ee4;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc26b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbecf;
              3'h2: pos_word = 16'h3f80;
              3'h3: pos_word = 16'hc01f;
              3'h4: pos_word = 16'hbc96;
              3'h5: pos_word = 16'h400f;
              3'h6: pos_word = 16'hbf8a;
              3'h7: pos_word = 16'h3eba;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4195;
            case (mant_lo3)
              3'h1: pos_word = 16'hbefb;
              3'h2: pos_word = 16'h3f5e;
              3'h3: pos_word = 16'hc046;
              3'h4: pos_word = 16'hbdb7;
              3'h5: pos_word = 16'h3ff0;
              3'h6: pos_word = 16'hbf9f;
              3'h7: pos_word = 16'h3e92;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4100;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf15;
              3'h2: pos_word = 16'h3f40;
              3'h3: pos_word = 16'hc082;
              3'h4: pos_word = 16'hbe25;
              3'h5: pos_word = 16'h3fcc;
              3'h6: pos_word = 16'hbfb8;
              3'h7: pos_word = 16'h3e57;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h40a2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2e;
              3'h2: pos_word = 16'h3f25;
              3'h3: pos_word = 16'hc0b9;
              3'h4: pos_word = 16'hbe70;
              3'h5: pos_word = 16'h3faf;
              3'h6: pos_word = 16'hbfd7;
              3'h7: pos_word = 16'h3e0c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h406b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4a;
              3'h2: pos_word = 16'h3f0d;
              3'h3: pos_word = 16'hc11e;
              3'h4: pos_word = 16'hbe9f;
              3'h5: pos_word = 16'h3f97;
              3'h6: pos_word = 16'hbffe;
              3'h7: pos_word = 16'h3d86;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4037;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf69;
              3'h2: pos_word = 16'h3eec;
              3'h3: pos_word = 16'hc205;
              3'h4: pos_word = 16'hbec7;
              3'h5: pos_word = 16'h3f83;
              3'h6: pos_word = 16'hc019;
              3'h7: pos_word = 16'hbbac;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4015;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'h3ec1;
              3'h3: pos_word = 16'h41c5;
              3'h4: pos_word = 16'hbef2;
              3'h5: pos_word = 16'h3f64;
              3'h6: pos_word = 16'hc03e;
              3'h7: pos_word = 16'hbd9c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ff7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9b;
              3'h2: pos_word = 16'h3e99;
              3'h3: pos_word = 16'h410f;
              3'h4: pos_word = 16'hbf10;
              3'h5: pos_word = 16'h3f45;
              3'h6: pos_word = 16'hc075;
              3'h7: pos_word = 16'hbe17;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fd2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb3;
              3'h2: pos_word = 16'h3e65;
              3'h3: pos_word = 16'h40ae;
              3'h4: pos_word = 16'hbf29;
              3'h5: pos_word = 16'h3f2a;
              3'h6: pos_word = 16'hc0ac;
              3'h7: pos_word = 16'hbe62;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3fb4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd0;
              3'h2: pos_word = 16'h3e1a;
              3'h3: pos_word = 16'h4078;
              3'h4: pos_word = 16'hbf44;
              3'h5: pos_word = 16'h3f11;
              3'h6: pos_word = 16'hc10c;
              3'h7: pos_word = 16'hbe98;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hda: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f9b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3da1;
              3'h2: pos_word = 16'hbf63;
              3'h3: pos_word = 16'hc1b9;
              3'h4: pos_word = 16'h3f87;
              3'h5: pos_word = 16'h3c00;
              3'h6: pos_word = 16'hbf83;
              3'h7: pos_word = 16'h4211;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f6a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd81;
              3'h2: pos_word = 16'hbf96;
              3'h3: pos_word = 16'h4123;
              3'h4: pos_word = 16'h3f4b;
              3'h5: pos_word = 16'hbe09;
              3'h6: pos_word = 16'hbfae;
              3'h7: pos_word = 16'h40bc;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f2f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe54;
              3'h2: pos_word = 16'hbfcb;
              3'h3: pos_word = 16'h4083;
              3'h4: pos_word = 16'h3f15;
              3'h5: pos_word = 16'hbe90;
              3'h6: pos_word = 16'hbfee;
              3'h7: pos_word = 16'h4048;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3efc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeb8;
              3'h2: pos_word = 16'hc00e;
              3'h3: pos_word = 16'h4020;
              3'h4: pos_word = 16'h3ed1;
              3'h5: pos_word = 16'hbee2;
              3'h6: pos_word = 16'hc02e;
              3'h7: pos_word = 16'h4004;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ea8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf07;
              3'h2: pos_word = 16'hc05e;
              3'h3: pos_word = 16'h3fdf;
              3'h4: pos_word = 16'h3e80;
              3'h5: pos_word = 16'hbf20;
              3'h6: pos_word = 16'hc096;
              3'h7: pos_word = 16'h3fbe;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3e35;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3a;
              3'h2: pos_word = 16'hc0e3;
              3'h3: pos_word = 16'h3fa4;
              3'h4: pos_word = 16'h3dd7;
              3'h5: pos_word = 16'hbf57;
              3'h6: pos_word = 16'hc167;
              3'h7: pos_word = 16'h3f8e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3d0b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf78;
              3'h2: pos_word = 16'h443a;
              3'h3: pos_word = 16'h3f76;
              3'h4: pos_word = 16'hbd16;
              3'h5: pos_word = 16'hbf8f;
              3'h6: pos_word = 16'h415e;
              3'h7: pos_word = 16'h3f56;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbddd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa5;
              3'h2: pos_word = 16'h40df;
              3'h3: pos_word = 16'h3f39;
              3'h4: pos_word = 16'hbe38;
              3'h5: pos_word = 16'hbfbf;
              3'h6: pos_word = 16'h4094;
              3'h7: pos_word = 16'h3f1f;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe82;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe0;
              3'h2: pos_word = 16'h405b;
              3'h3: pos_word = 16'h3f07;
              3'h4: pos_word = 16'hbea9;
              3'h5: pos_word = 16'hc005;
              3'h6: pos_word = 16'h402d;
              3'h7: pos_word = 16'h3ee1;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbed2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc021;
              3'h2: pos_word = 16'h400d;
              3'h3: pos_word = 16'h3eb7;
              3'h4: pos_word = 16'hbefe;
              3'h5: pos_word = 16'hc04a;
              3'h6: pos_word = 16'h3fed;
              3'h7: pos_word = 16'h3e8f;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf16;
            case (mant_lo3)
              3'h1: pos_word = 16'hc085;
              3'h2: pos_word = 16'h3fc9;
              3'h3: pos_word = 16'h3e51;
              3'h4: pos_word = 16'hbf30;
              3'h5: pos_word = 16'hc0bf;
              3'h6: pos_word = 16'h3fad;
              3'h7: pos_word = 16'h3e07;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf4c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc127;
              3'h2: pos_word = 16'h3f96;
              3'h3: pos_word = 16'h3d77;
              3'h4: pos_word = 16'hbf6b;
              3'h5: pos_word = 16'hc221;
              3'h6: pos_word = 16'h3f82;
              3'h7: pos_word = 16'hbc2c;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf87;
            case (mant_lo3)
              3'h1: pos_word = 16'h41ae;
              3'h2: pos_word = 16'h3f61;
              3'h3: pos_word = 16'hbda7;
              3'h4: pos_word = 16'hbf9c;
              3'h5: pos_word = 16'h4109;
              3'h6: pos_word = 16'h3f43;
              3'h7: pos_word = 16'hbe1d;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfb5;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a9;
              3'h2: pos_word = 16'h3f28;
              3'h3: pos_word = 16'hbe68;
              3'h4: pos_word = 16'hbfd3;
              3'h5: pos_word = 16'h4073;
              3'h6: pos_word = 16'h3f0f;
              3'h7: pos_word = 16'hbe9a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbff9;
            case (mant_lo3)
              3'h1: pos_word = 16'h403c;
              3'h2: pos_word = 16'h3ef1;
              3'h3: pos_word = 16'hbec3;
              3'h4: pos_word = 16'hc016;
              3'h5: pos_word = 16'h4018;
              3'h6: pos_word = 16'h3ec6;
              3'h7: pos_word = 16'hbeed;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc039;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ffc;
              3'h2: pos_word = 16'h3e9d;
              3'h3: pos_word = 16'hbf0d;
              3'h4: pos_word = 16'hc06e;
              3'h5: pos_word = 16'h3fd5;
              3'h6: pos_word = 16'h3e6d;
              3'h7: pos_word = 16'hbf26;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hdb: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc0a4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e22;
              3'h2: pos_word = 16'hc103;
              3'h3: pos_word = 16'h3db1;
              3'h4: pos_word = 16'hc19d;
              3'h5: pos_word = 16'h3c80;
              3'h6: pos_word = 16'h424b;
              3'h7: pos_word = 16'hbd61;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h4131;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe01;
              3'h2: pos_word = 16'h40c5;
              3'h3: pos_word = 16'hbe4c;
              3'h4: pos_word = 16'h4088;
              3'h5: pos_word = 16'hbe8c;
              3'h6: pos_word = 16'h404d;
              3'h7: pos_word = 16'hbeb4;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4024;
            case (mant_lo3)
              3'h1: pos_word = 16'hbedd;
              3'h2: pos_word = 16'h4007;
              3'h3: pos_word = 16'hbf05;
              3'h4: pos_word = 16'h3fe3;
              3'h5: pos_word = 16'hbf1d;
              3'h6: pos_word = 16'h3fc1;
              3'h7: pos_word = 16'hbf37;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fa7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf54;
              3'h2: pos_word = 16'h3f90;
              3'h3: pos_word = 16'hbf74;
              3'h4: pos_word = 16'h3f7a;
              3'h5: pos_word = 16'hbf8c;
              3'h6: pos_word = 16'h3f59;
              3'h7: pos_word = 16'hbfa2;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f3c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbc;
              3'h2: pos_word = 16'h3f21;
              3'h3: pos_word = 16'hbfdc;
              3'h4: pos_word = 16'h3f09;
              3'h5: pos_word = 16'hc002;
              3'h6: pos_word = 16'h3ee5;
              3'h7: pos_word = 16'hc01e;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3ebb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc044;
              3'h2: pos_word = 16'h3e93;
              3'h3: pos_word = 16'hc080;
              3'h4: pos_word = 16'h3e59;
              3'h5: pos_word = 16'hc0b6;
              3'h6: pos_word = 16'h3e0f;
              3'h7: pos_word = 16'hc11a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3d8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1f5;
              3'h2: pos_word = 16'hbb30;
              3'h3: pos_word = 16'h41d2;
              3'h4: pos_word = 16'hbd96;
              3'h5: pos_word = 16'h4113;
              3'h6: pos_word = 16'hbe14;
              3'h7: pos_word = 16'h40b1;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe5f;
            case (mant_lo3)
              3'h1: pos_word = 16'h407b;
              3'h2: pos_word = 16'hbe96;
              3'h3: pos_word = 16'h4041;
              3'h4: pos_word = 16'hbebe;
              3'h5: pos_word = 16'h401b;
              3'h6: pos_word = 16'hbee9;
              3'h7: pos_word = 16'h4001;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf0b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd9;
              3'h2: pos_word = 16'hbf23;
              3'h3: pos_word = 16'h3fba;
              3'h4: pos_word = 16'hbf3e;
              3'h5: pos_word = 16'h3fa0;
              3'h6: pos_word = 16'hbf5c;
              3'h7: pos_word = 16'h3f8b;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf7d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f71;
              3'h2: pos_word = 16'hbf92;
              3'h3: pos_word = 16'h3f51;
              3'h4: pos_word = 16'hbfa8;
              3'h5: pos_word = 16'h3f35;
              3'h6: pos_word = 16'hbfc4;
              3'h7: pos_word = 16'h3f1b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfe6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f03;
              3'h2: pos_word = 16'hc009;
              3'h3: pos_word = 16'h3eda;
              3'h4: pos_word = 16'hc026;
              3'h5: pos_word = 16'h3eb1;
              3'h6: pos_word = 16'hc051;
              3'h7: pos_word = 16'h3e89;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc08b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e46;
              3'h2: pos_word = 16'hc0cc;
              3'h3: pos_word = 16'h3df7;
              3'h4: pos_word = 16'hc13c;
              3'h5: pos_word = 16'h3d4b;
              3'h6: pos_word = 16'hc28c;
              3'h7: pos_word = 16'hbcac;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h418e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdbc;
              3'h2: pos_word = 16'h40fb;
              3'h3: pos_word = 16'hbe28;
              3'h4: pos_word = 16'h40a0;
              3'h5: pos_word = 16'hbe73;
              3'h6: pos_word = 16'h4069;
              3'h7: pos_word = 16'hbea0;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4036;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec9;
              3'h2: pos_word = 16'h4013;
              3'h3: pos_word = 16'hbef4;
              3'h4: pos_word = 16'h3ff6;
              3'h5: pos_word = 16'hbf11;
              3'h6: pos_word = 16'h3fd0;
              3'h7: pos_word = 16'hbf2a;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fb3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf45;
              3'h2: pos_word = 16'h3f9a;
              3'h3: pos_word = 16'hbf64;
              3'h4: pos_word = 16'h3f86;
              3'h5: pos_word = 16'hbf83;
              3'h6: pos_word = 16'h3f69;
              3'h7: pos_word = 16'hbf97;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f4a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfaf;
              3'h2: pos_word = 16'h3f2e;
              3'h3: pos_word = 16'hbfcc;
              3'h4: pos_word = 16'h3f15;
              3'h5: pos_word = 16'hbff0;
              3'h6: pos_word = 16'h3efb;
              3'h7: pos_word = 16'hc00f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hdc: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3ecf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea6;
              3'h2: pos_word = 16'h3e7e;
              3'h3: pos_word = 16'h3e32;
              3'h4: pos_word = 16'h3dd1;
              3'h5: pos_word = 16'h3d00;
              3'h6: pos_word = 16'hbd21;
              3'h7: pos_word = 16'hbde2;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbe3b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe83;
              3'h2: pos_word = 16'hbeab;
              3'h3: pos_word = 16'hbed4;
              3'h4: pos_word = 16'hbf00;
              3'h5: pos_word = 16'hbf17;
              3'h6: pos_word = 16'hbf31;
              3'h7: pos_word = 16'hbf4d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf6c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf88;
              3'h2: pos_word = 16'hbf9d;
              3'h3: pos_word = 16'hbfb6;
              3'h4: pos_word = 16'hbfd4;
              3'h5: pos_word = 16'hbffb;
              3'h6: pos_word = 16'hc017;
              3'h7: pos_word = 16'hc03a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc070;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a7;
              3'h2: pos_word = 16'hc106;
              3'h3: pos_word = 16'hc1a6;
              3'h4: pos_word = 16'h4233;
              3'h5: pos_word = 16'h412c;
              3'h6: pos_word = 16'h40c2;
              3'h7: pos_word = 16'h4086;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h404b;
            case (mant_lo3)
              3'h1: pos_word = 16'h4022;
              3'h2: pos_word = 16'h4006;
              3'h3: pos_word = 16'h3fe1;
              3'h4: pos_word = 16'h3fc0;
              3'h5: pos_word = 16'h3fa6;
              3'h6: pos_word = 16'h3f8f;
              3'h7: pos_word = 16'h3f79;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f58;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3b;
              3'h2: pos_word = 16'h3f20;
              3'h3: pos_word = 16'h3f08;
              3'h4: pos_word = 16'h3ee4;
              3'h5: pos_word = 16'h3eba;
              3'h6: pos_word = 16'h3e92;
              3'h7: pos_word = 16'h3e57;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e0c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d86;
              3'h2: pos_word = 16'hbbb0;
              3'h3: pos_word = 16'hbd9c;
              3'h4: pos_word = 16'hbe17;
              3'h5: pos_word = 16'hbe62;
              3'h6: pos_word = 16'hbe98;
              3'h7: pos_word = 16'hbec0;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbeea;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0c;
              3'h2: pos_word = 16'hbf24;
              3'h3: pos_word = 16'hbf3f;
              3'h4: pos_word = 16'hbf5d;
              3'h5: pos_word = 16'hbf7e;
              3'h6: pos_word = 16'hbf93;
              3'h7: pos_word = 16'hbfa9;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbfc5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe7;
              3'h2: pos_word = 16'hc00a;
              3'h3: pos_word = 16'hc028;
              3'h4: pos_word = 16'hc053;
              3'h5: pos_word = 16'hc08d;
              3'h6: pos_word = 16'hc0d0;
              3'h7: pos_word = 16'hc142;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc2ac;
            case (mant_lo3)
              3'h1: pos_word = 16'h4187;
              3'h2: pos_word = 16'h40f5;
              3'h3: pos_word = 16'h409e;
              3'h4: pos_word = 16'h4066;
              3'h5: pos_word = 16'h4034;
              3'h6: pos_word = 16'h4012;
              3'h7: pos_word = 16'h3ff4;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3fcf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb2;
              3'h2: pos_word = 16'h3f9a;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'h3f67;
              3'h5: pos_word = 16'h3f48;
              3'h6: pos_word = 16'h3f2d;
              3'h7: pos_word = 16'h3f14;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ef9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ece;
              3'h2: pos_word = 16'h3ea5;
              3'h3: pos_word = 16'h3e7b;
              3'h4: pos_word = 16'h3e30;
              3'h5: pos_word = 16'h3dcc;
              3'h6: pos_word = 16'h3cea;
              3'h7: pos_word = 16'hbd2c;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbde8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe3e;
              3'h2: pos_word = 16'hbe85;
              3'h3: pos_word = 16'hbeac;
              3'h4: pos_word = 16'hbed6;
              3'h5: pos_word = 16'hbf01;
              3'h6: pos_word = 16'hbf18;
              3'h7: pos_word = 16'hbf32;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf4e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6e;
              3'h2: pos_word = 16'hbf89;
              3'h3: pos_word = 16'hbf9e;
              3'h4: pos_word = 16'hbfb7;
              3'h5: pos_word = 16'hbfd6;
              3'h6: pos_word = 16'hbffc;
              3'h7: pos_word = 16'hc018;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc03c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc073;
              3'h2: pos_word = 16'hc0a9;
              3'h3: pos_word = 16'hc109;
              3'h4: pos_word = 16'hc1af;
              3'h5: pos_word = 16'h4220;
              3'h6: pos_word = 16'h4127;
              3'h7: pos_word = 16'h40bf;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4085;
            case (mant_lo3)
              3'h1: pos_word = 16'h4049;
              3'h2: pos_word = 16'h4021;
              3'h3: pos_word = 16'h4005;
              3'h4: pos_word = 16'h3fe0;
              3'h5: pos_word = 16'h3fbf;
              3'h6: pos_word = 16'h3fa5;
              3'h7: pos_word = 16'h3f8f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hdd: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f78;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'h3f07;
              3'h3: pos_word = 16'h3eb8;
              3'h4: pos_word = 16'h3e54;
              3'h5: pos_word = 16'h3d80;
              3'h6: pos_word = 16'hbda1;
              3'h7: pos_word = 16'hbe65;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbec1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0d;
              3'h2: pos_word = 16'hbf40;
              3'h3: pos_word = 16'hbf80;
              3'h4: pos_word = 16'hbfaa;
              3'h5: pos_word = 16'hbfe8;
              3'h6: pos_word = 16'hc029;
              3'h7: pos_word = 16'hc08f;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc149;
            case (mant_lo3)
              3'h1: pos_word = 16'h4181;
              3'h2: pos_word = 16'h409b;
              3'h3: pos_word = 16'h4033;
              3'h4: pos_word = 16'h3ff3;
              3'h5: pos_word = 16'h3fb1;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'h3f47;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f13;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ecc;
              3'h2: pos_word = 16'h3e78;
              3'h3: pos_word = 16'h3dc6;
              3'h4: pos_word = 16'hbd37;
              3'h5: pos_word = 16'hbe41;
              3'h6: pos_word = 16'hbeae;
              3'h7: pos_word = 16'hbf02;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf33;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6f;
              3'h2: pos_word = 16'hbf9f;
              3'h3: pos_word = 16'hbfd7;
              3'h4: pos_word = 16'hc019;
              3'h5: pos_word = 16'hc076;
              3'h6: pos_word = 16'hc10c;
              3'h7: pos_word = 16'h4210;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h40bc;
            case (mant_lo3)
              3'h1: pos_word = 16'h4048;
              3'h2: pos_word = 16'h4004;
              3'h3: pos_word = 16'h3fbe;
              3'h4: pos_word = 16'h3f8e;
              3'h5: pos_word = 16'h3f56;
              3'h6: pos_word = 16'h3f1e;
              3'h7: pos_word = 16'h3ee0;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e8f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e06;
              3'h2: pos_word = 16'hbc30;
              3'h3: pos_word = 16'hbe1d;
              3'h4: pos_word = 16'hbe9b;
              3'h5: pos_word = 16'hbeee;
              3'h6: pos_word = 16'hbf26;
              3'h7: pos_word = 16'hbf5f;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf94;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc7;
              3'h2: pos_word = 16'hc00c;
              3'h3: pos_word = 16'hc057;
              3'h4: pos_word = 16'hc0d7;
              3'h5: pos_word = 16'hc320;
              3'h6: pos_word = 16'h40ec;
              3'h7: pos_word = 16'h4062;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4010;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcd;
              3'h2: pos_word = 16'h3f98;
              3'h3: pos_word = 16'h3f65;
              3'h4: pos_word = 16'h3f2b;
              3'h5: pos_word = 16'h3ef5;
              3'h6: pos_word = 16'h3ea2;
              3'h7: pos_word = 16'h3e2a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3cbe;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdf3;
              3'h2: pos_word = 16'hbe88;
              3'h3: pos_word = 16'hbed9;
              3'h4: pos_word = 16'hbf1a;
              3'h5: pos_word = 16'hbf50;
              3'h6: pos_word = 16'hbf8a;
              3'h7: pos_word = 16'hbfb9;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc000;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03f;
              3'h2: pos_word = 16'hc0ae;
              3'h3: pos_word = 16'hc1c7;
              3'h4: pos_word = 16'h411e;
              3'h5: pos_word = 16'h4081;
              3'h6: pos_word = 16'h401f;
              3'h7: pos_word = 16'h3fdd;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fa3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f75;
              3'h2: pos_word = 16'h3f38;
              3'h3: pos_word = 16'h3f06;
              3'h4: pos_word = 16'h3eb5;
              3'h5: pos_word = 16'h3e4e;
              3'h6: pos_word = 16'h3d6a;
              3'h7: pos_word = 16'hbdad;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbe6b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec5;
              3'h2: pos_word = 16'hbf0e;
              3'h3: pos_word = 16'hbf42;
              3'h4: pos_word = 16'hbf81;
              3'h5: pos_word = 16'hbfac;
              3'h6: pos_word = 16'hbfeb;
              3'h7: pos_word = 16'hc02c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc092;
            case (mant_lo3)
              3'h1: pos_word = 16'hc157;
              3'h2: pos_word = 16'h416e;
              3'h3: pos_word = 16'h4097;
              3'h4: pos_word = 16'h4030;
              3'h5: pos_word = 16'h3fef;
              3'h6: pos_word = 16'h3faf;
              3'h7: pos_word = 16'h3f83;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f45;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f11;
              3'h2: pos_word = 16'h3ec9;
              3'h3: pos_word = 16'h3e72;
              3'h4: pos_word = 16'h3dbb;
              3'h5: pos_word = 16'hbd4d;
              3'h6: pos_word = 16'hbe46;
              3'h7: pos_word = 16'hbeb1;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf03;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf35;
              3'h2: pos_word = 16'hbf72;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'hbfda;
              3'h5: pos_word = 16'hc01b;
              3'h6: pos_word = 16'hc07b;
              3'h7: pos_word = 16'hc113;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hde: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h41f2;
            case (mant_lo3)
              3'h1: pos_word = 16'h4044;
              3'h2: pos_word = 16'h3fbc;
              3'h3: pos_word = 16'h3f53;
              3'h4: pos_word = 16'h3edd;
              3'h5: pos_word = 16'h3e01;
              3'h6: pos_word = 16'hbe23;
              3'h7: pos_word = 16'hbef1;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf62;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfca;
              3'h2: pos_word = 16'hc05c;
              3'h3: pos_word = 16'hc492;
              3'h4: pos_word = 16'h405d;
              3'h5: pos_word = 16'h3fca;
              3'h6: pos_word = 16'h3f62;
              3'h7: pos_word = 16'h3ef2;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3e24;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdfe;
              3'h2: pos_word = 16'hbedc;
              3'h3: pos_word = 16'hbf53;
              3'h4: pos_word = 16'hbfbb;
              3'h5: pos_word = 16'hc043;
              3'h6: pos_word = 16'hc1e6;
              3'h7: pos_word = 16'h407d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fda;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f72;
              3'h2: pos_word = 16'h3f04;
              3'h3: pos_word = 16'h3e48;
              3'h4: pos_word = 16'hbdb8;
              3'h5: pos_word = 16'hbec8;
              3'h6: pos_word = 16'hbf44;
              3'h7: pos_word = 16'hbfae;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc02f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc168;
              3'h2: pos_word = 16'h4093;
              3'h3: pos_word = 16'h3fec;
              3'h4: pos_word = 16'h3f82;
              3'h5: pos_word = 16'h3f0f;
              3'h6: pos_word = 16'h3e6d;
              3'h7: pos_word = 16'hbd63;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbeb4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf37;
              3'h2: pos_word = 16'hbfa2;
              3'h3: pos_word = 16'hc01e;
              3'h4: pos_word = 16'hc11b;
              3'h5: pos_word = 16'h40b0;
              3'h6: pos_word = 16'h4000;
              3'h7: pos_word = 16'h3f8b;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f1b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e89;
              3'h2: pos_word = 16'hbcb0;
              3'h3: pos_word = 16'hbea1;
              3'h4: pos_word = 16'hbf2a;
              3'h5: pos_word = 16'hbf97;
              3'h6: pos_word = 16'hc010;
              3'h7: pos_word = 16'hc0e9;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h40da;
            case (mant_lo3)
              3'h1: pos_word = 16'h400c;
              3'h2: pos_word = 16'h3f95;
              3'h3: pos_word = 16'h3f27;
              3'h4: pos_word = 16'h3e9c;
              3'h5: pos_word = 16'h3c4c;
              3'h6: pos_word = 16'hbe8e;
              3'h7: pos_word = 16'hbf1e;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf8d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc003;
              3'h2: pos_word = 16'hc0ba;
              3'h3: pos_word = 16'h410f;
              3'h4: pos_word = 16'h401a;
              3'h5: pos_word = 16'h3f9f;
              3'h6: pos_word = 16'h3f33;
              3'h7: pos_word = 16'h3eaf;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3d3e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe76;
              3'h2: pos_word = 16'hbf12;
              3'h3: pos_word = 16'hbf84;
              3'h4: pos_word = 16'hbff2;
              3'h5: pos_word = 16'hc09a;
              3'h6: pos_word = 16'h414d;
              3'h7: pos_word = 16'h402a;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3fab;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f41;
              3'h2: pos_word = 16'h3ec2;
              3'h3: pos_word = 16'h3da5;
              3'h4: pos_word = 16'hbe52;
              3'h5: pos_word = 16'hbf07;
              3'h6: pos_word = 16'hbf77;
              3'h7: pos_word = 16'hbfdf;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc084;
            case (mant_lo3)
              3'h1: pos_word = 16'h41b6;
              3'h2: pos_word = 16'h403d;
              3'h3: pos_word = 16'h3fb8;
              3'h4: pos_word = 16'h3f4f;
              3'h5: pos_word = 16'h3ed7;
              3'h6: pos_word = 16'h3deb;
              3'h7: pos_word = 16'hbe2e;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbef8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf67;
              3'h2: pos_word = 16'hbfce;
              3'h3: pos_word = 16'hc065;
              3'h4: pos_word = 16'h42ca;
              3'h5: pos_word = 16'h4055;
              3'h6: pos_word = 16'h3fc6;
              3'h7: pos_word = 16'h3f5e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3eeb;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e19;
              3'h2: pos_word = 16'hbe0a;
              3'h3: pos_word = 16'hbee3;
              3'h4: pos_word = 16'hbf57;
              3'h5: pos_word = 16'hbfc0;
              3'h6: pos_word = 16'hc04a;
              3'h7: pos_word = 16'hc226;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4072;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd5;
              3'h2: pos_word = 16'h3f6d;
              3'h3: pos_word = 16'h3f00;
              3'h4: pos_word = 16'h3e3d;
              3'h5: pos_word = 16'hbdce;
              3'h6: pos_word = 16'hbece;
              3'h7: pos_word = 16'hbf49;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfb2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc035;
              3'h2: pos_word = 16'hc18a;
              3'h3: pos_word = 16'h408c;
              3'h4: pos_word = 16'h3fe6;
              3'h5: pos_word = 16'h3f7e;
              3'h6: pos_word = 16'h3f0b;
              3'h7: pos_word = 16'h3e61;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hdf: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbd88;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3b;
              3'h2: pos_word = 16'hc023;
              3'h3: pos_word = 16'h40a6;
              3'h4: pos_word = 16'h3f88;
              3'h5: pos_word = 16'h3e83;
              3'h6: pos_word = 16'hbea7;
              3'h7: pos_word = 16'hbf9b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc0fd;
            case (mant_lo3)
              3'h1: pos_word = 16'h4008;
              3'h2: pos_word = 16'h3f23;
              3'h3: pos_word = 16'h3ae0;
              3'h4: pos_word = 16'hbf22;
              3'h5: pos_word = 16'hc007;
              3'h6: pos_word = 16'h4102;
              3'h7: pos_word = 16'h3f9c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ea9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe81;
              3'h2: pos_word = 16'hbf87;
              3'h3: pos_word = 16'hc0a3;
              3'h4: pos_word = 16'h4024;
              3'h5: pos_word = 16'h3f3c;
              3'h6: pos_word = 16'h3d8f;
              3'h7: pos_word = 16'hbf0a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfe5;
            case (mant_lo3)
              3'h1: pos_word = 16'h4192;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'h3ed0;
              3'h4: pos_word = 16'hbe39;
              3'h5: pos_word = 16'hbf6c;
              3'h6: pos_word = 16'hc06f;
              3'h7: pos_word = 16'h404d;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f59;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0e;
              3'h2: pos_word = 16'hbee9;
              3'h3: pos_word = 16'hbfc4;
              3'h4: pos_word = 16'hc296;
              3'h5: pos_word = 16'h3fd0;
              3'h6: pos_word = 16'h3efa;
              3'h7: pos_word = 16'hbde4;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf4d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc03b;
              3'h2: pos_word = 16'h4086;
              3'h3: pos_word = 16'h3f79;
              3'h4: pos_word = 16'h3e55;
              3'h5: pos_word = 16'hbec0;
              3'h6: pos_word = 16'hbfaa;
              3'h7: pos_word = 16'hc144;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3ff4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f13;
              3'h2: pos_word = 16'hbd30;
              3'h3: pos_word = 16'hbf32;
              3'h4: pos_word = 16'hc018;
              3'h5: pos_word = 16'h40be;
              3'h6: pos_word = 16'h3f8e;
              3'h7: pos_word = 16'h3e90;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe9a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf94;
              3'h2: pos_word = 16'hc0d5;
              3'h3: pos_word = 16'h4011;
              3'h4: pos_word = 16'h3f2b;
              3'h5: pos_word = 16'h3ccc;
              3'h6: pos_word = 16'hbf19;
              3'h7: pos_word = 16'hbfff;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4121;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa3;
              3'h2: pos_word = 16'h3eb6;
              3'h3: pos_word = 16'hbe69;
              3'h4: pos_word = 16'hbf81;
              3'h5: pos_word = 16'hc091;
              3'h6: pos_word = 16'h4030;
              3'h7: pos_word = 16'h3f46;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3dbf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf03;
              3'h2: pos_word = 16'hbfd9;
              3'h3: pos_word = 16'h41ff;
              3'h4: pos_word = 16'h3fbd;
              3'h5: pos_word = 16'h3ede;
              3'h6: pos_word = 16'hbe21;
              3'h7: pos_word = 16'hbf61;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc05a;
            case (mant_lo3)
              3'h1: pos_word = 16'h405f;
              3'h2: pos_word = 16'h3f63;
              3'h3: pos_word = 16'h3e26;
              3'h4: pos_word = 16'hbedb;
              3'h5: pos_word = 16'hbfba;
              3'h6: pos_word = 16'hc1db;
              3'h7: pos_word = 16'h3fdb;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f04;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb4;
              3'h2: pos_word = 16'hbf44;
              3'h3: pos_word = 16'hc02e;
              3'h4: pos_word = 16'h4095;
              3'h5: pos_word = 16'h3f82;
              3'h6: pos_word = 16'h3e6e;
              3'h7: pos_word = 16'hbeb3;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbfa2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc119;
              3'h2: pos_word = 16'h4001;
              3'h3: pos_word = 16'h3f1b;
              3'h4: pos_word = 16'hbca2;
              3'h5: pos_word = 16'hbf29;
              3'h6: pos_word = 16'hc00f;
              3'h7: pos_word = 16'h40dd;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e9d;
              3'h2: pos_word = 16'hbe8d;
              3'h3: pos_word = 16'hbf8d;
              3'h4: pos_word = 16'hc0b8;
              3'h5: pos_word = 16'h401b;
              3'h6: pos_word = 16'h3f34;
              3'h7: pos_word = 16'h3d45;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf12;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff1;
              3'h2: pos_word = 16'h4152;
              3'h3: pos_word = 16'h3fac;
              3'h4: pos_word = 16'h3ec3;
              3'h5: pos_word = 16'hbe50;
              3'h6: pos_word = 16'hbf76;
              3'h7: pos_word = 16'hc083;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h403e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4f;
              3'h2: pos_word = 16'h3def;
              3'h3: pos_word = 16'hbef7;
              3'h4: pos_word = 16'hbfce;
              3'h5: pos_word = 16'h42f4;
              3'h6: pos_word = 16'h3fc6;
              3'h7: pos_word = 16'h3eec;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he0: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe08;
            case (mant_lo3)
              3'h1: pos_word = 16'hc049;
              3'h2: pos_word = 16'h3f6e;
              3'h3: pos_word = 16'hbecd;
              3'h4: pos_word = 16'hc186;
              3'h5: pos_word = 16'h3f0c;
              3'h6: pos_word = 16'hbf3a;
              3'h7: pos_word = 16'h40a7;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e84;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9a;
              3'h2: pos_word = 16'h4009;
              3'h3: pos_word = 16'h3b60;
              3'h4: pos_word = 16'hc006;
              3'h5: pos_word = 16'h3f9c;
              3'h6: pos_word = 16'hbe80;
              3'h7: pos_word = 16'hc0a1;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f3d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0a;
              3'h2: pos_word = 16'h4197;
              3'h3: pos_word = 16'h3ed1;
              3'h4: pos_word = 16'hbf6b;
              3'h5: pos_word = 16'h404e;
              3'h6: pos_word = 16'h3e10;
              3'h7: pos_word = 16'hbfc3;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fd1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbde1;
              3'h2: pos_word = 16'hc03a;
              3'h3: pos_word = 16'h3f79;
              3'h4: pos_word = 16'hbebf;
              3'h5: pos_word = 16'hc140;
              3'h6: pos_word = 16'h3f14;
              3'h7: pos_word = 16'hbf32;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h40c0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e91;
              3'h2: pos_word = 16'hbf93;
              3'h3: pos_word = 16'h4012;
              3'h4: pos_word = 16'h3cda;
              3'h5: pos_word = 16'hbffe;
              3'h6: pos_word = 16'h3fa4;
              3'h7: pos_word = 16'hbe67;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc090;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f47;
              3'h2: pos_word = 16'hbf02;
              3'h3: pos_word = 16'h4207;
              3'h4: pos_word = 16'h3edf;
              3'h5: pos_word = 16'hbf60;
              3'h6: pos_word = 16'h4060;
              3'h7: pos_word = 16'h3e28;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfba;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fdc;
              3'h2: pos_word = 16'hbdb1;
              3'h3: pos_word = 16'hc02d;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'hbeb2;
              3'h6: pos_word = 16'hc116;
              3'h7: pos_word = 16'h3f1c;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf29;
            case (mant_lo3)
              3'h1: pos_word = 16'h40df;
              3'h2: pos_word = 16'h3e9d;
              3'h3: pos_word = 16'hbf8c;
              3'h4: pos_word = 16'h401b;
              3'h5: pos_word = 16'h3d4c;
              3'h6: pos_word = 16'hbff0;
              3'h7: pos_word = 16'h3fac;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe4e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc082;
              3'h2: pos_word = 16'h3f50;
              3'h3: pos_word = 16'hbef6;
              3'h4: pos_word = 16'h431a;
              3'h5: pos_word = 16'h3eed;
              3'h6: pos_word = 16'hbf56;
              3'h7: pos_word = 16'h4076;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3e40;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb1;
              3'h2: pos_word = 16'h3fe8;
              3'h3: pos_word = 16'hbd81;
              3'h4: pos_word = 16'hc021;
              3'h5: pos_word = 16'h3f89;
              3'h6: pos_word = 16'hbea5;
              3'h7: pos_word = 16'hc0f6;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f24;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf20;
              3'h2: pos_word = 16'h4106;
              3'h3: pos_word = 16'h3eab;
              3'h4: pos_word = 16'hbf86;
              3'h5: pos_word = 16'h4026;
              3'h6: pos_word = 16'h3d96;
              3'h7: pos_word = 16'hbfe3;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fb5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe36;
              3'h2: pos_word = 16'hc06c;
              3'h3: pos_word = 16'h3f5a;
              3'h4: pos_word = 16'hbee7;
              3'h5: pos_word = 16'hc26f;
              3'h6: pos_word = 16'h3efc;
              3'h7: pos_word = 16'hbf4c;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h4088;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e59;
              3'h2: pos_word = 16'hbfa8;
              3'h3: pos_word = 16'h3ff6;
              3'h4: pos_word = 16'hbd22;
              3'h5: pos_word = 16'hc017;
              3'h6: pos_word = 16'h3f8f;
              3'h7: pos_word = 16'hbe98;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc0d0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2d;
              3'h2: pos_word = 16'hbf18;
              3'h3: pos_word = 16'h4126;
              3'h4: pos_word = 16'h3eb8;
              3'h5: pos_word = 16'hbf80;
              3'h6: pos_word = 16'h4032;
              3'h7: pos_word = 16'h3dc6;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfd7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fbe;
              3'h2: pos_word = 16'hbe1d;
              3'h3: pos_word = 16'hc058;
              3'h4: pos_word = 16'h3f65;
              3'h5: pos_word = 16'hbed9;
              3'h6: pos_word = 16'hc1c8;
              3'h7: pos_word = 16'h3f06;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf42;
            case (mant_lo3)
              3'h1: pos_word = 16'h4097;
              3'h2: pos_word = 16'h3e72;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'h4002;
              3'h5: pos_word = 16'hbc86;
              3'h6: pos_word = 16'hc00e;
              3'h7: pos_word = 16'h3f96;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he1: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe8b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f35;
              3'h2: pos_word = 16'h415c;
              3'h3: pos_word = 16'hbf74;
              3'h4: pos_word = 16'h3df6;
              3'h5: pos_word = 16'h3fc8;
              3'h6: pos_word = 16'hc047;
              3'h7: pos_word = 16'hbecb;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f0d;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ab;
              3'h2: pos_word = 16'hbf99;
              3'h3: pos_word = 16'h3be0;
              3'h4: pos_word = 16'h3f9d;
              3'h5: pos_word = 16'hc09f;
              3'h6: pos_word = 16'hbf09;
              3'h7: pos_word = 16'h3ed3;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4050;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc2;
              3'h2: pos_word = 16'hbdda;
              3'h3: pos_word = 16'h3f7b;
              3'h4: pos_word = 16'hc139;
              3'h5: pos_word = 16'hbf30;
              3'h6: pos_word = 16'h3e92;
              3'h7: pos_word = 16'h4013;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbffb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe63;
              3'h2: pos_word = 16'h3f48;
              3'h3: pos_word = 16'h4218;
              3'h4: pos_word = 16'hbf5f;
              3'h5: pos_word = 16'h3e2c;
              3'h6: pos_word = 16'h3fde;
              3'h7: pos_word = 16'hc02b;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbeb0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1d;
              3'h2: pos_word = 16'h40e5;
              3'h3: pos_word = 16'hbf8b;
              3'h4: pos_word = 16'h3d5a;
              3'h5: pos_word = 16'h3fad;
              3'h6: pos_word = 16'hc07f;
              3'h7: pos_word = 16'hbef3;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3ef0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4079;
              3'h2: pos_word = 16'hbfb0;
              3'h3: pos_word = 16'hbd74;
              3'h4: pos_word = 16'h3f8a;
              3'h5: pos_word = 16'hc0ef;
              3'h6: pos_word = 16'hbf1f;
              3'h7: pos_word = 16'h3ead;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4028;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe1;
              3'h2: pos_word = 16'hbe32;
              3'h3: pos_word = 16'h3f5c;
              3'h4: pos_word = 16'hc246;
              3'h5: pos_word = 16'hbf4a;
              3'h6: pos_word = 16'h3e5d;
              3'h7: pos_word = 16'h3ff8;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc015;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe96;
              3'h2: pos_word = 16'h3f2e;
              3'h3: pos_word = 16'h412c;
              3'h4: pos_word = 16'hbf7e;
              3'h5: pos_word = 16'h3dcd;
              3'h6: pos_word = 16'h3fbf;
              3'h7: pos_word = 16'hc055;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbed7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f07;
              3'h2: pos_word = 16'h409a;
              3'h3: pos_word = 16'hbf9f;
              3'h4: pos_word = 16'hbc54;
              3'h5: pos_word = 16'h3f97;
              3'h6: pos_word = 16'hc0b1;
              3'h7: pos_word = 16'hbf0f;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3ec7;
            case (mant_lo3)
              3'h1: pos_word = 16'h4043;
              3'h2: pos_word = 16'hbfcb;
              3'h3: pos_word = 16'hbe01;
              3'h4: pos_word = 16'h3f71;
              3'h5: pos_word = 16'hc170;
              3'h6: pos_word = 16'hbf38;
              3'h7: pos_word = 16'h3e88;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h400b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc004;
              3'h2: pos_word = 16'hbe79;
              3'h3: pos_word = 16'h3f40;
              3'h4: pos_word = 16'h41ae;
              3'h5: pos_word = 16'hbf68;
              3'h6: pos_word = 16'h3e17;
              3'h7: pos_word = 16'h3fd4;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc036;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebb;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h40c8;
              3'h4: pos_word = 16'hbf91;
              3'h5: pos_word = 16'h3d09;
              3'h6: pos_word = 16'h3fa6;
              3'h7: pos_word = 16'hc08b;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf00;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee3;
              3'h2: pos_word = 16'h4066;
              3'h3: pos_word = 16'hbfb7;
              3'h4: pos_word = 16'hbda2;
              3'h5: pos_word = 16'h3f84;
              3'h6: pos_word = 16'hc10d;
              3'h7: pos_word = 16'hbf26;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ea1;
            case (mant_lo3)
              3'h1: pos_word = 16'h401e;
              3'h2: pos_word = 16'hbfec;
              3'h3: pos_word = 16'hbe47;
              3'h4: pos_word = 16'h3f53;
              3'h5: pos_word = 16'hc528;
              3'h6: pos_word = 16'hbf53;
              3'h7: pos_word = 16'h3e48;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fec;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01e;
              3'h2: pos_word = 16'hbea1;
              3'h3: pos_word = 16'h3f27;
              3'h4: pos_word = 16'h410e;
              3'h5: pos_word = 16'hbf84;
              3'h6: pos_word = 16'h3da4;
              3'h7: pos_word = 16'h3fb7;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc065;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee3;
              3'h2: pos_word = 16'h3f00;
              3'h3: pos_word = 16'h408c;
              3'h4: pos_word = 16'hbfa6;
              3'h5: pos_word = 16'hbd06;
              3'h6: pos_word = 16'h3f91;
              3'h7: pos_word = 16'hc0c7;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he2: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf16;
            case (mant_lo3)
              3'h1: pos_word = 16'h4036;
              3'h2: pos_word = 16'hbe16;
              3'h3: pos_word = 16'hc1ab;
              3'h4: pos_word = 16'h3e7a;
              3'h5: pos_word = 16'hc00b;
              3'h6: pos_word = 16'h3f38;
              3'h7: pos_word = 16'hbf71;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fcb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec7;
              3'h2: pos_word = 16'h40b1;
              3'h3: pos_word = 16'h3c60;
              3'h4: pos_word = 16'hc099;
              3'h5: pos_word = 16'h3ed7;
              3'h6: pos_word = 16'hbfbf;
              3'h7: pos_word = 16'h3f7f;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf2e;
            case (mant_lo3)
              3'h1: pos_word = 16'h4016;
              3'h2: pos_word = 16'hbe5c;
              3'h3: pos_word = 16'h424e;
              3'h4: pos_word = 16'h3e33;
              3'h5: pos_word = 16'hc027;
              3'h6: pos_word = 16'h3f20;
              3'h7: pos_word = 16'hbf8a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fb0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeef;
              3'h2: pos_word = 16'h4080;
              3'h3: pos_word = 16'hbd57;
              3'h4: pos_word = 16'hc0e4;
              3'h5: pos_word = 16'h3eb0;
              3'h6: pos_word = 16'hbfdd;
              3'h7: pos_word = 16'h3f5f;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf48;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ffc;
              3'h2: pos_word = 16'hbe92;
              3'h3: pos_word = 16'h413a;
              3'h4: pos_word = 16'h3ddb;
              3'h5: pos_word = 16'hc050;
              3'h6: pos_word = 16'h3f09;
              3'h7: pos_word = 16'hbf9d;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f99;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0d;
              3'h2: pos_word = 16'h4047;
              3'h3: pos_word = 16'hbdf4;
              3'h4: pos_word = 16'hc159;
              3'h5: pos_word = 16'h3e8b;
              3'h6: pos_word = 16'hc002;
              3'h7: pos_word = 16'h3f43;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf64;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd7;
              3'h2: pos_word = 16'hbeb7;
              3'h3: pos_word = 16'h40d1;
              3'h4: pos_word = 16'h3d25;
              3'h5: pos_word = 16'hc087;
              3'h6: pos_word = 16'h3ee8;
              3'h7: pos_word = 16'hbfb4;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f86;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf24;
              3'h2: pos_word = 16'h4022;
              3'h3: pos_word = 16'hbe40;
              3'h4: pos_word = 16'hc30b;
              3'h5: pos_word = 16'h3e4f;
              3'h6: pos_word = 16'hc01b;
              3'h7: pos_word = 16'h3f29;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf82;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fba;
              3'h2: pos_word = 16'hbedf;
              3'h3: pos_word = 16'h4090;
              3'h4: pos_word = 16'hbcd4;
              3'h5: pos_word = 16'hc0bf;
              3'h6: pos_word = 16'h3ec0;
              3'h7: pos_word = 16'hbfd0;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f6b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3d;
              3'h2: pos_word = 16'h4007;
              3'h3: pos_word = 16'hbe83;
              3'h4: pos_word = 16'h4187;
              3'h5: pos_word = 16'h3e09;
              3'h6: pos_word = 16'hc03e;
              3'h7: pos_word = 16'h3f12;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa2;
              3'h2: pos_word = 16'hbf04;
              3'h3: pos_word = 16'h405b;
              3'h4: pos_word = 16'hbdbd;
              3'h5: pos_word = 16'hc11f;
              3'h6: pos_word = 16'h3e9a;
              3'h7: pos_word = 16'hbff3;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f4e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf58;
              3'h2: pos_word = 16'h3fe5;
              3'h3: pos_word = 16'hbea8;
              3'h4: pos_word = 16'h40fe;
              3'h5: pos_word = 16'h3d89;
              3'h6: pos_word = 16'hc071;
              3'h7: pos_word = 16'h3ef8;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbfab;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8e;
              3'h2: pos_word = 16'hbf1a;
              3'h3: pos_word = 16'h402f;
              3'h4: pos_word = 16'hbe24;
              3'h5: pos_word = 16'hc1ec;
              3'h6: pos_word = 16'h3e6c;
              3'h7: pos_word = 16'hc010;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f33;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf77;
              3'h2: pos_word = 16'h3fc5;
              3'h3: pos_word = 16'hbecf;
              3'h4: pos_word = 16'h40a5;
              3'h5: pos_word = 16'h3a43;
              3'h6: pos_word = 16'hc0a4;
              3'h7: pos_word = 16'h3ed0;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbfc4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f78;
              3'h2: pos_word = 16'hbf33;
              3'h3: pos_word = 16'h4011;
              3'h4: pos_word = 16'hbe6a;
              3'h5: pos_word = 16'h41f7;
              3'h6: pos_word = 16'h3e25;
              3'h7: pos_word = 16'hc02e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f1b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8d;
              3'h2: pos_word = 16'h3fab;
              3'h3: pos_word = 16'hbef7;
              3'h4: pos_word = 16'h4073;
              3'h5: pos_word = 16'hbd86;
              3'h6: pos_word = 16'hc0fb;
              3'h7: pos_word = 16'h3ea9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he3: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbfe4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4d;
              3'h2: pos_word = 16'hbe99;
              3'h3: pos_word = 16'h3dc0;
              3'h4: pos_word = 16'h3f05;
              3'h5: pos_word = 16'h3f95;
              3'h6: pos_word = 16'h403f;
              3'h7: pos_word = 16'hc184;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc006;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6a;
              3'h2: pos_word = 16'hbebf;
              3'h3: pos_word = 16'h3ce0;
              3'h4: pos_word = 16'h3ee0;
              3'h5: pos_word = 16'h3f83;
              3'h6: pos_word = 16'h401c;
              3'h7: pos_word = 16'h432f;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc021;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'hbee7;
              3'h3: pos_word = 16'hbd1f;
              3'h4: pos_word = 16'h3eb8;
              3'h5: pos_word = 16'h3f65;
              3'h6: pos_word = 16'h4002;
              3'h7: pos_word = 16'h415e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc046;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf99;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'hbdd8;
              3'h4: pos_word = 16'h3e93;
              3'h5: pos_word = 16'h3f48;
              3'h6: pos_word = 16'h3fde;
              3'h7: pos_word = 16'h40e6;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc07f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfaf;
              3'h2: pos_word = 16'hbf1f;
              3'h3: pos_word = 16'hbe31;
              3'h4: pos_word = 16'h3e5e;
              3'h5: pos_word = 16'h3f2e;
              3'h6: pos_word = 16'h3fc0;
              3'h7: pos_word = 16'h409a;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0b0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfca;
              3'h2: pos_word = 16'hbf38;
              3'h3: pos_word = 16'hbe78;
              3'h4: pos_word = 16'h3e18;
              3'h5: pos_word = 16'h3f16;
              3'h6: pos_word = 16'h3fa7;
              3'h7: pos_word = 16'h4067;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc10c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfeb;
              3'h2: pos_word = 16'hbf53;
              3'h3: pos_word = 16'hbea0;
              3'h4: pos_word = 16'h3da6;
              3'h5: pos_word = 16'h3f00;
              3'h6: pos_word = 16'h3f92;
              3'h7: pos_word = 16'h4037;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc1a8;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00b;
              3'h2: pos_word = 16'hbf71;
              3'h3: pos_word = 16'hbec7;
              3'h4: pos_word = 16'h3c6d;
              3'h5: pos_word = 16'h3ed8;
              3'h6: pos_word = 16'h3f7f;
              3'h7: pos_word = 16'h4016;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4256;
            case (mant_lo3)
              3'h1: pos_word = 16'hc027;
              3'h2: pos_word = 16'hbf89;
              3'h3: pos_word = 16'hbeef;
              3'h4: pos_word = 16'hbd54;
              3'h5: pos_word = 16'h3eb1;
              3'h6: pos_word = 16'h3f5f;
              3'h7: pos_word = 16'h3ffc;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h413c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc04f;
              3'h2: pos_word = 16'hbf9d;
              3'h3: pos_word = 16'hbf0d;
              3'h4: pos_word = 16'hbdf3;
              3'h5: pos_word = 16'h3e8c;
              3'h6: pos_word = 16'h3f43;
              3'h7: pos_word = 16'h3fd8;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h40d2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc087;
              3'h2: pos_word = 16'hbfb4;
              3'h3: pos_word = 16'hbf24;
              3'h4: pos_word = 16'hbe3f;
              3'h5: pos_word = 16'h3e50;
              3'h6: pos_word = 16'h3f29;
              3'h7: pos_word = 16'h3fba;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4091;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0be;
              3'h2: pos_word = 16'hbfd0;
              3'h3: pos_word = 16'hbf3d;
              3'h4: pos_word = 16'hbe83;
              3'h5: pos_word = 16'h3e0a;
              3'h6: pos_word = 16'h3f12;
              3'h7: pos_word = 16'h3fa2;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h405c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc11e;
              3'h2: pos_word = 16'hbff3;
              3'h3: pos_word = 16'hbf58;
              3'h4: pos_word = 16'hbea8;
              3'h5: pos_word = 16'h3d8b;
              3'h6: pos_word = 16'h3ef9;
              3'h7: pos_word = 16'h3f8e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h402f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1e7;
              3'h2: pos_word = 16'hc010;
              3'h3: pos_word = 16'hbf77;
              3'h4: pos_word = 16'hbece;
              3'h5: pos_word = 16'h3ac3;
              3'h6: pos_word = 16'h3ed0;
              3'h7: pos_word = 16'h3f78;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4011;
            case (mant_lo3)
              3'h1: pos_word = 16'h41fd;
              3'h2: pos_word = 16'hc02e;
              3'h3: pos_word = 16'hbf8d;
              3'h4: pos_word = 16'hbef7;
              3'h5: pos_word = 16'hbd85;
              3'h6: pos_word = 16'h3ea9;
              3'h7: pos_word = 16'h3f59;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3ff5;
            case (mant_lo3)
              3'h1: pos_word = 16'h4123;
              3'h2: pos_word = 16'hc059;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'hbf11;
              3'h5: pos_word = 16'hbe07;
              3'h6: pos_word = 16'h3e85;
              3'h7: pos_word = 16'h3f3e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he4: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fd1;
            case (mant_lo3)
              3'h1: pos_word = 16'hc08f;
              3'h2: pos_word = 16'hbf28;
              3'h3: pos_word = 16'h3e42;
              3'h4: pos_word = 16'h3fb5;
              3'h5: pos_word = 16'hc0ce;
              3'h6: pos_word = 16'hbf42;
              3'h7: pos_word = 16'h3df9;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc136;
              3'h2: pos_word = 16'hbf5e;
              3'h3: pos_word = 16'h3d61;
              3'h4: pos_word = 16'h3f8a;
              3'h5: pos_word = 16'hc239;
              3'h6: pos_word = 16'hbf7d;
              3'h7: pos_word = 16'hbc3c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f72;
            case (mant_lo3)
              3'h1: pos_word = 16'h41b3;
              3'h2: pos_word = 16'hbf91;
              3'h3: pos_word = 16'hbd9f;
              3'h4: pos_word = 16'h3f54;
              3'h5: pos_word = 16'h4110;
              3'h6: pos_word = 16'hbfa6;
              3'h7: pos_word = 16'hbe14;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f39;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b3;
              3'h2: pos_word = 16'hbfbe;
              3'h3: pos_word = 16'hbe5a;
              3'h4: pos_word = 16'h3f20;
              3'h5: pos_word = 16'h4081;
              3'h6: pos_word = 16'hbfdd;
              3'h7: pos_word = 16'hbe91;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f09;
            case (mant_lo3)
              3'h1: pos_word = 16'h4048;
              3'h2: pos_word = 16'hc001;
              3'h3: pos_word = 16'hbeb7;
              3'h4: pos_word = 16'h3ee8;
              3'h5: pos_word = 16'h4022;
              3'h6: pos_word = 16'hc01a;
              3'h7: pos_word = 16'hbede;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3ec1;
            case (mant_lo3)
              3'h1: pos_word = 16'h4007;
              3'h2: pos_word = 16'hc03d;
              3'h3: pos_word = 16'hbf04;
              3'h4: pos_word = 16'h3e9b;
              3'h5: pos_word = 16'h3fe6;
              3'h6: pos_word = 16'hc070;
              3'h7: pos_word = 16'hbf1a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e6d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc6;
              3'h2: pos_word = 16'hc0a2;
              3'h3: pos_word = 16'hbf32;
              3'h4: pos_word = 16'h3e27;
              3'h5: pos_word = 16'h3fac;
              3'h6: pos_word = 16'hc0f8;
              3'h7: pos_word = 16'hbf4c;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3dc3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f96;
              3'h2: pos_word = 16'hc181;
              3'h3: pos_word = 16'hbf6a;
              3'h4: pos_word = 16'h3ced;
              3'h5: pos_word = 16'h3f83;
              3'h6: pos_word = 16'h436c;
              3'h7: pos_word = 16'hbf85;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbd19;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f66;
              3'h2: pos_word = 16'h4163;
              3'h3: pos_word = 16'hbf98;
              3'h4: pos_word = 16'hbdd5;
              3'h5: pos_word = 16'h3f49;
              3'h6: pos_word = 16'h40e9;
              3'h7: pos_word = 16'hbfaf;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe30;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2f;
              3'h2: pos_word = 16'h409c;
              3'h3: pos_word = 16'hbfca;
              3'h4: pos_word = 16'hbe76;
              3'h5: pos_word = 16'h3f17;
              3'h6: pos_word = 16'h4068;
              3'h7: pos_word = 16'hbfea;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbea0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f01;
              3'h2: pos_word = 16'h4038;
              3'h3: pos_word = 16'hc00a;
              3'h4: pos_word = 16'hbec6;
              3'h5: pos_word = 16'h3ed9;
              3'h6: pos_word = 16'h4017;
              3'h7: pos_word = 16'hc026;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbeee;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb2;
              3'h2: pos_word = 16'h3ffd;
              3'h3: pos_word = 16'hc04e;
              3'h4: pos_word = 16'hbf0c;
              3'h5: pos_word = 16'h3e8d;
              3'h6: pos_word = 16'h3fd8;
              3'h7: pos_word = 16'hc086;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf23;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e51;
              3'h2: pos_word = 16'h3fbb;
              3'h3: pos_word = 16'hc0bc;
              3'h4: pos_word = 16'hbf3c;
              3'h5: pos_word = 16'h3e0c;
              3'h6: pos_word = 16'h3fa3;
              3'h7: pos_word = 16'hc11c;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf57;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d8e;
              3'h2: pos_word = 16'h3f8e;
              3'h3: pos_word = 16'hc1de;
              3'h4: pos_word = 16'hbf76;
              3'h5: pos_word = 16'h3b43;
              3'h6: pos_word = 16'h3f79;
              3'h7: pos_word = 16'h4205;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf8d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd82;
              3'h2: pos_word = 16'h3f5a;
              3'h3: pos_word = 16'h4126;
              3'h4: pos_word = 16'hbfa1;
              3'h5: pos_word = 16'hbe05;
              3'h6: pos_word = 16'h3f3e;
              3'h7: pos_word = 16'h40c3;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfb9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe4b;
              3'h2: pos_word = 16'h3f25;
              3'h3: pos_word = 16'h4089;
              3'h4: pos_word = 16'hbfd6;
              3'h5: pos_word = 16'hbe89;
              3'h6: pos_word = 16'h3f0e;
              3'h7: pos_word = 16'h4053;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he5: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbffa;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ef1;
              3'h2: pos_word = 16'hc014;
              3'h3: pos_word = 16'h3ec9;
              3'h4: pos_word = 16'hc034;
              3'h5: pos_word = 16'h3ea3;
              3'h6: pos_word = 16'hc063;
              3'h7: pos_word = 16'h3e7d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc097;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e36;
              3'h2: pos_word = 16'hc0df;
              3'h3: pos_word = 16'h3de1;
              3'h4: pos_word = 16'hc151;
              3'h5: pos_word = 16'h3d32;
              3'h6: pos_word = 16'hc2c4;
              3'h7: pos_word = 16'hbcbc;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h418f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb7;
              3'h2: pos_word = 16'h4102;
              3'h3: pos_word = 16'hbe20;
              3'h4: pos_word = 16'h40a8;
              3'h5: pos_word = 16'hbe67;
              3'h6: pos_word = 16'h4076;
              3'h7: pos_word = 16'hbe98;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4041;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebd;
              3'h2: pos_word = 16'h401d;
              3'h3: pos_word = 16'hbee5;
              3'h4: pos_word = 16'h4003;
              3'h5: pos_word = 16'hbf07;
              3'h6: pos_word = 16'h3fe0;
              3'h7: pos_word = 16'hbf1e;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fc1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf36;
              3'h2: pos_word = 16'h3fa8;
              3'h3: pos_word = 16'hbf51;
              3'h4: pos_word = 16'h3f92;
              3'h5: pos_word = 16'hbf6f;
              3'h6: pos_word = 16'h3f80;
              3'h7: pos_word = 16'hbf89;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f61;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9c;
              3'h2: pos_word = 16'h3f44;
              3'h3: pos_word = 16'hbfb3;
              3'h4: pos_word = 16'h3f2b;
              3'h5: pos_word = 16'hbfcf;
              3'h6: pos_word = 16'h3f13;
              3'h7: pos_word = 16'hbff1;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3efb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc00f;
              3'h2: pos_word = 16'h3ed2;
              3'h3: pos_word = 16'hc02c;
              3'h4: pos_word = 16'h3eab;
              3'h5: pos_word = 16'hc057;
              3'h6: pos_word = 16'h3e86;
              3'h7: pos_word = 16'hc08d;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e45;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0ca;
              3'h2: pos_word = 16'h3dff;
              3'h3: pos_word = 16'hc130;
              3'h4: pos_word = 16'h3d6d;
              3'h5: pos_word = 16'hc222;
              3'h6: pos_word = 16'hbc0b;
              3'h7: pos_word = 16'h41c0;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbd99;
            case (mant_lo3)
              3'h1: pos_word = 16'h4114;
              3'h2: pos_word = 16'hbe11;
              3'h3: pos_word = 16'h40b6;
              3'h4: pos_word = 16'hbe57;
              3'h5: pos_word = 16'h4083;
              3'h6: pos_word = 16'hbe90;
              3'h7: pos_word = 16'h404a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbeb5;
            case (mant_lo3)
              3'h1: pos_word = 16'h4024;
              3'h2: pos_word = 16'hbedc;
              3'h3: pos_word = 16'h4008;
              3'h4: pos_word = 16'hbf03;
              3'h5: pos_word = 16'h3fe7;
              3'h6: pos_word = 16'hbf19;
              3'h7: pos_word = 16'h3fc7;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf31;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fad;
              3'h2: pos_word = 16'hbf4b;
              3'h3: pos_word = 16'h3f97;
              3'h4: pos_word = 16'hbf68;
              3'h5: pos_word = 16'h3f84;
              3'h6: pos_word = 16'hbf85;
              3'h7: pos_word = 16'h3f67;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf98;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4a;
              3'h2: pos_word = 16'hbfae;
              3'h3: pos_word = 16'h3f30;
              3'h4: pos_word = 16'hbfc8;
              3'h5: pos_word = 16'h3f18;
              3'h6: pos_word = 16'hbfe9;
              3'h7: pos_word = 16'h3f02;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc009;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eda;
              3'h2: pos_word = 16'hc025;
              3'h3: pos_word = 16'h3eb3;
              3'h4: pos_word = 16'hc04c;
              3'h5: pos_word = 16'h3e8e;
              3'h6: pos_word = 16'hc084;
              3'h7: pos_word = 16'h3e55;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc0b9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e0f;
              3'h2: pos_word = 16'hc117;
              3'h3: pos_word = 16'h3d94;
              3'h4: pos_word = 16'hc1cd;
              3'h5: pos_word = 16'h3bc3;
              3'h6: pos_word = 16'h4213;
              3'h7: pos_word = 16'hbd77;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h412b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe02;
              3'h2: pos_word = 16'h40c7;
              3'h3: pos_word = 16'hbe48;
              3'h4: pos_word = 16'h408b;
              3'h5: pos_word = 16'hbe88;
              3'h6: pos_word = 16'h4055;
              3'h7: pos_word = 16'hbead;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h402b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed3;
              3'h2: pos_word = 16'h400e;
              3'h3: pos_word = 16'hbefc;
              3'h4: pos_word = 16'h3ff0;
              3'h5: pos_word = 16'hbf14;
              3'h6: pos_word = 16'h3fce;
              3'h7: pos_word = 16'hbf2b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he6: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fb2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9b;
              3'h2: pos_word = 16'h3f88;
              3'h3: pos_word = 16'h3f6e;
              3'h4: pos_word = 16'h3f50;
              3'h5: pos_word = 16'h3f35;
              3'h6: pos_word = 16'h3f1d;
              3'h7: pos_word = 16'h3f07;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3ee3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ebc;
              3'h2: pos_word = 16'h3e96;
              3'h3: pos_word = 16'h3e64;
              3'h4: pos_word = 16'h3e1e;
              3'h5: pos_word = 16'h3db2;
              3'h6: pos_word = 16'h3ca7;
              3'h7: pos_word = 16'hbd3c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbde6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe39;
              3'h2: pos_word = 16'hbe7f;
              3'h3: pos_word = 16'hbea4;
              3'h4: pos_word = 16'hbecb;
              3'h5: pos_word = 16'hbef3;
              3'h6: pos_word = 16'hbf0f;
              3'h7: pos_word = 16'hbf26;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf3f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5b;
              3'h2: pos_word = 16'hbf7a;
              3'h3: pos_word = 16'hbf8f;
              3'h4: pos_word = 16'hbfa4;
              3'h5: pos_word = 16'hbfbc;
              3'h6: pos_word = 16'hbfda;
              3'h7: pos_word = 16'hbfff;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc018;
            case (mant_lo3)
              3'h1: pos_word = 16'hc039;
              3'h2: pos_word = 16'hc06a;
              3'h3: pos_word = 16'hc09e;
              3'h4: pos_word = 16'hc0ed;
              3'h5: pos_word = 16'hc16b;
              3'h6: pos_word = 16'hc411;
              3'h7: pos_word = 16'h4178;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h40f3;
            case (mant_lo3)
              3'h1: pos_word = 16'h40a0;
              3'h2: pos_word = 16'h406e;
              3'h3: pos_word = 16'h403b;
              3'h4: pos_word = 16'h4019;
              3'h5: pos_word = 16'h4001;
              3'h6: pos_word = 16'h3fdb;
              3'h7: pos_word = 16'h3fbd;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3fa5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f90;
              3'h2: pos_word = 16'h3f7c;
              3'h3: pos_word = 16'h3f5d;
              3'h4: pos_word = 16'h3f41;
              3'h5: pos_word = 16'h3f27;
              3'h6: pos_word = 16'h3f10;
              3'h7: pos_word = 16'h3ef5;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3ecd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea6;
              3'h2: pos_word = 16'h3e82;
              3'h3: pos_word = 16'h3e3c;
              3'h4: pos_word = 16'h3dee;
              3'h5: pos_word = 16'h3d4a;
              3'h6: pos_word = 16'hbc8b;
              3'h7: pos_word = 16'hbdab;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe1a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe60;
              3'h2: pos_word = 16'hbe94;
              3'h3: pos_word = 16'hbeba;
              3'h4: pos_word = 16'hbee1;
              3'h5: pos_word = 16'hbf05;
              3'h6: pos_word = 16'hbf1c;
              3'h7: pos_word = 16'hbf34;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6c;
              3'h2: pos_word = 16'hbf87;
              3'h3: pos_word = 16'hbf9a;
              3'h4: pos_word = 16'hbfb1;
              3'h5: pos_word = 16'hbfcc;
              3'h6: pos_word = 16'hbfee;
              3'h7: pos_word = 16'hc00c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc029;
            case (mant_lo3)
              3'h1: pos_word = 16'hc052;
              3'h2: pos_word = 16'hc089;
              3'h3: pos_word = 16'hc0c3;
              3'h4: pos_word = 16'hc125;
              3'h5: pos_word = 16'hc203;
              3'h6: pos_word = 16'h41e0;
              3'h7: pos_word = 16'h411d;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h40bd;
            case (mant_lo3)
              3'h1: pos_word = 16'h4086;
              3'h2: pos_word = 16'h404e;
              3'h3: pos_word = 16'h4027;
              3'h4: pos_word = 16'h400a;
              3'h5: pos_word = 16'h3feb;
              3'h6: pos_word = 16'h3fca;
              3'h7: pos_word = 16'h3faf;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f99;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f86;
              3'h2: pos_word = 16'h3f6a;
              3'h3: pos_word = 16'h3f4d;
              3'h4: pos_word = 16'h3f32;
              3'h5: pos_word = 16'h3f1a;
              3'h6: pos_word = 16'h3f04;
              3'h7: pos_word = 16'h3ede;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3eb7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e91;
              3'h2: pos_word = 16'h3e5b;
              3'h3: pos_word = 16'h3e15;
              3'h4: pos_word = 16'h3da0;
              3'h5: pos_word = 16'h3c43;
              3'h6: pos_word = 16'hbd5f;
              3'h7: pos_word = 16'hbdf8;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe42;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe84;
              3'h2: pos_word = 16'hbea9;
              3'h3: pos_word = 16'hbed0;
              3'h4: pos_word = 16'hbef8;
              3'h5: pos_word = 16'hbf12;
              3'h6: pos_word = 16'hbf29;
              3'h7: pos_word = 16'hbf43;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf5f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf7f;
              3'h2: pos_word = 16'hbf91;
              3'h3: pos_word = 16'hbfa6;
              3'h4: pos_word = 16'hbfbf;
              3'h5: pos_word = 16'hbfde;
              3'h6: pos_word = 16'hc002;
              3'h7: pos_word = 16'hc01b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he7: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc03e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a5;
              3'h2: pos_word = 16'hc186;
              3'h3: pos_word = 16'h415b;
              3'h4: pos_word = 16'h409a;
              3'h5: pos_word = 16'h4036;
              3'h6: pos_word = 16'h3ffc;
              3'h7: pos_word = 16'h3fba;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f8e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f59;
              3'h2: pos_word = 16'h3f24;
              3'h3: pos_word = 16'h3ef0;
              3'h4: pos_word = 16'h3ea2;
              3'h5: pos_word = 16'h3e33;
              3'h6: pos_word = 16'h3d27;
              3'h7: pos_word = 16'hbdbc;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe69;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebf;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'hbf37;
              3'h4: pos_word = 16'hbf70;
              3'h5: pos_word = 16'hbf9d;
              3'h6: pos_word = 16'hbfd0;
              3'h7: pos_word = 16'hc010;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc059;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0cd;
              3'h2: pos_word = 16'hc235;
              3'h3: pos_word = 16'h4110;
              3'h4: pos_word = 16'h4081;
              3'h5: pos_word = 16'h4022;
              3'h6: pos_word = 16'h3fe6;
              3'h7: pos_word = 16'h3fac;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f83;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f49;
              3'h2: pos_word = 16'h3f17;
              3'h3: pos_word = 16'h3ed9;
              3'h4: pos_word = 16'h3e8d;
              3'h5: pos_word = 16'h3e0c;
              3'h6: pos_word = 16'h3b62;
              3'h7: pos_word = 16'hbe05;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbe89;
            case (mant_lo3)
              3'h1: pos_word = 16'hbed5;
              3'h2: pos_word = 16'hbf15;
              3'h3: pos_word = 16'hbf46;
              3'h4: pos_word = 16'hbf82;
              3'h5: pos_word = 16'hbfa9;
              3'h6: pos_word = 16'hbfe2;
              3'h7: pos_word = 16'hc01f;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc07b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc108;
              3'h2: pos_word = 16'h4283;
              3'h3: pos_word = 16'h40d7;
              3'h4: pos_word = 16'h405e;
              3'h5: pos_word = 16'h4012;
              3'h6: pos_word = 16'h3fd3;
              3'h7: pos_word = 16'h3f9f;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f74;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'h3f0a;
              3'h3: pos_word = 16'h3ec3;
              3'h4: pos_word = 16'h3e71;
              3'h5: pos_word = 16'h3dca;
              3'h6: pos_word = 16'hbd0b;
              3'h7: pos_word = 16'hbe2c;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe9e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeec;
              3'h2: pos_word = 16'hbf22;
              3'h3: pos_word = 16'hbf56;
              3'h4: pos_word = 16'hbf8c;
              3'h5: pos_word = 16'hbfb7;
              3'h6: pos_word = 16'hbff8;
              3'h7: pos_word = 16'hc032;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc094;
            case (mant_lo3)
              3'h1: pos_word = 16'hc148;
              3'h2: pos_word = 16'h4198;
              3'h3: pos_word = 16'h40ab;
              3'h4: pos_word = 16'h4043;
              3'h5: pos_word = 16'h4005;
              3'h6: pos_word = 16'h3fc2;
              3'h7: pos_word = 16'h3f93;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f62;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2c;
              3'h2: pos_word = 16'h3efd;
              3'h3: pos_word = 16'h3ead;
              3'h4: pos_word = 16'h3e49;
              3'h5: pos_word = 16'h3d7b;
              3'h6: pos_word = 16'hbd92;
              3'h7: pos_word = 16'hbe54;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbeb3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf02;
              3'h2: pos_word = 16'hbf30;
              3'h3: pos_word = 16'hbf67;
              3'h4: pos_word = 16'hbf96;
              3'h5: pos_word = 16'hbfc7;
              3'h6: pos_word = 16'hc008;
              3'h7: pos_word = 16'hc04a;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc0b5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc1bc;
              3'h2: pos_word = 16'h4131;
              3'h3: pos_word = 16'h408e;
              3'h4: pos_word = 16'h402d;
              3'h5: pos_word = 16'h3ff2;
              3'h6: pos_word = 16'h3fb3;
              3'h7: pos_word = 16'h3f89;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f52;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f1e;
              3'h2: pos_word = 16'h3ee5;
              3'h3: pos_word = 16'h3e98;
              3'h4: pos_word = 16'h3e21;
              3'h5: pos_word = 16'h3cc3;
              3'h6: pos_word = 16'hbddf;
              3'h7: pos_word = 16'hbe7c;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbec9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0e;
              3'h2: pos_word = 16'hbf3e;
              3'h3: pos_word = 16'hbf79;
              3'h4: pos_word = 16'hbfa2;
              3'h5: pos_word = 16'hbfd8;
              3'h6: pos_word = 16'hc016;
              3'h7: pos_word = 16'hc067;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc0e7;
            case (mant_lo3)
              3'h1: pos_word = 16'hc342;
              3'h2: pos_word = 16'h40fa;
              3'h3: pos_word = 16'h4071;
              3'h4: pos_word = 16'h401b;
              3'h5: pos_word = 16'h3fdd;
              3'h6: pos_word = 16'h3fa6;
              3'h7: pos_word = 16'h3f7e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he8: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f42;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ecf;
              3'h2: pos_word = 16'h3df5;
              3'h3: pos_word = 16'hbe17;
              3'h4: pos_word = 16'hbedf;
              3'h5: pos_word = 16'hbf4d;
              3'h6: pos_word = 16'hbfb0;
              3'h7: pos_word = 16'hc027;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc11f;
            case (mant_lo3)
              3'h1: pos_word = 16'h40c1;
              3'h2: pos_word = 16'h400c;
              3'h3: pos_word = 16'h3f9a;
              3'h4: pos_word = 16'h3f33;
              3'h5: pos_word = 16'h3eb9;
              3'h6: pos_word = 16'h3da7;
              3'h7: pos_word = 16'hbe3e;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbef6;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5d;
              3'h2: pos_word = 16'hbfbe;
              3'h3: pos_word = 16'hc03c;
              3'h4: pos_word = 16'hc17e;
              3'h5: pos_word = 16'h409c;
              3'h6: pos_word = 16'h3ffe;
              3'h7: pos_word = 16'h3f8f;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f26;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea4;
              3'h2: pos_word = 16'h3d35;
              3'h3: pos_word = 16'hbe66;
              3'h4: pos_word = 16'hbf07;
              3'h5: pos_word = 16'hbf6f;
              3'h6: pos_word = 16'hbfce;
              3'h7: pos_word = 16'hc056;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc21c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4083;
              3'h2: pos_word = 16'h3fe8;
              3'h3: pos_word = 16'h3f84;
              3'h4: pos_word = 16'h3f18;
              3'h5: pos_word = 16'h3e8f;
              3'h6: pos_word = 16'h3be2;
              3'h7: pos_word = 16'hbe87;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf14;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf81;
              3'h2: pos_word = 16'hbfe1;
              3'h3: pos_word = 16'hc077;
              3'h4: pos_word = 16'h42aa;
              3'h5: pos_word = 16'h4061;
              3'h6: pos_word = 16'h3fd5;
              3'h7: pos_word = 16'h3f75;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f0c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e75;
              3'h2: pos_word = 16'hbcfa;
              3'h3: pos_word = 16'hbe9c;
              3'h4: pos_word = 16'hbf21;
              3'h5: pos_word = 16'hbf8b;
              3'h6: pos_word = 16'hbff5;
              3'h7: pos_word = 16'hc092;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h41a3;
            case (mant_lo3)
              3'h1: pos_word = 16'h4045;
              3'h2: pos_word = 16'h3fc4;
              3'h3: pos_word = 16'h3f64;
              3'h4: pos_word = 16'h3eff;
              3'h5: pos_word = 16'h3e4c;
              3'h6: pos_word = 16'hbd8b;
              3'h7: pos_word = 16'hbeb1;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf2e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf95;
              3'h2: pos_word = 16'hc007;
              3'h3: pos_word = 16'hc0b1;
              3'h4: pos_word = 16'h4139;
              3'h5: pos_word = 16'h402f;
              3'h6: pos_word = 16'h3fb5;
              3'h7: pos_word = 16'h3f53;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3ee8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e25;
              3'h2: pos_word = 16'hbdd8;
              3'h3: pos_word = 16'hbec7;
              3'h4: pos_word = 16'hbf3d;
              3'h5: pos_word = 16'hbfa1;
              3'h6: pos_word = 16'hc015;
              3'h7: pos_word = 16'hc0e1;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4101;
            case (mant_lo3)
              3'h1: pos_word = 16'h401c;
              3'h2: pos_word = 16'h3fa7;
              3'h3: pos_word = 16'h3f44;
              3'h4: pos_word = 16'h3ed1;
              3'h5: pos_word = 16'h3dfc;
              3'h6: pos_word = 16'hbe13;
              3'h7: pos_word = 16'hbedd;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf4c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfae;
              3'h2: pos_word = 16'hc026;
              3'h3: pos_word = 16'hc11a;
              3'h4: pos_word = 16'h40c5;
              3'h5: pos_word = 16'h400d;
              3'h6: pos_word = 16'h3f9b;
              3'h7: pos_word = 16'h3f35;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3ebb;
            case (mant_lo3)
              3'h1: pos_word = 16'h3daf;
              3'h2: pos_word = 16'hbe3a;
              3'h3: pos_word = 16'hbef4;
              3'h4: pos_word = 16'hbf5c;
              3'h5: pos_word = 16'hbfbd;
              3'h6: pos_word = 16'hc03a;
              3'h7: pos_word = 16'hc171;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h409f;
            case (mant_lo3)
              3'h1: pos_word = 16'h4000;
              3'h2: pos_word = 16'h3f8f;
              3'h3: pos_word = 16'h3f27;
              3'h4: pos_word = 16'h3ea5;
              3'h5: pos_word = 16'h3d43;
              3'h6: pos_word = 16'hbe62;
              3'h7: pos_word = 16'hbf06;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf6d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfcd;
              3'h2: pos_word = 16'hc053;
              3'h3: pos_word = 16'hc20a;
              3'h4: pos_word = 16'h4085;
              3'h5: pos_word = 16'h3fea;
              3'h6: pos_word = 16'h3f85;
              3'h7: pos_word = 16'h3f1a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3e91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3c29;
              3'h2: pos_word = 16'hbe85;
              3'h3: pos_word = 16'hbf12;
              3'h4: pos_word = 16'hbf7f;
              3'h5: pos_word = 16'hbfdf;
              3'h6: pos_word = 16'hc074;
              3'h7: pos_word = 16'h42ef;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'he9: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h4064;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f77;
              3'h2: pos_word = 16'h3e78;
              3'h3: pos_word = 16'hbe9a;
              3'h4: pos_word = 16'hbf8a;
              3'h5: pos_word = 16'hc090;
              3'h6: pos_word = 16'h4047;
              3'h7: pos_word = 16'h3f65;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e50;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeaf;
              3'h2: pos_word = 16'hbf94;
              3'h3: pos_word = 16'hc0ae;
              3'h4: pos_word = 16'h4030;
              3'h5: pos_word = 16'h3f55;
              3'h6: pos_word = 16'h3e29;
              3'h7: pos_word = 16'hbec5;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbfa0;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0dc;
              3'h2: pos_word = 16'h401e;
              3'h3: pos_word = 16'h3f45;
              3'h4: pos_word = 16'h3e02;
              3'h5: pos_word = 16'hbedb;
              3'h6: pos_word = 16'hbfad;
              3'h7: pos_word = 16'hc115;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h400e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f36;
              3'h2: pos_word = 16'h3db6;
              3'h3: pos_word = 16'hbef2;
              3'h4: pos_word = 16'hbfbb;
              3'h5: pos_word = 16'hc165;
              3'h6: pos_word = 16'h4001;
              3'h7: pos_word = 16'h3f28;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3d52;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf05;
              3'h2: pos_word = 16'hbfcb;
              3'h3: pos_word = 16'hc1f7;
              3'h4: pos_word = 16'h3fec;
              3'h5: pos_word = 16'h3f1b;
              3'h6: pos_word = 16'h3c62;
              3'h7: pos_word = 16'hbf11;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfdd;
            case (mant_lo3)
              3'h1: pos_word = 16'h434c;
              3'h2: pos_word = 16'h3fd8;
              3'h3: pos_word = 16'h3f0e;
              3'h4: pos_word = 16'hbcc1;
              3'h5: pos_word = 16'hbf1e;
              3'h6: pos_word = 16'hbff1;
              3'h7: pos_word = 16'h41bd;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3fc7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f02;
              3'h2: pos_word = 16'hbd7a;
              3'h3: pos_word = 16'hbf2c;
              3'h4: pos_word = 16'hc004;
              3'h5: pos_word = 16'h4149;
              3'h6: pos_word = 16'h3fb7;
              3'h7: pos_word = 16'h3eec;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbdca;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3a;
              3'h2: pos_word = 16'hc012;
              3'h3: pos_word = 16'h4108;
              3'h4: pos_word = 16'h3faa;
              3'h5: pos_word = 16'h3ed5;
              3'h6: pos_word = 16'hbe0c;
              3'h7: pos_word = 16'hbf49;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc022;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ce;
              3'h2: pos_word = 16'h3f9d;
              3'h3: pos_word = 16'h3ebf;
              3'h4: pos_word = 16'hbe33;
              3'h5: pos_word = 16'hbf59;
              3'h6: pos_word = 16'hc036;
              3'h7: pos_word = 16'h40a5;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f92;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea9;
              3'h2: pos_word = 16'hbe5b;
              3'h3: pos_word = 16'hbf6a;
              3'h4: pos_word = 16'hc04e;
              3'h5: pos_word = 16'h4089;
              3'h6: pos_word = 16'h3f87;
              3'h7: pos_word = 16'h3e94;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe81;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf7c;
              3'h2: pos_word = 16'hc06d;
              3'h3: pos_word = 16'h406b;
              3'h4: pos_word = 16'h3f7b;
              3'h5: pos_word = 16'h3e80;
              3'h6: pos_word = 16'hbe96;
              3'h7: pos_word = 16'hbf88;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc08b;
            case (mant_lo3)
              3'h1: pos_word = 16'h404c;
              3'h2: pos_word = 16'h3f68;
              3'h3: pos_word = 16'h3e57;
              3'h4: pos_word = 16'hbeab;
              3'h5: pos_word = 16'hbf92;
              3'h6: pos_word = 16'hc0a8;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f58;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e30;
              3'h2: pos_word = 16'hbec1;
              3'h3: pos_word = 16'hbf9e;
              3'h4: pos_word = 16'hc0d2;
              3'h5: pos_word = 16'h4021;
              3'h6: pos_word = 16'h3f48;
              3'h7: pos_word = 16'h3e09;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbed7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfab;
              3'h2: pos_word = 16'hc10c;
              3'h3: pos_word = 16'h4011;
              3'h4: pos_word = 16'h3f39;
              3'h5: pos_word = 16'h3dc4;
              3'h6: pos_word = 16'hbeee;
              3'h7: pos_word = 16'hbfb9;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc150;
            case (mant_lo3)
              3'h1: pos_word = 16'h4003;
              3'h2: pos_word = 16'h3f2b;
              3'h3: pos_word = 16'h3d6e;
              3'h4: pos_word = 16'hbf03;
              3'h5: pos_word = 16'hbfc8;
              3'h6: pos_word = 16'hc1cb;
              3'h7: pos_word = 16'h3ff0;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f1d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ca9;
              3'h2: pos_word = 16'hbf0f;
              3'h3: pos_word = 16'hbfda;
              3'h4: pos_word = 16'hc3fd;
              3'h5: pos_word = 16'h3fdc;
              3'h6: pos_word = 16'h3f10;
              3'h7: pos_word = 16'hbc89;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hea: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf1c;
            case (mant_lo3)
              3'h1: pos_word = 16'h41e2;
              3'h2: pos_word = 16'h3f04;
              3'h3: pos_word = 16'hbf29;
              3'h4: pos_word = 16'h415c;
              3'h5: pos_word = 16'h3ef0;
              3'h6: pos_word = 16'hbf37;
              3'h7: pos_word = 16'h4111;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3ed9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf46;
              3'h2: pos_word = 16'h40d7;
              3'h3: pos_word = 16'h3ec3;
              3'h4: pos_word = 16'hbf56;
              3'h5: pos_word = 16'h40ab;
              3'h6: pos_word = 16'h3ead;
              3'h7: pos_word = 16'hbf67;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h408e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e98;
              3'h2: pos_word = 16'hbf79;
              3'h3: pos_word = 16'h4071;
              3'h4: pos_word = 16'h3e84;
              3'h5: pos_word = 16'hbf86;
              3'h6: pos_word = 16'h4051;
              3'h7: pos_word = 16'h3e5f;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf90;
            case (mant_lo3)
              3'h1: pos_word = 16'h4038;
              3'h2: pos_word = 16'h3e37;
              3'h3: pos_word = 16'hbf9c;
              3'h4: pos_word = 16'h4024;
              3'h5: pos_word = 16'h3e10;
              3'h6: pos_word = 16'hbfa8;
              3'h7: pos_word = 16'h4014;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3dd2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb6;
              3'h2: pos_word = 16'h4006;
              3'h3: pos_word = 16'h3d85;
              3'h4: pos_word = 16'hbfc5;
              3'h5: pos_word = 16'h3ff4;
              3'h6: pos_word = 16'h3ce2;
              3'h7: pos_word = 16'hbfd6;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3fdf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc21;
              3'h2: pos_word = 16'hbfea;
              3'h3: pos_word = 16'h3fcd;
              3'h4: pos_word = 16'hbd41;
              3'h5: pos_word = 16'hc000;
              3'h6: pos_word = 16'h3fbd;
              3'h7: pos_word = 16'hbdae;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc00d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fae;
              3'h2: pos_word = 16'hbdfb;
              3'h3: pos_word = 16'hc01c;
              3'h4: pos_word = 16'h3fa1;
              3'h5: pos_word = 16'hbe24;
              3'h6: pos_word = 16'hc02e;
              3'h7: pos_word = 16'h3f96;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe4c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc045;
              3'h2: pos_word = 16'h3f8b;
              3'h3: pos_word = 16'hbe74;
              3'h4: pos_word = 16'hc061;
              3'h5: pos_word = 16'h3f81;
              3'h6: pos_word = 16'hbe8e;
              3'h7: pos_word = 16'hc083;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f6f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea3;
              3'h2: pos_word = 16'hc09c;
              3'h3: pos_word = 16'h3f5e;
              3'h4: pos_word = 16'hbeb9;
              3'h5: pos_word = 16'hc0c0;
              3'h6: pos_word = 16'h3f4d;
              3'h7: pos_word = 16'hbece;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc0f9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3e;
              3'h2: pos_word = 16'hbee5;
              3'h3: pos_word = 16'hc130;
              3'h4: pos_word = 16'h3f30;
              3'h5: pos_word = 16'hbefc;
              3'h6: pos_word = 16'hc197;
              3'h7: pos_word = 16'h3f22;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf0a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc27e;
              3'h2: pos_word = 16'h3f15;
              3'h3: pos_word = 16'hbf17;
              3'h4: pos_word = 16'h4239;
              3'h5: pos_word = 16'h3f08;
              3'h6: pos_word = 16'hbf24;
              3'h7: pos_word = 16'h4188;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3ef9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf32;
              3'h2: pos_word = 16'h4126;
              3'h3: pos_word = 16'h3ee1;
              3'h4: pos_word = 16'hbf41;
              3'h5: pos_word = 16'h40ee;
              3'h6: pos_word = 16'h3ecb;
              3'h7: pos_word = 16'hbf50;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h40b9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb5;
              3'h2: pos_word = 16'hbf60;
              3'h3: pos_word = 16'h4097;
              3'h4: pos_word = 16'h3ea0;
              3'h5: pos_word = 16'hbf72;
              3'h6: pos_word = 16'h407f;
              3'h7: pos_word = 16'h3e8b;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf82;
            case (mant_lo3)
              3'h1: pos_word = 16'h405c;
              3'h2: pos_word = 16'h3e6e;
              3'h3: pos_word = 16'hbf8c;
              3'h4: pos_word = 16'h4041;
              3'h5: pos_word = 16'h3e46;
              3'h6: pos_word = 16'hbf97;
              3'h7: pos_word = 16'h402b;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3e1e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa3;
              3'h2: pos_word = 16'h4019;
              3'h3: pos_word = 16'h3def;
              3'h4: pos_word = 16'hbfb1;
              3'h5: pos_word = 16'h400b;
              3'h6: pos_word = 16'h3da1;
              3'h7: pos_word = 16'hbfbf;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3ffc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d29;
              3'h2: pos_word = 16'hbfd0;
              3'h3: pos_word = 16'h3fe6;
              3'h4: pos_word = 16'h3b81;
              3'h5: pos_word = 16'hbfe2;
              3'h6: pos_word = 16'h3fd3;
              3'h7: pos_word = 16'hbd09;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'heb: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbff7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd91;
              3'h2: pos_word = 16'h3fb4;
              3'h3: pos_word = 16'hc016;
              3'h4: pos_word = 16'hbe16;
              3'h5: pos_word = 16'h3f9a;
              3'h6: pos_word = 16'hc03c;
              3'h7: pos_word = 16'hbe65;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f84;
            case (mant_lo3)
              3'h1: pos_word = 16'hc077;
              3'h2: pos_word = 16'hbe9c;
              3'h3: pos_word = 16'h3f64;
              3'h4: pos_word = 16'hc0b1;
              3'h5: pos_word = 16'hbec6;
              3'h6: pos_word = 16'h3f44;
              3'h7: pos_word = 16'hc119;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbef4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f27;
              3'h2: pos_word = 16'hc208;
              3'h3: pos_word = 16'hbf12;
              3'h4: pos_word = 16'h3f0d;
              3'h5: pos_word = 16'h41b1;
              3'h6: pos_word = 16'hbf2d;
              3'h7: pos_word = 16'h3eea;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4105;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4a;
              3'h2: pos_word = 16'h3ebd;
              3'h3: pos_word = 16'h40a2;
              3'h4: pos_word = 16'hbf6b;
              3'h5: pos_word = 16'h3e93;
              3'h6: pos_word = 16'h4068;
              3'h7: pos_word = 16'hbf89;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e54;
            case (mant_lo3)
              3'h1: pos_word = 16'h4033;
              3'h2: pos_word = 16'hbf9f;
              3'h3: pos_word = 16'h3e06;
              3'h4: pos_word = 16'h4010;
              3'h5: pos_word = 16'hbfba;
              3'h6: pos_word = 16'h3d62;
              3'h7: pos_word = 16'h3fee;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfdb;
            case (mant_lo3)
              3'h1: pos_word = 16'hbca1;
              3'h2: pos_word = 16'h3fc9;
              3'h3: pos_word = 16'hc003;
              3'h4: pos_word = 16'hbdc2;
              3'h5: pos_word = 16'h3fab;
              3'h6: pos_word = 16'hc020;
              3'h7: pos_word = 16'hbe2f;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f93;
            case (mant_lo3)
              3'h1: pos_word = 16'hc04b;
              3'h2: pos_word = 16'hbe7f;
              3'h3: pos_word = 16'h3f7d;
              3'h4: pos_word = 16'hc089;
              3'h5: pos_word = 16'hbea9;
              3'h6: pos_word = 16'h3f59;
              3'h7: pos_word = 16'hc0cc;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbed4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'hc146;
              3'h3: pos_word = 16'hbf01;
              3'h4: pos_word = 16'h3f1f;
              3'h5: pos_word = 16'hc329;
              3'h6: pos_word = 16'hbf1a;
              3'h7: pos_word = 16'h3f05;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h4168;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf36;
              3'h2: pos_word = 16'h3edb;
              3'h3: pos_word = 16'h40dd;
              3'h4: pos_word = 16'hbf54;
              3'h5: pos_word = 16'h3eb0;
              3'h6: pos_word = 16'h4090;
              3'h7: pos_word = 16'hbf77;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3e86;
            case (mant_lo3)
              3'h1: pos_word = 16'h4054;
              3'h2: pos_word = 16'hbf8f;
              3'h3: pos_word = 16'h3e3b;
              3'h4: pos_word = 16'h4026;
              3'h5: pos_word = 16'hbfa7;
              3'h6: pos_word = 16'h3dda;
              3'h7: pos_word = 16'h4007;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfc3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d01;
              3'h2: pos_word = 16'h3fe1;
              3'h3: pos_word = 16'hbfe7;
              3'h4: pos_word = 16'hbd31;
              3'h5: pos_word = 16'h3fbe;
              3'h6: pos_word = 16'hc00b;
              3'h7: pos_word = 16'hbdf3;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fa3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc02c;
              3'h2: pos_word = 16'hbe48;
              3'h3: pos_word = 16'h3f8c;
              3'h4: pos_word = 16'hc05e;
              3'h5: pos_word = 16'hbe8c;
              3'h6: pos_word = 16'h3f71;
              3'h7: pos_word = 16'hc099;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbeb6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4f;
              3'h2: pos_word = 16'hc0f1;
              3'h3: pos_word = 16'hbee3;
              3'h4: pos_word = 16'h3f31;
              3'h5: pos_word = 16'hc18c;
              3'h6: pos_word = 16'hbf09;
              3'h7: pos_word = 16'h3f16;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4262;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf23;
              3'h2: pos_word = 16'h3efb;
              3'h3: pos_word = 16'h412d;
              3'h4: pos_word = 16'hbf3f;
              3'h5: pos_word = 16'h3ecd;
              3'h6: pos_word = 16'h40be;
              3'h7: pos_word = 16'hbf5f;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3ea2;
            case (mant_lo3)
              3'h1: pos_word = 16'h4082;
              3'h2: pos_word = 16'hbf81;
              3'h3: pos_word = 16'h3e72;
              3'h4: pos_word = 16'h4043;
              3'h5: pos_word = 16'hbf96;
              3'h6: pos_word = 16'h3e22;
              3'h7: pos_word = 16'h401b;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfaf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3daa;
              3'h2: pos_word = 16'h3fff;
              3'h3: pos_word = 16'hbfce;
              3'h4: pos_word = 16'h3c01;
              3'h5: pos_word = 16'h3fd5;
              3'h6: pos_word = 16'hbff5;
              3'h7: pos_word = 16'hbd89;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hec: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3fb5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe12;
              3'h2: pos_word = 16'hc039;
              3'h3: pos_word = 16'h3f85;
              3'h4: pos_word = 16'hbe99;
              3'h5: pos_word = 16'hc0ad;
              3'h6: pos_word = 16'h3f45;
              3'h7: pos_word = 16'hbef1;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc1ef;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0e;
              3'h2: pos_word = 16'hbf2b;
              3'h3: pos_word = 16'h4109;
              3'h4: pos_word = 16'h3ebf;
              3'h5: pos_word = 16'hbf69;
              3'h6: pos_word = 16'h406b;
              3'h7: pos_word = 16'h3e59;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf9e;
            case (mant_lo3)
              3'h1: pos_word = 16'h4011;
              3'h2: pos_word = 16'h3d72;
              3'h3: pos_word = 16'hbfd9;
              3'h4: pos_word = 16'h3fca;
              3'h5: pos_word = 16'hbdba;
              3'h6: pos_word = 16'hc01f;
              3'h7: pos_word = 16'h3f94;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe7a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc086;
              3'h2: pos_word = 16'h3f5b;
              3'h3: pos_word = 16'hbed2;
              3'h4: pos_word = 16'hc13d;
              3'h5: pos_word = 16'h3f20;
              3'h6: pos_word = 16'hbf19;
              3'h7: pos_word = 16'h4176;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ede;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf52;
              3'h2: pos_word = 16'h4093;
              3'h3: pos_word = 16'h3e88;
              3'h4: pos_word = 16'hbf8e;
              3'h5: pos_word = 16'h4028;
              3'h6: pos_word = 16'h3de2;
              3'h7: pos_word = 16'hbfc2;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3fe3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd21;
              3'h2: pos_word = 16'hc00a;
              3'h3: pos_word = 16'h3fa4;
              3'h4: pos_word = 16'hbe44;
              3'h5: pos_word = 16'hc05a;
              3'h6: pos_word = 16'h3f73;
              3'h7: pos_word = 16'hbeb4;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc0ea;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f33;
              3'h2: pos_word = 16'hbf08;
              3'h3: pos_word = 16'h4292;
              3'h4: pos_word = 16'h3efe;
              3'h5: pos_word = 16'hbf3d;
              3'h6: pos_word = 16'h40c2;
              3'h7: pos_word = 16'h3ea4;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf80;
            case (mant_lo3)
              3'h1: pos_word = 16'h4046;
              3'h2: pos_word = 16'h3e27;
              3'h3: pos_word = 16'hbfae;
              3'h4: pos_word = 16'h4001;
              3'h5: pos_word = 16'h3c42;
              3'h6: pos_word = 16'hbff3;
              3'h7: pos_word = 16'h3fb7;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe0e;
            case (mant_lo3)
              3'h1: pos_word = 16'hc037;
              3'h2: pos_word = 16'h3f86;
              3'h3: pos_word = 16'hbe97;
              3'h4: pos_word = 16'hc0a9;
              3'h5: pos_word = 16'h3f47;
              3'h6: pos_word = 16'hbeef;
              3'h7: pos_word = 16'hc1d6;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f10;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2a;
              3'h2: pos_word = 16'h410e;
              3'h3: pos_word = 16'h3ec2;
              3'h4: pos_word = 16'hbf68;
              3'h5: pos_word = 16'h406f;
              3'h6: pos_word = 16'h3e5d;
              3'h7: pos_word = 16'hbf9c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h4013;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d81;
              3'h2: pos_word = 16'hbfd7;
              3'h3: pos_word = 16'h3fcc;
              3'h4: pos_word = 16'hbdb2;
              3'h5: pos_word = 16'hc01d;
              3'h6: pos_word = 16'h3f95;
              3'h7: pos_word = 16'hbe76;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc084;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f5d;
              3'h2: pos_word = 16'hbed0;
              3'h3: pos_word = 16'hc134;
              3'h4: pos_word = 16'h3f21;
              3'h5: pos_word = 16'hbf18;
              3'h6: pos_word = 16'h4183;
              3'h7: pos_word = 16'h3ee0;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hbf51;
            case (mant_lo3)
              3'h1: pos_word = 16'h4096;
              3'h2: pos_word = 16'h3e8a;
              3'h3: pos_word = 16'hbf8d;
              3'h4: pos_word = 16'h402a;
              3'h5: pos_word = 16'h3deb;
              3'h6: pos_word = 16'hbfc0;
              3'h7: pos_word = 16'h3fe5;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbd11;
            case (mant_lo3)
              3'h1: pos_word = 16'hc008;
              3'h2: pos_word = 16'h3fa5;
              3'h3: pos_word = 16'hbe3f;
              3'h4: pos_word = 16'hc057;
              3'h5: pos_word = 16'h3f75;
              3'h6: pos_word = 16'hbeb2;
              3'h7: pos_word = 16'hc0e4;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f34;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf06;
              3'h2: pos_word = 16'h42cd;
              3'h3: pos_word = 16'h3f00;
              3'h4: pos_word = 16'hbf3c;
              3'h5: pos_word = 16'h40c7;
              3'h6: pos_word = 16'h3ea7;
              3'h7: pos_word = 16'hbf7e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4049;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e2b;
              3'h2: pos_word = 16'hbfac;
              3'h3: pos_word = 16'h4002;
              3'h4: pos_word = 16'h3c81;
              3'h5: pos_word = 16'hbff0;
              3'h6: pos_word = 16'h3fb8;
              3'h7: pos_word = 16'hbe0a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hed: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc035;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe95;
              3'h2: pos_word = 16'h3f49;
              3'h3: pos_word = 16'hc1c1;
              3'h4: pos_word = 16'hbf28;
              3'h5: pos_word = 16'h3ec4;
              3'h6: pos_word = 16'h4073;
              3'h7: pos_word = 16'hbf9b;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3d89;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fce;
              3'h2: pos_word = 16'hc01b;
              3'h3: pos_word = 16'hbe72;
              3'h4: pos_word = 16'h3f5f;
              3'h5: pos_word = 16'hc12d;
              3'h6: pos_word = 16'hbf16;
              3'h7: pos_word = 16'h3ee3;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4099;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8c;
              3'h2: pos_word = 16'h3df3;
              3'h3: pos_word = 16'h3fe7;
              3'h4: pos_word = 16'hc007;
              3'h5: pos_word = 16'hbe3b;
              3'h6: pos_word = 16'h3f77;
              3'h7: pos_word = 16'hc0dd;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf05;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f01;
              3'h2: pos_word = 16'h40cc;
              3'h3: pos_word = 16'hbf7c;
              3'h4: pos_word = 16'h3e2f;
              3'h5: pos_word = 16'h4003;
              3'h6: pos_word = 16'hbfee;
              3'h7: pos_word = 16'hbe06;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f89;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0a2;
              3'h2: pos_word = 16'hbeea;
              3'h3: pos_word = 16'h3f12;
              3'h4: pos_word = 16'h4119;
              3'h5: pos_word = 16'hbf64;
              3'h6: pos_word = 16'h3e65;
              3'h7: pos_word = 16'h4016;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfd3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbda1;
              3'h2: pos_word = 16'h3f97;
              3'h3: pos_word = 16'hc07f;
              3'h4: pos_word = 16'hbecb;
              3'h5: pos_word = 16'h3f24;
              3'h6: pos_word = 16'h4197;
              3'h7: pos_word = 16'hbf4d;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e8e;
            case (mant_lo3)
              3'h1: pos_word = 16'h402e;
              3'h2: pos_word = 16'hbfbd;
              3'h3: pos_word = 16'hbce1;
              3'h4: pos_word = 16'h3fa8;
              3'h5: pos_word = 16'hc051;
              3'h6: pos_word = 16'hbead;
              3'h7: pos_word = 16'h3f37;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h4405;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf39;
              3'h2: pos_word = 16'h3eab;
              3'h3: pos_word = 16'h404e;
              3'h4: pos_word = 16'hbfa9;
              3'h5: pos_word = 16'h3cc2;
              3'h6: pos_word = 16'h3fbb;
              3'h7: pos_word = 16'hc030;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbe91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f4c;
              3'h2: pos_word = 16'hc1a2;
              3'h3: pos_word = 16'hbf26;
              3'h4: pos_word = 16'h3ec9;
              3'h5: pos_word = 16'h407b;
              3'h6: pos_word = 16'hbf99;
              3'h7: pos_word = 16'h3d99;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fd2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc018;
              3'h2: pos_word = 16'hbe69;
              3'h3: pos_word = 16'h3f62;
              3'h4: pos_word = 16'hc11f;
              3'h5: pos_word = 16'hbf14;
              3'h6: pos_word = 16'h3ee8;
              3'h7: pos_word = 16'h409f;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf8a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e02;
              3'h2: pos_word = 16'h3fec;
              3'h3: pos_word = 16'hc004;
              3'h4: pos_word = 16'hbe33;
              3'h5: pos_word = 16'h3f7b;
              3'h6: pos_word = 16'hc0d2;
              3'h7: pos_word = 16'hbf03;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f04;
            case (mant_lo3)
              3'h1: pos_word = 16'h40d8;
              3'h2: pos_word = 16'hbf79;
              3'h3: pos_word = 16'h3e37;
              3'h4: pos_word = 16'h4006;
              3'h5: pos_word = 16'hbfea;
              3'h6: pos_word = 16'hbdfb;
              3'h7: pos_word = 16'h3f8b;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc09c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee5;
              3'h2: pos_word = 16'h3f15;
              3'h3: pos_word = 16'h4126;
              3'h4: pos_word = 16'hbf60;
              3'h5: pos_word = 16'h3e6e;
              3'h6: pos_word = 16'h4019;
              3'h7: pos_word = 16'hbfd0;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbd91;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9a;
              3'h2: pos_word = 16'hc077;
              3'h3: pos_word = 16'hbec6;
              3'h4: pos_word = 16'h3f27;
              3'h5: pos_word = 16'h41b1;
              3'h6: pos_word = 16'hbf4a;
              3'h7: pos_word = 16'h3e93;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4033;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfba;
              3'h2: pos_word = 16'hbca0;
              3'h3: pos_word = 16'h3fab;
              3'h4: pos_word = 16'hc04b;
              3'h5: pos_word = 16'hbea9;
              3'h6: pos_word = 16'h3f3a;
              3'h7: pos_word = 16'hc327;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf36;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb0;
              3'h2: pos_word = 16'h4054;
              3'h3: pos_word = 16'hbfa7;
              3'h4: pos_word = 16'h3d01;
              3'h5: pos_word = 16'h3fbe;
              3'h6: pos_word = 16'hc02c;
              3'h7: pos_word = 16'hbe8c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hee: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf23;
              3'h2: pos_word = 16'h4082;
              3'h3: pos_word = 16'h3daa;
              3'h4: pos_word = 16'hc014;
              3'h5: pos_word = 16'h3f66;
              3'h6: pos_word = 16'hbf11;
              3'h7: pos_word = 16'h40a6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e0a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc002;
              3'h2: pos_word = 16'h3f7f;
              3'h3: pos_word = 16'hbf00;
              3'h4: pos_word = 16'h40e4;
              3'h5: pos_word = 16'h3e40;
              3'h6: pos_word = 16'hbfe5;
              3'h7: pos_word = 16'h3f8d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbee0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4135;
              3'h2: pos_word = 16'h3e76;
              3'h3: pos_word = 16'hbfcc;
              3'h4: pos_word = 16'h3f9c;
              3'h5: pos_word = 16'hbec2;
              3'h6: pos_word = 16'h41d7;
              3'h7: pos_word = 16'h3e97;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfb7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fae;
              3'h2: pos_word = 16'hbea4;
              3'h3: pos_word = 16'hc290;
              3'h4: pos_word = 16'h3eb4;
              3'h5: pos_word = 16'hbfa4;
              3'h6: pos_word = 16'h3fc2;
              3'h7: pos_word = 16'hbe88;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc176;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed2;
              3'h2: pos_word = 16'hbf94;
              3'h3: pos_word = 16'h3fd9;
              3'h4: pos_word = 16'hbe58;
              3'h5: pos_word = 16'hc109;
              3'h6: pos_word = 16'h3ef1;
              3'h7: pos_word = 16'hbf85;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3ff5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe22;
              3'h2: pos_word = 16'hc0be;
              3'h3: pos_word = 16'h3f09;
              3'h4: pos_word = 16'hbf71;
              3'h5: pos_word = 16'h400b;
              3'h6: pos_word = 16'hbdda;
              3'h7: pos_word = 16'hc090;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f1a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf59;
              3'h2: pos_word = 16'h4021;
              3'h3: pos_word = 16'hbd61;
              3'h4: pos_word = 16'hc068;
              3'h5: pos_word = 16'h3f2d;
              3'h6: pos_word = 16'hbf44;
              3'h7: pos_word = 16'h403c;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbb77;
            case (mant_lo3)
              3'h1: pos_word = 16'hc041;
              3'h2: pos_word = 16'h3f41;
              3'h3: pos_word = 16'hbf30;
              3'h4: pos_word = 16'h4061;
              3'h5: pos_word = 16'h3d42;
              3'h6: pos_word = 16'hc024;
              3'h7: pos_word = 16'h3f56;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf1d;
            case (mant_lo3)
              3'h1: pos_word = 16'h408b;
              3'h2: pos_word = 16'h3dca;
              3'h3: pos_word = 16'hc00e;
              3'h4: pos_word = 16'h3f6d;
              3'h5: pos_word = 16'hbf0c;
              3'h6: pos_word = 16'h40b5;
              3'h7: pos_word = 16'h3e1a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbffa;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f83;
              3'h2: pos_word = 16'hbef6;
              3'h3: pos_word = 16'h4101;
              3'h4: pos_word = 16'h3e50;
              3'h5: pos_word = 16'hbfdd;
              3'h6: pos_word = 16'h3f92;
              3'h7: pos_word = 16'hbed7;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h415c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e84;
              3'h2: pos_word = 16'hbfc5;
              3'h3: pos_word = 16'h3fa1;
              3'h4: pos_word = 16'hbeb8;
              3'h5: pos_word = 16'h423b;
              3'h6: pos_word = 16'h3ea0;
              3'h7: pos_word = 16'hbfb1;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fb4;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe9b;
              3'h2: pos_word = 16'hc207;
              3'h3: pos_word = 16'h3ebd;
              3'h4: pos_word = 16'hbf9f;
              3'h5: pos_word = 16'h3fc9;
              3'h6: pos_word = 16'hbe7e;
              3'h7: pos_word = 16'hc146;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3edc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf8f;
              3'h2: pos_word = 16'h3fe1;
              3'h3: pos_word = 16'hbe48;
              3'h4: pos_word = 16'hc0f1;
              3'h5: pos_word = 16'h3efb;
              3'h6: pos_word = 16'hbf81;
              3'h7: pos_word = 16'h3fff;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe12;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0ad;
              3'h2: pos_word = 16'h3f0e;
              3'h3: pos_word = 16'hbf69;
              3'h4: pos_word = 16'h4011;
              3'h5: pos_word = 16'hbdb9;
              3'h6: pos_word = 16'hc086;
              3'h7: pos_word = 16'h3f20;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf52;
            case (mant_lo3)
              3'h1: pos_word = 16'h4028;
              3'h2: pos_word = 16'hbd20;
              3'h3: pos_word = 16'hc05a;
              3'h4: pos_word = 16'h3f33;
              3'h5: pos_word = 16'hbf3d;
              3'h6: pos_word = 16'h4046;
              3'h7: pos_word = 16'h3c45;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc037;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f47;
              3'h2: pos_word = 16'hbf2a;
              3'h3: pos_word = 16'h406f;
              3'h4: pos_word = 16'h3d81;
              3'h5: pos_word = 16'hc01d;
              3'h6: pos_word = 16'h3f5d;
              3'h7: pos_word = 16'hbf18;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hef: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h4096;
            case (mant_lo3)
              3'h1: pos_word = 16'hc008;
              3'h2: pos_word = 16'hbf06;
              3'h3: pos_word = 16'h3e2b;
              3'h4: pos_word = 16'h3f88;
              3'h5: pos_word = 16'h4114;
              3'h6: pos_word = 16'hbfd5;
              3'h7: pos_word = 16'hbecd;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3e8c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa7;
              3'h2: pos_word = 16'h4331;
              3'h3: pos_word = 16'hbfab;
              3'h4: pos_word = 16'hbe93;
              3'h5: pos_word = 16'h3ec6;
              3'h6: pos_word = 16'h3fd0;
              3'h7: pos_word = 16'hc125;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf8b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe37;
              3'h2: pos_word = 16'h3f03;
              3'h3: pos_word = 16'h4005;
              3'h4: pos_word = 16'hc09f;
              3'h5: pos_word = 16'hbf62;
              3'h6: pos_word = 16'hbd99;
              3'h7: pos_word = 16'h3f26;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h4031;
            case (mant_lo3)
              3'h1: pos_word = 16'hc04e;
              3'h2: pos_word = 16'hbf37;
              3'h3: pos_word = 16'h3ce4;
              3'h4: pos_word = 16'h3f4e;
              3'h5: pos_word = 16'h407f;
              3'h6: pos_word = 16'hc016;
              3'h7: pos_word = 16'hbf12;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e06;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7d;
              3'h2: pos_word = 16'h40de;
              3'h3: pos_word = 16'hbfe7;
              3'h4: pos_word = 16'hbee2;
              3'h5: pos_word = 16'h3e72;
              3'h6: pos_word = 16'h3f9b;
              3'h7: pos_word = 16'h41c3;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbfb8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea6;
              3'h2: pos_word = 16'h3eb2;
              3'h3: pos_word = 16'h3fc0;
              3'h4: pos_word = 16'hc182;
              3'h5: pos_word = 16'hbf95;
              3'h6: pos_word = 16'hbe5c;
              3'h7: pos_word = 16'h3eef;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3ff3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0c2;
              3'h2: pos_word = 16'hbf73;
              3'h3: pos_word = 16'hbde2;
              3'h4: pos_word = 16'h3f19;
              3'h5: pos_word = 16'h401f;
              3'h6: pos_word = 16'hc06b;
              3'h7: pos_word = 16'hbf45;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbbf7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3f;
              3'h2: pos_word = 16'h405e;
              3'h3: pos_word = 16'hc026;
              3'h4: pos_word = 16'hbf1e;
              3'h5: pos_word = 16'h3dc3;
              3'h6: pos_word = 16'h3f6b;
              3'h7: pos_word = 16'h40b1;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbffc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef8;
              3'h2: pos_word = 16'h3e4c;
              3'h3: pos_word = 16'h3f90;
              3'h4: pos_word = 16'h4151;
              3'h5: pos_word = 16'hbfc7;
              3'h6: pos_word = 16'hbebb;
              3'h7: pos_word = 16'h3e9e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fb2;
            case (mant_lo3)
              3'h1: pos_word = 16'hc21a;
              3'h2: pos_word = 16'hbfa0;
              3'h3: pos_word = 16'hbe81;
              3'h4: pos_word = 16'h3ed9;
              3'h5: pos_word = 16'h3fdf;
              3'h6: pos_word = 16'hc0f8;
              3'h7: pos_word = 16'hbf82;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe16;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0d;
              3'h2: pos_word = 16'h4010;
              3'h3: pos_word = 16'hc088;
              3'h4: pos_word = 16'hbf54;
              3'h5: pos_word = 16'hbd30;
              3'h6: pos_word = 16'h3f31;
              3'h7: pos_word = 16'h4044;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc039;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2b;
              3'h2: pos_word = 16'h3d73;
              3'h3: pos_word = 16'h3f5b;
              3'h4: pos_word = 16'h4093;
              3'h5: pos_word = 16'hc00a;
              3'h6: pos_word = 16'hbf08;
              3'h7: pos_word = 16'h3e27;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f87;
            case (mant_lo3)
              3'h1: pos_word = 16'h410f;
              3'h2: pos_word = 16'hbfd7;
              3'h3: pos_word = 16'hbecf;
              3'h4: pos_word = 16'h3e8a;
              3'h5: pos_word = 16'h3fa6;
              3'h6: pos_word = 16'h42d4;
              3'h7: pos_word = 16'hbfac;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec4;
              3'h2: pos_word = 16'h3fce;
              3'h3: pos_word = 16'hc12c;
              3'h4: pos_word = 16'hbf8c;
              3'h5: pos_word = 16'hbe3b;
              3'h6: pos_word = 16'h3f01;
              3'h7: pos_word = 16'h4003;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc0a2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf64;
              3'h2: pos_word = 16'hbda1;
              3'h3: pos_word = 16'h3f24;
              3'h4: pos_word = 16'h402f;
              3'h5: pos_word = 16'hc051;
              3'h6: pos_word = 16'hbf39;
              3'h7: pos_word = 16'h3cc5;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f4c;
            case (mant_lo3)
              3'h1: pos_word = 16'h407b;
              3'h2: pos_word = 16'hc018;
              3'h3: pos_word = 16'hbf13;
              3'h4: pos_word = 16'h3e02;
              3'h5: pos_word = 16'h3f7b;
              3'h6: pos_word = 16'h40d8;
              3'h7: pos_word = 16'hbfe9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf0: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbee5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9a;
              3'h2: pos_word = 16'hbfba;
              3'h3: pos_word = 16'h3eb0;
              3'h4: pos_word = 16'hc18b;
              3'h5: pos_word = 16'hbe60;
              3'h6: pos_word = 16'h3ff1;
              3'h7: pos_word = 16'hbf74;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f18;
            case (mant_lo3)
              3'h1: pos_word = 16'hc06f;
              3'h2: pos_word = 16'hbc39;
              3'h3: pos_word = 16'h405b;
              3'h4: pos_word = 16'hbf20;
              3'h5: pos_word = 16'h3f6a;
              3'h6: pos_word = 16'hbffe;
              3'h7: pos_word = 16'h3e48;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4147;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebd;
              3'h2: pos_word = 16'h3fb1;
              3'h3: pos_word = 16'hbfa1;
              3'h4: pos_word = 16'h3ed7;
              3'h5: pos_word = 16'hc100;
              3'h6: pos_word = 16'hbe1a;
              3'h7: pos_word = 16'h400e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf56;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f30;
              3'h2: pos_word = 16'hc03c;
              3'h3: pos_word = 16'h3d64;
              3'h4: pos_word = 16'h4091;
              3'h5: pos_word = 16'hbf09;
              3'h6: pos_word = 16'h3f86;
              3'h7: pos_word = 16'hbfd9;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e88;
            case (mant_lo3)
              3'h1: pos_word = 16'h4297;
              3'h2: pos_word = 16'hbe97;
              3'h3: pos_word = 16'h3fcc;
              3'h4: pos_word = 16'hbf8d;
              3'h5: pos_word = 16'h3f00;
              3'h6: pos_word = 16'hc0a5;
              3'h7: pos_word = 16'hbda8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h402d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3a;
              3'h2: pos_word = 16'h3f4a;
              3'h3: pos_word = 16'hc019;
              3'h4: pos_word = 16'h3dfc;
              3'h5: pos_word = 16'h40d3;
              3'h6: pos_word = 16'hbee7;
              3'h7: pos_word = 16'h3f99;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbfbb;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eae;
              3'h2: pos_word = 16'hc195;
              3'h3: pos_word = 16'hbe65;
              3'h4: pos_word = 16'h3fee;
              3'h5: pos_word = 16'hbf76;
              3'h6: pos_word = 16'h3f16;
              3'h7: pos_word = 16'hc072;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbc77;
            case (mant_lo3)
              3'h1: pos_word = 16'h4058;
              3'h2: pos_word = 16'hbf21;
              3'h3: pos_word = 16'h3f68;
              3'h4: pos_word = 16'hc000;
              3'h5: pos_word = 16'h3e44;
              3'h6: pos_word = 16'h413e;
              3'h7: pos_word = 16'hbebf;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3faf;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfa3;
              3'h2: pos_word = 16'h3ed5;
              3'h3: pos_word = 16'hc104;
              3'h4: pos_word = 16'hbe1e;
              3'h5: pos_word = 16'h400d;
              3'h6: pos_word = 16'hbf57;
              3'h7: pos_word = 16'h3f2f;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc03e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d54;
              3'h2: pos_word = 16'h408e;
              3'h3: pos_word = 16'hbf0a;
              3'h4: pos_word = 16'h3f85;
              3'h5: pos_word = 16'hbfdb;
              3'h6: pos_word = 16'h3e86;
              3'h7: pos_word = 16'h426c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbe99;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcb;
              3'h2: pos_word = 16'hbf8e;
              3'h3: pos_word = 16'h3efe;
              3'h4: pos_word = 16'hc0a9;
              3'h5: pos_word = 16'hbdb0;
              3'h6: pos_word = 16'h402b;
              3'h7: pos_word = 16'hbf3c;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f49;
            case (mant_lo3)
              3'h1: pos_word = 16'hc01b;
              3'h2: pos_word = 16'h3df4;
              3'h3: pos_word = 16'h40cd;
              3'h4: pos_word = 16'hbee9;
              3'h5: pos_word = 16'h3f98;
              3'h6: pos_word = 16'hbfbd;
              3'h7: pos_word = 16'h3eab;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc1a0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe69;
              3'h2: pos_word = 16'h3fec;
              3'h3: pos_word = 16'hbf78;
              3'h4: pos_word = 16'h3f15;
              3'h5: pos_word = 16'hc076;
              3'h6: pos_word = 16'hbc9b;
              3'h7: pos_word = 16'h4055;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f66;
              3'h2: pos_word = 16'hc002;
              3'h3: pos_word = 16'h3e40;
              3'h4: pos_word = 16'h4136;
              3'h5: pos_word = 16'hbec1;
              3'h6: pos_word = 16'h3fae;
              3'h7: pos_word = 16'hbfa4;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3ed3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc108;
              3'h2: pos_word = 16'hbe22;
              3'h3: pos_word = 16'h400c;
              3'h4: pos_word = 16'hbf59;
              3'h5: pos_word = 16'h3f2d;
              3'h6: pos_word = 16'hc040;
              3'h7: pos_word = 16'h3d45;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h408c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf0b;
              3'h2: pos_word = 16'h3f84;
              3'h3: pos_word = 16'hbfdd;
              3'h4: pos_word = 16'h3e84;
              3'h5: pos_word = 16'h4241;
              3'h6: pos_word = 16'hbe9b;
              3'h7: pos_word = 16'h3fc9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf1: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf8f;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0ac;
              3'h2: pos_word = 16'h4029;
              3'h3: pos_word = 16'h3f47;
              3'h4: pos_word = 16'h3dec;
              3'h5: pos_word = 16'hbeec;
              3'h6: pos_word = 16'hbfbe;
              3'h7: pos_word = 16'hc1ad;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3fea;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f14;
              3'h2: pos_word = 16'hbcb9;
              3'h3: pos_word = 16'hbf24;
              3'h4: pos_word = 16'hc003;
              3'h5: pos_word = 16'h412f;
              3'h6: pos_word = 16'h3fad;
              3'h7: pos_word = 16'h3ed0;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe25;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5b;
              3'h2: pos_word = 16'hc043;
              3'h3: pos_word = 16'h4089;
              3'h4: pos_word = 16'h3f83;
              3'h5: pos_word = 16'h3e82;
              3'h6: pos_word = 16'hbe9d;
              3'h7: pos_word = 16'hbf90;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc0b0;
            case (mant_lo3)
              3'h1: pos_word = 16'h4027;
              3'h2: pos_word = 16'h3f46;
              3'h3: pos_word = 16'h3de5;
              3'h4: pos_word = 16'hbeee;
              3'h5: pos_word = 16'hbfc0;
              3'h6: pos_word = 16'hc1bd;
              3'h7: pos_word = 16'h3fe8;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f13;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcd8;
              3'h2: pos_word = 16'hbf25;
              3'h3: pos_word = 16'hc004;
              3'h4: pos_word = 16'h4128;
              3'h5: pos_word = 16'h3fab;
              3'h6: pos_word = 16'h3ece;
              3'h7: pos_word = 16'hbe29;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf5c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc045;
              3'h2: pos_word = 16'h4087;
              3'h3: pos_word = 16'h3f82;
              3'h4: pos_word = 16'h3e80;
              3'h5: pos_word = 16'hbe9f;
              3'h6: pos_word = 16'hbf91;
              3'h7: pos_word = 16'hc0b4;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h4025;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f44;
              3'h2: pos_word = 16'h3ddd;
              3'h3: pos_word = 16'hbef0;
              3'h4: pos_word = 16'hbfc1;
              3'h5: pos_word = 16'hc1cf;
              3'h6: pos_word = 16'h3fe6;
              3'h7: pos_word = 16'h3f11;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbcf7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf27;
              3'h2: pos_word = 16'hc005;
              3'h3: pos_word = 16'h4121;
              3'h4: pos_word = 16'h3faa;
              3'h5: pos_word = 16'h3ecc;
              3'h6: pos_word = 16'hbe2d;
              3'h7: pos_word = 16'hbf5e;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc048;
            case (mant_lo3)
              3'h1: pos_word = 16'h4085;
              3'h2: pos_word = 16'h3f81;
              3'h3: pos_word = 16'h3e7c;
              3'h4: pos_word = 16'hbea1;
              3'h5: pos_word = 16'hbf92;
              3'h6: pos_word = 16'hc0b8;
              3'h7: pos_word = 16'h4023;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f43;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dd5;
              3'h2: pos_word = 16'hbef3;
              3'h3: pos_word = 16'hbfc3;
              3'h4: pos_word = 16'hc1e6;
              3'h5: pos_word = 16'h3fe4;
              3'h6: pos_word = 16'h3f10;
              3'h7: pos_word = 16'hbd0b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf28;
            case (mant_lo3)
              3'h1: pos_word = 16'hc007;
              3'h2: pos_word = 16'h411b;
              3'h3: pos_word = 16'h3fa9;
              3'h4: pos_word = 16'h3eca;
              3'h5: pos_word = 16'hbe31;
              3'h6: pos_word = 16'hbf60;
              3'h7: pos_word = 16'hc04a;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4083;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f7f;
              3'h2: pos_word = 16'h3e78;
              3'h3: pos_word = 16'hbea3;
              3'h4: pos_word = 16'hbf93;
              3'h5: pos_word = 16'hc0bc;
              3'h6: pos_word = 16'h4021;
              3'h7: pos_word = 16'h3f41;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3dcd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbef5;
              3'h2: pos_word = 16'hbfc4;
              3'h3: pos_word = 16'hc201;
              3'h4: pos_word = 16'h3fe2;
              3'h5: pos_word = 16'h3f0f;
              3'h6: pos_word = 16'hbd1b;
              3'h7: pos_word = 16'hbf29;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc008;
            case (mant_lo3)
              3'h1: pos_word = 16'h4116;
              3'h2: pos_word = 16'h3fa7;
              3'h3: pos_word = 16'h3ec7;
              3'h4: pos_word = 16'hbe35;
              3'h5: pos_word = 16'hbf61;
              3'h6: pos_word = 16'hc04d;
              3'h7: pos_word = 16'h4080;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f7d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e74;
              3'h2: pos_word = 16'hbea6;
              3'h3: pos_word = 16'hbf94;
              3'h4: pos_word = 16'hc0c0;
              3'h5: pos_word = 16'h401f;
              3'h6: pos_word = 16'h3f40;
              3'h7: pos_word = 16'h3dc5;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbef8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfc6;
              3'h2: pos_word = 16'hc213;
              3'h3: pos_word = 16'h3fe0;
              3'h4: pos_word = 16'h3f0e;
              3'h5: pos_word = 16'hbd2a;
              3'h6: pos_word = 16'hbf2b;
              3'h7: pos_word = 16'hc009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf2: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h4110;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec5;
              3'h2: pos_word = 16'hbf63;
              3'h3: pos_word = 16'h407d;
              3'h4: pos_word = 16'h3e70;
              3'h5: pos_word = 16'hbf96;
              3'h6: pos_word = 16'h401e;
              3'h7: pos_word = 16'h3dbe;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbfc8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fde;
              3'h2: pos_word = 16'hbd3a;
              3'h3: pos_word = 16'hc00b;
              3'h4: pos_word = 16'h3fa5;
              3'h5: pos_word = 16'hbe3d;
              3'h6: pos_word = 16'hc053;
              3'h7: pos_word = 16'h3f7a;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbeaa;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0ca;
              3'h2: pos_word = 16'h3f3d;
              3'h3: pos_word = 16'hbefc;
              3'h4: pos_word = 16'hc24b;
              3'h5: pos_word = 16'h3f0b;
              3'h6: pos_word = 16'hbf2d;
              3'h7: pos_word = 16'h4107;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3ec1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf67;
              3'h2: pos_word = 16'h4075;
              3'h3: pos_word = 16'h3e68;
              3'h4: pos_word = 16'hbf98;
              3'h5: pos_word = 16'h401a;
              3'h6: pos_word = 16'h3dae;
              3'h7: pos_word = 16'hbfcb;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fda;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd59;
              3'h2: pos_word = 16'hc00d;
              3'h3: pos_word = 16'h3fa2;
              3'h4: pos_word = 16'hbe45;
              3'h5: pos_word = 16'hc059;
              3'h6: pos_word = 16'h3f76;
              3'h7: pos_word = 16'hbeae;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc0d4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'hbf01;
              3'h3: pos_word = 16'hc2a4;
              3'h4: pos_word = 16'h3f09;
              3'h5: pos_word = 16'hbf30;
              3'h6: pos_word = 16'h40fe;
              3'h7: pos_word = 16'h3ebc;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf6a;
            case (mant_lo3)
              3'h1: pos_word = 16'h406e;
              3'h2: pos_word = 16'h3e5f;
              3'h3: pos_word = 16'hbf9a;
              3'h4: pos_word = 16'h4017;
              3'h5: pos_word = 16'h3d9e;
              3'h6: pos_word = 16'hbfce;
              3'h7: pos_word = 16'h3fd6;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbd78;
            case (mant_lo3)
              3'h1: pos_word = 16'hc010;
              3'h2: pos_word = 16'h3fa0;
              3'h3: pos_word = 16'hbe4d;
              3'h4: pos_word = 16'hc05f;
              3'h5: pos_word = 16'h3f72;
              3'h6: pos_word = 16'hbeb3;
              3'h7: pos_word = 16'hc0df;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f37;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf03;
              3'h2: pos_word = 16'hc357;
              3'h3: pos_word = 16'h3f06;
              3'h4: pos_word = 16'hbf33;
              3'h5: pos_word = 16'h40ef;
              3'h6: pos_word = 16'h3eb8;
              3'h7: pos_word = 16'hbf6e;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h4067;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e57;
              3'h2: pos_word = 16'hbf9d;
              3'h3: pos_word = 16'h4014;
              3'h4: pos_word = 16'h3d8f;
              3'h5: pos_word = 16'hbfd2;
              3'h6: pos_word = 16'h3fd3;
              3'h7: pos_word = 16'hbd8b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc013;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9d;
              3'h2: pos_word = 16'hbe55;
              3'h3: pos_word = 16'hc065;
              3'h4: pos_word = 16'h3f6e;
              3'h5: pos_word = 16'hbeb7;
              3'h6: pos_word = 16'hc0ec;
              3'h7: pos_word = 16'h3f34;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf05;
            case (mant_lo3)
              3'h1: pos_word = 16'h43ad;
              3'h2: pos_word = 16'h3f04;
              3'h3: pos_word = 16'hbf36;
              3'h4: pos_word = 16'h40e2;
              3'h5: pos_word = 16'h3eb4;
              3'h6: pos_word = 16'hbf71;
              3'h7: pos_word = 16'h4060;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e4f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf9f;
              3'h2: pos_word = 16'h4011;
              3'h3: pos_word = 16'h3d7f;
              3'h4: pos_word = 16'hbfd6;
              3'h5: pos_word = 16'h3fcf;
              3'h6: pos_word = 16'hbd9b;
              3'h7: pos_word = 16'hc016;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f9b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5d;
              3'h2: pos_word = 16'hc06c;
              3'h3: pos_word = 16'h3f6b;
              3'h4: pos_word = 16'hbebb;
              3'h5: pos_word = 16'hc0fa;
              3'h6: pos_word = 16'h3f31;
              3'h7: pos_word = 16'hbf08;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h42c0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f01;
              3'h2: pos_word = 16'hbf39;
              3'h3: pos_word = 16'h40d7;
              3'h4: pos_word = 16'h3eaf;
              3'h5: pos_word = 16'hbf75;
              3'h6: pos_word = 16'h405a;
              3'h7: pos_word = 16'h3e47;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfa2;
            case (mant_lo3)
              3'h1: pos_word = 16'h400e;
              3'h2: pos_word = 16'h3d60;
              3'h3: pos_word = 16'hbfd9;
              3'h4: pos_word = 16'h3fcc;
              3'h5: pos_word = 16'hbdaa;
              3'h6: pos_word = 16'hc01a;
              3'h7: pos_word = 16'h3f98;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf3: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbe66;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f67;
              3'h2: pos_word = 16'hc105;
              3'h3: pos_word = 16'hbf0a;
              3'h4: pos_word = 16'h3efe;
              3'h5: pos_word = 16'h40cc;
              3'h6: pos_word = 16'hbf79;
              3'h7: pos_word = 16'h3e3f;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h400b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfdd;
              3'h2: pos_word = 16'hbdba;
              3'h3: pos_word = 16'h3f96;
              3'h4: pos_word = 16'hc07b;
              3'h5: pos_word = 16'hbec4;
              3'h6: pos_word = 16'h3f2b;
              3'h7: pos_word = 16'h421d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf3f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ea7;
              3'h2: pos_word = 16'h404e;
              3'h3: pos_word = 16'hbfa7;
              3'h4: pos_word = 16'h3d22;
              3'h5: pos_word = 16'h3fc5;
              3'h6: pos_word = 16'hc020;
              3'h7: pos_word = 16'hbe76;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f60;
            case (mant_lo3)
              3'h1: pos_word = 16'hc119;
              3'h2: pos_word = 16'hbf0f;
              3'h3: pos_word = 16'h3ef4;
              3'h4: pos_word = 16'h40ba;
              3'h5: pos_word = 16'hbf80;
              3'h6: pos_word = 16'h3e2f;
              3'h7: pos_word = 16'h4006;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbfe5;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdd9;
              3'h2: pos_word = 16'h3f92;
              3'h3: pos_word = 16'hc086;
              3'h4: pos_word = 16'hbecd;
              3'h5: pos_word = 16'h3f26;
              3'h6: pos_word = 16'h41c5;
              3'h7: pos_word = 16'hbf45;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3e9e;
            case (mant_lo3)
              3'h1: pos_word = 16'h4044;
              3'h2: pos_word = 16'hbfac;
              3'h3: pos_word = 16'h3cc8;
              3'h4: pos_word = 16'h3fbf;
              3'h5: pos_word = 16'hc028;
              3'h6: pos_word = 16'hbe83;
              3'h7: pos_word = 16'h3f5a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc132;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf15;
              3'h2: pos_word = 16'h3eeb;
              3'h3: pos_word = 16'h40aa;
              3'h4: pos_word = 16'hbf84;
              3'h5: pos_word = 16'h3e1f;
              3'h6: pos_word = 16'h4001;
              3'h7: pos_word = 16'hbfed;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbdf8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8d;
              3'h2: pos_word = 16'hc08f;
              3'h3: pos_word = 16'hbed6;
              3'h4: pos_word = 16'h3f20;
              3'h5: pos_word = 16'h418f;
              3'h6: pos_word = 16'hbf4b;
              3'h7: pos_word = 16'h3e96;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h403a;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb2;
              3'h2: pos_word = 16'h3c19;
              3'h3: pos_word = 16'h3fb9;
              3'h4: pos_word = 16'hc030;
              3'h5: pos_word = 16'hbe8b;
              3'h6: pos_word = 16'h3f53;
              3'h7: pos_word = 16'hc157;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf1a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee1;
              3'h2: pos_word = 16'h409d;
              3'h3: pos_word = 16'hbf88;
              3'h4: pos_word = 16'h3e10;
              3'h5: pos_word = 16'h3ff8;
              3'h6: pos_word = 16'hbff6;
              3'h7: pos_word = 16'hbe0c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f89;
            case (mant_lo3)
              3'h1: pos_word = 16'hc09a;
              3'h2: pos_word = 16'hbedf;
              3'h3: pos_word = 16'h3f1b;
              3'h4: pos_word = 16'h4162;
              3'h5: pos_word = 16'hbf52;
              3'h6: pos_word = 16'h3e8d;
              3'h7: pos_word = 16'h4032;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfb7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbbbd;
              3'h2: pos_word = 16'h3fb3;
              3'h3: pos_word = 16'hc038;
              3'h4: pos_word = 16'hbe94;
              3'h5: pos_word = 16'h3f4d;
              3'h6: pos_word = 16'hc187;
              3'h7: pos_word = 16'hbf1f;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3ed8;
            case (mant_lo3)
              3'h1: pos_word = 16'h4092;
              3'h2: pos_word = 16'hbf8c;
              3'h3: pos_word = 16'h3e00;
              3'h4: pos_word = 16'h3fef;
              3'h5: pos_word = 16'hc000;
              3'h6: pos_word = 16'hbe1c;
              3'h7: pos_word = 16'h3f85;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hc0a7;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee8;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h413a;
              3'h4: pos_word = 16'hbf58;
              3'h5: pos_word = 16'h3e85;
              3'h6: pos_word = 16'h402a;
              3'h7: pos_word = 16'hbfbd;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbcab;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fad;
              3'h2: pos_word = 16'hc042;
              3'h3: pos_word = 16'hbe9c;
              3'h4: pos_word = 16'h3f46;
              3'h5: pos_word = 16'hc1b5;
              3'h6: pos_word = 16'hbf25;
              3'h7: pos_word = 16'h3ecf;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4088;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf91;
              3'h2: pos_word = 16'h3de0;
              3'h3: pos_word = 16'h3fe7;
              3'h4: pos_word = 16'hc005;
              3'h5: pos_word = 16'hbe2c;
              3'h6: pos_word = 16'h3f81;
              3'h7: pos_word = 16'hc0b6;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf4: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbef2;
            case (mant_lo3)
              3'h1: pos_word = 16'h411e;
              3'h2: pos_word = 16'h3e7a;
              3'h3: pos_word = 16'hbfc4;
              3'h4: pos_word = 16'h3fa8;
              3'h5: pos_word = 16'hbea5;
              3'h6: pos_word = 16'hc20a;
              3'h7: pos_word = 16'h3ec6;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf95;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fdf;
              3'h2: pos_word = 16'hbe3b;
              3'h3: pos_word = 16'hc0c7;
              3'h4: pos_word = 16'h3f0c;
              3'h5: pos_word = 16'hbf66;
              3'h6: pos_word = 16'h401b;
              3'h7: pos_word = 16'hbd51;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc057;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3a;
              3'h2: pos_word = 16'hbf30;
              3'h3: pos_word = 16'h406f;
              3'h4: pos_word = 16'h3da2;
              3'h5: pos_word = 16'hc010;
              3'h6: pos_word = 16'h3f73;
              3'h7: pos_word = 16'hbf02;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h40f3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e59;
              3'h2: pos_word = 16'hbfd1;
              3'h3: pos_word = 16'h3f9e;
              3'h4: pos_word = 16'hbeb6;
              3'h5: pos_word = 16'h4461;
              3'h6: pos_word = 16'h3eb5;
              3'h7: pos_word = 16'hbf9f;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fd0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe5c;
              3'h2: pos_word = 16'hc0f7;
              3'h3: pos_word = 16'h3f02;
              3'h4: pos_word = 16'hbf74;
              3'h5: pos_word = 16'h400f;
              3'h6: pos_word = 16'hbda7;
              3'h7: pos_word = 16'hc072;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f2f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3b;
              3'h2: pos_word = 16'h4055;
              3'h3: pos_word = 16'h3d48;
              3'h4: pos_word = 16'hc01c;
              3'h5: pos_word = 16'h3f65;
              3'h6: pos_word = 16'hbf0c;
              3'h7: pos_word = 16'h40c5;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3e39;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe0;
              3'h2: pos_word = 16'h3f94;
              3'h3: pos_word = 16'hbec7;
              3'h4: pos_word = 16'h4200;
              3'h5: pos_word = 16'h3ea3;
              3'h6: pos_word = 16'hbfa9;
              3'h7: pos_word = 16'h3fc3;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbe7c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc122;
              3'h2: pos_word = 16'h3ef0;
              3'h3: pos_word = 16'hbf82;
              3'h4: pos_word = 16'h4004;
              3'h5: pos_word = 16'hbde5;
              3'h6: pos_word = 16'hc089;
              3'h7: pos_word = 16'h3f24;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hbf47;
            case (mant_lo3)
              3'h1: pos_word = 16'h4040;
              3'h2: pos_word = 16'h3c99;
              3'h3: pos_word = 16'hc02b;
              3'h4: pos_word = 16'h3f57;
              3'h5: pos_word = 16'hbf17;
              3'h6: pos_word = 16'h40a5;
              3'h7: pos_word = 16'h3e19;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbff1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8c;
              3'h2: pos_word = 16'hbed9;
              3'h3: pos_word = 16'h4182;
              3'h4: pos_word = 16'h3e93;
              3'h5: pos_word = 16'hbfb4;
              3'h6: pos_word = 16'h3fb6;
              3'h7: pos_word = 16'hbe8f;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc169;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ede;
              3'h2: pos_word = 16'hbf8a;
              3'h3: pos_word = 16'h3ff5;
              3'h4: pos_word = 16'hbe12;
              3'h5: pos_word = 16'hc09f;
              3'h6: pos_word = 16'h3f19;
              3'h7: pos_word = 16'hbf54;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h402e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbc3d;
              3'h2: pos_word = 16'hc03c;
              3'h3: pos_word = 16'h3f4a;
              3'h4: pos_word = 16'hbf21;
              3'h5: pos_word = 16'h408e;
              3'h6: pos_word = 16'h3df4;
              3'h7: pos_word = 16'hc002;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f83;
            case (mant_lo3)
              3'h1: pos_word = 16'hbeec;
              3'h2: pos_word = 16'h412e;
              3'h3: pos_word = 16'h3e82;
              3'h4: pos_word = 16'hbfc0;
              3'h5: pos_word = 16'h3fab;
              3'h6: pos_word = 16'hbe9f;
              3'h7: pos_word = 16'hc1d0;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3ecc;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf92;
              3'h2: pos_word = 16'h3fe4;
              3'h3: pos_word = 16'hbe32;
              3'h4: pos_word = 16'hc0bc;
              3'h5: pos_word = 16'h3f0f;
              3'h6: pos_word = 16'hbf61;
              3'h7: pos_word = 16'h401f;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbd2b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc050;
              3'h2: pos_word = 16'h3f3e;
              3'h3: pos_word = 16'hbf2c;
              3'h4: pos_word = 16'h4079;
              3'h5: pos_word = 16'h3db5;
              3'h6: pos_word = 16'hc00c;
              3'h7: pos_word = 16'h3f78;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbeff;
            case (mant_lo3)
              3'h1: pos_word = 16'h4103;
              3'h2: pos_word = 16'h3e63;
              3'h3: pos_word = 16'hbfcd;
              3'h4: pos_word = 16'h3fa1;
              3'h5: pos_word = 16'hbeb0;
              3'h6: pos_word = 16'hc2f4;
              3'h7: pos_word = 16'h3eba;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf5: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf9c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe52;
              3'h2: pos_word = 16'h3f05;
              3'h3: pos_word = 16'h4012;
              3'h4: pos_word = 16'hc069;
              3'h5: pos_word = 16'hbf38;
              3'h6: pos_word = 16'h3d6e;
              3'h7: pos_word = 16'h3f69;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h40d1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfdb;
              3'h2: pos_word = 16'hbec2;
              3'h3: pos_word = 16'h3ea9;
              3'h4: pos_word = 16'h3fc7;
              3'h5: pos_word = 16'hc113;
              3'h6: pos_word = 16'hbf7e;
              3'h7: pos_word = 16'hbdd2;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f27;
            case (mant_lo3)
              3'h1: pos_word = 16'h4046;
              3'h2: pos_word = 16'hc026;
              3'h3: pos_word = 16'hbf13;
              3'h4: pos_word = 16'h3e23;
              3'h5: pos_word = 16'h3f8e;
              3'h6: pos_word = 16'h4199;
              3'h7: pos_word = 16'hbfb0;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbe89;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee3;
              3'h2: pos_word = 16'h3ffa;
              3'h3: pos_word = 16'hc098;
              3'h4: pos_word = 16'hbf50;
              3'h5: pos_word = 16'hbb12;
              3'h6: pos_word = 16'h3f4e;
              3'h7: pos_word = 16'h4094;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbffd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbee6;
              3'h2: pos_word = 16'h3e87;
              3'h3: pos_word = 16'h3faf;
              3'h4: pos_word = 16'hc1a8;
              3'h5: pos_word = 16'hbf90;
              3'h6: pos_word = 16'hbe28;
              3'h7: pos_word = 16'h3f12;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h4024;
            case (mant_lo3)
              3'h1: pos_word = 16'hc049;
              3'h2: pos_word = 16'hbf29;
              3'h3: pos_word = 16'h3dc9;
              3'h4: pos_word = 16'h3f7c;
              3'h5: pos_word = 16'h410e;
              3'h6: pos_word = 16'hbfc9;
              3'h7: pos_word = 16'hbeab;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3ebf;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd9;
              3'h2: pos_word = 16'hc0d7;
              3'h3: pos_word = 16'hbf6b;
              3'h4: pos_word = 16'hbd80;
              3'h5: pos_word = 16'h3f36;
              3'h6: pos_word = 16'h4065;
              3'h7: pos_word = 16'hc014;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf06;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e4d;
              3'h2: pos_word = 16'h3f9a;
              3'h3: pos_word = 16'h429e;
              3'h4: pos_word = 16'hbfa2;
              3'h5: pos_word = 16'hbe68;
              3'h6: pos_word = 16'h3efc;
              3'h7: pos_word = 16'h400a;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc07d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf40;
              3'h2: pos_word = 16'h3d19;
              3'h3: pos_word = 16'h3f5f;
              3'h4: pos_word = 16'h40b7;
              3'h5: pos_word = 16'hbfe6;
              3'h6: pos_word = 16'hbece;
              3'h7: pos_word = 16'h3e9d;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fbe;
            case (mant_lo3)
              3'h1: pos_word = 16'hc137;
              3'h2: pos_word = 16'hbf85;
              3'h3: pos_word = 16'hbdfd;
              3'h4: pos_word = 16'h3f20;
              3'h5: pos_word = 16'h4039;
              3'h6: pos_word = 16'hc031;
              3'h7: pos_word = 16'hbf1b;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3e0d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f88;
              3'h2: pos_word = 16'h415b;
              3'h3: pos_word = 16'hbfb8;
              3'h4: pos_word = 16'hbe95;
              3'h5: pos_word = 16'h3ed7;
              3'h6: pos_word = 16'h3fee;
              3'h7: pos_word = 16'hc0a9;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf59;
            case (mant_lo3)
              3'h1: pos_word = 16'hbcbd;
              3'h2: pos_word = 16'h3f46;
              3'h3: pos_word = 16'h4087;
              3'h4: pos_word = 16'hc005;
              3'h5: pos_word = 16'hbef3;
              3'h6: pos_word = 16'h3e77;
              3'h7: pos_word = 16'h3fa7;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc215;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf96;
              3'h2: pos_word = 16'hbe3e;
              3'h3: pos_word = 16'h3f0b;
              3'h4: pos_word = 16'h401a;
              3'h5: pos_word = 16'hc059;
              3'h6: pos_word = 16'hbf30;
              3'h7: pos_word = 16'h3d9e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h3f72;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ef;
              3'h2: pos_word = 16'hbfd2;
              3'h3: pos_word = 16'hbeb7;
              3'h4: pos_word = 16'h3eb3;
              3'h5: pos_word = 16'h3fcf;
              3'h6: pos_word = 16'hc0fb;
              3'h7: pos_word = 16'hbf75;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbdab;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f2e;
              3'h2: pos_word = 16'h4054;
              3'h3: pos_word = 16'hc01d;
              3'h4: pos_word = 16'hbf0d;
              3'h5: pos_word = 16'h3e37;
              3'h6: pos_word = 16'h3f94;
              3'h7: pos_word = 16'h41ef;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfa9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe7f;
              3'h2: pos_word = 16'h3eef;
              3'h3: pos_word = 16'h4003;
              3'h4: pos_word = 16'hc08b;
              3'h5: pos_word = 16'hbf48;
              3'h6: pos_word = 16'h3c86;
              3'h7: pos_word = 16'h3f56;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf6: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h40a3;
            case (mant_lo3)
              3'h1: pos_word = 16'hbedb;
              3'h2: pos_word = 16'h3fb6;
              3'h3: pos_word = 16'hbf8a;
              3'h4: pos_word = 16'h3f18;
              3'h5: pos_word = 16'hc03d;
              3'h6: pos_word = 16'h3def;
              3'h7: pos_word = 16'h412a;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbea1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fe3;
              3'h2: pos_word = 16'hbf62;
              3'h3: pos_word = 16'h3f3d;
              3'h4: pos_word = 16'hc00d;
              3'h5: pos_word = 16'h3e61;
              3'h6: pos_word = 16'hc327;
              3'h7: pos_word = 16'hbe54;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4012;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf38;
              3'h2: pos_word = 16'h3f68;
              3'h3: pos_word = 16'hbfdc;
              3'h4: pos_word = 16'h3ea7;
              3'h5: pos_word = 16'hc117;
              3'h6: pos_word = 16'hbdd6;
              3'h7: pos_word = 16'h4045;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbf14;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8e;
              3'h2: pos_word = 16'hbfb1;
              3'h3: pos_word = 16'h3ee2;
              3'h4: pos_word = 16'hc099;
              3'h5: pos_word = 16'hbb92;
              3'h6: pos_word = 16'h4093;
              3'h7: pos_word = 16'hbee8;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3fae;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf90;
              3'h2: pos_word = 16'h3f11;
              3'h3: pos_word = 16'hc04b;
              3'h4: pos_word = 16'h3dc4;
              3'h5: pos_word = 16'h410b;
              3'h6: pos_word = 16'hbeac;
              3'h7: pos_word = 16'h3fd8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf6c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f35;
              3'h2: pos_word = 16'hc015;
              3'h3: pos_word = 16'h3e4b;
              3'h4: pos_word = 16'h4286;
              3'h5: pos_word = 16'hbe6a;
              3'h6: pos_word = 16'h400a;
              3'h7: pos_word = 16'hbf41;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3f5e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe7;
              3'h2: pos_word = 16'h3e9c;
              3'h3: pos_word = 16'hc13c;
              3'h4: pos_word = 16'hbe01;
              3'h5: pos_word = 16'h4038;
              3'h6: pos_word = 16'hbf1b;
              3'h7: pos_word = 16'h3f88;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbfb9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ed5;
              3'h2: pos_word = 16'hc0ab;
              3'h3: pos_word = 16'hbccf;
              3'h4: pos_word = 16'h4085;
              3'h5: pos_word = 16'hbef5;
              3'h6: pos_word = 16'h3fa6;
              3'h7: pos_word = 16'hbf96;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f0a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc05b;
              3'h2: pos_word = 16'h3d99;
              3'h3: pos_word = 16'h40eb;
              3'h4: pos_word = 16'hbeb8;
              3'h5: pos_word = 16'h3fce;
              3'h6: pos_word = 16'hbf76;
              3'h7: pos_word = 16'h3f2d;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hc01e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e34;
              3'h2: pos_word = 16'h41e0;
              3'h3: pos_word = 16'hbe80;
              3'h4: pos_word = 16'h4002;
              3'h5: pos_word = 16'hbf49;
              3'h6: pos_word = 16'h3f55;
              3'h7: pos_word = 16'hbff3;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3e90;
            case (mant_lo3)
              3'h1: pos_word = 16'hc179;
              3'h2: pos_word = 16'hbe17;
              3'h3: pos_word = 16'h402c;
              3'h4: pos_word = 16'hbf23;
              3'h5: pos_word = 16'h3f82;
              3'h6: pos_word = 16'hbfc2;
              3'h7: pos_word = 16'h3ec9;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hc0c1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbd3d;
              3'h2: pos_word = 16'h4074;
              3'h3: pos_word = 16'hbf01;
              3'h4: pos_word = 16'h3f9f;
              3'h5: pos_word = 16'hbf9d;
              3'h6: pos_word = 16'h3f03;
              3'h7: pos_word = 16'hc06d;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3d5c;
            case (mant_lo3)
              3'h1: pos_word = 16'h40cb;
              3'h2: pos_word = 16'hbec5;
              3'h3: pos_word = 16'h3fc5;
              3'h4: pos_word = 16'hbf80;
              3'h5: pos_word = 16'h3f25;
              3'h6: pos_word = 16'hc028;
              3'h7: pos_word = 16'h3e1e;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h418d;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe8c;
              3'h2: pos_word = 16'h3ff8;
              3'h3: pos_word = 16'hbf52;
              3'h4: pos_word = 16'h3f4c;
              3'h5: pos_word = 16'hc000;
              3'h6: pos_word = 16'h3e85;
              3'h7: pos_word = 16'hc1b9;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbe2c;
            case (mant_lo3)
              3'h1: pos_word = 16'h4022;
              3'h2: pos_word = 16'hbf2a;
              3'h3: pos_word = 16'h3f7a;
              3'h4: pos_word = 16'hbfcb;
              3'h5: pos_word = 16'h3ebd;
              3'h6: pos_word = 16'hc0de;
              3'h7: pos_word = 16'hbd89;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4061;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf08;
              3'h2: pos_word = 16'h3f99;
              3'h3: pos_word = 16'hbfa4;
              3'h4: pos_word = 16'h3ef9;
              3'h5: pos_word = 16'hc081;
              3'h6: pos_word = 16'h3d07;
              3'h7: pos_word = 16'h40b3;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf7: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbed1;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf86;
              3'h2: pos_word = 16'hc033;
              3'h3: pos_word = 16'h414e;
              3'h4: pos_word = 16'h3fec;
              3'h5: pos_word = 16'h3f44;
              3'h6: pos_word = 16'h3e73;
              3'h7: pos_word = 16'hbe43;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf32;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfd4;
              3'h2: pos_word = 16'hc102;
              3'h3: pos_word = 16'h4050;
              3'h4: pos_word = 16'h3f92;
              3'h5: pos_word = 16'h3eec;
              3'h6: pos_word = 16'h3c44;
              3'h7: pos_word = 16'hbedd;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf8c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc040;
              3'h2: pos_word = 16'h4122;
              3'h3: pos_word = 16'h3fe0;
              3'h4: pos_word = 16'h3f3b;
              3'h5: pos_word = 16'h3e5c;
              3'h6: pos_word = 16'hbe59;
              3'h7: pos_word = 16'hbf3a;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfdf;
            case (mant_lo3)
              3'h1: pos_word = 16'hc11d;
              3'h2: pos_word = 16'h4042;
              3'h3: pos_word = 16'h3f8c;
              3'h4: pos_word = 16'h3edf;
              3'h5: pos_word = 16'hbc12;
              3'h6: pos_word = 16'hbeea;
              3'h7: pos_word = 16'hbf92;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc04e;
            case (mant_lo3)
              3'h1: pos_word = 16'h4106;
              3'h2: pos_word = 16'h3fd6;
              3'h3: pos_word = 16'h3f33;
              3'h4: pos_word = 16'h3e46;
              3'h5: pos_word = 16'hbe6f;
              3'h6: pos_word = 16'hbf43;
              3'h7: pos_word = 16'hbfea;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc146;
            case (mant_lo3)
              3'h1: pos_word = 16'h4035;
              3'h2: pos_word = 16'h3f87;
              3'h3: pos_word = 16'h3ed3;
              3'h4: pos_word = 16'hbcf4;
              3'h5: pos_word = 16'hbef7;
              3'h6: pos_word = 16'hbf98;
              3'h7: pos_word = 16'hc05e;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h40e3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcc;
              3'h2: pos_word = 16'h3f2b;
              3'h3: pos_word = 16'h3e30;
              3'h4: pos_word = 16'hbe83;
              3'h5: pos_word = 16'hbf4b;
              3'h6: pos_word = 16'hbff6;
              3'h7: pos_word = 16'hc186;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h402a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f81;
              3'h2: pos_word = 16'h3ec6;
              3'h3: pos_word = 16'hbd4f;
              3'h4: pos_word = 16'hbf02;
              3'h5: pos_word = 16'hbf9e;
              3'h6: pos_word = 16'hc071;
              3'h7: pos_word = 16'h40c5;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3fc3;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f24;
              3'h2: pos_word = 16'h3e1a;
              3'h3: pos_word = 16'hbe8e;
              3'h4: pos_word = 16'hbf54;
              3'h5: pos_word = 16'hc001;
              3'h6: pos_word = 16'hc1ce;
              3'h7: pos_word = 16'h4020;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3f78;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eba;
              3'h2: pos_word = 16'hbd93;
              3'h3: pos_word = 16'hbf09;
              3'h4: pos_word = 16'hbfa5;
              3'h5: pos_word = 16'hc084;
              3'h6: pos_word = 16'h40ae;
              3'h7: pos_word = 16'h3fba;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f1c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e04;
              3'h2: pos_word = 16'hbe9a;
              3'h3: pos_word = 16'hbf5d;
              3'h4: pos_word = 16'hc009;
              3'h5: pos_word = 16'hc25f;
              3'h6: pos_word = 16'h4016;
              3'h7: pos_word = 16'h3f6e;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3eae;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdbe;
              3'h2: pos_word = 16'hbf10;
              3'h3: pos_word = 16'hbfad;
              3'h4: pos_word = 16'hc091;
              3'h5: pos_word = 16'h409c;
              3'h6: pos_word = 16'h3fb2;
              3'h7: pos_word = 16'h3f15;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3ddd;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea6;
              3'h2: pos_word = 16'hbf67;
              3'h3: pos_word = 16'hc010;
              3'h4: pos_word = 16'h43ac;
              3'h5: pos_word = 16'h400e;
              3'h6: pos_word = 16'h3f64;
              3'h7: pos_word = 16'h3ea2;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbde9;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf17;
              3'h2: pos_word = 16'hbfb4;
              3'h3: pos_word = 16'hc0a0;
              3'h4: pos_word = 16'h408d;
              3'h5: pos_word = 16'h3fab;
              3'h6: pos_word = 16'h3f0e;
              3'h7: pos_word = 16'h3db2;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbeb2;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf70;
              3'h2: pos_word = 16'hc019;
              3'h3: pos_word = 16'h4228;
              3'h4: pos_word = 16'h4007;
              3'h5: pos_word = 16'h3f5a;
              3'h6: pos_word = 16'h3e97;
              3'h7: pos_word = 16'hbe0a;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbf1e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbd;
              3'h2: pos_word = 16'hc0b4;
              3'h3: pos_word = 16'h4080;
              3'h4: pos_word = 16'h3fa3;
              3'h5: pos_word = 16'h3f07;
              3'h6: pos_word = 16'h3d87;
              3'h7: pos_word = 16'hbebe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf8: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hbf7b;
            case (mant_lo3)
              3'h1: pos_word = 16'h41b3;
              3'h2: pos_word = 16'h3f51;
              3'h3: pos_word = 16'hbe20;
              3'h4: pos_word = 16'hbfc5;
              3'h5: pos_word = 16'h406c;
              3'h6: pos_word = 16'h3f00;
              3'h7: pos_word = 16'hbeca;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc02d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ff2;
              3'h2: pos_word = 16'h3e7f;
              3'h3: pos_word = 16'hbf2e;
              3'h4: pos_word = 16'hc0ed;
              3'h5: pos_word = 16'h3f96;
              3'h6: pos_word = 16'h3cc4;
              3'h7: pos_word = 16'hbf88;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h4139;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f40;
              3'h2: pos_word = 16'hbe4c;
              3'h3: pos_word = 16'hbfd9;
              3'h4: pos_word = 16'h404a;
              3'h5: pos_word = 16'h3ee7;
              3'h6: pos_word = 16'hbee3;
              3'h7: pos_word = 16'hc046;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fdc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e53;
              3'h2: pos_word = 16'hbf3e;
              3'h3: pos_word = 16'hc12c;
              3'h4: pos_word = 16'h3f8a;
              3'h5: pos_word = 16'hbc92;
              3'h6: pos_word = 16'hbf94;
              3'h7: pos_word = 16'h40f9;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f30;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe79;
              3'h2: pos_word = 16'hbfef;
              3'h3: pos_word = 16'h4030;
              3'h4: pos_word = 16'h3ecd;
              3'h5: pos_word = 16'hbefd;
              3'h6: pos_word = 16'hc066;
              3'h7: pos_word = 16'h3fc8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3e26;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4f;
              3'h2: pos_word = 16'hc19d;
              3'h3: pos_word = 16'h3f7e;
              3'h4: pos_word = 16'hbd74;
              3'h5: pos_word = 16'hbfa1;
              3'h6: pos_word = 16'h40bb;
              3'h7: pos_word = 16'h3f21;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbe93;
            case (mant_lo3)
              3'h1: pos_word = 16'hc004;
              3'h2: pos_word = 16'h401c;
              3'h3: pos_word = 16'h3eb5;
              3'h4: pos_word = 16'hbf0c;
              3'h5: pos_word = 16'hc089;
              3'h6: pos_word = 16'h3fb7;
              3'h7: pos_word = 16'h3df6;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbf61;
            case (mant_lo3)
              3'h1: pos_word = 16'hc2dd;
              3'h2: pos_word = 16'h3f69;
              3'h3: pos_word = 16'hbdd0;
              3'h4: pos_word = 16'hbfb0;
              3'h5: pos_word = 16'h4095;
              3'h6: pos_word = 16'h3f12;
              3'h7: pos_word = 16'hbeab;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc014;
            case (mant_lo3)
              3'h1: pos_word = 16'h400b;
              3'h2: pos_word = 16'h3e9d;
              3'h3: pos_word = 16'hbf1a;
              3'h4: pos_word = 16'hc0a8;
              3'h5: pos_word = 16'h3fa7;
              3'h6: pos_word = 16'h3d9f;
              3'h7: pos_word = 16'hbf75;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h41f5;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f57;
              3'h2: pos_word = 16'hbe13;
              3'h3: pos_word = 16'hbfc0;
              3'h4: pos_word = 16'h4077;
              3'h5: pos_word = 16'h3f04;
              3'h6: pos_word = 16'hbec3;
              3'h7: pos_word = 16'hc027;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3ffa;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e86;
              3'h2: pos_word = 16'hbf29;
              3'h3: pos_word = 16'hc0d9;
              3'h4: pos_word = 16'h3f9a;
              3'h5: pos_word = 16'h3d13;
              3'h6: pos_word = 16'hbf85;
              3'h7: pos_word = 16'h4157;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3f45;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe3f;
              3'h2: pos_word = 16'hbfd3;
              3'h3: pos_word = 16'h4053;
              3'h4: pos_word = 16'h3eee;
              3'h5: pos_word = 16'hbedc;
              3'h6: pos_word = 16'hc03e;
              3'h7: pos_word = 16'h3fe2;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e5f;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf39;
              3'h2: pos_word = 16'hc119;
              3'h3: pos_word = 16'h3f8d;
              3'h4: pos_word = 16'hbbbe;
              3'h5: pos_word = 16'hbf91;
              3'h6: pos_word = 16'h4109;
              3'h7: pos_word = 16'h3f35;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbe6c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfe8;
              3'h2: pos_word = 16'h4037;
              3'h3: pos_word = 16'h3ed5;
              3'h4: pos_word = 16'hbef5;
              3'h5: pos_word = 16'hc05c;
              3'h6: pos_word = 16'h3fcd;
              3'h7: pos_word = 16'h3e33;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hbf4a;
            case (mant_lo3)
              3'h1: pos_word = 16'hc17f;
              3'h2: pos_word = 16'h3f82;
              3'h3: pos_word = 16'hbd43;
              3'h4: pos_word = 16'hbf9d;
              3'h5: pos_word = 16'h40c9;
              3'h6: pos_word = 16'h3f25;
              3'h7: pos_word = 16'hbe8d;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc000;
            case (mant_lo3)
              3'h1: pos_word = 16'h4021;
              3'h2: pos_word = 16'h3ebc;
              3'h3: pos_word = 16'hbf08;
              3'h4: pos_word = 16'hc082;
              3'h5: pos_word = 16'h3fbc;
              3'h6: pos_word = 16'h3e07;
              3'h7: pos_word = 16'hbf5c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hf9: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'hc23e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbdb7;
              3'h2: pos_word = 16'h409e;
              3'h3: pos_word = 16'hbea4;
              3'h4: pos_word = 16'h400f;
              3'h5: pos_word = 16'hbf16;
              3'h6: pos_word = 16'h3fac;
              3'h7: pos_word = 16'hbf6f;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f5c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfbb;
              3'h2: pos_word = 16'h3f08;
              3'h3: pos_word = 16'hc021;
              3'h4: pos_word = 16'h3e8d;
              3'h5: pos_word = 16'hc0c9;
              3'h6: pos_word = 16'h3d44;
              3'h7: pos_word = 16'h4180;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbe33;
            case (mant_lo3)
              3'h1: pos_word = 16'h405c;
              3'h2: pos_word = 16'hbed4;
              3'h3: pos_word = 16'h3fe8;
              3'h4: pos_word = 16'hbf34;
              3'h5: pos_word = 16'h3f91;
              3'h6: pos_word = 16'hbf8d;
              3'h7: pos_word = 16'h3f39;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfe2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3edc;
              3'h2: pos_word = 16'hc052;
              3'h3: pos_word = 16'h3e40;
              3'h4: pos_word = 16'hc156;
              3'h5: pos_word = 16'hbd12;
              3'h6: pos_word = 16'h40da;
              3'h7: pos_word = 16'hbe86;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h4027;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf04;
              3'h2: pos_word = 16'h3fc0;
              3'h3: pos_word = 16'hbf56;
              3'h4: pos_word = 16'h3f75;
              3'h5: pos_word = 16'hbfa7;
              3'h6: pos_word = 16'h3f1a;
              3'h7: pos_word = 16'hc00b;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3eab;
            case (mant_lo3)
              3'h1: pos_word = 16'hc095;
              3'h2: pos_word = 16'h3dd1;
              3'h3: pos_word = 16'h42e5;
              3'h4: pos_word = 16'hbdf5;
              3'h5: pos_word = 16'h4089;
              3'h6: pos_word = 16'hbeb5;
              3'h7: pos_word = 16'h4005;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hbf21;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa1;
              3'h2: pos_word = 16'hbf7e;
              3'h3: pos_word = 16'h3f4f;
              3'h4: pos_word = 16'hbfc8;
              3'h5: pos_word = 16'h3efd;
              3'h6: pos_word = 16'hc030;
              3'h7: pos_word = 16'h3e79;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hc0f8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3c95;
              3'h2: pos_word = 16'h412d;
              3'h3: pos_word = 16'hbe52;
              3'h4: pos_word = 16'h4046;
              3'h5: pos_word = 16'hbee6;
              3'h6: pos_word = 16'h3fd9;
              3'h7: pos_word = 16'hbf40;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f88;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf96;
              3'h2: pos_word = 16'h3f2e;
              3'h3: pos_word = 16'hbff2;
              3'h4: pos_word = 16'h3eca;
              3'h5: pos_word = 16'hc06b;
              3'h6: pos_word = 16'h3e20;
              3'h7: pos_word = 16'hc1b2;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbd86;
            case (mant_lo3)
              3'h1: pos_word = 16'h40b4;
              3'h2: pos_word = 16'hbe96;
              3'h3: pos_word = 16'h4019;
              3'h4: pos_word = 16'hbf0e;
              3'h5: pos_word = 16'h3fb5;
              3'h6: pos_word = 16'hbf64;
              3'h7: pos_word = 16'h3f67;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbfb2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f10;
              3'h2: pos_word = 16'hc016;
              3'h3: pos_word = 16'h3e9a;
              3'h4: pos_word = 16'hc0ae;
              3'h5: pos_word = 16'h3d93;
              3'h6: pos_word = 16'h41d0;
              3'h7: pos_word = 16'hbe19;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h4072;
            case (mant_lo3)
              3'h1: pos_word = 16'hbec6;
              3'h2: pos_word = 16'h3ff6;
              3'h3: pos_word = 16'hbf2b;
              3'h4: pos_word = 16'h3f98;
              3'h5: pos_word = 16'hbf87;
              3'h6: pos_word = 16'h3f43;
              3'h7: pos_word = 16'hbfd6;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3eeb;
            case (mant_lo3)
              3'h1: pos_word = 16'hc042;
              3'h2: pos_word = 16'h3e59;
              3'h3: pos_word = 16'hc122;
              3'h4: pos_word = 16'hbc3e;
              3'h5: pos_word = 16'h4103;
              3'h6: pos_word = 16'hbe72;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbef9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fcb;
              3'h2: pos_word = 16'hbf4c;
              3'h3: pos_word = 16'h3f80;
              3'h4: pos_word = 16'hbf9f;
              3'h5: pos_word = 16'h3f23;
              3'h6: pos_word = 16'hc002;
              3'h7: pos_word = 16'h3eb9;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc085;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e01;
              3'h2: pos_word = 16'hc283;
              3'h3: pos_word = 16'hbdc3;
              3'h4: pos_word = 16'h409a;
              3'h5: pos_word = 16'hbea7;
              3'h6: pos_word = 16'h400d;
              3'h7: pos_word = 16'hbf18;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3faa;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf72;
              3'h2: pos_word = 16'h3f59;
              3'h3: pos_word = 16'hbfbe;
              3'h4: pos_word = 16'h3f06;
              3'h5: pos_word = 16'hc024;
              3'h6: pos_word = 16'h3e8a;
              3'h7: pos_word = 16'hc0d0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hfa: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3d2c;
            case (mant_lo3)
              3'h1: pos_word = 16'hbe39;
              3'h2: pos_word = 16'hbed8;
              3'h3: pos_word = 16'hbf37;
              3'h4: pos_word = 16'hbf8f;
              3'h5: pos_word = 16'hbfe5;
              3'h6: pos_word = 16'hc057;
              3'h7: pos_word = 16'hc168;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h40d1;
            case (mant_lo3)
              3'h1: pos_word = 16'h4024;
              3'h2: pos_word = 16'h3fbe;
              3'h3: pos_word = 16'h3f72;
              3'h4: pos_word = 16'h3f18;
              3'h5: pos_word = 16'h3ea8;
              3'h6: pos_word = 16'h3dc5;
              3'h7: pos_word = 16'hbe00;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbeb8;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf23;
              3'h2: pos_word = 16'hbf80;
              3'h3: pos_word = 16'hbfca;
              3'h4: pos_word = 16'hc033;
              3'h5: pos_word = 16'hc102;
              3'h6: pos_word = 16'h4123;
              3'h7: pos_word = 16'h4042;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fd6;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f87;
              3'h2: pos_word = 16'h3f2c;
              3'h3: pos_word = 16'h3ec7;
              3'h4: pos_word = 16'h3e1a;
              3'h5: pos_word = 16'hbd92;
              3'h6: pos_word = 16'hbe9a;
              3'h7: pos_word = 16'hbf10;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hbf66;
            case (mant_lo3)
              3'h1: pos_word = 16'hbfb4;
              3'h2: pos_word = 16'hc019;
              3'h3: pos_word = 16'hc0b4;
              3'h4: pos_word = 16'h41b5;
              3'h5: pos_word = 16'h406c;
              3'h6: pos_word = 16'h3ff3;
              3'h7: pos_word = 16'h3f96;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f40;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee7;
              3'h2: pos_word = 16'h3e53;
              3'h3: pos_word = 16'hbc8f;
              3'h4: pos_word = 16'hbe78;
              3'h5: pos_word = 16'hbefd;
              3'h6: pos_word = 16'hbf4f;
              3'h7: pos_word = 16'hbfa1;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc004;
            case (mant_lo3)
              3'h1: pos_word = 16'hc089;
              3'h2: pos_word = 16'hc2d5;
              3'h3: pos_word = 16'h4095;
              3'h4: pos_word = 16'h400b;
              3'h5: pos_word = 16'h3fa8;
              3'h6: pos_word = 16'h3f57;
              3'h7: pos_word = 16'h3f04;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3e86;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d15;
              3'h2: pos_word = 16'hbe3f;
              3'h3: pos_word = 16'hbedb;
              3'h4: pos_word = 16'hbf39;
              3'h5: pos_word = 16'hbf91;
              3'h6: pos_word = 16'hbfe8;
              3'h7: pos_word = 16'hc05c;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'hc17d;
            case (mant_lo3)
              3'h1: pos_word = 16'h40ca;
              3'h2: pos_word = 16'h4021;
              3'h3: pos_word = 16'h3fbc;
              3'h4: pos_word = 16'h3f6f;
              3'h5: pos_word = 16'h3f16;
              3'h6: pos_word = 16'h3ea4;
              3'h7: pos_word = 16'h3db9;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe07;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebc;
              3'h2: pos_word = 16'hbf25;
              3'h3: pos_word = 16'hbf82;
              3'h4: pos_word = 16'hbfcd;
              3'h5: pos_word = 16'hc036;
              3'h6: pos_word = 16'hc108;
              3'h7: pos_word = 16'h411a;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h403e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fd3;
              3'h2: pos_word = 16'h3f85;
              3'h3: pos_word = 16'h3f29;
              3'h4: pos_word = 16'h3ec3;
              3'h5: pos_word = 16'h3e14;
              3'h6: pos_word = 16'hbd9e;
              3'h7: pos_word = 16'hbe9d;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbf12;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf69;
              3'h2: pos_word = 16'hbfb7;
              3'h3: pos_word = 16'hc01b;
              3'h4: pos_word = 16'hc0ba;
              3'h5: pos_word = 16'h41a0;
              3'h6: pos_word = 16'h4067;
              3'h7: pos_word = 16'h3fef;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f94;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f3e;
              3'h2: pos_word = 16'h3ee3;
              3'h3: pos_word = 16'h3e4d;
              3'h4: pos_word = 16'hbcbe;
              3'h5: pos_word = 16'hbe7f;
              3'h6: pos_word = 16'hbf00;
              3'h7: pos_word = 16'hbf51;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfa3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc006;
              3'h2: pos_word = 16'hc08c;
              3'h3: pos_word = 16'hc38b;
              3'h4: pos_word = 16'h4091;
              3'h5: pos_word = 16'h4009;
              3'h6: pos_word = 16'h3fa6;
              3'h7: pos_word = 16'h3f54;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f03;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e83;
              3'h2: pos_word = 16'h3cf9;
              3'h3: pos_word = 16'hbe45;
              3'h4: pos_word = 16'hbedf;
              3'h5: pos_word = 16'hbf3b;
              3'h6: pos_word = 16'hbf92;
              3'h7: pos_word = 16'hbfeb;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hc060;
            case (mant_lo3)
              3'h1: pos_word = 16'hc18b;
              3'h2: pos_word = 16'h40c2;
              3'h3: pos_word = 16'h401e;
              3'h4: pos_word = 16'h3fb9;
              3'h5: pos_word = 16'h3f6d;
              3'h6: pos_word = 16'h3f14;
              3'h7: pos_word = 16'h3ea1;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hfb: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3dad;
            case (mant_lo3)
              3'h1: pos_word = 16'hbebf;
              3'h2: pos_word = 16'hbf83;
              3'h3: pos_word = 16'hc03a;
              3'h4: pos_word = 16'h4111;
              3'h5: pos_word = 16'h3fd0;
              3'h6: pos_word = 16'h3f27;
              3'h7: pos_word = 16'h3e0e;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbea0;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf6c;
              3'h2: pos_word = 16'hc01e;
              3'h3: pos_word = 16'h418f;
              3'h4: pos_word = 16'h3fec;
              3'h5: pos_word = 16'h3f3c;
              3'h6: pos_word = 16'h3e47;
              3'h7: pos_word = 16'hbe83;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hbf54;
            case (mant_lo3)
              3'h1: pos_word = 16'hc008;
              3'h2: pos_word = 16'h43e2;
              3'h3: pos_word = 16'h4007;
              3'h4: pos_word = 16'h3f52;
              3'h5: pos_word = 16'h3e80;
              3'h6: pos_word = 16'hbe4b;
              3'h7: pos_word = 16'hbf3d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hbfee;
            case (mant_lo3)
              3'h1: pos_word = 16'hc19b;
              3'h2: pos_word = 16'h401c;
              3'h3: pos_word = 16'h3f6a;
              3'h4: pos_word = 16'h3e9e;
              3'h5: pos_word = 16'hbe13;
              3'h6: pos_word = 16'hbf29;
              3'h7: pos_word = 16'hbfd3;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'hc118;
            case (mant_lo3)
              3'h1: pos_word = 16'h4037;
              3'h2: pos_word = 16'h3f82;
              3'h3: pos_word = 16'h3ebc;
              3'h4: pos_word = 16'hbdb6;
              3'h5: pos_word = 16'hbf16;
              3'h6: pos_word = 16'hbfbb;
              3'h7: pos_word = 16'hc0c8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h405d;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f91;
              3'h2: pos_word = 16'h3edc;
              3'h3: pos_word = 16'hbd0f;
              3'h4: pos_word = 16'hbf04;
              3'h5: pos_word = 16'hbfa7;
              3'h6: pos_word = 16'hc094;
              3'h7: pos_word = 16'h408a;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3fa2;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efe;
              3'h2: pos_word = 16'h3c9a;
              3'h3: pos_word = 16'hbee6;
              3'h4: pos_word = 16'hbf96;
              3'h5: pos_word = 16'hc06b;
              3'h6: pos_word = 16'h40b5;
              3'h7: pos_word = 16'h3fb5;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3f10;
            case (mant_lo3)
              3'h1: pos_word = 16'h3d95;
              3'h2: pos_word = 16'hbec6;
              3'h3: pos_word = 16'hbf86;
              3'h4: pos_word = 16'hc041;
              3'h5: pos_word = 16'h4103;
              3'h6: pos_word = 16'h3fcb;
              3'h7: pos_word = 16'h3f23;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3e02;
            case (mant_lo3)
              3'h1: pos_word = 16'hbea7;
              3'h2: pos_word = 16'hbf71;
              3'h3: pos_word = 16'hc023;
              3'h4: pos_word = 16'h416d;
              3'h5: pos_word = 16'h3fe6;
              3'h6: pos_word = 16'h3f37;
              3'h7: pos_word = 16'h3e3a;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbe89;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf59;
              3'h2: pos_word = 16'hc00d;
              3'h3: pos_word = 16'h4291;
              3'h4: pos_word = 16'h4003;
              3'h5: pos_word = 16'h3f4d;
              3'h6: pos_word = 16'h3e74;
              3'h7: pos_word = 16'hbe58;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hbf42;
            case (mant_lo3)
              3'h1: pos_word = 16'hbff5;
              3'h2: pos_word = 16'hc1c9;
              3'h3: pos_word = 16'h4017;
              3'h4: pos_word = 16'h3f64;
              3'h5: pos_word = 16'h3e97;
              3'h6: pos_word = 16'hbe1f;
              3'h7: pos_word = 16'hbf2d;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfd8;
            case (mant_lo3)
              3'h1: pos_word = 16'hc12b;
              3'h2: pos_word = 16'h4031;
              3'h3: pos_word = 16'h3f7e;
              3'h4: pos_word = 16'h3eb6;
              3'h5: pos_word = 16'hbdce;
              3'h6: pos_word = 16'hbf1a;
              3'h7: pos_word = 16'hbfc0;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'hc0d8;
            case (mant_lo3)
              3'h1: pos_word = 16'h4053;
              3'h2: pos_word = 16'h3f8e;
              3'h3: pos_word = 16'h3ed5;
              3'h4: pos_word = 16'hbd3f;
              3'h5: pos_word = 16'hbf08;
              3'h6: pos_word = 16'hbfab;
              3'h7: pos_word = 16'hc09d;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h4083;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9e;
              3'h2: pos_word = 16'h3ef6;
              3'h3: pos_word = 16'h3bec;
              3'h4: pos_word = 16'hbeed;
              3'h5: pos_word = 16'hbf99;
              3'h6: pos_word = 16'hc076;
              3'h7: pos_word = 16'h40aa;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3fb0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0d;
              3'h2: pos_word = 16'h3d7a;
              3'h3: pos_word = 16'hbecd;
              3'h4: pos_word = 16'hbf8a;
              3'h5: pos_word = 16'hc049;
              3'h6: pos_word = 16'h40ef;
              3'h7: pos_word = 16'h3fc6;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h3f1f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dec;
              3'h2: pos_word = 16'hbead;
              3'h3: pos_word = 16'hbf77;
              3'h4: pos_word = 16'hc029;
              3'h5: pos_word = 16'h414a;
              3'h6: pos_word = 16'h3fdf;
              3'h7: pos_word = 16'h3f33;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hfc: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3e2e;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf5e;
              3'h2: pos_word = 16'h421d;
              3'h3: pos_word = 16'h3f48;
              3'h4: pos_word = 16'hbe64;
              3'h5: pos_word = 16'hbffc;
              3'h6: pos_word = 16'h4012;
              3'h7: pos_word = 16'h3e91;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hbf32;
            case (mant_lo3)
              3'h1: pos_word = 16'hc143;
              3'h2: pos_word = 16'h3f78;
              3'h3: pos_word = 16'hbde6;
              3'h4: pos_word = 16'hbfc5;
              3'h5: pos_word = 16'h404b;
              3'h6: pos_word = 16'h3ece;
              3'h7: pos_word = 16'hbf0c;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'hc0a7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f9a;
              3'h2: pos_word = 16'hbb91;
              3'h3: pos_word = 16'hbf9d;
              3'h4: pos_word = 16'h409f;
              3'h5: pos_word = 16'h3f09;
              3'h6: pos_word = 16'hbed4;
              3'h7: pos_word = 16'hc051;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3fc1;
            case (mant_lo3)
              3'h1: pos_word = 16'h3dd4;
              3'h2: pos_word = 16'hbf7d;
              3'h3: pos_word = 16'h4130;
              3'h4: pos_word = 16'h3f2e;
              3'h5: pos_word = 16'hbe96;
              3'h6: pos_word = 16'hc016;
              3'h7: pos_word = 16'h3ff7;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3e5b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf4c;
              3'h2: pos_word = 16'hc271;
              3'h3: pos_word = 16'h3f5a;
              3'h4: pos_word = 16'hbe37;
              3'h5: pos_word = 16'hbfe4;
              3'h6: pos_word = 16'h4025;
              3'h7: pos_word = 16'h3ea8;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hbf22;
            case (mant_lo3)
              3'h1: pos_word = 16'hc100;
              3'h2: pos_word = 16'h3f87;
              3'h3: pos_word = 16'hbd8f;
              3'h4: pos_word = 16'hbfb4;
              3'h5: pos_word = 16'h406d;
              3'h6: pos_word = 16'h3ee8;
              3'h7: pos_word = 16'hbefc;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'hc088;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa8;
              3'h2: pos_word = 16'h3d1a;
              3'h3: pos_word = 16'hbf90;
              3'h4: pos_word = 16'h40cb;
              3'h5: pos_word = 16'h3f17;
              3'h6: pos_word = 16'hbebb;
              3'h7: pos_word = 16'hc036;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3fd4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e16;
              3'h2: pos_word = 16'hbf68;
              3'h3: pos_word = 16'h41a4;
              3'h4: pos_word = 16'h3f3f;
              3'h5: pos_word = 16'hbe7d;
              3'h6: pos_word = 16'hc006;
              3'h7: pos_word = 16'h4009;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3e84;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf3b;
              3'h2: pos_word = 16'hc188;
              3'h3: pos_word = 16'h3f6d;
              3'h4: pos_word = 16'hbe0b;
              3'h5: pos_word = 16'hbfcf;
              3'h6: pos_word = 16'h403c;
              3'h7: pos_word = 16'h3ec1;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbf13;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0bf;
              3'h2: pos_word = 16'h3f93;
              3'h3: pos_word = 16'hbce3;
              3'h4: pos_word = 16'hbfa5;
              3'h5: pos_word = 16'h408e;
              3'h6: pos_word = 16'h3f01;
              3'h7: pos_word = 16'hbee2;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'hc064;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fb8;
              3'h2: pos_word = 16'h3da4;
              3'h3: pos_word = 16'hbf84;
              3'h4: pos_word = 16'h410c;
              3'h5: pos_word = 16'h3f26;
              3'h6: pos_word = 16'hbea3;
              3'h7: pos_word = 16'hc020;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h3fe9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e42;
              3'h2: pos_word = 16'hbf56;
              3'h3: pos_word = 16'h4317;
              3'h4: pos_word = 16'h3f50;
              3'h5: pos_word = 16'hbe50;
              3'h6: pos_word = 16'hbff1;
              3'h7: pos_word = 16'h401a;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3e9b;
            case (mant_lo3)
              3'h1: pos_word = 16'hbf2b;
              3'h2: pos_word = 16'hc11e;
              3'h3: pos_word = 16'h3f81;
              3'h4: pos_word = 16'hbdbf;
              3'h5: pos_word = 16'hbfbd;
              3'h6: pos_word = 16'h4059;
              3'h7: pos_word = 16'h3eda;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbf05;
            case (mant_lo3)
              3'h1: pos_word = 16'hc098;
              3'h2: pos_word = 16'h3fa0;
              3'h3: pos_word = 16'h3c6c;
              3'h4: pos_word = 16'hbf97;
              3'h5: pos_word = 16'h40b1;
              3'h6: pos_word = 16'h3f0f;
              3'h7: pos_word = 16'hbec8;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'hc044;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fc9;
              3'h2: pos_word = 16'h3dfb;
              3'h3: pos_word = 16'hbf74;
              3'h4: pos_word = 16'h415e;
              3'h5: pos_word = 16'h3f35;
              3'h6: pos_word = 16'hbe8b;
              3'h7: pos_word = 16'hc00e;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h4001;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e6f;
              3'h2: pos_word = 16'hbf44;
              3'h3: pos_word = 16'hc1e2;
              3'h4: pos_word = 16'h3f62;
              3'h5: pos_word = 16'hbe23;
              3'h6: pos_word = 16'hbfda;
              3'h7: pos_word = 16'h402e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hfd: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3eb3;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0df;
              3'h2: pos_word = 16'hbd51;
              3'h3: pos_word = 16'h4080;
              3'h4: pos_word = 16'hbef0;
              3'h5: pos_word = 16'h3faf;
              3'h6: pos_word = 16'hbf8b;
              3'h7: pos_word = 16'h3f1d;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'hc02b;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e29;
              3'h2: pos_word = 16'h4206;
              3'h3: pos_word = 16'hbe69;
              3'h4: pos_word = 16'h4010;
              3'h5: pos_word = 16'hbf33;
              3'h6: pos_word = 16'h3f76;
              3'h7: pos_word = 16'hbfc7;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3ecc;
            case (mant_lo3)
              3'h1: pos_word = 16'hc0ab;
              3'h2: pos_word = 16'hbc11;
              3'h3: pos_word = 16'h409c;
              3'h4: pos_word = 16'hbed6;
              3'h5: pos_word = 16'h3fbf;
              3'h6: pos_word = 16'hbf7f;
              3'h7: pos_word = 16'h3f2d;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'hc018;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e56;
              3'h2: pos_word = 16'hc2a4;
              3'h3: pos_word = 16'hbe3c;
              3'h4: pos_word = 16'h4022;
              3'h5: pos_word = 16'hbf24;
              3'h6: pos_word = 16'h3f86;
              3'h7: pos_word = 16'hbfb5;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3ee5;
            case (mant_lo3)
              3'h1: pos_word = 16'hc08b;
              3'h2: pos_word = 16'h3d08;
              3'h3: pos_word = 16'h40c6;
              3'h4: pos_word = 16'hbebd;
              3'h5: pos_word = 16'h3fd2;
              3'h6: pos_word = 16'hbf6b;
              3'h7: pos_word = 16'h3f3d;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'hc007;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e82;
              3'h2: pos_word = 16'hc193;
              3'h3: pos_word = 16'hbe10;
              3'h4: pos_word = 16'h4039;
              3'h5: pos_word = 16'hbf15;
              3'h6: pos_word = 16'h3f92;
              3'h7: pos_word = 16'hbfa6;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3eff;
            case (mant_lo3)
              3'h1: pos_word = 16'hc068;
              3'h2: pos_word = 16'h3d9a;
              3'h3: pos_word = 16'h4106;
              3'h4: pos_word = 16'hbea5;
              3'h5: pos_word = 16'h3fe7;
              3'h6: pos_word = 16'hbf57;
              3'h7: pos_word = 16'h3f4e;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'hbff4;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e99;
              3'h2: pos_word = 16'hc126;
              3'h3: pos_word = 16'hbdc8;
              3'h4: pos_word = 16'h4056;
              3'h5: pos_word = 16'hbf07;
              3'h6: pos_word = 16'h3f9f;
              3'h7: pos_word = 16'hbf98;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3f0d;
            case (mant_lo3)
              3'h1: pos_word = 16'hc047;
              3'h2: pos_word = 16'h3df1;
              3'h3: pos_word = 16'h4151;
              3'h4: pos_word = 16'hbe8e;
              3'h5: pos_word = 16'h4000;
              3'h6: pos_word = 16'hbf46;
              3'h7: pos_word = 16'h3f60;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'hbfdd;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eb1;
              3'h2: pos_word = 16'hc0e6;
              3'h3: pos_word = 16'hbd63;
              3'h4: pos_word = 16'h407c;
              3'h5: pos_word = 16'hbef3;
              3'h6: pos_word = 16'h3fad;
              3'h7: pos_word = 16'hbf8c;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3f1c;
            case (mant_lo3)
              3'h1: pos_word = 16'hc02e;
              3'h2: pos_word = 16'h3e25;
              3'h3: pos_word = 16'h41e9;
              3'h4: pos_word = 16'hbe6e;
              3'h5: pos_word = 16'h400f;
              3'h6: pos_word = 16'hbf35;
              3'h7: pos_word = 16'h3f74;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'hbfc9;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec9;
              3'h2: pos_word = 16'hc0af;
              3'h3: pos_word = 16'hbc59;
              3'h4: pos_word = 16'h4098;
              3'h5: pos_word = 16'hbed9;
              3'h6: pos_word = 16'h3fbd;
              3'h7: pos_word = 16'hbf81;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h3f2b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc019;
              3'h2: pos_word = 16'h3e51;
              3'h3: pos_word = 16'hc301;
              3'h4: pos_word = 16'hbe41;
              3'h5: pos_word = 16'h4020;
              3'h6: pos_word = 16'hbf25;
              3'h7: pos_word = 16'h3f85;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'hbfb7;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee2;
              3'h2: pos_word = 16'hc08d;
              3'h3: pos_word = 16'h3cec;
              3'h4: pos_word = 16'h40c0;
              3'h5: pos_word = 16'hbec0;
              3'h6: pos_word = 16'h3fd0;
              3'h7: pos_word = 16'hbf6d;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h3f3b;
            case (mant_lo3)
              3'h1: pos_word = 16'hc009;
              3'h2: pos_word = 16'h3e7e;
              3'h3: pos_word = 16'hc1a0;
              3'h4: pos_word = 16'hbe14;
              3'h5: pos_word = 16'h4036;
              3'h6: pos_word = 16'hbf16;
              3'h7: pos_word = 16'h3f90;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'hbfa8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efd;
              3'h2: pos_word = 16'hc06c;
              3'h3: pos_word = 16'h3d91;
              3'h4: pos_word = 16'h4102;
              3'h5: pos_word = 16'hbea8;
              3'h6: pos_word = 16'h3fe5;
              3'h7: pos_word = 16'hbf59;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hfe: begin
        case (mant_hi4)
          4'h0: begin
            pos_word = 16'h3f4c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3e96;
              3'h2: pos_word = 16'hbdd1;
              3'h3: pos_word = 16'hbf08;
              3'h4: pos_word = 16'hbf9a;
              3'h5: pos_word = 16'hc04a;
              3'h6: pos_word = 16'h4146;
              3'h7: pos_word = 16'h3ffd;
              default: begin end
            endcase
          end
          4'h1: begin
            pos_word = 16'h3f5e;
            case (mant_lo3)
              3'h1: pos_word = 16'h3eae;
              3'h2: pos_word = 16'hbd75;
              3'h3: pos_word = 16'hbef6;
              3'h4: pos_word = 16'hbf8d;
              3'h5: pos_word = 16'hc030;
              3'h6: pos_word = 16'h41cf;
              3'h7: pos_word = 16'h400d;
              default: begin end
            endcase
          end
          4'h2: begin
            pos_word = 16'h3f72;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ec6;
              3'h2: pos_word = 16'hbc91;
              3'h3: pos_word = 16'hbedc;
              3'h4: pos_word = 16'hbf82;
              3'h5: pos_word = 16'hc01b;
              3'h6: pos_word = 16'hc395;
              3'h7: pos_word = 16'h401e;
              default: begin end
            endcase
          end
          4'h3: begin
            pos_word = 16'h3f84;
            case (mant_lo3)
              3'h1: pos_word = 16'h3ee0;
              3'h2: pos_word = 16'h3cc8;
              3'h3: pos_word = 16'hbec3;
              3'h4: pos_word = 16'hbf6f;
              3'h5: pos_word = 16'hc00b;
              3'h6: pos_word = 16'hc1b0;
              3'h7: pos_word = 16'h4034;
              default: begin end
            endcase
          end
          4'h4: begin
            pos_word = 16'h3f8f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3efa;
              3'h2: pos_word = 16'h3d88;
              3'h3: pos_word = 16'hbeaa;
              3'h4: pos_word = 16'hbf5b;
              3'h5: pos_word = 16'hbff9;
              3'h6: pos_word = 16'hc136;
              3'h7: pos_word = 16'h404f;
              default: begin end
            endcase
          end
          4'h5: begin
            pos_word = 16'h3f9c;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f0b;
              3'h2: pos_word = 16'h3ddf;
              3'h3: pos_word = 16'hbe93;
              3'h4: pos_word = 16'hbf49;
              3'h5: pos_word = 16'hbfe1;
              3'h6: pos_word = 16'hc0f6;
              3'h7: pos_word = 16'h4073;
              default: begin end
            endcase
          end
          4'h6: begin
            pos_word = 16'h3faa;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f19;
              3'h2: pos_word = 16'h3e1b;
              3'h3: pos_word = 16'hbe77;
              3'h4: pos_word = 16'hbf38;
              3'h5: pos_word = 16'hbfcd;
              3'h6: pos_word = 16'hc0b9;
              3'h7: pos_word = 16'h4092;
              default: begin end
            endcase
          end
          4'h7: begin
            pos_word = 16'h3fba;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f28;
              3'h2: pos_word = 16'h3e48;
              3'h3: pos_word = 16'hbe4a;
              3'h4: pos_word = 16'hbf29;
              3'h5: pos_word = 16'hbfbb;
              3'h6: pos_word = 16'hc093;
              3'h7: pos_word = 16'h40b6;
              default: begin end
            endcase
          end
          4'h8: begin
            pos_word = 16'h3fcc;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f38;
              3'h2: pos_word = 16'h3e75;
              3'h3: pos_word = 16'hbe1e;
              3'h4: pos_word = 16'hbf1a;
              3'h5: pos_word = 16'hbfab;
              3'h6: pos_word = 16'hc075;
              3'h7: pos_word = 16'h40f2;
              default: begin end
            endcase
          end
          4'h9: begin
            pos_word = 16'h3fe0;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f48;
              3'h2: pos_word = 16'h3e91;
              3'h3: pos_word = 16'hbde4;
              3'h4: pos_word = 16'hbf0b;
              3'h5: pos_word = 16'hbf9d;
              3'h6: pos_word = 16'hc051;
              3'h7: pos_word = 16'h4132;
              default: begin end
            endcase
          end
          4'ha: begin
            pos_word = 16'h3ff8;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f5a;
              3'h2: pos_word = 16'h3ea9;
              3'h3: pos_word = 16'hbd8d;
              3'h4: pos_word = 16'hbefb;
              3'h5: pos_word = 16'hbf90;
              3'h6: pos_word = 16'hc035;
              3'h7: pos_word = 16'h41a8;
              default: begin end
            endcase
          end
          4'hb: begin
            pos_word = 16'h400a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f6e;
              3'h2: pos_word = 16'h3ec1;
              3'h3: pos_word = 16'hbcd9;
              3'h4: pos_word = 16'hbee1;
              3'h5: pos_word = 16'hbf84;
              3'h6: pos_word = 16'hc01f;
              3'h7: pos_word = 16'h4336;
              default: begin end
            endcase
          end
          4'hc: begin
            pos_word = 16'h401a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f81;
              3'h2: pos_word = 16'h3eda;
              3'h3: pos_word = 16'h3c7f;
              3'h4: pos_word = 16'hbec8;
              3'h5: pos_word = 16'hbf73;
              3'h6: pos_word = 16'hc00e;
              3'h7: pos_word = 16'hc1db;
              default: begin end
            endcase
          end
          4'hd: begin
            pos_word = 16'h402f;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f8d;
              3'h2: pos_word = 16'h3ef4;
              3'h3: pos_word = 16'h3d6c;
              3'h4: pos_word = 16'hbeaf;
              3'h5: pos_word = 16'hbf5f;
              3'h6: pos_word = 16'hbffe;
              3'h7: pos_word = 16'hc14b;
              default: begin end
            endcase
          end
          4'he: begin
            pos_word = 16'h4049;
            case (mant_lo3)
              3'h1: pos_word = 16'h3f99;
              3'h2: pos_word = 16'h3f08;
              3'h3: pos_word = 16'h3dcd;
              3'h4: pos_word = 16'hbe98;
              3'h5: pos_word = 16'hbf4d;
              3'h6: pos_word = 16'hbfe6;
              3'h7: pos_word = 16'hc104;
              default: begin end
            endcase
          end
          4'hf: begin
            pos_word = 16'h406a;
            case (mant_lo3)
              3'h1: pos_word = 16'h3fa7;
              3'h2: pos_word = 16'h3f16;
              3'h3: pos_word = 16'h3e12;
              3'h4: pos_word = 16'hbe80;
              3'h5: pos_word = 16'hbf3c;
              3'h6: pos_word = 16'hbfd1;
              3'h7: pos_word = 16'hc0c3;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  wire flip_sign = sign & (pos_word != 16'h7fc0);
  wire [15:0] odd_word = pos_word ^ {flip_sign, 15'h0000};
  assign out = is_passthrough ? in : odd_word;
endmodule
