module ex204_bf16_log2_delta_pair_first_hilo3_formula_bits_14(in, out);
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
  reg [31:0] base_pair;
  reg [31:0] delta_pair;
  always @* begin
    case (exp)
      8'h00: base_pair = 32'hff80ff80;
      8'h01: base_pair = 32'h7fc0c2fc;
      8'h02: base_pair = 32'h7fc0c2fa;
      8'h03: base_pair = 32'h7fc0c2f8;
      8'h04: base_pair = 32'h7fc0c2f6;
      8'h05: base_pair = 32'h7fc0c2f4;
      8'h06: base_pair = 32'h7fc0c2f2;
      8'h07: base_pair = 32'h7fc0c2f0;
      8'h08: base_pair = 32'h7fc0c2ee;
      8'h09: base_pair = 32'h7fc0c2ec;
      8'h0a: base_pair = 32'h7fc0c2ea;
      8'h0b: base_pair = 32'h7fc0c2e8;
      8'h0c: base_pair = 32'h7fc0c2e6;
      8'h0d: base_pair = 32'h7fc0c2e4;
      8'h0e: base_pair = 32'h7fc0c2e2;
      8'h0f: base_pair = 32'h7fc0c2e0;
      8'h10: base_pair = 32'h7fc0c2de;
      8'h11: base_pair = 32'h7fc0c2dc;
      8'h12: base_pair = 32'h7fc0c2da;
      8'h13: base_pair = 32'h7fc0c2d8;
      8'h14: base_pair = 32'h7fc0c2d6;
      8'h15: base_pair = 32'h7fc0c2d4;
      8'h16: base_pair = 32'h7fc0c2d2;
      8'h17: base_pair = 32'h7fc0c2d0;
      8'h18: base_pair = 32'h7fc0c2ce;
      8'h19: base_pair = 32'h7fc0c2cc;
      8'h1a: base_pair = 32'h7fc0c2ca;
      8'h1b: base_pair = 32'h7fc0c2c8;
      8'h1c: base_pair = 32'h7fc0c2c6;
      8'h1d: base_pair = 32'h7fc0c2c4;
      8'h1e: base_pair = 32'h7fc0c2c2;
      8'h1f: base_pair = 32'h7fc0c2c0;
      8'h20: base_pair = 32'h7fc0c2be;
      8'h21: base_pair = 32'h7fc0c2bc;
      8'h22: base_pair = 32'h7fc0c2ba;
      8'h23: base_pair = 32'h7fc0c2b8;
      8'h24: base_pair = 32'h7fc0c2b6;
      8'h25: base_pair = 32'h7fc0c2b4;
      8'h26: base_pair = 32'h7fc0c2b2;
      8'h27: base_pair = 32'h7fc0c2b0;
      8'h28: base_pair = 32'h7fc0c2ae;
      8'h29: base_pair = 32'h7fc0c2ac;
      8'h2a: base_pair = 32'h7fc0c2aa;
      8'h2b: base_pair = 32'h7fc0c2a8;
      8'h2c: base_pair = 32'h7fc0c2a6;
      8'h2d: base_pair = 32'h7fc0c2a4;
      8'h2e: base_pair = 32'h7fc0c2a2;
      8'h2f: base_pair = 32'h7fc0c2a0;
      8'h30: base_pair = 32'h7fc0c29e;
      8'h31: base_pair = 32'h7fc0c29c;
      8'h32: base_pair = 32'h7fc0c29a;
      8'h33: base_pair = 32'h7fc0c298;
      8'h34: base_pair = 32'h7fc0c296;
      8'h35: base_pair = 32'h7fc0c294;
      8'h36: base_pair = 32'h7fc0c292;
      8'h37: base_pair = 32'h7fc0c290;
      8'h38: base_pair = 32'h7fc0c28e;
      8'h39: base_pair = 32'h7fc0c28c;
      8'h3a: base_pair = 32'h7fc0c28a;
      8'h3b: base_pair = 32'h7fc0c288;
      8'h3c: base_pair = 32'h7fc0c286;
      8'h3d: base_pair = 32'h7fc0c284;
      8'h3e: base_pair = 32'h7fc0c282;
      8'h3f: base_pair = 32'h7fc0c280;
      8'h40: base_pair = 32'h7fc0c27c;
      8'h41: base_pair = 32'h7fc0c278;
      8'h42: base_pair = 32'h7fc0c274;
      8'h43: base_pair = 32'h7fc0c270;
      8'h44: base_pair = 32'h7fc0c26c;
      8'h45: base_pair = 32'h7fc0c268;
      8'h46: base_pair = 32'h7fc0c264;
      8'h47: base_pair = 32'h7fc0c260;
      8'h48: base_pair = 32'h7fc0c25c;
      8'h49: base_pair = 32'h7fc0c258;
      8'h4a: base_pair = 32'h7fc0c254;
      8'h4b: base_pair = 32'h7fc0c250;
      8'h4c: base_pair = 32'h7fc0c24c;
      8'h4d: base_pair = 32'h7fc0c248;
      8'h4e: base_pair = 32'h7fc0c244;
      8'h4f: base_pair = 32'h7fc0c240;
      8'h50: base_pair = 32'h7fc0c23c;
      8'h51: base_pair = 32'h7fc0c238;
      8'h52: base_pair = 32'h7fc0c234;
      8'h53: base_pair = 32'h7fc0c230;
      8'h54: base_pair = 32'h7fc0c22c;
      8'h55: base_pair = 32'h7fc0c228;
      8'h56: base_pair = 32'h7fc0c224;
      8'h57: base_pair = 32'h7fc0c220;
      8'h58: base_pair = 32'h7fc0c21c;
      8'h59: base_pair = 32'h7fc0c218;
      8'h5a: base_pair = 32'h7fc0c214;
      8'h5b: base_pair = 32'h7fc0c210;
      8'h5c: base_pair = 32'h7fc0c20c;
      8'h5d: base_pair = 32'h7fc0c208;
      8'h5e: base_pair = 32'h7fc0c204;
      8'h5f: base_pair = 32'h7fc0c200;
      8'h60: base_pair = 32'h7fc0c1f8;
      8'h61: base_pair = 32'h7fc0c1f0;
      8'h62: base_pair = 32'h7fc0c1e8;
      8'h63: base_pair = 32'h7fc0c1e0;
      8'h64: base_pair = 32'h7fc0c1d8;
      8'h65: base_pair = 32'h7fc0c1d0;
      8'h66: base_pair = 32'h7fc0c1c8;
      8'h67: base_pair = 32'h7fc0c1c0;
      8'h68: base_pair = 32'h7fc0c1b8;
      8'h69: base_pair = 32'h7fc0c1b0;
      8'h6a: base_pair = 32'h7fc0c1a8;
      8'h6b: base_pair = 32'h7fc0c1a0;
      8'h6c: base_pair = 32'h7fc0c198;
      8'h6d: base_pair = 32'h7fc0c190;
      8'h6e: base_pair = 32'h7fc0c188;
      8'h6f: base_pair = 32'h7fc0c180;
      8'h70: base_pair = 32'h7fc0c170;
      8'h71: base_pair = 32'h7fc0c160;
      8'h72: base_pair = 32'h7fc0c150;
      8'h73: base_pair = 32'h7fc0c140;
      8'h74: base_pair = 32'h7fc0c130;
      8'h75: base_pair = 32'h7fc0c120;
      8'h76: base_pair = 32'h7fc0c110;
      8'h77: base_pair = 32'h7fc0c100;
      8'h78: base_pair = 32'h7fc0c0e0;
      8'h79: base_pair = 32'h7fc0c0c0;
      8'h7a: base_pair = 32'h7fc0c0a0;
      8'h7b: base_pair = 32'h7fc0c080;
      8'h7c: base_pair = 32'h7fc0c040;
      8'h7d: base_pair = 32'h7fc0c000;
      8'h7e: base_pair = 32'h7fc0bf80;
      8'h7f: base_pair = 32'h7fc00000;
      8'h80: base_pair = 32'h7fc03f80;
      8'h81: base_pair = 32'h7fc04000;
      8'h82: base_pair = 32'h7fc04040;
      8'h83: base_pair = 32'h7fc04080;
      8'h84: base_pair = 32'h7fc040a0;
      8'h85: base_pair = 32'h7fc040c0;
      8'h86: base_pair = 32'h7fc040e0;
      8'h87: base_pair = 32'h7fc04100;
      8'h88: base_pair = 32'h7fc04110;
      8'h89: base_pair = 32'h7fc04120;
      8'h8a: base_pair = 32'h7fc04130;
      8'h8b: base_pair = 32'h7fc04140;
      8'h8c: base_pair = 32'h7fc04150;
      8'h8d: base_pair = 32'h7fc04160;
      8'h8e: base_pair = 32'h7fc04170;
      8'h8f: base_pair = 32'h7fc04180;
      8'h90: base_pair = 32'h7fc04188;
      8'h91: base_pair = 32'h7fc04190;
      8'h92: base_pair = 32'h7fc04198;
      8'h93: base_pair = 32'h7fc041a0;
      8'h94: base_pair = 32'h7fc041a8;
      8'h95: base_pair = 32'h7fc041b0;
      8'h96: base_pair = 32'h7fc041b8;
      8'h97: base_pair = 32'h7fc041c0;
      8'h98: base_pair = 32'h7fc041c8;
      8'h99: base_pair = 32'h7fc041d0;
      8'h9a: base_pair = 32'h7fc041d8;
      8'h9b: base_pair = 32'h7fc041e0;
      8'h9c: base_pair = 32'h7fc041e8;
      8'h9d: base_pair = 32'h7fc041f0;
      8'h9e: base_pair = 32'h7fc041f8;
      8'h9f: base_pair = 32'h7fc04200;
      8'ha0: base_pair = 32'h7fc04204;
      8'ha1: base_pair = 32'h7fc04208;
      8'ha2: base_pair = 32'h7fc0420c;
      8'ha3: base_pair = 32'h7fc04210;
      8'ha4: base_pair = 32'h7fc04214;
      8'ha5: base_pair = 32'h7fc04218;
      8'ha6: base_pair = 32'h7fc0421c;
      8'ha7: base_pair = 32'h7fc04220;
      8'ha8: base_pair = 32'h7fc04224;
      8'ha9: base_pair = 32'h7fc04228;
      8'haa: base_pair = 32'h7fc0422c;
      8'hab: base_pair = 32'h7fc04230;
      8'hac: base_pair = 32'h7fc04234;
      8'had: base_pair = 32'h7fc04238;
      8'hae: base_pair = 32'h7fc0423c;
      8'haf: base_pair = 32'h7fc04240;
      8'hb0: base_pair = 32'h7fc04244;
      8'hb1: base_pair = 32'h7fc04248;
      8'hb2: base_pair = 32'h7fc0424c;
      8'hb3: base_pair = 32'h7fc04250;
      8'hb4: base_pair = 32'h7fc04254;
      8'hb5: base_pair = 32'h7fc04258;
      8'hb6: base_pair = 32'h7fc0425c;
      8'hb7: base_pair = 32'h7fc04260;
      8'hb8: base_pair = 32'h7fc04264;
      8'hb9: base_pair = 32'h7fc04268;
      8'hba: base_pair = 32'h7fc0426c;
      8'hbb: base_pair = 32'h7fc04270;
      8'hbc: base_pair = 32'h7fc04274;
      8'hbd: base_pair = 32'h7fc04278;
      8'hbe: base_pair = 32'h7fc0427c;
      8'hbf: base_pair = 32'h7fc04280;
      8'hc0: base_pair = 32'h7fc04282;
      8'hc1: base_pair = 32'h7fc04284;
      8'hc2: base_pair = 32'h7fc04286;
      8'hc3: base_pair = 32'h7fc04288;
      8'hc4: base_pair = 32'h7fc0428a;
      8'hc5: base_pair = 32'h7fc0428c;
      8'hc6: base_pair = 32'h7fc0428e;
      8'hc7: base_pair = 32'h7fc04290;
      8'hc8: base_pair = 32'h7fc04292;
      8'hc9: base_pair = 32'h7fc04294;
      8'hca: base_pair = 32'h7fc04296;
      8'hcb: base_pair = 32'h7fc04298;
      8'hcc: base_pair = 32'h7fc0429a;
      8'hcd: base_pair = 32'h7fc0429c;
      8'hce: base_pair = 32'h7fc0429e;
      8'hcf: base_pair = 32'h7fc042a0;
      8'hd0: base_pair = 32'h7fc042a2;
      8'hd1: base_pair = 32'h7fc042a4;
      8'hd2: base_pair = 32'h7fc042a6;
      8'hd3: base_pair = 32'h7fc042a8;
      8'hd4: base_pair = 32'h7fc042aa;
      8'hd5: base_pair = 32'h7fc042ac;
      8'hd6: base_pair = 32'h7fc042ae;
      8'hd7: base_pair = 32'h7fc042b0;
      8'hd8: base_pair = 32'h7fc042b2;
      8'hd9: base_pair = 32'h7fc042b4;
      8'hda: base_pair = 32'h7fc042b6;
      8'hdb: base_pair = 32'h7fc042b8;
      8'hdc: base_pair = 32'h7fc042ba;
      8'hdd: base_pair = 32'h7fc042bc;
      8'hde: base_pair = 32'h7fc042be;
      8'hdf: base_pair = 32'h7fc042c0;
      8'he0: base_pair = 32'h7fc042c2;
      8'he1: base_pair = 32'h7fc042c4;
      8'he2: base_pair = 32'h7fc042c6;
      8'he3: base_pair = 32'h7fc042c8;
      8'he4: base_pair = 32'h7fc042ca;
      8'he5: base_pair = 32'h7fc042cc;
      8'he6: base_pair = 32'h7fc042ce;
      8'he7: base_pair = 32'h7fc042d0;
      8'he8: base_pair = 32'h7fc042d2;
      8'he9: base_pair = 32'h7fc042d4;
      8'hea: base_pair = 32'h7fc042d6;
      8'heb: base_pair = 32'h7fc042d8;
      8'hec: base_pair = 32'h7fc042da;
      8'hed: base_pair = 32'h7fc042dc;
      8'hee: base_pair = 32'h7fc042de;
      8'hef: base_pair = 32'h7fc042e0;
      8'hf0: base_pair = 32'h7fc042e2;
      8'hf1: base_pair = 32'h7fc042e4;
      8'hf2: base_pair = 32'h7fc042e6;
      8'hf3: base_pair = 32'h7fc042e8;
      8'hf4: base_pair = 32'h7fc042ea;
      8'hf5: base_pair = 32'h7fc042ec;
      8'hf6: base_pair = 32'h7fc042ee;
      8'hf7: base_pair = 32'h7fc042f0;
      8'hf8: base_pair = 32'h7fc042f2;
      8'hf9: base_pair = 32'h7fc042f4;
      8'hfa: base_pair = 32'h7fc042f6;
      8'hfb: base_pair = 32'h7fc042f8;
      8'hfc: base_pair = 32'h7fc042fa;
      8'hfd: base_pair = 32'h7fc042fc;
      8'hfe: base_pair = 32'h7fc042fe;
      8'hff: base_pair = 32'h7fc07f80;
      default: base_pair = 32'h00000000;
    endcase
  end
  always @* begin
    delta_pair = 32'h00000000;
    case (exp)
      8'h01: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h02: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h03: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h04: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h05: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h06: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h07: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000001f;
              4'ha: delta_pair = 32'h0000001f;
              4'hb: delta_pair = 32'h0000001f;
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001f;
          end
          3'h3: begin
            delta_pair = 32'h0000001f;
          end
          3'h4: begin
            delta_pair = 32'h0000001f;
          end
          3'h5: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'h08: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h09: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h0a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h0b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h0c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h0d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h0e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h0f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000003f;
              4'ha: delta_pair = 32'h0000003f;
              4'hb: delta_pair = 32'h0000003f;
              4'hc: delta_pair = 32'h0000003f;
              4'hd: delta_pair = 32'h0000003f;
              4'he: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h0000003f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000003f;
          end
          3'h3: begin
            delta_pair = 32'h0000003f;
          end
          3'h4: begin
            delta_pair = 32'h0000003f;
          end
          3'h5: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000003e;
              4'h9: delta_pair = 32'h0000003e;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003e;
              4'hd: delta_pair = 32'h0000003e;
              4'he: delta_pair = 32'h0000003e;
              4'hf: delta_pair = 32'h0000003e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000003e;
          end
          3'h7: begin
            delta_pair = 32'h0000003e;
          end
          default: begin end
        endcase
      end
      8'h10: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h11: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h12: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h13: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h14: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h15: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h16: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h17: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000001f;
              4'ha: delta_pair = 32'h0000001f;
              4'hb: delta_pair = 32'h0000001f;
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001f;
          end
          3'h3: begin
            delta_pair = 32'h0000001f;
          end
          3'h4: begin
            delta_pair = 32'h0000001f;
          end
          3'h5: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'h18: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h19: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h1a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h1b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h1c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h1d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h1e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h1f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000007f;
              4'ha: delta_pair = 32'h0000007f;
              4'hb: delta_pair = 32'h0000007f;
              4'hc: delta_pair = 32'h0000007f;
              4'hd: delta_pair = 32'h0000007f;
              4'he: delta_pair = 32'h0000007f;
              4'hf: delta_pair = 32'h0000007f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000007f;
          end
          3'h3: begin
            delta_pair = 32'h0000007f;
          end
          3'h4: begin
            delta_pair = 32'h0000007f;
          end
          3'h5: begin
            delta_pair = 32'h0000007f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000007e;
              4'h9: delta_pair = 32'h0000007e;
              4'ha: delta_pair = 32'h0000007e;
              4'hb: delta_pair = 32'h0000007e;
              4'hc: delta_pair = 32'h0000007e;
              4'hd: delta_pair = 32'h0000007e;
              4'he: delta_pair = 32'h0000007e;
              4'hf: delta_pair = 32'h0000007e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000007e;
          end
          3'h7: begin
            delta_pair = 32'h0000007e;
          end
          default: begin end
        endcase
      end
      8'h20: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h21: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h22: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h23: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h24: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h25: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h26: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h27: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000001f;
              4'ha: delta_pair = 32'h0000001f;
              4'hb: delta_pair = 32'h0000001f;
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001f;
          end
          3'h3: begin
            delta_pair = 32'h0000001f;
          end
          3'h4: begin
            delta_pair = 32'h0000001f;
          end
          3'h5: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'h28: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h29: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h2a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h2b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h2c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h2d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h2e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h2f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000003f;
              4'ha: delta_pair = 32'h0000003f;
              4'hb: delta_pair = 32'h0000003f;
              4'hc: delta_pair = 32'h0000003f;
              4'hd: delta_pair = 32'h0000003f;
              4'he: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h0000003f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000003f;
          end
          3'h3: begin
            delta_pair = 32'h0000003f;
          end
          3'h4: begin
            delta_pair = 32'h0000003f;
          end
          3'h5: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000003e;
              4'h9: delta_pair = 32'h0000003e;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003e;
              4'hd: delta_pair = 32'h0000003e;
              4'he: delta_pair = 32'h0000003e;
              4'hf: delta_pair = 32'h0000003e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000003e;
          end
          3'h7: begin
            delta_pair = 32'h0000003e;
          end
          default: begin end
        endcase
      end
      8'h30: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h31: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h32: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h33: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h34: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h35: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h36: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h37: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000001f;
              4'ha: delta_pair = 32'h0000001f;
              4'hb: delta_pair = 32'h0000001f;
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001f;
          end
          3'h3: begin
            delta_pair = 32'h0000001f;
          end
          3'h4: begin
            delta_pair = 32'h0000001f;
          end
          3'h5: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'h38: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h39: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h3a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h3b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h0000000f;
              4'ha: delta_pair = 32'h0000000f;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000f;
          end
          3'h3: begin
            delta_pair = 32'h0000000f;
          end
          3'h4: begin
            delta_pair = 32'h0000000f;
          end
          3'h5: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'h3c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h3d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000007;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000007;
          end
          3'h3: begin
            delta_pair = 32'h00000007;
          end
          3'h4: begin
            delta_pair = 32'h00000007;
          end
          3'h5: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'h3e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000003;
              4'hd: delta_pair = 32'h00000003;
              4'he: delta_pair = 32'h00000003;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
          end
          3'h3: begin
            delta_pair = 32'h00000003;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
          end
          3'h5: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'h3f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h000000ff;
              4'hd: delta_pair = 32'h000000ff;
              4'he: delta_pair = 32'h000000ff;
              4'hf: delta_pair = 32'h000000ff;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000000ff;
          end
          3'h2: begin
            delta_pair = 32'h000000fe;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000ff;
              4'h1: delta_pair = 32'h000000ff;
              4'h2: delta_pair = 32'h000000ff;
              4'h3: delta_pair = 32'h000000ff;
              4'h4: delta_pair = 32'h000000ff;
              4'h5: delta_pair = 32'h000000ff;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h000000fe;
          end
          3'h4: begin
            delta_pair = 32'h000000fd;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000fe;
              4'h1: delta_pair = 32'h000000fe;
              4'h2: delta_pair = 32'h000000fe;
              4'h3: delta_pair = 32'h000000fe;
              4'h4: delta_pair = 32'h000000fe;
              4'h5: delta_pair = 32'h000000fe;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h000000fd;
          end
          3'h6: begin
            delta_pair = 32'h000000fd;
            case (mant_lo4)
              4'hb: delta_pair = 32'h000000fc;
              4'hc: delta_pair = 32'h000000fc;
              4'hd: delta_pair = 32'h000000fc;
              4'he: delta_pair = 32'h000000fc;
              4'hf: delta_pair = 32'h000000fc;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000000fc;
          end
          default: begin end
        endcase
      end
      8'h40: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h41: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h42: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h43: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001f;
          end
          3'h2: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'h2: delta_pair = 32'h0000001f;
              4'h3: delta_pair = 32'h0000001f;
              4'h4: delta_pair = 32'h0000001f;
              4'h5: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001e;
          end
          3'h4: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001e;
              4'h1: delta_pair = 32'h0000001e;
              4'h2: delta_pair = 32'h0000001e;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001d;
          end
          3'h6: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'h44: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h45: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h46: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h47: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000003f;
              4'hd: delta_pair = 32'h0000003f;
              4'he: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h0000003f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000003f;
          end
          3'h2: begin
            delta_pair = 32'h0000003e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003f;
              4'h1: delta_pair = 32'h0000003f;
              4'h2: delta_pair = 32'h0000003f;
              4'h3: delta_pair = 32'h0000003f;
              4'h4: delta_pair = 32'h0000003f;
              4'h5: delta_pair = 32'h0000003f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000003e;
          end
          3'h4: begin
            delta_pair = 32'h0000003d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003e;
              4'h1: delta_pair = 32'h0000003e;
              4'h2: delta_pair = 32'h0000003e;
              4'h3: delta_pair = 32'h0000003e;
              4'h4: delta_pair = 32'h0000003e;
              4'h5: delta_pair = 32'h0000003e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000003d;
          end
          3'h6: begin
            delta_pair = 32'h0000003d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000003c;
              4'hc: delta_pair = 32'h0000003c;
              4'hd: delta_pair = 32'h0000003c;
              4'he: delta_pair = 32'h0000003c;
              4'hf: delta_pair = 32'h0000003c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000003c;
          end
          default: begin end
        endcase
      end
      8'h48: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h49: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h4a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h4b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001f;
          end
          3'h2: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'h2: delta_pair = 32'h0000001f;
              4'h3: delta_pair = 32'h0000001f;
              4'h4: delta_pair = 32'h0000001f;
              4'h5: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001e;
          end
          3'h4: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001e;
              4'h1: delta_pair = 32'h0000001e;
              4'h2: delta_pair = 32'h0000001e;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001d;
          end
          3'h6: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'h4c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h4d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h4e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h4f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000007f;
              4'hd: delta_pair = 32'h0000007f;
              4'he: delta_pair = 32'h0000007f;
              4'hf: delta_pair = 32'h0000007f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000007f;
          end
          3'h2: begin
            delta_pair = 32'h0000007e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007f;
              4'h1: delta_pair = 32'h0000007f;
              4'h2: delta_pair = 32'h0000007f;
              4'h3: delta_pair = 32'h0000007f;
              4'h4: delta_pair = 32'h0000007f;
              4'h5: delta_pair = 32'h0000007f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000007e;
          end
          3'h4: begin
            delta_pair = 32'h0000007d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007e;
              4'h1: delta_pair = 32'h0000007e;
              4'h2: delta_pair = 32'h0000007e;
              4'h3: delta_pair = 32'h0000007e;
              4'h4: delta_pair = 32'h0000007e;
              4'h5: delta_pair = 32'h0000007e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000007d;
          end
          3'h6: begin
            delta_pair = 32'h0000007d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000007c;
              4'hc: delta_pair = 32'h0000007c;
              4'hd: delta_pair = 32'h0000007c;
              4'he: delta_pair = 32'h0000007c;
              4'hf: delta_pair = 32'h0000007c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000007c;
          end
          default: begin end
        endcase
      end
      8'h50: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h51: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h52: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h53: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001f;
          end
          3'h2: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'h2: delta_pair = 32'h0000001f;
              4'h3: delta_pair = 32'h0000001f;
              4'h4: delta_pair = 32'h0000001f;
              4'h5: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001e;
          end
          3'h4: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001e;
              4'h1: delta_pair = 32'h0000001e;
              4'h2: delta_pair = 32'h0000001e;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001d;
          end
          3'h6: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'h54: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h55: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h56: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h57: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000003f;
              4'hd: delta_pair = 32'h0000003f;
              4'he: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h0000003f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000003f;
          end
          3'h2: begin
            delta_pair = 32'h0000003e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003f;
              4'h1: delta_pair = 32'h0000003f;
              4'h2: delta_pair = 32'h0000003f;
              4'h3: delta_pair = 32'h0000003f;
              4'h4: delta_pair = 32'h0000003f;
              4'h5: delta_pair = 32'h0000003f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000003e;
          end
          3'h4: begin
            delta_pair = 32'h0000003d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003e;
              4'h1: delta_pair = 32'h0000003e;
              4'h2: delta_pair = 32'h0000003e;
              4'h3: delta_pair = 32'h0000003e;
              4'h4: delta_pair = 32'h0000003e;
              4'h5: delta_pair = 32'h0000003e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000003d;
          end
          3'h6: begin
            delta_pair = 32'h0000003d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000003c;
              4'hc: delta_pair = 32'h0000003c;
              4'hd: delta_pair = 32'h0000003c;
              4'he: delta_pair = 32'h0000003c;
              4'hf: delta_pair = 32'h0000003c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000003c;
          end
          default: begin end
        endcase
      end
      8'h58: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h59: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h5a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h5b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000001f;
              4'hd: delta_pair = 32'h0000001f;
              4'he: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001f;
          end
          3'h2: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'h2: delta_pair = 32'h0000001f;
              4'h3: delta_pair = 32'h0000001f;
              4'h4: delta_pair = 32'h0000001f;
              4'h5: delta_pair = 32'h0000001f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001e;
          end
          3'h4: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001e;
              4'h1: delta_pair = 32'h0000001e;
              4'h2: delta_pair = 32'h0000001e;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001d;
          end
          3'h6: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'h5c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h5d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h0000000f;
              4'hd: delta_pair = 32'h0000000f;
              4'he: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000f;
          end
          3'h2: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h0000000f;
              4'h5: delta_pair = 32'h0000000f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000e;
          end
          3'h4: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000e;
              4'h1: delta_pair = 32'h0000000e;
              4'h2: delta_pair = 32'h0000000e;
              4'h3: delta_pair = 32'h0000000e;
              4'h4: delta_pair = 32'h0000000e;
              4'h5: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000d;
          end
          3'h6: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'h5e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000007;
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000006;
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000005;
          end
          3'h6: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'h5f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h000003ff;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000003fe;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000003ff;
              4'h1: delta_pair = 32'h000003ff;
              4'hf: delta_pair = 32'h000003fd;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h000003fd;
            case (mant_lo4)
              4'he: delta_pair = 32'h000003fc;
              4'hf: delta_pair = 32'h000003fc;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h000003fc;
            case (mant_lo4)
              4'he: delta_pair = 32'h000003fb;
              4'hf: delta_pair = 32'h000003fb;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h000003fb;
            case (mant_lo4)
              4'hf: delta_pair = 32'h000003fa;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h000003fa;
          end
          3'h6: begin
            delta_pair = 32'h000003f9;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000003fa;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000003f8;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000003f9;
              4'h1: delta_pair = 32'h000003f9;
              4'h2: delta_pair = 32'h000003f9;
              4'h3: delta_pair = 32'h000003f9;
              4'h4: delta_pair = 32'h000003f9;
              4'h5: delta_pair = 32'h000003f9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h60: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h61: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001a;
          end
          3'h6: begin
            delta_pair = 32'h00000019;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h2: delta_pair = 32'h00000019;
              4'h3: delta_pair = 32'h00000019;
              4'h4: delta_pair = 32'h00000019;
              4'h5: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h62: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h63: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000003e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003f;
              4'h1: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h0000003d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000003d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000003c;
              4'hf: delta_pair = 32'h0000003c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000003c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000003b;
              4'hf: delta_pair = 32'h0000003b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000003b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000003a;
          end
          3'h6: begin
            delta_pair = 32'h00000039;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000039;
              4'h1: delta_pair = 32'h00000039;
              4'h2: delta_pair = 32'h00000039;
              4'h3: delta_pair = 32'h00000039;
              4'h4: delta_pair = 32'h00000039;
              4'h5: delta_pair = 32'h00000039;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h64: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h65: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001a;
          end
          3'h6: begin
            delta_pair = 32'h00000019;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h2: delta_pair = 32'h00000019;
              4'h3: delta_pair = 32'h00000019;
              4'h4: delta_pair = 32'h00000019;
              4'h5: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h66: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h67: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000007f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000007e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007f;
              4'h1: delta_pair = 32'h0000007f;
              4'hf: delta_pair = 32'h0000007d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000007d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000007c;
              4'hf: delta_pair = 32'h0000007c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000007c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000007b;
              4'hf: delta_pair = 32'h0000007b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000007b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000007a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000007a;
          end
          3'h6: begin
            delta_pair = 32'h00000079;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000078;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000079;
              4'h1: delta_pair = 32'h00000079;
              4'h2: delta_pair = 32'h00000079;
              4'h3: delta_pair = 32'h00000079;
              4'h4: delta_pair = 32'h00000079;
              4'h5: delta_pair = 32'h00000079;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h68: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h69: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001a;
          end
          3'h6: begin
            delta_pair = 32'h00000019;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h2: delta_pair = 32'h00000019;
              4'h3: delta_pair = 32'h00000019;
              4'h4: delta_pair = 32'h00000019;
              4'h5: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000003e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003f;
              4'h1: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h0000003d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000003d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000003c;
              4'hf: delta_pair = 32'h0000003c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000003c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000003b;
              4'hf: delta_pair = 32'h0000003b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000003b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000003a;
          end
          3'h6: begin
            delta_pair = 32'h00000039;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000039;
              4'h1: delta_pair = 32'h00000039;
              4'h2: delta_pair = 32'h00000039;
              4'h3: delta_pair = 32'h00000039;
              4'h4: delta_pair = 32'h00000039;
              4'h5: delta_pair = 32'h00000039;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001f;
              4'h1: delta_pair = 32'h0000001f;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000001a;
          end
          3'h6: begin
            delta_pair = 32'h00000019;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h2: delta_pair = 32'h00000019;
              4'h3: delta_pair = 32'h00000019;
              4'h4: delta_pair = 32'h00000019;
              4'h5: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000d;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000a;
          end
          3'h6: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'h2: delta_pair = 32'h00000009;
              4'h3: delta_pair = 32'h00000009;
              4'h4: delta_pair = 32'h00000009;
              4'h5: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h000000ff;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h000000fe;
              4'ha: delta_pair = 32'h000000fe;
              4'hb: delta_pair = 32'h000000fe;
              4'hc: delta_pair = 32'h000000fe;
              4'hd: delta_pair = 32'h000000fe;
              4'he: delta_pair = 32'h000000fe;
              4'hf: delta_pair = 32'h000000fd;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000000fc;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000fd;
              4'h1: delta_pair = 32'h000000fd;
              4'h2: delta_pair = 32'h000000fd;
              4'h3: delta_pair = 32'h000000fd;
              4'h4: delta_pair = 32'h000000fd;
              4'hc: delta_pair = 32'h000000fb;
              4'hd: delta_pair = 32'h000000fb;
              4'he: delta_pair = 32'h000000fb;
              4'hf: delta_pair = 32'h000000fb;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h000000fa;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000fb;
              4'h1: delta_pair = 32'h000000fb;
              4'h2: delta_pair = 32'h000000fb;
              4'ha: delta_pair = 32'h000000f9;
              4'hb: delta_pair = 32'h000000f9;
              4'hc: delta_pair = 32'h000000f9;
              4'hd: delta_pair = 32'h000000f9;
              4'he: delta_pair = 32'h000000f9;
              4'hf: delta_pair = 32'h000000f9;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h000000f8;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000f9;
              4'h1: delta_pair = 32'h000000f9;
              4'h9: delta_pair = 32'h000000f7;
              4'ha: delta_pair = 32'h000000f7;
              4'hb: delta_pair = 32'h000000f7;
              4'hc: delta_pair = 32'h000000f7;
              4'hd: delta_pair = 32'h000000f7;
              4'he: delta_pair = 32'h000000f7;
              4'hf: delta_pair = 32'h000000f7;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h000000f6;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000f7;
              4'h1: delta_pair = 32'h000000f7;
              4'ha: delta_pair = 32'h000000f5;
              4'hb: delta_pair = 32'h000000f5;
              4'hc: delta_pair = 32'h000000f5;
              4'hd: delta_pair = 32'h000000f5;
              4'he: delta_pair = 32'h000000f5;
              4'hf: delta_pair = 32'h000000f5;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h000000f4;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000f5;
              4'h1: delta_pair = 32'h000000f5;
              4'h2: delta_pair = 32'h000000f5;
              4'hc: delta_pair = 32'h000000f3;
              4'hd: delta_pair = 32'h000000f3;
              4'he: delta_pair = 32'h000000f3;
              4'hf: delta_pair = 32'h000000f3;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h000000f2;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000f3;
              4'h1: delta_pair = 32'h000000f3;
              4'h2: delta_pair = 32'h000000f3;
              4'h3: delta_pair = 32'h000000f3;
              4'h4: delta_pair = 32'h000000f3;
              4'h5: delta_pair = 32'h000000f3;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000000f1;
            case (mant_lo4)
              4'hb: delta_pair = 32'h000000f0;
              4'hc: delta_pair = 32'h000000f0;
              4'hd: delta_pair = 32'h000000f0;
              4'he: delta_pair = 32'h000000f0;
              4'hf: delta_pair = 32'h000000f0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h70: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001d;
              4'h4: delta_pair = 32'h0000001d;
              4'hc: delta_pair = 32'h0000001b;
              4'hd: delta_pair = 32'h0000001b;
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001b;
              4'h1: delta_pair = 32'h0000001b;
              4'h2: delta_pair = 32'h0000001b;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h9: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000017;
              4'hb: delta_pair = 32'h00000017;
              4'hc: delta_pair = 32'h00000017;
              4'hd: delta_pair = 32'h00000017;
              4'he: delta_pair = 32'h00000017;
              4'hf: delta_pair = 32'h00000017;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000016;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000017;
              4'h1: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000015;
              4'hd: delta_pair = 32'h00000015;
              4'he: delta_pair = 32'h00000015;
              4'hf: delta_pair = 32'h00000015;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000014;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000015;
              4'h1: delta_pair = 32'h00000015;
              4'h2: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000013;
              4'hd: delta_pair = 32'h00000013;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000013;
              4'h1: delta_pair = 32'h00000013;
              4'h2: delta_pair = 32'h00000013;
              4'h3: delta_pair = 32'h00000013;
              4'h4: delta_pair = 32'h00000013;
              4'h5: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000011;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h71: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000003e;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003e;
              4'hd: delta_pair = 32'h0000003e;
              4'he: delta_pair = 32'h0000003e;
              4'hf: delta_pair = 32'h0000003d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000003c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003d;
              4'h1: delta_pair = 32'h0000003d;
              4'h2: delta_pair = 32'h0000003d;
              4'h3: delta_pair = 32'h0000003d;
              4'h4: delta_pair = 32'h0000003d;
              4'hc: delta_pair = 32'h0000003b;
              4'hd: delta_pair = 32'h0000003b;
              4'he: delta_pair = 32'h0000003b;
              4'hf: delta_pair = 32'h0000003b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000003a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003b;
              4'h1: delta_pair = 32'h0000003b;
              4'h2: delta_pair = 32'h0000003b;
              4'ha: delta_pair = 32'h00000039;
              4'hb: delta_pair = 32'h00000039;
              4'hc: delta_pair = 32'h00000039;
              4'hd: delta_pair = 32'h00000039;
              4'he: delta_pair = 32'h00000039;
              4'hf: delta_pair = 32'h00000039;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000039;
              4'h1: delta_pair = 32'h00000039;
              4'h9: delta_pair = 32'h00000037;
              4'ha: delta_pair = 32'h00000037;
              4'hb: delta_pair = 32'h00000037;
              4'hc: delta_pair = 32'h00000037;
              4'hd: delta_pair = 32'h00000037;
              4'he: delta_pair = 32'h00000037;
              4'hf: delta_pair = 32'h00000037;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000036;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000037;
              4'h1: delta_pair = 32'h00000037;
              4'ha: delta_pair = 32'h00000035;
              4'hb: delta_pair = 32'h00000035;
              4'hc: delta_pair = 32'h00000035;
              4'hd: delta_pair = 32'h00000035;
              4'he: delta_pair = 32'h00000035;
              4'hf: delta_pair = 32'h00000035;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000034;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000035;
              4'h1: delta_pair = 32'h00000035;
              4'h2: delta_pair = 32'h00000035;
              4'hc: delta_pair = 32'h00000033;
              4'hd: delta_pair = 32'h00000033;
              4'he: delta_pair = 32'h00000033;
              4'hf: delta_pair = 32'h00000033;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000032;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000033;
              4'h1: delta_pair = 32'h00000033;
              4'h2: delta_pair = 32'h00000033;
              4'h3: delta_pair = 32'h00000033;
              4'h4: delta_pair = 32'h00000033;
              4'h5: delta_pair = 32'h00000033;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000031;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000030;
              4'hc: delta_pair = 32'h00000030;
              4'hd: delta_pair = 32'h00000030;
              4'he: delta_pair = 32'h00000030;
              4'hf: delta_pair = 32'h00000030;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h72: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001d;
              4'h4: delta_pair = 32'h0000001d;
              4'hc: delta_pair = 32'h0000001b;
              4'hd: delta_pair = 32'h0000001b;
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001b;
              4'h1: delta_pair = 32'h0000001b;
              4'h2: delta_pair = 32'h0000001b;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h9: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000017;
              4'hb: delta_pair = 32'h00000017;
              4'hc: delta_pair = 32'h00000017;
              4'hd: delta_pair = 32'h00000017;
              4'he: delta_pair = 32'h00000017;
              4'hf: delta_pair = 32'h00000017;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000016;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000017;
              4'h1: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000015;
              4'hd: delta_pair = 32'h00000015;
              4'he: delta_pair = 32'h00000015;
              4'hf: delta_pair = 32'h00000015;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000014;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000015;
              4'h1: delta_pair = 32'h00000015;
              4'h2: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000013;
              4'hd: delta_pair = 32'h00000013;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000013;
              4'h1: delta_pair = 32'h00000013;
              4'h2: delta_pair = 32'h00000013;
              4'h3: delta_pair = 32'h00000013;
              4'h4: delta_pair = 32'h00000013;
              4'h5: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000011;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h73: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000007f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000007e;
              4'ha: delta_pair = 32'h0000007e;
              4'hb: delta_pair = 32'h0000007e;
              4'hc: delta_pair = 32'h0000007e;
              4'hd: delta_pair = 32'h0000007e;
              4'he: delta_pair = 32'h0000007e;
              4'hf: delta_pair = 32'h0000007d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000007c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007d;
              4'h1: delta_pair = 32'h0000007d;
              4'h2: delta_pair = 32'h0000007d;
              4'h3: delta_pair = 32'h0000007d;
              4'h4: delta_pair = 32'h0000007d;
              4'hc: delta_pair = 32'h0000007b;
              4'hd: delta_pair = 32'h0000007b;
              4'he: delta_pair = 32'h0000007b;
              4'hf: delta_pair = 32'h0000007b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000007a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007b;
              4'h1: delta_pair = 32'h0000007b;
              4'h2: delta_pair = 32'h0000007b;
              4'ha: delta_pair = 32'h00000079;
              4'hb: delta_pair = 32'h00000079;
              4'hc: delta_pair = 32'h00000079;
              4'hd: delta_pair = 32'h00000079;
              4'he: delta_pair = 32'h00000079;
              4'hf: delta_pair = 32'h00000079;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000078;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000079;
              4'h1: delta_pair = 32'h00000079;
              4'h9: delta_pair = 32'h00000077;
              4'ha: delta_pair = 32'h00000077;
              4'hb: delta_pair = 32'h00000077;
              4'hc: delta_pair = 32'h00000077;
              4'hd: delta_pair = 32'h00000077;
              4'he: delta_pair = 32'h00000077;
              4'hf: delta_pair = 32'h00000077;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000076;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000077;
              4'h1: delta_pair = 32'h00000077;
              4'ha: delta_pair = 32'h00000075;
              4'hb: delta_pair = 32'h00000075;
              4'hc: delta_pair = 32'h00000075;
              4'hd: delta_pair = 32'h00000075;
              4'he: delta_pair = 32'h00000075;
              4'hf: delta_pair = 32'h00000075;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000074;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000075;
              4'h1: delta_pair = 32'h00000075;
              4'h2: delta_pair = 32'h00000075;
              4'hc: delta_pair = 32'h00000073;
              4'hd: delta_pair = 32'h00000073;
              4'he: delta_pair = 32'h00000073;
              4'hf: delta_pair = 32'h00000073;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000072;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000073;
              4'h1: delta_pair = 32'h00000073;
              4'h2: delta_pair = 32'h00000073;
              4'h3: delta_pair = 32'h00000073;
              4'h4: delta_pair = 32'h00000073;
              4'h5: delta_pair = 32'h00000073;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000071;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000070;
              4'hc: delta_pair = 32'h00000070;
              4'hd: delta_pair = 32'h00000070;
              4'he: delta_pair = 32'h00000070;
              4'hf: delta_pair = 32'h00000070;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h74: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001d;
              4'h4: delta_pair = 32'h0000001d;
              4'hc: delta_pair = 32'h0000001b;
              4'hd: delta_pair = 32'h0000001b;
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001b;
              4'h1: delta_pair = 32'h0000001b;
              4'h2: delta_pair = 32'h0000001b;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h9: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000017;
              4'hb: delta_pair = 32'h00000017;
              4'hc: delta_pair = 32'h00000017;
              4'hd: delta_pair = 32'h00000017;
              4'he: delta_pair = 32'h00000017;
              4'hf: delta_pair = 32'h00000017;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000016;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000017;
              4'h1: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000015;
              4'hd: delta_pair = 32'h00000015;
              4'he: delta_pair = 32'h00000015;
              4'hf: delta_pair = 32'h00000015;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000014;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000015;
              4'h1: delta_pair = 32'h00000015;
              4'h2: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000013;
              4'hd: delta_pair = 32'h00000013;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000013;
              4'h1: delta_pair = 32'h00000013;
              4'h2: delta_pair = 32'h00000013;
              4'h3: delta_pair = 32'h00000013;
              4'h4: delta_pair = 32'h00000013;
              4'h5: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000011;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h75: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000003e;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003e;
              4'hd: delta_pair = 32'h0000003e;
              4'he: delta_pair = 32'h0000003e;
              4'hf: delta_pair = 32'h0000003d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000003c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003d;
              4'h1: delta_pair = 32'h0000003d;
              4'h2: delta_pair = 32'h0000003d;
              4'h3: delta_pair = 32'h0000003d;
              4'h4: delta_pair = 32'h0000003d;
              4'hc: delta_pair = 32'h0000003b;
              4'hd: delta_pair = 32'h0000003b;
              4'he: delta_pair = 32'h0000003b;
              4'hf: delta_pair = 32'h0000003b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000003a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003b;
              4'h1: delta_pair = 32'h0000003b;
              4'h2: delta_pair = 32'h0000003b;
              4'ha: delta_pair = 32'h00000039;
              4'hb: delta_pair = 32'h00000039;
              4'hc: delta_pair = 32'h00000039;
              4'hd: delta_pair = 32'h00000039;
              4'he: delta_pair = 32'h00000039;
              4'hf: delta_pair = 32'h00000039;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000039;
              4'h1: delta_pair = 32'h00000039;
              4'h9: delta_pair = 32'h00000037;
              4'ha: delta_pair = 32'h00000037;
              4'hb: delta_pair = 32'h00000037;
              4'hc: delta_pair = 32'h00000037;
              4'hd: delta_pair = 32'h00000037;
              4'he: delta_pair = 32'h00000037;
              4'hf: delta_pair = 32'h00000037;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000036;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000037;
              4'h1: delta_pair = 32'h00000037;
              4'ha: delta_pair = 32'h00000035;
              4'hb: delta_pair = 32'h00000035;
              4'hc: delta_pair = 32'h00000035;
              4'hd: delta_pair = 32'h00000035;
              4'he: delta_pair = 32'h00000035;
              4'hf: delta_pair = 32'h00000035;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000034;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000035;
              4'h1: delta_pair = 32'h00000035;
              4'h2: delta_pair = 32'h00000035;
              4'hc: delta_pair = 32'h00000033;
              4'hd: delta_pair = 32'h00000033;
              4'he: delta_pair = 32'h00000033;
              4'hf: delta_pair = 32'h00000033;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000032;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000033;
              4'h1: delta_pair = 32'h00000033;
              4'h2: delta_pair = 32'h00000033;
              4'h3: delta_pair = 32'h00000033;
              4'h4: delta_pair = 32'h00000033;
              4'h5: delta_pair = 32'h00000033;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000031;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000030;
              4'hc: delta_pair = 32'h00000030;
              4'hd: delta_pair = 32'h00000030;
              4'he: delta_pair = 32'h00000030;
              4'hf: delta_pair = 32'h00000030;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h76: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000001c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001d;
              4'h4: delta_pair = 32'h0000001d;
              4'hc: delta_pair = 32'h0000001b;
              4'hd: delta_pair = 32'h0000001b;
              4'he: delta_pair = 32'h0000001b;
              4'hf: delta_pair = 32'h0000001b;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000001a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001b;
              4'h1: delta_pair = 32'h0000001b;
              4'h2: delta_pair = 32'h0000001b;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h00000019;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000019;
              4'h1: delta_pair = 32'h00000019;
              4'h9: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000017;
              4'hb: delta_pair = 32'h00000017;
              4'hc: delta_pair = 32'h00000017;
              4'hd: delta_pair = 32'h00000017;
              4'he: delta_pair = 32'h00000017;
              4'hf: delta_pair = 32'h00000017;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000016;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000017;
              4'h1: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000015;
              4'hd: delta_pair = 32'h00000015;
              4'he: delta_pair = 32'h00000015;
              4'hf: delta_pair = 32'h00000015;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000014;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000015;
              4'h1: delta_pair = 32'h00000015;
              4'h2: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000013;
              4'hd: delta_pair = 32'h00000013;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000013;
              4'h1: delta_pair = 32'h00000013;
              4'h2: delta_pair = 32'h00000013;
              4'h3: delta_pair = 32'h00000013;
              4'h4: delta_pair = 32'h00000013;
              4'h5: delta_pair = 32'h00000013;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000011;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h77: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h000001ff;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h000001fe;
              4'h6: delta_pair = 32'h000001fe;
              4'h7: delta_pair = 32'h000001fe;
              4'h8: delta_pair = 32'h000001fd;
              4'h9: delta_pair = 32'h000001fd;
              4'ha: delta_pair = 32'h000001fd;
              4'hb: delta_pair = 32'h000001fc;
              4'hc: delta_pair = 32'h000001fc;
              4'hd: delta_pair = 32'h000001fc;
              4'he: delta_pair = 32'h000001fb;
              4'hf: delta_pair = 32'h000001fb;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000001f7;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000001fb;
              4'h1: delta_pair = 32'h000001fa;
              4'h2: delta_pair = 32'h000001fa;
              4'h3: delta_pair = 32'h000001fa;
              4'h4: delta_pair = 32'h000001f9;
              4'h5: delta_pair = 32'h000001f9;
              4'h6: delta_pair = 32'h000001f9;
              4'h7: delta_pair = 32'h000001f8;
              4'h8: delta_pair = 32'h000001f8;
              4'h9: delta_pair = 32'h000001f8;
              4'he: delta_pair = 32'h000001f6;
              4'hf: delta_pair = 32'h000001f6;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h000001f5;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000001f6;
              4'h5: delta_pair = 32'h000001f4;
              4'h6: delta_pair = 32'h000001f4;
              4'h7: delta_pair = 32'h000001f4;
              4'h8: delta_pair = 32'h000001f3;
              4'h9: delta_pair = 32'h000001f3;
              4'ha: delta_pair = 32'h000001f3;
              4'hb: delta_pair = 32'h000001f3;
              4'hc: delta_pair = 32'h000001f2;
              4'hd: delta_pair = 32'h000001f2;
              4'he: delta_pair = 32'h000001f2;
              4'hf: delta_pair = 32'h000001f2;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h000001ee;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000001f1;
              4'h1: delta_pair = 32'h000001f1;
              4'h2: delta_pair = 32'h000001f1;
              4'h3: delta_pair = 32'h000001f1;
              4'h4: delta_pair = 32'h000001f0;
              4'h5: delta_pair = 32'h000001f0;
              4'h6: delta_pair = 32'h000001f0;
              4'h7: delta_pair = 32'h000001ef;
              4'h8: delta_pair = 32'h000001ef;
              4'h9: delta_pair = 32'h000001ef;
              4'ha: delta_pair = 32'h000001ef;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h000001ed;
            case (mant_lo4)
              4'h4: delta_pair = 32'h000001ec;
              4'h5: delta_pair = 32'h000001ec;
              4'h6: delta_pair = 32'h000001ec;
              4'h7: delta_pair = 32'h000001ec;
              4'h8: delta_pair = 32'h000001eb;
              4'h9: delta_pair = 32'h000001eb;
              4'ha: delta_pair = 32'h000001eb;
              4'hb: delta_pair = 32'h000001eb;
              4'hc: delta_pair = 32'h000001ea;
              4'hd: delta_pair = 32'h000001ea;
              4'he: delta_pair = 32'h000001ea;
              4'hf: delta_pair = 32'h000001ea;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h000001e8;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000001ea;
              4'h1: delta_pair = 32'h000001e9;
              4'h2: delta_pair = 32'h000001e9;
              4'h3: delta_pair = 32'h000001e9;
              4'h4: delta_pair = 32'h000001e9;
              4'ha: delta_pair = 32'h000001e7;
              4'hb: delta_pair = 32'h000001e7;
              4'hc: delta_pair = 32'h000001e7;
              4'hd: delta_pair = 32'h000001e7;
              4'he: delta_pair = 32'h000001e7;
              4'hf: delta_pair = 32'h000001e6;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h000001e5;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000001e6;
              4'h1: delta_pair = 32'h000001e6;
              4'h2: delta_pair = 32'h000001e6;
              4'h3: delta_pair = 32'h000001e6;
              4'h9: delta_pair = 32'h000001e4;
              4'ha: delta_pair = 32'h000001e4;
              4'hb: delta_pair = 32'h000001e4;
              4'hc: delta_pair = 32'h000001e4;
              4'hd: delta_pair = 32'h000001e4;
              4'he: delta_pair = 32'h000001e3;
              4'hf: delta_pair = 32'h000001e3;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000001e1;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000001e3;
              4'h1: delta_pair = 32'h000001e3;
              4'h2: delta_pair = 32'h000001e3;
              4'h3: delta_pair = 32'h000001e2;
              4'h4: delta_pair = 32'h000001e2;
              4'h5: delta_pair = 32'h000001e2;
              4'h6: delta_pair = 32'h000001e2;
              4'h7: delta_pair = 32'h000001e2;
              4'he: delta_pair = 32'h000001e0;
              4'hf: delta_pair = 32'h000001e0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h78: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h0000003e;
              4'h6: delta_pair = 32'h0000003e;
              4'h7: delta_pair = 32'h0000003e;
              4'h8: delta_pair = 32'h0000003d;
              4'h9: delta_pair = 32'h0000003d;
              4'ha: delta_pair = 32'h0000003d;
              4'hb: delta_pair = 32'h0000003c;
              4'hc: delta_pair = 32'h0000003c;
              4'hd: delta_pair = 32'h0000003c;
              4'he: delta_pair = 32'h0000003b;
              4'hf: delta_pair = 32'h0000003b;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000037;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003b;
              4'h1: delta_pair = 32'h0000003a;
              4'h2: delta_pair = 32'h0000003a;
              4'h3: delta_pair = 32'h0000003a;
              4'h4: delta_pair = 32'h00000039;
              4'h5: delta_pair = 32'h00000039;
              4'h6: delta_pair = 32'h00000039;
              4'h7: delta_pair = 32'h00000038;
              4'h8: delta_pair = 32'h00000038;
              4'h9: delta_pair = 32'h00000038;
              4'he: delta_pair = 32'h00000036;
              4'hf: delta_pair = 32'h00000036;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000035;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000036;
              4'h5: delta_pair = 32'h00000034;
              4'h6: delta_pair = 32'h00000034;
              4'h7: delta_pair = 32'h00000034;
              4'h8: delta_pair = 32'h00000033;
              4'h9: delta_pair = 32'h00000033;
              4'ha: delta_pair = 32'h00000033;
              4'hb: delta_pair = 32'h00000033;
              4'hc: delta_pair = 32'h00000032;
              4'hd: delta_pair = 32'h00000032;
              4'he: delta_pair = 32'h00000032;
              4'hf: delta_pair = 32'h00000032;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000002e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000031;
              4'h1: delta_pair = 32'h00000031;
              4'h2: delta_pair = 32'h00000031;
              4'h3: delta_pair = 32'h00000031;
              4'h4: delta_pair = 32'h00000030;
              4'h5: delta_pair = 32'h00000030;
              4'h6: delta_pair = 32'h00000030;
              4'h7: delta_pair = 32'h0000002f;
              4'h8: delta_pair = 32'h0000002f;
              4'h9: delta_pair = 32'h0000002f;
              4'ha: delta_pair = 32'h0000002f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000002d;
            case (mant_lo4)
              4'h4: delta_pair = 32'h0000002c;
              4'h5: delta_pair = 32'h0000002c;
              4'h6: delta_pair = 32'h0000002c;
              4'h7: delta_pair = 32'h0000002c;
              4'h8: delta_pair = 32'h0000002b;
              4'h9: delta_pair = 32'h0000002b;
              4'ha: delta_pair = 32'h0000002b;
              4'hb: delta_pair = 32'h0000002b;
              4'hc: delta_pair = 32'h0000002a;
              4'hd: delta_pair = 32'h0000002a;
              4'he: delta_pair = 32'h0000002a;
              4'hf: delta_pair = 32'h0000002a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000028;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000002a;
              4'h1: delta_pair = 32'h00000029;
              4'h2: delta_pair = 32'h00000029;
              4'h3: delta_pair = 32'h00000029;
              4'h4: delta_pair = 32'h00000029;
              4'ha: delta_pair = 32'h00000027;
              4'hb: delta_pair = 32'h00000027;
              4'hc: delta_pair = 32'h00000027;
              4'hd: delta_pair = 32'h00000027;
              4'he: delta_pair = 32'h00000027;
              4'hf: delta_pair = 32'h00000026;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000025;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000026;
              4'h1: delta_pair = 32'h00000026;
              4'h2: delta_pair = 32'h00000026;
              4'h3: delta_pair = 32'h00000026;
              4'h9: delta_pair = 32'h00000024;
              4'ha: delta_pair = 32'h00000024;
              4'hb: delta_pair = 32'h00000024;
              4'hc: delta_pair = 32'h00000024;
              4'hd: delta_pair = 32'h00000024;
              4'he: delta_pair = 32'h00000023;
              4'hf: delta_pair = 32'h00000023;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000021;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000023;
              4'h1: delta_pair = 32'h00000023;
              4'h2: delta_pair = 32'h00000023;
              4'h3: delta_pair = 32'h00000022;
              4'h4: delta_pair = 32'h00000022;
              4'h5: delta_pair = 32'h00000022;
              4'h6: delta_pair = 32'h00000022;
              4'h7: delta_pair = 32'h00000022;
              4'he: delta_pair = 32'h00000020;
              4'hf: delta_pair = 32'h00000020;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h79: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000007f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h0000007e;
              4'h6: delta_pair = 32'h0000007e;
              4'h7: delta_pair = 32'h0000007e;
              4'h8: delta_pair = 32'h0000007d;
              4'h9: delta_pair = 32'h0000007d;
              4'ha: delta_pair = 32'h0000007d;
              4'hb: delta_pair = 32'h0000007c;
              4'hc: delta_pair = 32'h0000007c;
              4'hd: delta_pair = 32'h0000007c;
              4'he: delta_pair = 32'h0000007b;
              4'hf: delta_pair = 32'h0000007b;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000077;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000007b;
              4'h1: delta_pair = 32'h0000007a;
              4'h2: delta_pair = 32'h0000007a;
              4'h3: delta_pair = 32'h0000007a;
              4'h4: delta_pair = 32'h00000079;
              4'h5: delta_pair = 32'h00000079;
              4'h6: delta_pair = 32'h00000079;
              4'h7: delta_pair = 32'h00000078;
              4'h8: delta_pair = 32'h00000078;
              4'h9: delta_pair = 32'h00000078;
              4'he: delta_pair = 32'h00000076;
              4'hf: delta_pair = 32'h00000076;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000075;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000076;
              4'h5: delta_pair = 32'h00000074;
              4'h6: delta_pair = 32'h00000074;
              4'h7: delta_pair = 32'h00000074;
              4'h8: delta_pair = 32'h00000073;
              4'h9: delta_pair = 32'h00000073;
              4'ha: delta_pair = 32'h00000073;
              4'hb: delta_pair = 32'h00000073;
              4'hc: delta_pair = 32'h00000072;
              4'hd: delta_pair = 32'h00000072;
              4'he: delta_pair = 32'h00000072;
              4'hf: delta_pair = 32'h00000072;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000006e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000071;
              4'h1: delta_pair = 32'h00000071;
              4'h2: delta_pair = 32'h00000071;
              4'h3: delta_pair = 32'h00000071;
              4'h4: delta_pair = 32'h00000070;
              4'h5: delta_pair = 32'h00000070;
              4'h6: delta_pair = 32'h00000070;
              4'h7: delta_pair = 32'h0000006f;
              4'h8: delta_pair = 32'h0000006f;
              4'h9: delta_pair = 32'h0000006f;
              4'ha: delta_pair = 32'h0000006f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000006d;
            case (mant_lo4)
              4'h4: delta_pair = 32'h0000006c;
              4'h5: delta_pair = 32'h0000006c;
              4'h6: delta_pair = 32'h0000006c;
              4'h7: delta_pair = 32'h0000006c;
              4'h8: delta_pair = 32'h0000006b;
              4'h9: delta_pair = 32'h0000006b;
              4'ha: delta_pair = 32'h0000006b;
              4'hb: delta_pair = 32'h0000006b;
              4'hc: delta_pair = 32'h0000006a;
              4'hd: delta_pair = 32'h0000006a;
              4'he: delta_pair = 32'h0000006a;
              4'hf: delta_pair = 32'h0000006a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000068;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000006a;
              4'h1: delta_pair = 32'h00000069;
              4'h2: delta_pair = 32'h00000069;
              4'h3: delta_pair = 32'h00000069;
              4'h4: delta_pair = 32'h00000069;
              4'ha: delta_pair = 32'h00000067;
              4'hb: delta_pair = 32'h00000067;
              4'hc: delta_pair = 32'h00000067;
              4'hd: delta_pair = 32'h00000067;
              4'he: delta_pair = 32'h00000067;
              4'hf: delta_pair = 32'h00000066;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000065;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000066;
              4'h1: delta_pair = 32'h00000066;
              4'h2: delta_pair = 32'h00000066;
              4'h3: delta_pair = 32'h00000066;
              4'h9: delta_pair = 32'h00000064;
              4'ha: delta_pair = 32'h00000064;
              4'hb: delta_pair = 32'h00000064;
              4'hc: delta_pair = 32'h00000064;
              4'hd: delta_pair = 32'h00000064;
              4'he: delta_pair = 32'h00000063;
              4'hf: delta_pair = 32'h00000063;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000061;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000063;
              4'h1: delta_pair = 32'h00000063;
              4'h2: delta_pair = 32'h00000063;
              4'h3: delta_pair = 32'h00000062;
              4'h4: delta_pair = 32'h00000062;
              4'h5: delta_pair = 32'h00000062;
              4'h6: delta_pair = 32'h00000062;
              4'h7: delta_pair = 32'h00000062;
              4'he: delta_pair = 32'h00000060;
              4'hf: delta_pair = 32'h00000060;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000003f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h0000003e;
              4'h6: delta_pair = 32'h0000003e;
              4'h7: delta_pair = 32'h0000003e;
              4'h8: delta_pair = 32'h0000003d;
              4'h9: delta_pair = 32'h0000003d;
              4'ha: delta_pair = 32'h0000003d;
              4'hb: delta_pair = 32'h0000003c;
              4'hc: delta_pair = 32'h0000003c;
              4'hd: delta_pair = 32'h0000003c;
              4'he: delta_pair = 32'h0000003b;
              4'hf: delta_pair = 32'h0000003b;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000037;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003b;
              4'h1: delta_pair = 32'h0000003a;
              4'h2: delta_pair = 32'h0000003a;
              4'h3: delta_pair = 32'h0000003a;
              4'h4: delta_pair = 32'h00000039;
              4'h5: delta_pair = 32'h00000039;
              4'h6: delta_pair = 32'h00000039;
              4'h7: delta_pair = 32'h00000038;
              4'h8: delta_pair = 32'h00000038;
              4'h9: delta_pair = 32'h00000038;
              4'he: delta_pair = 32'h00000036;
              4'hf: delta_pair = 32'h00000036;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000035;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000036;
              4'h5: delta_pair = 32'h00000034;
              4'h6: delta_pair = 32'h00000034;
              4'h7: delta_pair = 32'h00000034;
              4'h8: delta_pair = 32'h00000033;
              4'h9: delta_pair = 32'h00000033;
              4'ha: delta_pair = 32'h00000033;
              4'hb: delta_pair = 32'h00000033;
              4'hc: delta_pair = 32'h00000032;
              4'hd: delta_pair = 32'h00000032;
              4'he: delta_pair = 32'h00000032;
              4'hf: delta_pair = 32'h00000032;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000002e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000031;
              4'h1: delta_pair = 32'h00000031;
              4'h2: delta_pair = 32'h00000031;
              4'h3: delta_pair = 32'h00000031;
              4'h4: delta_pair = 32'h00000030;
              4'h5: delta_pair = 32'h00000030;
              4'h6: delta_pair = 32'h00000030;
              4'h7: delta_pair = 32'h0000002f;
              4'h8: delta_pair = 32'h0000002f;
              4'h9: delta_pair = 32'h0000002f;
              4'ha: delta_pair = 32'h0000002f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000002d;
            case (mant_lo4)
              4'h4: delta_pair = 32'h0000002c;
              4'h5: delta_pair = 32'h0000002c;
              4'h6: delta_pair = 32'h0000002c;
              4'h7: delta_pair = 32'h0000002c;
              4'h8: delta_pair = 32'h0000002b;
              4'h9: delta_pair = 32'h0000002b;
              4'ha: delta_pair = 32'h0000002b;
              4'hb: delta_pair = 32'h0000002b;
              4'hc: delta_pair = 32'h0000002a;
              4'hd: delta_pair = 32'h0000002a;
              4'he: delta_pair = 32'h0000002a;
              4'hf: delta_pair = 32'h0000002a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000028;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000002a;
              4'h1: delta_pair = 32'h00000029;
              4'h2: delta_pair = 32'h00000029;
              4'h3: delta_pair = 32'h00000029;
              4'h4: delta_pair = 32'h00000029;
              4'ha: delta_pair = 32'h00000027;
              4'hb: delta_pair = 32'h00000027;
              4'hc: delta_pair = 32'h00000027;
              4'hd: delta_pair = 32'h00000027;
              4'he: delta_pair = 32'h00000027;
              4'hf: delta_pair = 32'h00000026;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000025;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000026;
              4'h1: delta_pair = 32'h00000026;
              4'h2: delta_pair = 32'h00000026;
              4'h3: delta_pair = 32'h00000026;
              4'h9: delta_pair = 32'h00000024;
              4'ha: delta_pair = 32'h00000024;
              4'hb: delta_pair = 32'h00000024;
              4'hc: delta_pair = 32'h00000024;
              4'hd: delta_pair = 32'h00000024;
              4'he: delta_pair = 32'h00000023;
              4'hf: delta_pair = 32'h00000023;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000021;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000023;
              4'h1: delta_pair = 32'h00000023;
              4'h2: delta_pair = 32'h00000023;
              4'h3: delta_pair = 32'h00000022;
              4'h4: delta_pair = 32'h00000022;
              4'h5: delta_pair = 32'h00000022;
              4'h6: delta_pair = 32'h00000022;
              4'h7: delta_pair = 32'h00000022;
              4'he: delta_pair = 32'h00000020;
              4'hf: delta_pair = 32'h00000020;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h000000ff;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h000000fe;
              4'h4: delta_pair = 32'h000000fd;
              4'h5: delta_pair = 32'h000000fc;
              4'h6: delta_pair = 32'h000000fc;
              4'h7: delta_pair = 32'h000000fb;
              4'h8: delta_pair = 32'h000000fa;
              4'h9: delta_pair = 32'h000000fa;
              4'ha: delta_pair = 32'h000000f9;
              4'hb: delta_pair = 32'h000000f8;
              4'hc: delta_pair = 32'h000000f8;
              4'hd: delta_pair = 32'h000000f7;
              4'he: delta_pair = 32'h000000f6;
              4'hf: delta_pair = 32'h000000f6;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000000f4;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000f5;
              4'h3: delta_pair = 32'h000000f3;
              4'h4: delta_pair = 32'h000000f3;
              4'h5: delta_pair = 32'h000000f2;
              4'h6: delta_pair = 32'h000000f1;
              4'h7: delta_pair = 32'h000000f1;
              4'h8: delta_pair = 32'h000000f0;
              4'h9: delta_pair = 32'h000000f0;
              4'ha: delta_pair = 32'h000000ef;
              4'hb: delta_pair = 32'h000000ee;
              4'hc: delta_pair = 32'h000000ee;
              4'hd: delta_pair = 32'h000000ed;
              4'he: delta_pair = 32'h000000ed;
              4'hf: delta_pair = 32'h000000ec;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h000000eb;
            case (mant_lo4)
              4'h2: delta_pair = 32'h000000ea;
              4'h3: delta_pair = 32'h000000ea;
              4'h4: delta_pair = 32'h000000e9;
              4'h5: delta_pair = 32'h000000e9;
              4'h6: delta_pair = 32'h000000e8;
              4'h7: delta_pair = 32'h000000e7;
              4'h8: delta_pair = 32'h000000e7;
              4'h9: delta_pair = 32'h000000e6;
              4'ha: delta_pair = 32'h000000e6;
              4'hb: delta_pair = 32'h000000e5;
              4'hc: delta_pair = 32'h000000e5;
              4'hd: delta_pair = 32'h000000e4;
              4'he: delta_pair = 32'h000000e4;
              4'hf: delta_pair = 32'h000000e3;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h000000dd;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000e3;
              4'h1: delta_pair = 32'h000000e2;
              4'h2: delta_pair = 32'h000000e2;
              4'h3: delta_pair = 32'h000000e1;
              4'h4: delta_pair = 32'h000000e1;
              4'h5: delta_pair = 32'h000000e0;
              4'h6: delta_pair = 32'h000000e0;
              4'h7: delta_pair = 32'h000000df;
              4'h8: delta_pair = 32'h000000de;
              4'h9: delta_pair = 32'h000000de;
              4'hd: delta_pair = 32'h000000dc;
              4'he: delta_pair = 32'h000000dc;
              4'hf: delta_pair = 32'h000000db;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h000000d5;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000db;
              4'h1: delta_pair = 32'h000000da;
              4'h2: delta_pair = 32'h000000da;
              4'h3: delta_pair = 32'h000000d9;
              4'h4: delta_pair = 32'h000000d9;
              4'h5: delta_pair = 32'h000000d8;
              4'h6: delta_pair = 32'h000000d8;
              4'h7: delta_pair = 32'h000000d7;
              4'h8: delta_pair = 32'h000000d7;
              4'h9: delta_pair = 32'h000000d6;
              4'ha: delta_pair = 32'h000000d6;
              4'he: delta_pair = 32'h000000d4;
              4'hf: delta_pair = 32'h000000d4;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h000000d1;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000d3;
              4'h1: delta_pair = 32'h000000d3;
              4'h2: delta_pair = 32'h000000d2;
              4'h3: delta_pair = 32'h000000d2;
              4'h7: delta_pair = 32'h000000d0;
              4'h8: delta_pair = 32'h000000d0;
              4'h9: delta_pair = 32'h000000cf;
              4'ha: delta_pair = 32'h000000cf;
              4'hb: delta_pair = 32'h000000ce;
              4'hc: delta_pair = 32'h000000ce;
              4'hd: delta_pair = 32'h000000ce;
              4'he: delta_pair = 32'h000000cd;
              4'hf: delta_pair = 32'h000000cd;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h000000cc;
            case (mant_lo4)
              4'h3: delta_pair = 32'h000000cb;
              4'h4: delta_pair = 32'h000000cb;
              4'h5: delta_pair = 32'h000000ca;
              4'h6: delta_pair = 32'h000000ca;
              4'h7: delta_pair = 32'h000000c9;
              4'h8: delta_pair = 32'h000000c9;
              4'h9: delta_pair = 32'h000000c9;
              4'ha: delta_pair = 32'h000000c8;
              4'hb: delta_pair = 32'h000000c8;
              4'hc: delta_pair = 32'h000000c8;
              4'hd: delta_pair = 32'h000000c7;
              4'he: delta_pair = 32'h000000c7;
              4'hf: delta_pair = 32'h000000c6;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000000c4;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000000c6;
              4'h1: delta_pair = 32'h000000c6;
              4'h2: delta_pair = 32'h000000c5;
              4'h3: delta_pair = 32'h000000c5;
              4'h7: delta_pair = 32'h000000c3;
              4'h8: delta_pair = 32'h000000c3;
              4'h9: delta_pair = 32'h000000c3;
              4'ha: delta_pair = 32'h000000c2;
              4'hb: delta_pair = 32'h000000c2;
              4'hc: delta_pair = 32'h000000c1;
              4'hd: delta_pair = 32'h000000c1;
              4'he: delta_pair = 32'h000000c1;
              4'hf: delta_pair = 32'h000000c0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h0000007f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h0000007e;
              4'h4: delta_pair = 32'h0000007d;
              4'h5: delta_pair = 32'h0000007c;
              4'h6: delta_pair = 32'h0000007c;
              4'h7: delta_pair = 32'h0000007b;
              4'h8: delta_pair = 32'h0000007a;
              4'h9: delta_pair = 32'h0000007a;
              4'ha: delta_pair = 32'h00000079;
              4'hb: delta_pair = 32'h00000078;
              4'hc: delta_pair = 32'h00000078;
              4'hd: delta_pair = 32'h00000077;
              4'he: delta_pair = 32'h00000076;
              4'hf: delta_pair = 32'h00000076;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000074;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000075;
              4'h3: delta_pair = 32'h00000073;
              4'h4: delta_pair = 32'h00000073;
              4'h5: delta_pair = 32'h00000072;
              4'h6: delta_pair = 32'h00000071;
              4'h7: delta_pair = 32'h00000071;
              4'h8: delta_pair = 32'h00000070;
              4'h9: delta_pair = 32'h00000070;
              4'ha: delta_pair = 32'h0000006f;
              4'hb: delta_pair = 32'h0000006e;
              4'hc: delta_pair = 32'h0000006e;
              4'hd: delta_pair = 32'h0000006d;
              4'he: delta_pair = 32'h0000006d;
              4'hf: delta_pair = 32'h0000006c;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000006b;
            case (mant_lo4)
              4'h2: delta_pair = 32'h0000006a;
              4'h3: delta_pair = 32'h0000006a;
              4'h4: delta_pair = 32'h00000069;
              4'h5: delta_pair = 32'h00000069;
              4'h6: delta_pair = 32'h00000068;
              4'h7: delta_pair = 32'h00000067;
              4'h8: delta_pair = 32'h00000067;
              4'h9: delta_pair = 32'h00000066;
              4'ha: delta_pair = 32'h00000066;
              4'hb: delta_pair = 32'h00000065;
              4'hc: delta_pair = 32'h00000065;
              4'hd: delta_pair = 32'h00000064;
              4'he: delta_pair = 32'h00000064;
              4'hf: delta_pair = 32'h00000063;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000005d;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000063;
              4'h1: delta_pair = 32'h00000062;
              4'h2: delta_pair = 32'h00000062;
              4'h3: delta_pair = 32'h00000061;
              4'h4: delta_pair = 32'h00000061;
              4'h5: delta_pair = 32'h00000060;
              4'h6: delta_pair = 32'h00000060;
              4'h7: delta_pair = 32'h0000005f;
              4'h8: delta_pair = 32'h0000005e;
              4'h9: delta_pair = 32'h0000005e;
              4'hd: delta_pair = 32'h0000005c;
              4'he: delta_pair = 32'h0000005c;
              4'hf: delta_pair = 32'h0000005b;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000055;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000005b;
              4'h1: delta_pair = 32'h0000005a;
              4'h2: delta_pair = 32'h0000005a;
              4'h3: delta_pair = 32'h00000059;
              4'h4: delta_pair = 32'h00000059;
              4'h5: delta_pair = 32'h00000058;
              4'h6: delta_pair = 32'h00000058;
              4'h7: delta_pair = 32'h00000057;
              4'h8: delta_pair = 32'h00000057;
              4'h9: delta_pair = 32'h00000056;
              4'ha: delta_pair = 32'h00000056;
              4'he: delta_pair = 32'h00000054;
              4'hf: delta_pair = 32'h00000054;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000051;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000053;
              4'h1: delta_pair = 32'h00000053;
              4'h2: delta_pair = 32'h00000052;
              4'h3: delta_pair = 32'h00000052;
              4'h7: delta_pair = 32'h00000050;
              4'h8: delta_pair = 32'h00000050;
              4'h9: delta_pair = 32'h0000004f;
              4'ha: delta_pair = 32'h0000004f;
              4'hb: delta_pair = 32'h0000004e;
              4'hc: delta_pair = 32'h0000004e;
              4'hd: delta_pair = 32'h0000004e;
              4'he: delta_pair = 32'h0000004d;
              4'hf: delta_pair = 32'h0000004d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000004c;
            case (mant_lo4)
              4'h3: delta_pair = 32'h0000004b;
              4'h4: delta_pair = 32'h0000004b;
              4'h5: delta_pair = 32'h0000004a;
              4'h6: delta_pair = 32'h0000004a;
              4'h7: delta_pair = 32'h00000049;
              4'h8: delta_pair = 32'h00000049;
              4'h9: delta_pair = 32'h00000049;
              4'ha: delta_pair = 32'h00000048;
              4'hb: delta_pair = 32'h00000048;
              4'hc: delta_pair = 32'h00000048;
              4'hd: delta_pair = 32'h00000047;
              4'he: delta_pair = 32'h00000047;
              4'hf: delta_pair = 32'h00000046;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000044;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000046;
              4'h1: delta_pair = 32'h00000046;
              4'h2: delta_pair = 32'h00000045;
              4'h3: delta_pair = 32'h00000045;
              4'h7: delta_pair = 32'h00000043;
              4'h8: delta_pair = 32'h00000043;
              4'h9: delta_pair = 32'h00000043;
              4'ha: delta_pair = 32'h00000042;
              4'hb: delta_pair = 32'h00000042;
              4'hc: delta_pair = 32'h00000041;
              4'hd: delta_pair = 32'h00000041;
              4'he: delta_pair = 32'h00000041;
              4'hf: delta_pair = 32'h00000040;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00007fff;
              4'h2: delta_pair = 32'h00007ffd;
              4'h3: delta_pair = 32'h00007ffc;
              4'h4: delta_pair = 32'h00007ffa;
              4'h5: delta_pair = 32'h00007ff9;
              4'h6: delta_pair = 32'h00007ff8;
              4'h7: delta_pair = 32'h00007ff6;
              4'h8: delta_pair = 32'h00007ff5;
              4'h9: delta_pair = 32'h00007ff3;
              4'ha: delta_pair = 32'h00007ff2;
              4'hb: delta_pair = 32'h00007ff1;
              4'hc: delta_pair = 32'h00007fef;
              4'hd: delta_pair = 32'h00007fee;
              4'he: delta_pair = 32'h00007fed;
              4'hf: delta_pair = 32'h00007fec;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00007fea;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00007fe9;
              4'h2: delta_pair = 32'h00007fe8;
              4'h3: delta_pair = 32'h00007fe6;
              4'h4: delta_pair = 32'h00007fe5;
              4'h5: delta_pair = 32'h00007fe4;
              4'h6: delta_pair = 32'h00007fe3;
              4'h7: delta_pair = 32'h00007fe1;
              4'h8: delta_pair = 32'h00007fe0;
              4'h9: delta_pair = 32'h00007fdf;
              4'ha: delta_pair = 32'h00007fde;
              4'hb: delta_pair = 32'h00007fdd;
              4'hc: delta_pair = 32'h00007fdb;
              4'hd: delta_pair = 32'h00007fda;
              4'he: delta_pair = 32'h00007fd9;
              4'hf: delta_pair = 32'h00007fd8;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00007fd7;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00007fd6;
              4'h2: delta_pair = 32'h00007fd4;
              4'h3: delta_pair = 32'h00007fd3;
              4'h4: delta_pair = 32'h00007fd2;
              4'h5: delta_pair = 32'h00007fd1;
              4'h6: delta_pair = 32'h00007fd0;
              4'h7: delta_pair = 32'h00007fcf;
              4'h8: delta_pair = 32'h00007fce;
              4'h9: delta_pair = 32'h00007fcd;
              4'ha: delta_pair = 32'h00007fcc;
              4'hb: delta_pair = 32'h00007fcb;
              4'hc: delta_pair = 32'h00007fc9;
              4'hd: delta_pair = 32'h00007fc8;
              4'he: delta_pair = 32'h00007fc7;
              4'hf: delta_pair = 32'h00007fc6;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00007fc5;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00007fc4;
              4'h2: delta_pair = 32'h00007fc3;
              4'h3: delta_pair = 32'h00007fc2;
              4'h4: delta_pair = 32'h00007fc1;
              4'h5: delta_pair = 32'h00007fc0;
              4'h6: delta_pair = 32'h00007fbf;
              4'h7: delta_pair = 32'h00007fbe;
              4'h8: delta_pair = 32'h00007fbd;
              4'h9: delta_pair = 32'h00007fbc;
              4'ha: delta_pair = 32'h00007fbb;
              4'hb: delta_pair = 32'h00007fba;
              4'hc: delta_pair = 32'h00007fb9;
              4'hd: delta_pair = 32'h00007fb8;
              4'he: delta_pair = 32'h00007fb7;
              4'hf: delta_pair = 32'h00007fb6;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00007faf;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00007fb5;
              4'h1: delta_pair = 32'h00007fb4;
              4'h2: delta_pair = 32'h00007fb3;
              4'h3: delta_pair = 32'h00007fb2;
              4'h4: delta_pair = 32'h00007fb1;
              4'h5: delta_pair = 32'h00007fb0;
              4'h8: delta_pair = 32'h00007fae;
              4'h9: delta_pair = 32'h00007fad;
              4'ha: delta_pair = 32'h00007fac;
              4'hb: delta_pair = 32'h00007fab;
              4'hc: delta_pair = 32'h00007faa;
              4'hd: delta_pair = 32'h00007fa9;
              4'he: delta_pair = 32'h00007fa8;
              4'hf: delta_pair = 32'h00007fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00007fa5;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00007fa6;
              4'h3: delta_pair = 32'h00007fa4;
              4'h4: delta_pair = 32'h00007fa3;
              4'h5: delta_pair = 32'h00007fa2;
              4'h6: delta_pair = 32'h00007fa1;
              4'h7: delta_pair = 32'h00007fa0;
              4'h8: delta_pair = 32'h00007f9f;
              4'h9: delta_pair = 32'h00007f9f;
              4'ha: delta_pair = 32'h00007f9e;
              4'hb: delta_pair = 32'h00007f9d;
              4'hc: delta_pair = 32'h00007f9c;
              4'hd: delta_pair = 32'h00007f9b;
              4'he: delta_pair = 32'h00007f9a;
              4'hf: delta_pair = 32'h00007f99;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00007f95;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00007f99;
              4'h1: delta_pair = 32'h00007f98;
              4'h2: delta_pair = 32'h00007f97;
              4'h3: delta_pair = 32'h00007f96;
              4'h6: delta_pair = 32'h00007f94;
              4'h7: delta_pair = 32'h00007f93;
              4'h8: delta_pair = 32'h00007f92;
              4'h9: delta_pair = 32'h00007f91;
              4'ha: delta_pair = 32'h00007f91;
              4'hb: delta_pair = 32'h00007f90;
              4'hc: delta_pair = 32'h00007f8f;
              4'hd: delta_pair = 32'h00007f8e;
              4'he: delta_pair = 32'h00007f8d;
              4'hf: delta_pair = 32'h00007f8d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00007f8a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00007f8c;
              4'h1: delta_pair = 32'h00007f8b;
              4'h4: delta_pair = 32'h00007f89;
              4'h5: delta_pair = 32'h00007f88;
              4'h6: delta_pair = 32'h00007f87;
              4'h7: delta_pair = 32'h00007f87;
              4'h8: delta_pair = 32'h00007f86;
              4'h9: delta_pair = 32'h00007f85;
              4'ha: delta_pair = 32'h00007f84;
              4'hb: delta_pair = 32'h00007f84;
              4'hc: delta_pair = 32'h00007f83;
              4'hd: delta_pair = 32'h00007f82;
              4'he: delta_pair = 32'h00007f81;
              4'hf: delta_pair = 32'h00007f81;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h000000fd;
              4'h2: delta_pair = 32'h000000fa;
              4'h3: delta_pair = 32'h000000f7;
              4'h4: delta_pair = 32'h000000f5;
              4'h5: delta_pair = 32'h000000f2;
              4'h6: delta_pair = 32'h000000ef;
              4'h7: delta_pair = 32'h000000ec;
              4'h8: delta_pair = 32'h000000ea;
              4'h9: delta_pair = 32'h000000e7;
              4'ha: delta_pair = 32'h000000e4;
              4'hb: delta_pair = 32'h000000e2;
              4'hc: delta_pair = 32'h000000df;
              4'hd: delta_pair = 32'h000000dc;
              4'he: delta_pair = 32'h000000da;
              4'hf: delta_pair = 32'h000000d7;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000000d4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h000000d2;
              4'h2: delta_pair = 32'h000000cf;
              4'h3: delta_pair = 32'h000000cd;
              4'h4: delta_pair = 32'h000000ca;
              4'h5: delta_pair = 32'h000000c8;
              4'h6: delta_pair = 32'h000000c5;
              4'h7: delta_pair = 32'h000000c3;
              4'h8: delta_pair = 32'h000000c1;
              4'h9: delta_pair = 32'h000000be;
              4'ha: delta_pair = 32'h000000bc;
              4'hb: delta_pair = 32'h000000b9;
              4'hc: delta_pair = 32'h000000b7;
              4'hd: delta_pair = 32'h000000b5;
              4'he: delta_pair = 32'h000000b2;
              4'hf: delta_pair = 32'h000000b0;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h000000ae;
            case (mant_lo4)
              4'h1: delta_pair = 32'h000000ab;
              4'h2: delta_pair = 32'h000000a9;
              4'h3: delta_pair = 32'h000000a7;
              4'h4: delta_pair = 32'h000000a4;
              4'h5: delta_pair = 32'h000000a2;
              4'h6: delta_pair = 32'h000000a0;
              4'h7: delta_pair = 32'h0000009e;
              4'h8: delta_pair = 32'h0000009c;
              4'h9: delta_pair = 32'h00000099;
              4'ha: delta_pair = 32'h00000097;
              4'hb: delta_pair = 32'h00000095;
              4'hc: delta_pair = 32'h00000093;
              4'hd: delta_pair = 32'h00000091;
              4'he: delta_pair = 32'h0000008f;
              4'hf: delta_pair = 32'h0000008c;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000008a;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00000088;
              4'h2: delta_pair = 32'h00000086;
              4'h3: delta_pair = 32'h00000084;
              4'h4: delta_pair = 32'h00000082;
              4'h5: delta_pair = 32'h00000080;
              4'h6: delta_pair = 32'h0000017c;
              4'h7: delta_pair = 32'h00000178;
              4'h8: delta_pair = 32'h00000174;
              4'h9: delta_pair = 32'h00000170;
              4'ha: delta_pair = 32'h0000016c;
              4'hb: delta_pair = 32'h00000168;
              4'hc: delta_pair = 32'h00000164;
              4'hd: delta_pair = 32'h00000160;
              4'he: delta_pair = 32'h0000015c;
              4'hf: delta_pair = 32'h00000158;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000154;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00000151;
              4'h2: delta_pair = 32'h0000014d;
              4'h3: delta_pair = 32'h00000149;
              4'h4: delta_pair = 32'h00000145;
              4'h5: delta_pair = 32'h00000142;
              4'h6: delta_pair = 32'h0000013e;
              4'h7: delta_pair = 32'h0000013a;
              4'h8: delta_pair = 32'h00000136;
              4'h9: delta_pair = 32'h00000133;
              4'ha: delta_pair = 32'h0000012f;
              4'hb: delta_pair = 32'h0000012b;
              4'hc: delta_pair = 32'h00000128;
              4'hd: delta_pair = 32'h00000124;
              4'he: delta_pair = 32'h00000121;
              4'hf: delta_pair = 32'h0000011d;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000119;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00000116;
              4'h2: delta_pair = 32'h00000112;
              4'h3: delta_pair = 32'h0000010f;
              4'h4: delta_pair = 32'h0000010b;
              4'h5: delta_pair = 32'h00000108;
              4'h6: delta_pair = 32'h00000104;
              4'h7: delta_pair = 32'h00000101;
              4'h8: delta_pair = 32'h000001fb;
              4'h9: delta_pair = 32'h000001f4;
              4'ha: delta_pair = 32'h000001ed;
              4'hb: delta_pair = 32'h000001e7;
              4'hc: delta_pair = 32'h000001e0;
              4'hd: delta_pair = 32'h000001d9;
              4'he: delta_pair = 32'h000001d3;
              4'hf: delta_pair = 32'h000001cc;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h000001c5;
            case (mant_lo4)
              4'h1: delta_pair = 32'h000001bf;
              4'h2: delta_pair = 32'h000001b8;
              4'h3: delta_pair = 32'h000001b2;
              4'h4: delta_pair = 32'h000001ab;
              4'h5: delta_pair = 32'h000001a5;
              4'h6: delta_pair = 32'h0000019e;
              4'h7: delta_pair = 32'h00000198;
              4'h8: delta_pair = 32'h00000191;
              4'h9: delta_pair = 32'h0000018b;
              4'ha: delta_pair = 32'h00000185;
              4'hb: delta_pair = 32'h0000027d;
              4'hc: delta_pair = 32'h00000270;
              4'hd: delta_pair = 32'h00000264;
              4'he: delta_pair = 32'h00000257;
              4'hf: delta_pair = 32'h0000024b;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000023f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00000232;
              4'h2: delta_pair = 32'h00000226;
              4'h3: delta_pair = 32'h0000021a;
              4'h4: delta_pair = 32'h0000020e;
              4'h5: delta_pair = 32'h00000202;
              4'h6: delta_pair = 32'h000002eb;
              4'h7: delta_pair = 32'h000002d3;
              4'h8: delta_pair = 32'h000002bc;
              4'h9: delta_pair = 32'h000002a4;
              4'ha: delta_pair = 32'h0000028c;
              4'hb: delta_pair = 32'h00000369;
              4'hc: delta_pair = 32'h0000033a;
              4'hd: delta_pair = 32'h0000030b;
              4'he: delta_pair = 32'h000003b9;
              4'hf: delta_pair = 32'h00000439;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003c38;
              4'h2: delta_pair = 32'h00003cb7;
              4'h3: delta_pair = 32'h00003d09;
              4'h4: delta_pair = 32'h00003d36;
              4'h5: delta_pair = 32'h00003d62;
              4'h6: delta_pair = 32'h00003d87;
              4'h7: delta_pair = 32'h00003d9d;
              4'h8: delta_pair = 32'h00003db3;
              4'h9: delta_pair = 32'h00003dc9;
              4'ha: delta_pair = 32'h00003dde;
              4'hb: delta_pair = 32'h00003df4;
              4'hc: delta_pair = 32'h00003e04;
              4'hd: delta_pair = 32'h00003e0f;
              4'he: delta_pair = 32'h00003e19;
              4'hf: delta_pair = 32'h00003e24;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00003e2e;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003e38;
              4'h2: delta_pair = 32'h00003e42;
              4'h3: delta_pair = 32'h00003e4c;
              4'h4: delta_pair = 32'h00003e56;
              4'h5: delta_pair = 32'h00003e60;
              4'h6: delta_pair = 32'h00003e6a;
              4'h7: delta_pair = 32'h00003e74;
              4'h8: delta_pair = 32'h00003e7e;
              4'h9: delta_pair = 32'h00003e84;
              4'ha: delta_pair = 32'h00003e89;
              4'hb: delta_pair = 32'h00003e8d;
              4'hc: delta_pair = 32'h00003e92;
              4'hd: delta_pair = 32'h00003e97;
              4'he: delta_pair = 32'h00003e9c;
              4'hf: delta_pair = 32'h00003ea0;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00003ea5;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003ea9;
              4'h2: delta_pair = 32'h00003eae;
              4'h3: delta_pair = 32'h00003eb3;
              4'h4: delta_pair = 32'h00003eb7;
              4'h5: delta_pair = 32'h00003ebc;
              4'h6: delta_pair = 32'h00003ec0;
              4'h7: delta_pair = 32'h00003ec4;
              4'h8: delta_pair = 32'h00003ec9;
              4'h9: delta_pair = 32'h00003ecd;
              4'ha: delta_pair = 32'h00003ed2;
              4'hb: delta_pair = 32'h00003ed6;
              4'hc: delta_pair = 32'h00003eda;
              4'hd: delta_pair = 32'h00003edf;
              4'he: delta_pair = 32'h00003ee3;
              4'hf: delta_pair = 32'h00003ee7;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00003eeb;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003eef;
              4'h2: delta_pair = 32'h00003ef4;
              4'h3: delta_pair = 32'h00003ef8;
              4'h4: delta_pair = 32'h00003efc;
              4'h5: delta_pair = 32'h00003f00;
              4'h6: delta_pair = 32'h00003f02;
              4'h7: delta_pair = 32'h00003f04;
              4'h8: delta_pair = 32'h00003f06;
              4'h9: delta_pair = 32'h00003f08;
              4'ha: delta_pair = 32'h00003f0a;
              4'hb: delta_pair = 32'h00003f0c;
              4'hc: delta_pair = 32'h00003f0e;
              4'hd: delta_pair = 32'h00003f10;
              4'he: delta_pair = 32'h00003f12;
              4'hf: delta_pair = 32'h00003f14;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00003f16;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003f18;
              4'h2: delta_pair = 32'h00003f1a;
              4'h3: delta_pair = 32'h00003f1b;
              4'h4: delta_pair = 32'h00003f1d;
              4'h5: delta_pair = 32'h00003f1f;
              4'h6: delta_pair = 32'h00003f21;
              4'h7: delta_pair = 32'h00003f23;
              4'h8: delta_pair = 32'h00003f25;
              4'h9: delta_pair = 32'h00003f27;
              4'ha: delta_pair = 32'h00003f29;
              4'hb: delta_pair = 32'h00003f2a;
              4'hc: delta_pair = 32'h00003f2c;
              4'hd: delta_pair = 32'h00003f2e;
              4'he: delta_pair = 32'h00003f30;
              4'hf: delta_pair = 32'h00003f32;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00003f33;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003f35;
              4'h2: delta_pair = 32'h00003f37;
              4'h3: delta_pair = 32'h00003f39;
              4'h4: delta_pair = 32'h00003f3a;
              4'h5: delta_pair = 32'h00003f3c;
              4'h6: delta_pair = 32'h00003f3e;
              4'h7: delta_pair = 32'h00003f40;
              4'h8: delta_pair = 32'h00003f41;
              4'h9: delta_pair = 32'h00003f43;
              4'ha: delta_pair = 32'h00003f45;
              4'hb: delta_pair = 32'h00003f46;
              4'hc: delta_pair = 32'h00003f48;
              4'hd: delta_pair = 32'h00003f4a;
              4'he: delta_pair = 32'h00003f4b;
              4'hf: delta_pair = 32'h00003f4d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00003f4f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003f50;
              4'h2: delta_pair = 32'h00003f52;
              4'h3: delta_pair = 32'h00003f54;
              4'h4: delta_pair = 32'h00003f55;
              4'h5: delta_pair = 32'h00003f57;
              4'h6: delta_pair = 32'h00003f58;
              4'h7: delta_pair = 32'h00003f5a;
              4'h8: delta_pair = 32'h00003f5c;
              4'h9: delta_pair = 32'h00003f5d;
              4'ha: delta_pair = 32'h00003f5f;
              4'hb: delta_pair = 32'h00003f60;
              4'hc: delta_pair = 32'h00003f62;
              4'hd: delta_pair = 32'h00003f64;
              4'he: delta_pair = 32'h00003f65;
              4'hf: delta_pair = 32'h00003f67;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00003f68;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00003f6a;
              4'h2: delta_pair = 32'h00003f6b;
              4'h3: delta_pair = 32'h00003f6d;
              4'h4: delta_pair = 32'h00003f6e;
              4'h5: delta_pair = 32'h00003f70;
              4'h6: delta_pair = 32'h00003f71;
              4'h7: delta_pair = 32'h00003f73;
              4'h8: delta_pair = 32'h00003f74;
              4'h9: delta_pair = 32'h00003f76;
              4'ha: delta_pair = 32'h00003f77;
              4'hb: delta_pair = 32'h00003f79;
              4'hc: delta_pair = 32'h00003f7a;
              4'hd: delta_pair = 32'h00003f7c;
              4'he: delta_pair = 32'h00003f7d;
              4'hf: delta_pair = 32'h00003f7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h80: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000004;
              4'h4: delta_pair = 32'h00000006;
              4'h5: delta_pair = 32'h00000007;
              4'h6: delta_pair = 32'h00000008;
              4'h7: delta_pair = 32'h0000000a;
              4'h8: delta_pair = 32'h0000000b;
              4'h9: delta_pair = 32'h0000000d;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000f;
              4'hc: delta_pair = 32'h00000011;
              4'hd: delta_pair = 32'h00000012;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000014;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000016;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00000017;
              4'h2: delta_pair = 32'h00000018;
              4'h3: delta_pair = 32'h0000001a;
              4'h4: delta_pair = 32'h0000001b;
              4'h5: delta_pair = 32'h0000001c;
              4'h6: delta_pair = 32'h0000001d;
              4'h7: delta_pair = 32'h0000001f;
              4'h8: delta_pair = 32'h00000020;
              4'h9: delta_pair = 32'h00000021;
              4'ha: delta_pair = 32'h00000022;
              4'hb: delta_pair = 32'h00000023;
              4'hc: delta_pair = 32'h00000025;
              4'hd: delta_pair = 32'h00000026;
              4'he: delta_pair = 32'h00000027;
              4'hf: delta_pair = 32'h00000028;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000029;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0000002a;
              4'h2: delta_pair = 32'h0000002c;
              4'h3: delta_pair = 32'h0000002d;
              4'h4: delta_pair = 32'h0000002e;
              4'h5: delta_pair = 32'h0000002f;
              4'h6: delta_pair = 32'h00000030;
              4'h7: delta_pair = 32'h00000031;
              4'h8: delta_pair = 32'h00000032;
              4'h9: delta_pair = 32'h00000033;
              4'ha: delta_pair = 32'h00000034;
              4'hb: delta_pair = 32'h00000035;
              4'hc: delta_pair = 32'h00000037;
              4'hd: delta_pair = 32'h00000038;
              4'he: delta_pair = 32'h00000039;
              4'hf: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h0000003b;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0000003c;
              4'h2: delta_pair = 32'h0000003d;
              4'h3: delta_pair = 32'h0000003e;
              4'h4: delta_pair = 32'h0000003f;
              4'h5: delta_pair = 32'h00000040;
              4'h6: delta_pair = 32'h00000041;
              4'h7: delta_pair = 32'h00000042;
              4'h8: delta_pair = 32'h00000043;
              4'h9: delta_pair = 32'h00000044;
              4'ha: delta_pair = 32'h00000045;
              4'hb: delta_pair = 32'h00000046;
              4'hc: delta_pair = 32'h00000047;
              4'hd: delta_pair = 32'h00000048;
              4'he: delta_pair = 32'h00000049;
              4'hf: delta_pair = 32'h0000004a;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000051;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000004b;
              4'h1: delta_pair = 32'h0000004c;
              4'h2: delta_pair = 32'h0000004d;
              4'h3: delta_pair = 32'h0000004e;
              4'h4: delta_pair = 32'h0000004f;
              4'h5: delta_pair = 32'h00000050;
              4'h8: delta_pair = 32'h00000052;
              4'h9: delta_pair = 32'h00000053;
              4'ha: delta_pair = 32'h00000054;
              4'hb: delta_pair = 32'h00000055;
              4'hc: delta_pair = 32'h00000056;
              4'hd: delta_pair = 32'h00000057;
              4'he: delta_pair = 32'h00000058;
              4'hf: delta_pair = 32'h00000059;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000005b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000005a;
              4'h3: delta_pair = 32'h0000005c;
              4'h4: delta_pair = 32'h0000005d;
              4'h5: delta_pair = 32'h0000005e;
              4'h6: delta_pair = 32'h0000005f;
              4'h7: delta_pair = 32'h00000060;
              4'h8: delta_pair = 32'h00000061;
              4'h9: delta_pair = 32'h00000061;
              4'ha: delta_pair = 32'h00000062;
              4'hb: delta_pair = 32'h00000063;
              4'hc: delta_pair = 32'h00000064;
              4'hd: delta_pair = 32'h00000065;
              4'he: delta_pair = 32'h00000066;
              4'hf: delta_pair = 32'h00000067;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000006b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000067;
              4'h1: delta_pair = 32'h00000068;
              4'h2: delta_pair = 32'h00000069;
              4'h3: delta_pair = 32'h0000006a;
              4'h6: delta_pair = 32'h0000006c;
              4'h7: delta_pair = 32'h0000006d;
              4'h8: delta_pair = 32'h0000006e;
              4'h9: delta_pair = 32'h0000006f;
              4'ha: delta_pair = 32'h0000006f;
              4'hb: delta_pair = 32'h00000070;
              4'hc: delta_pair = 32'h00000071;
              4'hd: delta_pair = 32'h00000072;
              4'he: delta_pair = 32'h00000073;
              4'hf: delta_pair = 32'h00000073;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000076;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000074;
              4'h1: delta_pair = 32'h00000075;
              4'h4: delta_pair = 32'h00000077;
              4'h5: delta_pair = 32'h00000078;
              4'h6: delta_pair = 32'h00000079;
              4'h7: delta_pair = 32'h00000079;
              4'h8: delta_pair = 32'h0000007a;
              4'h9: delta_pair = 32'h0000007b;
              4'ha: delta_pair = 32'h0000007c;
              4'hb: delta_pair = 32'h0000007c;
              4'hc: delta_pair = 32'h0000007d;
              4'hd: delta_pair = 32'h0000007e;
              4'he: delta_pair = 32'h0000007f;
              4'hf: delta_pair = 32'h0000007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h81: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000003;
              4'h5: delta_pair = 32'h00000004;
              4'h6: delta_pair = 32'h00000004;
              4'h7: delta_pair = 32'h00000005;
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000008;
              4'hc: delta_pair = 32'h00000008;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h0000000a;
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000e;
              4'h6: delta_pair = 32'h0000000f;
              4'h7: delta_pair = 32'h0000000f;
              4'h8: delta_pair = 32'h00000010;
              4'h9: delta_pair = 32'h00000010;
              4'ha: delta_pair = 32'h00000011;
              4'hb: delta_pair = 32'h00000012;
              4'hc: delta_pair = 32'h00000012;
              4'hd: delta_pair = 32'h00000013;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000014;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000015;
            case (mant_lo4)
              4'h2: delta_pair = 32'h00000016;
              4'h3: delta_pair = 32'h00000016;
              4'h4: delta_pair = 32'h00000017;
              4'h5: delta_pair = 32'h00000017;
              4'h6: delta_pair = 32'h00000018;
              4'h7: delta_pair = 32'h00000019;
              4'h8: delta_pair = 32'h00000019;
              4'h9: delta_pair = 32'h0000001a;
              4'ha: delta_pair = 32'h0000001a;
              4'hb: delta_pair = 32'h0000001b;
              4'hc: delta_pair = 32'h0000001b;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000023;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001e;
              4'h2: delta_pair = 32'h0000001e;
              4'h3: delta_pair = 32'h0000001f;
              4'h4: delta_pair = 32'h0000001f;
              4'h5: delta_pair = 32'h00000020;
              4'h6: delta_pair = 32'h00000020;
              4'h7: delta_pair = 32'h00000021;
              4'h8: delta_pair = 32'h00000022;
              4'h9: delta_pair = 32'h00000022;
              4'hd: delta_pair = 32'h00000024;
              4'he: delta_pair = 32'h00000024;
              4'hf: delta_pair = 32'h00000025;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000002b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000025;
              4'h1: delta_pair = 32'h00000026;
              4'h2: delta_pair = 32'h00000026;
              4'h3: delta_pair = 32'h00000027;
              4'h4: delta_pair = 32'h00000027;
              4'h5: delta_pair = 32'h00000028;
              4'h6: delta_pair = 32'h00000028;
              4'h7: delta_pair = 32'h00000029;
              4'h8: delta_pair = 32'h00000029;
              4'h9: delta_pair = 32'h0000002a;
              4'ha: delta_pair = 32'h0000002a;
              4'he: delta_pair = 32'h0000002c;
              4'hf: delta_pair = 32'h0000002c;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000002f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000002d;
              4'h1: delta_pair = 32'h0000002d;
              4'h2: delta_pair = 32'h0000002e;
              4'h3: delta_pair = 32'h0000002e;
              4'h7: delta_pair = 32'h00000030;
              4'h8: delta_pair = 32'h00000030;
              4'h9: delta_pair = 32'h00000031;
              4'ha: delta_pair = 32'h00000031;
              4'hb: delta_pair = 32'h00000032;
              4'hc: delta_pair = 32'h00000032;
              4'hd: delta_pair = 32'h00000032;
              4'he: delta_pair = 32'h00000033;
              4'hf: delta_pair = 32'h00000033;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000034;
            case (mant_lo4)
              4'h3: delta_pair = 32'h00000035;
              4'h4: delta_pair = 32'h00000035;
              4'h5: delta_pair = 32'h00000036;
              4'h6: delta_pair = 32'h00000036;
              4'h7: delta_pair = 32'h00000037;
              4'h8: delta_pair = 32'h00000037;
              4'h9: delta_pair = 32'h00000037;
              4'ha: delta_pair = 32'h00000038;
              4'hb: delta_pair = 32'h00000038;
              4'hc: delta_pair = 32'h00000038;
              4'hd: delta_pair = 32'h00000039;
              4'he: delta_pair = 32'h00000039;
              4'hf: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000003c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003a;
              4'h1: delta_pair = 32'h0000003a;
              4'h2: delta_pair = 32'h0000003b;
              4'h3: delta_pair = 32'h0000003b;
              4'h7: delta_pair = 32'h0000003d;
              4'h8: delta_pair = 32'h0000003d;
              4'h9: delta_pair = 32'h0000003d;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003f;
              4'hd: delta_pair = 32'h0000003f;
              4'he: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h00000040;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h82: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000003;
              4'h5: delta_pair = 32'h00000004;
              4'h6: delta_pair = 32'h00000004;
              4'h7: delta_pair = 32'h00000005;
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000008;
              4'hc: delta_pair = 32'h00000008;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h0000000a;
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000e;
              4'h6: delta_pair = 32'h0000000f;
              4'h7: delta_pair = 32'h0000000f;
              4'h8: delta_pair = 32'h00000010;
              4'h9: delta_pair = 32'h00000010;
              4'ha: delta_pair = 32'h00000011;
              4'hb: delta_pair = 32'h00000012;
              4'hc: delta_pair = 32'h00000012;
              4'hd: delta_pair = 32'h00000013;
              4'he: delta_pair = 32'h00000013;
              4'hf: delta_pair = 32'h00000014;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000015;
            case (mant_lo4)
              4'h2: delta_pair = 32'h00000016;
              4'h3: delta_pair = 32'h00000016;
              4'h4: delta_pair = 32'h00000017;
              4'h5: delta_pair = 32'h00000017;
              4'h6: delta_pair = 32'h00000018;
              4'h7: delta_pair = 32'h00000019;
              4'h8: delta_pair = 32'h00000019;
              4'h9: delta_pair = 32'h0000001a;
              4'ha: delta_pair = 32'h0000001a;
              4'hb: delta_pair = 32'h0000001b;
              4'hc: delta_pair = 32'h0000001b;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000023;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001e;
              4'h2: delta_pair = 32'h0000001e;
              4'h3: delta_pair = 32'h0000001f;
              4'h4: delta_pair = 32'h0000001f;
              4'h5: delta_pair = 32'h00000020;
              4'h6: delta_pair = 32'h00000020;
              4'h7: delta_pair = 32'h00000021;
              4'h8: delta_pair = 32'h00000022;
              4'h9: delta_pair = 32'h00000022;
              4'hd: delta_pair = 32'h00000024;
              4'he: delta_pair = 32'h00000024;
              4'hf: delta_pair = 32'h00000025;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000002b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000025;
              4'h1: delta_pair = 32'h00000026;
              4'h2: delta_pair = 32'h00000026;
              4'h3: delta_pair = 32'h00000027;
              4'h4: delta_pair = 32'h00000027;
              4'h5: delta_pair = 32'h00000028;
              4'h6: delta_pair = 32'h00000028;
              4'h7: delta_pair = 32'h00000029;
              4'h8: delta_pair = 32'h00000029;
              4'h9: delta_pair = 32'h0000002a;
              4'ha: delta_pair = 32'h0000002a;
              4'he: delta_pair = 32'h0000002c;
              4'hf: delta_pair = 32'h0000002c;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000002f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000002d;
              4'h1: delta_pair = 32'h0000002d;
              4'h2: delta_pair = 32'h0000002e;
              4'h3: delta_pair = 32'h0000002e;
              4'h7: delta_pair = 32'h00000030;
              4'h8: delta_pair = 32'h00000030;
              4'h9: delta_pair = 32'h00000031;
              4'ha: delta_pair = 32'h00000031;
              4'hb: delta_pair = 32'h00000032;
              4'hc: delta_pair = 32'h00000032;
              4'hd: delta_pair = 32'h00000032;
              4'he: delta_pair = 32'h00000033;
              4'hf: delta_pair = 32'h00000033;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000034;
            case (mant_lo4)
              4'h3: delta_pair = 32'h00000035;
              4'h4: delta_pair = 32'h00000035;
              4'h5: delta_pair = 32'h00000036;
              4'h6: delta_pair = 32'h00000036;
              4'h7: delta_pair = 32'h00000037;
              4'h8: delta_pair = 32'h00000037;
              4'h9: delta_pair = 32'h00000037;
              4'ha: delta_pair = 32'h00000038;
              4'hb: delta_pair = 32'h00000038;
              4'hc: delta_pair = 32'h00000038;
              4'hd: delta_pair = 32'h00000039;
              4'he: delta_pair = 32'h00000039;
              4'hf: delta_pair = 32'h0000003a;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000003c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000003a;
              4'h1: delta_pair = 32'h0000003a;
              4'h2: delta_pair = 32'h0000003b;
              4'h3: delta_pair = 32'h0000003b;
              4'h7: delta_pair = 32'h0000003d;
              4'h8: delta_pair = 32'h0000003d;
              4'h9: delta_pair = 32'h0000003d;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003f;
              4'hd: delta_pair = 32'h0000003f;
              4'he: delta_pair = 32'h0000003f;
              4'hf: delta_pair = 32'h000000c0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h83: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000002;
              4'h6: delta_pair = 32'h00000002;
              4'h7: delta_pair = 32'h00000002;
              4'h8: delta_pair = 32'h00000003;
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              4'h6: delta_pair = 32'h00000007;
              4'h7: delta_pair = 32'h00000008;
              4'h8: delta_pair = 32'h00000008;
              4'h9: delta_pair = 32'h00000008;
              4'he: delta_pair = 32'h0000000a;
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              4'h5: delta_pair = 32'h0000000c;
              4'h6: delta_pair = 32'h0000000c;
              4'h7: delta_pair = 32'h0000000c;
              4'h8: delta_pair = 32'h0000000d;
              4'h9: delta_pair = 32'h0000000d;
              4'ha: delta_pair = 32'h0000000d;
              4'hb: delta_pair = 32'h0000000d;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h00000010;
              4'h5: delta_pair = 32'h00000010;
              4'h6: delta_pair = 32'h00000010;
              4'h7: delta_pair = 32'h00000011;
              4'h8: delta_pair = 32'h00000011;
              4'h9: delta_pair = 32'h00000011;
              4'ha: delta_pair = 32'h00000011;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000013;
            case (mant_lo4)
              4'h4: delta_pair = 32'h00000014;
              4'h5: delta_pair = 32'h00000014;
              4'h6: delta_pair = 32'h00000014;
              4'h7: delta_pair = 32'h00000014;
              4'h8: delta_pair = 32'h00000015;
              4'h9: delta_pair = 32'h00000015;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000016;
              4'hd: delta_pair = 32'h00000016;
              4'he: delta_pair = 32'h00000016;
              4'hf: delta_pair = 32'h00000016;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000016;
              4'h1: delta_pair = 32'h00000017;
              4'h2: delta_pair = 32'h00000017;
              4'h3: delta_pair = 32'h00000017;
              4'h4: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              4'h1: delta_pair = 32'h0000001a;
              4'h2: delta_pair = 32'h0000001a;
              4'h3: delta_pair = 32'h0000001a;
              4'h9: delta_pair = 32'h0000001c;
              4'ha: delta_pair = 32'h0000001c;
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001d;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              4'h6: delta_pair = 32'h0000001e;
              4'h7: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h00000020;
              4'hf: delta_pair = 32'h00000020;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h84: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000002;
              4'h6: delta_pair = 32'h00000002;
              4'h7: delta_pair = 32'h00000002;
              4'h8: delta_pair = 32'h00000003;
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              4'h6: delta_pair = 32'h00000007;
              4'h7: delta_pair = 32'h00000008;
              4'h8: delta_pair = 32'h00000008;
              4'h9: delta_pair = 32'h00000008;
              4'he: delta_pair = 32'h0000000a;
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              4'h5: delta_pair = 32'h0000000c;
              4'h6: delta_pair = 32'h0000000c;
              4'h7: delta_pair = 32'h0000000c;
              4'h8: delta_pair = 32'h0000000d;
              4'h9: delta_pair = 32'h0000000d;
              4'ha: delta_pair = 32'h0000000d;
              4'hb: delta_pair = 32'h0000000d;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h00000010;
              4'h5: delta_pair = 32'h00000010;
              4'h6: delta_pair = 32'h00000010;
              4'h7: delta_pair = 32'h00000011;
              4'h8: delta_pair = 32'h00000011;
              4'h9: delta_pair = 32'h00000011;
              4'ha: delta_pair = 32'h00000011;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000013;
            case (mant_lo4)
              4'h4: delta_pair = 32'h00000014;
              4'h5: delta_pair = 32'h00000014;
              4'h6: delta_pair = 32'h00000014;
              4'h7: delta_pair = 32'h00000014;
              4'h8: delta_pair = 32'h00000015;
              4'h9: delta_pair = 32'h00000015;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000016;
              4'hd: delta_pair = 32'h00000016;
              4'he: delta_pair = 32'h00000016;
              4'hf: delta_pair = 32'h00000016;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000016;
              4'h1: delta_pair = 32'h00000017;
              4'h2: delta_pair = 32'h00000017;
              4'h3: delta_pair = 32'h00000017;
              4'h4: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              4'h1: delta_pair = 32'h0000001a;
              4'h2: delta_pair = 32'h0000001a;
              4'h3: delta_pair = 32'h0000001a;
              4'h9: delta_pair = 32'h0000001c;
              4'ha: delta_pair = 32'h0000001c;
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001d;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              4'h6: delta_pair = 32'h0000001e;
              4'h7: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h00000060;
              4'hf: delta_pair = 32'h00000060;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h85: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000002;
              4'h6: delta_pair = 32'h00000002;
              4'h7: delta_pair = 32'h00000002;
              4'h8: delta_pair = 32'h00000003;
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              4'h6: delta_pair = 32'h00000007;
              4'h7: delta_pair = 32'h00000008;
              4'h8: delta_pair = 32'h00000008;
              4'h9: delta_pair = 32'h00000008;
              4'he: delta_pair = 32'h0000000a;
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              4'h5: delta_pair = 32'h0000000c;
              4'h6: delta_pair = 32'h0000000c;
              4'h7: delta_pair = 32'h0000000c;
              4'h8: delta_pair = 32'h0000000d;
              4'h9: delta_pair = 32'h0000000d;
              4'ha: delta_pair = 32'h0000000d;
              4'hb: delta_pair = 32'h0000000d;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h00000010;
              4'h5: delta_pair = 32'h00000010;
              4'h6: delta_pair = 32'h00000010;
              4'h7: delta_pair = 32'h00000011;
              4'h8: delta_pair = 32'h00000011;
              4'h9: delta_pair = 32'h00000011;
              4'ha: delta_pair = 32'h00000011;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000013;
            case (mant_lo4)
              4'h4: delta_pair = 32'h00000014;
              4'h5: delta_pair = 32'h00000014;
              4'h6: delta_pair = 32'h00000014;
              4'h7: delta_pair = 32'h00000014;
              4'h8: delta_pair = 32'h00000015;
              4'h9: delta_pair = 32'h00000015;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000016;
              4'hd: delta_pair = 32'h00000016;
              4'he: delta_pair = 32'h00000016;
              4'hf: delta_pair = 32'h00000016;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000016;
              4'h1: delta_pair = 32'h00000017;
              4'h2: delta_pair = 32'h00000017;
              4'h3: delta_pair = 32'h00000017;
              4'h4: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              4'h1: delta_pair = 32'h0000001a;
              4'h2: delta_pair = 32'h0000001a;
              4'h3: delta_pair = 32'h0000001a;
              4'h9: delta_pair = 32'h0000001c;
              4'ha: delta_pair = 32'h0000001c;
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001d;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              4'h6: delta_pair = 32'h0000001e;
              4'h7: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h00000020;
              4'hf: delta_pair = 32'h00000020;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h86: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000002;
              4'h6: delta_pair = 32'h00000002;
              4'h7: delta_pair = 32'h00000002;
              4'h8: delta_pair = 32'h00000003;
              4'h9: delta_pair = 32'h00000003;
              4'ha: delta_pair = 32'h00000003;
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000009;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000006;
              4'h2: delta_pair = 32'h00000006;
              4'h3: delta_pair = 32'h00000006;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              4'h6: delta_pair = 32'h00000007;
              4'h7: delta_pair = 32'h00000008;
              4'h8: delta_pair = 32'h00000008;
              4'h9: delta_pair = 32'h00000008;
              4'he: delta_pair = 32'h0000000a;
              4'hf: delta_pair = 32'h0000000a;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0000000b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000a;
              4'h5: delta_pair = 32'h0000000c;
              4'h6: delta_pair = 32'h0000000c;
              4'h7: delta_pair = 32'h0000000c;
              4'h8: delta_pair = 32'h0000000d;
              4'h9: delta_pair = 32'h0000000d;
              4'ha: delta_pair = 32'h0000000d;
              4'hb: delta_pair = 32'h0000000d;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000f;
              4'h1: delta_pair = 32'h0000000f;
              4'h2: delta_pair = 32'h0000000f;
              4'h3: delta_pair = 32'h0000000f;
              4'h4: delta_pair = 32'h00000010;
              4'h5: delta_pair = 32'h00000010;
              4'h6: delta_pair = 32'h00000010;
              4'h7: delta_pair = 32'h00000011;
              4'h8: delta_pair = 32'h00000011;
              4'h9: delta_pair = 32'h00000011;
              4'ha: delta_pair = 32'h00000011;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000013;
            case (mant_lo4)
              4'h4: delta_pair = 32'h00000014;
              4'h5: delta_pair = 32'h00000014;
              4'h6: delta_pair = 32'h00000014;
              4'h7: delta_pair = 32'h00000014;
              4'h8: delta_pair = 32'h00000015;
              4'h9: delta_pair = 32'h00000015;
              4'ha: delta_pair = 32'h00000015;
              4'hb: delta_pair = 32'h00000015;
              4'hc: delta_pair = 32'h00000016;
              4'hd: delta_pair = 32'h00000016;
              4'he: delta_pair = 32'h00000016;
              4'hf: delta_pair = 32'h00000016;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000016;
              4'h1: delta_pair = 32'h00000017;
              4'h2: delta_pair = 32'h00000017;
              4'h3: delta_pair = 32'h00000017;
              4'h4: delta_pair = 32'h00000017;
              4'ha: delta_pair = 32'h00000019;
              4'hb: delta_pair = 32'h00000019;
              4'hc: delta_pair = 32'h00000019;
              4'hd: delta_pair = 32'h00000019;
              4'he: delta_pair = 32'h00000019;
              4'hf: delta_pair = 32'h0000001a;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001a;
              4'h1: delta_pair = 32'h0000001a;
              4'h2: delta_pair = 32'h0000001a;
              4'h3: delta_pair = 32'h0000001a;
              4'h9: delta_pair = 32'h0000001c;
              4'ha: delta_pair = 32'h0000001c;
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001d;
              4'hf: delta_pair = 32'h0000001d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001f;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000001d;
              4'h1: delta_pair = 32'h0000001d;
              4'h2: delta_pair = 32'h0000001d;
              4'h3: delta_pair = 32'h0000001e;
              4'h4: delta_pair = 32'h0000001e;
              4'h5: delta_pair = 32'h0000001e;
              4'h6: delta_pair = 32'h0000001e;
              4'h7: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h000001e0;
              4'hf: delta_pair = 32'h000001e0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h87: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h88: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000030;
              4'hc: delta_pair = 32'h00000030;
              4'hd: delta_pair = 32'h00000030;
              4'he: delta_pair = 32'h00000030;
              4'hf: delta_pair = 32'h00000030;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h89: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000070;
              4'hc: delta_pair = 32'h00000070;
              4'hd: delta_pair = 32'h00000070;
              4'he: delta_pair = 32'h00000070;
              4'hf: delta_pair = 32'h00000070;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000030;
              4'hc: delta_pair = 32'h00000030;
              4'hd: delta_pair = 32'h00000030;
              4'he: delta_pair = 32'h00000030;
              4'hf: delta_pair = 32'h00000030;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000010;
              4'hc: delta_pair = 32'h00000010;
              4'hd: delta_pair = 32'h00000010;
              4'he: delta_pair = 32'h00000010;
              4'hf: delta_pair = 32'h00000010;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000003;
              4'h1: delta_pair = 32'h00000003;
              4'h2: delta_pair = 32'h00000003;
              4'h3: delta_pair = 32'h00000003;
              4'h4: delta_pair = 32'h00000003;
              4'hc: delta_pair = 32'h00000005;
              4'hd: delta_pair = 32'h00000005;
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000005;
              4'h1: delta_pair = 32'h00000005;
              4'h2: delta_pair = 32'h00000005;
              4'ha: delta_pair = 32'h00000007;
              4'hb: delta_pair = 32'h00000007;
              4'hc: delta_pair = 32'h00000007;
              4'hd: delta_pair = 32'h00000007;
              4'he: delta_pair = 32'h00000007;
              4'hf: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h9: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h00000009;
              4'hb: delta_pair = 32'h00000009;
              4'hc: delta_pair = 32'h00000009;
              4'hd: delta_pair = 32'h00000009;
              4'he: delta_pair = 32'h00000009;
              4'hf: delta_pair = 32'h00000009;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0000000a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000009;
              4'h1: delta_pair = 32'h00000009;
              4'ha: delta_pair = 32'h0000000b;
              4'hb: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000b;
              4'hd: delta_pair = 32'h0000000b;
              4'he: delta_pair = 32'h0000000b;
              4'hf: delta_pair = 32'h0000000b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0000000c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000b;
              4'h1: delta_pair = 32'h0000000b;
              4'h2: delta_pair = 32'h0000000b;
              4'hc: delta_pair = 32'h0000000d;
              4'hd: delta_pair = 32'h0000000d;
              4'he: delta_pair = 32'h0000000d;
              4'hf: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h0000000d;
              4'h1: delta_pair = 32'h0000000d;
              4'h2: delta_pair = 32'h0000000d;
              4'h3: delta_pair = 32'h0000000d;
              4'h4: delta_pair = 32'h0000000d;
              4'h5: delta_pair = 32'h0000000d;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000f;
            case (mant_lo4)
              4'hb: delta_pair = 32'h000000f0;
              4'hc: delta_pair = 32'h000000f0;
              4'hd: delta_pair = 32'h000000f0;
              4'he: delta_pair = 32'h000000f0;
              4'hf: delta_pair = 32'h000000f0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h90: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h91: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h92: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h93: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h94: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h95: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h96: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000078;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h97: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h98: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h99: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000018;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000008;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h00000000;
              4'h4: delta_pair = 32'h00000000;
              4'h5: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000003;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000004;
            case (mant_lo4)
              4'he: delta_pair = 32'h00000005;
              4'hf: delta_pair = 32'h00000005;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00000005;
            case (mant_lo4)
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000006;
          end
          3'h6: begin
            delta_pair = 32'h00000007;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000003f8;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000007;
              4'h1: delta_pair = 32'h00000007;
              4'h2: delta_pair = 32'h00000007;
              4'h3: delta_pair = 32'h00000007;
              4'h4: delta_pair = 32'h00000007;
              4'h5: delta_pair = 32'h00000007;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'ha0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'ha1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'ha2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'ha3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'ha4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'ha5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'ha6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000003c;
              4'hc: delta_pair = 32'h0000003c;
              4'hd: delta_pair = 32'h0000003c;
              4'he: delta_pair = 32'h0000003c;
              4'hf: delta_pair = 32'h0000003c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000003c;
          end
          default: begin end
        endcase
      end
      8'ha7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'ha8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'ha9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'haa: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'hab: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hac: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'had: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hae: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000007c;
              4'hc: delta_pair = 32'h0000007c;
              4'hd: delta_pair = 32'h0000007c;
              4'he: delta_pair = 32'h0000007c;
              4'hf: delta_pair = 32'h0000007c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000007c;
          end
          default: begin end
        endcase
      end
      8'haf: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hb0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'hb1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hb2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'hb3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hb4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'hb5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hb6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000003c;
              4'hc: delta_pair = 32'h0000003c;
              4'hd: delta_pair = 32'h0000003c;
              4'he: delta_pair = 32'h0000003c;
              4'hf: delta_pair = 32'h0000003c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000003c;
          end
          default: begin end
        endcase
      end
      8'hb7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hb8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'hb9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hba: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000001c;
              4'hc: delta_pair = 32'h0000001c;
              4'hd: delta_pair = 32'h0000001c;
              4'he: delta_pair = 32'h0000001c;
              4'hf: delta_pair = 32'h0000001c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000001c;
          end
          default: begin end
        endcase
      end
      8'hbb: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hbc: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h0000000c;
              4'hc: delta_pair = 32'h0000000c;
              4'hd: delta_pair = 32'h0000000c;
              4'he: delta_pair = 32'h0000000c;
              4'hf: delta_pair = 32'h0000000c;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0000000c;
          end
          default: begin end
        endcase
      end
      8'hbd: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00000004;
              4'hc: delta_pair = 32'h00000004;
              4'hd: delta_pair = 32'h00000004;
              4'he: delta_pair = 32'h00000004;
              4'hf: delta_pair = 32'h00000004;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00000004;
          end
          default: begin end
        endcase
      end
      8'hbe: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000001;
          end
          3'h2: begin
            delta_pair = 32'h00000002;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000001;
              4'h1: delta_pair = 32'h00000001;
              4'h2: delta_pair = 32'h00000001;
              4'h3: delta_pair = 32'h00000001;
              4'h4: delta_pair = 32'h00000001;
              4'h5: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00000002;
          end
          3'h4: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000002;
              4'h1: delta_pair = 32'h00000002;
              4'h2: delta_pair = 32'h00000002;
              4'h3: delta_pair = 32'h00000002;
              4'h4: delta_pair = 32'h00000002;
              4'h5: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00000003;
          end
          3'h6: begin
            delta_pair = 32'h00000003;
            case (mant_lo4)
              4'hb: delta_pair = 32'h000000fc;
              4'hc: delta_pair = 32'h000000fc;
              4'hd: delta_pair = 32'h000000fc;
              4'he: delta_pair = 32'h000000fc;
              4'hf: delta_pair = 32'h000000fc;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h000000fc;
          end
          default: begin end
        endcase
      end
      8'hbf: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hc0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hc1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hc2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'hc3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hc4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hc5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hc6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'hc7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hc8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hc9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hca: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'hcb: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hcc: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hcd: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hce: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000003e;
              4'h9: delta_pair = 32'h0000003e;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003e;
              4'hd: delta_pair = 32'h0000003e;
              4'he: delta_pair = 32'h0000003e;
              4'hf: delta_pair = 32'h0000003e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000003e;
          end
          3'h7: begin
            delta_pair = 32'h0000003e;
          end
          default: begin end
        endcase
      end
      8'hcf: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hd0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hd1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hd2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'hd3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hd4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hd5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hd6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'hd7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hd8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hd9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hda: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'hdb: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hdc: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hdd: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hde: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000007e;
              4'h9: delta_pair = 32'h0000007e;
              4'ha: delta_pair = 32'h0000007e;
              4'hb: delta_pair = 32'h0000007e;
              4'hc: delta_pair = 32'h0000007e;
              4'hd: delta_pair = 32'h0000007e;
              4'he: delta_pair = 32'h0000007e;
              4'hf: delta_pair = 32'h0000007e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000007e;
          end
          3'h7: begin
            delta_pair = 32'h0000007e;
          end
          default: begin end
        endcase
      end
      8'hdf: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'he0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'he1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'he2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'he3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'he4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'he5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'he6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'he7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'he8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'he9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hea: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'heb: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hec: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hed: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hee: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000003e;
              4'h9: delta_pair = 32'h0000003e;
              4'ha: delta_pair = 32'h0000003e;
              4'hb: delta_pair = 32'h0000003e;
              4'hc: delta_pair = 32'h0000003e;
              4'hd: delta_pair = 32'h0000003e;
              4'he: delta_pair = 32'h0000003e;
              4'hf: delta_pair = 32'h0000003e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000003e;
          end
          3'h7: begin
            delta_pair = 32'h0000003e;
          end
          default: begin end
        endcase
      end
      8'hef: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hf0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hf1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hf2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'hf3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hf4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hf5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hf6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000001e;
              4'h9: delta_pair = 32'h0000001e;
              4'ha: delta_pair = 32'h0000001e;
              4'hb: delta_pair = 32'h0000001e;
              4'hc: delta_pair = 32'h0000001e;
              4'hd: delta_pair = 32'h0000001e;
              4'he: delta_pair = 32'h0000001e;
              4'hf: delta_pair = 32'h0000001e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000001e;
          end
          3'h7: begin
            delta_pair = 32'h0000001e;
          end
          default: begin end
        endcase
      end
      8'hf7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hf8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hf9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hfa: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h0000000e;
              4'h9: delta_pair = 32'h0000000e;
              4'ha: delta_pair = 32'h0000000e;
              4'hb: delta_pair = 32'h0000000e;
              4'hc: delta_pair = 32'h0000000e;
              4'hd: delta_pair = 32'h0000000e;
              4'he: delta_pair = 32'h0000000e;
              4'hf: delta_pair = 32'h0000000e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0000000e;
          end
          3'h7: begin
            delta_pair = 32'h0000000e;
          end
          default: begin end
        endcase
      end
      8'hfb: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hfc: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000006;
              4'h9: delta_pair = 32'h00000006;
              4'ha: delta_pair = 32'h00000006;
              4'hb: delta_pair = 32'h00000006;
              4'hc: delta_pair = 32'h00000006;
              4'hd: delta_pair = 32'h00000006;
              4'he: delta_pair = 32'h00000006;
              4'hf: delta_pair = 32'h00000006;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000006;
          end
          3'h7: begin
            delta_pair = 32'h00000006;
          end
          default: begin end
        endcase
      end
      8'hfd: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h00000002;
              4'h9: delta_pair = 32'h00000002;
              4'ha: delta_pair = 32'h00000002;
              4'hb: delta_pair = 32'h00000002;
              4'hc: delta_pair = 32'h00000002;
              4'hd: delta_pair = 32'h00000002;
              4'he: delta_pair = 32'h00000002;
              4'hf: delta_pair = 32'h00000002;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00000002;
          end
          3'h7: begin
            delta_pair = 32'h00000002;
          end
          default: begin end
        endcase
      end
      8'hfe: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
          end
          3'h1: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h9: delta_pair = 32'h00000001;
              4'ha: delta_pair = 32'h00000001;
              4'hb: delta_pair = 32'h00000001;
              4'hc: delta_pair = 32'h00000001;
              4'hd: delta_pair = 32'h00000001;
              4'he: delta_pair = 32'h00000001;
              4'hf: delta_pair = 32'h00000001;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00000001;
          end
          3'h3: begin
            delta_pair = 32'h00000001;
          end
          3'h4: begin
            delta_pair = 32'h00000001;
          end
          3'h5: begin
            delta_pair = 32'h00000001;
            case (mant_lo4)
              4'h8: delta_pair = 32'h000001fe;
              4'h9: delta_pair = 32'h000001fe;
              4'ha: delta_pair = 32'h000001fe;
              4'hb: delta_pair = 32'h000001fe;
              4'hc: delta_pair = 32'h000001fe;
              4'hd: delta_pair = 32'h000001fe;
              4'he: delta_pair = 32'h000001fe;
              4'hf: delta_pair = 32'h000001fe;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h000001fe;
          end
          3'h7: begin
            delta_pair = 32'h000001fe;
          end
          default: begin end
        endcase
      end
      8'hff: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000040;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000040;
          end
          3'h2: begin
            delta_pair = 32'h00000040;
          end
          3'h3: begin
            delta_pair = 32'h00000040;
          end
          3'h4: begin
            delta_pair = 32'h00000040;
          end
          3'h5: begin
            delta_pair = 32'h00000040;
          end
          3'h6: begin
            delta_pair = 32'h00000040;
          end
          3'h7: begin
            delta_pair = 32'h00000040;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  wire [31:0] pair = base_pair ^ delta_pair;
  wire bit_14 = in[15] | (in[14:7] <= 8'd124) | (in[14:7] >= 8'd129) | ((in[14:7] == 8'd125) & (mant == 7'd0));
  assign out = {(sign ? pair[31] : pair[15]), bit_14, (sign ? pair[29] : pair[13]), (sign ? pair[28] : pair[12]), (sign ? pair[27] : pair[11]), (sign ? pair[26] : pair[10]), (sign ? pair[25] : pair[9]), (sign ? pair[24] : pair[8]), (sign ? pair[23] : pair[7]), (sign ? pair[22] : pair[6]), (sign ? pair[21] : pair[5]), (sign ? pair[20] : pair[4]), (sign ? pair[19] : pair[3]), (sign ? pair[18] : pair[2]), (sign ? pair[17] : pair[1]), (sign ? pair[16] : pair[0])};
endmodule
