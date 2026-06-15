module ex200_bf16_sparse_residual_hilo3(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [8:0] sign_exp = in[15:7];
  wire [6:0] mant = in[6:0];
  wire [2:0] mant_hi = mant[6:4];
  wire [3:0] mant_lo = mant[3:0];
  reg [15:0] out_r;
  always @* begin
    out_r = 16'h0000;
    case (sign_exp)
      9'h000: out_r = 16'h3f80;
      9'h001: out_r = 16'h3f80;
      9'h002: out_r = 16'h3f80;
      9'h003: out_r = 16'h3f80;
      9'h004: out_r = 16'h3f80;
      9'h005: out_r = 16'h3f80;
      9'h006: out_r = 16'h3f80;
      9'h007: out_r = 16'h3f80;
      9'h008: out_r = 16'h3f80;
      9'h009: out_r = 16'h3f80;
      9'h00a: out_r = 16'h3f80;
      9'h00b: out_r = 16'h3f80;
      9'h00c: out_r = 16'h3f80;
      9'h00d: out_r = 16'h3f80;
      9'h00e: out_r = 16'h3f80;
      9'h00f: out_r = 16'h3f80;
      9'h010: out_r = 16'h3f80;
      9'h011: out_r = 16'h3f80;
      9'h012: out_r = 16'h3f80;
      9'h013: out_r = 16'h3f80;
      9'h014: out_r = 16'h3f80;
      9'h015: out_r = 16'h3f80;
      9'h016: out_r = 16'h3f80;
      9'h017: out_r = 16'h3f80;
      9'h018: out_r = 16'h3f80;
      9'h019: out_r = 16'h3f80;
      9'h01a: out_r = 16'h3f80;
      9'h01b: out_r = 16'h3f80;
      9'h01c: out_r = 16'h3f80;
      9'h01d: out_r = 16'h3f80;
      9'h01e: out_r = 16'h3f80;
      9'h01f: out_r = 16'h3f80;
      9'h020: out_r = 16'h3f80;
      9'h021: out_r = 16'h3f80;
      9'h022: out_r = 16'h3f80;
      9'h023: out_r = 16'h3f80;
      9'h024: out_r = 16'h3f80;
      9'h025: out_r = 16'h3f80;
      9'h026: out_r = 16'h3f80;
      9'h027: out_r = 16'h3f80;
      9'h028: out_r = 16'h3f80;
      9'h029: out_r = 16'h3f80;
      9'h02a: out_r = 16'h3f80;
      9'h02b: out_r = 16'h3f80;
      9'h02c: out_r = 16'h3f80;
      9'h02d: out_r = 16'h3f80;
      9'h02e: out_r = 16'h3f80;
      9'h02f: out_r = 16'h3f80;
      9'h030: out_r = 16'h3f80;
      9'h031: out_r = 16'h3f80;
      9'h032: out_r = 16'h3f80;
      9'h033: out_r = 16'h3f80;
      9'h034: out_r = 16'h3f80;
      9'h035: out_r = 16'h3f80;
      9'h036: out_r = 16'h3f80;
      9'h037: out_r = 16'h3f80;
      9'h038: out_r = 16'h3f80;
      9'h039: out_r = 16'h3f80;
      9'h03a: out_r = 16'h3f80;
      9'h03b: out_r = 16'h3f80;
      9'h03c: out_r = 16'h3f80;
      9'h03d: out_r = 16'h3f80;
      9'h03e: out_r = 16'h3f80;
      9'h03f: out_r = 16'h3f80;
      9'h040: out_r = 16'h3f80;
      9'h041: out_r = 16'h3f80;
      9'h042: out_r = 16'h3f80;
      9'h043: out_r = 16'h3f80;
      9'h044: out_r = 16'h3f80;
      9'h045: out_r = 16'h3f80;
      9'h046: out_r = 16'h3f80;
      9'h047: out_r = 16'h3f80;
      9'h048: out_r = 16'h3f80;
      9'h049: out_r = 16'h3f80;
      9'h04a: out_r = 16'h3f80;
      9'h04b: out_r = 16'h3f80;
      9'h04c: out_r = 16'h3f80;
      9'h04d: out_r = 16'h3f80;
      9'h04e: out_r = 16'h3f80;
      9'h04f: out_r = 16'h3f80;
      9'h050: out_r = 16'h3f80;
      9'h051: out_r = 16'h3f80;
      9'h052: out_r = 16'h3f80;
      9'h053: out_r = 16'h3f80;
      9'h054: out_r = 16'h3f80;
      9'h055: out_r = 16'h3f80;
      9'h056: out_r = 16'h3f80;
      9'h057: out_r = 16'h3f80;
      9'h058: out_r = 16'h3f80;
      9'h059: out_r = 16'h3f80;
      9'h05a: out_r = 16'h3f80;
      9'h05b: out_r = 16'h3f80;
      9'h05c: out_r = 16'h3f80;
      9'h05d: out_r = 16'h3f80;
      9'h05e: out_r = 16'h3f80;
      9'h05f: out_r = 16'h3f80;
      9'h060: out_r = 16'h3f80;
      9'h061: out_r = 16'h3f80;
      9'h062: out_r = 16'h3f80;
      9'h063: out_r = 16'h3f80;
      9'h064: out_r = 16'h3f80;
      9'h065: out_r = 16'h3f80;
      9'h066: out_r = 16'h3f80;
      9'h067: out_r = 16'h3f80;
      9'h068: out_r = 16'h3f80;
      9'h069: out_r = 16'h3f80;
      9'h06a: out_r = 16'h3f80;
      9'h06b: out_r = 16'h3f80;
      9'h06c: out_r = 16'h3f80;
      9'h06d: out_r = 16'h3f80;
      9'h06e: out_r = 16'h3f80;
      9'h06f: out_r = 16'h3f80;
      9'h070: out_r = 16'h3f80;
      9'h071: out_r = 16'h3f80;
      9'h072: out_r = 16'h3f80;
      9'h073: out_r = 16'h3f80;
      9'h074: out_r = 16'h3f80;
      9'h075: out_r = 16'h3f80;
      9'h076: out_r = 16'h3f80;
      9'h077: out_r = 16'h3f81;
      9'h078: begin
        case (mant_hi)
          3'h0: out_r = 16'h3f81;
          3'h1: out_r = 16'h3f81;
          3'h2: out_r = 16'h3f81;
          3'h3: begin
            out_r = 16'h3f81;
            case (mant_lo)
              4'hf: out_r = 16'h3f82;
              default: begin end
            endcase
          end
          3'h4: out_r = 16'h3f82;
          3'h5: out_r = 16'h3f82;
          3'h6: out_r = 16'h3f82;
          3'h7: out_r = 16'h3f82;
          default: begin end
        endcase
      end
      9'h079: begin
        case (mant_hi)
          3'h0: out_r = 16'h3f82;
          3'h1: begin
            out_r = 16'h3f82;
            case (mant_lo)
              4'hf: out_r = 16'h3f83;
              default: begin end
            endcase
          end
          3'h2: out_r = 16'h3f83;
          3'h3: out_r = 16'h3f83;
          3'h4: out_r = 16'h3f83;
          3'h5: begin
            out_r = 16'h3f83;
            case (mant_lo)
              4'hd: out_r = 16'h3f84;
              4'he: out_r = 16'h3f84;
              4'hf: out_r = 16'h3f84;
              default: begin end
            endcase
          end
          3'h6: out_r = 16'h3f84;
          3'h7: out_r = 16'h3f84;
          default: begin end
        endcase
      end
      9'h07a: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f84;
            case (mant_lo)
              4'he: out_r = 16'h3f85;
              4'hf: out_r = 16'h3f85;
              default: begin end
            endcase
          end
          3'h1: out_r = 16'h3f85;
          3'h2: begin
            out_r = 16'h3f85;
            case (mant_lo)
              4'hd: out_r = 16'h3f86;
              4'he: out_r = 16'h3f86;
              4'hf: out_r = 16'h3f86;
              default: begin end
            endcase
          end
          3'h3: out_r = 16'h3f86;
          3'h4: begin
            out_r = 16'h3f86;
            case (mant_lo)
              4'hb: out_r = 16'h3f87;
              4'hc: out_r = 16'h3f87;
              4'hd: out_r = 16'h3f87;
              4'he: out_r = 16'h3f87;
              4'hf: out_r = 16'h3f87;
              default: begin end
            endcase
          end
          3'h5: out_r = 16'h3f87;
          3'h6: begin
            out_r = 16'h3f87;
            case (mant_lo)
              4'ha: out_r = 16'h3f88;
              4'hb: out_r = 16'h3f88;
              4'hc: out_r = 16'h3f88;
              4'hd: out_r = 16'h3f88;
              4'he: out_r = 16'h3f88;
              4'hf: out_r = 16'h3f88;
              default: begin end
            endcase
          end
          3'h7: out_r = 16'h3f88;
          default: begin end
        endcase
      end
      9'h07b: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f89;
            case (mant_lo)
              4'h0: out_r = 16'h3f88;
              4'h1: out_r = 16'h3f88;
              4'h2: out_r = 16'h3f88;
              4'h3: out_r = 16'h3f88;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f8a;
            case (mant_lo)
              4'h0: out_r = 16'h3f89;
              4'h1: out_r = 16'h3f89;
              4'h2: out_r = 16'h3f89;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f8b;
            case (mant_lo)
              4'h0: out_r = 16'h3f8a;
              4'h1: out_r = 16'h3f8a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f8c;
            case (mant_lo)
              4'h0: out_r = 16'h3f8b;
              4'hf: out_r = 16'h3f8d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f8d;
            case (mant_lo)
              4'he: out_r = 16'h3f8e;
              4'hf: out_r = 16'h3f8e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f8e;
            case (mant_lo)
              4'hc: out_r = 16'h3f8f;
              4'hd: out_r = 16'h3f8f;
              4'he: out_r = 16'h3f8f;
              4'hf: out_r = 16'h3f8f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f8f;
            case (mant_lo)
              4'hb: out_r = 16'h3f90;
              4'hc: out_r = 16'h3f90;
              4'hd: out_r = 16'h3f90;
              4'he: out_r = 16'h3f90;
              4'hf: out_r = 16'h3f90;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f90;
            case (mant_lo)
              4'h9: out_r = 16'h3f91;
              4'ha: out_r = 16'h3f91;
              4'hb: out_r = 16'h3f91;
              4'hc: out_r = 16'h3f91;
              4'hd: out_r = 16'h3f91;
              4'he: out_r = 16'h3f91;
              4'hf: out_r = 16'h3f91;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f92;
            case (mant_lo)
              4'h0: out_r = 16'h3f91;
              4'h1: out_r = 16'h3f91;
              4'h2: out_r = 16'h3f91;
              4'h3: out_r = 16'h3f91;
              4'hb: out_r = 16'h3f93;
              4'hc: out_r = 16'h3f93;
              4'hd: out_r = 16'h3f93;
              4'he: out_r = 16'h3f93;
              4'hf: out_r = 16'h3f93;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f94;
            case (mant_lo)
              4'h0: out_r = 16'h3f93;
              4'h1: out_r = 16'h3f93;
              4'h9: out_r = 16'h3f95;
              4'ha: out_r = 16'h3f95;
              4'hb: out_r = 16'h3f95;
              4'hc: out_r = 16'h3f95;
              4'hd: out_r = 16'h3f95;
              4'he: out_r = 16'h3f95;
              4'hf: out_r = 16'h3f96;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f97;
            case (mant_lo)
              4'h0: out_r = 16'h3f96;
              4'h1: out_r = 16'h3f96;
              4'h2: out_r = 16'h3f96;
              4'h3: out_r = 16'h3f96;
              4'h4: out_r = 16'h3f96;
              4'h5: out_r = 16'h3f96;
              4'hd: out_r = 16'h3f98;
              4'he: out_r = 16'h3f98;
              4'hf: out_r = 16'h3f98;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f99;
            case (mant_lo)
              4'h0: out_r = 16'h3f98;
              4'h1: out_r = 16'h3f98;
              4'h2: out_r = 16'h3f98;
              4'h3: out_r = 16'h3f98;
              4'hb: out_r = 16'h3f9a;
              4'hc: out_r = 16'h3f9a;
              4'hd: out_r = 16'h3f9a;
              4'he: out_r = 16'h3f9a;
              4'hf: out_r = 16'h3f9a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f9b;
            case (mant_lo)
              4'h0: out_r = 16'h3f9a;
              4'h8: out_r = 16'h3f9c;
              4'h9: out_r = 16'h3f9c;
              4'ha: out_r = 16'h3f9c;
              4'hb: out_r = 16'h3f9c;
              4'hc: out_r = 16'h3f9c;
              4'hd: out_r = 16'h3f9c;
              4'he: out_r = 16'h3f9d;
              4'hf: out_r = 16'h3f9d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f9e;
            case (mant_lo)
              4'h0: out_r = 16'h3f9d;
              4'h1: out_r = 16'h3f9d;
              4'h2: out_r = 16'h3f9d;
              4'h3: out_r = 16'h3f9d;
              4'h4: out_r = 16'h3f9d;
              4'hb: out_r = 16'h3f9f;
              4'hc: out_r = 16'h3f9f;
              4'hd: out_r = 16'h3f9f;
              4'he: out_r = 16'h3f9f;
              4'hf: out_r = 16'h3f9f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3fa1;
            case (mant_lo)
              4'h0: out_r = 16'h3f9f;
              4'h1: out_r = 16'h3f9f;
              4'h2: out_r = 16'h3fa0;
              4'h3: out_r = 16'h3fa0;
              4'h4: out_r = 16'h3fa0;
              4'h5: out_r = 16'h3fa0;
              4'h6: out_r = 16'h3fa0;
              4'h7: out_r = 16'h3fa0;
              4'hf: out_r = 16'h3fa2;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3fa3;
            case (mant_lo)
              4'h0: out_r = 16'h3fa2;
              4'h1: out_r = 16'h3fa2;
              4'h2: out_r = 16'h3fa2;
              4'h3: out_r = 16'h3fa2;
              4'h4: out_r = 16'h3fa2;
              4'hb: out_r = 16'h3fa4;
              4'hc: out_r = 16'h3fa4;
              4'hd: out_r = 16'h3fa4;
              4'he: out_r = 16'h3fa4;
              4'hf: out_r = 16'h3fa4;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3fa5;
            case (mant_lo)
              4'h0: out_r = 16'h3fa4;
              4'h4: out_r = 16'h3fa6;
              4'h5: out_r = 16'h3fa6;
              4'h6: out_r = 16'h3fa6;
              4'h7: out_r = 16'h3fa7;
              4'h8: out_r = 16'h3fa7;
              4'h9: out_r = 16'h3fa7;
              4'ha: out_r = 16'h3fa8;
              4'hb: out_r = 16'h3fa8;
              4'hc: out_r = 16'h3fa8;
              4'hd: out_r = 16'h3fa9;
              4'he: out_r = 16'h3fa9;
              4'hf: out_r = 16'h3fa9;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3faa;
            case (mant_lo)
              4'h3: out_r = 16'h3fab;
              4'h4: out_r = 16'h3fab;
              4'h5: out_r = 16'h3fab;
              4'h6: out_r = 16'h3fac;
              4'h7: out_r = 16'h3fac;
              4'h8: out_r = 16'h3fac;
              4'h9: out_r = 16'h3fad;
              4'ha: out_r = 16'h3fad;
              4'hb: out_r = 16'h3fad;
              4'hc: out_r = 16'h3fae;
              4'hd: out_r = 16'h3fae;
              4'he: out_r = 16'h3fae;
              4'hf: out_r = 16'h3faf;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3fb0;
            case (mant_lo)
              4'h0: out_r = 16'h3faf;
              4'h1: out_r = 16'h3faf;
              4'h5: out_r = 16'h3fb1;
              4'h6: out_r = 16'h3fb1;
              4'h7: out_r = 16'h3fb1;
              4'h8: out_r = 16'h3fb2;
              4'h9: out_r = 16'h3fb2;
              4'ha: out_r = 16'h3fb2;
              4'hb: out_r = 16'h3fb3;
              4'hc: out_r = 16'h3fb3;
              4'hd: out_r = 16'h3fb3;
              4'he: out_r = 16'h3fb4;
              4'hf: out_r = 16'h3fb4;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3fb5;
            case (mant_lo)
              4'h3: out_r = 16'h3fb6;
              4'h4: out_r = 16'h3fb6;
              4'h5: out_r = 16'h3fb6;
              4'h6: out_r = 16'h3fb7;
              4'h7: out_r = 16'h3fb7;
              4'h8: out_r = 16'h3fb7;
              4'h9: out_r = 16'h3fb8;
              4'ha: out_r = 16'h3fb8;
              4'hb: out_r = 16'h3fb8;
              4'hc: out_r = 16'h3fb9;
              4'hd: out_r = 16'h3fb9;
              4'he: out_r = 16'h3fba;
              4'hf: out_r = 16'h3fba;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3fbb;
            case (mant_lo)
              4'h0: out_r = 16'h3fba;
              4'h4: out_r = 16'h3fbc;
              4'h5: out_r = 16'h3fbc;
              4'h6: out_r = 16'h3fbc;
              4'h7: out_r = 16'h3fbd;
              4'h8: out_r = 16'h3fbd;
              4'h9: out_r = 16'h3fbe;
              4'ha: out_r = 16'h3fbe;
              4'hb: out_r = 16'h3fbe;
              4'hc: out_r = 16'h3fbf;
              4'hd: out_r = 16'h3fbf;
              4'he: out_r = 16'h3fbf;
              4'hf: out_r = 16'h3fc0;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3fc1;
            case (mant_lo)
              4'h0: out_r = 16'h3fc0;
              4'h4: out_r = 16'h3fc2;
              4'h5: out_r = 16'h3fc2;
              4'h6: out_r = 16'h3fc2;
              4'h7: out_r = 16'h3fc3;
              4'h8: out_r = 16'h3fc3;
              4'h9: out_r = 16'h3fc4;
              4'ha: out_r = 16'h3fc4;
              4'hb: out_r = 16'h3fc4;
              4'hc: out_r = 16'h3fc5;
              4'hd: out_r = 16'h3fc5;
              4'he: out_r = 16'h3fc5;
              4'hf: out_r = 16'h3fc6;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3fc7;
            case (mant_lo)
              4'h0: out_r = 16'h3fc6;
              4'h4: out_r = 16'h3fc8;
              4'h5: out_r = 16'h3fc8;
              4'h6: out_r = 16'h3fc9;
              4'h7: out_r = 16'h3fc9;
              4'h8: out_r = 16'h3fc9;
              4'h9: out_r = 16'h3fca;
              4'ha: out_r = 16'h3fca;
              4'hb: out_r = 16'h3fcb;
              4'hc: out_r = 16'h3fcb;
              4'hd: out_r = 16'h3fcb;
              4'he: out_r = 16'h3fcc;
              4'hf: out_r = 16'h3fcc;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3fcd;
            case (mant_lo)
              4'h3: out_r = 16'h3fce;
              4'h4: out_r = 16'h3fce;
              4'h5: out_r = 16'h3fcf;
              4'h6: out_r = 16'h3fcf;
              4'h7: out_r = 16'h3fcf;
              4'h8: out_r = 16'h3fd0;
              4'h9: out_r = 16'h3fd0;
              4'ha: out_r = 16'h3fd1;
              4'hb: out_r = 16'h3fd1;
              4'hc: out_r = 16'h3fd1;
              4'hd: out_r = 16'h3fd2;
              4'he: out_r = 16'h3fd2;
              4'hf: out_r = 16'h3fd3;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3fd6;
            case (mant_lo)
              4'h0: out_r = 16'h3fd3;
              4'h1: out_r = 16'h3fd4;
              4'h2: out_r = 16'h3fd5;
              4'h5: out_r = 16'h3fd7;
              4'h6: out_r = 16'h3fd8;
              4'h7: out_r = 16'h3fd9;
              4'h8: out_r = 16'h3fda;
              4'h9: out_r = 16'h3fdb;
              4'ha: out_r = 16'h3fdb;
              4'hb: out_r = 16'h3fdc;
              4'hc: out_r = 16'h3fdd;
              4'hd: out_r = 16'h3fde;
              4'he: out_r = 16'h3fdf;
              4'hf: out_r = 16'h3fe0;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3fe2;
            case (mant_lo)
              4'h0: out_r = 16'h3fe1;
              4'h3: out_r = 16'h3fe3;
              4'h4: out_r = 16'h3fe4;
              4'h5: out_r = 16'h3fe5;
              4'h6: out_r = 16'h3fe6;
              4'h7: out_r = 16'h3fe7;
              4'h8: out_r = 16'h3fe8;
              4'h9: out_r = 16'h3fe9;
              4'ha: out_r = 16'h3fea;
              4'hb: out_r = 16'h3feb;
              4'hc: out_r = 16'h3feb;
              4'hd: out_r = 16'h3fec;
              4'he: out_r = 16'h3fed;
              4'hf: out_r = 16'h3fee;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3fef;
            case (mant_lo)
              4'h1: out_r = 16'h3ff0;
              4'h2: out_r = 16'h3ff1;
              4'h3: out_r = 16'h3ff2;
              4'h4: out_r = 16'h3ff3;
              4'h5: out_r = 16'h3ff4;
              4'h6: out_r = 16'h3ff5;
              4'h7: out_r = 16'h3ff6;
              4'h8: out_r = 16'h3ff7;
              4'h9: out_r = 16'h3ff8;
              4'ha: out_r = 16'h3ff9;
              4'hb: out_r = 16'h3ffa;
              4'hc: out_r = 16'h3ffb;
              4'hd: out_r = 16'h3ffc;
              4'he: out_r = 16'h3ffd;
              4'hf: out_r = 16'h3ffe;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h4000;
            case (mant_lo)
              4'h0: out_r = 16'h3fff;
              4'h3: out_r = 16'h4001;
              4'h4: out_r = 16'h4001;
              4'h5: out_r = 16'h4002;
              4'h6: out_r = 16'h4002;
              4'h7: out_r = 16'h4003;
              4'h8: out_r = 16'h4003;
              4'h9: out_r = 16'h4004;
              4'ha: out_r = 16'h4004;
              4'hb: out_r = 16'h4005;
              4'hc: out_r = 16'h4005;
              4'hd: out_r = 16'h4006;
              4'he: out_r = 16'h4006;
              4'hf: out_r = 16'h4007;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h4009;
            case (mant_lo)
              4'h0: out_r = 16'h4007;
              4'h1: out_r = 16'h4008;
              4'h4: out_r = 16'h400a;
              4'h5: out_r = 16'h400a;
              4'h6: out_r = 16'h400b;
              4'h7: out_r = 16'h400b;
              4'h8: out_r = 16'h400c;
              4'h9: out_r = 16'h400c;
              4'ha: out_r = 16'h400d;
              4'hb: out_r = 16'h400d;
              4'hc: out_r = 16'h400e;
              4'hd: out_r = 16'h400f;
              4'he: out_r = 16'h400f;
              4'hf: out_r = 16'h4010;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h4011;
            case (mant_lo)
              4'h0: out_r = 16'h4010;
              4'h3: out_r = 16'h4012;
              4'h4: out_r = 16'h4012;
              4'h5: out_r = 16'h4013;
              4'h6: out_r = 16'h4014;
              4'h7: out_r = 16'h4014;
              4'h8: out_r = 16'h4015;
              4'h9: out_r = 16'h4015;
              4'ha: out_r = 16'h4016;
              4'hb: out_r = 16'h4017;
              4'hc: out_r = 16'h4017;
              4'hd: out_r = 16'h4018;
              4'he: out_r = 16'h4018;
              4'hf: out_r = 16'h4019;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h401a;
            case (mant_lo)
              4'h2: out_r = 16'h401b;
              4'h3: out_r = 16'h401b;
              4'h4: out_r = 16'h401c;
              4'h5: out_r = 16'h401d;
              4'h6: out_r = 16'h401d;
              4'h7: out_r = 16'h401e;
              4'h8: out_r = 16'h401e;
              4'h9: out_r = 16'h401f;
              4'ha: out_r = 16'h4020;
              4'hb: out_r = 16'h4020;
              4'hc: out_r = 16'h4021;
              4'hd: out_r = 16'h4022;
              4'he: out_r = 16'h4022;
              4'hf: out_r = 16'h4023;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h4025;
            case (mant_lo)
              4'h0: out_r = 16'h4023;
              4'h1: out_r = 16'h4024;
              4'h4: out_r = 16'h4026;
              4'h5: out_r = 16'h4027;
              4'h6: out_r = 16'h4027;
              4'h7: out_r = 16'h4028;
              4'h8: out_r = 16'h4029;
              4'h9: out_r = 16'h4029;
              4'ha: out_r = 16'h402a;
              4'hb: out_r = 16'h402b;
              4'hc: out_r = 16'h402b;
              4'hd: out_r = 16'h402c;
              4'he: out_r = 16'h402d;
              4'hf: out_r = 16'h402d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h402e;
            case (mant_lo)
              4'h1: out_r = 16'h402f;
              4'h2: out_r = 16'h4031;
              4'h3: out_r = 16'h4032;
              4'h4: out_r = 16'h4033;
              4'h5: out_r = 16'h4035;
              4'h6: out_r = 16'h4036;
              4'h7: out_r = 16'h4038;
              4'h8: out_r = 16'h4039;
              4'h9: out_r = 16'h403b;
              4'ha: out_r = 16'h403c;
              4'hb: out_r = 16'h403e;
              4'hc: out_r = 16'h403f;
              4'hd: out_r = 16'h4041;
              4'he: out_r = 16'h4042;
              4'hf: out_r = 16'h4044;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h4045;
            case (mant_lo)
              4'h1: out_r = 16'h4047;
              4'h2: out_r = 16'h4048;
              4'h3: out_r = 16'h404a;
              4'h4: out_r = 16'h404b;
              4'h5: out_r = 16'h404d;
              4'h6: out_r = 16'h404f;
              4'h7: out_r = 16'h4050;
              4'h8: out_r = 16'h4052;
              4'h9: out_r = 16'h4053;
              4'ha: out_r = 16'h4055;
              4'hb: out_r = 16'h4057;
              4'hc: out_r = 16'h4059;
              4'hd: out_r = 16'h405a;
              4'he: out_r = 16'h405c;
              4'hf: out_r = 16'h405e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h405f;
            case (mant_lo)
              4'h1: out_r = 16'h4061;
              4'h2: out_r = 16'h4063;
              4'h3: out_r = 16'h4065;
              4'h4: out_r = 16'h4066;
              4'h5: out_r = 16'h4068;
              4'h6: out_r = 16'h406a;
              4'h7: out_r = 16'h406c;
              4'h8: out_r = 16'h406e;
              4'h9: out_r = 16'h4070;
              4'ha: out_r = 16'h4072;
              4'hb: out_r = 16'h4073;
              4'hc: out_r = 16'h4075;
              4'hd: out_r = 16'h4077;
              4'he: out_r = 16'h4079;
              4'hf: out_r = 16'h407b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h407d;
            case (mant_lo)
              4'h1: out_r = 16'h407f;
              4'h2: out_r = 16'h4081;
              4'h3: out_r = 16'h4082;
              4'h4: out_r = 16'h4083;
              4'h5: out_r = 16'h4084;
              4'h6: out_r = 16'h4085;
              4'h7: out_r = 16'h4086;
              4'h8: out_r = 16'h4087;
              4'h9: out_r = 16'h4088;
              4'ha: out_r = 16'h4089;
              4'hb: out_r = 16'h408a;
              4'hc: out_r = 16'h408b;
              4'hd: out_r = 16'h408c;
              4'he: out_r = 16'h408d;
              4'hf: out_r = 16'h408e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h408f;
            case (mant_lo)
              4'h1: out_r = 16'h4091;
              4'h2: out_r = 16'h4092;
              4'h3: out_r = 16'h4093;
              4'h4: out_r = 16'h4094;
              4'h5: out_r = 16'h4095;
              4'h6: out_r = 16'h4096;
              4'h7: out_r = 16'h4097;
              4'h8: out_r = 16'h4099;
              4'h9: out_r = 16'h409a;
              4'ha: out_r = 16'h409b;
              4'hb: out_r = 16'h409c;
              4'hc: out_r = 16'h409e;
              4'hd: out_r = 16'h409f;
              4'he: out_r = 16'h40a0;
              4'hf: out_r = 16'h40a1;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h40a3;
            case (mant_lo)
              4'h1: out_r = 16'h40a4;
              4'h2: out_r = 16'h40a5;
              4'h3: out_r = 16'h40a6;
              4'h4: out_r = 16'h40a8;
              4'h5: out_r = 16'h40a9;
              4'h6: out_r = 16'h40aa;
              4'h7: out_r = 16'h40ac;
              4'h8: out_r = 16'h40ad;
              4'h9: out_r = 16'h40ae;
              4'ha: out_r = 16'h40b0;
              4'hb: out_r = 16'h40b1;
              4'hc: out_r = 16'h40b2;
              4'hd: out_r = 16'h40b4;
              4'he: out_r = 16'h40b5;
              4'hf: out_r = 16'h40b7;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h40b8;
            case (mant_lo)
              4'h1: out_r = 16'h40ba;
              4'h2: out_r = 16'h40bb;
              4'h3: out_r = 16'h40bd;
              4'h4: out_r = 16'h40be;
              4'h5: out_r = 16'h40bf;
              4'h6: out_r = 16'h40c1;
              4'h7: out_r = 16'h40c2;
              4'h8: out_r = 16'h40c4;
              4'h9: out_r = 16'h40c6;
              4'ha: out_r = 16'h40c7;
              4'hb: out_r = 16'h40c9;
              4'hc: out_r = 16'h40ca;
              4'hd: out_r = 16'h40cc;
              4'he: out_r = 16'h40cd;
              4'hf: out_r = 16'h40cf;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h40d1;
            case (mant_lo)
              4'h1: out_r = 16'h40d2;
              4'h2: out_r = 16'h40d4;
              4'h3: out_r = 16'h40d6;
              4'h4: out_r = 16'h40d7;
              4'h5: out_r = 16'h40d9;
              4'h6: out_r = 16'h40db;
              4'h7: out_r = 16'h40dc;
              4'h8: out_r = 16'h40de;
              4'h9: out_r = 16'h40e0;
              4'ha: out_r = 16'h40e2;
              4'hb: out_r = 16'h40e3;
              4'hc: out_r = 16'h40e5;
              4'hd: out_r = 16'h40e7;
              4'he: out_r = 16'h40e9;
              4'hf: out_r = 16'h40eb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h40ec;
            case (mant_lo)
              4'h1: out_r = 16'h40f0;
              4'h2: out_r = 16'h40f4;
              4'h3: out_r = 16'h40f8;
              4'h4: out_r = 16'h40fc;
              4'h5: out_r = 16'h4100;
              4'h6: out_r = 16'h4102;
              4'h7: out_r = 16'h4104;
              4'h8: out_r = 16'h4106;
              4'h9: out_r = 16'h4108;
              4'ha: out_r = 16'h410a;
              4'hb: out_r = 16'h410c;
              4'hc: out_r = 16'h410f;
              4'hd: out_r = 16'h4111;
              4'he: out_r = 16'h4113;
              4'hf: out_r = 16'h4115;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h4118;
            case (mant_lo)
              4'h1: out_r = 16'h411a;
              4'h2: out_r = 16'h411d;
              4'h3: out_r = 16'h411f;
              4'h4: out_r = 16'h4122;
              4'h5: out_r = 16'h4124;
              4'h6: out_r = 16'h4127;
              4'h7: out_r = 16'h4129;
              4'h8: out_r = 16'h412c;
              4'h9: out_r = 16'h412f;
              4'ha: out_r = 16'h4131;
              4'hb: out_r = 16'h4134;
              4'hc: out_r = 16'h4137;
              4'hd: out_r = 16'h413a;
              4'he: out_r = 16'h413d;
              4'hf: out_r = 16'h4140;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h4143;
            case (mant_lo)
              4'h1: out_r = 16'h4146;
              4'h2: out_r = 16'h4149;
              4'h3: out_r = 16'h414c;
              4'h4: out_r = 16'h414f;
              4'h5: out_r = 16'h4153;
              4'h6: out_r = 16'h4156;
              4'h7: out_r = 16'h4159;
              4'h8: out_r = 16'h415d;
              4'h9: out_r = 16'h4160;
              4'ha: out_r = 16'h4164;
              4'hb: out_r = 16'h4167;
              4'hc: out_r = 16'h416b;
              4'hd: out_r = 16'h416f;
              4'he: out_r = 16'h4173;
              4'hf: out_r = 16'h4176;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h417a;
            case (mant_lo)
              4'h1: out_r = 16'h417e;
              4'h2: out_r = 16'h4181;
              4'h3: out_r = 16'h4183;
              4'h4: out_r = 16'h4185;
              4'h5: out_r = 16'h4187;
              4'h6: out_r = 16'h4189;
              4'h7: out_r = 16'h418c;
              4'h8: out_r = 16'h418e;
              4'h9: out_r = 16'h4190;
              4'ha: out_r = 16'h4192;
              4'hb: out_r = 16'h4195;
              4'hc: out_r = 16'h4197;
              4'hd: out_r = 16'h4199;
              4'he: out_r = 16'h419c;
              4'hf: out_r = 16'h419e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h41a1;
            case (mant_lo)
              4'h1: out_r = 16'h41a3;
              4'h2: out_r = 16'h41a6;
              4'h3: out_r = 16'h41a8;
              4'h4: out_r = 16'h41ab;
              4'h5: out_r = 16'h41ae;
              4'h6: out_r = 16'h41b0;
              4'h7: out_r = 16'h41b3;
              4'h8: out_r = 16'h41b6;
              4'h9: out_r = 16'h41b9;
              4'ha: out_r = 16'h41bc;
              4'hb: out_r = 16'h41bf;
              4'hc: out_r = 16'h41c2;
              4'hd: out_r = 16'h41c5;
              4'he: out_r = 16'h41c8;
              4'hf: out_r = 16'h41cb;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h41ce;
            case (mant_lo)
              4'h1: out_r = 16'h41d2;
              4'h2: out_r = 16'h41d5;
              4'h3: out_r = 16'h41d8;
              4'h4: out_r = 16'h41dc;
              4'h5: out_r = 16'h41df;
              4'h6: out_r = 16'h41e3;
              4'h7: out_r = 16'h41e6;
              4'h8: out_r = 16'h41ea;
              4'h9: out_r = 16'h41ed;
              4'ha: out_r = 16'h41f1;
              4'hb: out_r = 16'h41f5;
              4'hc: out_r = 16'h41f9;
              4'hd: out_r = 16'h41fd;
              4'he: out_r = 16'h4200;
              4'hf: out_r = 16'h4202;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4204;
            case (mant_lo)
              4'h1: out_r = 16'h4207;
              4'h2: out_r = 16'h4209;
              4'h3: out_r = 16'h420b;
              4'h4: out_r = 16'h420d;
              4'h5: out_r = 16'h420f;
              4'h6: out_r = 16'h4211;
              4'h7: out_r = 16'h4214;
              4'h8: out_r = 16'h4216;
              4'h9: out_r = 16'h4218;
              4'ha: out_r = 16'h421b;
              4'hb: out_r = 16'h421d;
              4'hc: out_r = 16'h4220;
              4'hd: out_r = 16'h4222;
              4'he: out_r = 16'h4225;
              4'hf: out_r = 16'h4227;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h422a;
            case (mant_lo)
              4'h1: out_r = 16'h422d;
              4'h2: out_r = 16'h422f;
              4'h3: out_r = 16'h4232;
              4'h4: out_r = 16'h4235;
              4'h5: out_r = 16'h4238;
              4'h6: out_r = 16'h423b;
              4'h7: out_r = 16'h423e;
              4'h8: out_r = 16'h4241;
              4'h9: out_r = 16'h4244;
              4'ha: out_r = 16'h4247;
              4'hb: out_r = 16'h424a;
              4'hc: out_r = 16'h424d;
              4'hd: out_r = 16'h4250;
              4'he: out_r = 16'h4254;
              4'hf: out_r = 16'h4257;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h425a;
            case (mant_lo)
              4'h1: out_r = 16'h4261;
              4'h2: out_r = 16'h4268;
              4'h3: out_r = 16'h4270;
              4'h4: out_r = 16'h4277;
              4'h5: out_r = 16'h427f;
              4'h6: out_r = 16'h4284;
              4'h7: out_r = 16'h4288;
              4'h8: out_r = 16'h428c;
              4'h9: out_r = 16'h4291;
              4'ha: out_r = 16'h4295;
              4'hb: out_r = 16'h429a;
              4'hc: out_r = 16'h429f;
              4'hd: out_r = 16'h42a4;
              4'he: out_r = 16'h42a9;
              4'hf: out_r = 16'h42ae;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h42b4;
            case (mant_lo)
              4'h1: out_r = 16'h42ba;
              4'h2: out_r = 16'h42c0;
              4'h3: out_r = 16'h42c6;
              4'h4: out_r = 16'h42cc;
              4'h5: out_r = 16'h42d2;
              4'h6: out_r = 16'h42d9;
              4'h7: out_r = 16'h42e0;
              4'h8: out_r = 16'h42e7;
              4'h9: out_r = 16'h42ef;
              4'ha: out_r = 16'h42f6;
              4'hb: out_r = 16'h42fe;
              4'hc: out_r = 16'h4303;
              4'hd: out_r = 16'h4307;
              4'he: out_r = 16'h430b;
              4'hf: out_r = 16'h4310;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h4314;
            case (mant_lo)
              4'h1: out_r = 16'h4319;
              4'h2: out_r = 16'h431e;
              4'h3: out_r = 16'h4323;
              4'h4: out_r = 16'h4328;
              4'h5: out_r = 16'h432e;
              4'h6: out_r = 16'h4333;
              4'h7: out_r = 16'h4339;
              4'h8: out_r = 16'h433f;
              4'h9: out_r = 16'h4345;
              4'ha: out_r = 16'h434b;
              4'hb: out_r = 16'h4351;
              4'hc: out_r = 16'h4358;
              4'hd: out_r = 16'h435f;
              4'he: out_r = 16'h4366;
              4'hf: out_r = 16'h436d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h4375;
            case (mant_lo)
              4'h1: out_r = 16'h437c;
              4'h2: out_r = 16'h4382;
              4'h3: out_r = 16'h4386;
              4'h4: out_r = 16'h438b;
              4'h5: out_r = 16'h438f;
              4'h6: out_r = 16'h4394;
              4'h7: out_r = 16'h4398;
              4'h8: out_r = 16'h439d;
              4'h9: out_r = 16'h43a2;
              4'ha: out_r = 16'h43a7;
              4'hb: out_r = 16'h43ad;
              4'hc: out_r = 16'h43b2;
              4'hd: out_r = 16'h43b8;
              4'he: out_r = 16'h43bd;
              4'hf: out_r = 16'h43c4;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h43ca;
            case (mant_lo)
              4'h1: out_r = 16'h43d0;
              4'h2: out_r = 16'h43d7;
              4'h3: out_r = 16'h43de;
              4'h4: out_r = 16'h43e5;
              4'h5: out_r = 16'h43ec;
              4'h6: out_r = 16'h43f3;
              4'h7: out_r = 16'h43fb;
              4'h8: out_r = 16'h4402;
              4'h9: out_r = 16'h4406;
              4'ha: out_r = 16'h440a;
              4'hb: out_r = 16'h440e;
              4'hc: out_r = 16'h4413;
              4'hd: out_r = 16'h4417;
              4'he: out_r = 16'h441c;
              4'hf: out_r = 16'h4421;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h4426;
            case (mant_lo)
              4'h1: out_r = 16'h442c;
              4'h2: out_r = 16'h4431;
              4'h3: out_r = 16'h4437;
              4'h4: out_r = 16'h443c;
              4'h5: out_r = 16'h4442;
              4'h6: out_r = 16'h4449;
              4'h7: out_r = 16'h444f;
              4'h8: out_r = 16'h4456;
              4'h9: out_r = 16'h445c;
              4'ha: out_r = 16'h4463;
              4'hb: out_r = 16'h446b;
              4'hc: out_r = 16'h4472;
              4'hd: out_r = 16'h447a;
              4'he: out_r = 16'h4481;
              4'hf: out_r = 16'h4485;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4489;
            case (mant_lo)
              4'h1: out_r = 16'h448d;
              4'h2: out_r = 16'h4492;
              4'h3: out_r = 16'h4497;
              4'h4: out_r = 16'h449b;
              4'h5: out_r = 16'h44a0;
              4'h6: out_r = 16'h44a5;
              4'h7: out_r = 16'h44ab;
              4'h8: out_r = 16'h44b0;
              4'h9: out_r = 16'h44b6;
              4'ha: out_r = 16'h44bb;
              4'hb: out_r = 16'h44c1;
              4'hc: out_r = 16'h44c7;
              4'hd: out_r = 16'h44ce;
              4'he: out_r = 16'h44d4;
              4'hf: out_r = 16'h44db;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h44e2;
            case (mant_lo)
              4'h1: out_r = 16'h44e9;
              4'h2: out_r = 16'h44f1;
              4'h3: out_r = 16'h44f8;
              4'h4: out_r = 16'h4500;
              4'h5: out_r = 16'h4504;
              4'h6: out_r = 16'h4508;
              4'h7: out_r = 16'h450d;
              4'h8: out_r = 16'h4511;
              4'h9: out_r = 16'h4516;
              4'ha: out_r = 16'h451a;
              4'hb: out_r = 16'h451f;
              4'hc: out_r = 16'h4524;
              4'hd: out_r = 16'h452a;
              4'he: out_r = 16'h452f;
              4'hf: out_r = 16'h4535;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h453a;
            case (mant_lo)
              4'h1: out_r = 16'h4546;
              4'h2: out_r = 16'h4553;
              4'h3: out_r = 16'h4561;
              4'h4: out_r = 16'h456f;
              4'h5: out_r = 16'h457f;
              4'h6: out_r = 16'h4588;
              4'h7: out_r = 16'h4590;
              4'h8: out_r = 16'h459a;
              4'h9: out_r = 16'h45a3;
              4'ha: out_r = 16'h45ae;
              4'hb: out_r = 16'h45b9;
              4'hc: out_r = 16'h45c5;
              4'hd: out_r = 16'h45d2;
              4'he: out_r = 16'h45df;
              4'hf: out_r = 16'h45ee;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h45fd;
            case (mant_lo)
              4'h1: out_r = 16'h4607;
              4'h2: out_r = 16'h460f;
              4'h3: out_r = 16'h4619;
              4'h4: out_r = 16'h4623;
              4'h5: out_r = 16'h462d;
              4'h6: out_r = 16'h4638;
              4'h7: out_r = 16'h4644;
              4'h8: out_r = 16'h4651;
              4'h9: out_r = 16'h465e;
              4'ha: out_r = 16'h466d;
              4'hb: out_r = 16'h467c;
              4'hc: out_r = 16'h4686;
              4'hd: out_r = 16'h468f;
              4'he: out_r = 16'h4698;
              4'hf: out_r = 16'h46a2;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h46ac;
            case (mant_lo)
              4'h1: out_r = 16'h46b7;
              4'h2: out_r = 16'h46c3;
              4'h3: out_r = 16'h46d0;
              4'h4: out_r = 16'h46dd;
              4'h5: out_r = 16'h46eb;
              4'h6: out_r = 16'h46fa;
              4'h7: out_r = 16'h4705;
              4'h8: out_r = 16'h470e;
              4'h9: out_r = 16'h4717;
              4'ha: out_r = 16'h4721;
              4'hb: out_r = 16'h472b;
              4'hc: out_r = 16'h4736;
              4'hd: out_r = 16'h4742;
              4'he: out_r = 16'h474e;
              4'hf: out_r = 16'h475c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h476a;
            case (mant_lo)
              4'h1: out_r = 16'h4779;
              4'h2: out_r = 16'h4785;
              4'h3: out_r = 16'h478d;
              4'h4: out_r = 16'h4796;
              4'h5: out_r = 16'h47a0;
              4'h6: out_r = 16'h47aa;
              4'h7: out_r = 16'h47b5;
              4'h8: out_r = 16'h47c1;
              4'h9: out_r = 16'h47cd;
              4'ha: out_r = 16'h47da;
              4'hb: out_r = 16'h47e9;
              4'hc: out_r = 16'h47f8;
              4'hd: out_r = 16'h4804;
              4'he: out_r = 16'h480c;
              4'hf: out_r = 16'h4815;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h481f;
            case (mant_lo)
              4'h1: out_r = 16'h4829;
              4'h2: out_r = 16'h4834;
              4'h3: out_r = 16'h4840;
              4'h4: out_r = 16'h484c;
              4'h5: out_r = 16'h4859;
              4'h6: out_r = 16'h4867;
              4'h7: out_r = 16'h4876;
              4'h8: out_r = 16'h4883;
              4'h9: out_r = 16'h488b;
              4'ha: out_r = 16'h4894;
              4'hb: out_r = 16'h489e;
              4'hc: out_r = 16'h48a8;
              4'hd: out_r = 16'h48b3;
              4'he: out_r = 16'h48bf;
              4'hf: out_r = 16'h48cb;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h48d8;
            case (mant_lo)
              4'h1: out_r = 16'h48e6;
              4'h2: out_r = 16'h48f5;
              4'h3: out_r = 16'h4902;
              4'h4: out_r = 16'h490b;
              4'h5: out_r = 16'h4914;
              4'h6: out_r = 16'h491d;
              4'h7: out_r = 16'h4927;
              4'h8: out_r = 16'h4932;
              4'h9: out_r = 16'h493e;
              4'ha: out_r = 16'h494a;
              4'hb: out_r = 16'h4957;
              4'hc: out_r = 16'h4965;
              4'hd: out_r = 16'h4973;
              4'he: out_r = 16'h4982;
              4'hf: out_r = 16'h498a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h4993;
            case (mant_lo)
              4'h1: out_r = 16'h499c;
              4'h2: out_r = 16'h49a6;
              4'h3: out_r = 16'h49b1;
              4'h4: out_r = 16'h49bc;
              4'h5: out_r = 16'h49c9;
              4'h6: out_r = 16'h49d6;
              4'h7: out_r = 16'h49e3;
              4'h8: out_r = 16'h49f2;
              4'h9: out_r = 16'h4a01;
              4'ha: out_r = 16'h4a09;
              4'hb: out_r = 16'h4a12;
              4'hc: out_r = 16'h4a1b;
              4'hd: out_r = 16'h4a25;
              4'he: out_r = 16'h4a30;
              4'hf: out_r = 16'h4a3b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h4a48;
            case (mant_lo)
              4'h1: out_r = 16'h4a54;
              4'h2: out_r = 16'h4a62;
              4'h3: out_r = 16'h4a71;
              4'h4: out_r = 16'h4a80;
              4'h5: out_r = 16'h4a88;
              4'h6: out_r = 16'h4a91;
              4'h7: out_r = 16'h4a9b;
              4'h8: out_r = 16'h4aa4;
              4'h9: out_r = 16'h4aaf;
              4'ha: out_r = 16'h4aba;
              4'hb: out_r = 16'h4ac6;
              4'hc: out_r = 16'h4ad3;
              4'hd: out_r = 16'h4ae1;
              4'he: out_r = 16'h4aef;
              4'hf: out_r = 16'h4aff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h083: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h4b08;
            case (mant_lo)
              4'h1: out_r = 16'h4b1a;
              4'h2: out_r = 16'h4b2e;
              4'h3: out_r = 16'h4b45;
              4'h4: out_r = 16'h4b60;
              4'h5: out_r = 16'h4b7d;
              4'h6: out_r = 16'h4b90;
              4'h7: out_r = 16'h4ba3;
              4'h8: out_r = 16'h4bb8;
              4'h9: out_r = 16'h4bd1;
              4'ha: out_r = 16'h4bed;
              4'hb: out_r = 16'h4c06;
              4'hc: out_r = 16'h4c18;
              4'hd: out_r = 16'h4c2c;
              4'he: out_r = 16'h4c43;
              4'hf: out_r = 16'h4c5d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h4c7a;
            case (mant_lo)
              4'h1: out_r = 16'h4c8e;
              4'h2: out_r = 16'h4ca1;
              4'h3: out_r = 16'h4cb6;
              4'h4: out_r = 16'h4cce;
              4'h5: out_r = 16'h4cea;
              4'h6: out_r = 16'h4d05;
              4'h7: out_r = 16'h4d16;
              4'h8: out_r = 16'h4d2a;
              4'h9: out_r = 16'h4d41;
              4'ha: out_r = 16'h4d5b;
              4'hb: out_r = 16'h4d78;
              4'hc: out_r = 16'h4d8c;
              4'hd: out_r = 16'h4d9f;
              4'he: out_r = 16'h4db4;
              4'hf: out_r = 16'h4dcc;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h4de7;
            case (mant_lo)
              4'h1: out_r = 16'h4e03;
              4'h2: out_r = 16'h4e15;
              4'h3: out_r = 16'h4e28;
              4'h4: out_r = 16'h4e3f;
              4'h5: out_r = 16'h4e58;
              4'h6: out_r = 16'h4e75;
              4'h7: out_r = 16'h4e8b;
              4'h8: out_r = 16'h4e9d;
              4'h9: out_r = 16'h4eb2;
              4'ha: out_r = 16'h4eca;
              4'hb: out_r = 16'h4ee5;
              4'hc: out_r = 16'h4f02;
              4'hd: out_r = 16'h4f13;
              4'he: out_r = 16'h4f26;
              4'hf: out_r = 16'h4f3d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h4f56;
            case (mant_lo)
              4'h1: out_r = 16'h4f72;
              4'h2: out_r = 16'h4f89;
              4'h3: out_r = 16'h4f9b;
              4'h4: out_r = 16'h4fb0;
              4'h5: out_r = 16'h4fc8;
              4'h6: out_r = 16'h4fe2;
              4'h7: out_r = 16'h5000;
              4'h8: out_r = 16'h5011;
              4'h9: out_r = 16'h5025;
              4'ha: out_r = 16'h503a;
              4'hb: out_r = 16'h5053;
              4'hc: out_r = 16'h506f;
              4'hd: out_r = 16'h5088;
              4'he: out_r = 16'h509a;
              4'hf: out_r = 16'h50ae;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h50c5;
            case (mant_lo)
              4'h1: out_r = 16'h50e0;
              4'h2: out_r = 16'h50fd;
              4'h3: out_r = 16'h5110;
              4'h4: out_r = 16'h5123;
              4'h5: out_r = 16'h5138;
              4'h6: out_r = 16'h5151;
              4'h7: out_r = 16'h516d;
              4'h8: out_r = 16'h5186;
              4'h9: out_r = 16'h5198;
              4'ha: out_r = 16'h51ac;
              4'hb: out_r = 16'h51c3;
              4'hc: out_r = 16'h51dd;
              4'hd: out_r = 16'h51fb;
              4'he: out_r = 16'h520e;
              4'hf: out_r = 16'h5221;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h5236;
            case (mant_lo)
              4'h1: out_r = 16'h524f;
              4'h2: out_r = 16'h526a;
              4'h3: out_r = 16'h5285;
              4'h4: out_r = 16'h5296;
              4'h5: out_r = 16'h52aa;
              4'h6: out_r = 16'h52c1;
              4'h7: out_r = 16'h52db;
              4'h8: out_r = 16'h52f8;
              4'h9: out_r = 16'h530c;
              4'ha: out_r = 16'h531f;
              4'hb: out_r = 16'h5334;
              4'hc: out_r = 16'h534c;
              4'hd: out_r = 16'h5367;
              4'he: out_r = 16'h5383;
              4'hf: out_r = 16'h5395;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h53a8;
            case (mant_lo)
              4'h1: out_r = 16'h53bf;
              4'h2: out_r = 16'h53d8;
              4'h3: out_r = 16'h53f5;
              4'h4: out_r = 16'h540b;
              4'h5: out_r = 16'h541d;
              4'h6: out_r = 16'h5432;
              4'h7: out_r = 16'h544a;
              4'h8: out_r = 16'h5465;
              4'h9: out_r = 16'h5482;
              4'ha: out_r = 16'h5493;
              4'hb: out_r = 16'h54a6;
              4'hc: out_r = 16'h54bd;
              4'hd: out_r = 16'h54d6;
              4'he: out_r = 16'h54f2;
              4'hf: out_r = 16'h5509;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h551c;
            case (mant_lo)
              4'h1: out_r = 16'h5530;
              4'h2: out_r = 16'h5548;
              4'h3: out_r = 16'h5562;
              4'h4: out_r = 16'h5580;
              4'h5: out_r = 16'h5591;
              4'h6: out_r = 16'h55a5;
              4'h7: out_r = 16'h55bb;
              4'h8: out_r = 16'h55d3;
              4'h9: out_r = 16'h55f0;
              4'ha: out_r = 16'h5608;
              4'hb: out_r = 16'h561a;
              4'hc: out_r = 16'h562e;
              4'hd: out_r = 16'h5645;
              4'he: out_r = 16'h5660;
              4'hf: out_r = 16'h567e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h084: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h5690;
            case (mant_lo)
              4'h1: out_r = 16'h56b8;
              4'h2: out_r = 16'h56ed;
              4'h3: out_r = 16'h5718;
              4'h4: out_r = 16'h5743;
              4'h5: out_r = 16'h577b;
              4'h6: out_r = 16'h57a1;
              4'h7: out_r = 16'h57cf;
              4'h8: out_r = 16'h5805;
              4'h9: out_r = 16'h582a;
              4'ha: out_r = 16'h585b;
              4'hb: out_r = 16'h588c;
              4'hc: out_r = 16'h58b4;
              4'hd: out_r = 16'h58e8;
              4'he: out_r = 16'h5915;
              4'hf: out_r = 16'h593f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h5975;
            case (mant_lo)
              4'h1: out_r = 16'h599d;
              4'h2: out_r = 16'h59ca;
              4'h3: out_r = 16'h5a02;
              4'h4: out_r = 16'h5a27;
              4'h5: out_r = 16'h5a56;
              4'h6: out_r = 16'h5a89;
              4'h7: out_r = 16'h5ab0;
              4'h8: out_r = 16'h5ae2;
              4'h9: out_r = 16'h5b11;
              4'ha: out_r = 16'h5b3b;
              4'hb: out_r = 16'h5b70;
              4'hc: out_r = 16'h5b9a;
              4'hd: out_r = 16'h5bc6;
              4'he: out_r = 16'h5bfe;
              4'hf: out_r = 16'h5c23;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h5c51;
            case (mant_lo)
              4'h1: out_r = 16'h5c86;
              4'h2: out_r = 16'h5cac;
              4'h3: out_r = 16'h5cdd;
              4'h4: out_r = 16'h5d0e;
              4'h5: out_r = 16'h5d36;
              4'h6: out_r = 16'h5d6a;
              4'h7: out_r = 16'h5d96;
              4'h8: out_r = 16'h5dc1;
              4'h9: out_r = 16'h5df8;
              4'ha: out_r = 16'h5e1f;
              4'hb: out_r = 16'h5e4c;
              4'hc: out_r = 16'h5e83;
              4'hd: out_r = 16'h5ea8;
              4'he: out_r = 16'h5ed8;
              4'hf: out_r = 16'h5f0b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h5f32;
            case (mant_lo)
              4'h1: out_r = 16'h5f65;
              4'h2: out_r = 16'h5f93;
              4'h3: out_r = 16'h5fbd;
              4'h4: out_r = 16'h5ff2;
              4'h5: out_r = 16'h601c;
              4'h6: out_r = 16'h6048;
              4'h7: out_r = 16'h6080;
              4'h8: out_r = 16'h60a5;
              4'h9: out_r = 16'h60d4;
              4'ha: out_r = 16'h6108;
              4'hb: out_r = 16'h612e;
              4'hc: out_r = 16'h6160;
              4'hd: out_r = 16'h6190;
              4'he: out_r = 16'h61b9;
              4'hf: out_r = 16'h61ed;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h6218;
            case (mant_lo)
              4'h1: out_r = 16'h6243;
              4'h2: out_r = 16'h627b;
              4'h3: out_r = 16'h62a1;
              4'h4: out_r = 16'h62cf;
              4'h5: out_r = 16'h6305;
              4'h6: out_r = 16'h632a;
              4'h7: out_r = 16'h635b;
              4'h8: out_r = 16'h638d;
              4'h9: out_r = 16'h63b4;
              4'ha: out_r = 16'h63e8;
              4'hb: out_r = 16'h6415;
              4'hc: out_r = 16'h643f;
              4'hd: out_r = 16'h6475;
              4'he: out_r = 16'h649d;
              4'hf: out_r = 16'h64ca;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h6502;
            case (mant_lo)
              4'h1: out_r = 16'h6527;
              4'h2: out_r = 16'h6556;
              4'h3: out_r = 16'h6589;
              4'h4: out_r = 16'h65b0;
              4'h5: out_r = 16'h65e3;
              4'h6: out_r = 16'h6611;
              4'h7: out_r = 16'h663b;
              4'h8: out_r = 16'h6670;
              4'h9: out_r = 16'h669a;
              4'ha: out_r = 16'h66c6;
              4'hb: out_r = 16'h66fe;
              4'hc: out_r = 16'h6723;
              4'hd: out_r = 16'h6751;
              4'he: out_r = 16'h6786;
              4'hf: out_r = 16'h67ac;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h67dd;
            case (mant_lo)
              4'h1: out_r = 16'h680e;
              4'h2: out_r = 16'h6837;
              4'h3: out_r = 16'h686a;
              4'h4: out_r = 16'h6896;
              4'h5: out_r = 16'h68c1;
              4'h6: out_r = 16'h68f8;
              4'h7: out_r = 16'h691f;
              4'h8: out_r = 16'h694d;
              4'h9: out_r = 16'h6983;
              4'ha: out_r = 16'h69a9;
              4'hb: out_r = 16'h69d9;
              4'hc: out_r = 16'h6a0b;
              4'hd: out_r = 16'h6a32;
              4'he: out_r = 16'h6a65;
              4'hf: out_r = 16'h6a93;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h6abd;
            case (mant_lo)
              4'h1: out_r = 16'h6af3;
              4'h2: out_r = 16'h6b1c;
              4'h3: out_r = 16'h6b48;
              4'h4: out_r = 16'h6b80;
              4'h5: out_r = 16'h6ba5;
              4'h6: out_r = 16'h6bd4;
              4'h7: out_r = 16'h6c08;
              4'h8: out_r = 16'h6c2f;
              4'h9: out_r = 16'h6c60;
              4'ha: out_r = 16'h6c90;
              4'hb: out_r = 16'h6cb9;
              4'hc: out_r = 16'h6ced;
              4'hd: out_r = 16'h6d18;
              4'he: out_r = 16'h6d44;
              4'hf: out_r = 16'h6d7b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h6da1;
            case (mant_lo)
              4'h1: out_r = 16'h6e05;
              4'h2: out_r = 16'h6e5b;
              4'h3: out_r = 16'h6eb5;
              4'h4: out_r = 16'h6f15;
              4'h5: out_r = 16'h6f75;
              4'h6: out_r = 16'h6fca;
              4'h7: out_r = 16'h7027;
              4'h8: out_r = 16'h7089;
              4'h9: out_r = 16'h70e3;
              4'ha: out_r = 16'h713b;
              4'hb: out_r = 16'h719a;
              4'hc: out_r = 16'h71fe;
              4'hd: out_r = 16'h7251;
              4'he: out_r = 16'h72ad;
              4'hf: out_r = 16'h730e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h736b;
            case (mant_lo)
              4'h1: out_r = 16'h73c1;
              4'h2: out_r = 16'h741f;
              4'h3: out_r = 16'h7483;
              4'h4: out_r = 16'h74d9;
              4'h5: out_r = 16'h7533;
              4'h6: out_r = 16'h7593;
              4'h7: out_r = 16'h75f3;
              4'h8: out_r = 16'h7648;
              4'h9: out_r = 16'h76a5;
              4'ha: out_r = 16'h7708;
              4'hb: out_r = 16'h7760;
              4'hc: out_r = 16'h77b9;
              4'hd: out_r = 16'h7818;
              4'he: out_r = 16'h787b;
              4'hf: out_r = 16'h78cf;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h792b;
            case (mant_lo)
              4'h1: out_r = 16'h798d;
              4'h2: out_r = 16'h79e8;
              4'h3: out_r = 16'h7a3f;
              4'h4: out_r = 16'h7a9e;
              4'h5: out_r = 16'h7b02;
              4'h6: out_r = 16'h7b56;
              4'h7: out_r = 16'h7bb1;
              4'h8: out_r = 16'h7c12;
              4'h9: out_r = 16'h7c70;
              4'ha: out_r = 16'h7cc6;
              4'hb: out_r = 16'h7d23;
              4'hc: out_r = 16'h7d87;
              4'hd: out_r = 16'h7dde;
              4'he: out_r = 16'h7e37;
              4'hf: out_r = 16'h7e97;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h7f80;
            case (mant_lo)
              4'h0: out_r = 16'h7ef9;
              4'h1: out_r = 16'h7f4d;
              default: begin end
            endcase
          end
          3'h4: out_r = 16'h7f80;
          3'h5: out_r = 16'h7f80;
          3'h6: out_r = 16'h7f80;
          3'h7: out_r = 16'h7f80;
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
        case (mant_hi)
          3'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo)
              4'h0: out_r = 16'h7f80;
              default: begin end
            endcase
          end
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
      9'h100: out_r = 16'h3f80;
      9'h101: out_r = 16'h3f80;
      9'h102: out_r = 16'h3f80;
      9'h103: out_r = 16'h3f80;
      9'h104: out_r = 16'h3f80;
      9'h105: out_r = 16'h3f80;
      9'h106: out_r = 16'h3f80;
      9'h107: out_r = 16'h3f80;
      9'h108: out_r = 16'h3f80;
      9'h109: out_r = 16'h3f80;
      9'h10a: out_r = 16'h3f80;
      9'h10b: out_r = 16'h3f80;
      9'h10c: out_r = 16'h3f80;
      9'h10d: out_r = 16'h3f80;
      9'h10e: out_r = 16'h3f80;
      9'h10f: out_r = 16'h3f80;
      9'h110: out_r = 16'h3f80;
      9'h111: out_r = 16'h3f80;
      9'h112: out_r = 16'h3f80;
      9'h113: out_r = 16'h3f80;
      9'h114: out_r = 16'h3f80;
      9'h115: out_r = 16'h3f80;
      9'h116: out_r = 16'h3f80;
      9'h117: out_r = 16'h3f80;
      9'h118: out_r = 16'h3f80;
      9'h119: out_r = 16'h3f80;
      9'h11a: out_r = 16'h3f80;
      9'h11b: out_r = 16'h3f80;
      9'h11c: out_r = 16'h3f80;
      9'h11d: out_r = 16'h3f80;
      9'h11e: out_r = 16'h3f80;
      9'h11f: out_r = 16'h3f80;
      9'h120: out_r = 16'h3f80;
      9'h121: out_r = 16'h3f80;
      9'h122: out_r = 16'h3f80;
      9'h123: out_r = 16'h3f80;
      9'h124: out_r = 16'h3f80;
      9'h125: out_r = 16'h3f80;
      9'h126: out_r = 16'h3f80;
      9'h127: out_r = 16'h3f80;
      9'h128: out_r = 16'h3f80;
      9'h129: out_r = 16'h3f80;
      9'h12a: out_r = 16'h3f80;
      9'h12b: out_r = 16'h3f80;
      9'h12c: out_r = 16'h3f80;
      9'h12d: out_r = 16'h3f80;
      9'h12e: out_r = 16'h3f80;
      9'h12f: out_r = 16'h3f80;
      9'h130: out_r = 16'h3f80;
      9'h131: out_r = 16'h3f80;
      9'h132: out_r = 16'h3f80;
      9'h133: out_r = 16'h3f80;
      9'h134: out_r = 16'h3f80;
      9'h135: out_r = 16'h3f80;
      9'h136: out_r = 16'h3f80;
      9'h137: out_r = 16'h3f80;
      9'h138: out_r = 16'h3f80;
      9'h139: out_r = 16'h3f80;
      9'h13a: out_r = 16'h3f80;
      9'h13b: out_r = 16'h3f80;
      9'h13c: out_r = 16'h3f80;
      9'h13d: out_r = 16'h3f80;
      9'h13e: out_r = 16'h3f80;
      9'h13f: out_r = 16'h3f80;
      9'h140: out_r = 16'h3f80;
      9'h141: out_r = 16'h3f80;
      9'h142: out_r = 16'h3f80;
      9'h143: out_r = 16'h3f80;
      9'h144: out_r = 16'h3f80;
      9'h145: out_r = 16'h3f80;
      9'h146: out_r = 16'h3f80;
      9'h147: out_r = 16'h3f80;
      9'h148: out_r = 16'h3f80;
      9'h149: out_r = 16'h3f80;
      9'h14a: out_r = 16'h3f80;
      9'h14b: out_r = 16'h3f80;
      9'h14c: out_r = 16'h3f80;
      9'h14d: out_r = 16'h3f80;
      9'h14e: out_r = 16'h3f80;
      9'h14f: out_r = 16'h3f80;
      9'h150: out_r = 16'h3f80;
      9'h151: out_r = 16'h3f80;
      9'h152: out_r = 16'h3f80;
      9'h153: out_r = 16'h3f80;
      9'h154: out_r = 16'h3f80;
      9'h155: out_r = 16'h3f80;
      9'h156: out_r = 16'h3f80;
      9'h157: out_r = 16'h3f80;
      9'h158: out_r = 16'h3f80;
      9'h159: out_r = 16'h3f80;
      9'h15a: out_r = 16'h3f80;
      9'h15b: out_r = 16'h3f80;
      9'h15c: out_r = 16'h3f80;
      9'h15d: out_r = 16'h3f80;
      9'h15e: out_r = 16'h3f80;
      9'h15f: out_r = 16'h3f80;
      9'h160: out_r = 16'h3f80;
      9'h161: out_r = 16'h3f80;
      9'h162: out_r = 16'h3f80;
      9'h163: out_r = 16'h3f80;
      9'h164: out_r = 16'h3f80;
      9'h165: out_r = 16'h3f80;
      9'h166: out_r = 16'h3f80;
      9'h167: out_r = 16'h3f80;
      9'h168: out_r = 16'h3f80;
      9'h169: out_r = 16'h3f80;
      9'h16a: out_r = 16'h3f80;
      9'h16b: out_r = 16'h3f80;
      9'h16c: out_r = 16'h3f80;
      9'h16d: out_r = 16'h3f80;
      9'h16e: out_r = 16'h3f80;
      9'h16f: out_r = 16'h3f80;
      9'h170: out_r = 16'h3f80;
      9'h171: out_r = 16'h3f80;
      9'h172: out_r = 16'h3f80;
      9'h173: out_r = 16'h3f80;
      9'h174: out_r = 16'h3f80;
      9'h175: out_r = 16'h3f80;
      9'h176: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f7f;
            case (mant_lo)
              4'h0: out_r = 16'h3f80;
              default: begin end
            endcase
          end
          3'h1: out_r = 16'h3f7f;
          3'h2: out_r = 16'h3f7f;
          3'h3: out_r = 16'h3f7f;
          3'h4: out_r = 16'h3f7f;
          3'h5: out_r = 16'h3f7f;
          3'h6: out_r = 16'h3f7f;
          3'h7: out_r = 16'h3f7f;
          default: begin end
        endcase
      end
      9'h177: begin
        case (mant_hi)
          3'h0: out_r = 16'h3f7f;
          3'h1: out_r = 16'h3f7f;
          3'h2: out_r = 16'h3f7f;
          3'h3: out_r = 16'h3f7f;
          3'h4: begin
            out_r = 16'h3f7e;
            case (mant_lo)
              4'h0: out_r = 16'h3f7f;
              default: begin end
            endcase
          end
          3'h5: out_r = 16'h3f7e;
          3'h6: out_r = 16'h3f7e;
          3'h7: out_r = 16'h3f7e;
          default: begin end
        endcase
      end
      9'h178: begin
        case (mant_hi)
          3'h0: out_r = 16'h3f7e;
          3'h1: out_r = 16'h3f7e;
          3'h2: begin
            out_r = 16'h3f7d;
            case (mant_lo)
              4'h0: out_r = 16'h3f7e;
              default: begin end
            endcase
          end
          3'h3: out_r = 16'h3f7d;
          3'h4: out_r = 16'h3f7d;
          3'h5: out_r = 16'h3f7d;
          3'h6: begin
            out_r = 16'h3f7c;
            case (mant_lo)
              4'h0: out_r = 16'h3f7d;
              4'h1: out_r = 16'h3f7d;
              default: begin end
            endcase
          end
          3'h7: out_r = 16'h3f7c;
          default: begin end
        endcase
      end
      9'h179: begin
        case (mant_hi)
          3'h0: out_r = 16'h3f7c;
          3'h1: begin
            out_r = 16'h3f7b;
            case (mant_lo)
              4'h0: out_r = 16'h3f7c;
              4'h1: out_r = 16'h3f7c;
              default: begin end
            endcase
          end
          3'h2: out_r = 16'h3f7b;
          3'h3: begin
            out_r = 16'h3f7a;
            case (mant_lo)
              4'h0: out_r = 16'h3f7b;
              4'h1: out_r = 16'h3f7b;
              default: begin end
            endcase
          end
          3'h4: out_r = 16'h3f7a;
          3'h5: begin
            out_r = 16'h3f79;
            case (mant_lo)
              4'h0: out_r = 16'h3f7a;
              4'h1: out_r = 16'h3f7a;
              4'h2: out_r = 16'h3f7a;
              default: begin end
            endcase
          end
          3'h6: out_r = 16'h3f79;
          3'h7: begin
            out_r = 16'h3f78;
            case (mant_lo)
              4'h0: out_r = 16'h3f79;
              4'h1: out_r = 16'h3f79;
              4'h2: out_r = 16'h3f79;
              4'h3: out_r = 16'h3f79;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17a: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f78;
            case (mant_lo)
              4'hb: out_r = 16'h3f77;
              4'hc: out_r = 16'h3f77;
              4'hd: out_r = 16'h3f77;
              4'he: out_r = 16'h3f77;
              4'hf: out_r = 16'h3f77;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f77;
            case (mant_lo)
              4'hb: out_r = 16'h3f76;
              4'hc: out_r = 16'h3f76;
              4'hd: out_r = 16'h3f76;
              4'he: out_r = 16'h3f76;
              4'hf: out_r = 16'h3f76;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f76;
            case (mant_lo)
              4'hc: out_r = 16'h3f75;
              4'hd: out_r = 16'h3f75;
              4'he: out_r = 16'h3f75;
              4'hf: out_r = 16'h3f75;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f75;
            case (mant_lo)
              4'hd: out_r = 16'h3f74;
              4'he: out_r = 16'h3f74;
              4'hf: out_r = 16'h3f74;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f74;
            case (mant_lo)
              4'he: out_r = 16'h3f73;
              4'hf: out_r = 16'h3f73;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f73;
            case (mant_lo)
              4'he: out_r = 16'h3f72;
              4'hf: out_r = 16'h3f72;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f72;
            case (mant_lo)
              4'hf: out_r = 16'h3f71;
              default: begin end
            endcase
          end
          3'h7: out_r = 16'h3f71;
          default: begin end
        endcase
      end
      9'h17b: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f70;
            case (mant_lo)
              4'h9: out_r = 16'h3f6f;
              4'ha: out_r = 16'h3f6f;
              4'hb: out_r = 16'h3f6f;
              4'hc: out_r = 16'h3f6f;
              4'hd: out_r = 16'h3f6f;
              4'he: out_r = 16'h3f6f;
              4'hf: out_r = 16'h3f6f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f6e;
            case (mant_lo)
              4'h0: out_r = 16'h3f6f;
              4'h1: out_r = 16'h3f6f;
              4'ha: out_r = 16'h3f6d;
              4'hb: out_r = 16'h3f6d;
              4'hc: out_r = 16'h3f6d;
              4'hd: out_r = 16'h3f6d;
              4'he: out_r = 16'h3f6d;
              4'hf: out_r = 16'h3f6d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f6c;
            case (mant_lo)
              4'h0: out_r = 16'h3f6d;
              4'h1: out_r = 16'h3f6d;
              4'h2: out_r = 16'h3f6d;
              4'hb: out_r = 16'h3f6b;
              4'hc: out_r = 16'h3f6b;
              4'hd: out_r = 16'h3f6b;
              4'he: out_r = 16'h3f6b;
              4'hf: out_r = 16'h3f6b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f6a;
            case (mant_lo)
              4'h0: out_r = 16'h3f6b;
              4'h1: out_r = 16'h3f6b;
              4'h2: out_r = 16'h3f6b;
              4'h3: out_r = 16'h3f6b;
              4'hd: out_r = 16'h3f69;
              4'he: out_r = 16'h3f69;
              4'hf: out_r = 16'h3f69;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f68;
            case (mant_lo)
              4'h0: out_r = 16'h3f69;
              4'h1: out_r = 16'h3f69;
              4'h2: out_r = 16'h3f69;
              4'h3: out_r = 16'h3f69;
              4'h4: out_r = 16'h3f69;
              4'h5: out_r = 16'h3f69;
              4'hf: out_r = 16'h3f67;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f66;
            case (mant_lo)
              4'h0: out_r = 16'h3f67;
              4'h1: out_r = 16'h3f67;
              4'h2: out_r = 16'h3f67;
              4'h3: out_r = 16'h3f67;
              4'h4: out_r = 16'h3f67;
              4'h5: out_r = 16'h3f67;
              4'h6: out_r = 16'h3f67;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f65;
            case (mant_lo)
              4'h9: out_r = 16'h3f64;
              4'ha: out_r = 16'h3f64;
              4'hb: out_r = 16'h3f64;
              4'hc: out_r = 16'h3f64;
              4'hd: out_r = 16'h3f64;
              4'he: out_r = 16'h3f64;
              4'hf: out_r = 16'h3f64;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f63;
            case (mant_lo)
              4'h0: out_r = 16'h3f64;
              4'h1: out_r = 16'h3f64;
              4'hb: out_r = 16'h3f62;
              4'hc: out_r = 16'h3f62;
              4'hd: out_r = 16'h3f62;
              4'he: out_r = 16'h3f62;
              4'hf: out_r = 16'h3f62;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f60;
            case (mant_lo)
              4'h0: out_r = 16'h3f62;
              4'h1: out_r = 16'h3f62;
              4'h2: out_r = 16'h3f61;
              4'h3: out_r = 16'h3f61;
              4'h4: out_r = 16'h3f61;
              4'h5: out_r = 16'h3f61;
              4'h6: out_r = 16'h3f61;
              4'hc: out_r = 16'h3f5f;
              4'hd: out_r = 16'h3f5f;
              4'he: out_r = 16'h3f5f;
              4'hf: out_r = 16'h3f5f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f5c;
            case (mant_lo)
              4'h0: out_r = 16'h3f5e;
              4'h1: out_r = 16'h3f5e;
              4'h2: out_r = 16'h3f5e;
              4'h3: out_r = 16'h3f5e;
              4'h4: out_r = 16'h3f5e;
              4'h5: out_r = 16'h3f5d;
              4'h6: out_r = 16'h3f5d;
              4'h7: out_r = 16'h3f5d;
              4'h8: out_r = 16'h3f5d;
              4'he: out_r = 16'h3f5b;
              4'hf: out_r = 16'h3f5b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f59;
            case (mant_lo)
              4'h0: out_r = 16'h3f5b;
              4'h1: out_r = 16'h3f5b;
              4'h2: out_r = 16'h3f5b;
              4'h3: out_r = 16'h3f5a;
              4'h4: out_r = 16'h3f5a;
              4'h5: out_r = 16'h3f5a;
              4'h6: out_r = 16'h3f5a;
              4'hc: out_r = 16'h3f58;
              4'hd: out_r = 16'h3f58;
              4'he: out_r = 16'h3f58;
              4'hf: out_r = 16'h3f58;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f55;
            case (mant_lo)
              4'h0: out_r = 16'h3f58;
              4'h1: out_r = 16'h3f57;
              4'h2: out_r = 16'h3f57;
              4'h3: out_r = 16'h3f57;
              4'h4: out_r = 16'h3f57;
              4'h5: out_r = 16'h3f57;
              4'h6: out_r = 16'h3f56;
              4'h7: out_r = 16'h3f56;
              4'h8: out_r = 16'h3f56;
              4'h9: out_r = 16'h3f56;
              4'hf: out_r = 16'h3f54;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f52;
            case (mant_lo)
              4'h0: out_r = 16'h3f54;
              4'h1: out_r = 16'h3f54;
              4'h2: out_r = 16'h3f54;
              4'h3: out_r = 16'h3f54;
              4'h4: out_r = 16'h3f53;
              4'h5: out_r = 16'h3f53;
              4'h6: out_r = 16'h3f53;
              4'h7: out_r = 16'h3f53;
              4'h8: out_r = 16'h3f53;
              4'he: out_r = 16'h3f51;
              4'hf: out_r = 16'h3f51;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f4f;
            case (mant_lo)
              4'h0: out_r = 16'h3f51;
              4'h1: out_r = 16'h3f51;
              4'h2: out_r = 16'h3f51;
              4'h3: out_r = 16'h3f50;
              4'h4: out_r = 16'h3f50;
              4'h5: out_r = 16'h3f50;
              4'h6: out_r = 16'h3f50;
              4'h7: out_r = 16'h3f50;
              4'hd: out_r = 16'h3f4e;
              4'he: out_r = 16'h3f4e;
              4'hf: out_r = 16'h3f4e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f4c;
            case (mant_lo)
              4'h0: out_r = 16'h3f4e;
              4'h1: out_r = 16'h3f4e;
              4'h2: out_r = 16'h3f4d;
              4'h3: out_r = 16'h3f4d;
              4'h4: out_r = 16'h3f4d;
              4'h5: out_r = 16'h3f4d;
              4'h6: out_r = 16'h3f4d;
              4'hc: out_r = 16'h3f4b;
              4'hd: out_r = 16'h3f4b;
              4'he: out_r = 16'h3f4b;
              4'hf: out_r = 16'h3f4b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f48;
            case (mant_lo)
              4'h0: out_r = 16'h3f4b;
              4'h1: out_r = 16'h3f4a;
              4'h2: out_r = 16'h3f4a;
              4'h3: out_r = 16'h3f4a;
              4'h4: out_r = 16'h3f4a;
              4'h5: out_r = 16'h3f4a;
              4'h6: out_r = 16'h3f49;
              4'h7: out_r = 16'h3f49;
              4'h8: out_r = 16'h3f49;
              4'h9: out_r = 16'h3f49;
              4'ha: out_r = 16'h3f49;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f42;
            case (mant_lo)
              4'h0: out_r = 16'h3f47;
              4'h1: out_r = 16'h3f47;
              4'h2: out_r = 16'h3f47;
              4'h3: out_r = 16'h3f46;
              4'h4: out_r = 16'h3f46;
              4'h5: out_r = 16'h3f45;
              4'h6: out_r = 16'h3f45;
              4'h7: out_r = 16'h3f45;
              4'h8: out_r = 16'h3f44;
              4'h9: out_r = 16'h3f44;
              4'ha: out_r = 16'h3f44;
              4'hb: out_r = 16'h3f43;
              4'hc: out_r = 16'h3f43;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f3c;
            case (mant_lo)
              4'h0: out_r = 16'h3f41;
              4'h1: out_r = 16'h3f41;
              4'h2: out_r = 16'h3f40;
              4'h3: out_r = 16'h3f40;
              4'h4: out_r = 16'h3f40;
              4'h5: out_r = 16'h3f3f;
              4'h6: out_r = 16'h3f3f;
              4'h7: out_r = 16'h3f3f;
              4'h8: out_r = 16'h3f3e;
              4'h9: out_r = 16'h3f3e;
              4'ha: out_r = 16'h3f3e;
              4'hb: out_r = 16'h3f3d;
              4'hc: out_r = 16'h3f3d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f37;
            case (mant_lo)
              4'h0: out_r = 16'h3f3b;
              4'h1: out_r = 16'h3f3b;
              4'h2: out_r = 16'h3f3b;
              4'h3: out_r = 16'h3f3a;
              4'h4: out_r = 16'h3f3a;
              4'h5: out_r = 16'h3f39;
              4'h6: out_r = 16'h3f39;
              4'h7: out_r = 16'h3f39;
              4'h8: out_r = 16'h3f38;
              4'h9: out_r = 16'h3f38;
              4'ha: out_r = 16'h3f38;
              4'he: out_r = 16'h3f36;
              4'hf: out_r = 16'h3f36;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f31;
            case (mant_lo)
              4'h0: out_r = 16'h3f36;
              4'h1: out_r = 16'h3f35;
              4'h2: out_r = 16'h3f35;
              4'h3: out_r = 16'h3f34;
              4'h4: out_r = 16'h3f34;
              4'h5: out_r = 16'h3f34;
              4'h6: out_r = 16'h3f33;
              4'h7: out_r = 16'h3f33;
              4'h8: out_r = 16'h3f33;
              4'h9: out_r = 16'h3f32;
              4'ha: out_r = 16'h3f32;
              4'hb: out_r = 16'h3f32;
              4'hf: out_r = 16'h3f30;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f2c;
            case (mant_lo)
              4'h0: out_r = 16'h3f30;
              4'h1: out_r = 16'h3f30;
              4'h2: out_r = 16'h3f2f;
              4'h3: out_r = 16'h3f2f;
              4'h4: out_r = 16'h3f2f;
              4'h5: out_r = 16'h3f2e;
              4'h6: out_r = 16'h3f2e;
              4'h7: out_r = 16'h3f2e;
              4'h8: out_r = 16'h3f2d;
              4'h9: out_r = 16'h3f2d;
              4'ha: out_r = 16'h3f2d;
              4'he: out_r = 16'h3f2b;
              4'hf: out_r = 16'h3f2b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f26;
            case (mant_lo)
              4'h0: out_r = 16'h3f2b;
              4'h1: out_r = 16'h3f2a;
              4'h2: out_r = 16'h3f2a;
              4'h3: out_r = 16'h3f2a;
              4'h4: out_r = 16'h3f29;
              4'h5: out_r = 16'h3f29;
              4'h6: out_r = 16'h3f29;
              4'h7: out_r = 16'h3f28;
              4'h8: out_r = 16'h3f28;
              4'h9: out_r = 16'h3f28;
              4'ha: out_r = 16'h3f27;
              4'hb: out_r = 16'h3f27;
              4'hc: out_r = 16'h3f27;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f21;
            case (mant_lo)
              4'h0: out_r = 16'h3f25;
              4'h1: out_r = 16'h3f25;
              4'h2: out_r = 16'h3f25;
              4'h3: out_r = 16'h3f24;
              4'h4: out_r = 16'h3f24;
              4'h5: out_r = 16'h3f24;
              4'h6: out_r = 16'h3f23;
              4'h7: out_r = 16'h3f23;
              4'h8: out_r = 16'h3f23;
              4'h9: out_r = 16'h3f22;
              4'ha: out_r = 16'h3f22;
              4'hb: out_r = 16'h3f22;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f1c;
            case (mant_lo)
              4'h0: out_r = 16'h3f20;
              4'h1: out_r = 16'h3f20;
              4'h2: out_r = 16'h3f20;
              4'h3: out_r = 16'h3f1f;
              4'h4: out_r = 16'h3f1f;
              4'h5: out_r = 16'h3f1f;
              4'h6: out_r = 16'h3f1e;
              4'h7: out_r = 16'h3f1e;
              4'h8: out_r = 16'h3f1e;
              4'h9: out_r = 16'h3f1d;
              4'ha: out_r = 16'h3f1d;
              4'hb: out_r = 16'h3f1d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3f14;
            case (mant_lo)
              4'h0: out_r = 16'h3f1b;
              4'h1: out_r = 16'h3f1b;
              4'h2: out_r = 16'h3f1a;
              4'h3: out_r = 16'h3f19;
              4'h4: out_r = 16'h3f19;
              4'h5: out_r = 16'h3f18;
              4'h6: out_r = 16'h3f18;
              4'h7: out_r = 16'h3f17;
              4'h8: out_r = 16'h3f16;
              4'h9: out_r = 16'h3f16;
              4'ha: out_r = 16'h3f15;
              4'hb: out_r = 16'h3f15;
              4'he: out_r = 16'h3f13;
              4'hf: out_r = 16'h3f12;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f0a;
            case (mant_lo)
              4'h0: out_r = 16'h3f12;
              4'h1: out_r = 16'h3f11;
              4'h2: out_r = 16'h3f11;
              4'h3: out_r = 16'h3f10;
              4'h4: out_r = 16'h3f10;
              4'h5: out_r = 16'h3f0f;
              4'h6: out_r = 16'h3f0e;
              4'h7: out_r = 16'h3f0e;
              4'h8: out_r = 16'h3f0d;
              4'h9: out_r = 16'h3f0d;
              4'ha: out_r = 16'h3f0c;
              4'hb: out_r = 16'h3f0c;
              4'hc: out_r = 16'h3f0b;
              4'hd: out_r = 16'h3f0b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f02;
            case (mant_lo)
              4'h0: out_r = 16'h3f09;
              4'h1: out_r = 16'h3f08;
              4'h2: out_r = 16'h3f08;
              4'h3: out_r = 16'h3f07;
              4'h4: out_r = 16'h3f07;
              4'h5: out_r = 16'h3f06;
              4'h6: out_r = 16'h3f06;
              4'h7: out_r = 16'h3f05;
              4'h8: out_r = 16'h3f05;
              4'h9: out_r = 16'h3f04;
              4'ha: out_r = 16'h3f04;
              4'hb: out_r = 16'h3f03;
              4'hc: out_r = 16'h3f03;
              4'hf: out_r = 16'h3f01;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3efb;
            case (mant_lo)
              4'h0: out_r = 16'h3f01;
              4'h1: out_r = 16'h3f00;
              4'h2: out_r = 16'h3eff;
              4'h3: out_r = 16'h3efe;
              4'h4: out_r = 16'h3efd;
              4'h5: out_r = 16'h3efc;
              4'h8: out_r = 16'h3efa;
              4'h9: out_r = 16'h3ef9;
              4'ha: out_r = 16'h3ef8;
              4'hb: out_r = 16'h3ef7;
              4'hc: out_r = 16'h3ef6;
              4'hd: out_r = 16'h3ef5;
              4'he: out_r = 16'h3ef4;
              4'hf: out_r = 16'h3ef3;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ee9;
            case (mant_lo)
              4'h0: out_r = 16'h3ef2;
              4'h1: out_r = 16'h3ef1;
              4'h2: out_r = 16'h3ef0;
              4'h3: out_r = 16'h3eef;
              4'h4: out_r = 16'h3eee;
              4'h5: out_r = 16'h3eed;
              4'h6: out_r = 16'h3eec;
              4'h7: out_r = 16'h3eeb;
              4'h8: out_r = 16'h3eea;
              4'hb: out_r = 16'h3ee8;
              4'hc: out_r = 16'h3ee7;
              4'hd: out_r = 16'h3ee6;
              4'he: out_r = 16'h3ee5;
              4'hf: out_r = 16'h3ee4;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3eda;
            case (mant_lo)
              4'h0: out_r = 16'h3ee3;
              4'h1: out_r = 16'h3ee2;
              4'h2: out_r = 16'h3ee1;
              4'h3: out_r = 16'h3ee1;
              4'h4: out_r = 16'h3ee0;
              4'h5: out_r = 16'h3edf;
              4'h6: out_r = 16'h3ede;
              4'h7: out_r = 16'h3edd;
              4'h8: out_r = 16'h3edc;
              4'h9: out_r = 16'h3edb;
              4'hc: out_r = 16'h3ed9;
              4'hd: out_r = 16'h3ed8;
              4'he: out_r = 16'h3ed7;
              4'hf: out_r = 16'h3ed6;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ecc;
            case (mant_lo)
              4'h0: out_r = 16'h3ed5;
              4'h1: out_r = 16'h3ed5;
              4'h2: out_r = 16'h3ed4;
              4'h3: out_r = 16'h3ed3;
              4'h4: out_r = 16'h3ed2;
              4'h5: out_r = 16'h3ed1;
              4'h6: out_r = 16'h3ed0;
              4'h7: out_r = 16'h3ed0;
              4'h8: out_r = 16'h3ecf;
              4'h9: out_r = 16'h3ece;
              4'ha: out_r = 16'h3ecd;
              4'hd: out_r = 16'h3ecb;
              4'he: out_r = 16'h3eca;
              4'hf: out_r = 16'h3ec9;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3ebf;
            case (mant_lo)
              4'h0: out_r = 16'h3ec9;
              4'h1: out_r = 16'h3ec8;
              4'h2: out_r = 16'h3ec7;
              4'h3: out_r = 16'h3ec6;
              4'h4: out_r = 16'h3ec5;
              4'h5: out_r = 16'h3ec5;
              4'h6: out_r = 16'h3ec4;
              4'h7: out_r = 16'h3ec3;
              4'h8: out_r = 16'h3ec2;
              4'h9: out_r = 16'h3ec2;
              4'ha: out_r = 16'h3ec1;
              4'hb: out_r = 16'h3ec0;
              4'he: out_r = 16'h3ebe;
              4'hf: out_r = 16'h3ebd;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3ea8;
            case (mant_lo)
              4'h0: out_r = 16'h3ebc;
              4'h1: out_r = 16'h3ebb;
              4'h2: out_r = 16'h3eb9;
              4'h3: out_r = 16'h3eb8;
              4'h4: out_r = 16'h3eb7;
              4'h5: out_r = 16'h3eb5;
              4'h6: out_r = 16'h3eb4;
              4'h7: out_r = 16'h3eb2;
              4'h8: out_r = 16'h3eb1;
              4'h9: out_r = 16'h3eb0;
              4'ha: out_r = 16'h3eae;
              4'hb: out_r = 16'h3ead;
              4'hc: out_r = 16'h3eab;
              4'hd: out_r = 16'h3eaa;
              4'he: out_r = 16'h3ea9;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3e94;
            case (mant_lo)
              4'h0: out_r = 16'h3ea6;
              4'h1: out_r = 16'h3ea5;
              4'h2: out_r = 16'h3ea4;
              4'h3: out_r = 16'h3ea2;
              4'h4: out_r = 16'h3ea1;
              4'h5: out_r = 16'h3ea0;
              4'h6: out_r = 16'h3e9f;
              4'h7: out_r = 16'h3e9d;
              4'h8: out_r = 16'h3e9c;
              4'h9: out_r = 16'h3e9b;
              4'ha: out_r = 16'h3e9a;
              4'hb: out_r = 16'h3e99;
              4'hc: out_r = 16'h3e97;
              4'hd: out_r = 16'h3e96;
              4'he: out_r = 16'h3e95;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3e82;
            case (mant_lo)
              4'h0: out_r = 16'h3e93;
              4'h1: out_r = 16'h3e92;
              4'h2: out_r = 16'h3e90;
              4'h3: out_r = 16'h3e8f;
              4'h4: out_r = 16'h3e8e;
              4'h5: out_r = 16'h3e8d;
              4'h6: out_r = 16'h3e8c;
              4'h7: out_r = 16'h3e8b;
              4'h8: out_r = 16'h3e8a;
              4'h9: out_r = 16'h3e89;
              4'ha: out_r = 16'h3e88;
              4'hb: out_r = 16'h3e87;
              4'hc: out_r = 16'h3e86;
              4'hd: out_r = 16'h3e85;
              4'he: out_r = 16'h3e83;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3e66;
            case (mant_lo)
              4'h0: out_r = 16'h3e81;
              4'h1: out_r = 16'h3e80;
              4'h2: out_r = 16'h3e7f;
              4'h3: out_r = 16'h3e7d;
              4'h4: out_r = 16'h3e7b;
              4'h5: out_r = 16'h3e79;
              4'h6: out_r = 16'h3e77;
              4'h7: out_r = 16'h3e75;
              4'h8: out_r = 16'h3e73;
              4'h9: out_r = 16'h3e71;
              4'ha: out_r = 16'h3e6f;
              4'hb: out_r = 16'h3e6e;
              4'hc: out_r = 16'h3e6c;
              4'hd: out_r = 16'h3e6a;
              4'he: out_r = 16'h3e68;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3e4b;
            case (mant_lo)
              4'h0: out_r = 16'h3e64;
              4'h1: out_r = 16'h3e63;
              4'h2: out_r = 16'h3e61;
              4'h3: out_r = 16'h3e5f;
              4'h4: out_r = 16'h3e5d;
              4'h5: out_r = 16'h3e5c;
              4'h6: out_r = 16'h3e5a;
              4'h7: out_r = 16'h3e58;
              4'h8: out_r = 16'h3e57;
              4'h9: out_r = 16'h3e55;
              4'ha: out_r = 16'h3e53;
              4'hb: out_r = 16'h3e52;
              4'hc: out_r = 16'h3e50;
              4'hd: out_r = 16'h3e4e;
              4'he: out_r = 16'h3e4d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3e33;
            case (mant_lo)
              4'h0: out_r = 16'h3e4a;
              4'h1: out_r = 16'h3e48;
              4'h2: out_r = 16'h3e47;
              4'h3: out_r = 16'h3e45;
              4'h4: out_r = 16'h3e43;
              4'h5: out_r = 16'h3e42;
              4'h6: out_r = 16'h3e40;
              4'h7: out_r = 16'h3e3f;
              4'h8: out_r = 16'h3e3d;
              4'h9: out_r = 16'h3e3c;
              4'ha: out_r = 16'h3e3a;
              4'hb: out_r = 16'h3e39;
              4'hc: out_r = 16'h3e38;
              4'hd: out_r = 16'h3e36;
              4'he: out_r = 16'h3e35;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3e1e;
            case (mant_lo)
              4'h0: out_r = 16'h3e32;
              4'h1: out_r = 16'h3e31;
              4'h2: out_r = 16'h3e2f;
              4'h3: out_r = 16'h3e2e;
              4'h4: out_r = 16'h3e2c;
              4'h5: out_r = 16'h3e2b;
              4'h6: out_r = 16'h3e2a;
              4'h7: out_r = 16'h3e28;
              4'h8: out_r = 16'h3e27;
              4'h9: out_r = 16'h3e26;
              4'ha: out_r = 16'h3e25;
              4'hb: out_r = 16'h3e23;
              4'hc: out_r = 16'h3e22;
              4'hd: out_r = 16'h3e21;
              4'he: out_r = 16'h3e20;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3e0c;
            case (mant_lo)
              4'h0: out_r = 16'h3e1d;
              4'h1: out_r = 16'h3e1c;
              4'h2: out_r = 16'h3e1b;
              4'h3: out_r = 16'h3e19;
              4'h4: out_r = 16'h3e18;
              4'h5: out_r = 16'h3e17;
              4'h6: out_r = 16'h3e16;
              4'h7: out_r = 16'h3e15;
              4'h8: out_r = 16'h3e14;
              4'h9: out_r = 16'h3e12;
              4'ha: out_r = 16'h3e11;
              4'hb: out_r = 16'h3e10;
              4'hc: out_r = 16'h3e0f;
              4'hd: out_r = 16'h3e0e;
              4'he: out_r = 16'h3e0d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3ddb;
            case (mant_lo)
              4'h0: out_r = 16'h3e0b;
              4'h1: out_r = 16'h3e08;
              4'h2: out_r = 16'h3e06;
              4'h3: out_r = 16'h3e04;
              4'h4: out_r = 16'h3e02;
              4'h5: out_r = 16'h3e00;
              4'h6: out_r = 16'h3dfc;
              4'h7: out_r = 16'h3df8;
              4'h8: out_r = 16'h3df5;
              4'h9: out_r = 16'h3df1;
              4'ha: out_r = 16'h3ded;
              4'hb: out_r = 16'h3de9;
              4'hc: out_r = 16'h3de6;
              4'hd: out_r = 16'h3de2;
              4'he: out_r = 16'h3ddf;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3dab;
            case (mant_lo)
              4'h0: out_r = 16'h3dd8;
              4'h1: out_r = 16'h3dd5;
              4'h2: out_r = 16'h3dd1;
              4'h3: out_r = 16'h3dce;
              4'h4: out_r = 16'h3dcb;
              4'h5: out_r = 16'h3dc8;
              4'h6: out_r = 16'h3dc5;
              4'h7: out_r = 16'h3dc1;
              4'h8: out_r = 16'h3dbe;
              4'h9: out_r = 16'h3dbc;
              4'ha: out_r = 16'h3db9;
              4'hb: out_r = 16'h3db6;
              4'hc: out_r = 16'h3db3;
              4'hd: out_r = 16'h3db0;
              4'he: out_r = 16'h3dad;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3d85;
            case (mant_lo)
              4'h0: out_r = 16'h3da8;
              4'h1: out_r = 16'h3da6;
              4'h2: out_r = 16'h3da3;
              4'h3: out_r = 16'h3da0;
              4'h4: out_r = 16'h3d9e;
              4'h5: out_r = 16'h3d9b;
              4'h6: out_r = 16'h3d99;
              4'h7: out_r = 16'h3d97;
              4'h8: out_r = 16'h3d94;
              4'h9: out_r = 16'h3d92;
              4'ha: out_r = 16'h3d90;
              4'hb: out_r = 16'h3d8e;
              4'hc: out_r = 16'h3d8b;
              4'hd: out_r = 16'h3d89;
              4'he: out_r = 16'h3d87;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3d4f;
            case (mant_lo)
              4'h0: out_r = 16'h3d83;
              4'h1: out_r = 16'h3d81;
              4'h2: out_r = 16'h3d7e;
              4'h3: out_r = 16'h3d7a;
              4'h4: out_r = 16'h3d76;
              4'h5: out_r = 16'h3d72;
              4'h6: out_r = 16'h3d6e;
              4'h7: out_r = 16'h3d6b;
              4'h8: out_r = 16'h3d67;
              4'h9: out_r = 16'h3d63;
              4'ha: out_r = 16'h3d60;
              4'hb: out_r = 16'h3d5c;
              4'hc: out_r = 16'h3d59;
              4'hd: out_r = 16'h3d56;
              4'he: out_r = 16'h3d52;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3d21;
            case (mant_lo)
              4'h0: out_r = 16'h3d4c;
              4'h1: out_r = 16'h3d49;
              4'h2: out_r = 16'h3d46;
              4'h3: out_r = 16'h3d43;
              4'h4: out_r = 16'h3d40;
              4'h5: out_r = 16'h3d3d;
              4'h6: out_r = 16'h3d3a;
              4'h7: out_r = 16'h3d37;
              4'h8: out_r = 16'h3d34;
              4'h9: out_r = 16'h3d31;
              4'ha: out_r = 16'h3d2e;
              4'hb: out_r = 16'h3d2c;
              4'hc: out_r = 16'h3d29;
              4'hd: out_r = 16'h3d26;
              4'he: out_r = 16'h3d24;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3cfb;
            case (mant_lo)
              4'h0: out_r = 16'h3d1f;
              4'h1: out_r = 16'h3d1c;
              4'h2: out_r = 16'h3d1a;
              4'h3: out_r = 16'h3d18;
              4'h4: out_r = 16'h3d15;
              4'h5: out_r = 16'h3d13;
              4'h6: out_r = 16'h3d11;
              4'h7: out_r = 16'h3d0e;
              4'h8: out_r = 16'h3d0c;
              4'h9: out_r = 16'h3d0a;
              4'ha: out_r = 16'h3d08;
              4'hb: out_r = 16'h3d06;
              4'hc: out_r = 16'h3d04;
              4'hd: out_r = 16'h3d02;
              4'he: out_r = 16'h3cff;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3cc4;
            case (mant_lo)
              4'h0: out_r = 16'h3cf7;
              4'h1: out_r = 16'h3cf4;
              4'h2: out_r = 16'h3cf0;
              4'h3: out_r = 16'h3cec;
              4'h4: out_r = 16'h3ce8;
              4'h5: out_r = 16'h3ce5;
              4'h6: out_r = 16'h3ce1;
              4'h7: out_r = 16'h3cde;
              4'h8: out_r = 16'h3cda;
              4'h9: out_r = 16'h3cd7;
              4'ha: out_r = 16'h3cd4;
              4'hb: out_r = 16'h3cd0;
              4'hc: out_r = 16'h3ccd;
              4'hd: out_r = 16'h3cca;
              4'he: out_r = 16'h3cc7;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3c98;
            case (mant_lo)
              4'h0: out_r = 16'h3cc1;
              4'h1: out_r = 16'h3cbe;
              4'h2: out_r = 16'h3cbb;
              4'h3: out_r = 16'h3cb8;
              4'h4: out_r = 16'h3cb5;
              4'h5: out_r = 16'h3cb2;
              4'h6: out_r = 16'h3caf;
              4'h7: out_r = 16'h3cad;
              4'h8: out_r = 16'h3caa;
              4'h9: out_r = 16'h3ca7;
              4'ha: out_r = 16'h3ca5;
              4'hb: out_r = 16'h3ca2;
              4'hc: out_r = 16'h3ca0;
              4'hd: out_r = 16'h3c9d;
              4'he: out_r = 16'h3c9b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3c3c;
            case (mant_lo)
              4'h0: out_r = 16'h3c96;
              4'h1: out_r = 16'h3c91;
              4'h2: out_r = 16'h3c8d;
              4'h3: out_r = 16'h3c89;
              4'h4: out_r = 16'h3c84;
              4'h5: out_r = 16'h3c80;
              4'h6: out_r = 16'h3c79;
              4'h7: out_r = 16'h3c71;
              4'h8: out_r = 16'h3c6a;
              4'h9: out_r = 16'h3c63;
              4'ha: out_r = 16'h3c5c;
              4'hb: out_r = 16'h3c55;
              4'hc: out_r = 16'h3c4e;
              4'hd: out_r = 16'h3c48;
              4'he: out_r = 16'h3c42;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3be4;
            case (mant_lo)
              4'h0: out_r = 16'h3c36;
              4'h1: out_r = 16'h3c30;
              4'h2: out_r = 16'h3c2b;
              4'h3: out_r = 16'h3c26;
              4'h4: out_r = 16'h3c21;
              4'h5: out_r = 16'h3c1c;
              4'h6: out_r = 16'h3c17;
              4'h7: out_r = 16'h3c12;
              4'h8: out_r = 16'h3c0e;
              4'h9: out_r = 16'h3c09;
              4'ha: out_r = 16'h3c05;
              4'hb: out_r = 16'h3c01;
              4'hc: out_r = 16'h3bfa;
              4'hd: out_r = 16'h3bf2;
              4'he: out_r = 16'h3beb;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3b8a;
            case (mant_lo)
              4'h0: out_r = 16'h3bdd;
              4'h1: out_r = 16'h3bd6;
              4'h2: out_r = 16'h3bcf;
              4'h3: out_r = 16'h3bc9;
              4'h4: out_r = 16'h3bc3;
              4'h5: out_r = 16'h3bbd;
              4'h6: out_r = 16'h3bb7;
              4'h7: out_r = 16'h3bb1;
              4'h8: out_r = 16'h3bac;
              4'h9: out_r = 16'h3ba7;
              4'ha: out_r = 16'h3ba2;
              4'hb: out_r = 16'h3b9d;
              4'hc: out_r = 16'h3b98;
              4'hd: out_r = 16'h3b93;
              4'he: out_r = 16'h3b8f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3b28;
            case (mant_lo)
              4'h0: out_r = 16'h3b86;
              4'h1: out_r = 16'h3b82;
              4'h2: out_r = 16'h3b7c;
              4'h3: out_r = 16'h3b74;
              4'h4: out_r = 16'h3b6c;
              4'h5: out_r = 16'h3b65;
              4'h6: out_r = 16'h3b5e;
              4'h7: out_r = 16'h3b57;
              4'h8: out_r = 16'h3b51;
              4'h9: out_r = 16'h3b4a;
              4'ha: out_r = 16'h3b44;
              4'hb: out_r = 16'h3b3e;
              4'hc: out_r = 16'h3b38;
              4'hd: out_r = 16'h3b32;
              4'he: out_r = 16'h3b2d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3acb;
            case (mant_lo)
              4'h0: out_r = 16'h3b22;
              4'h1: out_r = 16'h3b1d;
              4'h2: out_r = 16'h3b19;
              4'h3: out_r = 16'h3b14;
              4'h4: out_r = 16'h3b0f;
              4'h5: out_r = 16'h3b0b;
              4'h6: out_r = 16'h3b07;
              4'h7: out_r = 16'h3b03;
              4'h8: out_r = 16'h3afd;
              4'h9: out_r = 16'h3af5;
              4'ha: out_r = 16'h3aee;
              4'hb: out_r = 16'h3ae6;
              4'hc: out_r = 16'h3adf;
              4'hd: out_r = 16'h3ad8;
              4'he: out_r = 16'h3ad2;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3a77;
            case (mant_lo)
              4'h0: out_r = 16'h3ac5;
              4'h1: out_r = 16'h3abf;
              4'h2: out_r = 16'h3ab9;
              4'h3: out_r = 16'h3ab3;
              4'h4: out_r = 16'h3aae;
              4'h5: out_r = 16'h3aa9;
              4'h6: out_r = 16'h3aa3;
              4'h7: out_r = 16'h3a9e;
              4'h8: out_r = 16'h3a99;
              4'h9: out_r = 16'h3a95;
              4'ha: out_r = 16'h3a90;
              4'hb: out_r = 16'h3a8c;
              4'hc: out_r = 16'h3a87;
              4'hd: out_r = 16'h3a83;
              4'he: out_r = 16'h3a7e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3a16;
            case (mant_lo)
              4'h0: out_r = 16'h3a6f;
              4'h1: out_r = 16'h3a68;
              4'h2: out_r = 16'h3a61;
              4'h3: out_r = 16'h3a5a;
              4'h4: out_r = 16'h3a53;
              4'h5: out_r = 16'h3a4c;
              4'h6: out_r = 16'h3a46;
              4'h7: out_r = 16'h3a40;
              4'h8: out_r = 16'h3a3a;
              4'h9: out_r = 16'h3a34;
              4'ha: out_r = 16'h3a2f;
              4'hb: out_r = 16'h3a2a;
              4'hc: out_r = 16'h3a24;
              4'hd: out_r = 16'h3a1f;
              4'he: out_r = 16'h3a1a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h39b5;
            case (mant_lo)
              4'h0: out_r = 16'h3a11;
              4'h1: out_r = 16'h3a0d;
              4'h2: out_r = 16'h3a08;
              4'h3: out_r = 16'h3a04;
              4'h4: out_r = 16'h3a00;
              4'h5: out_r = 16'h39f8;
              4'h6: out_r = 16'h39f0;
              4'h7: out_r = 16'h39e9;
              4'h8: out_r = 16'h39e2;
              4'h9: out_r = 16'h39db;
              4'ha: out_r = 16'h39d4;
              4'hb: out_r = 16'h39ce;
              4'hc: out_r = 16'h39c7;
              4'hd: out_r = 16'h39c1;
              4'he: out_r = 16'h39bb;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h390a;
            case (mant_lo)
              4'h0: out_r = 16'h39b0;
              4'h1: out_r = 16'h39a5;
              4'h2: out_r = 16'h399b;
              4'h3: out_r = 16'h3992;
              4'h4: out_r = 16'h3989;
              4'h5: out_r = 16'h3981;
              4'h6: out_r = 16'h3972;
              4'h7: out_r = 16'h3963;
              4'h8: out_r = 16'h3955;
              4'h9: out_r = 16'h3948;
              4'ha: out_r = 16'h393c;
              4'hb: out_r = 16'h3931;
              4'hc: out_r = 16'h3926;
              4'hd: out_r = 16'h391c;
              4'he: out_r = 16'h3913;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h384b;
            case (mant_lo)
              4'h0: out_r = 16'h3901;
              4'h1: out_r = 16'h38f3;
              4'h2: out_r = 16'h38e4;
              4'h3: out_r = 16'h38d7;
              4'h4: out_r = 16'h38ca;
              4'h5: out_r = 16'h38bd;
              4'h6: out_r = 16'h38b2;
              4'h7: out_r = 16'h38a7;
              4'h8: out_r = 16'h389d;
              4'h9: out_r = 16'h3893;
              4'ha: out_r = 16'h388b;
              4'hb: out_r = 16'h3882;
              4'hc: out_r = 16'h3875;
              4'hd: out_r = 16'h3866;
              4'he: out_r = 16'h3858;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3795;
            case (mant_lo)
              4'h0: out_r = 16'h383e;
              4'h1: out_r = 16'h3833;
              4'h2: out_r = 16'h3828;
              4'h3: out_r = 16'h381e;
              4'h4: out_r = 16'h3814;
              4'h5: out_r = 16'h380b;
              4'h6: out_r = 16'h3803;
              4'h7: out_r = 16'h37f6;
              4'h8: out_r = 16'h37e7;
              4'h9: out_r = 16'h37d9;
              4'ha: out_r = 16'h37cc;
              4'hb: out_r = 16'h37bf;
              4'hc: out_r = 16'h37b4;
              4'hd: out_r = 16'h37a9;
              4'he: out_r = 16'h379f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h36db;
            case (mant_lo)
              4'h0: out_r = 16'h378c;
              4'h1: out_r = 16'h3784;
              4'h2: out_r = 16'h3777;
              4'h3: out_r = 16'h3768;
              4'h4: out_r = 16'h375a;
              4'h5: out_r = 16'h374d;
              4'h6: out_r = 16'h3741;
              4'h7: out_r = 16'h3735;
              4'h8: out_r = 16'h372a;
              4'h9: out_r = 16'h3720;
              4'ha: out_r = 16'h3716;
              4'hb: out_r = 16'h370d;
              4'hc: out_r = 16'h3704;
              4'hd: out_r = 16'h36f9;
              4'he: out_r = 16'h36ea;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3621;
            case (mant_lo)
              4'h0: out_r = 16'h36ce;
              4'h1: out_r = 16'h36c2;
              4'h2: out_r = 16'h36b6;
              4'h3: out_r = 16'h36ab;
              4'h4: out_r = 16'h36a1;
              4'h5: out_r = 16'h3697;
              4'h6: out_r = 16'h368e;
              4'h7: out_r = 16'h3685;
              4'h8: out_r = 16'h367a;
              4'h9: out_r = 16'h366b;
              4'ha: out_r = 16'h365d;
              4'hb: out_r = 16'h364f;
              4'hc: out_r = 16'h3643;
              4'hd: out_r = 16'h3637;
              4'he: out_r = 16'h362c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h356e;
            case (mant_lo)
              4'h0: out_r = 16'h3618;
              4'h1: out_r = 16'h360e;
              4'h2: out_r = 16'h3606;
              4'h3: out_r = 16'h35fc;
              4'h4: out_r = 16'h35ec;
              4'h5: out_r = 16'h35de;
              4'h6: out_r = 16'h35d1;
              4'h7: out_r = 16'h35c4;
              4'h8: out_r = 16'h35b8;
              4'h9: out_r = 16'h35ad;
              4'ha: out_r = 16'h35a2;
              4'hb: out_r = 16'h3599;
              4'hc: out_r = 16'h358f;
              4'hd: out_r = 16'h3587;
              4'he: out_r = 16'h357d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h34af;
            case (mant_lo)
              4'h0: out_r = 16'h355f;
              4'h1: out_r = 16'h3552;
              4'h2: out_r = 16'h3545;
              4'h3: out_r = 16'h3539;
              4'h4: out_r = 16'h352e;
              4'h5: out_r = 16'h3523;
              4'h6: out_r = 16'h3519;
              4'h7: out_r = 16'h3510;
              4'h8: out_r = 16'h3507;
              4'h9: out_r = 16'h34fe;
              4'ha: out_r = 16'h34ef;
              4'hb: out_r = 16'h34e0;
              4'hc: out_r = 16'h34d3;
              4'hd: out_r = 16'h34c6;
              4'he: out_r = 16'h34ba;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3401;
            case (mant_lo)
              4'h0: out_r = 16'h34a4;
              4'h1: out_r = 16'h349a;
              4'h2: out_r = 16'h3491;
              4'h3: out_r = 16'h3488;
              4'h4: out_r = 16'h3480;
              4'h5: out_r = 16'h3470;
              4'h6: out_r = 16'h3462;
              4'h7: out_r = 16'h3454;
              4'h8: out_r = 16'h3447;
              4'h9: out_r = 16'h343b;
              4'ha: out_r = 16'h3430;
              4'hb: out_r = 16'h3425;
              4'hc: out_r = 16'h341b;
              4'hd: out_r = 16'h3412;
              4'he: out_r = 16'h3409;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h3294;
            case (mant_lo)
              4'h0: out_r = 16'h33f2;
              4'h1: out_r = 16'h33d5;
              4'h2: out_r = 16'h33bc;
              4'h3: out_r = 16'h33a6;
              4'h4: out_r = 16'h3393;
              4'h5: out_r = 16'h3381;
              4'h6: out_r = 16'h3364;
              4'h7: out_r = 16'h3349;
              4'h8: out_r = 16'h3332;
              4'h9: out_r = 16'h331d;
              4'ha: out_r = 16'h330a;
              4'hb: out_r = 16'h32f4;
              4'hc: out_r = 16'h32d8;
              4'hd: out_r = 16'h32be;
              4'he: out_r = 16'h32a8;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3121;
            case (mant_lo)
              4'h0: out_r = 16'h3283;
              4'h1: out_r = 16'h3267;
              4'h2: out_r = 16'h324c;
              4'h3: out_r = 16'h3234;
              4'h4: out_r = 16'h321f;
              4'h5: out_r = 16'h320c;
              4'h6: out_r = 16'h31f7;
              4'h7: out_r = 16'h31da;
              4'h8: out_r = 16'h31c1;
              4'h9: out_r = 16'h31aa;
              4'ha: out_r = 16'h3196;
              4'hb: out_r = 16'h3184;
              4'hc: out_r = 16'h316a;
              4'hd: out_r = 16'h314e;
              4'he: out_r = 16'h3136;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h2fae;
            case (mant_lo)
              4'h0: out_r = 16'h310e;
              4'h1: out_r = 16'h30fa;
              4'h2: out_r = 16'h30dd;
              4'h3: out_r = 16'h30c3;
              4'h4: out_r = 16'h30ac;
              4'h5: out_r = 16'h3098;
              4'h6: out_r = 16'h3086;
              4'h7: out_r = 16'h306c;
              4'h8: out_r = 16'h3050;
              4'h9: out_r = 16'h3038;
              4'ha: out_r = 16'h3022;
              4'hb: out_r = 16'h300f;
              4'hc: out_r = 16'h2ffd;
              4'hd: out_r = 16'h2fdf;
              4'he: out_r = 16'h2fc5;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h2e3c;
            case (mant_lo)
              4'h0: out_r = 16'h2f99;
              4'h1: out_r = 16'h2f87;
              4'h2: out_r = 16'h2f6f;
              4'h3: out_r = 16'h2f53;
              4'h4: out_r = 16'h2f3a;
              4'h5: out_r = 16'h2f24;
              4'h6: out_r = 16'h2f11;
              4'h7: out_r = 16'h2f00;
              4'h8: out_r = 16'h2ee2;
              4'h9: out_r = 16'h2ec7;
              4'ha: out_r = 16'h2eb0;
              4'hb: out_r = 16'h2e9b;
              4'hc: out_r = 16'h2e89;
              4'hd: out_r = 16'h2e72;
              4'he: out_r = 16'h2e55;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h2ccc;
            case (mant_lo)
              4'h0: out_r = 16'h2e26;
              4'h1: out_r = 16'h2e13;
              4'h2: out_r = 16'h2e01;
              4'h3: out_r = 16'h2de4;
              4'h4: out_r = 16'h2dc9;
              4'h5: out_r = 16'h2db2;
              4'h6: out_r = 16'h2d9d;
              4'h7: out_r = 16'h2d8a;
              4'h8: out_r = 16'h2d74;
              4'h9: out_r = 16'h2d58;
              4'ha: out_r = 16'h2d3e;
              4'hb: out_r = 16'h2d28;
              4'hc: out_r = 16'h2d14;
              4'hd: out_r = 16'h2d03;
              4'he: out_r = 16'h2ce7;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h2b5d;
            case (mant_lo)
              4'h0: out_r = 16'h2cb4;
              4'h1: out_r = 16'h2c9f;
              4'h2: out_r = 16'h2c8c;
              4'h3: out_r = 16'h2c77;
              4'h4: out_r = 16'h2c5a;
              4'h5: out_r = 16'h2c40;
              4'h6: out_r = 16'h2c2a;
              4'h7: out_r = 16'h2c16;
              4'h8: out_r = 16'h2c04;
              4'h9: out_r = 16'h2be9;
              4'ha: out_r = 16'h2bce;
              4'hb: out_r = 16'h2bb6;
              4'hc: out_r = 16'h2ba0;
              4'hd: out_r = 16'h2b8e;
              4'he: out_r = 16'h2b7a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h29ef;
            case (mant_lo)
              4'h0: out_r = 16'h2b43;
              4'h1: out_r = 16'h2b2c;
              4'h2: out_r = 16'h2b18;
              4'h3: out_r = 16'h2b06;
              4'h4: out_r = 16'h2aec;
              4'h5: out_r = 16'h2ad0;
              4'h6: out_r = 16'h2ab8;
              4'h7: out_r = 16'h2aa2;
              4'h8: out_r = 16'h2a8f;
              4'h9: out_r = 16'h2a7d;
              4'ha: out_r = 16'h2a5f;
              4'hb: out_r = 16'h2a45;
              4'hc: out_r = 16'h2a2e;
              4'hd: out_r = 16'h2a19;
              4'he: out_r = 16'h2a07;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h2881;
            case (mant_lo)
              4'h0: out_r = 16'h29d3;
              4'h1: out_r = 16'h29ba;
              4'h2: out_r = 16'h29a4;
              4'h3: out_r = 16'h2991;
              4'h4: out_r = 16'h2980;
              4'h5: out_r = 16'h2962;
              4'h6: out_r = 16'h2947;
              4'h7: out_r = 16'h2930;
              4'h8: out_r = 16'h291b;
              4'h9: out_r = 16'h2909;
              4'ha: out_r = 16'h28f1;
              4'hb: out_r = 16'h28d5;
              4'hc: out_r = 16'h28bc;
              4'hd: out_r = 16'h28a6;
              4'he: out_r = 16'h2892;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h25ac;
            case (mant_lo)
              4'h0: out_r = 16'h2864;
              4'h1: out_r = 16'h2832;
              4'h2: out_r = 16'h280a;
              4'h3: out_r = 16'h27d8;
              4'h4: out_r = 16'h27a8;
              4'h5: out_r = 16'h2783;
              4'h6: out_r = 16'h274c;
              4'h7: out_r = 16'h271f;
              4'h8: out_r = 16'h26f7;
              4'h9: out_r = 16'h26c0;
              4'ha: out_r = 16'h2696;
              4'hb: out_r = 16'h2669;
              4'hc: out_r = 16'h2636;
              4'hd: out_r = 16'h260e;
              4'he: out_r = 16'h25dc;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h22c9;
            case (mant_lo)
              4'h0: out_r = 16'h2586;
              4'h1: out_r = 16'h2550;
              4'h2: out_r = 16'h2522;
              4'h3: out_r = 16'h24fd;
              4'h4: out_r = 16'h24c5;
              4'h5: out_r = 16'h2499;
              4'h6: out_r = 16'h246f;
              4'h7: out_r = 16'h243a;
              4'h8: out_r = 16'h2411;
              4'h9: out_r = 16'h23e1;
              4'ha: out_r = 16'h23b0;
              4'hb: out_r = 16'h2389;
              4'hc: out_r = 16'h2355;
              4'hd: out_r = 16'h2326;
              4'he: out_r = 16'h2301;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h1fec;
            case (mant_lo)
              4'h0: out_r = 16'h229d;
              4'h1: out_r = 16'h2274;
              4'h2: out_r = 16'h223e;
              4'h3: out_r = 16'h2214;
              4'h4: out_r = 16'h21e7;
              4'h5: out_r = 16'h21b4;
              4'h6: out_r = 16'h218c;
              4'h7: out_r = 16'h215a;
              4'h8: out_r = 16'h212a;
              4'h9: out_r = 16'h2104;
              4'ha: out_r = 16'h20ce;
              4'hb: out_r = 16'h20a0;
              4'hc: out_r = 16'h207a;
              4'hd: out_r = 16'h2042;
              4'he: out_r = 16'h2017;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h1d0a;
            case (mant_lo)
              4'h0: out_r = 16'h1fb8;
              4'h1: out_r = 16'h1f8f;
              4'h2: out_r = 16'h1f5f;
              4'h3: out_r = 16'h1f2e;
              4'h4: out_r = 16'h1f07;
              4'h5: out_r = 16'h1ed3;
              4'h6: out_r = 16'h1ea4;
              4'h7: out_r = 16'h1e7f;
              4'h8: out_r = 16'h1e47;
              4'h9: out_r = 16'h1e1b;
              4'ha: out_r = 16'h1df1;
              4'hb: out_r = 16'h1dbc;
              4'hc: out_r = 16'h1d92;
              4'hd: out_r = 16'h1d64;
              4'he: out_r = 16'h1d32;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h1a22;
            case (mant_lo)
              4'h0: out_r = 16'h1cd7;
              4'h1: out_r = 16'h1ca8;
              4'h2: out_r = 16'h1c83;
              4'h3: out_r = 16'h1c4b;
              4'h4: out_r = 16'h1c1e;
              4'h5: out_r = 16'h1bf7;
              4'h6: out_r = 16'h1bc0;
              4'h7: out_r = 16'h1b96;
              4'h8: out_r = 16'h1b69;
              4'h9: out_r = 16'h1b36;
              4'ha: out_r = 16'h1b0d;
              4'hb: out_r = 16'h1adc;
              4'hc: out_r = 16'h1aac;
              4'hd: out_r = 16'h1a86;
              4'he: out_r = 16'h1a50;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h173e;
            case (mant_lo)
              4'h0: out_r = 16'h19fc;
              4'h1: out_r = 16'h19c5;
              4'h2: out_r = 16'h1999;
              4'h3: out_r = 16'h196e;
              4'h4: out_r = 16'h193a;
              4'h5: out_r = 16'h1911;
              4'h6: out_r = 16'h18e1;
              4'h7: out_r = 16'h18af;
              4'h8: out_r = 16'h1889;
              4'h9: out_r = 16'h1855;
              4'ha: out_r = 16'h1826;
              4'hb: out_r = 16'h1801;
              4'hc: out_r = 16'h17c9;
              4'hd: out_r = 16'h179d;
              4'he: out_r = 16'h1774;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h145f;
            case (mant_lo)
              4'h0: out_r = 16'h1714;
              4'h1: out_r = 16'h16e6;
              4'h2: out_r = 16'h16b3;
              4'h3: out_r = 16'h168c;
              4'h4: out_r = 16'h165a;
              4'h5: out_r = 16'h162a;
              4'h6: out_r = 16'h1604;
              4'h7: out_r = 16'h15ce;
              4'h8: out_r = 16'h15a0;
              4'h9: out_r = 16'h157a;
              4'ha: out_r = 16'h1542;
              4'hb: out_r = 16'h1517;
              4'hc: out_r = 16'h14ec;
              4'hd: out_r = 16'h14b8;
              4'he: out_r = 16'h148f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h1183;
            case (mant_lo)
              4'h0: out_r = 16'h142d;
              4'h1: out_r = 16'h1407;
              4'h2: out_r = 16'h13d2;
              4'h3: out_r = 16'h13a4;
              4'h4: out_r = 16'h137f;
              4'h5: out_r = 16'h1347;
              4'h6: out_r = 16'h131b;
              4'h7: out_r = 16'h12f1;
              4'h8: out_r = 16'h12bc;
              4'h9: out_r = 16'h1292;
              4'ha: out_r = 16'h1264;
              4'hb: out_r = 16'h1231;
              4'hc: out_r = 16'h120a;
              4'hd: out_r = 16'h11d7;
              4'he: out_r = 16'h11a8;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h0be6;
            case (mant_lo)
              4'h0: out_r = 16'h114b;
              4'h1: out_r = 16'h10f7;
              4'h2: out_r = 16'h1096;
              4'h3: out_r = 16'h1035;
              4'h4: out_r = 16'h0fdc;
              4'h5: out_r = 16'h0f86;
              4'h6: out_r = 16'h0f22;
              4'h7: out_r = 16'h0ec4;
              4'h8: out_r = 16'h0e6e;
              4'h9: out_r = 16'h0e11;
              4'ha: out_r = 16'h0daf;
              4'hb: out_r = 16'h0d55;
              4'hc: out_r = 16'h0d01;
              4'hd: out_r = 16'h0c9c;
              4'he: out_r = 16'h0c3e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h061e;
            case (mant_lo)
              4'h0: out_r = 16'h0b8c;
              4'h1: out_r = 16'h0b29;
              4'h2: out_r = 16'h0ace;
              4'h3: out_r = 16'h0a79;
              4'h4: out_r = 16'h0a17;
              4'h5: out_r = 16'h09b7;
              4'h6: out_r = 16'h095f;
              4'h7: out_r = 16'h0907;
              4'h8: out_r = 16'h08a4;
              4'h9: out_r = 16'h0847;
              4'ha: out_r = 16'h07f1;
              4'hb: out_r = 16'h0792;
              4'hc: out_r = 16'h0731;
              4'hd: out_r = 16'h06d7;
              4'he: out_r = 16'h0682;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h0000;
            case (mant_lo)
              4'h0: out_r = 16'h05c0;
              4'h1: out_r = 16'h0569;
              4'h2: out_r = 16'h050d;
              4'h3: out_r = 16'h04ab;
              4'h4: out_r = 16'h0450;
              4'h5: out_r = 16'h03fc;
              4'h6: out_r = 16'h0399;
              4'h7: out_r = 16'h0339;
              4'h8: out_r = 16'h02e1;
              4'h9: out_r = 16'h0288;
              4'ha: out_r = 16'h0226;
              4'hb: out_r = 16'h01c9;
              4'hc: out_r = 16'h0174;
              4'hd: out_r = 16'h0114;
              4'he: out_r = 16'h00b3;
              default: begin end
            endcase
          end
          3'h3: out_r = 16'h0000;
          3'h4: out_r = 16'h0000;
          3'h5: out_r = 16'h0000;
          3'h6: out_r = 16'h0000;
          3'h7: out_r = 16'h0000;
          default: begin end
        endcase
      end
      9'h1ff: begin
        case (mant_hi)
          3'h0: begin
            out_r = 16'h7fc0;
            case (mant_lo)
              4'h0: out_r = 16'h0000;
              default: begin end
            endcase
          end
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
      default: begin end
    endcase
  end
  assign out = out_r;
endmodule
