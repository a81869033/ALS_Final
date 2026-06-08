module ex203_bf16_log_hilo3_word_mode_bits_14_bh3(in, out);
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
  reg [15:0] out_r;
  always @* begin
    out_r = 16'h7fc0;
    casez (sign_exp)
      9'b000000000: out_r = 16'hff80;
      9'b100000000: out_r = 16'hff80;
        9'h001: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2af;
              case (mant_lo4)
                4'hc: out_r = 16'hc2ae;
                4'hd: out_r = 16'hc2ae;
                4'he: out_r = 16'hc2ae;
                4'hf: out_r = 16'hc2ae;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc2ae;
            end
            3'h2: begin
              out_r = 16'hc2ae;
            end
            3'h3: begin
              out_r = 16'hc2ae;
            end
            3'h4: begin
              out_r = 16'hc2ae;
            end
            3'h5: begin
              out_r = 16'hc2ae;
            end
            3'h6: begin
              out_r = 16'hc2ad;
              case (mant_lo4)
                4'h0: out_r = 16'hc2ae;
                4'h1: out_r = 16'hc2ae;
                4'h2: out_r = 16'hc2ae;
                4'h3: out_r = 16'hc2ae;
                4'h4: out_r = 16'hc2ae;
                4'h5: out_r = 16'hc2ae;
                4'h6: out_r = 16'hc2ae;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc2ad;
            end
            default: begin end
          endcase
        end
        9'h002: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2ad;
            end
            3'h1: begin
              out_r = 16'hc2ad;
            end
            3'h2: begin
              out_r = 16'hc2ad;
            end
            3'h3: begin
              out_r = 16'hc2ad;
              case (mant_lo4)
                4'he: out_r = 16'hc2ac;
                4'hf: out_r = 16'hc2ac;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc2ac;
            end
            3'h5: begin
              out_r = 16'hc2ac;
            end
            3'h6: begin
              out_r = 16'hc2ac;
            end
            3'h7: begin
              out_r = 16'hc2ac;
            end
            default: begin end
          endcase
        end
        9'h003: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2ac;
            end
            3'h1: begin
              out_r = 16'hc2ac;
              case (mant_lo4)
                4'hd: out_r = 16'hc2ab;
                4'he: out_r = 16'hc2ab;
                4'hf: out_r = 16'hc2ab;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc2ab;
            end
            3'h3: begin
              out_r = 16'hc2ab;
            end
            3'h4: begin
              out_r = 16'hc2ab;
            end
            3'h5: begin
              out_r = 16'hc2ab;
            end
            3'h6: begin
              out_r = 16'hc2ab;
            end
            3'h7: begin
              out_r = 16'hc2ab;
            end
            default: begin end
          endcase
        end
        9'h004: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2aa;
              case (mant_lo4)
                4'h0: out_r = 16'hc2ab;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc2aa;
            end
            3'h2: begin
              out_r = 16'hc2aa;
            end
            3'h3: begin
              out_r = 16'hc2aa;
            end
            3'h4: begin
              out_r = 16'hc2aa;
            end
            3'h5: begin
              out_r = 16'hc2a9;
              case (mant_lo4)
                4'h0: out_r = 16'hc2aa;
                4'h1: out_r = 16'hc2aa;
                4'h2: out_r = 16'hc2aa;
                4'h3: out_r = 16'hc2aa;
                4'h4: out_r = 16'hc2aa;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc2a9;
            end
            3'h7: begin
              out_r = 16'hc2a9;
            end
            default: begin end
          endcase
        end
        9'h005: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a9;
            end
            3'h1: begin
              out_r = 16'hc2a9;
            end
            3'h2: begin
              out_r = 16'hc2a9;
            end
            3'h3: begin
              out_r = 16'hc2a8;
            end
            3'h4: begin
              out_r = 16'hc2a8;
            end
            3'h5: begin
              out_r = 16'hc2a8;
            end
            3'h6: begin
              out_r = 16'hc2a8;
            end
            3'h7: begin
              out_r = 16'hc2a8;
            end
            default: begin end
          endcase
        end
        9'h006: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a8;
            end
            3'h1: begin
              out_r = 16'hc2a7;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a8;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc2a7;
            end
            3'h3: begin
              out_r = 16'hc2a7;
            end
            3'h4: begin
              out_r = 16'hc2a7;
            end
            3'h5: begin
              out_r = 16'hc2a7;
            end
            3'h6: begin
              out_r = 16'hc2a7;
              case (mant_lo4)
                4'hf: out_r = 16'hc2a6;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc2a6;
            end
            default: begin end
          endcase
        end
        9'h007: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a6;
            end
            3'h1: begin
              out_r = 16'hc2a6;
            end
            3'h2: begin
              out_r = 16'hc2a6;
            end
            3'h3: begin
              out_r = 16'hc2a6;
            end
            3'h4: begin
              out_r = 16'hc2a5;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a6;
                4'h1: out_r = 16'hc2a6;
                4'h2: out_r = 16'hc2a6;
                4'h3: out_r = 16'hc2a6;
                4'h4: out_r = 16'hc2a6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc2a5;
            end
            3'h6: begin
              out_r = 16'hc2a5;
            end
            3'h7: begin
              out_r = 16'hc2a5;
            end
            default: begin end
          endcase
        end
        9'h008: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a5;
            end
            3'h1: begin
              out_r = 16'hc2a5;
            end
            3'h2: begin
              out_r = 16'hc2a4;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a5;
                4'h1: out_r = 16'hc2a5;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc2a4;
            end
            3'h4: begin
              out_r = 16'hc2a4;
            end
            3'h5: begin
              out_r = 16'hc2a4;
            end
            3'h6: begin
              out_r = 16'hc2a4;
            end
            3'h7: begin
              out_r = 16'hc2a4;
            end
            default: begin end
          endcase
        end
        9'h009: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a3;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a4;
                4'h1: out_r = 16'hc2a4;
                4'h2: out_r = 16'hc2a4;
                4'h3: out_r = 16'hc2a4;
                4'h4: out_r = 16'hc2a4;
                4'h5: out_r = 16'hc2a4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc2a3;
            end
            3'h2: begin
              out_r = 16'hc2a3;
            end
            3'h3: begin
              out_r = 16'hc2a3;
            end
            3'h4: begin
              out_r = 16'hc2a3;
            end
            3'h5: begin
              out_r = 16'hc2a3;
              case (mant_lo4)
                4'hc: out_r = 16'hc2a2;
                4'hd: out_r = 16'hc2a2;
                4'he: out_r = 16'hc2a2;
                4'hf: out_r = 16'hc2a2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc2a2;
            end
            3'h7: begin
              out_r = 16'hc2a2;
            end
            default: begin end
          endcase
        end
        9'h00a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a2;
            end
            3'h1: begin
              out_r = 16'hc2a2;
            end
            3'h2: begin
              out_r = 16'hc2a2;
            end
            3'h3: begin
              out_r = 16'hc2a1;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a2;
                4'h1: out_r = 16'hc2a2;
                4'h2: out_r = 16'hc2a2;
                4'h3: out_r = 16'hc2a2;
                4'h4: out_r = 16'hc2a2;
                4'h5: out_r = 16'hc2a2;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc2a1;
            end
            3'h5: begin
              out_r = 16'hc2a1;
            end
            3'h6: begin
              out_r = 16'hc2a1;
            end
            3'h7: begin
              out_r = 16'hc2a1;
            end
            default: begin end
          endcase
        end
        9'h00b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc2a1;
            end
            3'h1: begin
              out_r = 16'hc2a0;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a1;
                4'h1: out_r = 16'hc2a1;
                4'h2: out_r = 16'hc2a1;
                4'h3: out_r = 16'hc2a1;
                4'h4: out_r = 16'hc2a1;
                4'h5: out_r = 16'hc2a1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc2a0;
            end
            3'h3: begin
              out_r = 16'hc2a0;
            end
            3'h4: begin
              out_r = 16'hc2a0;
            end
            3'h5: begin
              out_r = 16'hc2a0;
            end
            3'h6: begin
              out_r = 16'hc2a0;
            end
            3'h7: begin
              out_r = 16'hc29f;
              case (mant_lo4)
                4'h0: out_r = 16'hc2a0;
                4'h1: out_r = 16'hc2a0;
                4'h2: out_r = 16'hc2a0;
                4'h3: out_r = 16'hc2a0;
                4'h4: out_r = 16'hc2a0;
                4'h5: out_r = 16'hc2a0;
                4'h6: out_r = 16'hc2a0;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h00c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc29f;
            end
            3'h1: begin
              out_r = 16'hc29f;
            end
            3'h2: begin
              out_r = 16'hc29f;
            end
            3'h3: begin
              out_r = 16'hc29f;
            end
            3'h4: begin
              out_r = 16'hc29f;
              case (mant_lo4)
                4'hc: out_r = 16'hc29e;
                4'hd: out_r = 16'hc29e;
                4'he: out_r = 16'hc29e;
                4'hf: out_r = 16'hc29e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc29e;
            end
            3'h6: begin
              out_r = 16'hc29e;
            end
            3'h7: begin
              out_r = 16'hc29e;
            end
            default: begin end
          endcase
        end
        9'h00d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc29e;
            end
            3'h1: begin
              out_r = 16'hc29e;
            end
            3'h2: begin
              out_r = 16'hc29e;
              case (mant_lo4)
                4'h8: out_r = 16'hc29d;
                4'h9: out_r = 16'hc29d;
                4'ha: out_r = 16'hc29d;
                4'hb: out_r = 16'hc29d;
                4'hc: out_r = 16'hc29d;
                4'hd: out_r = 16'hc29d;
                4'he: out_r = 16'hc29d;
                4'hf: out_r = 16'hc29d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc29d;
            end
            3'h4: begin
              out_r = 16'hc29d;
            end
            3'h5: begin
              out_r = 16'hc29d;
            end
            3'h6: begin
              out_r = 16'hc29d;
            end
            3'h7: begin
              out_r = 16'hc29d;
            end
            default: begin end
          endcase
        end
        9'h00e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc29d;
              case (mant_lo4)
                4'hb: out_r = 16'hc29c;
                4'hc: out_r = 16'hc29c;
                4'hd: out_r = 16'hc29c;
                4'he: out_r = 16'hc29c;
                4'hf: out_r = 16'hc29c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc29c;
            end
            3'h2: begin
              out_r = 16'hc29c;
            end
            3'h3: begin
              out_r = 16'hc29c;
            end
            3'h4: begin
              out_r = 16'hc29c;
            end
            3'h5: begin
              out_r = 16'hc29c;
            end
            3'h6: begin
              out_r = 16'hc29b;
              case (mant_lo4)
                4'h0: out_r = 16'hc29c;
                4'h1: out_r = 16'hc29c;
                4'h2: out_r = 16'hc29c;
                4'h3: out_r = 16'hc29c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc29b;
            end
            default: begin end
          endcase
        end
        9'h00f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc29b;
            end
            3'h1: begin
              out_r = 16'hc29b;
            end
            3'h2: begin
              out_r = 16'hc29b;
            end
            3'h3: begin
              out_r = 16'hc29b;
              case (mant_lo4)
                4'hc: out_r = 16'hc29a;
                4'hd: out_r = 16'hc29a;
                4'he: out_r = 16'hc29a;
                4'hf: out_r = 16'hc29a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc29a;
            end
            3'h5: begin
              out_r = 16'hc29a;
            end
            3'h6: begin
              out_r = 16'hc29a;
            end
            3'h7: begin
              out_r = 16'hc29a;
            end
            default: begin end
          endcase
        end
        9'h010: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc29a;
            end
            3'h1: begin
              out_r = 16'hc29a;
              case (mant_lo4)
                4'hb: out_r = 16'hc299;
                4'hc: out_r = 16'hc299;
                4'hd: out_r = 16'hc299;
                4'he: out_r = 16'hc299;
                4'hf: out_r = 16'hc299;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc299;
            end
            3'h3: begin
              out_r = 16'hc299;
            end
            3'h4: begin
              out_r = 16'hc299;
            end
            3'h5: begin
              out_r = 16'hc299;
            end
            3'h6: begin
              out_r = 16'hc299;
            end
            3'h7: begin
              out_r = 16'hc299;
            end
            default: begin end
          endcase
        end
        9'h011: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc298;
            end
            3'h1: begin
              out_r = 16'hc298;
            end
            3'h2: begin
              out_r = 16'hc298;
            end
            3'h3: begin
              out_r = 16'hc298;
            end
            3'h4: begin
              out_r = 16'hc298;
            end
            3'h5: begin
              out_r = 16'hc297;
              case (mant_lo4)
                4'h0: out_r = 16'hc298;
                4'h1: out_r = 16'hc298;
                4'h2: out_r = 16'hc298;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc297;
            end
            3'h7: begin
              out_r = 16'hc297;
            end
            default: begin end
          endcase
        end
        9'h012: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc297;
            end
            3'h1: begin
              out_r = 16'hc297;
            end
            3'h2: begin
              out_r = 16'hc297;
              case (mant_lo4)
                4'he: out_r = 16'hc296;
                4'hf: out_r = 16'hc296;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc296;
            end
            3'h4: begin
              out_r = 16'hc296;
            end
            3'h5: begin
              out_r = 16'hc296;
            end
            3'h6: begin
              out_r = 16'hc296;
            end
            3'h7: begin
              out_r = 16'hc296;
            end
            default: begin end
          endcase
        end
        9'h013: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc296;
              case (mant_lo4)
                4'hf: out_r = 16'hc295;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc295;
            end
            3'h2: begin
              out_r = 16'hc295;
            end
            3'h3: begin
              out_r = 16'hc295;
            end
            3'h4: begin
              out_r = 16'hc295;
            end
            3'h5: begin
              out_r = 16'hc295;
            end
            3'h6: begin
              out_r = 16'hc295;
              case (mant_lo4)
                4'hc: out_r = 16'hc294;
                4'hd: out_r = 16'hc294;
                4'he: out_r = 16'hc294;
                4'hf: out_r = 16'hc294;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc294;
            end
            default: begin end
          endcase
        end
        9'h014: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc294;
            end
            3'h1: begin
              out_r = 16'hc294;
            end
            3'h2: begin
              out_r = 16'hc294;
            end
            3'h3: begin
              out_r = 16'hc294;
            end
            3'h4: begin
              out_r = 16'hc293;
              case (mant_lo4)
                4'h0: out_r = 16'hc294;
                4'h1: out_r = 16'hc294;
                4'h2: out_r = 16'hc294;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc293;
            end
            3'h6: begin
              out_r = 16'hc293;
            end
            3'h7: begin
              out_r = 16'hc293;
            end
            default: begin end
          endcase
        end
        9'h015: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc293;
            end
            3'h1: begin
              out_r = 16'hc293;
            end
            3'h2: begin
              out_r = 16'hc292;
              case (mant_lo4)
                4'h0: out_r = 16'hc293;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc292;
            end
            3'h4: begin
              out_r = 16'hc292;
            end
            3'h5: begin
              out_r = 16'hc292;
            end
            3'h6: begin
              out_r = 16'hc292;
            end
            3'h7: begin
              out_r = 16'hc292;
            end
            default: begin end
          endcase
        end
        9'h016: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc291;
              case (mant_lo4)
                4'h0: out_r = 16'hc292;
                4'h1: out_r = 16'hc292;
                4'h2: out_r = 16'hc292;
                4'h3: out_r = 16'hc292;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc291;
            end
            3'h2: begin
              out_r = 16'hc291;
            end
            3'h3: begin
              out_r = 16'hc291;
            end
            3'h4: begin
              out_r = 16'hc291;
            end
            3'h5: begin
              out_r = 16'hc291;
              case (mant_lo4)
                4'ha: out_r = 16'hc290;
                4'hb: out_r = 16'hc290;
                4'hc: out_r = 16'hc290;
                4'hd: out_r = 16'hc290;
                4'he: out_r = 16'hc290;
                4'hf: out_r = 16'hc290;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc290;
            end
            3'h7: begin
              out_r = 16'hc290;
            end
            default: begin end
          endcase
        end
        9'h017: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc290;
            end
            3'h1: begin
              out_r = 16'hc290;
            end
            3'h2: begin
              out_r = 16'hc290;
            end
            3'h3: begin
              out_r = 16'hc28f;
              case (mant_lo4)
                4'h0: out_r = 16'hc290;
                4'h1: out_r = 16'hc290;
                4'h2: out_r = 16'hc290;
                4'h3: out_r = 16'hc290;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc28f;
            end
            3'h5: begin
              out_r = 16'hc28f;
            end
            3'h6: begin
              out_r = 16'hc28f;
            end
            3'h7: begin
              out_r = 16'hc28f;
            end
            default: begin end
          endcase
        end
        9'h018: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc28f;
            end
            3'h1: begin
              out_r = 16'hc28e;
              case (mant_lo4)
                4'h0: out_r = 16'hc28f;
                4'h1: out_r = 16'hc28f;
                4'h2: out_r = 16'hc28f;
                4'h3: out_r = 16'hc28f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc28e;
            end
            3'h3: begin
              out_r = 16'hc28e;
            end
            3'h4: begin
              out_r = 16'hc28e;
            end
            3'h5: begin
              out_r = 16'hc28e;
            end
            3'h6: begin
              out_r = 16'hc28e;
            end
            3'h7: begin
              out_r = 16'hc28d;
              case (mant_lo4)
                4'h0: out_r = 16'hc28e;
                4'h1: out_r = 16'hc28e;
                4'h2: out_r = 16'hc28e;
                4'h3: out_r = 16'hc28e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h019: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc28d;
            end
            3'h1: begin
              out_r = 16'hc28d;
            end
            3'h2: begin
              out_r = 16'hc28d;
            end
            3'h3: begin
              out_r = 16'hc28d;
            end
            3'h4: begin
              out_r = 16'hc28d;
              case (mant_lo4)
                4'h9: out_r = 16'hc28c;
                4'ha: out_r = 16'hc28c;
                4'hb: out_r = 16'hc28c;
                4'hc: out_r = 16'hc28c;
                4'hd: out_r = 16'hc28c;
                4'he: out_r = 16'hc28c;
                4'hf: out_r = 16'hc28c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc28c;
            end
            3'h6: begin
              out_r = 16'hc28c;
            end
            3'h7: begin
              out_r = 16'hc28c;
            end
            default: begin end
          endcase
        end
        9'h01a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc28c;
            end
            3'h1: begin
              out_r = 16'hc28c;
            end
            3'h2: begin
              out_r = 16'hc28b;
              case (mant_lo4)
                4'h0: out_r = 16'hc28c;
                4'h1: out_r = 16'hc28c;
                4'h2: out_r = 16'hc28c;
                4'h3: out_r = 16'hc28c;
                4'h4: out_r = 16'hc28c;
                4'h5: out_r = 16'hc28c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc28b;
            end
            3'h4: begin
              out_r = 16'hc28b;
            end
            3'h5: begin
              out_r = 16'hc28b;
            end
            3'h6: begin
              out_r = 16'hc28b;
            end
            3'h7: begin
              out_r = 16'hc28b;
            end
            default: begin end
          endcase
        end
        9'h01b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc28b;
              case (mant_lo4)
                4'h9: out_r = 16'hc28a;
                4'ha: out_r = 16'hc28a;
                4'hb: out_r = 16'hc28a;
                4'hc: out_r = 16'hc28a;
                4'hd: out_r = 16'hc28a;
                4'he: out_r = 16'hc28a;
                4'hf: out_r = 16'hc28a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc28a;
            end
            3'h2: begin
              out_r = 16'hc28a;
            end
            3'h3: begin
              out_r = 16'hc28a;
            end
            3'h4: begin
              out_r = 16'hc28a;
            end
            3'h5: begin
              out_r = 16'hc28a;
            end
            3'h6: begin
              out_r = 16'hc289;
              case (mant_lo4)
                4'h0: out_r = 16'hc28a;
                4'h1: out_r = 16'hc28a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc289;
            end
            default: begin end
          endcase
        end
        9'h01c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc289;
            end
            3'h1: begin
              out_r = 16'hc289;
            end
            3'h2: begin
              out_r = 16'hc289;
            end
            3'h3: begin
              out_r = 16'hc289;
              case (mant_lo4)
                4'ha: out_r = 16'hc288;
                4'hb: out_r = 16'hc288;
                4'hc: out_r = 16'hc288;
                4'hd: out_r = 16'hc288;
                4'he: out_r = 16'hc288;
                4'hf: out_r = 16'hc288;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc288;
            end
            3'h5: begin
              out_r = 16'hc288;
            end
            3'h6: begin
              out_r = 16'hc288;
            end
            3'h7: begin
              out_r = 16'hc288;
            end
            default: begin end
          endcase
        end
        9'h01d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc288;
            end
            3'h1: begin
              out_r = 16'hc288;
              case (mant_lo4)
                4'ha: out_r = 16'hc287;
                4'hb: out_r = 16'hc287;
                4'hc: out_r = 16'hc287;
                4'hd: out_r = 16'hc287;
                4'he: out_r = 16'hc287;
                4'hf: out_r = 16'hc287;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc287;
            end
            3'h3: begin
              out_r = 16'hc287;
            end
            3'h4: begin
              out_r = 16'hc287;
            end
            3'h5: begin
              out_r = 16'hc287;
            end
            3'h6: begin
              out_r = 16'hc287;
            end
            3'h7: begin
              out_r = 16'hc287;
              case (mant_lo4)
                4'hd: out_r = 16'hc286;
                4'he: out_r = 16'hc286;
                4'hf: out_r = 16'hc286;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h01e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc286;
            end
            3'h1: begin
              out_r = 16'hc286;
            end
            3'h2: begin
              out_r = 16'hc286;
            end
            3'h3: begin
              out_r = 16'hc286;
            end
            3'h4: begin
              out_r = 16'hc286;
            end
            3'h5: begin
              out_r = 16'hc285;
            end
            3'h6: begin
              out_r = 16'hc285;
            end
            3'h7: begin
              out_r = 16'hc285;
            end
            default: begin end
          endcase
        end
        9'h01f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc285;
            end
            3'h1: begin
              out_r = 16'hc285;
            end
            3'h2: begin
              out_r = 16'hc285;
              case (mant_lo4)
                4'hc: out_r = 16'hc284;
                4'hd: out_r = 16'hc284;
                4'he: out_r = 16'hc284;
                4'hf: out_r = 16'hc284;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc284;
            end
            3'h4: begin
              out_r = 16'hc284;
            end
            3'h5: begin
              out_r = 16'hc284;
            end
            3'h6: begin
              out_r = 16'hc284;
            end
            3'h7: begin
              out_r = 16'hc284;
            end
            default: begin end
          endcase
        end
        9'h020: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc284;
              case (mant_lo4)
                4'he: out_r = 16'hc283;
                4'hf: out_r = 16'hc283;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc283;
            end
            3'h2: begin
              out_r = 16'hc283;
            end
            3'h3: begin
              out_r = 16'hc283;
            end
            3'h4: begin
              out_r = 16'hc283;
            end
            3'h5: begin
              out_r = 16'hc283;
            end
            3'h6: begin
              out_r = 16'hc283;
              case (mant_lo4)
                4'h9: out_r = 16'hc282;
                4'ha: out_r = 16'hc282;
                4'hb: out_r = 16'hc282;
                4'hc: out_r = 16'hc282;
                4'hd: out_r = 16'hc282;
                4'he: out_r = 16'hc282;
                4'hf: out_r = 16'hc282;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc282;
            end
            default: begin end
          endcase
        end
        9'h021: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc282;
            end
            3'h1: begin
              out_r = 16'hc282;
            end
            3'h2: begin
              out_r = 16'hc282;
            end
            3'h3: begin
              out_r = 16'hc282;
            end
            3'h4: begin
              out_r = 16'hc281;
              case (mant_lo4)
                4'h0: out_r = 16'hc282;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc281;
            end
            3'h6: begin
              out_r = 16'hc281;
            end
            3'h7: begin
              out_r = 16'hc281;
            end
            default: begin end
          endcase
        end
        9'h022: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc281;
            end
            3'h1: begin
              out_r = 16'hc281;
              case (mant_lo4)
                4'hf: out_r = 16'hc280;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc280;
            end
            3'h3: begin
              out_r = 16'hc280;
            end
            3'h4: begin
              out_r = 16'hc280;
            end
            3'h5: begin
              out_r = 16'hc280;
            end
            3'h6: begin
              out_r = 16'hc27f;
              case (mant_lo4)
                4'h0: out_r = 16'hc280;
                4'h1: out_r = 16'hc280;
                4'h2: out_r = 16'hc280;
                4'h3: out_r = 16'hc280;
                4'h4: out_r = 16'hc280;
                4'h5: out_r = 16'hc280;
                4'h6: out_r = 16'hc280;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc27f;
            end
            default: begin end
          endcase
        end
        9'h023: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc27f;
            end
            3'h1: begin
              out_r = 16'hc27e;
              case (mant_lo4)
                4'h0: out_r = 16'hc27f;
                4'h1: out_r = 16'hc27f;
                4'h2: out_r = 16'hc27f;
                4'h3: out_r = 16'hc27f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc27e;
            end
            3'h3: begin
              out_r = 16'hc27e;
              case (mant_lo4)
                4'he: out_r = 16'hc27d;
                4'hf: out_r = 16'hc27d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc27d;
            end
            3'h5: begin
              out_r = 16'hc27d;
            end
            3'h6: begin
              out_r = 16'hc27d;
            end
            3'h7: begin
              out_r = 16'hc27c;
              case (mant_lo4)
                4'h0: out_r = 16'hc27d;
                4'h1: out_r = 16'hc27d;
                4'h2: out_r = 16'hc27d;
                4'h3: out_r = 16'hc27d;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h024: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc27c;
            end
            3'h1: begin
              out_r = 16'hc27c;
              case (mant_lo4)
                4'hd: out_r = 16'hc27b;
                4'he: out_r = 16'hc27b;
                4'hf: out_r = 16'hc27b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc27b;
            end
            3'h3: begin
              out_r = 16'hc27b;
            end
            3'h4: begin
              out_r = 16'hc27b;
              case (mant_lo4)
                4'ha: out_r = 16'hc27a;
                4'hb: out_r = 16'hc27a;
                4'hc: out_r = 16'hc27a;
                4'hd: out_r = 16'hc27a;
                4'he: out_r = 16'hc27a;
                4'hf: out_r = 16'hc27a;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc27a;
            end
            3'h6: begin
              out_r = 16'hc27a;
            end
            3'h7: begin
              out_r = 16'hc27a;
            end
            default: begin end
          endcase
        end
        9'h025: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc279;
              case (mant_lo4)
                4'h0: out_r = 16'hc27a;
                4'h1: out_r = 16'hc27a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc279;
            end
            3'h2: begin
              out_r = 16'hc278;
              case (mant_lo4)
                4'h0: out_r = 16'hc279;
                4'h1: out_r = 16'hc279;
                4'h2: out_r = 16'hc279;
                4'h3: out_r = 16'hc279;
                4'h4: out_r = 16'hc279;
                4'h5: out_r = 16'hc279;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc278;
            end
            3'h4: begin
              out_r = 16'hc278;
            end
            3'h5: begin
              out_r = 16'hc277;
              case (mant_lo4)
                4'h0: out_r = 16'hc278;
                4'h1: out_r = 16'hc278;
                4'h2: out_r = 16'hc278;
                4'h3: out_r = 16'hc278;
                4'h4: out_r = 16'hc278;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc277;
            end
            3'h7: begin
              out_r = 16'hc277;
            end
            default: begin end
          endcase
        end
        9'h026: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc277;
              case (mant_lo4)
                4'h9: out_r = 16'hc276;
                4'ha: out_r = 16'hc276;
                4'hb: out_r = 16'hc276;
                4'hc: out_r = 16'hc276;
                4'hd: out_r = 16'hc276;
                4'he: out_r = 16'hc276;
                4'hf: out_r = 16'hc276;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc276;
            end
            3'h2: begin
              out_r = 16'hc276;
            end
            3'h3: begin
              out_r = 16'hc275;
            end
            3'h4: begin
              out_r = 16'hc275;
            end
            3'h5: begin
              out_r = 16'hc275;
            end
            3'h6: begin
              out_r = 16'hc274;
              case (mant_lo4)
                4'h0: out_r = 16'hc275;
                4'h1: out_r = 16'hc275;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc274;
            end
            default: begin end
          endcase
        end
        9'h027: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc274;
            end
            3'h1: begin
              out_r = 16'hc273;
              case (mant_lo4)
                4'h0: out_r = 16'hc274;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc273;
            end
            3'h3: begin
              out_r = 16'hc273;
              case (mant_lo4)
                4'ha: out_r = 16'hc272;
                4'hb: out_r = 16'hc272;
                4'hc: out_r = 16'hc272;
                4'hd: out_r = 16'hc272;
                4'he: out_r = 16'hc272;
                4'hf: out_r = 16'hc272;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc272;
            end
            3'h5: begin
              out_r = 16'hc272;
            end
            3'h6: begin
              out_r = 16'hc272;
              case (mant_lo4)
                4'hf: out_r = 16'hc271;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc271;
            end
            default: begin end
          endcase
        end
        9'h028: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc271;
            end
            3'h1: begin
              out_r = 16'hc271;
              case (mant_lo4)
                4'ha: out_r = 16'hc270;
                4'hb: out_r = 16'hc270;
                4'hc: out_r = 16'hc270;
                4'hd: out_r = 16'hc270;
                4'he: out_r = 16'hc270;
                4'hf: out_r = 16'hc270;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc270;
            end
            3'h3: begin
              out_r = 16'hc270;
            end
            3'h4: begin
              out_r = 16'hc26f;
              case (mant_lo4)
                4'h0: out_r = 16'hc270;
                4'h1: out_r = 16'hc270;
                4'h2: out_r = 16'hc270;
                4'h3: out_r = 16'hc270;
                4'h4: out_r = 16'hc270;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc26f;
            end
            3'h6: begin
              out_r = 16'hc26f;
            end
            3'h7: begin
              out_r = 16'hc26f;
              case (mant_lo4)
                4'hd: out_r = 16'hc26e;
                4'he: out_r = 16'hc26e;
                4'hf: out_r = 16'hc26e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h029: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc26e;
            end
            3'h1: begin
              out_r = 16'hc26e;
            end
            3'h2: begin
              out_r = 16'hc26d;
              case (mant_lo4)
                4'h0: out_r = 16'hc26e;
                4'h1: out_r = 16'hc26e;
                4'h2: out_r = 16'hc26e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc26d;
            end
            3'h4: begin
              out_r = 16'hc26d;
            end
            3'h5: begin
              out_r = 16'hc26c;
              case (mant_lo4)
                4'h0: out_r = 16'hc26d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc26c;
            end
            3'h7: begin
              out_r = 16'hc26c;
            end
            default: begin end
          endcase
        end
        9'h02a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc26b;
              case (mant_lo4)
                4'h0: out_r = 16'hc26c;
                4'h1: out_r = 16'hc26c;
                4'h2: out_r = 16'hc26c;
                4'h3: out_r = 16'hc26c;
                4'h4: out_r = 16'hc26c;
                4'h5: out_r = 16'hc26c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc26b;
            end
            3'h2: begin
              out_r = 16'hc26b;
              case (mant_lo4)
                4'hc: out_r = 16'hc26a;
                4'hd: out_r = 16'hc26a;
                4'he: out_r = 16'hc26a;
                4'hf: out_r = 16'hc26a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc26a;
            end
            3'h4: begin
              out_r = 16'hc26a;
            end
            3'h5: begin
              out_r = 16'hc26a;
              case (mant_lo4)
                4'hd: out_r = 16'hc269;
                4'he: out_r = 16'hc269;
                4'hf: out_r = 16'hc269;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc269;
            end
            3'h7: begin
              out_r = 16'hc269;
            end
            default: begin end
          endcase
        end
        9'h02b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc269;
              case (mant_lo4)
                4'he: out_r = 16'hc268;
                4'hf: out_r = 16'hc268;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc268;
            end
            3'h2: begin
              out_r = 16'hc268;
            end
            3'h3: begin
              out_r = 16'hc267;
              case (mant_lo4)
                4'h0: out_r = 16'hc268;
                4'h1: out_r = 16'hc268;
                4'h2: out_r = 16'hc268;
                4'h3: out_r = 16'hc268;
                4'h4: out_r = 16'hc268;
                4'h5: out_r = 16'hc268;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc267;
            end
            3'h5: begin
              out_r = 16'hc267;
            end
            3'h6: begin
              out_r = 16'hc267;
              case (mant_lo4)
                4'ha: out_r = 16'hc266;
                4'hb: out_r = 16'hc266;
                4'hc: out_r = 16'hc266;
                4'hd: out_r = 16'hc266;
                4'he: out_r = 16'hc266;
                4'hf: out_r = 16'hc266;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc266;
            end
            default: begin end
          endcase
        end
        9'h02c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc266;
            end
            3'h1: begin
              out_r = 16'hc265;
              case (mant_lo4)
                4'h0: out_r = 16'hc266;
                4'h1: out_r = 16'hc266;
                4'h2: out_r = 16'hc266;
                4'h3: out_r = 16'hc266;
                4'h4: out_r = 16'hc266;
                4'h5: out_r = 16'hc266;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc265;
            end
            3'h3: begin
              out_r = 16'hc265;
            end
            3'h4: begin
              out_r = 16'hc264;
              case (mant_lo4)
                4'h0: out_r = 16'hc265;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc264;
            end
            3'h6: begin
              out_r = 16'hc264;
            end
            3'h7: begin
              out_r = 16'hc263;
              case (mant_lo4)
                4'h0: out_r = 16'hc264;
                4'h1: out_r = 16'hc264;
                4'h2: out_r = 16'hc264;
                4'h3: out_r = 16'hc264;
                4'h4: out_r = 16'hc264;
                4'h5: out_r = 16'hc264;
                4'h6: out_r = 16'hc264;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h02d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc263;
            end
            3'h1: begin
              out_r = 16'hc263;
              case (mant_lo4)
                4'hf: out_r = 16'hc262;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc262;
            end
            3'h3: begin
              out_r = 16'hc262;
            end
            3'h4: begin
              out_r = 16'hc262;
              case (mant_lo4)
                4'hc: out_r = 16'hc261;
                4'hd: out_r = 16'hc261;
                4'he: out_r = 16'hc261;
                4'hf: out_r = 16'hc261;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc261;
            end
            3'h6: begin
              out_r = 16'hc261;
            end
            3'h7: begin
              out_r = 16'hc261;
            end
            default: begin end
          endcase
        end
        9'h02e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc260;
              case (mant_lo4)
                4'h0: out_r = 16'hc261;
                4'h1: out_r = 16'hc261;
                4'h2: out_r = 16'hc261;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc260;
            end
            3'h2: begin
              out_r = 16'hc260;
              case (mant_lo4)
                4'h8: out_r = 16'hc25f;
                4'h9: out_r = 16'hc25f;
                4'ha: out_r = 16'hc25f;
                4'hb: out_r = 16'hc25f;
                4'hc: out_r = 16'hc25f;
                4'hd: out_r = 16'hc25f;
                4'he: out_r = 16'hc25f;
                4'hf: out_r = 16'hc25f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc25f;
            end
            3'h4: begin
              out_r = 16'hc25f;
            end
            3'h5: begin
              out_r = 16'hc25f;
              case (mant_lo4)
                4'h8: out_r = 16'hc25e;
                4'h9: out_r = 16'hc25e;
                4'ha: out_r = 16'hc25e;
                4'hb: out_r = 16'hc25e;
                4'hc: out_r = 16'hc25e;
                4'hd: out_r = 16'hc25e;
                4'he: out_r = 16'hc25e;
                4'hf: out_r = 16'hc25e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc25e;
            end
            3'h7: begin
              out_r = 16'hc25e;
            end
            default: begin end
          endcase
        end
        9'h02f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc25e;
              case (mant_lo4)
                4'hb: out_r = 16'hc25d;
                4'hc: out_r = 16'hc25d;
                4'hd: out_r = 16'hc25d;
                4'he: out_r = 16'hc25d;
                4'hf: out_r = 16'hc25d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc25d;
            end
            3'h2: begin
              out_r = 16'hc25d;
            end
            3'h3: begin
              out_r = 16'hc25c;
              case (mant_lo4)
                4'h0: out_r = 16'hc25d;
                4'h1: out_r = 16'hc25d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc25c;
            end
            3'h5: begin
              out_r = 16'hc25c;
            end
            3'h6: begin
              out_r = 16'hc25b;
              case (mant_lo4)
                4'h0: out_r = 16'hc25c;
                4'h1: out_r = 16'hc25c;
                4'h2: out_r = 16'hc25c;
                4'h3: out_r = 16'hc25c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc25b;
            end
            default: begin end
          endcase
        end
        9'h030: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc25b;
            end
            3'h1: begin
              out_r = 16'hc25a;
              case (mant_lo4)
                4'h0: out_r = 16'hc25b;
                4'h1: out_r = 16'hc25b;
                4'h2: out_r = 16'hc25b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc25a;
            end
            3'h3: begin
              out_r = 16'hc25a;
              case (mant_lo4)
                4'hc: out_r = 16'hc259;
                4'hd: out_r = 16'hc259;
                4'he: out_r = 16'hc259;
                4'hf: out_r = 16'hc259;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc259;
            end
            3'h5: begin
              out_r = 16'hc259;
            end
            3'h6: begin
              out_r = 16'hc259;
            end
            3'h7: begin
              out_r = 16'hc258;
              case (mant_lo4)
                4'h0: out_r = 16'hc259;
                4'h1: out_r = 16'hc259;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h031: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc258;
            end
            3'h1: begin
              out_r = 16'hc258;
              case (mant_lo4)
                4'hb: out_r = 16'hc257;
                4'hc: out_r = 16'hc257;
                4'hd: out_r = 16'hc257;
                4'he: out_r = 16'hc257;
                4'hf: out_r = 16'hc257;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc257;
            end
            3'h3: begin
              out_r = 16'hc257;
            end
            3'h4: begin
              out_r = 16'hc256;
              case (mant_lo4)
                4'h0: out_r = 16'hc257;
                4'h1: out_r = 16'hc257;
                4'h2: out_r = 16'hc257;
                4'h3: out_r = 16'hc257;
                4'h4: out_r = 16'hc257;
                4'h5: out_r = 16'hc257;
                4'h6: out_r = 16'hc257;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc256;
            end
            3'h6: begin
              out_r = 16'hc256;
            end
            3'h7: begin
              out_r = 16'hc256;
            end
            default: begin end
          endcase
        end
        9'h032: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc255;
            end
            3'h1: begin
              out_r = 16'hc255;
            end
            3'h2: begin
              out_r = 16'hc254;
              case (mant_lo4)
                4'h0: out_r = 16'hc255;
                4'h1: out_r = 16'hc255;
                4'h2: out_r = 16'hc255;
                4'h3: out_r = 16'hc255;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc254;
            end
            3'h4: begin
              out_r = 16'hc254;
            end
            3'h5: begin
              out_r = 16'hc253;
              case (mant_lo4)
                4'h0: out_r = 16'hc254;
                4'h1: out_r = 16'hc254;
                4'h2: out_r = 16'hc254;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc253;
            end
            3'h7: begin
              out_r = 16'hc253;
            end
            default: begin end
          endcase
        end
        9'h033: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc253;
              case (mant_lo4)
                4'h8: out_r = 16'hc252;
                4'h9: out_r = 16'hc252;
                4'ha: out_r = 16'hc252;
                4'hb: out_r = 16'hc252;
                4'hc: out_r = 16'hc252;
                4'hd: out_r = 16'hc252;
                4'he: out_r = 16'hc252;
                4'hf: out_r = 16'hc252;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc252;
            end
            3'h2: begin
              out_r = 16'hc252;
              case (mant_lo4)
                4'he: out_r = 16'hc251;
                4'hf: out_r = 16'hc251;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc251;
            end
            3'h4: begin
              out_r = 16'hc251;
            end
            3'h5: begin
              out_r = 16'hc251;
              case (mant_lo4)
                4'hf: out_r = 16'hc250;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc250;
            end
            3'h7: begin
              out_r = 16'hc250;
            end
            default: begin end
          endcase
        end
        9'h034: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc250;
            end
            3'h1: begin
              out_r = 16'hc24f;
            end
            3'h2: begin
              out_r = 16'hc24f;
            end
            3'h3: begin
              out_r = 16'hc24f;
              case (mant_lo4)
                4'h8: out_r = 16'hc24e;
                4'h9: out_r = 16'hc24e;
                4'ha: out_r = 16'hc24e;
                4'hb: out_r = 16'hc24e;
                4'hc: out_r = 16'hc24e;
                4'hd: out_r = 16'hc24e;
                4'he: out_r = 16'hc24e;
                4'hf: out_r = 16'hc24e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc24e;
            end
            3'h5: begin
              out_r = 16'hc24e;
            end
            3'h6: begin
              out_r = 16'hc24e;
              case (mant_lo4)
                4'hc: out_r = 16'hc24d;
                4'hd: out_r = 16'hc24d;
                4'he: out_r = 16'hc24d;
                4'hf: out_r = 16'hc24d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc24d;
            end
            default: begin end
          endcase
        end
        9'h035: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc24d;
            end
            3'h1: begin
              out_r = 16'hc24d;
              case (mant_lo4)
                4'h8: out_r = 16'hc24c;
                4'h9: out_r = 16'hc24c;
                4'ha: out_r = 16'hc24c;
                4'hb: out_r = 16'hc24c;
                4'hc: out_r = 16'hc24c;
                4'hd: out_r = 16'hc24c;
                4'he: out_r = 16'hc24c;
                4'hf: out_r = 16'hc24c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc24c;
            end
            3'h3: begin
              out_r = 16'hc24c;
            end
            3'h4: begin
              out_r = 16'hc24b;
              case (mant_lo4)
                4'h0: out_r = 16'hc24c;
                4'h1: out_r = 16'hc24c;
                4'h2: out_r = 16'hc24c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc24b;
            end
            3'h6: begin
              out_r = 16'hc24b;
            end
            3'h7: begin
              out_r = 16'hc24b;
              case (mant_lo4)
                4'ha: out_r = 16'hc24a;
                4'hb: out_r = 16'hc24a;
                4'hc: out_r = 16'hc24a;
                4'hd: out_r = 16'hc24a;
                4'he: out_r = 16'hc24a;
                4'hf: out_r = 16'hc24a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h036: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc24a;
            end
            3'h1: begin
              out_r = 16'hc24a;
            end
            3'h2: begin
              out_r = 16'hc249;
              case (mant_lo4)
                4'h0: out_r = 16'hc24a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc249;
            end
            3'h4: begin
              out_r = 16'hc249;
              case (mant_lo4)
                4'he: out_r = 16'hc248;
                4'hf: out_r = 16'hc248;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc248;
            end
            3'h6: begin
              out_r = 16'hc248;
            end
            3'h7: begin
              out_r = 16'hc248;
            end
            default: begin end
          endcase
        end
        9'h037: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc247;
              case (mant_lo4)
                4'h0: out_r = 16'hc248;
                4'h1: out_r = 16'hc248;
                4'h2: out_r = 16'hc248;
                4'h3: out_r = 16'hc248;
                4'h4: out_r = 16'hc248;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc247;
            end
            3'h2: begin
              out_r = 16'hc247;
              case (mant_lo4)
                4'ha: out_r = 16'hc246;
                4'hb: out_r = 16'hc246;
                4'hc: out_r = 16'hc246;
                4'hd: out_r = 16'hc246;
                4'he: out_r = 16'hc246;
                4'hf: out_r = 16'hc246;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc246;
            end
            3'h4: begin
              out_r = 16'hc246;
            end
            3'h5: begin
              out_r = 16'hc246;
              case (mant_lo4)
                4'ha: out_r = 16'hc245;
                4'hb: out_r = 16'hc245;
                4'hc: out_r = 16'hc245;
                4'hd: out_r = 16'hc245;
                4'he: out_r = 16'hc245;
                4'hf: out_r = 16'hc245;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc245;
            end
            3'h7: begin
              out_r = 16'hc245;
            end
            default: begin end
          endcase
        end
        9'h038: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc245;
              case (mant_lo4)
                4'hc: out_r = 16'hc244;
                4'hd: out_r = 16'hc244;
                4'he: out_r = 16'hc244;
                4'hf: out_r = 16'hc244;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc244;
            end
            3'h2: begin
              out_r = 16'hc244;
            end
            3'h3: begin
              out_r = 16'hc243;
              case (mant_lo4)
                4'h0: out_r = 16'hc244;
                4'h1: out_r = 16'hc244;
                4'h2: out_r = 16'hc244;
                4'h3: out_r = 16'hc244;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc243;
            end
            3'h5: begin
              out_r = 16'hc243;
            end
            3'h6: begin
              out_r = 16'hc242;
              case (mant_lo4)
                4'h0: out_r = 16'hc243;
                4'h1: out_r = 16'hc243;
                4'h2: out_r = 16'hc243;
                4'h3: out_r = 16'hc243;
                4'h4: out_r = 16'hc243;
                4'h5: out_r = 16'hc243;
                4'h6: out_r = 16'hc243;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc242;
            end
            default: begin end
          endcase
        end
        9'h039: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc242;
            end
            3'h1: begin
              out_r = 16'hc241;
              case (mant_lo4)
                4'h0: out_r = 16'hc242;
                4'h1: out_r = 16'hc242;
                4'h2: out_r = 16'hc242;
                4'h3: out_r = 16'hc242;
                4'h4: out_r = 16'hc242;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc241;
            end
            3'h3: begin
              out_r = 16'hc241;
              case (mant_lo4)
                4'hf: out_r = 16'hc240;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc240;
            end
            3'h5: begin
              out_r = 16'hc240;
            end
            3'h6: begin
              out_r = 16'hc240;
            end
            3'h7: begin
              out_r = 16'hc23f;
              case (mant_lo4)
                4'h0: out_r = 16'hc240;
                4'h1: out_r = 16'hc240;
                4'h2: out_r = 16'hc240;
                4'h3: out_r = 16'hc240;
                4'h4: out_r = 16'hc240;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h03a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc23f;
            end
            3'h1: begin
              out_r = 16'hc23f;
              case (mant_lo4)
                4'hd: out_r = 16'hc23e;
                4'he: out_r = 16'hc23e;
                4'hf: out_r = 16'hc23e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc23e;
            end
            3'h3: begin
              out_r = 16'hc23e;
            end
            3'h4: begin
              out_r = 16'hc23e;
              case (mant_lo4)
                4'ha: out_r = 16'hc23d;
                4'hb: out_r = 16'hc23d;
                4'hc: out_r = 16'hc23d;
                4'hd: out_r = 16'hc23d;
                4'he: out_r = 16'hc23d;
                4'hf: out_r = 16'hc23d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc23d;
            end
            3'h6: begin
              out_r = 16'hc23d;
            end
            3'h7: begin
              out_r = 16'hc23d;
            end
            default: begin end
          endcase
        end
        9'h03b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc23c;
              case (mant_lo4)
                4'h0: out_r = 16'hc23d;
                4'h1: out_r = 16'hc23d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc23c;
            end
            3'h2: begin
              out_r = 16'hc23b;
              case (mant_lo4)
                4'h0: out_r = 16'hc23c;
                4'h1: out_r = 16'hc23c;
                4'h2: out_r = 16'hc23c;
                4'h3: out_r = 16'hc23c;
                4'h4: out_r = 16'hc23c;
                4'h5: out_r = 16'hc23c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc23b;
            end
            3'h4: begin
              out_r = 16'hc23b;
            end
            3'h5: begin
              out_r = 16'hc23a;
              case (mant_lo4)
                4'h0: out_r = 16'hc23b;
                4'h1: out_r = 16'hc23b;
                4'h2: out_r = 16'hc23b;
                4'h3: out_r = 16'hc23b;
                4'h4: out_r = 16'hc23b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc23a;
            end
            3'h7: begin
              out_r = 16'hc23a;
            end
            default: begin end
          endcase
        end
        9'h03c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc23a;
              case (mant_lo4)
                4'h9: out_r = 16'hc239;
                4'ha: out_r = 16'hc239;
                4'hb: out_r = 16'hc239;
                4'hc: out_r = 16'hc239;
                4'hd: out_r = 16'hc239;
                4'he: out_r = 16'hc239;
                4'hf: out_r = 16'hc239;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc239;
            end
            3'h2: begin
              out_r = 16'hc239;
            end
            3'h3: begin
              out_r = 16'hc238;
            end
            3'h4: begin
              out_r = 16'hc238;
            end
            3'h5: begin
              out_r = 16'hc238;
            end
            3'h6: begin
              out_r = 16'hc237;
              case (mant_lo4)
                4'h0: out_r = 16'hc238;
                4'h1: out_r = 16'hc238;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc237;
            end
            default: begin end
          endcase
        end
        9'h03d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc237;
            end
            3'h1: begin
              out_r = 16'hc236;
              case (mant_lo4)
                4'h0: out_r = 16'hc237;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc236;
            end
            3'h3: begin
              out_r = 16'hc236;
              case (mant_lo4)
                4'ha: out_r = 16'hc235;
                4'hb: out_r = 16'hc235;
                4'hc: out_r = 16'hc235;
                4'hd: out_r = 16'hc235;
                4'he: out_r = 16'hc235;
                4'hf: out_r = 16'hc235;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc235;
            end
            3'h5: begin
              out_r = 16'hc235;
            end
            3'h6: begin
              out_r = 16'hc235;
              case (mant_lo4)
                4'hf: out_r = 16'hc234;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc234;
            end
            default: begin end
          endcase
        end
        9'h03e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc234;
            end
            3'h1: begin
              out_r = 16'hc234;
              case (mant_lo4)
                4'ha: out_r = 16'hc233;
                4'hb: out_r = 16'hc233;
                4'hc: out_r = 16'hc233;
                4'hd: out_r = 16'hc233;
                4'he: out_r = 16'hc233;
                4'hf: out_r = 16'hc233;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc233;
            end
            3'h3: begin
              out_r = 16'hc233;
            end
            3'h4: begin
              out_r = 16'hc232;
              case (mant_lo4)
                4'h0: out_r = 16'hc233;
                4'h1: out_r = 16'hc233;
                4'h2: out_r = 16'hc233;
                4'h3: out_r = 16'hc233;
                4'h4: out_r = 16'hc233;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc232;
            end
            3'h6: begin
              out_r = 16'hc232;
            end
            3'h7: begin
              out_r = 16'hc232;
              case (mant_lo4)
                4'hd: out_r = 16'hc231;
                4'he: out_r = 16'hc231;
                4'hf: out_r = 16'hc231;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h03f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc231;
            end
            3'h1: begin
              out_r = 16'hc231;
            end
            3'h2: begin
              out_r = 16'hc230;
              case (mant_lo4)
                4'h0: out_r = 16'hc231;
                4'h1: out_r = 16'hc231;
                4'h2: out_r = 16'hc231;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc230;
            end
            3'h4: begin
              out_r = 16'hc230;
            end
            3'h5: begin
              out_r = 16'hc22f;
              case (mant_lo4)
                4'h0: out_r = 16'hc230;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc22f;
            end
            3'h7: begin
              out_r = 16'hc22f;
            end
            default: begin end
          endcase
        end
        9'h040: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc22e;
              case (mant_lo4)
                4'h0: out_r = 16'hc22f;
                4'h1: out_r = 16'hc22f;
                4'h2: out_r = 16'hc22f;
                4'h3: out_r = 16'hc22f;
                4'h4: out_r = 16'hc22f;
                4'h5: out_r = 16'hc22f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc22e;
            end
            3'h2: begin
              out_r = 16'hc22e;
              case (mant_lo4)
                4'hc: out_r = 16'hc22d;
                4'hd: out_r = 16'hc22d;
                4'he: out_r = 16'hc22d;
                4'hf: out_r = 16'hc22d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc22d;
            end
            3'h4: begin
              out_r = 16'hc22d;
            end
            3'h5: begin
              out_r = 16'hc22d;
              case (mant_lo4)
                4'hd: out_r = 16'hc22c;
                4'he: out_r = 16'hc22c;
                4'hf: out_r = 16'hc22c;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc22c;
            end
            3'h7: begin
              out_r = 16'hc22c;
            end
            default: begin end
          endcase
        end
        9'h041: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc22c;
              case (mant_lo4)
                4'he: out_r = 16'hc22b;
                4'hf: out_r = 16'hc22b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc22b;
            end
            3'h2: begin
              out_r = 16'hc22b;
            end
            3'h3: begin
              out_r = 16'hc22a;
              case (mant_lo4)
                4'h0: out_r = 16'hc22b;
                4'h1: out_r = 16'hc22b;
                4'h2: out_r = 16'hc22b;
                4'h3: out_r = 16'hc22b;
                4'h4: out_r = 16'hc22b;
                4'h5: out_r = 16'hc22b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc22a;
            end
            3'h5: begin
              out_r = 16'hc22a;
            end
            3'h6: begin
              out_r = 16'hc22a;
              case (mant_lo4)
                4'ha: out_r = 16'hc229;
                4'hb: out_r = 16'hc229;
                4'hc: out_r = 16'hc229;
                4'hd: out_r = 16'hc229;
                4'he: out_r = 16'hc229;
                4'hf: out_r = 16'hc229;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc229;
            end
            default: begin end
          endcase
        end
        9'h042: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc229;
            end
            3'h1: begin
              out_r = 16'hc228;
              case (mant_lo4)
                4'h0: out_r = 16'hc229;
                4'h1: out_r = 16'hc229;
                4'h2: out_r = 16'hc229;
                4'h3: out_r = 16'hc229;
                4'h4: out_r = 16'hc229;
                4'h5: out_r = 16'hc229;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc228;
            end
            3'h3: begin
              out_r = 16'hc228;
            end
            3'h4: begin
              out_r = 16'hc227;
              case (mant_lo4)
                4'h0: out_r = 16'hc228;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc227;
            end
            3'h6: begin
              out_r = 16'hc227;
            end
            3'h7: begin
              out_r = 16'hc226;
              case (mant_lo4)
                4'h0: out_r = 16'hc227;
                4'h1: out_r = 16'hc227;
                4'h2: out_r = 16'hc227;
                4'h3: out_r = 16'hc227;
                4'h4: out_r = 16'hc227;
                4'h5: out_r = 16'hc227;
                4'h6: out_r = 16'hc227;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h043: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc226;
            end
            3'h1: begin
              out_r = 16'hc226;
              case (mant_lo4)
                4'hf: out_r = 16'hc225;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc225;
            end
            3'h3: begin
              out_r = 16'hc225;
            end
            3'h4: begin
              out_r = 16'hc225;
              case (mant_lo4)
                4'hc: out_r = 16'hc224;
                4'hd: out_r = 16'hc224;
                4'he: out_r = 16'hc224;
                4'hf: out_r = 16'hc224;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc224;
            end
            3'h6: begin
              out_r = 16'hc224;
            end
            3'h7: begin
              out_r = 16'hc224;
            end
            default: begin end
          endcase
        end
        9'h044: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc223;
              case (mant_lo4)
                4'h0: out_r = 16'hc224;
                4'h1: out_r = 16'hc224;
                4'h2: out_r = 16'hc224;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc223;
            end
            3'h2: begin
              out_r = 16'hc223;
              case (mant_lo4)
                4'h8: out_r = 16'hc222;
                4'h9: out_r = 16'hc222;
                4'ha: out_r = 16'hc222;
                4'hb: out_r = 16'hc222;
                4'hc: out_r = 16'hc222;
                4'hd: out_r = 16'hc222;
                4'he: out_r = 16'hc222;
                4'hf: out_r = 16'hc222;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc222;
            end
            3'h4: begin
              out_r = 16'hc222;
            end
            3'h5: begin
              out_r = 16'hc222;
              case (mant_lo4)
                4'h8: out_r = 16'hc221;
                4'h9: out_r = 16'hc221;
                4'ha: out_r = 16'hc221;
                4'hb: out_r = 16'hc221;
                4'hc: out_r = 16'hc221;
                4'hd: out_r = 16'hc221;
                4'he: out_r = 16'hc221;
                4'hf: out_r = 16'hc221;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc221;
            end
            3'h7: begin
              out_r = 16'hc221;
            end
            default: begin end
          endcase
        end
        9'h045: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc221;
              case (mant_lo4)
                4'hb: out_r = 16'hc220;
                4'hc: out_r = 16'hc220;
                4'hd: out_r = 16'hc220;
                4'he: out_r = 16'hc220;
                4'hf: out_r = 16'hc220;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc220;
            end
            3'h2: begin
              out_r = 16'hc220;
            end
            3'h3: begin
              out_r = 16'hc21f;
              case (mant_lo4)
                4'h0: out_r = 16'hc220;
                4'h1: out_r = 16'hc220;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc21f;
            end
            3'h5: begin
              out_r = 16'hc21f;
            end
            3'h6: begin
              out_r = 16'hc21e;
              case (mant_lo4)
                4'h0: out_r = 16'hc21f;
                4'h1: out_r = 16'hc21f;
                4'h2: out_r = 16'hc21f;
                4'h3: out_r = 16'hc21f;
                4'h4: out_r = 16'hc21f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc21e;
            end
            default: begin end
          endcase
        end
        9'h046: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc21e;
            end
            3'h1: begin
              out_r = 16'hc21d;
              case (mant_lo4)
                4'h0: out_r = 16'hc21e;
                4'h1: out_r = 16'hc21e;
                4'h2: out_r = 16'hc21e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc21d;
            end
            3'h3: begin
              out_r = 16'hc21d;
              case (mant_lo4)
                4'hc: out_r = 16'hc21c;
                4'hd: out_r = 16'hc21c;
                4'he: out_r = 16'hc21c;
                4'hf: out_r = 16'hc21c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc21c;
            end
            3'h5: begin
              out_r = 16'hc21c;
            end
            3'h6: begin
              out_r = 16'hc21c;
            end
            3'h7: begin
              out_r = 16'hc21b;
              case (mant_lo4)
                4'h0: out_r = 16'hc21c;
                4'h1: out_r = 16'hc21c;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h047: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc21b;
            end
            3'h1: begin
              out_r = 16'hc21b;
              case (mant_lo4)
                4'hb: out_r = 16'hc21a;
                4'hc: out_r = 16'hc21a;
                4'hd: out_r = 16'hc21a;
                4'he: out_r = 16'hc21a;
                4'hf: out_r = 16'hc21a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc21a;
            end
            3'h3: begin
              out_r = 16'hc21a;
            end
            3'h4: begin
              out_r = 16'hc219;
              case (mant_lo4)
                4'h0: out_r = 16'hc21a;
                4'h1: out_r = 16'hc21a;
                4'h2: out_r = 16'hc21a;
                4'h3: out_r = 16'hc21a;
                4'h4: out_r = 16'hc21a;
                4'h5: out_r = 16'hc21a;
                4'h6: out_r = 16'hc21a;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc219;
            end
            3'h6: begin
              out_r = 16'hc219;
            end
            3'h7: begin
              out_r = 16'hc219;
            end
            default: begin end
          endcase
        end
        9'h048: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc218;
            end
            3'h1: begin
              out_r = 16'hc218;
            end
            3'h2: begin
              out_r = 16'hc217;
              case (mant_lo4)
                4'h0: out_r = 16'hc218;
                4'h1: out_r = 16'hc218;
                4'h2: out_r = 16'hc218;
                4'h3: out_r = 16'hc218;
                4'h4: out_r = 16'hc218;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc217;
            end
            3'h4: begin
              out_r = 16'hc217;
            end
            3'h5: begin
              out_r = 16'hc216;
              case (mant_lo4)
                4'h0: out_r = 16'hc217;
                4'h1: out_r = 16'hc217;
                4'h2: out_r = 16'hc217;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc216;
            end
            3'h7: begin
              out_r = 16'hc216;
            end
            default: begin end
          endcase
        end
        9'h049: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc216;
              case (mant_lo4)
                4'h8: out_r = 16'hc215;
                4'h9: out_r = 16'hc215;
                4'ha: out_r = 16'hc215;
                4'hb: out_r = 16'hc215;
                4'hc: out_r = 16'hc215;
                4'hd: out_r = 16'hc215;
                4'he: out_r = 16'hc215;
                4'hf: out_r = 16'hc215;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc215;
            end
            3'h2: begin
              out_r = 16'hc215;
              case (mant_lo4)
                4'he: out_r = 16'hc214;
                4'hf: out_r = 16'hc214;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc214;
            end
            3'h4: begin
              out_r = 16'hc214;
            end
            3'h5: begin
              out_r = 16'hc214;
              case (mant_lo4)
                4'hf: out_r = 16'hc213;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc213;
            end
            3'h7: begin
              out_r = 16'hc213;
            end
            default: begin end
          endcase
        end
        9'h04a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc213;
            end
            3'h1: begin
              out_r = 16'hc212;
            end
            3'h2: begin
              out_r = 16'hc212;
            end
            3'h3: begin
              out_r = 16'hc212;
              case (mant_lo4)
                4'h8: out_r = 16'hc211;
                4'h9: out_r = 16'hc211;
                4'ha: out_r = 16'hc211;
                4'hb: out_r = 16'hc211;
                4'hc: out_r = 16'hc211;
                4'hd: out_r = 16'hc211;
                4'he: out_r = 16'hc211;
                4'hf: out_r = 16'hc211;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc211;
            end
            3'h5: begin
              out_r = 16'hc211;
            end
            3'h6: begin
              out_r = 16'hc211;
              case (mant_lo4)
                4'hc: out_r = 16'hc210;
                4'hd: out_r = 16'hc210;
                4'he: out_r = 16'hc210;
                4'hf: out_r = 16'hc210;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc210;
            end
            default: begin end
          endcase
        end
        9'h04b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc210;
            end
            3'h1: begin
              out_r = 16'hc210;
              case (mant_lo4)
                4'h8: out_r = 16'hc20f;
                4'h9: out_r = 16'hc20f;
                4'ha: out_r = 16'hc20f;
                4'hb: out_r = 16'hc20f;
                4'hc: out_r = 16'hc20f;
                4'hd: out_r = 16'hc20f;
                4'he: out_r = 16'hc20f;
                4'hf: out_r = 16'hc20f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc20f;
            end
            3'h3: begin
              out_r = 16'hc20f;
            end
            3'h4: begin
              out_r = 16'hc20e;
              case (mant_lo4)
                4'h0: out_r = 16'hc20f;
                4'h1: out_r = 16'hc20f;
                4'h2: out_r = 16'hc20f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc20e;
            end
            3'h6: begin
              out_r = 16'hc20e;
            end
            3'h7: begin
              out_r = 16'hc20e;
              case (mant_lo4)
                4'ha: out_r = 16'hc20d;
                4'hb: out_r = 16'hc20d;
                4'hc: out_r = 16'hc20d;
                4'hd: out_r = 16'hc20d;
                4'he: out_r = 16'hc20d;
                4'hf: out_r = 16'hc20d;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h04c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20d;
            end
            3'h1: begin
              out_r = 16'hc20d;
            end
            3'h2: begin
              out_r = 16'hc20c;
              case (mant_lo4)
                4'h0: out_r = 16'hc20d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc20c;
            end
            3'h4: begin
              out_r = 16'hc20c;
              case (mant_lo4)
                4'he: out_r = 16'hc20b;
                4'hf: out_r = 16'hc20b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc20b;
            end
            3'h6: begin
              out_r = 16'hc20b;
            end
            3'h7: begin
              out_r = 16'hc20b;
            end
            default: begin end
          endcase
        end
        9'h04d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20a;
              case (mant_lo4)
                4'h0: out_r = 16'hc20b;
                4'h1: out_r = 16'hc20b;
                4'h2: out_r = 16'hc20b;
                4'h3: out_r = 16'hc20b;
                4'h4: out_r = 16'hc20b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc20a;
            end
            3'h2: begin
              out_r = 16'hc20a;
              case (mant_lo4)
                4'ha: out_r = 16'hc209;
                4'hb: out_r = 16'hc209;
                4'hc: out_r = 16'hc209;
                4'hd: out_r = 16'hc209;
                4'he: out_r = 16'hc209;
                4'hf: out_r = 16'hc209;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc209;
            end
            3'h4: begin
              out_r = 16'hc209;
            end
            3'h5: begin
              out_r = 16'hc209;
              case (mant_lo4)
                4'ha: out_r = 16'hc208;
                4'hb: out_r = 16'hc208;
                4'hc: out_r = 16'hc208;
                4'hd: out_r = 16'hc208;
                4'he: out_r = 16'hc208;
                4'hf: out_r = 16'hc208;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc208;
            end
            3'h7: begin
              out_r = 16'hc208;
            end
            default: begin end
          endcase
        end
        9'h04e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc208;
              case (mant_lo4)
                4'hc: out_r = 16'hc207;
                4'hd: out_r = 16'hc207;
                4'he: out_r = 16'hc207;
                4'hf: out_r = 16'hc207;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc207;
            end
            3'h2: begin
              out_r = 16'hc207;
            end
            3'h3: begin
              out_r = 16'hc206;
              case (mant_lo4)
                4'h0: out_r = 16'hc207;
                4'h1: out_r = 16'hc207;
                4'h2: out_r = 16'hc207;
                4'h3: out_r = 16'hc207;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc206;
            end
            3'h5: begin
              out_r = 16'hc206;
            end
            3'h6: begin
              out_r = 16'hc205;
              case (mant_lo4)
                4'h0: out_r = 16'hc206;
                4'h1: out_r = 16'hc206;
                4'h2: out_r = 16'hc206;
                4'h3: out_r = 16'hc206;
                4'h4: out_r = 16'hc206;
                4'h5: out_r = 16'hc206;
                4'h6: out_r = 16'hc206;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc205;
            end
            default: begin end
          endcase
        end
        9'h04f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc205;
            end
            3'h1: begin
              out_r = 16'hc204;
              case (mant_lo4)
                4'h0: out_r = 16'hc205;
                4'h1: out_r = 16'hc205;
                4'h2: out_r = 16'hc205;
                4'h3: out_r = 16'hc205;
                4'h4: out_r = 16'hc205;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc204;
            end
            3'h3: begin
              out_r = 16'hc204;
              case (mant_lo4)
                4'hf: out_r = 16'hc203;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc203;
            end
            3'h5: begin
              out_r = 16'hc203;
            end
            3'h6: begin
              out_r = 16'hc203;
            end
            3'h7: begin
              out_r = 16'hc202;
              case (mant_lo4)
                4'h0: out_r = 16'hc203;
                4'h1: out_r = 16'hc203;
                4'h2: out_r = 16'hc203;
                4'h3: out_r = 16'hc203;
                4'h4: out_r = 16'hc203;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h050: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc202;
            end
            3'h1: begin
              out_r = 16'hc202;
              case (mant_lo4)
                4'hd: out_r = 16'hc201;
                4'he: out_r = 16'hc201;
                4'hf: out_r = 16'hc201;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc201;
            end
            3'h3: begin
              out_r = 16'hc201;
            end
            3'h4: begin
              out_r = 16'hc201;
              case (mant_lo4)
                4'ha: out_r = 16'hc200;
                4'hb: out_r = 16'hc200;
                4'hc: out_r = 16'hc200;
                4'hd: out_r = 16'hc200;
                4'he: out_r = 16'hc200;
                4'hf: out_r = 16'hc200;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc200;
            end
            3'h6: begin
              out_r = 16'hc200;
            end
            3'h7: begin
              out_r = 16'hc1ff;
              case (mant_lo4)
                4'h0: out_r = 16'hc200;
                4'h1: out_r = 16'hc200;
                4'h2: out_r = 16'hc200;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h051: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ff;
              case (mant_lo4)
                4'ha: out_r = 16'hc1fe;
                4'hb: out_r = 16'hc1fe;
                4'hc: out_r = 16'hc1fe;
                4'hd: out_r = 16'hc1fe;
                4'he: out_r = 16'hc1fe;
                4'hf: out_r = 16'hc1fe;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1fe;
              case (mant_lo4)
                4'hc: out_r = 16'hc1fd;
                4'hd: out_r = 16'hc1fd;
                4'he: out_r = 16'hc1fd;
                4'hf: out_r = 16'hc1fd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1fd;
            end
            3'h3: begin
              out_r = 16'hc1fc;
              case (mant_lo4)
                4'h0: out_r = 16'hc1fd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1fc;
              case (mant_lo4)
                4'h9: out_r = 16'hc1fb;
                4'ha: out_r = 16'hc1fb;
                4'hb: out_r = 16'hc1fb;
                4'hc: out_r = 16'hc1fb;
                4'hd: out_r = 16'hc1fb;
                4'he: out_r = 16'hc1fb;
                4'hf: out_r = 16'hc1fb;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1fb;
            end
            3'h6: begin
              out_r = 16'hc1fa;
              case (mant_lo4)
                4'h0: out_r = 16'hc1fb;
                4'h1: out_r = 16'hc1fb;
                4'h2: out_r = 16'hc1fb;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1fa;
            end
            default: begin end
          endcase
        end
        9'h052: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1f9;
              case (mant_lo4)
                4'h0: out_r = 16'hc1fa;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1f8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f9;
                4'h1: out_r = 16'hc1f9;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1f7;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f8;
                4'h1: out_r = 16'hc1f8;
                4'h2: out_r = 16'hc1f8;
                4'h3: out_r = 16'hc1f8;
                4'h4: out_r = 16'hc1f8;
                4'h5: out_r = 16'hc1f8;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1f7;
              case (mant_lo4)
                4'hc: out_r = 16'hc1f6;
                4'hd: out_r = 16'hc1f6;
                4'he: out_r = 16'hc1f6;
                4'hf: out_r = 16'hc1f6;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1f6;
            end
            3'h5: begin
              out_r = 16'hc1f5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f6;
                4'h1: out_r = 16'hc1f6;
                4'h2: out_r = 16'hc1f6;
                4'h3: out_r = 16'hc1f6;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1f5;
            end
            3'h7: begin
              out_r = 16'hc1f4;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f5;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h053: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1f4;
              case (mant_lo4)
                4'h9: out_r = 16'hc1f3;
                4'ha: out_r = 16'hc1f3;
                4'hb: out_r = 16'hc1f3;
                4'hc: out_r = 16'hc1f3;
                4'hd: out_r = 16'hc1f3;
                4'he: out_r = 16'hc1f3;
                4'hf: out_r = 16'hc1f3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1f3;
              case (mant_lo4)
                4'hb: out_r = 16'hc1f2;
                4'hc: out_r = 16'hc1f2;
                4'hd: out_r = 16'hc1f2;
                4'he: out_r = 16'hc1f2;
                4'hf: out_r = 16'hc1f2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1f2;
              case (mant_lo4)
                4'hf: out_r = 16'hc1f1;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1f1;
            end
            3'h4: begin
              out_r = 16'hc1f0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f1;
                4'h1: out_r = 16'hc1f1;
                4'h2: out_r = 16'hc1f1;
                4'h3: out_r = 16'hc1f1;
                4'h4: out_r = 16'hc1f1;
                4'h5: out_r = 16'hc1f1;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1f0;
            end
            3'h6: begin
              out_r = 16'hc1ef;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1ef;
              case (mant_lo4)
                4'hf: out_r = 16'hc1ee;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h054: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ee;
            end
            3'h1: begin
              out_r = 16'hc1ed;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ee;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1ec;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ed;
                4'h1: out_r = 16'hc1ed;
                4'h2: out_r = 16'hc1ed;
                4'h3: out_r = 16'hc1ed;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1ec;
              case (mant_lo4)
                4'h9: out_r = 16'hc1eb;
                4'ha: out_r = 16'hc1eb;
                4'hb: out_r = 16'hc1eb;
                4'hc: out_r = 16'hc1eb;
                4'hd: out_r = 16'hc1eb;
                4'he: out_r = 16'hc1eb;
                4'hf: out_r = 16'hc1eb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1eb;
            end
            3'h5: begin
              out_r = 16'hc1ea;
              case (mant_lo4)
                4'h0: out_r = 16'hc1eb;
                4'h1: out_r = 16'hc1eb;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1ea;
              case (mant_lo4)
                4'he: out_r = 16'hc1e9;
                4'hf: out_r = 16'hc1e9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1e9;
            end
            default: begin end
          endcase
        end
        9'h055: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e9;
                4'h1: out_r = 16'hc1e9;
                4'h2: out_r = 16'hc1e9;
                4'h3: out_r = 16'hc1e9;
                4'h4: out_r = 16'hc1e9;
                4'h5: out_r = 16'hc1e9;
                4'h6: out_r = 16'hc1e9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1e8;
              case (mant_lo4)
                4'h9: out_r = 16'hc1e7;
                4'ha: out_r = 16'hc1e7;
                4'hb: out_r = 16'hc1e7;
                4'hc: out_r = 16'hc1e7;
                4'hd: out_r = 16'hc1e7;
                4'he: out_r = 16'hc1e7;
                4'hf: out_r = 16'hc1e7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1e7;
              case (mant_lo4)
                4'hd: out_r = 16'hc1e6;
                4'he: out_r = 16'hc1e6;
                4'hf: out_r = 16'hc1e6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1e6;
            end
            3'h4: begin
              out_r = 16'hc1e5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e6;
                4'h1: out_r = 16'hc1e6;
                4'h2: out_r = 16'hc1e6;
                4'h3: out_r = 16'hc1e6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1e5;
              case (mant_lo4)
                4'he: out_r = 16'hc1e4;
                4'hf: out_r = 16'hc1e4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1e4;
            end
            3'h7: begin
              out_r = 16'hc1e4;
              case (mant_lo4)
                4'hc: out_r = 16'hc1e3;
                4'hd: out_r = 16'hc1e3;
                4'he: out_r = 16'hc1e3;
                4'hf: out_r = 16'hc1e3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h056: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e3;
              case (mant_lo4)
                4'hf: out_r = 16'hc1e2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1e2;
            end
            3'h2: begin
              out_r = 16'hc1e1;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e2;
                4'h1: out_r = 16'hc1e2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1e0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e1;
                4'h1: out_r = 16'hc1e1;
                4'h2: out_r = 16'hc1e1;
                4'h3: out_r = 16'hc1e1;
                4'h4: out_r = 16'hc1e1;
                4'h5: out_r = 16'hc1e1;
                4'h6: out_r = 16'hc1e1;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1e0;
            end
            3'h5: begin
              out_r = 16'hc1df;
            end
            3'h6: begin
              out_r = 16'hc1df;
              case (mant_lo4)
                4'hb: out_r = 16'hc1de;
                4'hc: out_r = 16'hc1de;
                4'hd: out_r = 16'hc1de;
                4'he: out_r = 16'hc1de;
                4'hf: out_r = 16'hc1de;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1de;
            end
            default: begin end
          endcase
        end
        9'h057: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1dd;
              case (mant_lo4)
                4'h0: out_r = 16'hc1de;
                4'h1: out_r = 16'hc1de;
                4'h2: out_r = 16'hc1de;
                4'h3: out_r = 16'hc1de;
                4'h4: out_r = 16'hc1de;
                4'h5: out_r = 16'hc1de;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1dc;
              case (mant_lo4)
                4'h0: out_r = 16'hc1dd;
                4'h1: out_r = 16'hc1dd;
                4'h2: out_r = 16'hc1dd;
                4'h3: out_r = 16'hc1dd;
                4'h4: out_r = 16'hc1dd;
                4'h5: out_r = 16'hc1dd;
                4'h6: out_r = 16'hc1dd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1dc;
              case (mant_lo4)
                4'hb: out_r = 16'hc1db;
                4'hc: out_r = 16'hc1db;
                4'hd: out_r = 16'hc1db;
                4'he: out_r = 16'hc1db;
                4'hf: out_r = 16'hc1db;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1db;
            end
            3'h4: begin
              out_r = 16'hc1da;
              case (mant_lo4)
                4'h0: out_r = 16'hc1db;
                4'h1: out_r = 16'hc1db;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1da;
              case (mant_lo4)
                4'hc: out_r = 16'hc1d9;
                4'hd: out_r = 16'hc1d9;
                4'he: out_r = 16'hc1d9;
                4'hf: out_r = 16'hc1d9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1d9;
            end
            3'h7: begin
              out_r = 16'hc1d9;
              case (mant_lo4)
                4'h9: out_r = 16'hc1d8;
                4'ha: out_r = 16'hc1d8;
                4'hb: out_r = 16'hc1d8;
                4'hc: out_r = 16'hc1d8;
                4'hd: out_r = 16'hc1d8;
                4'he: out_r = 16'hc1d8;
                4'hf: out_r = 16'hc1d8;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h058: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1d8;
              case (mant_lo4)
                4'hd: out_r = 16'hc1d7;
                4'he: out_r = 16'hc1d7;
                4'hf: out_r = 16'hc1d7;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1d7;
            end
            3'h2: begin
              out_r = 16'hc1d6;
            end
            3'h3: begin
              out_r = 16'hc1d5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d6;
                4'h1: out_r = 16'hc1d6;
                4'h2: out_r = 16'hc1d6;
                4'h3: out_r = 16'hc1d6;
                4'h4: out_r = 16'hc1d6;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1d5;
              case (mant_lo4)
                4'hd: out_r = 16'hc1d4;
                4'he: out_r = 16'hc1d4;
                4'hf: out_r = 16'hc1d4;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1d4;
            end
            3'h6: begin
              out_r = 16'hc1d4;
              case (mant_lo4)
                4'h9: out_r = 16'hc1d3;
                4'ha: out_r = 16'hc1d3;
                4'hb: out_r = 16'hc1d3;
                4'hc: out_r = 16'hc1d3;
                4'hd: out_r = 16'hc1d3;
                4'he: out_r = 16'hc1d3;
                4'hf: out_r = 16'hc1d3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1d3;
            end
            default: begin end
          endcase
        end
        9'h059: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1d2;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d3;
                4'h1: out_r = 16'hc1d3;
                4'h2: out_r = 16'hc1d3;
                4'h3: out_r = 16'hc1d3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1d1;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d2;
                4'h1: out_r = 16'hc1d2;
                4'h2: out_r = 16'hc1d2;
                4'h3: out_r = 16'hc1d2;
                4'h4: out_r = 16'hc1d2;
                4'h5: out_r = 16'hc1d2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1d1;
              case (mant_lo4)
                4'h9: out_r = 16'hc1d0;
                4'ha: out_r = 16'hc1d0;
                4'hb: out_r = 16'hc1d0;
                4'hc: out_r = 16'hc1d0;
                4'hd: out_r = 16'hc1d0;
                4'he: out_r = 16'hc1d0;
                4'hf: out_r = 16'hc1d0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1d0;
            end
            3'h4: begin
              out_r = 16'hc1cf;
            end
            3'h5: begin
              out_r = 16'hc1cf;
              case (mant_lo4)
                4'h9: out_r = 16'hc1ce;
                4'ha: out_r = 16'hc1ce;
                4'hb: out_r = 16'hc1ce;
                4'hc: out_r = 16'hc1ce;
                4'hd: out_r = 16'hc1ce;
                4'he: out_r = 16'hc1ce;
                4'hf: out_r = 16'hc1ce;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1ce;
            end
            3'h7: begin
              out_r = 16'hc1cd;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ce;
                4'h1: out_r = 16'hc1ce;
                4'h2: out_r = 16'hc1ce;
                4'h3: out_r = 16'hc1ce;
                4'h4: out_r = 16'hc1ce;
                4'h5: out_r = 16'hc1ce;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1cd;
              case (mant_lo4)
                4'hc: out_r = 16'hc1cc;
                4'hd: out_r = 16'hc1cc;
                4'he: out_r = 16'hc1cc;
                4'hf: out_r = 16'hc1cc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1cc;
              case (mant_lo4)
                4'he: out_r = 16'hc1cb;
                4'hf: out_r = 16'hc1cb;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1cb;
            end
            3'h3: begin
              out_r = 16'hc1ca;
              case (mant_lo4)
                4'h0: out_r = 16'hc1cb;
                4'h1: out_r = 16'hc1cb;
                4'h2: out_r = 16'hc1cb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1ca;
              case (mant_lo4)
                4'hb: out_r = 16'hc1c9;
                4'hc: out_r = 16'hc1c9;
                4'hd: out_r = 16'hc1c9;
                4'he: out_r = 16'hc1c9;
                4'hf: out_r = 16'hc1c9;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1c9;
            end
            3'h6: begin
              out_r = 16'hc1c8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c9;
                4'h1: out_r = 16'hc1c9;
                4'h2: out_r = 16'hc1c9;
                4'h3: out_r = 16'hc1c9;
                4'h4: out_r = 16'hc1c9;
                4'h5: out_r = 16'hc1c9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1c8;
            end
            default: begin end
          endcase
        end
        9'h05b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1c7;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c8;
                4'h1: out_r = 16'hc1c8;
                4'h2: out_r = 16'hc1c8;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1c6;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c7;
                4'h1: out_r = 16'hc1c7;
                4'h2: out_r = 16'hc1c7;
                4'h3: out_r = 16'hc1c7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1c5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c6;
                4'h1: out_r = 16'hc1c6;
                4'h2: out_r = 16'hc1c6;
                4'h3: out_r = 16'hc1c6;
                4'h4: out_r = 16'hc1c6;
                4'h5: out_r = 16'hc1c6;
                4'h6: out_r = 16'hc1c6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1c5;
              case (mant_lo4)
                4'he: out_r = 16'hc1c4;
                4'hf: out_r = 16'hc1c4;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1c4;
            end
            3'h5: begin
              out_r = 16'hc1c3;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c4;
                4'h1: out_r = 16'hc1c4;
                4'h2: out_r = 16'hc1c4;
                4'h3: out_r = 16'hc1c4;
                4'h4: out_r = 16'hc1c4;
                4'h5: out_r = 16'hc1c4;
                4'h6: out_r = 16'hc1c4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1c3;
            end
            3'h7: begin
              out_r = 16'hc1c2;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c3;
                4'h1: out_r = 16'hc1c3;
                4'h2: out_r = 16'hc1c3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1c2;
              case (mant_lo4)
                4'ha: out_r = 16'hc1c1;
                4'hb: out_r = 16'hc1c1;
                4'hc: out_r = 16'hc1c1;
                4'hd: out_r = 16'hc1c1;
                4'he: out_r = 16'hc1c1;
                4'hf: out_r = 16'hc1c1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1c1;
              case (mant_lo4)
                4'hc: out_r = 16'hc1c0;
                4'hd: out_r = 16'hc1c0;
                4'he: out_r = 16'hc1c0;
                4'hf: out_r = 16'hc1c0;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1c0;
            end
            3'h3: begin
              out_r = 16'hc1bf;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1bf;
              case (mant_lo4)
                4'h9: out_r = 16'hc1be;
                4'ha: out_r = 16'hc1be;
                4'hb: out_r = 16'hc1be;
                4'hc: out_r = 16'hc1be;
                4'hd: out_r = 16'hc1be;
                4'he: out_r = 16'hc1be;
                4'hf: out_r = 16'hc1be;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1be;
            end
            3'h6: begin
              out_r = 16'hc1bd;
              case (mant_lo4)
                4'h0: out_r = 16'hc1be;
                4'h1: out_r = 16'hc1be;
                4'h2: out_r = 16'hc1be;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1bd;
            end
            default: begin end
          endcase
        end
        9'h05d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1bc;
              case (mant_lo4)
                4'h0: out_r = 16'hc1bd;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1bb;
              case (mant_lo4)
                4'h0: out_r = 16'hc1bc;
                4'h1: out_r = 16'hc1bc;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1ba;
              case (mant_lo4)
                4'h0: out_r = 16'hc1bb;
                4'h1: out_r = 16'hc1bb;
                4'h2: out_r = 16'hc1bb;
                4'h3: out_r = 16'hc1bb;
                4'h4: out_r = 16'hc1bb;
                4'h5: out_r = 16'hc1bb;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1ba;
              case (mant_lo4)
                4'hc: out_r = 16'hc1b9;
                4'hd: out_r = 16'hc1b9;
                4'he: out_r = 16'hc1b9;
                4'hf: out_r = 16'hc1b9;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1b9;
            end
            3'h5: begin
              out_r = 16'hc1b8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b9;
                4'h1: out_r = 16'hc1b9;
                4'h2: out_r = 16'hc1b9;
                4'h3: out_r = 16'hc1b9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1b8;
            end
            3'h7: begin
              out_r = 16'hc1b7;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b8;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b7;
              case (mant_lo4)
                4'h9: out_r = 16'hc1b6;
                4'ha: out_r = 16'hc1b6;
                4'hb: out_r = 16'hc1b6;
                4'hc: out_r = 16'hc1b6;
                4'hd: out_r = 16'hc1b6;
                4'he: out_r = 16'hc1b6;
                4'hf: out_r = 16'hc1b6;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1b6;
              case (mant_lo4)
                4'hb: out_r = 16'hc1b5;
                4'hc: out_r = 16'hc1b5;
                4'hd: out_r = 16'hc1b5;
                4'he: out_r = 16'hc1b5;
                4'hf: out_r = 16'hc1b5;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1b5;
              case (mant_lo4)
                4'hf: out_r = 16'hc1b4;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1b4;
            end
            3'h4: begin
              out_r = 16'hc1b3;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b4;
                4'h1: out_r = 16'hc1b4;
                4'h2: out_r = 16'hc1b4;
                4'h3: out_r = 16'hc1b4;
                4'h4: out_r = 16'hc1b4;
                4'h5: out_r = 16'hc1b4;
                4'h6: out_r = 16'hc1b4;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1b3;
            end
            3'h6: begin
              out_r = 16'hc1b2;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1b2;
              case (mant_lo4)
                4'hf: out_r = 16'hc1b1;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b1;
            end
            3'h1: begin
              out_r = 16'hc1b0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1af;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b0;
                4'h1: out_r = 16'hc1b0;
                4'h2: out_r = 16'hc1b0;
                4'h3: out_r = 16'hc1b0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1af;
              case (mant_lo4)
                4'h9: out_r = 16'hc1ae;
                4'ha: out_r = 16'hc1ae;
                4'hb: out_r = 16'hc1ae;
                4'hc: out_r = 16'hc1ae;
                4'hd: out_r = 16'hc1ae;
                4'he: out_r = 16'hc1ae;
                4'hf: out_r = 16'hc1ae;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1ae;
            end
            3'h5: begin
              out_r = 16'hc1ad;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ae;
                4'h1: out_r = 16'hc1ae;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1ad;
              case (mant_lo4)
                4'he: out_r = 16'hc1ac;
                4'hf: out_r = 16'hc1ac;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1ac;
            end
            default: begin end
          endcase
        end
        9'h060: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ab;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ac;
                4'h1: out_r = 16'hc1ac;
                4'h2: out_r = 16'hc1ac;
                4'h3: out_r = 16'hc1ac;
                4'h4: out_r = 16'hc1ac;
                4'h5: out_r = 16'hc1ac;
                4'h6: out_r = 16'hc1ac;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1ab;
              case (mant_lo4)
                4'h9: out_r = 16'hc1aa;
                4'ha: out_r = 16'hc1aa;
                4'hb: out_r = 16'hc1aa;
                4'hc: out_r = 16'hc1aa;
                4'hd: out_r = 16'hc1aa;
                4'he: out_r = 16'hc1aa;
                4'hf: out_r = 16'hc1aa;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1aa;
              case (mant_lo4)
                4'hd: out_r = 16'hc1a9;
                4'he: out_r = 16'hc1a9;
                4'hf: out_r = 16'hc1a9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1a9;
            end
            3'h4: begin
              out_r = 16'hc1a8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a9;
                4'h1: out_r = 16'hc1a9;
                4'h2: out_r = 16'hc1a9;
                4'h3: out_r = 16'hc1a9;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1a8;
              case (mant_lo4)
                4'he: out_r = 16'hc1a7;
                4'hf: out_r = 16'hc1a7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1a7;
            end
            3'h7: begin
              out_r = 16'hc1a7;
              case (mant_lo4)
                4'hc: out_r = 16'hc1a6;
                4'hd: out_r = 16'hc1a6;
                4'he: out_r = 16'hc1a6;
                4'hf: out_r = 16'hc1a6;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h061: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1a6;
              case (mant_lo4)
                4'hf: out_r = 16'hc1a5;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1a5;
            end
            3'h2: begin
              out_r = 16'hc1a4;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a5;
                4'h1: out_r = 16'hc1a5;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1a3;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a4;
                4'h1: out_r = 16'hc1a4;
                4'h2: out_r = 16'hc1a4;
                4'h3: out_r = 16'hc1a4;
                4'h4: out_r = 16'hc1a4;
                4'h5: out_r = 16'hc1a4;
                4'h6: out_r = 16'hc1a4;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1a3;
            end
            3'h5: begin
              out_r = 16'hc1a2;
            end
            3'h6: begin
              out_r = 16'hc1a2;
              case (mant_lo4)
                4'hb: out_r = 16'hc1a1;
                4'hc: out_r = 16'hc1a1;
                4'hd: out_r = 16'hc1a1;
                4'he: out_r = 16'hc1a1;
                4'hf: out_r = 16'hc1a1;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1a1;
            end
            default: begin end
          endcase
        end
        9'h062: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1a0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a1;
                4'h1: out_r = 16'hc1a1;
                4'h2: out_r = 16'hc1a1;
                4'h3: out_r = 16'hc1a1;
                4'h4: out_r = 16'hc1a1;
                4'h5: out_r = 16'hc1a1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc19f;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a0;
                4'h1: out_r = 16'hc1a0;
                4'h2: out_r = 16'hc1a0;
                4'h3: out_r = 16'hc1a0;
                4'h4: out_r = 16'hc1a0;
                4'h5: out_r = 16'hc1a0;
                4'h6: out_r = 16'hc1a0;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc19f;
              case (mant_lo4)
                4'hb: out_r = 16'hc19e;
                4'hc: out_r = 16'hc19e;
                4'hd: out_r = 16'hc19e;
                4'he: out_r = 16'hc19e;
                4'hf: out_r = 16'hc19e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc19e;
            end
            3'h4: begin
              out_r = 16'hc19d;
              case (mant_lo4)
                4'h0: out_r = 16'hc19e;
                4'h1: out_r = 16'hc19e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc19d;
              case (mant_lo4)
                4'hc: out_r = 16'hc19c;
                4'hd: out_r = 16'hc19c;
                4'he: out_r = 16'hc19c;
                4'hf: out_r = 16'hc19c;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc19c;
            end
            3'h7: begin
              out_r = 16'hc19c;
              case (mant_lo4)
                4'h9: out_r = 16'hc19b;
                4'ha: out_r = 16'hc19b;
                4'hb: out_r = 16'hc19b;
                4'hc: out_r = 16'hc19b;
                4'hd: out_r = 16'hc19b;
                4'he: out_r = 16'hc19b;
                4'hf: out_r = 16'hc19b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h063: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc19b;
              case (mant_lo4)
                4'hd: out_r = 16'hc19a;
                4'he: out_r = 16'hc19a;
                4'hf: out_r = 16'hc19a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc19a;
            end
            3'h2: begin
              out_r = 16'hc199;
            end
            3'h3: begin
              out_r = 16'hc198;
              case (mant_lo4)
                4'h0: out_r = 16'hc199;
                4'h1: out_r = 16'hc199;
                4'h2: out_r = 16'hc199;
                4'h3: out_r = 16'hc199;
                4'h4: out_r = 16'hc199;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc198;
              case (mant_lo4)
                4'hd: out_r = 16'hc197;
                4'he: out_r = 16'hc197;
                4'hf: out_r = 16'hc197;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc197;
            end
            3'h6: begin
              out_r = 16'hc197;
              case (mant_lo4)
                4'h9: out_r = 16'hc196;
                4'ha: out_r = 16'hc196;
                4'hb: out_r = 16'hc196;
                4'hc: out_r = 16'hc196;
                4'hd: out_r = 16'hc196;
                4'he: out_r = 16'hc196;
                4'hf: out_r = 16'hc196;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc196;
            end
            default: begin end
          endcase
        end
        9'h064: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc195;
              case (mant_lo4)
                4'h0: out_r = 16'hc196;
                4'h1: out_r = 16'hc196;
                4'h2: out_r = 16'hc196;
                4'h3: out_r = 16'hc196;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc194;
              case (mant_lo4)
                4'h0: out_r = 16'hc195;
                4'h1: out_r = 16'hc195;
                4'h2: out_r = 16'hc195;
                4'h3: out_r = 16'hc195;
                4'h4: out_r = 16'hc195;
                4'h5: out_r = 16'hc195;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc194;
              case (mant_lo4)
                4'h9: out_r = 16'hc193;
                4'ha: out_r = 16'hc193;
                4'hb: out_r = 16'hc193;
                4'hc: out_r = 16'hc193;
                4'hd: out_r = 16'hc193;
                4'he: out_r = 16'hc193;
                4'hf: out_r = 16'hc193;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc193;
            end
            3'h4: begin
              out_r = 16'hc192;
            end
            3'h5: begin
              out_r = 16'hc192;
              case (mant_lo4)
                4'h9: out_r = 16'hc191;
                4'ha: out_r = 16'hc191;
                4'hb: out_r = 16'hc191;
                4'hc: out_r = 16'hc191;
                4'hd: out_r = 16'hc191;
                4'he: out_r = 16'hc191;
                4'hf: out_r = 16'hc191;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc191;
            end
            3'h7: begin
              out_r = 16'hc190;
              case (mant_lo4)
                4'h0: out_r = 16'hc191;
                4'h1: out_r = 16'hc191;
                4'h2: out_r = 16'hc191;
                4'h3: out_r = 16'hc191;
                4'h4: out_r = 16'hc191;
                4'h5: out_r = 16'hc191;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h065: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc190;
              case (mant_lo4)
                4'hc: out_r = 16'hc18f;
                4'hd: out_r = 16'hc18f;
                4'he: out_r = 16'hc18f;
                4'hf: out_r = 16'hc18f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc18f;
              case (mant_lo4)
                4'he: out_r = 16'hc18e;
                4'hf: out_r = 16'hc18e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc18e;
            end
            3'h3: begin
              out_r = 16'hc18d;
              case (mant_lo4)
                4'h0: out_r = 16'hc18e;
                4'h1: out_r = 16'hc18e;
                4'h2: out_r = 16'hc18e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc18d;
              case (mant_lo4)
                4'hb: out_r = 16'hc18c;
                4'hc: out_r = 16'hc18c;
                4'hd: out_r = 16'hc18c;
                4'he: out_r = 16'hc18c;
                4'hf: out_r = 16'hc18c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc18c;
            end
            3'h6: begin
              out_r = 16'hc18b;
              case (mant_lo4)
                4'h0: out_r = 16'hc18c;
                4'h1: out_r = 16'hc18c;
                4'h2: out_r = 16'hc18c;
                4'h3: out_r = 16'hc18c;
                4'h4: out_r = 16'hc18c;
                4'h5: out_r = 16'hc18c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc18b;
            end
            default: begin end
          endcase
        end
        9'h066: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc18a;
              case (mant_lo4)
                4'h0: out_r = 16'hc18b;
                4'h1: out_r = 16'hc18b;
                4'h2: out_r = 16'hc18b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc189;
              case (mant_lo4)
                4'h0: out_r = 16'hc18a;
                4'h1: out_r = 16'hc18a;
                4'h2: out_r = 16'hc18a;
                4'h3: out_r = 16'hc18a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc189;
              case (mant_lo4)
                4'h8: out_r = 16'hc188;
                4'h9: out_r = 16'hc188;
                4'ha: out_r = 16'hc188;
                4'hb: out_r = 16'hc188;
                4'hc: out_r = 16'hc188;
                4'hd: out_r = 16'hc188;
                4'he: out_r = 16'hc188;
                4'hf: out_r = 16'hc188;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc188;
              case (mant_lo4)
                4'he: out_r = 16'hc187;
                4'hf: out_r = 16'hc187;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc187;
            end
            3'h5: begin
              out_r = 16'hc186;
              case (mant_lo4)
                4'h0: out_r = 16'hc187;
                4'h1: out_r = 16'hc187;
                4'h2: out_r = 16'hc187;
                4'h3: out_r = 16'hc187;
                4'h4: out_r = 16'hc187;
                4'h5: out_r = 16'hc187;
                4'h6: out_r = 16'hc187;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc186;
            end
            3'h7: begin
              out_r = 16'hc185;
              case (mant_lo4)
                4'h0: out_r = 16'hc186;
                4'h1: out_r = 16'hc186;
                4'h2: out_r = 16'hc186;
                4'h3: out_r = 16'hc186;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h067: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc185;
              case (mant_lo4)
                4'ha: out_r = 16'hc184;
                4'hb: out_r = 16'hc184;
                4'hc: out_r = 16'hc184;
                4'hd: out_r = 16'hc184;
                4'he: out_r = 16'hc184;
                4'hf: out_r = 16'hc184;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc184;
              case (mant_lo4)
                4'hd: out_r = 16'hc183;
                4'he: out_r = 16'hc183;
                4'hf: out_r = 16'hc183;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc183;
            end
            3'h3: begin
              out_r = 16'hc182;
              case (mant_lo4)
                4'h0: out_r = 16'hc183;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc182;
              case (mant_lo4)
                4'h9: out_r = 16'hc181;
                4'ha: out_r = 16'hc181;
                4'hb: out_r = 16'hc181;
                4'hc: out_r = 16'hc181;
                4'hd: out_r = 16'hc181;
                4'he: out_r = 16'hc181;
                4'hf: out_r = 16'hc181;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc181;
            end
            3'h6: begin
              out_r = 16'hc180;
              case (mant_lo4)
                4'h0: out_r = 16'hc181;
                4'h1: out_r = 16'hc181;
                4'h2: out_r = 16'hc181;
                4'h3: out_r = 16'hc181;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc180;
              case (mant_lo4)
                4'ha: out_r = 16'hc17f;
                4'hb: out_r = 16'hc17f;
                4'hc: out_r = 16'hc17f;
                4'hd: out_r = 16'hc17f;
                4'he: out_r = 16'hc17f;
                4'hf: out_r = 16'hc17f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h068: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc17e;
              case (mant_lo4)
                4'h0: out_r = 16'hc17f;
                4'h1: out_r = 16'hc17f;
                4'h2: out_r = 16'hc17f;
                4'h3: out_r = 16'hc17f;
                4'h4: out_r = 16'hc17f;
                4'he: out_r = 16'hc17d;
                4'hf: out_r = 16'hc17d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc17c;
              case (mant_lo4)
                4'h0: out_r = 16'hc17d;
                4'h1: out_r = 16'hc17d;
                4'h2: out_r = 16'hc17d;
                4'h3: out_r = 16'hc17d;
                4'h4: out_r = 16'hc17d;
                4'h5: out_r = 16'hc17d;
                4'h6: out_r = 16'hc17d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc17b;
              case (mant_lo4)
                4'h0: out_r = 16'hc17c;
                4'hb: out_r = 16'hc17a;
                4'hc: out_r = 16'hc17a;
                4'hd: out_r = 16'hc17a;
                4'he: out_r = 16'hc17a;
                4'hf: out_r = 16'hc17a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc179;
              case (mant_lo4)
                4'h0: out_r = 16'hc17a;
                4'h1: out_r = 16'hc17a;
                4'h2: out_r = 16'hc17a;
                4'h3: out_r = 16'hc17a;
                4'h4: out_r = 16'hc17a;
                4'h5: out_r = 16'hc17a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc178;
              case (mant_lo4)
                4'h0: out_r = 16'hc179;
                4'h1: out_r = 16'hc179;
                4'he: out_r = 16'hc177;
                4'hf: out_r = 16'hc177;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc177;
              case (mant_lo4)
                4'hb: out_r = 16'hc176;
                4'hc: out_r = 16'hc176;
                4'hd: out_r = 16'hc176;
                4'he: out_r = 16'hc176;
                4'hf: out_r = 16'hc176;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc176;
              case (mant_lo4)
                4'h9: out_r = 16'hc175;
                4'ha: out_r = 16'hc175;
                4'hb: out_r = 16'hc175;
                4'hc: out_r = 16'hc175;
                4'hd: out_r = 16'hc175;
                4'he: out_r = 16'hc175;
                4'hf: out_r = 16'hc175;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc175;
              case (mant_lo4)
                4'h8: out_r = 16'hc174;
                4'h9: out_r = 16'hc174;
                4'ha: out_r = 16'hc174;
                4'hb: out_r = 16'hc174;
                4'hc: out_r = 16'hc174;
                4'hd: out_r = 16'hc174;
                4'he: out_r = 16'hc174;
                4'hf: out_r = 16'hc174;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h069: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc173;
              case (mant_lo4)
                4'h0: out_r = 16'hc174;
                4'h1: out_r = 16'hc174;
                4'h2: out_r = 16'hc174;
                4'h3: out_r = 16'hc174;
                4'hd: out_r = 16'hc172;
                4'he: out_r = 16'hc172;
                4'hf: out_r = 16'hc172;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc171;
              case (mant_lo4)
                4'h0: out_r = 16'hc172;
                4'h1: out_r = 16'hc172;
                4'h2: out_r = 16'hc172;
                4'h3: out_r = 16'hc172;
                4'h4: out_r = 16'hc172;
                4'h5: out_r = 16'hc172;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc170;
              case (mant_lo4)
                4'ha: out_r = 16'hc16f;
                4'hb: out_r = 16'hc16f;
                4'hc: out_r = 16'hc16f;
                4'hd: out_r = 16'hc16f;
                4'he: out_r = 16'hc16f;
                4'hf: out_r = 16'hc16f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc16e;
              case (mant_lo4)
                4'h0: out_r = 16'hc16f;
                4'h1: out_r = 16'hc16f;
                4'h2: out_r = 16'hc16f;
                4'h3: out_r = 16'hc16f;
                4'h4: out_r = 16'hc16f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc16d;
              case (mant_lo4)
                4'h0: out_r = 16'hc16e;
                4'hd: out_r = 16'hc16c;
                4'he: out_r = 16'hc16c;
                4'hf: out_r = 16'hc16c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc16c;
              case (mant_lo4)
                4'ha: out_r = 16'hc16b;
                4'hb: out_r = 16'hc16b;
                4'hc: out_r = 16'hc16b;
                4'hd: out_r = 16'hc16b;
                4'he: out_r = 16'hc16b;
                4'hf: out_r = 16'hc16b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc16b;
              case (mant_lo4)
                4'h8: out_r = 16'hc16a;
                4'h9: out_r = 16'hc16a;
                4'ha: out_r = 16'hc16a;
                4'hb: out_r = 16'hc16a;
                4'hc: out_r = 16'hc16a;
                4'hd: out_r = 16'hc16a;
                4'he: out_r = 16'hc16a;
                4'hf: out_r = 16'hc16a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc169;
              case (mant_lo4)
                4'h0: out_r = 16'hc16a;
                4'h1: out_r = 16'hc16a;
                4'h2: out_r = 16'hc16a;
                4'h3: out_r = 16'hc16a;
                4'h4: out_r = 16'hc16a;
                4'h5: out_r = 16'hc16a;
                4'h6: out_r = 16'hc16a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc168;
              case (mant_lo4)
                4'h0: out_r = 16'hc169;
                4'h1: out_r = 16'hc169;
                4'h2: out_r = 16'hc169;
                4'h3: out_r = 16'hc169;
                4'hc: out_r = 16'hc167;
                4'hd: out_r = 16'hc167;
                4'he: out_r = 16'hc167;
                4'hf: out_r = 16'hc167;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc166;
              case (mant_lo4)
                4'h0: out_r = 16'hc167;
                4'h1: out_r = 16'hc167;
                4'h2: out_r = 16'hc167;
                4'h3: out_r = 16'hc167;
                4'h4: out_r = 16'hc167;
                4'hf: out_r = 16'hc165;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc165;
              case (mant_lo4)
                4'h9: out_r = 16'hc164;
                4'ha: out_r = 16'hc164;
                4'hb: out_r = 16'hc164;
                4'hc: out_r = 16'hc164;
                4'hd: out_r = 16'hc164;
                4'he: out_r = 16'hc164;
                4'hf: out_r = 16'hc164;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc163;
              case (mant_lo4)
                4'h0: out_r = 16'hc164;
                4'h1: out_r = 16'hc164;
                4'h2: out_r = 16'hc164;
                4'h3: out_r = 16'hc164;
                4'hf: out_r = 16'hc162;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc162;
              case (mant_lo4)
                4'hc: out_r = 16'hc161;
                4'hd: out_r = 16'hc161;
                4'he: out_r = 16'hc161;
                4'hf: out_r = 16'hc161;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc161;
              case (mant_lo4)
                4'h9: out_r = 16'hc160;
                4'ha: out_r = 16'hc160;
                4'hb: out_r = 16'hc160;
                4'hc: out_r = 16'hc160;
                4'hd: out_r = 16'hc160;
                4'he: out_r = 16'hc160;
                4'hf: out_r = 16'hc160;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc15f;
              case (mant_lo4)
                4'h0: out_r = 16'hc160;
                4'h1: out_r = 16'hc160;
                4'h2: out_r = 16'hc160;
                4'h3: out_r = 16'hc160;
                4'h4: out_r = 16'hc160;
                4'h5: out_r = 16'hc160;
                4'h6: out_r = 16'hc160;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc15e;
              case (mant_lo4)
                4'h0: out_r = 16'hc15f;
                4'h1: out_r = 16'hc15f;
                4'h2: out_r = 16'hc15f;
                4'h3: out_r = 16'hc15f;
                4'h4: out_r = 16'hc15f;
                4'h5: out_r = 16'hc15f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc15d;
              case (mant_lo4)
                4'h0: out_r = 16'hc15e;
                4'h1: out_r = 16'hc15e;
                4'h2: out_r = 16'hc15e;
                4'hb: out_r = 16'hc15c;
                4'hc: out_r = 16'hc15c;
                4'hd: out_r = 16'hc15c;
                4'he: out_r = 16'hc15c;
                4'hf: out_r = 16'hc15c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc15b;
              case (mant_lo4)
                4'h0: out_r = 16'hc15c;
                4'h1: out_r = 16'hc15c;
                4'h2: out_r = 16'hc15c;
                4'h3: out_r = 16'hc15c;
                4'he: out_r = 16'hc15a;
                4'hf: out_r = 16'hc15a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc15a;
              case (mant_lo4)
                4'h8: out_r = 16'hc159;
                4'h9: out_r = 16'hc159;
                4'ha: out_r = 16'hc159;
                4'hb: out_r = 16'hc159;
                4'hc: out_r = 16'hc159;
                4'hd: out_r = 16'hc159;
                4'he: out_r = 16'hc159;
                4'hf: out_r = 16'hc159;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc158;
              case (mant_lo4)
                4'h0: out_r = 16'hc159;
                4'h1: out_r = 16'hc159;
                4'h2: out_r = 16'hc159;
                4'he: out_r = 16'hc157;
                4'hf: out_r = 16'hc157;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc157;
              case (mant_lo4)
                4'hb: out_r = 16'hc156;
                4'hc: out_r = 16'hc156;
                4'hd: out_r = 16'hc156;
                4'he: out_r = 16'hc156;
                4'hf: out_r = 16'hc156;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc156;
              case (mant_lo4)
                4'h8: out_r = 16'hc155;
                4'h9: out_r = 16'hc155;
                4'ha: out_r = 16'hc155;
                4'hb: out_r = 16'hc155;
                4'hc: out_r = 16'hc155;
                4'hd: out_r = 16'hc155;
                4'he: out_r = 16'hc155;
                4'hf: out_r = 16'hc155;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc154;
              case (mant_lo4)
                4'h0: out_r = 16'hc155;
                4'h1: out_r = 16'hc155;
                4'h2: out_r = 16'hc155;
                4'h3: out_r = 16'hc155;
                4'h4: out_r = 16'hc155;
                4'h5: out_r = 16'hc155;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc153;
              case (mant_lo4)
                4'h0: out_r = 16'hc154;
                4'h1: out_r = 16'hc154;
                4'h2: out_r = 16'hc154;
                4'h3: out_r = 16'hc154;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc152;
              case (mant_lo4)
                4'h0: out_r = 16'hc153;
                4'h1: out_r = 16'hc153;
                4'hb: out_r = 16'hc151;
                4'hc: out_r = 16'hc151;
                4'hd: out_r = 16'hc151;
                4'he: out_r = 16'hc151;
                4'hf: out_r = 16'hc151;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc150;
              case (mant_lo4)
                4'h0: out_r = 16'hc151;
                4'h1: out_r = 16'hc151;
                4'h2: out_r = 16'hc151;
                4'h3: out_r = 16'hc151;
                4'hd: out_r = 16'hc14f;
                4'he: out_r = 16'hc14f;
                4'hf: out_r = 16'hc14f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc14e;
              case (mant_lo4)
                4'h0: out_r = 16'hc14f;
                4'h1: out_r = 16'hc14f;
                4'h2: out_r = 16'hc14f;
                4'h3: out_r = 16'hc14f;
                4'h4: out_r = 16'hc14f;
                4'h5: out_r = 16'hc14f;
                4'h6: out_r = 16'hc14f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc14d;
              case (mant_lo4)
                4'h0: out_r = 16'hc14e;
                4'h1: out_r = 16'hc14e;
                4'hd: out_r = 16'hc14c;
                4'he: out_r = 16'hc14c;
                4'hf: out_r = 16'hc14c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc14c;
              case (mant_lo4)
                4'h9: out_r = 16'hc14b;
                4'ha: out_r = 16'hc14b;
                4'hb: out_r = 16'hc14b;
                4'hc: out_r = 16'hc14b;
                4'hd: out_r = 16'hc14b;
                4'he: out_r = 16'hc14b;
                4'hf: out_r = 16'hc14b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc14a;
              case (mant_lo4)
                4'h0: out_r = 16'hc14b;
                4'h1: out_r = 16'hc14b;
                4'h2: out_r = 16'hc14b;
                4'h3: out_r = 16'hc14b;
                4'h4: out_r = 16'hc14b;
                4'h5: out_r = 16'hc14b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc149;
              case (mant_lo4)
                4'h0: out_r = 16'hc14a;
                4'h1: out_r = 16'hc14a;
                4'h2: out_r = 16'hc14a;
                4'h3: out_r = 16'hc14a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc148;
              case (mant_lo4)
                4'h0: out_r = 16'hc149;
                4'h1: out_r = 16'hc149;
                4'h2: out_r = 16'hc149;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc147;
              case (mant_lo4)
                4'h0: out_r = 16'hc148;
                4'h1: out_r = 16'hc148;
                4'ha: out_r = 16'hc146;
                4'hb: out_r = 16'hc146;
                4'hc: out_r = 16'hc146;
                4'hd: out_r = 16'hc146;
                4'he: out_r = 16'hc146;
                4'hf: out_r = 16'hc146;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc145;
              case (mant_lo4)
                4'h0: out_r = 16'hc146;
                4'h1: out_r = 16'hc146;
                4'h2: out_r = 16'hc146;
                4'hc: out_r = 16'hc144;
                4'hd: out_r = 16'hc144;
                4'he: out_r = 16'hc144;
                4'hf: out_r = 16'hc144;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc143;
              case (mant_lo4)
                4'h0: out_r = 16'hc144;
                4'h1: out_r = 16'hc144;
                4'h2: out_r = 16'hc144;
                4'h3: out_r = 16'hc144;
                4'h4: out_r = 16'hc144;
                4'h5: out_r = 16'hc144;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc142;
              case (mant_lo4)
                4'h0: out_r = 16'hc143;
                4'hc: out_r = 16'hc141;
                4'hd: out_r = 16'hc141;
                4'he: out_r = 16'hc141;
                4'hf: out_r = 16'hc141;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc141;
              case (mant_lo4)
                4'h8: out_r = 16'hc140;
                4'h9: out_r = 16'hc140;
                4'ha: out_r = 16'hc140;
                4'hb: out_r = 16'hc140;
                4'hc: out_r = 16'hc140;
                4'hd: out_r = 16'hc140;
                4'he: out_r = 16'hc140;
                4'hf: out_r = 16'hc140;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc13f;
              case (mant_lo4)
                4'h0: out_r = 16'hc140;
                4'h1: out_r = 16'hc140;
                4'h2: out_r = 16'hc140;
                4'h3: out_r = 16'hc140;
                4'h4: out_r = 16'hc140;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc13e;
              case (mant_lo4)
                4'h0: out_r = 16'hc13f;
                4'h1: out_r = 16'hc13f;
                4'h2: out_r = 16'hc13f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc13d;
              case (mant_lo4)
                4'h0: out_r = 16'hc13e;
                4'h1: out_r = 16'hc13e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc13c;
              case (mant_lo4)
                4'h0: out_r = 16'hc13d;
                4'h9: out_r = 16'hc13b;
                4'ha: out_r = 16'hc13b;
                4'hb: out_r = 16'hc13b;
                4'hc: out_r = 16'hc13b;
                4'hd: out_r = 16'hc13b;
                4'he: out_r = 16'hc13b;
                4'hf: out_r = 16'hc13b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc13a;
              case (mant_lo4)
                4'h0: out_r = 16'hc13b;
                4'h1: out_r = 16'hc13b;
                4'hb: out_r = 16'hc139;
                4'hc: out_r = 16'hc139;
                4'hd: out_r = 16'hc139;
                4'he: out_r = 16'hc139;
                4'hf: out_r = 16'hc139;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc138;
              case (mant_lo4)
                4'h0: out_r = 16'hc139;
                4'h1: out_r = 16'hc139;
                4'h2: out_r = 16'hc139;
                4'h3: out_r = 16'hc139;
                4'h4: out_r = 16'hc139;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc137;
              case (mant_lo4)
                4'hb: out_r = 16'hc136;
                4'hc: out_r = 16'hc136;
                4'hd: out_r = 16'hc136;
                4'he: out_r = 16'hc136;
                4'hf: out_r = 16'hc136;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc135;
              case (mant_lo4)
                4'h0: out_r = 16'hc136;
                4'h1: out_r = 16'hc136;
                4'h2: out_r = 16'hc136;
                4'h3: out_r = 16'hc136;
                4'h4: out_r = 16'hc136;
                4'h5: out_r = 16'hc136;
                4'h6: out_r = 16'hc136;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc134;
              case (mant_lo4)
                4'h0: out_r = 16'hc135;
                4'h1: out_r = 16'hc135;
                4'h2: out_r = 16'hc135;
                4'h3: out_r = 16'hc135;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc133;
              case (mant_lo4)
                4'h0: out_r = 16'hc134;
                4'h1: out_r = 16'hc134;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc132;
            end
            default: begin end
          endcase
        end
        9'h06f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc131;
              case (mant_lo4)
                4'h8: out_r = 16'hc130;
                4'h9: out_r = 16'hc130;
                4'ha: out_r = 16'hc130;
                4'hb: out_r = 16'hc130;
                4'hc: out_r = 16'hc130;
                4'hd: out_r = 16'hc130;
                4'he: out_r = 16'hc130;
                4'hf: out_r = 16'hc130;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc12f;
              case (mant_lo4)
                4'h0: out_r = 16'hc130;
                4'ha: out_r = 16'hc12e;
                4'hb: out_r = 16'hc12e;
                4'hc: out_r = 16'hc12e;
                4'hd: out_r = 16'hc12e;
                4'he: out_r = 16'hc12e;
                4'hf: out_r = 16'hc12e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc12d;
              case (mant_lo4)
                4'h0: out_r = 16'hc12e;
                4'h1: out_r = 16'hc12e;
                4'h2: out_r = 16'hc12e;
                4'h3: out_r = 16'hc12e;
                4'hf: out_r = 16'hc12c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc12c;
              case (mant_lo4)
                4'ha: out_r = 16'hc12b;
                4'hb: out_r = 16'hc12b;
                4'hc: out_r = 16'hc12b;
                4'hd: out_r = 16'hc12b;
                4'he: out_r = 16'hc12b;
                4'hf: out_r = 16'hc12b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc12a;
              case (mant_lo4)
                4'h0: out_r = 16'hc12b;
                4'h1: out_r = 16'hc12b;
                4'h2: out_r = 16'hc12b;
                4'h3: out_r = 16'hc12b;
                4'h4: out_r = 16'hc12b;
                4'h5: out_r = 16'hc12b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc129;
              case (mant_lo4)
                4'h0: out_r = 16'hc12a;
                4'h1: out_r = 16'hc12a;
                4'h2: out_r = 16'hc12a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc128;
              case (mant_lo4)
                4'hf: out_r = 16'hc127;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc127;
              case (mant_lo4)
                4'he: out_r = 16'hc126;
                4'hf: out_r = 16'hc126;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h070: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc126;
              case (mant_lo4)
                4'h8: out_r = 16'hc125;
                4'h9: out_r = 16'hc125;
                4'ha: out_r = 16'hc125;
                4'hb: out_r = 16'hc125;
                4'hc: out_r = 16'hc125;
                4'hd: out_r = 16'hc125;
                4'he: out_r = 16'hc125;
                4'hf: out_r = 16'hc125;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc124;
              case (mant_lo4)
                4'ha: out_r = 16'hc123;
                4'hb: out_r = 16'hc123;
                4'hc: out_r = 16'hc123;
                4'hd: out_r = 16'hc123;
                4'he: out_r = 16'hc123;
                4'hf: out_r = 16'hc123;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc122;
              case (mant_lo4)
                4'h0: out_r = 16'hc123;
                4'h1: out_r = 16'hc123;
                4'h2: out_r = 16'hc123;
                4'he: out_r = 16'hc121;
                4'hf: out_r = 16'hc121;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc121;
              case (mant_lo4)
                4'h9: out_r = 16'hc120;
                4'ha: out_r = 16'hc120;
                4'hb: out_r = 16'hc120;
                4'hc: out_r = 16'hc120;
                4'hd: out_r = 16'hc120;
                4'he: out_r = 16'hc120;
                4'hf: out_r = 16'hc120;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc11f;
              case (mant_lo4)
                4'h0: out_r = 16'hc120;
                4'h1: out_r = 16'hc120;
                4'h2: out_r = 16'hc120;
                4'h3: out_r = 16'hc120;
                4'h4: out_r = 16'hc120;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc11e;
              case (mant_lo4)
                4'h0: out_r = 16'hc11f;
                4'h1: out_r = 16'hc11f;
                4'hf: out_r = 16'hc11d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc11d;
              case (mant_lo4)
                4'hd: out_r = 16'hc11c;
                4'he: out_r = 16'hc11c;
                4'hf: out_r = 16'hc11c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc11c;
              case (mant_lo4)
                4'hd: out_r = 16'hc11b;
                4'he: out_r = 16'hc11b;
                4'hf: out_r = 16'hc11b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h071: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc11a;
              case (mant_lo4)
                4'h0: out_r = 16'hc11b;
                4'h1: out_r = 16'hc11b;
                4'h2: out_r = 16'hc11b;
                4'h3: out_r = 16'hc11b;
                4'h4: out_r = 16'hc11b;
                4'h5: out_r = 16'hc11b;
                4'h6: out_r = 16'hc11b;
                4'hf: out_r = 16'hc119;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc119;
              case (mant_lo4)
                4'h9: out_r = 16'hc118;
                4'ha: out_r = 16'hc118;
                4'hb: out_r = 16'hc118;
                4'hc: out_r = 16'hc118;
                4'hd: out_r = 16'hc118;
                4'he: out_r = 16'hc118;
                4'hf: out_r = 16'hc118;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc117;
              case (mant_lo4)
                4'h0: out_r = 16'hc118;
                4'h1: out_r = 16'hc118;
                4'hd: out_r = 16'hc116;
                4'he: out_r = 16'hc116;
                4'hf: out_r = 16'hc116;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc116;
              case (mant_lo4)
                4'h8: out_r = 16'hc115;
                4'h9: out_r = 16'hc115;
                4'ha: out_r = 16'hc115;
                4'hb: out_r = 16'hc115;
                4'hc: out_r = 16'hc115;
                4'hd: out_r = 16'hc115;
                4'he: out_r = 16'hc115;
                4'hf: out_r = 16'hc115;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc114;
              case (mant_lo4)
                4'h0: out_r = 16'hc115;
                4'h1: out_r = 16'hc115;
                4'h2: out_r = 16'hc115;
                4'h3: out_r = 16'hc115;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc113;
              case (mant_lo4)
                4'he: out_r = 16'hc112;
                4'hf: out_r = 16'hc112;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc112;
              case (mant_lo4)
                4'hc: out_r = 16'hc111;
                4'hd: out_r = 16'hc111;
                4'he: out_r = 16'hc111;
                4'hf: out_r = 16'hc111;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc111;
              case (mant_lo4)
                4'hb: out_r = 16'hc110;
                4'hc: out_r = 16'hc110;
                4'hd: out_r = 16'hc110;
                4'he: out_r = 16'hc110;
                4'hf: out_r = 16'hc110;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h072: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc10f;
              case (mant_lo4)
                4'h0: out_r = 16'hc110;
                4'h1: out_r = 16'hc110;
                4'h2: out_r = 16'hc110;
                4'h3: out_r = 16'hc110;
                4'h4: out_r = 16'hc110;
                4'h5: out_r = 16'hc110;
                4'hf: out_r = 16'hc10e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc10e;
              case (mant_lo4)
                4'h8: out_r = 16'hc10d;
                4'h9: out_r = 16'hc10d;
                4'ha: out_r = 16'hc10d;
                4'hb: out_r = 16'hc10d;
                4'hc: out_r = 16'hc10d;
                4'hd: out_r = 16'hc10d;
                4'he: out_r = 16'hc10d;
                4'hf: out_r = 16'hc10d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc10c;
              case (mant_lo4)
                4'h0: out_r = 16'hc10d;
                4'h1: out_r = 16'hc10d;
                4'hc: out_r = 16'hc10b;
                4'hd: out_r = 16'hc10b;
                4'he: out_r = 16'hc10b;
                4'hf: out_r = 16'hc10b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc10a;
              case (mant_lo4)
                4'h0: out_r = 16'hc10b;
                4'h1: out_r = 16'hc10b;
                4'h2: out_r = 16'hc10b;
                4'h3: out_r = 16'hc10b;
                4'h4: out_r = 16'hc10b;
                4'h5: out_r = 16'hc10b;
                4'h6: out_r = 16'hc10b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc109;
              case (mant_lo4)
                4'h0: out_r = 16'hc10a;
                4'h1: out_r = 16'hc10a;
                4'h2: out_r = 16'hc10a;
                4'hf: out_r = 16'hc108;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc108;
              case (mant_lo4)
                4'hd: out_r = 16'hc107;
                4'he: out_r = 16'hc107;
                4'hf: out_r = 16'hc107;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc107;
              case (mant_lo4)
                4'hb: out_r = 16'hc106;
                4'hc: out_r = 16'hc106;
                4'hd: out_r = 16'hc106;
                4'he: out_r = 16'hc106;
                4'hf: out_r = 16'hc106;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc106;
              case (mant_lo4)
                4'ha: out_r = 16'hc105;
                4'hb: out_r = 16'hc105;
                4'hc: out_r = 16'hc105;
                4'hd: out_r = 16'hc105;
                4'he: out_r = 16'hc105;
                4'hf: out_r = 16'hc105;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h073: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc104;
              case (mant_lo4)
                4'h0: out_r = 16'hc105;
                4'h1: out_r = 16'hc105;
                4'h2: out_r = 16'hc105;
                4'h3: out_r = 16'hc105;
                4'h4: out_r = 16'hc105;
                4'he: out_r = 16'hc103;
                4'hf: out_r = 16'hc103;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc102;
              case (mant_lo4)
                4'h0: out_r = 16'hc103;
                4'h1: out_r = 16'hc103;
                4'h2: out_r = 16'hc103;
                4'h3: out_r = 16'hc103;
                4'h4: out_r = 16'hc103;
                4'h5: out_r = 16'hc103;
                4'h6: out_r = 16'hc103;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc101;
              case (mant_lo4)
                4'h0: out_r = 16'hc102;
                4'hb: out_r = 16'hc100;
                4'hc: out_r = 16'hc100;
                4'hd: out_r = 16'hc100;
                4'he: out_r = 16'hc100;
                4'hf: out_r = 16'hc100;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0ff;
              case (mant_lo4)
                4'h0: out_r = 16'hc100;
                4'h1: out_r = 16'hc100;
                4'h2: out_r = 16'hc100;
                4'h9: out_r = 16'hc0fe;
                4'ha: out_r = 16'hc0fe;
                4'hb: out_r = 16'hc0fe;
                4'hc: out_r = 16'hc0fe;
                4'hd: out_r = 16'hc0fe;
                4'he: out_r = 16'hc0fe;
                4'hf: out_r = 16'hc0fd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0fc;
              case (mant_lo4)
                4'h0: out_r = 16'hc0fd;
                4'h1: out_r = 16'hc0fd;
                4'h2: out_r = 16'hc0fd;
                4'h3: out_r = 16'hc0fd;
                4'h4: out_r = 16'hc0fd;
                4'hb: out_r = 16'hc0fb;
                4'hc: out_r = 16'hc0fb;
                4'hd: out_r = 16'hc0fb;
                4'he: out_r = 16'hc0fb;
                4'hf: out_r = 16'hc0fb;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0fa;
              case (mant_lo4)
                4'h0: out_r = 16'hc0fb;
                4'h8: out_r = 16'hc0f9;
                4'h9: out_r = 16'hc0f9;
                4'ha: out_r = 16'hc0f9;
                4'hb: out_r = 16'hc0f9;
                4'hc: out_r = 16'hc0f9;
                4'hd: out_r = 16'hc0f9;
                4'he: out_r = 16'hc0f9;
                4'hf: out_r = 16'hc0f8;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0f7;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f8;
                4'h1: out_r = 16'hc0f8;
                4'h2: out_r = 16'hc0f8;
                4'h3: out_r = 16'hc0f8;
                4'h4: out_r = 16'hc0f8;
                4'h5: out_r = 16'hc0f8;
                4'hd: out_r = 16'hc0f6;
                4'he: out_r = 16'hc0f6;
                4'hf: out_r = 16'hc0f6;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0f5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f6;
                4'h1: out_r = 16'hc0f6;
                4'h2: out_r = 16'hc0f6;
                4'h3: out_r = 16'hc0f6;
                4'h4: out_r = 16'hc0f6;
                4'hc: out_r = 16'hc0f4;
                4'hd: out_r = 16'hc0f4;
                4'he: out_r = 16'hc0f4;
                4'hf: out_r = 16'hc0f4;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h074: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0f3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f4;
                4'h1: out_r = 16'hc0f4;
                4'h7: out_r = 16'hc0f2;
                4'h8: out_r = 16'hc0f2;
                4'h9: out_r = 16'hc0f2;
                4'ha: out_r = 16'hc0f2;
                4'hb: out_r = 16'hc0f1;
                4'hc: out_r = 16'hc0f1;
                4'hd: out_r = 16'hc0f1;
                4'he: out_r = 16'hc0f1;
                4'hf: out_r = 16'hc0f0;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0ee;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f0;
                4'h1: out_r = 16'hc0f0;
                4'h2: out_r = 16'hc0f0;
                4'h3: out_r = 16'hc0f0;
                4'h4: out_r = 16'hc0ef;
                4'h5: out_r = 16'hc0ef;
                4'h6: out_r = 16'hc0ef;
                4'h7: out_r = 16'hc0ef;
                4'hd: out_r = 16'hc0ed;
                4'he: out_r = 16'hc0ed;
                4'hf: out_r = 16'hc0ed;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0eb;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ed;
                4'h1: out_r = 16'hc0ed;
                4'h2: out_r = 16'hc0ec;
                4'h3: out_r = 16'hc0ec;
                4'h4: out_r = 16'hc0ec;
                4'h5: out_r = 16'hc0ec;
                4'h6: out_r = 16'hc0ec;
                4'hd: out_r = 16'hc0ea;
                4'he: out_r = 16'hc0ea;
                4'hf: out_r = 16'hc0ea;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0e9;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ea;
                4'h1: out_r = 16'hc0ea;
                4'h8: out_r = 16'hc0e8;
                4'h9: out_r = 16'hc0e8;
                4'ha: out_r = 16'hc0e8;
                4'hb: out_r = 16'hc0e8;
                4'hc: out_r = 16'hc0e8;
                4'hd: out_r = 16'hc0e8;
                4'he: out_r = 16'hc0e7;
                4'hf: out_r = 16'hc0e7;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0e6;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e7;
                4'h1: out_r = 16'hc0e7;
                4'h2: out_r = 16'hc0e7;
                4'h3: out_r = 16'hc0e7;
                4'ha: out_r = 16'hc0e5;
                4'hb: out_r = 16'hc0e5;
                4'hc: out_r = 16'hc0e5;
                4'hd: out_r = 16'hc0e5;
                4'he: out_r = 16'hc0e5;
                4'hf: out_r = 16'hc0e5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0e4;
              case (mant_lo4)
                4'h7: out_r = 16'hc0e3;
                4'h8: out_r = 16'hc0e3;
                4'h9: out_r = 16'hc0e3;
                4'ha: out_r = 16'hc0e3;
                4'hb: out_r = 16'hc0e3;
                4'hc: out_r = 16'hc0e3;
                4'hd: out_r = 16'hc0e3;
                4'he: out_r = 16'hc0e2;
                4'hf: out_r = 16'hc0e2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0e1;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e2;
                4'h1: out_r = 16'hc0e2;
                4'h2: out_r = 16'hc0e2;
                4'h3: out_r = 16'hc0e2;
                4'h4: out_r = 16'hc0e2;
                4'hc: out_r = 16'hc0e0;
                4'hd: out_r = 16'hc0e0;
                4'he: out_r = 16'hc0e0;
                4'hf: out_r = 16'hc0e0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0df;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e0;
                4'h1: out_r = 16'hc0e0;
                4'h2: out_r = 16'hc0e0;
                4'hb: out_r = 16'hc0de;
                4'hc: out_r = 16'hc0de;
                4'hd: out_r = 16'hc0de;
                4'he: out_r = 16'hc0de;
                4'hf: out_r = 16'hc0de;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h075: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0dd;
              case (mant_lo4)
                4'h0: out_r = 16'hc0de;
                4'h1: out_r = 16'hc0de;
                4'h6: out_r = 16'hc0dc;
                4'h7: out_r = 16'hc0dc;
                4'h8: out_r = 16'hc0dc;
                4'h9: out_r = 16'hc0dc;
                4'ha: out_r = 16'hc0db;
                4'hb: out_r = 16'hc0db;
                4'hc: out_r = 16'hc0db;
                4'hd: out_r = 16'hc0db;
                4'he: out_r = 16'hc0da;
                4'hf: out_r = 16'hc0da;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0d9;
              case (mant_lo4)
                4'h0: out_r = 16'hc0da;
                4'h1: out_r = 16'hc0da;
                4'h2: out_r = 16'hc0da;
                4'h8: out_r = 16'hc0d8;
                4'h9: out_r = 16'hc0d8;
                4'ha: out_r = 16'hc0d8;
                4'hb: out_r = 16'hc0d8;
                4'hc: out_r = 16'hc0d7;
                4'hd: out_r = 16'hc0d7;
                4'he: out_r = 16'hc0d7;
                4'hf: out_r = 16'hc0d7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0d5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d7;
                4'h1: out_r = 16'hc0d6;
                4'h2: out_r = 16'hc0d6;
                4'h3: out_r = 16'hc0d6;
                4'h4: out_r = 16'hc0d6;
                4'h5: out_r = 16'hc0d6;
                4'hc: out_r = 16'hc0d4;
                4'hd: out_r = 16'hc0d4;
                4'he: out_r = 16'hc0d4;
                4'hf: out_r = 16'hc0d4;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0d3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d4;
                4'h7: out_r = 16'hc0d2;
                4'h8: out_r = 16'hc0d2;
                4'h9: out_r = 16'hc0d2;
                4'ha: out_r = 16'hc0d2;
                4'hb: out_r = 16'hc0d2;
                4'hc: out_r = 16'hc0d2;
                4'hd: out_r = 16'hc0d1;
                4'he: out_r = 16'hc0d1;
                4'hf: out_r = 16'hc0d1;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0d0;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d1;
                4'h1: out_r = 16'hc0d1;
                4'h2: out_r = 16'hc0d1;
                4'h9: out_r = 16'hc0cf;
                4'ha: out_r = 16'hc0cf;
                4'hb: out_r = 16'hc0cf;
                4'hc: out_r = 16'hc0cf;
                4'hd: out_r = 16'hc0cf;
                4'he: out_r = 16'hc0cf;
                4'hf: out_r = 16'hc0ce;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0ce;
              case (mant_lo4)
                4'h6: out_r = 16'hc0cd;
                4'h7: out_r = 16'hc0cd;
                4'h8: out_r = 16'hc0cd;
                4'h9: out_r = 16'hc0cd;
                4'ha: out_r = 16'hc0cd;
                4'hb: out_r = 16'hc0cd;
                4'hc: out_r = 16'hc0cc;
                4'hd: out_r = 16'hc0cc;
                4'he: out_r = 16'hc0cc;
                4'hf: out_r = 16'hc0cc;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0cb;
              case (mant_lo4)
                4'h0: out_r = 16'hc0cc;
                4'h1: out_r = 16'hc0cc;
                4'h2: out_r = 16'hc0cc;
                4'hb: out_r = 16'hc0ca;
                4'hc: out_r = 16'hc0ca;
                4'hd: out_r = 16'hc0ca;
                4'he: out_r = 16'hc0ca;
                4'hf: out_r = 16'hc0ca;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0c9;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ca;
                4'h1: out_r = 16'hc0ca;
                4'ha: out_r = 16'hc0c8;
                4'hb: out_r = 16'hc0c8;
                4'hc: out_r = 16'hc0c8;
                4'hd: out_r = 16'hc0c8;
                4'he: out_r = 16'hc0c8;
                4'hf: out_r = 16'hc0c8;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h076: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0c5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c8;
                4'h1: out_r = 16'hc0c7;
                4'h2: out_r = 16'hc0c7;
                4'h3: out_r = 16'hc0c7;
                4'h4: out_r = 16'hc0c7;
                4'h5: out_r = 16'hc0c6;
                4'h6: out_r = 16'hc0c6;
                4'h7: out_r = 16'hc0c6;
                4'h8: out_r = 16'hc0c6;
                4'he: out_r = 16'hc0c4;
                4'hf: out_r = 16'hc0c4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0c3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c4;
                4'h1: out_r = 16'hc0c4;
                4'h7: out_r = 16'hc0c2;
                4'h8: out_r = 16'hc0c2;
                4'h9: out_r = 16'hc0c2;
                4'ha: out_r = 16'hc0c2;
                4'hb: out_r = 16'hc0c2;
                4'hc: out_r = 16'hc0c1;
                4'hd: out_r = 16'hc0c1;
                4'he: out_r = 16'hc0c1;
                4'hf: out_r = 16'hc0c1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0c0;
              case (mant_lo4)
                4'h6: out_r = 16'hc0bf;
                4'h7: out_r = 16'hc0bf;
                4'h8: out_r = 16'hc0bf;
                4'h9: out_r = 16'hc0bf;
                4'ha: out_r = 16'hc0bf;
                4'hb: out_r = 16'hc0be;
                4'hc: out_r = 16'hc0be;
                4'hd: out_r = 16'hc0be;
                4'he: out_r = 16'hc0be;
                4'hf: out_r = 16'hc0be;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0bd;
              case (mant_lo4)
                4'h6: out_r = 16'hc0bc;
                4'h7: out_r = 16'hc0bc;
                4'h8: out_r = 16'hc0bc;
                4'h9: out_r = 16'hc0bc;
                4'ha: out_r = 16'hc0bc;
                4'hb: out_r = 16'hc0bb;
                4'hc: out_r = 16'hc0bb;
                4'hd: out_r = 16'hc0bb;
                4'he: out_r = 16'hc0bb;
                4'hf: out_r = 16'hc0bb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0ba;
              case (mant_lo4)
                4'h0: out_r = 16'hc0bb;
                4'h8: out_r = 16'hc0b9;
                4'h9: out_r = 16'hc0b9;
                4'ha: out_r = 16'hc0b9;
                4'hb: out_r = 16'hc0b9;
                4'hc: out_r = 16'hc0b9;
                4'hd: out_r = 16'hc0b9;
                4'he: out_r = 16'hc0b8;
                4'hf: out_r = 16'hc0b8;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0b7;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b8;
                4'h1: out_r = 16'hc0b8;
                4'h2: out_r = 16'hc0b8;
                4'h3: out_r = 16'hc0b8;
                4'hb: out_r = 16'hc0b6;
                4'hc: out_r = 16'hc0b6;
                4'hd: out_r = 16'hc0b6;
                4'he: out_r = 16'hc0b6;
                4'hf: out_r = 16'hc0b6;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0b5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b6;
                4'h1: out_r = 16'hc0b6;
                4'h9: out_r = 16'hc0b4;
                4'ha: out_r = 16'hc0b4;
                4'hb: out_r = 16'hc0b4;
                4'hc: out_r = 16'hc0b4;
                4'hd: out_r = 16'hc0b4;
                4'he: out_r = 16'hc0b4;
                4'hf: out_r = 16'hc0b4;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0b2;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b4;
                4'h1: out_r = 16'hc0b3;
                4'h2: out_r = 16'hc0b3;
                4'h3: out_r = 16'hc0b3;
                4'h4: out_r = 16'hc0b3;
                4'h5: out_r = 16'hc0b3;
                4'h6: out_r = 16'hc0b3;
                4'h7: out_r = 16'hc0b3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h077: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0b0;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b1;
                4'h1: out_r = 16'hc0b1;
                4'h2: out_r = 16'hc0b1;
                4'h3: out_r = 16'hc0b1;
                4'h9: out_r = 16'hc0af;
                4'ha: out_r = 16'hc0af;
                4'hb: out_r = 16'hc0af;
                4'hc: out_r = 16'hc0af;
                4'hd: out_r = 16'hc0ae;
                4'he: out_r = 16'hc0ae;
                4'hf: out_r = 16'hc0ae;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0ad;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ae;
                4'h6: out_r = 16'hc0ac;
                4'h7: out_r = 16'hc0ac;
                4'h8: out_r = 16'hc0ac;
                4'h9: out_r = 16'hc0ac;
                4'ha: out_r = 16'hc0ac;
                4'hb: out_r = 16'hc0ab;
                4'hc: out_r = 16'hc0ab;
                4'hd: out_r = 16'hc0ab;
                4'he: out_r = 16'hc0ab;
                4'hf: out_r = 16'hc0ab;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0aa;
              case (mant_lo4)
                4'h5: out_r = 16'hc0a9;
                4'h6: out_r = 16'hc0a9;
                4'h7: out_r = 16'hc0a9;
                4'h8: out_r = 16'hc0a9;
                4'h9: out_r = 16'hc0a9;
                4'ha: out_r = 16'hc0a8;
                4'hb: out_r = 16'hc0a8;
                4'hc: out_r = 16'hc0a8;
                4'hd: out_r = 16'hc0a8;
                4'he: out_r = 16'hc0a8;
                4'hf: out_r = 16'hc0a7;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0a5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a7;
                4'h1: out_r = 16'hc0a7;
                4'h2: out_r = 16'hc0a7;
                4'h3: out_r = 16'hc0a7;
                4'h4: out_r = 16'hc0a7;
                4'h5: out_r = 16'hc0a6;
                4'h6: out_r = 16'hc0a6;
                4'h7: out_r = 16'hc0a6;
                4'h8: out_r = 16'hc0a6;
                4'h9: out_r = 16'hc0a6;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0a3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a4;
                4'h1: out_r = 16'hc0a4;
                4'h2: out_r = 16'hc0a4;
                4'h3: out_r = 16'hc0a4;
                4'h4: out_r = 16'hc0a4;
                4'h5: out_r = 16'hc0a4;
                4'hd: out_r = 16'hc0a2;
                4'he: out_r = 16'hc0a2;
                4'hf: out_r = 16'hc0a2;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0a1;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a2;
                4'h1: out_r = 16'hc0a2;
                4'h2: out_r = 16'hc0a2;
                4'ha: out_r = 16'hc0a0;
                4'hb: out_r = 16'hc0a0;
                4'hc: out_r = 16'hc0a0;
                4'hd: out_r = 16'hc0a0;
                4'he: out_r = 16'hc0a0;
                4'hf: out_r = 16'hc0a0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc09f;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a0;
                4'h8: out_r = 16'hc09e;
                4'h9: out_r = 16'hc09e;
                4'ha: out_r = 16'hc09e;
                4'hb: out_r = 16'hc09e;
                4'hc: out_r = 16'hc09e;
                4'hd: out_r = 16'hc09e;
                4'he: out_r = 16'hc09e;
                4'hf: out_r = 16'hc09d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc09c;
              case (mant_lo4)
                4'h0: out_r = 16'hc09d;
                4'h1: out_r = 16'hc09d;
                4'h2: out_r = 16'hc09d;
                4'h3: out_r = 16'hc09d;
                4'h4: out_r = 16'hc09d;
                4'h5: out_r = 16'hc09d;
                4'h6: out_r = 16'hc09d;
                4'hf: out_r = 16'hc09b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h078: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc09b;
              case (mant_lo4)
                4'h4: out_r = 16'hc09a;
                4'h5: out_r = 16'hc09a;
                4'h6: out_r = 16'hc09a;
                4'h7: out_r = 16'hc09a;
                4'h8: out_r = 16'hc099;
                4'h9: out_r = 16'hc099;
                4'ha: out_r = 16'hc099;
                4'hb: out_r = 16'hc099;
                4'hc: out_r = 16'hc098;
                4'hd: out_r = 16'hc098;
                4'he: out_r = 16'hc098;
                4'hf: out_r = 16'hc098;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc097;
              case (mant_lo4)
                4'h5: out_r = 16'hc096;
                4'h6: out_r = 16'hc096;
                4'h7: out_r = 16'hc096;
                4'h8: out_r = 16'hc096;
                4'h9: out_r = 16'hc096;
                4'ha: out_r = 16'hc095;
                4'hb: out_r = 16'hc095;
                4'hc: out_r = 16'hc095;
                4'hd: out_r = 16'hc095;
                4'he: out_r = 16'hc095;
                4'hf: out_r = 16'hc094;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc093;
              case (mant_lo4)
                4'h0: out_r = 16'hc094;
                4'h1: out_r = 16'hc094;
                4'h2: out_r = 16'hc094;
                4'h3: out_r = 16'hc094;
                4'h9: out_r = 16'hc092;
                4'ha: out_r = 16'hc092;
                4'hb: out_r = 16'hc092;
                4'hc: out_r = 16'hc092;
                4'hd: out_r = 16'hc092;
                4'he: out_r = 16'hc091;
                4'hf: out_r = 16'hc091;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc08f;
              case (mant_lo4)
                4'h0: out_r = 16'hc091;
                4'h1: out_r = 16'hc091;
                4'h2: out_r = 16'hc091;
                4'h3: out_r = 16'hc091;
                4'h4: out_r = 16'hc090;
                4'h5: out_r = 16'hc090;
                4'h6: out_r = 16'hc090;
                4'h7: out_r = 16'hc090;
                4'h8: out_r = 16'hc090;
                4'hf: out_r = 16'hc08e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc08d;
              case (mant_lo4)
                4'h0: out_r = 16'hc08e;
                4'h1: out_r = 16'hc08e;
                4'h2: out_r = 16'hc08e;
                4'h3: out_r = 16'hc08e;
                4'h4: out_r = 16'hc08e;
                4'hc: out_r = 16'hc08c;
                4'hd: out_r = 16'hc08c;
                4'he: out_r = 16'hc08c;
                4'hf: out_r = 16'hc08c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc08b;
              case (mant_lo4)
                4'h0: out_r = 16'hc08c;
                4'h1: out_r = 16'hc08c;
                4'h9: out_r = 16'hc08a;
                4'ha: out_r = 16'hc08a;
                4'hb: out_r = 16'hc08a;
                4'hc: out_r = 16'hc08a;
                4'hd: out_r = 16'hc08a;
                4'he: out_r = 16'hc08a;
                4'hf: out_r = 16'hc08a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc089;
              case (mant_lo4)
                4'h7: out_r = 16'hc088;
                4'h8: out_r = 16'hc088;
                4'h9: out_r = 16'hc088;
                4'ha: out_r = 16'hc088;
                4'hb: out_r = 16'hc088;
                4'hc: out_r = 16'hc088;
                4'hd: out_r = 16'hc088;
                4'he: out_r = 16'hc087;
                4'hf: out_r = 16'hc087;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc086;
              case (mant_lo4)
                4'h0: out_r = 16'hc087;
                4'h1: out_r = 16'hc087;
                4'h2: out_r = 16'hc087;
                4'h3: out_r = 16'hc087;
                4'h4: out_r = 16'hc087;
                4'hd: out_r = 16'hc085;
                4'he: out_r = 16'hc085;
                4'hf: out_r = 16'hc085;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h079: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc082;
              case (mant_lo4)
                4'h0: out_r = 16'hc085;
                4'h1: out_r = 16'hc085;
                4'h2: out_r = 16'hc085;
                4'h3: out_r = 16'hc084;
                4'h4: out_r = 16'hc084;
                4'h5: out_r = 16'hc084;
                4'h6: out_r = 16'hc084;
                4'h7: out_r = 16'hc083;
                4'h8: out_r = 16'hc083;
                4'h9: out_r = 16'hc083;
                4'ha: out_r = 16'hc083;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc081;
              case (mant_lo4)
                4'h4: out_r = 16'hc080;
                4'h5: out_r = 16'hc080;
                4'h6: out_r = 16'hc080;
                4'h7: out_r = 16'hc080;
                4'h8: out_r = 16'hc07f;
                4'h9: out_r = 16'hc07f;
                4'ha: out_r = 16'hc07e;
                4'hb: out_r = 16'hc07e;
                4'hc: out_r = 16'hc07e;
                4'hd: out_r = 16'hc07d;
                4'he: out_r = 16'hc07d;
                4'hf: out_r = 16'hc07c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc07b;
              case (mant_lo4)
                4'h0: out_r = 16'hc07c;
                4'h4: out_r = 16'hc07a;
                4'h5: out_r = 16'hc07a;
                4'h6: out_r = 16'hc07a;
                4'h7: out_r = 16'hc079;
                4'h8: out_r = 16'hc079;
                4'h9: out_r = 16'hc078;
                4'ha: out_r = 16'hc078;
                4'hb: out_r = 16'hc078;
                4'hc: out_r = 16'hc077;
                4'hd: out_r = 16'hc077;
                4'he: out_r = 16'hc077;
                4'hf: out_r = 16'hc076;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc075;
              case (mant_lo4)
                4'h0: out_r = 16'hc076;
                4'h4: out_r = 16'hc074;
                4'h5: out_r = 16'hc074;
                4'h6: out_r = 16'hc074;
                4'h7: out_r = 16'hc073;
                4'h8: out_r = 16'hc073;
                4'h9: out_r = 16'hc073;
                4'ha: out_r = 16'hc072;
                4'hb: out_r = 16'hc072;
                4'hc: out_r = 16'hc072;
                4'hd: out_r = 16'hc071;
                4'he: out_r = 16'hc071;
                4'hf: out_r = 16'hc071;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc070;
              case (mant_lo4)
                4'h3: out_r = 16'hc06f;
                4'h4: out_r = 16'hc06f;
                4'h5: out_r = 16'hc06f;
                4'h6: out_r = 16'hc06e;
                4'h7: out_r = 16'hc06e;
                4'h8: out_r = 16'hc06e;
                4'h9: out_r = 16'hc06d;
                4'ha: out_r = 16'hc06d;
                4'hb: out_r = 16'hc06d;
                4'hc: out_r = 16'hc06c;
                4'hd: out_r = 16'hc06c;
                4'he: out_r = 16'hc06c;
                4'hf: out_r = 16'hc06b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc06a;
              case (mant_lo4)
                4'h0: out_r = 16'hc06b;
                4'h1: out_r = 16'hc06b;
                4'h6: out_r = 16'hc069;
                4'h7: out_r = 16'hc069;
                4'h8: out_r = 16'hc069;
                4'h9: out_r = 16'hc068;
                4'ha: out_r = 16'hc068;
                4'hb: out_r = 16'hc068;
                4'hc: out_r = 16'hc068;
                4'hd: out_r = 16'hc067;
                4'he: out_r = 16'hc067;
                4'hf: out_r = 16'hc067;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc066;
              case (mant_lo4)
                4'h4: out_r = 16'hc065;
                4'h5: out_r = 16'hc065;
                4'h6: out_r = 16'hc065;
                4'h7: out_r = 16'hc064;
                4'h8: out_r = 16'hc064;
                4'h9: out_r = 16'hc064;
                4'ha: out_r = 16'hc064;
                4'hb: out_r = 16'hc063;
                4'hc: out_r = 16'hc063;
                4'hd: out_r = 16'hc063;
                4'he: out_r = 16'hc062;
                4'hf: out_r = 16'hc062;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc061;
              case (mant_lo4)
                4'h0: out_r = 16'hc062;
                4'h1: out_r = 16'hc062;
                4'h6: out_r = 16'hc060;
                4'h7: out_r = 16'hc060;
                4'h8: out_r = 16'hc060;
                4'h9: out_r = 16'hc060;
                4'ha: out_r = 16'hc05f;
                4'hb: out_r = 16'hc05f;
                4'hc: out_r = 16'hc05f;
                4'hd: out_r = 16'hc05f;
                4'he: out_r = 16'hc05e;
                4'hf: out_r = 16'hc05e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc059;
              case (mant_lo4)
                4'h0: out_r = 16'hc05e;
                4'h1: out_r = 16'hc05d;
                4'h2: out_r = 16'hc05d;
                4'h3: out_r = 16'hc05c;
                4'h4: out_r = 16'hc05c;
                4'h5: out_r = 16'hc05b;
                4'h6: out_r = 16'hc05b;
                4'h7: out_r = 16'hc05a;
                4'h8: out_r = 16'hc05a;
                4'hc: out_r = 16'hc058;
                4'hd: out_r = 16'hc058;
                4'he: out_r = 16'hc057;
                4'hf: out_r = 16'hc057;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc055;
              case (mant_lo4)
                4'h0: out_r = 16'hc056;
                4'h1: out_r = 16'hc056;
                4'h5: out_r = 16'hc054;
                4'h6: out_r = 16'hc054;
                4'h7: out_r = 16'hc053;
                4'h8: out_r = 16'hc053;
                4'h9: out_r = 16'hc052;
                4'ha: out_r = 16'hc052;
                4'hb: out_r = 16'hc052;
                4'hc: out_r = 16'hc051;
                4'hd: out_r = 16'hc051;
                4'he: out_r = 16'hc050;
                4'hf: out_r = 16'hc050;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc04e;
              case (mant_lo4)
                4'h0: out_r = 16'hc050;
                4'h1: out_r = 16'hc04f;
                4'h2: out_r = 16'hc04f;
                4'h6: out_r = 16'hc04d;
                4'h7: out_r = 16'hc04d;
                4'h8: out_r = 16'hc04c;
                4'h9: out_r = 16'hc04c;
                4'ha: out_r = 16'hc04c;
                4'hb: out_r = 16'hc04b;
                4'hc: out_r = 16'hc04b;
                4'hd: out_r = 16'hc04b;
                4'he: out_r = 16'hc04a;
                4'hf: out_r = 16'hc04a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc049;
              case (mant_lo4)
                4'h3: out_r = 16'hc048;
                4'h4: out_r = 16'hc048;
                4'h5: out_r = 16'hc048;
                4'h6: out_r = 16'hc047;
                4'h7: out_r = 16'hc047;
                4'h8: out_r = 16'hc047;
                4'h9: out_r = 16'hc046;
                4'ha: out_r = 16'hc046;
                4'hb: out_r = 16'hc046;
                4'hc: out_r = 16'hc045;
                4'hd: out_r = 16'hc045;
                4'he: out_r = 16'hc045;
                4'hf: out_r = 16'hc044;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc043;
              case (mant_lo4)
                4'h0: out_r = 16'hc044;
                4'h1: out_r = 16'hc044;
                4'h5: out_r = 16'hc042;
                4'h6: out_r = 16'hc042;
                4'h7: out_r = 16'hc042;
                4'h8: out_r = 16'hc041;
                4'h9: out_r = 16'hc041;
                4'ha: out_r = 16'hc041;
                4'hb: out_r = 16'hc040;
                4'hc: out_r = 16'hc040;
                4'hd: out_r = 16'hc040;
                4'he: out_r = 16'hc03f;
                4'hf: out_r = 16'hc03f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc03e;
              case (mant_lo4)
                4'h0: out_r = 16'hc03f;
                4'h5: out_r = 16'hc03d;
                4'h6: out_r = 16'hc03d;
                4'h7: out_r = 16'hc03d;
                4'h8: out_r = 16'hc03c;
                4'h9: out_r = 16'hc03c;
                4'ha: out_r = 16'hc03c;
                4'hb: out_r = 16'hc03b;
                4'hc: out_r = 16'hc03b;
                4'hd: out_r = 16'hc03b;
                4'he: out_r = 16'hc03b;
                4'hf: out_r = 16'hc03a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc039;
              case (mant_lo4)
                4'h0: out_r = 16'hc03a;
                4'h1: out_r = 16'hc03a;
                4'h6: out_r = 16'hc038;
                4'h7: out_r = 16'hc038;
                4'h8: out_r = 16'hc038;
                4'h9: out_r = 16'hc037;
                4'ha: out_r = 16'hc037;
                4'hb: out_r = 16'hc037;
                4'hc: out_r = 16'hc037;
                4'hd: out_r = 16'hc036;
                4'he: out_r = 16'hc036;
                4'hf: out_r = 16'hc036;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc035;
              case (mant_lo4)
                4'h0: out_r = 16'hc036;
                4'h5: out_r = 16'hc034;
                4'h6: out_r = 16'hc034;
                4'h7: out_r = 16'hc034;
                4'h8: out_r = 16'hc033;
                4'h9: out_r = 16'hc033;
                4'ha: out_r = 16'hc033;
                4'hb: out_r = 16'hc033;
                4'hc: out_r = 16'hc032;
                4'hd: out_r = 16'hc032;
                4'he: out_r = 16'hc032;
                4'hf: out_r = 16'hc032;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc02f;
              case (mant_lo4)
                4'h0: out_r = 16'hc031;
                4'h1: out_r = 16'hc031;
                4'h2: out_r = 16'hc030;
                4'h3: out_r = 16'hc030;
                4'h7: out_r = 16'hc02e;
                4'h8: out_r = 16'hc02e;
                4'h9: out_r = 16'hc02d;
                4'ha: out_r = 16'hc02d;
                4'hb: out_r = 16'hc02c;
                4'hc: out_r = 16'hc02c;
                4'hd: out_r = 16'hc02b;
                4'he: out_r = 16'hc02b;
                4'hf: out_r = 16'hc02a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc029;
              case (mant_lo4)
                4'h0: out_r = 16'hc02a;
                4'h4: out_r = 16'hc028;
                4'h5: out_r = 16'hc028;
                4'h6: out_r = 16'hc027;
                4'h7: out_r = 16'hc027;
                4'h8: out_r = 16'hc026;
                4'h9: out_r = 16'hc026;
                4'ha: out_r = 16'hc026;
                4'hb: out_r = 16'hc025;
                4'hc: out_r = 16'hc025;
                4'hd: out_r = 16'hc024;
                4'he: out_r = 16'hc024;
                4'hf: out_r = 16'hc024;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc022;
              case (mant_lo4)
                4'h0: out_r = 16'hc023;
                4'h1: out_r = 16'hc023;
                4'h5: out_r = 16'hc021;
                4'h6: out_r = 16'hc021;
                4'h7: out_r = 16'hc020;
                4'h8: out_r = 16'hc020;
                4'h9: out_r = 16'hc020;
                4'ha: out_r = 16'hc01f;
                4'hb: out_r = 16'hc01f;
                4'hc: out_r = 16'hc01f;
                4'hd: out_r = 16'hc01e;
                4'he: out_r = 16'hc01e;
                4'hf: out_r = 16'hc01d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc01c;
              case (mant_lo4)
                4'h0: out_r = 16'hc01d;
                4'h1: out_r = 16'hc01d;
                4'h5: out_r = 16'hc01b;
                4'h6: out_r = 16'hc01b;
                4'h7: out_r = 16'hc01b;
                4'h8: out_r = 16'hc01a;
                4'h9: out_r = 16'hc01a;
                4'ha: out_r = 16'hc01a;
                4'hb: out_r = 16'hc019;
                4'hc: out_r = 16'hc019;
                4'hd: out_r = 16'hc019;
                4'he: out_r = 16'hc018;
                4'hf: out_r = 16'hc018;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc017;
              case (mant_lo4)
                4'h4: out_r = 16'hc016;
                4'h5: out_r = 16'hc016;
                4'h6: out_r = 16'hc016;
                4'h7: out_r = 16'hc015;
                4'h8: out_r = 16'hc015;
                4'h9: out_r = 16'hc015;
                4'ha: out_r = 16'hc014;
                4'hb: out_r = 16'hc014;
                4'hc: out_r = 16'hc014;
                4'hd: out_r = 16'hc013;
                4'he: out_r = 16'hc013;
                4'hf: out_r = 16'hc013;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc011;
              case (mant_lo4)
                4'h0: out_r = 16'hc012;
                4'h1: out_r = 16'hc012;
                4'h2: out_r = 16'hc012;
                4'h7: out_r = 16'hc010;
                4'h8: out_r = 16'hc010;
                4'h9: out_r = 16'hc010;
                4'ha: out_r = 16'hc00f;
                4'hb: out_r = 16'hc00f;
                4'hc: out_r = 16'hc00f;
                4'hd: out_r = 16'hc00e;
                4'he: out_r = 16'hc00e;
                4'hf: out_r = 16'hc00e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc00c;
              case (mant_lo4)
                4'h0: out_r = 16'hc00e;
                4'h1: out_r = 16'hc00d;
                4'h2: out_r = 16'hc00d;
                4'h3: out_r = 16'hc00d;
                4'h8: out_r = 16'hc00b;
                4'h9: out_r = 16'hc00b;
                4'ha: out_r = 16'hc00b;
                4'hb: out_r = 16'hc00b;
                4'hc: out_r = 16'hc00a;
                4'hd: out_r = 16'hc00a;
                4'he: out_r = 16'hc00a;
                4'hf: out_r = 16'hc009;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc008;
              case (mant_lo4)
                4'h0: out_r = 16'hc009;
                4'h1: out_r = 16'hc009;
                4'h2: out_r = 16'hc009;
                4'h7: out_r = 16'hc007;
                4'h8: out_r = 16'hc007;
                4'h9: out_r = 16'hc007;
                4'ha: out_r = 16'hc007;
                4'hb: out_r = 16'hc006;
                4'hc: out_r = 16'hc006;
                4'hd: out_r = 16'hc006;
                4'he: out_r = 16'hc006;
                4'hf: out_r = 16'hc005;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc005;
              case (mant_lo4)
                4'h2: out_r = 16'hc004;
                4'h3: out_r = 16'hc004;
                4'h4: out_r = 16'hc003;
                4'h5: out_r = 16'hc003;
                4'h6: out_r = 16'hc002;
                4'h7: out_r = 16'hc002;
                4'h8: out_r = 16'hc001;
                4'h9: out_r = 16'hc001;
                4'ha: out_r = 16'hc000;
                4'hb: out_r = 16'hc000;
                4'hc: out_r = 16'hbfff;
                4'hd: out_r = 16'hbffe;
                4'he: out_r = 16'hbffd;
                4'hf: out_r = 16'hbffc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbff8;
              case (mant_lo4)
                4'h0: out_r = 16'hbffb;
                4'h1: out_r = 16'hbffa;
                4'h2: out_r = 16'hbff9;
                4'h5: out_r = 16'hbff7;
                4'h6: out_r = 16'hbff6;
                4'h7: out_r = 16'hbff5;
                4'h8: out_r = 16'hbff4;
                4'h9: out_r = 16'hbff3;
                4'ha: out_r = 16'hbff2;
                4'hb: out_r = 16'hbff2;
                4'hc: out_r = 16'hbff1;
                4'hd: out_r = 16'hbff0;
                4'he: out_r = 16'hbfef;
                4'hf: out_r = 16'hbfee;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbfea;
              case (mant_lo4)
                4'h0: out_r = 16'hbfee;
                4'h1: out_r = 16'hbfed;
                4'h2: out_r = 16'hbfec;
                4'h3: out_r = 16'hbfeb;
                4'h6: out_r = 16'hbfe9;
                4'h7: out_r = 16'hbfe8;
                4'h8: out_r = 16'hbfe7;
                4'h9: out_r = 16'hbfe7;
                4'ha: out_r = 16'hbfe6;
                4'hb: out_r = 16'hbfe5;
                4'hc: out_r = 16'hbfe4;
                4'hd: out_r = 16'hbfe4;
                4'he: out_r = 16'hbfe3;
                4'hf: out_r = 16'hbfe2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbfe1;
              case (mant_lo4)
                4'h2: out_r = 16'hbfe0;
                4'h3: out_r = 16'hbfdf;
                4'h4: out_r = 16'hbfdf;
                4'h5: out_r = 16'hbfde;
                4'h6: out_r = 16'hbfdd;
                4'h7: out_r = 16'hbfdc;
                4'h8: out_r = 16'hbfdc;
                4'h9: out_r = 16'hbfdb;
                4'ha: out_r = 16'hbfda;
                4'hb: out_r = 16'hbfda;
                4'hc: out_r = 16'hbfd9;
                4'hd: out_r = 16'hbfd8;
                4'he: out_r = 16'hbfd8;
                4'hf: out_r = 16'hbfd7;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbfd6;
              case (mant_lo4)
                4'h2: out_r = 16'hbfd5;
                4'h3: out_r = 16'hbfd4;
                4'h4: out_r = 16'hbfd4;
                4'h5: out_r = 16'hbfd3;
                4'h6: out_r = 16'hbfd2;
                4'h7: out_r = 16'hbfd2;
                4'h8: out_r = 16'hbfd1;
                4'h9: out_r = 16'hbfd0;
                4'ha: out_r = 16'hbfd0;
                4'hb: out_r = 16'hbfcf;
                4'hc: out_r = 16'hbfcf;
                4'hd: out_r = 16'hbfce;
                4'he: out_r = 16'hbfcd;
                4'hf: out_r = 16'hbfcd;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbfcb;
              case (mant_lo4)
                4'h0: out_r = 16'hbfcc;
                4'h3: out_r = 16'hbfca;
                4'h4: out_r = 16'hbfca;
                4'h5: out_r = 16'hbfc9;
                4'h6: out_r = 16'hbfc8;
                4'h7: out_r = 16'hbfc8;
                4'h8: out_r = 16'hbfc7;
                4'h9: out_r = 16'hbfc7;
                4'ha: out_r = 16'hbfc6;
                4'hb: out_r = 16'hbfc5;
                4'hc: out_r = 16'hbfc5;
                4'hd: out_r = 16'hbfc4;
                4'he: out_r = 16'hbfc4;
                4'hf: out_r = 16'hbfc3;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbfc1;
              case (mant_lo4)
                4'h0: out_r = 16'hbfc3;
                4'h1: out_r = 16'hbfc2;
                4'h4: out_r = 16'hbfc0;
                4'h5: out_r = 16'hbfc0;
                4'h6: out_r = 16'hbfbf;
                4'h7: out_r = 16'hbfbf;
                4'h8: out_r = 16'hbfbe;
                4'h9: out_r = 16'hbfbd;
                4'ha: out_r = 16'hbfbd;
                4'hb: out_r = 16'hbfbc;
                4'hc: out_r = 16'hbfbc;
                4'hd: out_r = 16'hbfbb;
                4'he: out_r = 16'hbfbb;
                4'hf: out_r = 16'hbfba;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbfb9;
              case (mant_lo4)
                4'h0: out_r = 16'hbfba;
                4'h3: out_r = 16'hbfb8;
                4'h4: out_r = 16'hbfb8;
                4'h5: out_r = 16'hbfb7;
                4'h6: out_r = 16'hbfb7;
                4'h7: out_r = 16'hbfb6;
                4'h8: out_r = 16'hbfb6;
                4'h9: out_r = 16'hbfb5;
                4'ha: out_r = 16'hbfb4;
                4'hb: out_r = 16'hbfb4;
                4'hc: out_r = 16'hbfb3;
                4'hd: out_r = 16'hbfb3;
                4'he: out_r = 16'hbfb2;
                4'hf: out_r = 16'hbfb2;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbfae;
              case (mant_lo4)
                4'h0: out_r = 16'hbfb1;
                4'h1: out_r = 16'hbfb0;
                4'h2: out_r = 16'hbfaf;
                4'h5: out_r = 16'hbfad;
                4'h6: out_r = 16'hbfac;
                4'h7: out_r = 16'hbfab;
                4'h8: out_r = 16'hbfaa;
                4'h9: out_r = 16'hbfa9;
                4'ha: out_r = 16'hbfa8;
                4'hb: out_r = 16'hbfa7;
                4'hc: out_r = 16'hbfa6;
                4'hd: out_r = 16'hbfa5;
                4'he: out_r = 16'hbfa4;
                4'hf: out_r = 16'hbfa3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbfa1;
              case (mant_lo4)
                4'h0: out_r = 16'hbfa2;
                4'h3: out_r = 16'hbfa0;
                4'h4: out_r = 16'hbf9f;
                4'h5: out_r = 16'hbf9e;
                4'h6: out_r = 16'hbf9d;
                4'h7: out_r = 16'hbf9c;
                4'h8: out_r = 16'hbf9b;
                4'h9: out_r = 16'hbf9b;
                4'ha: out_r = 16'hbf9a;
                4'hb: out_r = 16'hbf99;
                4'hc: out_r = 16'hbf98;
                4'hd: out_r = 16'hbf97;
                4'he: out_r = 16'hbf96;
                4'hf: out_r = 16'hbf96;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbf93;
              case (mant_lo4)
                4'h0: out_r = 16'hbf95;
                4'h1: out_r = 16'hbf94;
                4'h4: out_r = 16'hbf92;
                4'h5: out_r = 16'hbf91;
                4'h6: out_r = 16'hbf90;
                4'h7: out_r = 16'hbf8f;
                4'h8: out_r = 16'hbf8f;
                4'h9: out_r = 16'hbf8e;
                4'ha: out_r = 16'hbf8d;
                4'hb: out_r = 16'hbf8c;
                4'hc: out_r = 16'hbf8c;
                4'hd: out_r = 16'hbf8b;
                4'he: out_r = 16'hbf8a;
                4'hf: out_r = 16'hbf89;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbf87;
              case (mant_lo4)
                4'h0: out_r = 16'hbf89;
                4'h1: out_r = 16'hbf88;
                4'h4: out_r = 16'hbf86;
                4'h5: out_r = 16'hbf85;
                4'h6: out_r = 16'hbf84;
                4'h7: out_r = 16'hbf84;
                4'h8: out_r = 16'hbf83;
                4'h9: out_r = 16'hbf82;
                4'ha: out_r = 16'hbf82;
                4'hb: out_r = 16'hbf81;
                4'hc: out_r = 16'hbf80;
                4'hd: out_r = 16'hbf7f;
                4'he: out_r = 16'hbf7e;
                4'hf: out_r = 16'hbf7c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbf7b;
              case (mant_lo4)
                4'h1: out_r = 16'hbf7a;
                4'h2: out_r = 16'hbf78;
                4'h3: out_r = 16'hbf77;
                4'h4: out_r = 16'hbf76;
                4'h5: out_r = 16'hbf75;
                4'h6: out_r = 16'hbf73;
                4'h7: out_r = 16'hbf72;
                4'h8: out_r = 16'hbf71;
                4'h9: out_r = 16'hbf6f;
                4'ha: out_r = 16'hbf6e;
                4'hb: out_r = 16'hbf6d;
                4'hc: out_r = 16'hbf6c;
                4'hd: out_r = 16'hbf6a;
                4'he: out_r = 16'hbf69;
                4'hf: out_r = 16'hbf68;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbf67;
              case (mant_lo4)
                4'h1: out_r = 16'hbf65;
                4'h2: out_r = 16'hbf64;
                4'h3: out_r = 16'hbf63;
                4'h4: out_r = 16'hbf62;
                4'h5: out_r = 16'hbf61;
                4'h6: out_r = 16'hbf5f;
                4'h7: out_r = 16'hbf5e;
                4'h8: out_r = 16'hbf5d;
                4'h9: out_r = 16'hbf5c;
                4'ha: out_r = 16'hbf5b;
                4'hb: out_r = 16'hbf59;
                4'hc: out_r = 16'hbf58;
                4'hd: out_r = 16'hbf57;
                4'he: out_r = 16'hbf56;
                4'hf: out_r = 16'hbf55;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbf54;
              case (mant_lo4)
                4'h1: out_r = 16'hbf52;
                4'h2: out_r = 16'hbf51;
                4'h3: out_r = 16'hbf50;
                4'h4: out_r = 16'hbf4f;
                4'h5: out_r = 16'hbf4e;
                4'h6: out_r = 16'hbf4d;
                4'h7: out_r = 16'hbf4c;
                4'h8: out_r = 16'hbf4b;
                4'h9: out_r = 16'hbf4a;
                4'ha: out_r = 16'hbf48;
                4'hb: out_r = 16'hbf47;
                4'hc: out_r = 16'hbf46;
                4'hd: out_r = 16'hbf45;
                4'he: out_r = 16'hbf44;
                4'hf: out_r = 16'hbf43;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbf42;
              case (mant_lo4)
                4'h1: out_r = 16'hbf41;
                4'h2: out_r = 16'hbf40;
                4'h3: out_r = 16'hbf3f;
                4'h4: out_r = 16'hbf3e;
                4'h5: out_r = 16'hbf3d;
                4'h6: out_r = 16'hbf3c;
                4'h7: out_r = 16'hbf3b;
                4'h8: out_r = 16'hbf3a;
                4'h9: out_r = 16'hbf39;
                4'ha: out_r = 16'hbf38;
                4'hb: out_r = 16'hbf36;
                4'hc: out_r = 16'hbf35;
                4'hd: out_r = 16'hbf34;
                4'he: out_r = 16'hbf33;
                4'hf: out_r = 16'hbf32;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbf31;
              case (mant_lo4)
                4'h1: out_r = 16'hbf2f;
                4'h2: out_r = 16'hbf2d;
                4'h3: out_r = 16'hbf2c;
                4'h4: out_r = 16'hbf2a;
                4'h5: out_r = 16'hbf28;
                4'h6: out_r = 16'hbf26;
                4'h7: out_r = 16'hbf24;
                4'h8: out_r = 16'hbf22;
                4'h9: out_r = 16'hbf20;
                4'ha: out_r = 16'hbf1e;
                4'hb: out_r = 16'hbf1c;
                4'hc: out_r = 16'hbf1b;
                4'hd: out_r = 16'hbf19;
                4'he: out_r = 16'hbf17;
                4'hf: out_r = 16'hbf15;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbf13;
              case (mant_lo4)
                4'h1: out_r = 16'hbf12;
                4'h2: out_r = 16'hbf10;
                4'h3: out_r = 16'hbf0e;
                4'h4: out_r = 16'hbf0c;
                4'h5: out_r = 16'hbf0b;
                4'h6: out_r = 16'hbf09;
                4'h7: out_r = 16'hbf07;
                4'h8: out_r = 16'hbf05;
                4'h9: out_r = 16'hbf04;
                4'ha: out_r = 16'hbf02;
                4'hb: out_r = 16'hbf00;
                4'hc: out_r = 16'hbefe;
                4'hd: out_r = 16'hbefa;
                4'he: out_r = 16'hbef7;
                4'hf: out_r = 16'hbef4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbef1;
              case (mant_lo4)
                4'h1: out_r = 16'hbeed;
                4'h2: out_r = 16'hbeea;
                4'h3: out_r = 16'hbee7;
                4'h4: out_r = 16'hbee4;
                4'h5: out_r = 16'hbee1;
                4'h6: out_r = 16'hbede;
                4'h7: out_r = 16'hbedb;
                4'h8: out_r = 16'hbed8;
                4'h9: out_r = 16'hbed5;
                4'ha: out_r = 16'hbed2;
                4'hb: out_r = 16'hbecf;
                4'hc: out_r = 16'hbecc;
                4'hd: out_r = 16'hbec9;
                4'he: out_r = 16'hbec6;
                4'hf: out_r = 16'hbec3;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbec0;
              case (mant_lo4)
                4'h1: out_r = 16'hbebd;
                4'h2: out_r = 16'hbeba;
                4'h3: out_r = 16'hbeb7;
                4'h4: out_r = 16'hbeb4;
                4'h5: out_r = 16'hbeb2;
                4'h6: out_r = 16'hbeaf;
                4'h7: out_r = 16'hbeac;
                4'h8: out_r = 16'hbea9;
                4'h9: out_r = 16'hbea6;
                4'ha: out_r = 16'hbea4;
                4'hb: out_r = 16'hbea1;
                4'hc: out_r = 16'hbe9e;
                4'hd: out_r = 16'hbe9b;
                4'he: out_r = 16'hbe99;
                4'hf: out_r = 16'hbe96;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbe93;
              case (mant_lo4)
                4'h1: out_r = 16'hbe91;
                4'h2: out_r = 16'hbe8e;
                4'h3: out_r = 16'hbe8b;
                4'h4: out_r = 16'hbe89;
                4'h5: out_r = 16'hbe86;
                4'h6: out_r = 16'hbe84;
                4'h7: out_r = 16'hbe81;
                4'h8: out_r = 16'hbe7d;
                4'h9: out_r = 16'hbe78;
                4'ha: out_r = 16'hbe73;
                4'hb: out_r = 16'hbe6e;
                4'hc: out_r = 16'hbe69;
                4'hd: out_r = 16'hbe63;
                4'he: out_r = 16'hbe5f;
                4'hf: out_r = 16'hbe5a;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbe55;
              case (mant_lo4)
                4'h1: out_r = 16'hbe50;
                4'h2: out_r = 16'hbe4b;
                4'h3: out_r = 16'hbe46;
                4'h4: out_r = 16'hbe41;
                4'h5: out_r = 16'hbe3c;
                4'h6: out_r = 16'hbe38;
                4'h7: out_r = 16'hbe33;
                4'h8: out_r = 16'hbe2e;
                4'h9: out_r = 16'hbe29;
                4'ha: out_r = 16'hbe25;
                4'hb: out_r = 16'hbe20;
                4'hc: out_r = 16'hbe1b;
                4'hd: out_r = 16'hbe17;
                4'he: out_r = 16'hbe12;
                4'hf: out_r = 16'hbe0d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbe09;
              case (mant_lo4)
                4'h1: out_r = 16'hbe04;
                4'h2: out_r = 16'hbdff;
                4'h3: out_r = 16'hbdf6;
                4'h4: out_r = 16'hbded;
                4'h5: out_r = 16'hbde4;
                4'h6: out_r = 16'hbddb;
                4'h7: out_r = 16'hbdd2;
                4'h8: out_r = 16'hbdca;
                4'h9: out_r = 16'hbdc1;
                4'ha: out_r = 16'hbdb8;
                4'hb: out_r = 16'hbdaf;
                4'hc: out_r = 16'hbda7;
                4'hd: out_r = 16'hbd9e;
                4'he: out_r = 16'hbd95;
                4'hf: out_r = 16'hbd8d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbd84;
              case (mant_lo4)
                4'h1: out_r = 16'hbd77;
                4'h2: out_r = 16'hbd66;
                4'h3: out_r = 16'hbd55;
                4'h4: out_r = 16'hbd45;
                4'h5: out_r = 16'hbd34;
                4'h6: out_r = 16'hbd23;
                4'h7: out_r = 16'hbd13;
                4'h8: out_r = 16'hbd02;
                4'h9: out_r = 16'hbce3;
                4'ha: out_r = 16'hbcc2;
                4'hb: out_r = 16'hbca2;
                4'hc: out_r = 16'hbc81;
                4'hd: out_r = 16'hbc41;
                4'he: out_r = 16'hbc01;
                4'hf: out_r = 16'hbb80;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h0000;
              case (mant_lo4)
                4'h1: out_r = 16'h3bff;
                4'h2: out_r = 16'h3c7e;
                4'h3: out_r = 16'h3cbe;
                4'h4: out_r = 16'h3cfc;
                4'h5: out_r = 16'h3d1d;
                4'h6: out_r = 16'h3d3c;
                4'h7: out_r = 16'h3d5a;
                4'h8: out_r = 16'h3d78;
                4'h9: out_r = 16'h3d8b;
                4'ha: out_r = 16'h3d9a;
                4'hb: out_r = 16'h3da9;
                4'hc: out_r = 16'h3db8;
                4'hd: out_r = 16'h3dc6;
                4'he: out_r = 16'h3dd5;
                4'hf: out_r = 16'h3de3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3df1;
              case (mant_lo4)
                4'h1: out_r = 16'h3dff;
                4'h2: out_r = 16'h3e07;
                4'h3: out_r = 16'h3e0e;
                4'h4: out_r = 16'h3e15;
                4'h5: out_r = 16'h3e1c;
                4'h6: out_r = 16'h3e22;
                4'h7: out_r = 16'h3e29;
                4'h8: out_r = 16'h3e30;
                4'h9: out_r = 16'h3e37;
                4'ha: out_r = 16'h3e3d;
                4'hb: out_r = 16'h3e44;
                4'hc: out_r = 16'h3e4b;
                4'hd: out_r = 16'h3e51;
                4'he: out_r = 16'h3e58;
                4'hf: out_r = 16'h3e5e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3e64;
              case (mant_lo4)
                4'h1: out_r = 16'h3e6b;
                4'h2: out_r = 16'h3e71;
                4'h3: out_r = 16'h3e78;
                4'h4: out_r = 16'h3e7e;
                4'h5: out_r = 16'h3e82;
                4'h6: out_r = 16'h3e85;
                4'h7: out_r = 16'h3e88;
                4'h8: out_r = 16'h3e8b;
                4'h9: out_r = 16'h3e8e;
                4'ha: out_r = 16'h3e91;
                4'hb: out_r = 16'h3e94;
                4'hc: out_r = 16'h3e97;
                4'hd: out_r = 16'h3e9a;
                4'he: out_r = 16'h3e9d;
                4'hf: out_r = 16'h3ea0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3ea3;
              case (mant_lo4)
                4'h1: out_r = 16'h3ea6;
                4'h2: out_r = 16'h3ea9;
                4'h3: out_r = 16'h3eac;
                4'h4: out_r = 16'h3eaf;
                4'h5: out_r = 16'h3eb1;
                4'h6: out_r = 16'h3eb4;
                4'h7: out_r = 16'h3eb7;
                4'h8: out_r = 16'h3eba;
                4'h9: out_r = 16'h3ebd;
                4'ha: out_r = 16'h3ebf;
                4'hb: out_r = 16'h3ec2;
                4'hc: out_r = 16'h3ec5;
                4'hd: out_r = 16'h3ec8;
                4'he: out_r = 16'h3eca;
                4'hf: out_r = 16'h3ecd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3ed0;
              case (mant_lo4)
                4'h1: out_r = 16'h3ed2;
                4'h2: out_r = 16'h3ed5;
                4'h3: out_r = 16'h3ed8;
                4'h4: out_r = 16'h3eda;
                4'h5: out_r = 16'h3edd;
                4'h6: out_r = 16'h3edf;
                4'h7: out_r = 16'h3ee2;
                4'h8: out_r = 16'h3ee4;
                4'h9: out_r = 16'h3ee7;
                4'ha: out_r = 16'h3eea;
                4'hb: out_r = 16'h3eec;
                4'hc: out_r = 16'h3eef;
                4'hd: out_r = 16'h3ef1;
                4'he: out_r = 16'h3ef4;
                4'hf: out_r = 16'h3ef6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3ef9;
              case (mant_lo4)
                4'h1: out_r = 16'h3efb;
                4'h2: out_r = 16'h3efd;
                4'h3: out_r = 16'h3f00;
                4'h4: out_r = 16'h3f01;
                4'h5: out_r = 16'h3f02;
                4'h6: out_r = 16'h3f04;
                4'h7: out_r = 16'h3f05;
                4'h8: out_r = 16'h3f06;
                4'h9: out_r = 16'h3f07;
                4'ha: out_r = 16'h3f08;
                4'hb: out_r = 16'h3f09;
                4'hc: out_r = 16'h3f0b;
                4'hd: out_r = 16'h3f0c;
                4'he: out_r = 16'h3f0d;
                4'hf: out_r = 16'h3f0e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3f0f;
              case (mant_lo4)
                4'h1: out_r = 16'h3f10;
                4'h2: out_r = 16'h3f12;
                4'h3: out_r = 16'h3f13;
                4'h4: out_r = 16'h3f14;
                4'h5: out_r = 16'h3f15;
                4'h6: out_r = 16'h3f16;
                4'h7: out_r = 16'h3f17;
                4'h8: out_r = 16'h3f18;
                4'h9: out_r = 16'h3f19;
                4'ha: out_r = 16'h3f1a;
                4'hb: out_r = 16'h3f1c;
                4'hc: out_r = 16'h3f1d;
                4'hd: out_r = 16'h3f1e;
                4'he: out_r = 16'h3f1f;
                4'hf: out_r = 16'h3f20;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3f21;
              case (mant_lo4)
                4'h1: out_r = 16'h3f22;
                4'h2: out_r = 16'h3f23;
                4'h3: out_r = 16'h3f24;
                4'h4: out_r = 16'h3f25;
                4'h5: out_r = 16'h3f26;
                4'h6: out_r = 16'h3f27;
                4'h7: out_r = 16'h3f28;
                4'h8: out_r = 16'h3f29;
                4'h9: out_r = 16'h3f2a;
                4'ha: out_r = 16'h3f2b;
                4'hb: out_r = 16'h3f2c;
                4'hc: out_r = 16'h3f2d;
                4'hd: out_r = 16'h3f2e;
                4'he: out_r = 16'h3f2f;
                4'hf: out_r = 16'h3f30;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h080: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3f31;
              case (mant_lo4)
                4'h1: out_r = 16'h3f33;
                4'h2: out_r = 16'h3f35;
                4'h3: out_r = 16'h3f37;
                4'h4: out_r = 16'h3f39;
                4'h5: out_r = 16'h3f3b;
                4'h6: out_r = 16'h3f3d;
                4'h7: out_r = 16'h3f3f;
                4'h8: out_r = 16'h3f41;
                4'h9: out_r = 16'h3f43;
                4'ha: out_r = 16'h3f45;
                4'hb: out_r = 16'h3f47;
                4'hc: out_r = 16'h3f48;
                4'hd: out_r = 16'h3f4a;
                4'he: out_r = 16'h3f4c;
                4'hf: out_r = 16'h3f4e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3f50;
              case (mant_lo4)
                4'h1: out_r = 16'h3f51;
                4'h2: out_r = 16'h3f53;
                4'h3: out_r = 16'h3f55;
                4'h4: out_r = 16'h3f57;
                4'h5: out_r = 16'h3f58;
                4'h6: out_r = 16'h3f5a;
                4'h7: out_r = 16'h3f5c;
                4'h8: out_r = 16'h3f5d;
                4'h9: out_r = 16'h3f5f;
                4'ha: out_r = 16'h3f61;
                4'hb: out_r = 16'h3f62;
                4'hc: out_r = 16'h3f64;
                4'hd: out_r = 16'h3f66;
                4'he: out_r = 16'h3f67;
                4'hf: out_r = 16'h3f69;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3f6b;
              case (mant_lo4)
                4'h1: out_r = 16'h3f6c;
                4'h2: out_r = 16'h3f6e;
                4'h3: out_r = 16'h3f6f;
                4'h4: out_r = 16'h3f71;
                4'h5: out_r = 16'h3f72;
                4'h6: out_r = 16'h3f74;
                4'h7: out_r = 16'h3f76;
                4'h8: out_r = 16'h3f77;
                4'h9: out_r = 16'h3f79;
                4'ha: out_r = 16'h3f7a;
                4'hb: out_r = 16'h3f7c;
                4'hc: out_r = 16'h3f7d;
                4'hd: out_r = 16'h3f7f;
                4'he: out_r = 16'h3f80;
                4'hf: out_r = 16'h3f81;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3f84;
              case (mant_lo4)
                4'h0: out_r = 16'h3f81;
                4'h1: out_r = 16'h3f82;
                4'h2: out_r = 16'h3f83;
                4'h5: out_r = 16'h3f85;
                4'h6: out_r = 16'h3f86;
                4'h7: out_r = 16'h3f86;
                4'h8: out_r = 16'h3f87;
                4'h9: out_r = 16'h3f88;
                4'ha: out_r = 16'h3f89;
                4'hb: out_r = 16'h3f89;
                4'hc: out_r = 16'h3f8a;
                4'hd: out_r = 16'h3f8b;
                4'he: out_r = 16'h3f8b;
                4'hf: out_r = 16'h3f8c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3f8d;
              case (mant_lo4)
                4'h2: out_r = 16'h3f8e;
                4'h3: out_r = 16'h3f8f;
                4'h4: out_r = 16'h3f8f;
                4'h5: out_r = 16'h3f90;
                4'h6: out_r = 16'h3f91;
                4'h7: out_r = 16'h3f91;
                4'h8: out_r = 16'h3f92;
                4'h9: out_r = 16'h3f92;
                4'ha: out_r = 16'h3f93;
                4'hb: out_r = 16'h3f94;
                4'hc: out_r = 16'h3f94;
                4'hd: out_r = 16'h3f95;
                4'he: out_r = 16'h3f96;
                4'hf: out_r = 16'h3f96;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3f97;
              case (mant_lo4)
                4'h2: out_r = 16'h3f98;
                4'h3: out_r = 16'h3f99;
                4'h4: out_r = 16'h3f99;
                4'h5: out_r = 16'h3f9a;
                4'h6: out_r = 16'h3f9b;
                4'h7: out_r = 16'h3f9b;
                4'h8: out_r = 16'h3f9c;
                4'h9: out_r = 16'h3f9c;
                4'ha: out_r = 16'h3f9d;
                4'hb: out_r = 16'h3f9d;
                4'hc: out_r = 16'h3f9e;
                4'hd: out_r = 16'h3f9f;
                4'he: out_r = 16'h3f9f;
                4'hf: out_r = 16'h3fa0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3fa1;
              case (mant_lo4)
                4'h0: out_r = 16'h3fa0;
                4'h3: out_r = 16'h3fa2;
                4'h4: out_r = 16'h3fa3;
                4'h5: out_r = 16'h3fa3;
                4'h6: out_r = 16'h3fa4;
                4'h7: out_r = 16'h3fa4;
                4'h8: out_r = 16'h3fa5;
                4'h9: out_r = 16'h3fa5;
                4'ha: out_r = 16'h3fa6;
                4'hb: out_r = 16'h3fa6;
                4'hc: out_r = 16'h3fa7;
                4'hd: out_r = 16'h3fa8;
                4'he: out_r = 16'h3fa8;
                4'hf: out_r = 16'h3fa9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3faa;
              case (mant_lo4)
                4'h0: out_r = 16'h3fa9;
                4'h3: out_r = 16'h3fab;
                4'h4: out_r = 16'h3fab;
                4'h5: out_r = 16'h3fac;
                4'h6: out_r = 16'h3fac;
                4'h7: out_r = 16'h3fad;
                4'h8: out_r = 16'h3fad;
                4'h9: out_r = 16'h3fae;
                4'ha: out_r = 16'h3fae;
                4'hb: out_r = 16'h3faf;
                4'hc: out_r = 16'h3faf;
                4'hd: out_r = 16'h3fb0;
                4'he: out_r = 16'h3fb0;
                4'hf: out_r = 16'h3fb1;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h081: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3fb1;
              case (mant_lo4)
                4'h1: out_r = 16'h3fb2;
                4'h2: out_r = 16'h3fb3;
                4'h3: out_r = 16'h3fb4;
                4'h4: out_r = 16'h3fb5;
                4'h5: out_r = 16'h3fb6;
                4'h6: out_r = 16'h3fb7;
                4'h7: out_r = 16'h3fb8;
                4'h8: out_r = 16'h3fb9;
                4'h9: out_r = 16'h3fba;
                4'ha: out_r = 16'h3fbb;
                4'hb: out_r = 16'h3fbc;
                4'hc: out_r = 16'h3fbd;
                4'hd: out_r = 16'h3fbe;
                4'he: out_r = 16'h3fbf;
                4'hf: out_r = 16'h3fc0;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3fc1;
              case (mant_lo4)
                4'h2: out_r = 16'h3fc2;
                4'h3: out_r = 16'h3fc3;
                4'h4: out_r = 16'h3fc4;
                4'h5: out_r = 16'h3fc5;
                4'h6: out_r = 16'h3fc6;
                4'h7: out_r = 16'h3fc7;
                4'h8: out_r = 16'h3fc7;
                4'h9: out_r = 16'h3fc8;
                4'ha: out_r = 16'h3fc9;
                4'hb: out_r = 16'h3fca;
                4'hc: out_r = 16'h3fcb;
                4'hd: out_r = 16'h3fcc;
                4'he: out_r = 16'h3fcc;
                4'hf: out_r = 16'h3fcd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3fd0;
              case (mant_lo4)
                4'h0: out_r = 16'h3fce;
                4'h1: out_r = 16'h3fcf;
                4'h4: out_r = 16'h3fd1;
                4'h5: out_r = 16'h3fd2;
                4'h6: out_r = 16'h3fd3;
                4'h7: out_r = 16'h3fd3;
                4'h8: out_r = 16'h3fd4;
                4'h9: out_r = 16'h3fd5;
                4'ha: out_r = 16'h3fd6;
                4'hb: out_r = 16'h3fd7;
                4'hc: out_r = 16'h3fd7;
                4'hd: out_r = 16'h3fd8;
                4'he: out_r = 16'h3fd9;
                4'hf: out_r = 16'h3fd9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3fdc;
              case (mant_lo4)
                4'h0: out_r = 16'h3fda;
                4'h1: out_r = 16'h3fdb;
                4'h4: out_r = 16'h3fdd;
                4'h5: out_r = 16'h3fde;
                4'h6: out_r = 16'h3fde;
                4'h7: out_r = 16'h3fdf;
                4'h8: out_r = 16'h3fe0;
                4'h9: out_r = 16'h3fe1;
                4'ha: out_r = 16'h3fe1;
                4'hb: out_r = 16'h3fe2;
                4'hc: out_r = 16'h3fe3;
                4'hd: out_r = 16'h3fe3;
                4'he: out_r = 16'h3fe4;
                4'hf: out_r = 16'h3fe5;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3fe7;
              case (mant_lo4)
                4'h0: out_r = 16'h3fe5;
                4'h1: out_r = 16'h3fe6;
                4'h4: out_r = 16'h3fe8;
                4'h5: out_r = 16'h3fe9;
                4'h6: out_r = 16'h3fe9;
                4'h7: out_r = 16'h3fea;
                4'h8: out_r = 16'h3feb;
                4'h9: out_r = 16'h3feb;
                4'ha: out_r = 16'h3fec;
                4'hb: out_r = 16'h3fec;
                4'hc: out_r = 16'h3fed;
                4'hd: out_r = 16'h3fee;
                4'he: out_r = 16'h3fee;
                4'hf: out_r = 16'h3fef;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3ff0;
              case (mant_lo4)
                4'h2: out_r = 16'h3ff1;
                4'h3: out_r = 16'h3ff1;
                4'h4: out_r = 16'h3ff2;
                4'h5: out_r = 16'h3ff3;
                4'h6: out_r = 16'h3ff3;
                4'h7: out_r = 16'h3ff4;
                4'h8: out_r = 16'h3ff4;
                4'h9: out_r = 16'h3ff5;
                4'ha: out_r = 16'h3ff6;
                4'hb: out_r = 16'h3ff6;
                4'hc: out_r = 16'h3ff7;
                4'hd: out_r = 16'h3ff7;
                4'he: out_r = 16'h3ff8;
                4'hf: out_r = 16'h3ff9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4000;
              case (mant_lo4)
                4'h0: out_r = 16'h3ff9;
                4'h1: out_r = 16'h3ffa;
                4'h2: out_r = 16'h3ffa;
                4'h3: out_r = 16'h3ffb;
                4'h4: out_r = 16'h3ffb;
                4'h5: out_r = 16'h3ffc;
                4'h6: out_r = 16'h3ffc;
                4'h7: out_r = 16'h3ffd;
                4'h8: out_r = 16'h3ffe;
                4'h9: out_r = 16'h3ffe;
                4'ha: out_r = 16'h3fff;
                4'hb: out_r = 16'h3fff;
                4'hf: out_r = 16'h4001;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4003;
              case (mant_lo4)
                4'h0: out_r = 16'h4001;
                4'h1: out_r = 16'h4001;
                4'h2: out_r = 16'h4001;
                4'h3: out_r = 16'h4002;
                4'h4: out_r = 16'h4002;
                4'h5: out_r = 16'h4002;
                4'ha: out_r = 16'h4004;
                4'hb: out_r = 16'h4004;
                4'hc: out_r = 16'h4004;
                4'hd: out_r = 16'h4004;
                4'he: out_r = 16'h4005;
                4'hf: out_r = 16'h4005;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h082: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4008;
              case (mant_lo4)
                4'h0: out_r = 16'h4005;
                4'h1: out_r = 16'h4006;
                4'h2: out_r = 16'h4006;
                4'h3: out_r = 16'h4007;
                4'h4: out_r = 16'h4007;
                4'h8: out_r = 16'h4009;
                4'h9: out_r = 16'h4009;
                4'ha: out_r = 16'h400a;
                4'hb: out_r = 16'h400a;
                4'hc: out_r = 16'h400b;
                4'hd: out_r = 16'h400b;
                4'he: out_r = 16'h400c;
                4'hf: out_r = 16'h400c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h400e;
              case (mant_lo4)
                4'h0: out_r = 16'h400d;
                4'h1: out_r = 16'h400d;
                4'h5: out_r = 16'h400f;
                4'h6: out_r = 16'h400f;
                4'h7: out_r = 16'h4010;
                4'h8: out_r = 16'h4010;
                4'h9: out_r = 16'h4011;
                4'ha: out_r = 16'h4011;
                4'hb: out_r = 16'h4011;
                4'hc: out_r = 16'h4012;
                4'hd: out_r = 16'h4012;
                4'he: out_r = 16'h4013;
                4'hf: out_r = 16'h4013;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4015;
              case (mant_lo4)
                4'h0: out_r = 16'h4013;
                4'h1: out_r = 16'h4014;
                4'h2: out_r = 16'h4014;
                4'h6: out_r = 16'h4016;
                4'h7: out_r = 16'h4016;
                4'h8: out_r = 16'h4016;
                4'h9: out_r = 16'h4017;
                4'ha: out_r = 16'h4017;
                4'hb: out_r = 16'h4018;
                4'hc: out_r = 16'h4018;
                4'hd: out_r = 16'h4018;
                4'he: out_r = 16'h4019;
                4'hf: out_r = 16'h4019;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h401b;
              case (mant_lo4)
                4'h0: out_r = 16'h4019;
                4'h1: out_r = 16'h401a;
                4'h2: out_r = 16'h401a;
                4'h6: out_r = 16'h401c;
                4'h7: out_r = 16'h401c;
                4'h8: out_r = 16'h401c;
                4'h9: out_r = 16'h401d;
                4'ha: out_r = 16'h401d;
                4'hb: out_r = 16'h401d;
                4'hc: out_r = 16'h401e;
                4'hd: out_r = 16'h401e;
                4'he: out_r = 16'h401e;
                4'hf: out_r = 16'h401f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4020;
              case (mant_lo4)
                4'h0: out_r = 16'h401f;
                4'h1: out_r = 16'h401f;
                4'h5: out_r = 16'h4021;
                4'h6: out_r = 16'h4021;
                4'h7: out_r = 16'h4021;
                4'h8: out_r = 16'h4022;
                4'h9: out_r = 16'h4022;
                4'ha: out_r = 16'h4022;
                4'hb: out_r = 16'h4023;
                4'hc: out_r = 16'h4023;
                4'hd: out_r = 16'h4023;
                4'he: out_r = 16'h4024;
                4'hf: out_r = 16'h4024;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4027;
              case (mant_lo4)
                4'h0: out_r = 16'h4024;
                4'h1: out_r = 16'h4024;
                4'h2: out_r = 16'h4025;
                4'h3: out_r = 16'h4025;
                4'h4: out_r = 16'h4025;
                4'h5: out_r = 16'h4026;
                4'h6: out_r = 16'h4026;
                4'h7: out_r = 16'h4026;
                4'hc: out_r = 16'h4028;
                4'hd: out_r = 16'h4028;
                4'he: out_r = 16'h4028;
                4'hf: out_r = 16'h4029;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h402b;
              case (mant_lo4)
                4'h0: out_r = 16'h4029;
                4'h1: out_r = 16'h4029;
                4'h2: out_r = 16'h4029;
                4'h3: out_r = 16'h402a;
                4'h4: out_r = 16'h402a;
                4'h5: out_r = 16'h402a;
                4'ha: out_r = 16'h402c;
                4'hb: out_r = 16'h402c;
                4'hc: out_r = 16'h402c;
                4'hd: out_r = 16'h402d;
                4'he: out_r = 16'h402d;
                4'hf: out_r = 16'h402d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h402e;
              case (mant_lo4)
                4'h0: out_r = 16'h402d;
                4'h5: out_r = 16'h402f;
                4'h6: out_r = 16'h402f;
                4'h7: out_r = 16'h402f;
                4'h8: out_r = 16'h402f;
                4'h9: out_r = 16'h4030;
                4'ha: out_r = 16'h4030;
                4'hb: out_r = 16'h4030;
                4'hc: out_r = 16'h4030;
                4'hd: out_r = 16'h4031;
                4'he: out_r = 16'h4031;
                4'hf: out_r = 16'h4031;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h083: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4032;
              case (mant_lo4)
                4'h0: out_r = 16'h4031;
                4'h3: out_r = 16'h4033;
                4'h4: out_r = 16'h4033;
                4'h5: out_r = 16'h4034;
                4'h6: out_r = 16'h4034;
                4'h7: out_r = 16'h4035;
                4'h8: out_r = 16'h4035;
                4'h9: out_r = 16'h4036;
                4'ha: out_r = 16'h4036;
                4'hb: out_r = 16'h4037;
                4'hc: out_r = 16'h4037;
                4'hd: out_r = 16'h4038;
                4'he: out_r = 16'h4038;
                4'hf: out_r = 16'h4039;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h403c;
              case (mant_lo4)
                4'h0: out_r = 16'h4039;
                4'h1: out_r = 16'h4039;
                4'h2: out_r = 16'h403a;
                4'h3: out_r = 16'h403a;
                4'h4: out_r = 16'h403b;
                4'h5: out_r = 16'h403b;
                4'h9: out_r = 16'h403d;
                4'ha: out_r = 16'h403d;
                4'hb: out_r = 16'h403e;
                4'hc: out_r = 16'h403e;
                4'hd: out_r = 16'h403f;
                4'he: out_r = 16'h403f;
                4'hf: out_r = 16'h403f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4041;
              case (mant_lo4)
                4'h0: out_r = 16'h4040;
                4'h1: out_r = 16'h4040;
                4'h5: out_r = 16'h4042;
                4'h6: out_r = 16'h4042;
                4'h7: out_r = 16'h4042;
                4'h8: out_r = 16'h4043;
                4'h9: out_r = 16'h4043;
                4'ha: out_r = 16'h4044;
                4'hb: out_r = 16'h4044;
                4'hc: out_r = 16'h4044;
                4'hd: out_r = 16'h4045;
                4'he: out_r = 16'h4045;
                4'hf: out_r = 16'h4045;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4047;
              case (mant_lo4)
                4'h0: out_r = 16'h4046;
                4'h1: out_r = 16'h4046;
                4'h5: out_r = 16'h4048;
                4'h6: out_r = 16'h4048;
                4'h7: out_r = 16'h4048;
                4'h8: out_r = 16'h4049;
                4'h9: out_r = 16'h4049;
                4'ha: out_r = 16'h4049;
                4'hb: out_r = 16'h404a;
                4'hc: out_r = 16'h404a;
                4'hd: out_r = 16'h404a;
                4'he: out_r = 16'h404b;
                4'hf: out_r = 16'h404b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h404c;
              case (mant_lo4)
                4'h0: out_r = 16'h404b;
                4'h4: out_r = 16'h404d;
                4'h5: out_r = 16'h404d;
                4'h6: out_r = 16'h404d;
                4'h7: out_r = 16'h404e;
                4'h8: out_r = 16'h404e;
                4'h9: out_r = 16'h404e;
                4'ha: out_r = 16'h404f;
                4'hb: out_r = 16'h404f;
                4'hc: out_r = 16'h404f;
                4'hd: out_r = 16'h4050;
                4'he: out_r = 16'h4050;
                4'hf: out_r = 16'h4050;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4051;
              case (mant_lo4)
                4'h4: out_r = 16'h4052;
                4'h5: out_r = 16'h4052;
                4'h6: out_r = 16'h4052;
                4'h7: out_r = 16'h4053;
                4'h8: out_r = 16'h4053;
                4'h9: out_r = 16'h4053;
                4'ha: out_r = 16'h4054;
                4'hb: out_r = 16'h4054;
                4'hc: out_r = 16'h4054;
                4'hd: out_r = 16'h4054;
                4'he: out_r = 16'h4055;
                4'hf: out_r = 16'h4055;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4056;
              case (mant_lo4)
                4'h0: out_r = 16'h4055;
                4'h5: out_r = 16'h4057;
                4'h6: out_r = 16'h4057;
                4'h7: out_r = 16'h4057;
                4'h8: out_r = 16'h4058;
                4'h9: out_r = 16'h4058;
                4'ha: out_r = 16'h4058;
                4'hb: out_r = 16'h4058;
                4'hc: out_r = 16'h4059;
                4'hd: out_r = 16'h4059;
                4'he: out_r = 16'h4059;
                4'hf: out_r = 16'h4059;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h405a;
              case (mant_lo4)
                4'h4: out_r = 16'h405b;
                4'h5: out_r = 16'h405b;
                4'h6: out_r = 16'h405b;
                4'h7: out_r = 16'h405c;
                4'h8: out_r = 16'h405c;
                4'h9: out_r = 16'h405c;
                4'ha: out_r = 16'h405c;
                4'hb: out_r = 16'h405d;
                4'hc: out_r = 16'h405d;
                4'hd: out_r = 16'h405d;
                4'he: out_r = 16'h405d;
                4'hf: out_r = 16'h405e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h084: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4064;
              case (mant_lo4)
                4'h0: out_r = 16'h405e;
                4'h1: out_r = 16'h405e;
                4'h2: out_r = 16'h405f;
                4'h3: out_r = 16'h405f;
                4'h4: out_r = 16'h4060;
                4'h5: out_r = 16'h4060;
                4'h6: out_r = 16'h4061;
                4'h7: out_r = 16'h4061;
                4'h8: out_r = 16'h4062;
                4'h9: out_r = 16'h4062;
                4'ha: out_r = 16'h4063;
                4'hb: out_r = 16'h4063;
                4'hf: out_r = 16'h4065;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4068;
              case (mant_lo4)
                4'h0: out_r = 16'h4065;
                4'h1: out_r = 16'h4066;
                4'h2: out_r = 16'h4066;
                4'h3: out_r = 16'h4067;
                4'h4: out_r = 16'h4067;
                4'h8: out_r = 16'h4069;
                4'h9: out_r = 16'h4069;
                4'ha: out_r = 16'h406a;
                4'hb: out_r = 16'h406a;
                4'hc: out_r = 16'h406a;
                4'hd: out_r = 16'h406b;
                4'he: out_r = 16'h406b;
                4'hf: out_r = 16'h406c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h406e;
              case (mant_lo4)
                4'h0: out_r = 16'h406c;
                4'h1: out_r = 16'h406c;
                4'h2: out_r = 16'h406d;
                4'h3: out_r = 16'h406d;
                4'h7: out_r = 16'h406f;
                4'h8: out_r = 16'h406f;
                4'h9: out_r = 16'h4070;
                4'ha: out_r = 16'h4070;
                4'hb: out_r = 16'h4070;
                4'hc: out_r = 16'h4071;
                4'hd: out_r = 16'h4071;
                4'he: out_r = 16'h4071;
                4'hf: out_r = 16'h4072;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4073;
              case (mant_lo4)
                4'h0: out_r = 16'h4072;
                4'h4: out_r = 16'h4074;
                4'h5: out_r = 16'h4074;
                4'h6: out_r = 16'h4074;
                4'h7: out_r = 16'h4075;
                4'h8: out_r = 16'h4075;
                4'h9: out_r = 16'h4075;
                4'ha: out_r = 16'h4076;
                4'hb: out_r = 16'h4076;
                4'hc: out_r = 16'h4076;
                4'hd: out_r = 16'h4077;
                4'he: out_r = 16'h4077;
                4'hf: out_r = 16'h4077;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4078;
              case (mant_lo4)
                4'h3: out_r = 16'h4079;
                4'h4: out_r = 16'h4079;
                4'h5: out_r = 16'h4079;
                4'h6: out_r = 16'h407a;
                4'h7: out_r = 16'h407a;
                4'h8: out_r = 16'h407a;
                4'h9: out_r = 16'h407b;
                4'ha: out_r = 16'h407b;
                4'hb: out_r = 16'h407b;
                4'hc: out_r = 16'h407c;
                4'hd: out_r = 16'h407c;
                4'he: out_r = 16'h407c;
                4'hf: out_r = 16'h407d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4080;
              case (mant_lo4)
                4'h0: out_r = 16'h407d;
                4'h1: out_r = 16'h407d;
                4'h2: out_r = 16'h407d;
                4'h3: out_r = 16'h407e;
                4'h4: out_r = 16'h407e;
                4'h5: out_r = 16'h407e;
                4'h6: out_r = 16'h407f;
                4'h7: out_r = 16'h407f;
                4'h8: out_r = 16'h407f;
                4'he: out_r = 16'h4081;
                4'hf: out_r = 16'h4081;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4082;
              case (mant_lo4)
                4'h0: out_r = 16'h4081;
                4'h1: out_r = 16'h4081;
                4'h2: out_r = 16'h4081;
                4'h3: out_r = 16'h4081;
                4'h4: out_r = 16'h4081;
                4'hd: out_r = 16'h4083;
                4'he: out_r = 16'h4083;
                4'hf: out_r = 16'h4083;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4084;
              case (mant_lo4)
                4'h0: out_r = 16'h4083;
                4'h1: out_r = 16'h4083;
                4'h2: out_r = 16'h4083;
                4'h3: out_r = 16'h4083;
                4'hc: out_r = 16'h4085;
                4'hd: out_r = 16'h4085;
                4'he: out_r = 16'h4085;
                4'hf: out_r = 16'h4085;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h085: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4087;
              case (mant_lo4)
                4'h0: out_r = 16'h4085;
                4'h1: out_r = 16'h4085;
                4'h2: out_r = 16'h4086;
                4'h3: out_r = 16'h4086;
                4'h4: out_r = 16'h4086;
                4'h5: out_r = 16'h4086;
                4'hb: out_r = 16'h4088;
                4'hc: out_r = 16'h4088;
                4'hd: out_r = 16'h4088;
                4'he: out_r = 16'h4088;
                4'hf: out_r = 16'h4089;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h408a;
              case (mant_lo4)
                4'h0: out_r = 16'h4089;
                4'h1: out_r = 16'h4089;
                4'h2: out_r = 16'h4089;
                4'h8: out_r = 16'h408b;
                4'h9: out_r = 16'h408b;
                4'ha: out_r = 16'h408b;
                4'hb: out_r = 16'h408b;
                4'hc: out_r = 16'h408b;
                4'hd: out_r = 16'h408c;
                4'he: out_r = 16'h408c;
                4'hf: out_r = 16'h408c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h408d;
              case (mant_lo4)
                4'h0: out_r = 16'h408c;
                4'h1: out_r = 16'h408c;
                4'h7: out_r = 16'h408e;
                4'h8: out_r = 16'h408e;
                4'h9: out_r = 16'h408e;
                4'ha: out_r = 16'h408e;
                4'hb: out_r = 16'h408e;
                4'hc: out_r = 16'h408f;
                4'hd: out_r = 16'h408f;
                4'he: out_r = 16'h408f;
                4'hf: out_r = 16'h408f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4091;
              case (mant_lo4)
                4'h0: out_r = 16'h408f;
                4'h1: out_r = 16'h408f;
                4'h2: out_r = 16'h4090;
                4'h3: out_r = 16'h4090;
                4'h4: out_r = 16'h4090;
                4'h5: out_r = 16'h4090;
                4'h6: out_r = 16'h4090;
                4'hd: out_r = 16'h4092;
                4'he: out_r = 16'h4092;
                4'hf: out_r = 16'h4092;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4094;
              case (mant_lo4)
                4'h0: out_r = 16'h4092;
                4'h1: out_r = 16'h4092;
                4'h2: out_r = 16'h4092;
                4'h3: out_r = 16'h4093;
                4'h4: out_r = 16'h4093;
                4'h5: out_r = 16'h4093;
                4'h6: out_r = 16'h4093;
                4'h7: out_r = 16'h4093;
                4'h8: out_r = 16'h4093;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4096;
              case (mant_lo4)
                4'h0: out_r = 16'h4095;
                4'h1: out_r = 16'h4095;
                4'h2: out_r = 16'h4095;
                4'h3: out_r = 16'h4095;
                4'h4: out_r = 16'h4095;
                4'h5: out_r = 16'h4095;
                4'hd: out_r = 16'h4097;
                4'he: out_r = 16'h4097;
                4'hf: out_r = 16'h4097;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4098;
              case (mant_lo4)
                4'h0: out_r = 16'h4097;
                4'h1: out_r = 16'h4097;
                4'h2: out_r = 16'h4097;
                4'h3: out_r = 16'h4097;
                4'hb: out_r = 16'h4099;
                4'hc: out_r = 16'h4099;
                4'hd: out_r = 16'h4099;
                4'he: out_r = 16'h4099;
                4'hf: out_r = 16'h4099;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h409a;
              case (mant_lo4)
                4'h0: out_r = 16'h4099;
                4'h1: out_r = 16'h4099;
                4'h2: out_r = 16'h4099;
                4'ha: out_r = 16'h409b;
                4'hb: out_r = 16'h409b;
                4'hc: out_r = 16'h409b;
                4'hd: out_r = 16'h409b;
                4'he: out_r = 16'h409b;
                4'hf: out_r = 16'h409b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h086: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h409c;
              case (mant_lo4)
                4'h0: out_r = 16'h409b;
                4'h6: out_r = 16'h409d;
                4'h7: out_r = 16'h409d;
                4'h8: out_r = 16'h409d;
                4'h9: out_r = 16'h409d;
                4'ha: out_r = 16'h409e;
                4'hb: out_r = 16'h409e;
                4'hc: out_r = 16'h409e;
                4'hd: out_r = 16'h409e;
                4'he: out_r = 16'h409f;
                4'hf: out_r = 16'h409f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40a1;
              case (mant_lo4)
                4'h0: out_r = 16'h409f;
                4'h1: out_r = 16'h409f;
                4'h2: out_r = 16'h409f;
                4'h3: out_r = 16'h40a0;
                4'h4: out_r = 16'h40a0;
                4'h5: out_r = 16'h40a0;
                4'h6: out_r = 16'h40a0;
                4'hc: out_r = 16'h40a2;
                4'hd: out_r = 16'h40a2;
                4'he: out_r = 16'h40a2;
                4'hf: out_r = 16'h40a2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40a3;
              case (mant_lo4)
                4'h0: out_r = 16'h40a2;
                4'h6: out_r = 16'h40a4;
                4'h7: out_r = 16'h40a4;
                4'h8: out_r = 16'h40a4;
                4'h9: out_r = 16'h40a4;
                4'ha: out_r = 16'h40a4;
                4'hb: out_r = 16'h40a5;
                4'hc: out_r = 16'h40a5;
                4'hd: out_r = 16'h40a5;
                4'he: out_r = 16'h40a5;
                4'hf: out_r = 16'h40a5;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40a7;
              case (mant_lo4)
                4'h0: out_r = 16'h40a5;
                4'h1: out_r = 16'h40a6;
                4'h2: out_r = 16'h40a6;
                4'h3: out_r = 16'h40a6;
                4'h4: out_r = 16'h40a6;
                4'h5: out_r = 16'h40a6;
                4'hc: out_r = 16'h40a8;
                4'hd: out_r = 16'h40a8;
                4'he: out_r = 16'h40a8;
                4'hf: out_r = 16'h40a8;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40aa;
              case (mant_lo4)
                4'h0: out_r = 16'h40a8;
                4'h1: out_r = 16'h40a8;
                4'h2: out_r = 16'h40a9;
                4'h3: out_r = 16'h40a9;
                4'h4: out_r = 16'h40a9;
                4'h5: out_r = 16'h40a9;
                4'h6: out_r = 16'h40a9;
                4'h7: out_r = 16'h40a9;
                4'hf: out_r = 16'h40ab;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40ac;
              case (mant_lo4)
                4'h0: out_r = 16'h40ab;
                4'h1: out_r = 16'h40ab;
                4'h2: out_r = 16'h40ab;
                4'h3: out_r = 16'h40ab;
                4'h4: out_r = 16'h40ab;
                4'hc: out_r = 16'h40ad;
                4'hd: out_r = 16'h40ad;
                4'he: out_r = 16'h40ad;
                4'hf: out_r = 16'h40ad;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40ae;
              case (mant_lo4)
                4'h0: out_r = 16'h40ad;
                4'h1: out_r = 16'h40ad;
                4'h2: out_r = 16'h40ad;
                4'ha: out_r = 16'h40af;
                4'hb: out_r = 16'h40af;
                4'hc: out_r = 16'h40af;
                4'hd: out_r = 16'h40af;
                4'he: out_r = 16'h40af;
                4'hf: out_r = 16'h40af;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40b0;
              case (mant_lo4)
                4'h0: out_r = 16'h40af;
                4'h9: out_r = 16'h40b1;
                4'ha: out_r = 16'h40b1;
                4'hb: out_r = 16'h40b1;
                4'hc: out_r = 16'h40b1;
                4'hd: out_r = 16'h40b1;
                4'he: out_r = 16'h40b1;
                4'hf: out_r = 16'h40b1;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h087: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40b2;
              case (mant_lo4)
                4'h0: out_r = 16'h40b1;
                4'h5: out_r = 16'h40b3;
                4'h6: out_r = 16'h40b3;
                4'h7: out_r = 16'h40b3;
                4'h8: out_r = 16'h40b3;
                4'h9: out_r = 16'h40b4;
                4'ha: out_r = 16'h40b4;
                4'hb: out_r = 16'h40b4;
                4'hc: out_r = 16'h40b4;
                4'hd: out_r = 16'h40b5;
                4'he: out_r = 16'h40b5;
                4'hf: out_r = 16'h40b5;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40b7;
              case (mant_lo4)
                4'h0: out_r = 16'h40b5;
                4'h1: out_r = 16'h40b5;
                4'h2: out_r = 16'h40b6;
                4'h3: out_r = 16'h40b6;
                4'h4: out_r = 16'h40b6;
                4'h5: out_r = 16'h40b6;
                4'hb: out_r = 16'h40b8;
                4'hc: out_r = 16'h40b8;
                4'hd: out_r = 16'h40b8;
                4'he: out_r = 16'h40b8;
                4'hf: out_r = 16'h40b8;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40bb;
              case (mant_lo4)
                4'h0: out_r = 16'h40b9;
                4'h1: out_r = 16'h40b9;
                4'h2: out_r = 16'h40b9;
                4'h3: out_r = 16'h40b9;
                4'h4: out_r = 16'h40b9;
                4'h5: out_r = 16'h40ba;
                4'h6: out_r = 16'h40ba;
                4'h7: out_r = 16'h40ba;
                4'h8: out_r = 16'h40ba;
                4'h9: out_r = 16'h40ba;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40bd;
              case (mant_lo4)
                4'h0: out_r = 16'h40bc;
                4'h1: out_r = 16'h40bc;
                4'h2: out_r = 16'h40bc;
                4'h3: out_r = 16'h40bc;
                4'h4: out_r = 16'h40bc;
                4'hb: out_r = 16'h40be;
                4'hc: out_r = 16'h40be;
                4'hd: out_r = 16'h40be;
                4'he: out_r = 16'h40be;
                4'hf: out_r = 16'h40be;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40bf;
              case (mant_lo4)
                4'h0: out_r = 16'h40be;
                4'h7: out_r = 16'h40c0;
                4'h8: out_r = 16'h40c0;
                4'h9: out_r = 16'h40c0;
                4'ha: out_r = 16'h40c0;
                4'hb: out_r = 16'h40c0;
                4'hc: out_r = 16'h40c0;
                4'hd: out_r = 16'h40c1;
                4'he: out_r = 16'h40c1;
                4'hf: out_r = 16'h40c1;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40c2;
              case (mant_lo4)
                4'h0: out_r = 16'h40c1;
                4'h1: out_r = 16'h40c1;
                4'h2: out_r = 16'h40c1;
                4'h3: out_r = 16'h40c1;
                4'hb: out_r = 16'h40c3;
                4'hc: out_r = 16'h40c3;
                4'hd: out_r = 16'h40c3;
                4'he: out_r = 16'h40c3;
                4'hf: out_r = 16'h40c3;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40c4;
              case (mant_lo4)
                4'h0: out_r = 16'h40c3;
                4'h1: out_r = 16'h40c3;
                4'h9: out_r = 16'h40c5;
                4'ha: out_r = 16'h40c5;
                4'hb: out_r = 16'h40c5;
                4'hc: out_r = 16'h40c5;
                4'hd: out_r = 16'h40c5;
                4'he: out_r = 16'h40c5;
                4'hf: out_r = 16'h40c5;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40c6;
              case (mant_lo4)
                4'h8: out_r = 16'h40c7;
                4'h9: out_r = 16'h40c7;
                4'ha: out_r = 16'h40c7;
                4'hb: out_r = 16'h40c7;
                4'hc: out_r = 16'h40c7;
                4'hd: out_r = 16'h40c7;
                4'he: out_r = 16'h40c7;
                4'hf: out_r = 16'h40c8;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h088: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40ca;
              case (mant_lo4)
                4'h0: out_r = 16'h40c8;
                4'h1: out_r = 16'h40c8;
                4'h2: out_r = 16'h40c8;
                4'h3: out_r = 16'h40c8;
                4'h4: out_r = 16'h40c9;
                4'h5: out_r = 16'h40c9;
                4'h6: out_r = 16'h40c9;
                4'h7: out_r = 16'h40c9;
                4'hd: out_r = 16'h40cb;
                4'he: out_r = 16'h40cb;
                4'hf: out_r = 16'h40cb;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40cc;
              case (mant_lo4)
                4'h0: out_r = 16'h40cb;
                4'h6: out_r = 16'h40cd;
                4'h7: out_r = 16'h40cd;
                4'h8: out_r = 16'h40cd;
                4'h9: out_r = 16'h40cd;
                4'ha: out_r = 16'h40ce;
                4'hb: out_r = 16'h40ce;
                4'hc: out_r = 16'h40ce;
                4'hd: out_r = 16'h40ce;
                4'he: out_r = 16'h40ce;
                4'hf: out_r = 16'h40cf;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40d1;
              case (mant_lo4)
                4'h0: out_r = 16'h40cf;
                4'h1: out_r = 16'h40cf;
                4'h2: out_r = 16'h40cf;
                4'h3: out_r = 16'h40cf;
                4'h4: out_r = 16'h40d0;
                4'h5: out_r = 16'h40d0;
                4'h6: out_r = 16'h40d0;
                4'h7: out_r = 16'h40d0;
                4'h8: out_r = 16'h40d0;
                4'hf: out_r = 16'h40d2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40d3;
              case (mant_lo4)
                4'h0: out_r = 16'h40d2;
                4'h1: out_r = 16'h40d2;
                4'h2: out_r = 16'h40d2;
                4'h3: out_r = 16'h40d2;
                4'ha: out_r = 16'h40d4;
                4'hb: out_r = 16'h40d4;
                4'hc: out_r = 16'h40d4;
                4'hd: out_r = 16'h40d4;
                4'he: out_r = 16'h40d4;
                4'hf: out_r = 16'h40d4;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40d5;
              case (mant_lo4)
                4'h6: out_r = 16'h40d6;
                4'h7: out_r = 16'h40d6;
                4'h8: out_r = 16'h40d6;
                4'h9: out_r = 16'h40d6;
                4'ha: out_r = 16'h40d6;
                4'hb: out_r = 16'h40d6;
                4'hc: out_r = 16'h40d7;
                4'hd: out_r = 16'h40d7;
                4'he: out_r = 16'h40d7;
                4'hf: out_r = 16'h40d7;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40d9;
              case (mant_lo4)
                4'h0: out_r = 16'h40d7;
                4'h1: out_r = 16'h40d7;
                4'h2: out_r = 16'h40d7;
                4'h3: out_r = 16'h40d8;
                4'h4: out_r = 16'h40d8;
                4'h5: out_r = 16'h40d8;
                4'h6: out_r = 16'h40d8;
                4'h7: out_r = 16'h40d8;
                4'h8: out_r = 16'h40d8;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40db;
              case (mant_lo4)
                4'h0: out_r = 16'h40da;
                4'h1: out_r = 16'h40da;
                4'h2: out_r = 16'h40da;
                4'h3: out_r = 16'h40da;
                4'h4: out_r = 16'h40da;
                4'h5: out_r = 16'h40da;
                4'h6: out_r = 16'h40da;
                4'hf: out_r = 16'h40dc;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40dd;
              case (mant_lo4)
                4'h0: out_r = 16'h40dc;
                4'h1: out_r = 16'h40dc;
                4'h2: out_r = 16'h40dc;
                4'h3: out_r = 16'h40dc;
                4'h4: out_r = 16'h40dc;
                4'h5: out_r = 16'h40dc;
                4'he: out_r = 16'h40de;
                4'hf: out_r = 16'h40de;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h089: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40e0;
              case (mant_lo4)
                4'h0: out_r = 16'h40de;
                4'h1: out_r = 16'h40de;
                4'h2: out_r = 16'h40de;
                4'h3: out_r = 16'h40df;
                4'h4: out_r = 16'h40df;
                4'h5: out_r = 16'h40df;
                4'h6: out_r = 16'h40df;
                4'hc: out_r = 16'h40e1;
                4'hd: out_r = 16'h40e1;
                4'he: out_r = 16'h40e1;
                4'hf: out_r = 16'h40e1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40e2;
              case (mant_lo4)
                4'h5: out_r = 16'h40e3;
                4'h6: out_r = 16'h40e3;
                4'h7: out_r = 16'h40e3;
                4'h8: out_r = 16'h40e3;
                4'h9: out_r = 16'h40e4;
                4'ha: out_r = 16'h40e4;
                4'hb: out_r = 16'h40e4;
                4'hc: out_r = 16'h40e4;
                4'hd: out_r = 16'h40e4;
                4'he: out_r = 16'h40e5;
                4'hf: out_r = 16'h40e5;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40e7;
              case (mant_lo4)
                4'h0: out_r = 16'h40e5;
                4'h1: out_r = 16'h40e5;
                4'h2: out_r = 16'h40e5;
                4'h3: out_r = 16'h40e6;
                4'h4: out_r = 16'h40e6;
                4'h5: out_r = 16'h40e6;
                4'h6: out_r = 16'h40e6;
                4'h7: out_r = 16'h40e6;
                4'he: out_r = 16'h40e8;
                4'hf: out_r = 16'h40e8;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40e9;
              case (mant_lo4)
                4'h0: out_r = 16'h40e8;
                4'h1: out_r = 16'h40e8;
                4'h2: out_r = 16'h40e8;
                4'h9: out_r = 16'h40ea;
                4'ha: out_r = 16'h40ea;
                4'hb: out_r = 16'h40ea;
                4'hc: out_r = 16'h40ea;
                4'hd: out_r = 16'h40ea;
                4'he: out_r = 16'h40ea;
                4'hf: out_r = 16'h40eb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40ec;
              case (mant_lo4)
                4'h0: out_r = 16'h40eb;
                4'h1: out_r = 16'h40eb;
                4'h2: out_r = 16'h40eb;
                4'h3: out_r = 16'h40eb;
                4'h4: out_r = 16'h40eb;
                4'hb: out_r = 16'h40ed;
                4'hc: out_r = 16'h40ed;
                4'hd: out_r = 16'h40ed;
                4'he: out_r = 16'h40ed;
                4'hf: out_r = 16'h40ed;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40ef;
              case (mant_lo4)
                4'h0: out_r = 16'h40ed;
                4'h1: out_r = 16'h40ed;
                4'h2: out_r = 16'h40ee;
                4'h3: out_r = 16'h40ee;
                4'h4: out_r = 16'h40ee;
                4'h5: out_r = 16'h40ee;
                4'h6: out_r = 16'h40ee;
                4'h7: out_r = 16'h40ee;
                4'hf: out_r = 16'h40f0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40f1;
              case (mant_lo4)
                4'h0: out_r = 16'h40f0;
                4'h1: out_r = 16'h40f0;
                4'h2: out_r = 16'h40f0;
                4'h3: out_r = 16'h40f0;
                4'h4: out_r = 16'h40f0;
                4'h5: out_r = 16'h40f0;
                4'hd: out_r = 16'h40f2;
                4'he: out_r = 16'h40f2;
                4'hf: out_r = 16'h40f2;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40f3;
              case (mant_lo4)
                4'h0: out_r = 16'h40f2;
                4'h1: out_r = 16'h40f2;
                4'h2: out_r = 16'h40f2;
                4'h3: out_r = 16'h40f2;
                4'h4: out_r = 16'h40f2;
                4'hd: out_r = 16'h40f4;
                4'he: out_r = 16'h40f4;
                4'hf: out_r = 16'h40f4;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40f5;
              case (mant_lo4)
                4'h0: out_r = 16'h40f4;
                4'h1: out_r = 16'h40f4;
                4'h2: out_r = 16'h40f4;
                4'h7: out_r = 16'h40f6;
                4'h8: out_r = 16'h40f6;
                4'h9: out_r = 16'h40f6;
                4'ha: out_r = 16'h40f6;
                4'hb: out_r = 16'h40f7;
                4'hc: out_r = 16'h40f7;
                4'hd: out_r = 16'h40f7;
                4'he: out_r = 16'h40f7;
                4'hf: out_r = 16'h40f8;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40f9;
              case (mant_lo4)
                4'h0: out_r = 16'h40f8;
                4'h1: out_r = 16'h40f8;
                4'h2: out_r = 16'h40f8;
                4'h3: out_r = 16'h40f8;
                4'h9: out_r = 16'h40fa;
                4'ha: out_r = 16'h40fa;
                4'hb: out_r = 16'h40fa;
                4'hc: out_r = 16'h40fa;
                4'hd: out_r = 16'h40fb;
                4'he: out_r = 16'h40fb;
                4'hf: out_r = 16'h40fb;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40fc;
              case (mant_lo4)
                4'h0: out_r = 16'h40fb;
                4'h1: out_r = 16'h40fb;
                4'h8: out_r = 16'h40fd;
                4'h9: out_r = 16'h40fd;
                4'ha: out_r = 16'h40fd;
                4'hb: out_r = 16'h40fd;
                4'hc: out_r = 16'h40fd;
                4'hd: out_r = 16'h40fe;
                4'he: out_r = 16'h40fe;
                4'hf: out_r = 16'h40fe;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4100;
              case (mant_lo4)
                4'h0: out_r = 16'h40fe;
                4'h1: out_r = 16'h40fe;
                4'h2: out_r = 16'h40ff;
                4'h3: out_r = 16'h40ff;
                4'h4: out_r = 16'h40ff;
                4'h5: out_r = 16'h40ff;
                4'h6: out_r = 16'h40ff;
                4'h7: out_r = 16'h40ff;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4101;
              case (mant_lo4)
                4'h0: out_r = 16'h4100;
                4'hd: out_r = 16'h4102;
                4'he: out_r = 16'h4102;
                4'hf: out_r = 16'h4102;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4102;
              case (mant_lo4)
                4'ha: out_r = 16'h4103;
                4'hb: out_r = 16'h4103;
                4'hc: out_r = 16'h4103;
                4'hd: out_r = 16'h4103;
                4'he: out_r = 16'h4103;
                4'hf: out_r = 16'h4103;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4103;
              case (mant_lo4)
                4'h8: out_r = 16'h4104;
                4'h9: out_r = 16'h4104;
                4'ha: out_r = 16'h4104;
                4'hb: out_r = 16'h4104;
                4'hc: out_r = 16'h4104;
                4'hd: out_r = 16'h4104;
                4'he: out_r = 16'h4104;
                4'hf: out_r = 16'h4104;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4105;
              case (mant_lo4)
                4'h0: out_r = 16'h4104;
                4'h1: out_r = 16'h4104;
                4'h2: out_r = 16'h4104;
                4'h3: out_r = 16'h4104;
                4'h4: out_r = 16'h4104;
                4'h5: out_r = 16'h4104;
                4'h6: out_r = 16'h4104;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4106;
              case (mant_lo4)
                4'h0: out_r = 16'h4105;
                4'h1: out_r = 16'h4105;
                4'h2: out_r = 16'h4105;
                4'h3: out_r = 16'h4105;
                4'hc: out_r = 16'h4107;
                4'hd: out_r = 16'h4107;
                4'he: out_r = 16'h4107;
                4'hf: out_r = 16'h4107;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4108;
              case (mant_lo4)
                4'h0: out_r = 16'h4107;
                4'h1: out_r = 16'h4107;
                4'h2: out_r = 16'h4107;
                4'h3: out_r = 16'h4107;
                4'h4: out_r = 16'h4107;
                4'hf: out_r = 16'h4109;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4109;
              case (mant_lo4)
                4'h9: out_r = 16'h410a;
                4'ha: out_r = 16'h410a;
                4'hb: out_r = 16'h410a;
                4'hc: out_r = 16'h410a;
                4'hd: out_r = 16'h410a;
                4'he: out_r = 16'h410a;
                4'hf: out_r = 16'h410a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h410b;
              case (mant_lo4)
                4'h0: out_r = 16'h410a;
                4'h1: out_r = 16'h410a;
                4'h2: out_r = 16'h410a;
                4'h3: out_r = 16'h410a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h410c;
              case (mant_lo4)
                4'hc: out_r = 16'h410d;
                4'hd: out_r = 16'h410d;
                4'he: out_r = 16'h410d;
                4'hf: out_r = 16'h410d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h410d;
              case (mant_lo4)
                4'h9: out_r = 16'h410e;
                4'ha: out_r = 16'h410e;
                4'hb: out_r = 16'h410e;
                4'hc: out_r = 16'h410e;
                4'hd: out_r = 16'h410e;
                4'he: out_r = 16'h410e;
                4'hf: out_r = 16'h410e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h410f;
              case (mant_lo4)
                4'h0: out_r = 16'h410e;
                4'h1: out_r = 16'h410e;
                4'h2: out_r = 16'h410e;
                4'h3: out_r = 16'h410e;
                4'h4: out_r = 16'h410e;
                4'h5: out_r = 16'h410e;
                4'h6: out_r = 16'h410e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4110;
              case (mant_lo4)
                4'h0: out_r = 16'h410f;
                4'h1: out_r = 16'h410f;
                4'h2: out_r = 16'h410f;
                4'h3: out_r = 16'h410f;
                4'h4: out_r = 16'h410f;
                4'h5: out_r = 16'h410f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4111;
              case (mant_lo4)
                4'h0: out_r = 16'h4110;
                4'h1: out_r = 16'h4110;
                4'h2: out_r = 16'h4110;
                4'hc: out_r = 16'h4112;
                4'hd: out_r = 16'h4112;
                4'he: out_r = 16'h4112;
                4'hf: out_r = 16'h4112;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4113;
              case (mant_lo4)
                4'h0: out_r = 16'h4112;
                4'h1: out_r = 16'h4112;
                4'h2: out_r = 16'h4112;
                4'h3: out_r = 16'h4112;
                4'h4: out_r = 16'h4112;
                4'he: out_r = 16'h4114;
                4'hf: out_r = 16'h4114;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4114;
              case (mant_lo4)
                4'h8: out_r = 16'h4115;
                4'h9: out_r = 16'h4115;
                4'ha: out_r = 16'h4115;
                4'hb: out_r = 16'h4115;
                4'hc: out_r = 16'h4115;
                4'hd: out_r = 16'h4115;
                4'he: out_r = 16'h4115;
                4'hf: out_r = 16'h4115;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4116;
              case (mant_lo4)
                4'h0: out_r = 16'h4115;
                4'h1: out_r = 16'h4115;
                4'h2: out_r = 16'h4115;
                4'hf: out_r = 16'h4117;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4117;
              case (mant_lo4)
                4'hb: out_r = 16'h4118;
                4'hc: out_r = 16'h4118;
                4'hd: out_r = 16'h4118;
                4'he: out_r = 16'h4118;
                4'hf: out_r = 16'h4118;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4118;
              case (mant_lo4)
                4'h8: out_r = 16'h4119;
                4'h9: out_r = 16'h4119;
                4'ha: out_r = 16'h4119;
                4'hb: out_r = 16'h4119;
                4'hc: out_r = 16'h4119;
                4'hd: out_r = 16'h4119;
                4'he: out_r = 16'h4119;
                4'hf: out_r = 16'h4119;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h411a;
              case (mant_lo4)
                4'h0: out_r = 16'h4119;
                4'h1: out_r = 16'h4119;
                4'h2: out_r = 16'h4119;
                4'h3: out_r = 16'h4119;
                4'h4: out_r = 16'h4119;
                4'h5: out_r = 16'h4119;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h411b;
              case (mant_lo4)
                4'h0: out_r = 16'h411a;
                4'h1: out_r = 16'h411a;
                4'h2: out_r = 16'h411a;
                4'h3: out_r = 16'h411a;
                4'h4: out_r = 16'h411a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h411c;
              case (mant_lo4)
                4'h0: out_r = 16'h411b;
                4'h1: out_r = 16'h411b;
                4'hb: out_r = 16'h411d;
                4'hc: out_r = 16'h411d;
                4'hd: out_r = 16'h411d;
                4'he: out_r = 16'h411d;
                4'hf: out_r = 16'h411d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h411e;
              case (mant_lo4)
                4'h0: out_r = 16'h411d;
                4'h1: out_r = 16'h411d;
                4'h2: out_r = 16'h411d;
                4'h3: out_r = 16'h411d;
                4'hd: out_r = 16'h411f;
                4'he: out_r = 16'h411f;
                4'hf: out_r = 16'h411f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4120;
              case (mant_lo4)
                4'h0: out_r = 16'h411f;
                4'h1: out_r = 16'h411f;
                4'h2: out_r = 16'h411f;
                4'h3: out_r = 16'h411f;
                4'h4: out_r = 16'h411f;
                4'h5: out_r = 16'h411f;
                4'h6: out_r = 16'h411f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4121;
              case (mant_lo4)
                4'h0: out_r = 16'h4120;
                4'h1: out_r = 16'h4120;
                4'hd: out_r = 16'h4122;
                4'he: out_r = 16'h4122;
                4'hf: out_r = 16'h4122;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4122;
              case (mant_lo4)
                4'ha: out_r = 16'h4123;
                4'hb: out_r = 16'h4123;
                4'hc: out_r = 16'h4123;
                4'hd: out_r = 16'h4123;
                4'he: out_r = 16'h4123;
                4'hf: out_r = 16'h4123;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4124;
              case (mant_lo4)
                4'h0: out_r = 16'h4123;
                4'h1: out_r = 16'h4123;
                4'h2: out_r = 16'h4123;
                4'h3: out_r = 16'h4123;
                4'h4: out_r = 16'h4123;
                4'h5: out_r = 16'h4123;
                4'h6: out_r = 16'h4123;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4125;
              case (mant_lo4)
                4'h0: out_r = 16'h4124;
                4'h1: out_r = 16'h4124;
                4'h2: out_r = 16'h4124;
                4'h3: out_r = 16'h4124;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4126;
              case (mant_lo4)
                4'h0: out_r = 16'h4125;
                4'h1: out_r = 16'h4125;
                4'h2: out_r = 16'h4125;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4127;
              case (mant_lo4)
                4'h0: out_r = 16'h4126;
                4'h1: out_r = 16'h4126;
                4'ha: out_r = 16'h4128;
                4'hb: out_r = 16'h4128;
                4'hc: out_r = 16'h4128;
                4'hd: out_r = 16'h4128;
                4'he: out_r = 16'h4128;
                4'hf: out_r = 16'h4128;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4129;
              case (mant_lo4)
                4'h0: out_r = 16'h4128;
                4'h1: out_r = 16'h4128;
                4'h2: out_r = 16'h4128;
                4'hc: out_r = 16'h412a;
                4'hd: out_r = 16'h412a;
                4'he: out_r = 16'h412a;
                4'hf: out_r = 16'h412a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h412b;
              case (mant_lo4)
                4'h0: out_r = 16'h412a;
                4'h1: out_r = 16'h412a;
                4'h2: out_r = 16'h412a;
                4'h3: out_r = 16'h412a;
                4'h4: out_r = 16'h412a;
                4'h5: out_r = 16'h412a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h412c;
              case (mant_lo4)
                4'h0: out_r = 16'h412b;
                4'hc: out_r = 16'h412d;
                4'hd: out_r = 16'h412d;
                4'he: out_r = 16'h412d;
                4'hf: out_r = 16'h412d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h412d;
              case (mant_lo4)
                4'h9: out_r = 16'h412e;
                4'ha: out_r = 16'h412e;
                4'hb: out_r = 16'h412e;
                4'hc: out_r = 16'h412e;
                4'hd: out_r = 16'h412e;
                4'he: out_r = 16'h412e;
                4'hf: out_r = 16'h412e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h412f;
              case (mant_lo4)
                4'h0: out_r = 16'h412e;
                4'h1: out_r = 16'h412e;
                4'h2: out_r = 16'h412e;
                4'h3: out_r = 16'h412e;
                4'h4: out_r = 16'h412e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4130;
              case (mant_lo4)
                4'h0: out_r = 16'h412f;
                4'h1: out_r = 16'h412f;
                4'h2: out_r = 16'h412f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4131;
              case (mant_lo4)
                4'h0: out_r = 16'h4130;
                4'h1: out_r = 16'h4130;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4132;
              case (mant_lo4)
                4'h0: out_r = 16'h4131;
                4'h9: out_r = 16'h4133;
                4'ha: out_r = 16'h4133;
                4'hb: out_r = 16'h4133;
                4'hc: out_r = 16'h4133;
                4'hd: out_r = 16'h4133;
                4'he: out_r = 16'h4133;
                4'hf: out_r = 16'h4133;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4134;
              case (mant_lo4)
                4'h0: out_r = 16'h4133;
                4'h1: out_r = 16'h4133;
                4'hb: out_r = 16'h4135;
                4'hc: out_r = 16'h4135;
                4'hd: out_r = 16'h4135;
                4'he: out_r = 16'h4135;
                4'hf: out_r = 16'h4135;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4136;
              case (mant_lo4)
                4'h0: out_r = 16'h4135;
                4'h1: out_r = 16'h4135;
                4'h2: out_r = 16'h4135;
                4'h3: out_r = 16'h4135;
                4'h4: out_r = 16'h4135;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4137;
              case (mant_lo4)
                4'hb: out_r = 16'h4138;
                4'hc: out_r = 16'h4138;
                4'hd: out_r = 16'h4138;
                4'he: out_r = 16'h4138;
                4'hf: out_r = 16'h4138;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4139;
              case (mant_lo4)
                4'h0: out_r = 16'h4138;
                4'h1: out_r = 16'h4138;
                4'h2: out_r = 16'h4138;
                4'h3: out_r = 16'h4138;
                4'h4: out_r = 16'h4138;
                4'h5: out_r = 16'h4138;
                4'h6: out_r = 16'h4138;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h413a;
              case (mant_lo4)
                4'h0: out_r = 16'h4139;
                4'h1: out_r = 16'h4139;
                4'h2: out_r = 16'h4139;
                4'h3: out_r = 16'h4139;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h413b;
              case (mant_lo4)
                4'h0: out_r = 16'h413a;
                4'h1: out_r = 16'h413a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h413c;
            end
            default: begin end
          endcase
        end
        9'h090: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h413d;
              case (mant_lo4)
                4'h8: out_r = 16'h413e;
                4'h9: out_r = 16'h413e;
                4'ha: out_r = 16'h413e;
                4'hb: out_r = 16'h413e;
                4'hc: out_r = 16'h413e;
                4'hd: out_r = 16'h413e;
                4'he: out_r = 16'h413e;
                4'hf: out_r = 16'h413e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h413f;
              case (mant_lo4)
                4'h0: out_r = 16'h413e;
                4'hb: out_r = 16'h4140;
                4'hc: out_r = 16'h4140;
                4'hd: out_r = 16'h4140;
                4'he: out_r = 16'h4140;
                4'hf: out_r = 16'h4140;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4141;
              case (mant_lo4)
                4'h0: out_r = 16'h4140;
                4'h1: out_r = 16'h4140;
                4'h2: out_r = 16'h4140;
                4'h3: out_r = 16'h4140;
                4'hf: out_r = 16'h4142;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4142;
              case (mant_lo4)
                4'ha: out_r = 16'h4143;
                4'hb: out_r = 16'h4143;
                4'hc: out_r = 16'h4143;
                4'hd: out_r = 16'h4143;
                4'he: out_r = 16'h4143;
                4'hf: out_r = 16'h4143;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4144;
              case (mant_lo4)
                4'h0: out_r = 16'h4143;
                4'h1: out_r = 16'h4143;
                4'h2: out_r = 16'h4143;
                4'h3: out_r = 16'h4143;
                4'h4: out_r = 16'h4143;
                4'h5: out_r = 16'h4143;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4145;
              case (mant_lo4)
                4'h0: out_r = 16'h4144;
                4'h1: out_r = 16'h4144;
                4'h2: out_r = 16'h4144;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4146;
              case (mant_lo4)
                4'h0: out_r = 16'h4145;
                4'hf: out_r = 16'h4147;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4147;
              case (mant_lo4)
                4'he: out_r = 16'h4148;
                4'hf: out_r = 16'h4148;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h091: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4148;
              case (mant_lo4)
                4'h8: out_r = 16'h4149;
                4'h9: out_r = 16'h4149;
                4'ha: out_r = 16'h4149;
                4'hb: out_r = 16'h4149;
                4'hc: out_r = 16'h4149;
                4'hd: out_r = 16'h4149;
                4'he: out_r = 16'h4149;
                4'hf: out_r = 16'h4149;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h414a;
              case (mant_lo4)
                4'ha: out_r = 16'h414b;
                4'hb: out_r = 16'h414b;
                4'hc: out_r = 16'h414b;
                4'hd: out_r = 16'h414b;
                4'he: out_r = 16'h414b;
                4'hf: out_r = 16'h414b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h414c;
              case (mant_lo4)
                4'h0: out_r = 16'h414b;
                4'h1: out_r = 16'h414b;
                4'h2: out_r = 16'h414b;
                4'h3: out_r = 16'h414b;
                4'he: out_r = 16'h414d;
                4'hf: out_r = 16'h414d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h414d;
              case (mant_lo4)
                4'h9: out_r = 16'h414e;
                4'ha: out_r = 16'h414e;
                4'hb: out_r = 16'h414e;
                4'hc: out_r = 16'h414e;
                4'hd: out_r = 16'h414e;
                4'he: out_r = 16'h414e;
                4'hf: out_r = 16'h414e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h414f;
              case (mant_lo4)
                4'h0: out_r = 16'h414e;
                4'h1: out_r = 16'h414e;
                4'h2: out_r = 16'h414e;
                4'h3: out_r = 16'h414e;
                4'h4: out_r = 16'h414e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4150;
              case (mant_lo4)
                4'h0: out_r = 16'h414f;
                4'h1: out_r = 16'h414f;
                4'hf: out_r = 16'h4151;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4151;
              case (mant_lo4)
                4'he: out_r = 16'h4152;
                4'hf: out_r = 16'h4152;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4152;
              case (mant_lo4)
                4'hd: out_r = 16'h4153;
                4'he: out_r = 16'h4153;
                4'hf: out_r = 16'h4153;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h092: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4154;
              case (mant_lo4)
                4'h0: out_r = 16'h4153;
                4'h1: out_r = 16'h4153;
                4'h2: out_r = 16'h4153;
                4'h3: out_r = 16'h4153;
                4'h4: out_r = 16'h4153;
                4'h5: out_r = 16'h4153;
                4'h6: out_r = 16'h4153;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4155;
              case (mant_lo4)
                4'h9: out_r = 16'h4156;
                4'ha: out_r = 16'h4156;
                4'hb: out_r = 16'h4156;
                4'hc: out_r = 16'h4156;
                4'hd: out_r = 16'h4156;
                4'he: out_r = 16'h4156;
                4'hf: out_r = 16'h4156;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4157;
              case (mant_lo4)
                4'h0: out_r = 16'h4156;
                4'h1: out_r = 16'h4156;
                4'h2: out_r = 16'h4156;
                4'hd: out_r = 16'h4158;
                4'he: out_r = 16'h4158;
                4'hf: out_r = 16'h4158;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4158;
              case (mant_lo4)
                4'h8: out_r = 16'h4159;
                4'h9: out_r = 16'h4159;
                4'ha: out_r = 16'h4159;
                4'hb: out_r = 16'h4159;
                4'hc: out_r = 16'h4159;
                4'hd: out_r = 16'h4159;
                4'he: out_r = 16'h4159;
                4'hf: out_r = 16'h4159;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h415a;
              case (mant_lo4)
                4'h0: out_r = 16'h4159;
                4'h1: out_r = 16'h4159;
                4'h2: out_r = 16'h4159;
                4'h3: out_r = 16'h4159;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h415b;
              case (mant_lo4)
                4'h0: out_r = 16'h415a;
                4'he: out_r = 16'h415c;
                4'hf: out_r = 16'h415c;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h415c;
              case (mant_lo4)
                4'hc: out_r = 16'h415d;
                4'hd: out_r = 16'h415d;
                4'he: out_r = 16'h415d;
                4'hf: out_r = 16'h415d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h415d;
              case (mant_lo4)
                4'hc: out_r = 16'h415e;
                4'hd: out_r = 16'h415e;
                4'he: out_r = 16'h415e;
                4'hf: out_r = 16'h415e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h093: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h415f;
              case (mant_lo4)
                4'h0: out_r = 16'h415e;
                4'h1: out_r = 16'h415e;
                4'h2: out_r = 16'h415e;
                4'h3: out_r = 16'h415e;
                4'h4: out_r = 16'h415e;
                4'h5: out_r = 16'h415e;
                4'hf: out_r = 16'h4160;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4160;
              case (mant_lo4)
                4'h8: out_r = 16'h4161;
                4'h9: out_r = 16'h4161;
                4'ha: out_r = 16'h4161;
                4'hb: out_r = 16'h4161;
                4'hc: out_r = 16'h4161;
                4'hd: out_r = 16'h4161;
                4'he: out_r = 16'h4161;
                4'hf: out_r = 16'h4161;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4162;
              case (mant_lo4)
                4'h0: out_r = 16'h4161;
                4'h1: out_r = 16'h4161;
                4'hc: out_r = 16'h4163;
                4'hd: out_r = 16'h4163;
                4'he: out_r = 16'h4163;
                4'hf: out_r = 16'h4163;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4164;
              case (mant_lo4)
                4'h0: out_r = 16'h4163;
                4'h1: out_r = 16'h4163;
                4'h2: out_r = 16'h4163;
                4'h3: out_r = 16'h4163;
                4'h4: out_r = 16'h4163;
                4'h5: out_r = 16'h4163;
                4'h6: out_r = 16'h4163;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4165;
              case (mant_lo4)
                4'h0: out_r = 16'h4164;
                4'h1: out_r = 16'h4164;
                4'h2: out_r = 16'h4164;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4166;
              case (mant_lo4)
                4'hd: out_r = 16'h4167;
                4'he: out_r = 16'h4167;
                4'hf: out_r = 16'h4167;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4167;
              case (mant_lo4)
                4'hb: out_r = 16'h4168;
                4'hc: out_r = 16'h4168;
                4'hd: out_r = 16'h4168;
                4'he: out_r = 16'h4168;
                4'hf: out_r = 16'h4168;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4168;
              case (mant_lo4)
                4'ha: out_r = 16'h4169;
                4'hb: out_r = 16'h4169;
                4'hc: out_r = 16'h4169;
                4'hd: out_r = 16'h4169;
                4'he: out_r = 16'h4169;
                4'hf: out_r = 16'h4169;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h094: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h416a;
              case (mant_lo4)
                4'h0: out_r = 16'h4169;
                4'h1: out_r = 16'h4169;
                4'h2: out_r = 16'h4169;
                4'h3: out_r = 16'h4169;
                4'h4: out_r = 16'h4169;
                4'he: out_r = 16'h416b;
                4'hf: out_r = 16'h416b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h416c;
              case (mant_lo4)
                4'h0: out_r = 16'h416b;
                4'h1: out_r = 16'h416b;
                4'h2: out_r = 16'h416b;
                4'h3: out_r = 16'h416b;
                4'h4: out_r = 16'h416b;
                4'h5: out_r = 16'h416b;
                4'h6: out_r = 16'h416b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h416d;
              case (mant_lo4)
                4'h0: out_r = 16'h416c;
                4'hb: out_r = 16'h416e;
                4'hc: out_r = 16'h416e;
                4'hd: out_r = 16'h416e;
                4'he: out_r = 16'h416e;
                4'hf: out_r = 16'h416e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h416f;
              case (mant_lo4)
                4'h0: out_r = 16'h416e;
                4'h1: out_r = 16'h416e;
                4'h2: out_r = 16'h416e;
                4'h3: out_r = 16'h416e;
                4'h4: out_r = 16'h416e;
                4'h5: out_r = 16'h416e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4170;
              case (mant_lo4)
                4'h0: out_r = 16'h416f;
                4'h1: out_r = 16'h416f;
                4'he: out_r = 16'h4171;
                4'hf: out_r = 16'h4171;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4171;
              case (mant_lo4)
                4'hc: out_r = 16'h4172;
                4'hd: out_r = 16'h4172;
                4'he: out_r = 16'h4172;
                4'hf: out_r = 16'h4172;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4172;
              case (mant_lo4)
                4'ha: out_r = 16'h4173;
                4'hb: out_r = 16'h4173;
                4'hc: out_r = 16'h4173;
                4'hd: out_r = 16'h4173;
                4'he: out_r = 16'h4173;
                4'hf: out_r = 16'h4173;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4173;
              case (mant_lo4)
                4'h9: out_r = 16'h4174;
                4'ha: out_r = 16'h4174;
                4'hb: out_r = 16'h4174;
                4'hc: out_r = 16'h4174;
                4'hd: out_r = 16'h4174;
                4'he: out_r = 16'h4174;
                4'hf: out_r = 16'h4174;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h095: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4175;
              case (mant_lo4)
                4'h0: out_r = 16'h4174;
                4'h1: out_r = 16'h4174;
                4'h2: out_r = 16'h4174;
                4'h3: out_r = 16'h4174;
                4'h4: out_r = 16'h4174;
                4'hd: out_r = 16'h4176;
                4'he: out_r = 16'h4176;
                4'hf: out_r = 16'h4176;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4177;
              case (mant_lo4)
                4'h0: out_r = 16'h4176;
                4'h1: out_r = 16'h4176;
                4'h2: out_r = 16'h4176;
                4'h3: out_r = 16'h4176;
                4'h4: out_r = 16'h4176;
                4'h5: out_r = 16'h4176;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4178;
              case (mant_lo4)
                4'ha: out_r = 16'h4179;
                4'hb: out_r = 16'h4179;
                4'hc: out_r = 16'h4179;
                4'hd: out_r = 16'h4179;
                4'he: out_r = 16'h4179;
                4'hf: out_r = 16'h4179;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h417a;
              case (mant_lo4)
                4'h0: out_r = 16'h4179;
                4'h1: out_r = 16'h4179;
                4'h2: out_r = 16'h4179;
                4'h3: out_r = 16'h4179;
                4'h4: out_r = 16'h4179;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h417b;
              case (mant_lo4)
                4'h0: out_r = 16'h417a;
                4'hd: out_r = 16'h417c;
                4'he: out_r = 16'h417c;
                4'hf: out_r = 16'h417c;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h417c;
              case (mant_lo4)
                4'ha: out_r = 16'h417d;
                4'hb: out_r = 16'h417d;
                4'hc: out_r = 16'h417d;
                4'hd: out_r = 16'h417d;
                4'he: out_r = 16'h417d;
                4'hf: out_r = 16'h417d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h417d;
              case (mant_lo4)
                4'h8: out_r = 16'h417e;
                4'h9: out_r = 16'h417e;
                4'ha: out_r = 16'h417e;
                4'hb: out_r = 16'h417e;
                4'hc: out_r = 16'h417e;
                4'hd: out_r = 16'h417e;
                4'he: out_r = 16'h417e;
                4'hf: out_r = 16'h417e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h417f;
              case (mant_lo4)
                4'h0: out_r = 16'h417e;
                4'h1: out_r = 16'h417e;
                4'h2: out_r = 16'h417e;
                4'h3: out_r = 16'h417e;
                4'h4: out_r = 16'h417e;
                4'h5: out_r = 16'h417e;
                4'h6: out_r = 16'h417e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h096: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4180;
              case (mant_lo4)
                4'h0: out_r = 16'h417f;
                4'h1: out_r = 16'h417f;
                4'h2: out_r = 16'h417f;
                4'h3: out_r = 16'h417f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4181;
              case (mant_lo4)
                4'h0: out_r = 16'h4180;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4182;
              case (mant_lo4)
                4'h0: out_r = 16'h4181;
                4'h1: out_r = 16'h4181;
                4'h2: out_r = 16'h4181;
                4'h3: out_r = 16'h4181;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4182;
              case (mant_lo4)
                4'ha: out_r = 16'h4183;
                4'hb: out_r = 16'h4183;
                4'hc: out_r = 16'h4183;
                4'hd: out_r = 16'h4183;
                4'he: out_r = 16'h4183;
                4'hf: out_r = 16'h4183;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4183;
            end
            3'h5: begin
              out_r = 16'h4184;
              case (mant_lo4)
                4'h0: out_r = 16'h4183;
                4'h1: out_r = 16'h4183;
                4'h2: out_r = 16'h4183;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4184;
              case (mant_lo4)
                4'he: out_r = 16'h4185;
                4'hf: out_r = 16'h4185;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4185;
            end
            default: begin end
          endcase
        end
        9'h097: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4186;
              case (mant_lo4)
                4'h0: out_r = 16'h4185;
                4'h1: out_r = 16'h4185;
                4'h2: out_r = 16'h4185;
                4'h3: out_r = 16'h4185;
                4'h4: out_r = 16'h4185;
                4'h5: out_r = 16'h4185;
                4'h6: out_r = 16'h4185;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4186;
              case (mant_lo4)
                4'h9: out_r = 16'h4187;
                4'ha: out_r = 16'h4187;
                4'hb: out_r = 16'h4187;
                4'hc: out_r = 16'h4187;
                4'hd: out_r = 16'h4187;
                4'he: out_r = 16'h4187;
                4'hf: out_r = 16'h4187;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4187;
              case (mant_lo4)
                4'he: out_r = 16'h4188;
                4'hf: out_r = 16'h4188;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4188;
            end
            3'h4: begin
              out_r = 16'h4189;
              case (mant_lo4)
                4'h0: out_r = 16'h4188;
                4'h1: out_r = 16'h4188;
                4'h2: out_r = 16'h4188;
                4'h3: out_r = 16'h4188;
                4'h4: out_r = 16'h4188;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4189;
              case (mant_lo4)
                4'hf: out_r = 16'h418a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h418a;
            end
            3'h7: begin
              out_r = 16'h418a;
              case (mant_lo4)
                4'hc: out_r = 16'h418b;
                4'hd: out_r = 16'h418b;
                4'he: out_r = 16'h418b;
                4'hf: out_r = 16'h418b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h098: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h418b;
              case (mant_lo4)
                4'hf: out_r = 16'h418c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h418c;
            end
            3'h2: begin
              out_r = 16'h418d;
              case (mant_lo4)
                4'h0: out_r = 16'h418c;
                4'h1: out_r = 16'h418c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h418d;
              case (mant_lo4)
                4'h8: out_r = 16'h418e;
                4'h9: out_r = 16'h418e;
                4'ha: out_r = 16'h418e;
                4'hb: out_r = 16'h418e;
                4'hc: out_r = 16'h418e;
                4'hd: out_r = 16'h418e;
                4'he: out_r = 16'h418e;
                4'hf: out_r = 16'h418e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h418e;
            end
            3'h5: begin
              out_r = 16'h418f;
            end
            3'h6: begin
              out_r = 16'h418f;
              case (mant_lo4)
                4'hc: out_r = 16'h4190;
                4'hd: out_r = 16'h4190;
                4'he: out_r = 16'h4190;
                4'hf: out_r = 16'h4190;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4190;
            end
            default: begin end
          endcase
        end
        9'h099: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4191;
              case (mant_lo4)
                4'h0: out_r = 16'h4190;
                4'h1: out_r = 16'h4190;
                4'h2: out_r = 16'h4190;
                4'h3: out_r = 16'h4190;
                4'h4: out_r = 16'h4190;
                4'h5: out_r = 16'h4190;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4191;
              case (mant_lo4)
                4'h8: out_r = 16'h4192;
                4'h9: out_r = 16'h4192;
                4'ha: out_r = 16'h4192;
                4'hb: out_r = 16'h4192;
                4'hc: out_r = 16'h4192;
                4'hd: out_r = 16'h4192;
                4'he: out_r = 16'h4192;
                4'hf: out_r = 16'h4192;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4192;
              case (mant_lo4)
                4'hc: out_r = 16'h4193;
                4'hd: out_r = 16'h4193;
                4'he: out_r = 16'h4193;
                4'hf: out_r = 16'h4193;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4193;
            end
            3'h4: begin
              out_r = 16'h4194;
              case (mant_lo4)
                4'h0: out_r = 16'h4193;
                4'h1: out_r = 16'h4193;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4194;
              case (mant_lo4)
                4'hc: out_r = 16'h4195;
                4'hd: out_r = 16'h4195;
                4'he: out_r = 16'h4195;
                4'hf: out_r = 16'h4195;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4195;
            end
            3'h7: begin
              out_r = 16'h4195;
              case (mant_lo4)
                4'ha: out_r = 16'h4196;
                4'hb: out_r = 16'h4196;
                4'hc: out_r = 16'h4196;
                4'hd: out_r = 16'h4196;
                4'he: out_r = 16'h4196;
                4'hf: out_r = 16'h4196;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h09a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4196;
              case (mant_lo4)
                4'he: out_r = 16'h4197;
                4'hf: out_r = 16'h4197;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4197;
            end
            3'h2: begin
              out_r = 16'h4198;
            end
            3'h3: begin
              out_r = 16'h4199;
              case (mant_lo4)
                4'h0: out_r = 16'h4198;
                4'h1: out_r = 16'h4198;
                4'h2: out_r = 16'h4198;
                4'h3: out_r = 16'h4198;
                4'h4: out_r = 16'h4198;
                4'h5: out_r = 16'h4198;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4199;
              case (mant_lo4)
                4'he: out_r = 16'h419a;
                4'hf: out_r = 16'h419a;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h419a;
            end
            3'h6: begin
              out_r = 16'h419a;
              case (mant_lo4)
                4'h9: out_r = 16'h419b;
                4'ha: out_r = 16'h419b;
                4'hb: out_r = 16'h419b;
                4'hc: out_r = 16'h419b;
                4'hd: out_r = 16'h419b;
                4'he: out_r = 16'h419b;
                4'hf: out_r = 16'h419b;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h419b;
            end
            default: begin end
          endcase
        end
        9'h09b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h419c;
              case (mant_lo4)
                4'h0: out_r = 16'h419b;
                4'h1: out_r = 16'h419b;
                4'h2: out_r = 16'h419b;
                4'h3: out_r = 16'h419b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h419d;
              case (mant_lo4)
                4'h0: out_r = 16'h419c;
                4'h1: out_r = 16'h419c;
                4'h2: out_r = 16'h419c;
                4'h3: out_r = 16'h419c;
                4'h4: out_r = 16'h419c;
                4'h5: out_r = 16'h419c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h419d;
              case (mant_lo4)
                4'ha: out_r = 16'h419e;
                4'hb: out_r = 16'h419e;
                4'hc: out_r = 16'h419e;
                4'hd: out_r = 16'h419e;
                4'he: out_r = 16'h419e;
                4'hf: out_r = 16'h419e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h419e;
            end
            3'h4: begin
              out_r = 16'h419f;
            end
            3'h5: begin
              out_r = 16'h419f;
              case (mant_lo4)
                4'ha: out_r = 16'h41a0;
                4'hb: out_r = 16'h41a0;
                4'hc: out_r = 16'h41a0;
                4'hd: out_r = 16'h41a0;
                4'he: out_r = 16'h41a0;
                4'hf: out_r = 16'h41a0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41a0;
            end
            3'h7: begin
              out_r = 16'h41a1;
              case (mant_lo4)
                4'h0: out_r = 16'h41a0;
                4'h1: out_r = 16'h41a0;
                4'h2: out_r = 16'h41a0;
                4'h3: out_r = 16'h41a0;
                4'h4: out_r = 16'h41a0;
                4'h5: out_r = 16'h41a0;
                4'h6: out_r = 16'h41a0;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h09c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41a1;
              case (mant_lo4)
                4'hc: out_r = 16'h41a2;
                4'hd: out_r = 16'h41a2;
                4'he: out_r = 16'h41a2;
                4'hf: out_r = 16'h41a2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41a2;
              case (mant_lo4)
                4'hf: out_r = 16'h41a3;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41a3;
            end
            3'h3: begin
              out_r = 16'h41a4;
              case (mant_lo4)
                4'h0: out_r = 16'h41a3;
                4'h1: out_r = 16'h41a3;
                4'h2: out_r = 16'h41a3;
                4'h3: out_r = 16'h41a3;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41a4;
              case (mant_lo4)
                4'hc: out_r = 16'h41a5;
                4'hd: out_r = 16'h41a5;
                4'he: out_r = 16'h41a5;
                4'hf: out_r = 16'h41a5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41a5;
            end
            3'h6: begin
              out_r = 16'h41a6;
              case (mant_lo4)
                4'h0: out_r = 16'h41a5;
                4'h1: out_r = 16'h41a5;
                4'h2: out_r = 16'h41a5;
                4'h3: out_r = 16'h41a5;
                4'h4: out_r = 16'h41a5;
                4'h5: out_r = 16'h41a5;
                4'h6: out_r = 16'h41a5;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41a6;
            end
            default: begin end
          endcase
        end
        9'h09d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41a7;
              case (mant_lo4)
                4'h0: out_r = 16'h41a6;
                4'h1: out_r = 16'h41a6;
                4'h2: out_r = 16'h41a6;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41a8;
              case (mant_lo4)
                4'h0: out_r = 16'h41a7;
                4'h1: out_r = 16'h41a7;
                4'h2: out_r = 16'h41a7;
                4'h3: out_r = 16'h41a7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41a8;
              case (mant_lo4)
                4'h8: out_r = 16'h41a9;
                4'h9: out_r = 16'h41a9;
                4'ha: out_r = 16'h41a9;
                4'hb: out_r = 16'h41a9;
                4'hc: out_r = 16'h41a9;
                4'hd: out_r = 16'h41a9;
                4'he: out_r = 16'h41a9;
                4'hf: out_r = 16'h41a9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41a9;
              case (mant_lo4)
                4'he: out_r = 16'h41aa;
                4'hf: out_r = 16'h41aa;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41aa;
            end
            3'h5: begin
              out_r = 16'h41ab;
              case (mant_lo4)
                4'h0: out_r = 16'h41aa;
                4'h1: out_r = 16'h41aa;
                4'h2: out_r = 16'h41aa;
                4'h3: out_r = 16'h41aa;
                4'h4: out_r = 16'h41aa;
                4'h5: out_r = 16'h41aa;
                4'h6: out_r = 16'h41aa;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41ab;
            end
            3'h7: begin
              out_r = 16'h41ac;
              case (mant_lo4)
                4'h0: out_r = 16'h41ab;
                4'h1: out_r = 16'h41ab;
                4'h2: out_r = 16'h41ab;
                4'h3: out_r = 16'h41ab;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h09e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ac;
              case (mant_lo4)
                4'ha: out_r = 16'h41ad;
                4'hb: out_r = 16'h41ad;
                4'hc: out_r = 16'h41ad;
                4'hd: out_r = 16'h41ad;
                4'he: out_r = 16'h41ad;
                4'hf: out_r = 16'h41ad;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41ad;
              case (mant_lo4)
                4'hd: out_r = 16'h41ae;
                4'he: out_r = 16'h41ae;
                4'hf: out_r = 16'h41ae;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41ae;
            end
            3'h3: begin
              out_r = 16'h41af;
              case (mant_lo4)
                4'h0: out_r = 16'h41ae;
                4'h1: out_r = 16'h41ae;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41af;
              case (mant_lo4)
                4'h9: out_r = 16'h41b0;
                4'ha: out_r = 16'h41b0;
                4'hb: out_r = 16'h41b0;
                4'hc: out_r = 16'h41b0;
                4'hd: out_r = 16'h41b0;
                4'he: out_r = 16'h41b0;
                4'hf: out_r = 16'h41b0;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41b0;
            end
            3'h6: begin
              out_r = 16'h41b1;
              case (mant_lo4)
                4'h0: out_r = 16'h41b0;
                4'h1: out_r = 16'h41b0;
                4'h2: out_r = 16'h41b0;
                4'h3: out_r = 16'h41b0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41b1;
            end
            default: begin end
          endcase
        end
        9'h09f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41b2;
              case (mant_lo4)
                4'h0: out_r = 16'h41b1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41b3;
              case (mant_lo4)
                4'h0: out_r = 16'h41b2;
                4'h1: out_r = 16'h41b2;
                4'h2: out_r = 16'h41b2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41b4;
              case (mant_lo4)
                4'h0: out_r = 16'h41b3;
                4'h1: out_r = 16'h41b3;
                4'h2: out_r = 16'h41b3;
                4'h3: out_r = 16'h41b3;
                4'h4: out_r = 16'h41b3;
                4'h5: out_r = 16'h41b3;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41b4;
              case (mant_lo4)
                4'hc: out_r = 16'h41b5;
                4'hd: out_r = 16'h41b5;
                4'he: out_r = 16'h41b5;
                4'hf: out_r = 16'h41b5;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41b5;
            end
            3'h5: begin
              out_r = 16'h41b6;
              case (mant_lo4)
                4'h0: out_r = 16'h41b5;
                4'h1: out_r = 16'h41b5;
                4'h2: out_r = 16'h41b5;
                4'h3: out_r = 16'h41b5;
                4'h4: out_r = 16'h41b5;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41b6;
            end
            3'h7: begin
              out_r = 16'h41b7;
              case (mant_lo4)
                4'h0: out_r = 16'h41b6;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41b7;
              case (mant_lo4)
                4'h9: out_r = 16'h41b8;
                4'ha: out_r = 16'h41b8;
                4'hb: out_r = 16'h41b8;
                4'hc: out_r = 16'h41b8;
                4'hd: out_r = 16'h41b8;
                4'he: out_r = 16'h41b8;
                4'hf: out_r = 16'h41b8;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41b8;
              case (mant_lo4)
                4'hb: out_r = 16'h41b9;
                4'hc: out_r = 16'h41b9;
                4'hd: out_r = 16'h41b9;
                4'he: out_r = 16'h41b9;
                4'hf: out_r = 16'h41b9;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41b9;
            end
            3'h3: begin
              out_r = 16'h41ba;
            end
            3'h4: begin
              out_r = 16'h41bb;
              case (mant_lo4)
                4'h0: out_r = 16'h41ba;
                4'h1: out_r = 16'h41ba;
                4'h2: out_r = 16'h41ba;
                4'h3: out_r = 16'h41ba;
                4'h4: out_r = 16'h41ba;
                4'h5: out_r = 16'h41ba;
                4'h6: out_r = 16'h41ba;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41bb;
            end
            3'h6: begin
              out_r = 16'h41bc;
              case (mant_lo4)
                4'h0: out_r = 16'h41bb;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41bc;
              case (mant_lo4)
                4'hf: out_r = 16'h41bd;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41bd;
            end
            3'h1: begin
              out_r = 16'h41be;
              case (mant_lo4)
                4'h0: out_r = 16'h41bd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41bf;
              case (mant_lo4)
                4'h0: out_r = 16'h41be;
                4'h1: out_r = 16'h41be;
                4'h2: out_r = 16'h41be;
                4'h3: out_r = 16'h41be;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41bf;
              case (mant_lo4)
                4'ha: out_r = 16'h41c0;
                4'hb: out_r = 16'h41c0;
                4'hc: out_r = 16'h41c0;
                4'hd: out_r = 16'h41c0;
                4'he: out_r = 16'h41c0;
                4'hf: out_r = 16'h41c0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41c0;
            end
            3'h5: begin
              out_r = 16'h41c1;
              case (mant_lo4)
                4'h0: out_r = 16'h41c0;
                4'h1: out_r = 16'h41c0;
                4'h2: out_r = 16'h41c0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41c1;
              case (mant_lo4)
                4'hf: out_r = 16'h41c2;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41c2;
            end
            default: begin end
          endcase
        end
        9'h0a2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41c3;
              case (mant_lo4)
                4'h0: out_r = 16'h41c2;
                4'h1: out_r = 16'h41c2;
                4'h2: out_r = 16'h41c2;
                4'h3: out_r = 16'h41c2;
                4'h4: out_r = 16'h41c2;
                4'h5: out_r = 16'h41c2;
                4'h6: out_r = 16'h41c2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41c3;
              case (mant_lo4)
                4'h9: out_r = 16'h41c4;
                4'ha: out_r = 16'h41c4;
                4'hb: out_r = 16'h41c4;
                4'hc: out_r = 16'h41c4;
                4'hd: out_r = 16'h41c4;
                4'he: out_r = 16'h41c4;
                4'hf: out_r = 16'h41c4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41c4;
              case (mant_lo4)
                4'he: out_r = 16'h41c5;
                4'hf: out_r = 16'h41c5;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41c5;
            end
            3'h4: begin
              out_r = 16'h41c6;
              case (mant_lo4)
                4'h0: out_r = 16'h41c5;
                4'h1: out_r = 16'h41c5;
                4'h2: out_r = 16'h41c5;
                4'h3: out_r = 16'h41c5;
                4'h4: out_r = 16'h41c5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41c6;
              case (mant_lo4)
                4'hf: out_r = 16'h41c7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41c7;
            end
            3'h7: begin
              out_r = 16'h41c7;
              case (mant_lo4)
                4'hc: out_r = 16'h41c8;
                4'hd: out_r = 16'h41c8;
                4'he: out_r = 16'h41c8;
                4'hf: out_r = 16'h41c8;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41c8;
              case (mant_lo4)
                4'hf: out_r = 16'h41c9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41c9;
            end
            3'h2: begin
              out_r = 16'h41ca;
              case (mant_lo4)
                4'h0: out_r = 16'h41c9;
                4'h1: out_r = 16'h41c9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41ca;
              case (mant_lo4)
                4'h8: out_r = 16'h41cb;
                4'h9: out_r = 16'h41cb;
                4'ha: out_r = 16'h41cb;
                4'hb: out_r = 16'h41cb;
                4'hc: out_r = 16'h41cb;
                4'hd: out_r = 16'h41cb;
                4'he: out_r = 16'h41cb;
                4'hf: out_r = 16'h41cb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41cb;
            end
            3'h5: begin
              out_r = 16'h41cc;
            end
            3'h6: begin
              out_r = 16'h41cc;
              case (mant_lo4)
                4'hc: out_r = 16'h41cd;
                4'hd: out_r = 16'h41cd;
                4'he: out_r = 16'h41cd;
                4'hf: out_r = 16'h41cd;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41cd;
            end
            default: begin end
          endcase
        end
        9'h0a4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ce;
              case (mant_lo4)
                4'h0: out_r = 16'h41cd;
                4'h1: out_r = 16'h41cd;
                4'h2: out_r = 16'h41cd;
                4'h3: out_r = 16'h41cd;
                4'h4: out_r = 16'h41cd;
                4'h5: out_r = 16'h41cd;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41ce;
              case (mant_lo4)
                4'h8: out_r = 16'h41cf;
                4'h9: out_r = 16'h41cf;
                4'ha: out_r = 16'h41cf;
                4'hb: out_r = 16'h41cf;
                4'hc: out_r = 16'h41cf;
                4'hd: out_r = 16'h41cf;
                4'he: out_r = 16'h41cf;
                4'hf: out_r = 16'h41cf;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41cf;
              case (mant_lo4)
                4'hc: out_r = 16'h41d0;
                4'hd: out_r = 16'h41d0;
                4'he: out_r = 16'h41d0;
                4'hf: out_r = 16'h41d0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41d0;
            end
            3'h4: begin
              out_r = 16'h41d1;
              case (mant_lo4)
                4'h0: out_r = 16'h41d0;
                4'h1: out_r = 16'h41d0;
                4'h2: out_r = 16'h41d0;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41d1;
              case (mant_lo4)
                4'hc: out_r = 16'h41d2;
                4'hd: out_r = 16'h41d2;
                4'he: out_r = 16'h41d2;
                4'hf: out_r = 16'h41d2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41d2;
            end
            3'h7: begin
              out_r = 16'h41d2;
              case (mant_lo4)
                4'ha: out_r = 16'h41d3;
                4'hb: out_r = 16'h41d3;
                4'hc: out_r = 16'h41d3;
                4'hd: out_r = 16'h41d3;
                4'he: out_r = 16'h41d3;
                4'hf: out_r = 16'h41d3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41d3;
              case (mant_lo4)
                4'he: out_r = 16'h41d4;
                4'hf: out_r = 16'h41d4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41d4;
            end
            3'h2: begin
              out_r = 16'h41d5;
            end
            3'h3: begin
              out_r = 16'h41d6;
              case (mant_lo4)
                4'h0: out_r = 16'h41d5;
                4'h1: out_r = 16'h41d5;
                4'h2: out_r = 16'h41d5;
                4'h3: out_r = 16'h41d5;
                4'h4: out_r = 16'h41d5;
                4'h5: out_r = 16'h41d5;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41d6;
              case (mant_lo4)
                4'he: out_r = 16'h41d7;
                4'hf: out_r = 16'h41d7;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41d7;
            end
            3'h6: begin
              out_r = 16'h41d7;
              case (mant_lo4)
                4'h9: out_r = 16'h41d8;
                4'ha: out_r = 16'h41d8;
                4'hb: out_r = 16'h41d8;
                4'hc: out_r = 16'h41d8;
                4'hd: out_r = 16'h41d8;
                4'he: out_r = 16'h41d8;
                4'hf: out_r = 16'h41d8;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41d8;
            end
            default: begin end
          endcase
        end
        9'h0a6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41d9;
              case (mant_lo4)
                4'h0: out_r = 16'h41d8;
                4'h1: out_r = 16'h41d8;
                4'h2: out_r = 16'h41d8;
                4'h3: out_r = 16'h41d8;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41da;
              case (mant_lo4)
                4'h0: out_r = 16'h41d9;
                4'h1: out_r = 16'h41d9;
                4'h2: out_r = 16'h41d9;
                4'h3: out_r = 16'h41d9;
                4'h4: out_r = 16'h41d9;
                4'h5: out_r = 16'h41d9;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41da;
              case (mant_lo4)
                4'ha: out_r = 16'h41db;
                4'hb: out_r = 16'h41db;
                4'hc: out_r = 16'h41db;
                4'hd: out_r = 16'h41db;
                4'he: out_r = 16'h41db;
                4'hf: out_r = 16'h41db;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41db;
            end
            3'h4: begin
              out_r = 16'h41dc;
            end
            3'h5: begin
              out_r = 16'h41dc;
              case (mant_lo4)
                4'ha: out_r = 16'h41dd;
                4'hb: out_r = 16'h41dd;
                4'hc: out_r = 16'h41dd;
                4'hd: out_r = 16'h41dd;
                4'he: out_r = 16'h41dd;
                4'hf: out_r = 16'h41dd;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41dd;
            end
            3'h7: begin
              out_r = 16'h41de;
              case (mant_lo4)
                4'h0: out_r = 16'h41dd;
                4'h1: out_r = 16'h41dd;
                4'h2: out_r = 16'h41dd;
                4'h3: out_r = 16'h41dd;
                4'h4: out_r = 16'h41dd;
                4'h5: out_r = 16'h41dd;
                4'h6: out_r = 16'h41dd;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41de;
              case (mant_lo4)
                4'hc: out_r = 16'h41df;
                4'hd: out_r = 16'h41df;
                4'he: out_r = 16'h41df;
                4'hf: out_r = 16'h41df;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41df;
              case (mant_lo4)
                4'hf: out_r = 16'h41e0;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41e0;
            end
            3'h3: begin
              out_r = 16'h41e1;
              case (mant_lo4)
                4'h0: out_r = 16'h41e0;
                4'h1: out_r = 16'h41e0;
                4'h2: out_r = 16'h41e0;
                4'h3: out_r = 16'h41e0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41e1;
              case (mant_lo4)
                4'hc: out_r = 16'h41e2;
                4'hd: out_r = 16'h41e2;
                4'he: out_r = 16'h41e2;
                4'hf: out_r = 16'h41e2;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41e2;
            end
            3'h6: begin
              out_r = 16'h41e3;
              case (mant_lo4)
                4'h0: out_r = 16'h41e2;
                4'h1: out_r = 16'h41e2;
                4'h2: out_r = 16'h41e2;
                4'h3: out_r = 16'h41e2;
                4'h4: out_r = 16'h41e2;
                4'h5: out_r = 16'h41e2;
                4'h6: out_r = 16'h41e2;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41e3;
            end
            default: begin end
          endcase
        end
        9'h0a8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41e4;
              case (mant_lo4)
                4'h0: out_r = 16'h41e3;
                4'h1: out_r = 16'h41e3;
                4'h2: out_r = 16'h41e3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41e5;
              case (mant_lo4)
                4'h0: out_r = 16'h41e4;
                4'h1: out_r = 16'h41e4;
                4'h2: out_r = 16'h41e4;
                4'h3: out_r = 16'h41e4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41e5;
              case (mant_lo4)
                4'h8: out_r = 16'h41e6;
                4'h9: out_r = 16'h41e6;
                4'ha: out_r = 16'h41e6;
                4'hb: out_r = 16'h41e6;
                4'hc: out_r = 16'h41e6;
                4'hd: out_r = 16'h41e6;
                4'he: out_r = 16'h41e6;
                4'hf: out_r = 16'h41e6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41e6;
              case (mant_lo4)
                4'he: out_r = 16'h41e7;
                4'hf: out_r = 16'h41e7;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41e7;
            end
            3'h5: begin
              out_r = 16'h41e8;
              case (mant_lo4)
                4'h0: out_r = 16'h41e7;
                4'h1: out_r = 16'h41e7;
                4'h2: out_r = 16'h41e7;
                4'h3: out_r = 16'h41e7;
                4'h4: out_r = 16'h41e7;
                4'h5: out_r = 16'h41e7;
                4'h6: out_r = 16'h41e7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41e8;
            end
            3'h7: begin
              out_r = 16'h41e9;
              case (mant_lo4)
                4'h0: out_r = 16'h41e8;
                4'h1: out_r = 16'h41e8;
                4'h2: out_r = 16'h41e8;
                4'h3: out_r = 16'h41e8;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41e9;
              case (mant_lo4)
                4'hb: out_r = 16'h41ea;
                4'hc: out_r = 16'h41ea;
                4'hd: out_r = 16'h41ea;
                4'he: out_r = 16'h41ea;
                4'hf: out_r = 16'h41ea;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41ea;
              case (mant_lo4)
                4'hd: out_r = 16'h41eb;
                4'he: out_r = 16'h41eb;
                4'hf: out_r = 16'h41eb;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41eb;
            end
            3'h3: begin
              out_r = 16'h41ec;
              case (mant_lo4)
                4'h0: out_r = 16'h41eb;
                4'h1: out_r = 16'h41eb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41ec;
              case (mant_lo4)
                4'h9: out_r = 16'h41ed;
                4'ha: out_r = 16'h41ed;
                4'hb: out_r = 16'h41ed;
                4'hc: out_r = 16'h41ed;
                4'hd: out_r = 16'h41ed;
                4'he: out_r = 16'h41ed;
                4'hf: out_r = 16'h41ed;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41ed;
            end
            3'h6: begin
              out_r = 16'h41ee;
              case (mant_lo4)
                4'h0: out_r = 16'h41ed;
                4'h1: out_r = 16'h41ed;
                4'h2: out_r = 16'h41ed;
                4'h3: out_r = 16'h41ed;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41ee;
            end
            default: begin end
          endcase
        end
        9'h0aa: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ef;
              case (mant_lo4)
                4'h0: out_r = 16'h41ee;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41f0;
              case (mant_lo4)
                4'h0: out_r = 16'h41ef;
                4'h1: out_r = 16'h41ef;
                4'h2: out_r = 16'h41ef;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41f1;
              case (mant_lo4)
                4'h0: out_r = 16'h41f0;
                4'h1: out_r = 16'h41f0;
                4'h2: out_r = 16'h41f0;
                4'h3: out_r = 16'h41f0;
                4'h4: out_r = 16'h41f0;
                4'h5: out_r = 16'h41f0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41f1;
              case (mant_lo4)
                4'hc: out_r = 16'h41f2;
                4'hd: out_r = 16'h41f2;
                4'he: out_r = 16'h41f2;
                4'hf: out_r = 16'h41f2;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41f2;
            end
            3'h5: begin
              out_r = 16'h41f3;
              case (mant_lo4)
                4'h0: out_r = 16'h41f2;
                4'h1: out_r = 16'h41f2;
                4'h2: out_r = 16'h41f2;
                4'h3: out_r = 16'h41f2;
                4'h4: out_r = 16'h41f2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41f3;
            end
            3'h7: begin
              out_r = 16'h41f4;
              case (mant_lo4)
                4'h0: out_r = 16'h41f3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0ab: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41f4;
              case (mant_lo4)
                4'h9: out_r = 16'h41f5;
                4'ha: out_r = 16'h41f5;
                4'hb: out_r = 16'h41f5;
                4'hc: out_r = 16'h41f5;
                4'hd: out_r = 16'h41f5;
                4'he: out_r = 16'h41f5;
                4'hf: out_r = 16'h41f5;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41f5;
              case (mant_lo4)
                4'hb: out_r = 16'h41f6;
                4'hc: out_r = 16'h41f6;
                4'hd: out_r = 16'h41f6;
                4'he: out_r = 16'h41f6;
                4'hf: out_r = 16'h41f6;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41f6;
            end
            3'h3: begin
              out_r = 16'h41f7;
            end
            3'h4: begin
              out_r = 16'h41f8;
              case (mant_lo4)
                4'h0: out_r = 16'h41f7;
                4'h1: out_r = 16'h41f7;
                4'h2: out_r = 16'h41f7;
                4'h3: out_r = 16'h41f7;
                4'h4: out_r = 16'h41f7;
                4'h5: out_r = 16'h41f7;
                4'h6: out_r = 16'h41f7;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41f8;
            end
            3'h6: begin
              out_r = 16'h41f9;
              case (mant_lo4)
                4'h0: out_r = 16'h41f8;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41f9;
              case (mant_lo4)
                4'hf: out_r = 16'h41fa;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0ac: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41fa;
            end
            3'h1: begin
              out_r = 16'h41fb;
              case (mant_lo4)
                4'h0: out_r = 16'h41fa;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41fc;
              case (mant_lo4)
                4'h0: out_r = 16'h41fb;
                4'h1: out_r = 16'h41fb;
                4'h2: out_r = 16'h41fb;
                4'h3: out_r = 16'h41fb;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41fc;
              case (mant_lo4)
                4'ha: out_r = 16'h41fd;
                4'hb: out_r = 16'h41fd;
                4'hc: out_r = 16'h41fd;
                4'hd: out_r = 16'h41fd;
                4'he: out_r = 16'h41fd;
                4'hf: out_r = 16'h41fd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41fd;
            end
            3'h5: begin
              out_r = 16'h41fe;
              case (mant_lo4)
                4'h0: out_r = 16'h41fd;
                4'h1: out_r = 16'h41fd;
                4'h2: out_r = 16'h41fd;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41fe;
              case (mant_lo4)
                4'hf: out_r = 16'h41ff;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41ff;
            end
            default: begin end
          endcase
        end
        9'h0ad: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4200;
              case (mant_lo4)
                4'h0: out_r = 16'h41ff;
                4'h1: out_r = 16'h41ff;
                4'h2: out_r = 16'h41ff;
                4'h3: out_r = 16'h41ff;
                4'h4: out_r = 16'h41ff;
                4'h5: out_r = 16'h41ff;
                4'h6: out_r = 16'h41ff;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4200;
            end
            3'h2: begin
              out_r = 16'h4201;
              case (mant_lo4)
                4'h0: out_r = 16'h4200;
                4'h1: out_r = 16'h4200;
                4'h2: out_r = 16'h4200;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4201;
            end
            3'h4: begin
              out_r = 16'h4201;
            end
            3'h5: begin
              out_r = 16'h4202;
              case (mant_lo4)
                4'h0: out_r = 16'h4201;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4202;
            end
            3'h7: begin
              out_r = 16'h4202;
            end
            default: begin end
          endcase
        end
        9'h0ae: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4203;
              case (mant_lo4)
                4'h0: out_r = 16'h4202;
                4'h1: out_r = 16'h4202;
                4'h2: out_r = 16'h4202;
                4'h3: out_r = 16'h4202;
                4'h4: out_r = 16'h4202;
                4'h5: out_r = 16'h4202;
                4'h6: out_r = 16'h4202;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4203;
            end
            3'h2: begin
              out_r = 16'h4203;
              case (mant_lo4)
                4'hd: out_r = 16'h4204;
                4'he: out_r = 16'h4204;
                4'hf: out_r = 16'h4204;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4204;
            end
            3'h4: begin
              out_r = 16'h4204;
            end
            3'h5: begin
              out_r = 16'h4204;
              case (mant_lo4)
                4'he: out_r = 16'h4205;
                4'hf: out_r = 16'h4205;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4205;
            end
            3'h7: begin
              out_r = 16'h4205;
            end
            default: begin end
          endcase
        end
        9'h0af: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4205;
              case (mant_lo4)
                4'hf: out_r = 16'h4206;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4206;
            end
            3'h2: begin
              out_r = 16'h4206;
            end
            3'h3: begin
              out_r = 16'h4207;
              case (mant_lo4)
                4'h0: out_r = 16'h4206;
                4'h1: out_r = 16'h4206;
                4'h2: out_r = 16'h4206;
                4'h3: out_r = 16'h4206;
                4'h4: out_r = 16'h4206;
                4'h5: out_r = 16'h4206;
                4'h6: out_r = 16'h4206;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4207;
            end
            3'h5: begin
              out_r = 16'h4207;
            end
            3'h6: begin
              out_r = 16'h4207;
              case (mant_lo4)
                4'hb: out_r = 16'h4208;
                4'hc: out_r = 16'h4208;
                4'hd: out_r = 16'h4208;
                4'he: out_r = 16'h4208;
                4'hf: out_r = 16'h4208;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4208;
            end
            default: begin end
          endcase
        end
        9'h0b0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4208;
            end
            3'h1: begin
              out_r = 16'h4209;
              case (mant_lo4)
                4'h0: out_r = 16'h4208;
                4'h1: out_r = 16'h4208;
                4'h2: out_r = 16'h4208;
                4'h3: out_r = 16'h4208;
                4'h4: out_r = 16'h4208;
                4'h5: out_r = 16'h4208;
                4'h6: out_r = 16'h4208;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4209;
            end
            3'h3: begin
              out_r = 16'h4209;
            end
            3'h4: begin
              out_r = 16'h420a;
              case (mant_lo4)
                4'h0: out_r = 16'h4209;
                4'h1: out_r = 16'h4209;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h420a;
            end
            3'h6: begin
              out_r = 16'h420a;
            end
            3'h7: begin
              out_r = 16'h420a;
              case (mant_lo4)
                4'h8: out_r = 16'h420b;
                4'h9: out_r = 16'h420b;
                4'ha: out_r = 16'h420b;
                4'hb: out_r = 16'h420b;
                4'hc: out_r = 16'h420b;
                4'hd: out_r = 16'h420b;
                4'he: out_r = 16'h420b;
                4'hf: out_r = 16'h420b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0b1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420b;
            end
            3'h1: begin
              out_r = 16'h420b;
            end
            3'h2: begin
              out_r = 16'h420c;
            end
            3'h3: begin
              out_r = 16'h420c;
            end
            3'h4: begin
              out_r = 16'h420c;
              case (mant_lo4)
                4'hd: out_r = 16'h420d;
                4'he: out_r = 16'h420d;
                4'hf: out_r = 16'h420d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h420d;
            end
            3'h6: begin
              out_r = 16'h420d;
            end
            3'h7: begin
              out_r = 16'h420d;
            end
            default: begin end
          endcase
        end
        9'h0b2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420e;
              case (mant_lo4)
                4'h0: out_r = 16'h420d;
                4'h1: out_r = 16'h420d;
                4'h2: out_r = 16'h420d;
                4'h3: out_r = 16'h420d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h420e;
            end
            3'h2: begin
              out_r = 16'h420e;
              case (mant_lo4)
                4'h9: out_r = 16'h420f;
                4'ha: out_r = 16'h420f;
                4'hb: out_r = 16'h420f;
                4'hc: out_r = 16'h420f;
                4'hd: out_r = 16'h420f;
                4'he: out_r = 16'h420f;
                4'hf: out_r = 16'h420f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h420f;
            end
            3'h4: begin
              out_r = 16'h420f;
            end
            3'h5: begin
              out_r = 16'h420f;
              case (mant_lo4)
                4'h9: out_r = 16'h4210;
                4'ha: out_r = 16'h4210;
                4'hb: out_r = 16'h4210;
                4'hc: out_r = 16'h4210;
                4'hd: out_r = 16'h4210;
                4'he: out_r = 16'h4210;
                4'hf: out_r = 16'h4210;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4210;
            end
            3'h7: begin
              out_r = 16'h4210;
            end
            default: begin end
          endcase
        end
        9'h0b3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4210;
              case (mant_lo4)
                4'hb: out_r = 16'h4211;
                4'hc: out_r = 16'h4211;
                4'hd: out_r = 16'h4211;
                4'he: out_r = 16'h4211;
                4'hf: out_r = 16'h4211;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4211;
            end
            3'h2: begin
              out_r = 16'h4211;
            end
            3'h3: begin
              out_r = 16'h4212;
              case (mant_lo4)
                4'h0: out_r = 16'h4211;
                4'h1: out_r = 16'h4211;
                4'h2: out_r = 16'h4211;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4212;
            end
            3'h5: begin
              out_r = 16'h4212;
            end
            3'h6: begin
              out_r = 16'h4213;
              case (mant_lo4)
                4'h0: out_r = 16'h4212;
                4'h1: out_r = 16'h4212;
                4'h2: out_r = 16'h4212;
                4'h3: out_r = 16'h4212;
                4'h4: out_r = 16'h4212;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4213;
            end
            default: begin end
          endcase
        end
        9'h0b4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4213;
            end
            3'h1: begin
              out_r = 16'h4214;
              case (mant_lo4)
                4'h0: out_r = 16'h4213;
                4'h1: out_r = 16'h4213;
                4'h2: out_r = 16'h4213;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4214;
            end
            3'h3: begin
              out_r = 16'h4214;
              case (mant_lo4)
                4'hd: out_r = 16'h4215;
                4'he: out_r = 16'h4215;
                4'hf: out_r = 16'h4215;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4215;
            end
            3'h5: begin
              out_r = 16'h4215;
            end
            3'h6: begin
              out_r = 16'h4215;
            end
            3'h7: begin
              out_r = 16'h4216;
              case (mant_lo4)
                4'h0: out_r = 16'h4215;
                4'h1: out_r = 16'h4215;
                4'h2: out_r = 16'h4215;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0b5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4216;
            end
            3'h1: begin
              out_r = 16'h4216;
              case (mant_lo4)
                4'hc: out_r = 16'h4217;
                4'hd: out_r = 16'h4217;
                4'he: out_r = 16'h4217;
                4'hf: out_r = 16'h4217;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4217;
            end
            3'h3: begin
              out_r = 16'h4217;
            end
            3'h4: begin
              out_r = 16'h4217;
              case (mant_lo4)
                4'h8: out_r = 16'h4218;
                4'h9: out_r = 16'h4218;
                4'ha: out_r = 16'h4218;
                4'hb: out_r = 16'h4218;
                4'hc: out_r = 16'h4218;
                4'hd: out_r = 16'h4218;
                4'he: out_r = 16'h4218;
                4'hf: out_r = 16'h4218;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4218;
            end
            3'h6: begin
              out_r = 16'h4218;
            end
            3'h7: begin
              out_r = 16'h4218;
            end
            default: begin end
          endcase
        end
        9'h0b6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4219;
              case (mant_lo4)
                4'h0: out_r = 16'h4218;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4219;
            end
            3'h2: begin
              out_r = 16'h421a;
              case (mant_lo4)
                4'h0: out_r = 16'h4219;
                4'h1: out_r = 16'h4219;
                4'h2: out_r = 16'h4219;
                4'h3: out_r = 16'h4219;
                4'h4: out_r = 16'h4219;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h421a;
            end
            3'h4: begin
              out_r = 16'h421a;
            end
            3'h5: begin
              out_r = 16'h421b;
              case (mant_lo4)
                4'h0: out_r = 16'h421a;
                4'h1: out_r = 16'h421a;
                4'h2: out_r = 16'h421a;
                4'h3: out_r = 16'h421a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h421b;
            end
            3'h7: begin
              out_r = 16'h421b;
            end
            default: begin end
          endcase
        end
        9'h0b7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h421b;
              case (mant_lo4)
                4'h8: out_r = 16'h421c;
                4'h9: out_r = 16'h421c;
                4'ha: out_r = 16'h421c;
                4'hb: out_r = 16'h421c;
                4'hc: out_r = 16'h421c;
                4'hd: out_r = 16'h421c;
                4'he: out_r = 16'h421c;
                4'hf: out_r = 16'h421c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h421c;
            end
            3'h2: begin
              out_r = 16'h421c;
              case (mant_lo4)
                4'hf: out_r = 16'h421d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h421d;
            end
            3'h4: begin
              out_r = 16'h421d;
            end
            3'h5: begin
              out_r = 16'h421d;
            end
            3'h6: begin
              out_r = 16'h421e;
            end
            3'h7: begin
              out_r = 16'h421e;
            end
            default: begin end
          endcase
        end
        9'h0b8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h421e;
            end
            3'h1: begin
              out_r = 16'h421f;
            end
            3'h2: begin
              out_r = 16'h421f;
            end
            3'h3: begin
              out_r = 16'h421f;
              case (mant_lo4)
                4'h9: out_r = 16'h4220;
                4'ha: out_r = 16'h4220;
                4'hb: out_r = 16'h4220;
                4'hc: out_r = 16'h4220;
                4'hd: out_r = 16'h4220;
                4'he: out_r = 16'h4220;
                4'hf: out_r = 16'h4220;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4220;
            end
            3'h5: begin
              out_r = 16'h4220;
            end
            3'h6: begin
              out_r = 16'h4220;
              case (mant_lo4)
                4'hd: out_r = 16'h4221;
                4'he: out_r = 16'h4221;
                4'hf: out_r = 16'h4221;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4221;
            end
            default: begin end
          endcase
        end
        9'h0b9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4221;
            end
            3'h1: begin
              out_r = 16'h4221;
              case (mant_lo4)
                4'h9: out_r = 16'h4222;
                4'ha: out_r = 16'h4222;
                4'hb: out_r = 16'h4222;
                4'hc: out_r = 16'h4222;
                4'hd: out_r = 16'h4222;
                4'he: out_r = 16'h4222;
                4'hf: out_r = 16'h4222;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4222;
            end
            3'h3: begin
              out_r = 16'h4222;
            end
            3'h4: begin
              out_r = 16'h4223;
              case (mant_lo4)
                4'h0: out_r = 16'h4222;
                4'h1: out_r = 16'h4222;
                4'h2: out_r = 16'h4222;
                4'h3: out_r = 16'h4222;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4223;
            end
            3'h6: begin
              out_r = 16'h4223;
            end
            3'h7: begin
              out_r = 16'h4223;
              case (mant_lo4)
                4'hb: out_r = 16'h4224;
                4'hc: out_r = 16'h4224;
                4'hd: out_r = 16'h4224;
                4'he: out_r = 16'h4224;
                4'hf: out_r = 16'h4224;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0ba: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4224;
            end
            3'h1: begin
              out_r = 16'h4224;
            end
            3'h2: begin
              out_r = 16'h4225;
              case (mant_lo4)
                4'h0: out_r = 16'h4224;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4225;
            end
            3'h4: begin
              out_r = 16'h4225;
              case (mant_lo4)
                4'hf: out_r = 16'h4226;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4226;
            end
            3'h6: begin
              out_r = 16'h4226;
            end
            3'h7: begin
              out_r = 16'h4226;
            end
            default: begin end
          endcase
        end
        9'h0bb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4227;
              case (mant_lo4)
                4'h0: out_r = 16'h4226;
                4'h1: out_r = 16'h4226;
                4'h2: out_r = 16'h4226;
                4'h3: out_r = 16'h4226;
                4'h4: out_r = 16'h4226;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4227;
            end
            3'h2: begin
              out_r = 16'h4227;
              case (mant_lo4)
                4'hb: out_r = 16'h4228;
                4'hc: out_r = 16'h4228;
                4'hd: out_r = 16'h4228;
                4'he: out_r = 16'h4228;
                4'hf: out_r = 16'h4228;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4228;
            end
            3'h4: begin
              out_r = 16'h4228;
            end
            3'h5: begin
              out_r = 16'h4228;
              case (mant_lo4)
                4'hb: out_r = 16'h4229;
                4'hc: out_r = 16'h4229;
                4'hd: out_r = 16'h4229;
                4'he: out_r = 16'h4229;
                4'hf: out_r = 16'h4229;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4229;
            end
            3'h7: begin
              out_r = 16'h4229;
            end
            default: begin end
          endcase
        end
        9'h0bc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4229;
              case (mant_lo4)
                4'hd: out_r = 16'h422a;
                4'he: out_r = 16'h422a;
                4'hf: out_r = 16'h422a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h422a;
            end
            3'h2: begin
              out_r = 16'h422a;
            end
            3'h3: begin
              out_r = 16'h422b;
              case (mant_lo4)
                4'h0: out_r = 16'h422a;
                4'h1: out_r = 16'h422a;
                4'h2: out_r = 16'h422a;
                4'h3: out_r = 16'h422a;
                4'h4: out_r = 16'h422a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h422b;
            end
            3'h5: begin
              out_r = 16'h422b;
            end
            3'h6: begin
              out_r = 16'h422b;
              case (mant_lo4)
                4'h8: out_r = 16'h422c;
                4'h9: out_r = 16'h422c;
                4'ha: out_r = 16'h422c;
                4'hb: out_r = 16'h422c;
                4'hc: out_r = 16'h422c;
                4'hd: out_r = 16'h422c;
                4'he: out_r = 16'h422c;
                4'hf: out_r = 16'h422c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h422c;
            end
            default: begin end
          endcase
        end
        9'h0bd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h422c;
            end
            3'h1: begin
              out_r = 16'h422d;
              case (mant_lo4)
                4'h0: out_r = 16'h422c;
                4'h1: out_r = 16'h422c;
                4'h2: out_r = 16'h422c;
                4'h3: out_r = 16'h422c;
                4'h4: out_r = 16'h422c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h422d;
            end
            3'h3: begin
              out_r = 16'h422d;
              case (mant_lo4)
                4'hf: out_r = 16'h422e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h422e;
            end
            3'h5: begin
              out_r = 16'h422e;
            end
            3'h6: begin
              out_r = 16'h422e;
            end
            3'h7: begin
              out_r = 16'h422f;
              case (mant_lo4)
                4'h0: out_r = 16'h422e;
                4'h1: out_r = 16'h422e;
                4'h2: out_r = 16'h422e;
                4'h3: out_r = 16'h422e;
                4'h4: out_r = 16'h422e;
                4'h5: out_r = 16'h422e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0be: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h422f;
            end
            3'h1: begin
              out_r = 16'h422f;
              case (mant_lo4)
                4'he: out_r = 16'h4230;
                4'hf: out_r = 16'h4230;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4230;
            end
            3'h3: begin
              out_r = 16'h4230;
            end
            3'h4: begin
              out_r = 16'h4230;
              case (mant_lo4)
                4'hb: out_r = 16'h4231;
                4'hc: out_r = 16'h4231;
                4'hd: out_r = 16'h4231;
                4'he: out_r = 16'h4231;
                4'hf: out_r = 16'h4231;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4231;
            end
            3'h6: begin
              out_r = 16'h4231;
            end
            3'h7: begin
              out_r = 16'h4231;
            end
            default: begin end
          endcase
        end
        9'h0bf: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4232;
              case (mant_lo4)
                4'h0: out_r = 16'h4231;
                4'h1: out_r = 16'h4231;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4232;
            end
            3'h2: begin
              out_r = 16'h4233;
              case (mant_lo4)
                4'h0: out_r = 16'h4232;
                4'h1: out_r = 16'h4232;
                4'h2: out_r = 16'h4232;
                4'h3: out_r = 16'h4232;
                4'h4: out_r = 16'h4232;
                4'h5: out_r = 16'h4232;
                4'h6: out_r = 16'h4232;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4233;
            end
            3'h4: begin
              out_r = 16'h4233;
            end
            3'h5: begin
              out_r = 16'h4234;
              case (mant_lo4)
                4'h0: out_r = 16'h4233;
                4'h1: out_r = 16'h4233;
                4'h2: out_r = 16'h4233;
                4'h3: out_r = 16'h4233;
                4'h4: out_r = 16'h4233;
                4'h5: out_r = 16'h4233;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4234;
            end
            3'h7: begin
              out_r = 16'h4234;
            end
            default: begin end
          endcase
        end
        9'h0c0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4234;
              case (mant_lo4)
                4'ha: out_r = 16'h4235;
                4'hb: out_r = 16'h4235;
                4'hc: out_r = 16'h4235;
                4'hd: out_r = 16'h4235;
                4'he: out_r = 16'h4235;
                4'hf: out_r = 16'h4235;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4235;
            end
            3'h2: begin
              out_r = 16'h4235;
            end
            3'h3: begin
              out_r = 16'h4236;
              case (mant_lo4)
                4'h0: out_r = 16'h4235;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4236;
            end
            3'h5: begin
              out_r = 16'h4236;
            end
            3'h6: begin
              out_r = 16'h4237;
              case (mant_lo4)
                4'h0: out_r = 16'h4236;
                4'h1: out_r = 16'h4236;
                4'h2: out_r = 16'h4236;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4237;
            end
            default: begin end
          endcase
        end
        9'h0c1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4237;
            end
            3'h1: begin
              out_r = 16'h4238;
              case (mant_lo4)
                4'h0: out_r = 16'h4237;
                4'h1: out_r = 16'h4237;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4238;
            end
            3'h3: begin
              out_r = 16'h4238;
              case (mant_lo4)
                4'hb: out_r = 16'h4239;
                4'hc: out_r = 16'h4239;
                4'hd: out_r = 16'h4239;
                4'he: out_r = 16'h4239;
                4'hf: out_r = 16'h4239;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4239;
            end
            3'h5: begin
              out_r = 16'h4239;
            end
            3'h6: begin
              out_r = 16'h4239;
            end
            3'h7: begin
              out_r = 16'h423a;
            end
            default: begin end
          endcase
        end
        9'h0c2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h423a;
            end
            3'h1: begin
              out_r = 16'h423a;
              case (mant_lo4)
                4'ha: out_r = 16'h423b;
                4'hb: out_r = 16'h423b;
                4'hc: out_r = 16'h423b;
                4'hd: out_r = 16'h423b;
                4'he: out_r = 16'h423b;
                4'hf: out_r = 16'h423b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h423b;
            end
            3'h3: begin
              out_r = 16'h423b;
            end
            3'h4: begin
              out_r = 16'h423c;
              case (mant_lo4)
                4'h0: out_r = 16'h423b;
                4'h1: out_r = 16'h423b;
                4'h2: out_r = 16'h423b;
                4'h3: out_r = 16'h423b;
                4'h4: out_r = 16'h423b;
                4'h5: out_r = 16'h423b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h423c;
            end
            3'h6: begin
              out_r = 16'h423c;
            end
            3'h7: begin
              out_r = 16'h423c;
              case (mant_lo4)
                4'he: out_r = 16'h423d;
                4'hf: out_r = 16'h423d;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0c3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h423d;
            end
            3'h1: begin
              out_r = 16'h423d;
            end
            3'h2: begin
              out_r = 16'h423e;
              case (mant_lo4)
                4'h0: out_r = 16'h423d;
                4'h1: out_r = 16'h423d;
                4'h2: out_r = 16'h423d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h423e;
            end
            3'h4: begin
              out_r = 16'h423e;
            end
            3'h5: begin
              out_r = 16'h423f;
              case (mant_lo4)
                4'h0: out_r = 16'h423e;
                4'h1: out_r = 16'h423e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h423f;
            end
            3'h7: begin
              out_r = 16'h423f;
            end
            default: begin end
          endcase
        end
        9'h0c4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4240;
              case (mant_lo4)
                4'h0: out_r = 16'h423f;
                4'h1: out_r = 16'h423f;
                4'h2: out_r = 16'h423f;
                4'h3: out_r = 16'h423f;
                4'h4: out_r = 16'h423f;
                4'h5: out_r = 16'h423f;
                4'h6: out_r = 16'h423f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4240;
            end
            3'h2: begin
              out_r = 16'h4240;
              case (mant_lo4)
                4'hd: out_r = 16'h4241;
                4'he: out_r = 16'h4241;
                4'hf: out_r = 16'h4241;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4241;
            end
            3'h4: begin
              out_r = 16'h4241;
            end
            3'h5: begin
              out_r = 16'h4241;
              case (mant_lo4)
                4'he: out_r = 16'h4242;
                4'hf: out_r = 16'h4242;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4242;
            end
            3'h7: begin
              out_r = 16'h4242;
            end
            default: begin end
          endcase
        end
        9'h0c5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4242;
              case (mant_lo4)
                4'hf: out_r = 16'h4243;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4243;
            end
            3'h2: begin
              out_r = 16'h4243;
            end
            3'h3: begin
              out_r = 16'h4244;
              case (mant_lo4)
                4'h0: out_r = 16'h4243;
                4'h1: out_r = 16'h4243;
                4'h2: out_r = 16'h4243;
                4'h3: out_r = 16'h4243;
                4'h4: out_r = 16'h4243;
                4'h5: out_r = 16'h4243;
                4'h6: out_r = 16'h4243;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4244;
            end
            3'h5: begin
              out_r = 16'h4244;
            end
            3'h6: begin
              out_r = 16'h4244;
              case (mant_lo4)
                4'hb: out_r = 16'h4245;
                4'hc: out_r = 16'h4245;
                4'hd: out_r = 16'h4245;
                4'he: out_r = 16'h4245;
                4'hf: out_r = 16'h4245;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4245;
            end
            default: begin end
          endcase
        end
        9'h0c6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4245;
            end
            3'h1: begin
              out_r = 16'h4246;
              case (mant_lo4)
                4'h0: out_r = 16'h4245;
                4'h1: out_r = 16'h4245;
                4'h2: out_r = 16'h4245;
                4'h3: out_r = 16'h4245;
                4'h4: out_r = 16'h4245;
                4'h5: out_r = 16'h4245;
                4'h6: out_r = 16'h4245;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4246;
            end
            3'h3: begin
              out_r = 16'h4246;
            end
            3'h4: begin
              out_r = 16'h4247;
              case (mant_lo4)
                4'h0: out_r = 16'h4246;
                4'h1: out_r = 16'h4246;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4247;
            end
            3'h6: begin
              out_r = 16'h4247;
            end
            3'h7: begin
              out_r = 16'h4247;
              case (mant_lo4)
                4'h9: out_r = 16'h4248;
                4'ha: out_r = 16'h4248;
                4'hb: out_r = 16'h4248;
                4'hc: out_r = 16'h4248;
                4'hd: out_r = 16'h4248;
                4'he: out_r = 16'h4248;
                4'hf: out_r = 16'h4248;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0c7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4248;
            end
            3'h1: begin
              out_r = 16'h4248;
            end
            3'h2: begin
              out_r = 16'h4249;
            end
            3'h3: begin
              out_r = 16'h4249;
            end
            3'h4: begin
              out_r = 16'h4249;
              case (mant_lo4)
                4'hd: out_r = 16'h424a;
                4'he: out_r = 16'h424a;
                4'hf: out_r = 16'h424a;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h424a;
            end
            3'h6: begin
              out_r = 16'h424a;
            end
            3'h7: begin
              out_r = 16'h424a;
            end
            default: begin end
          endcase
        end
        9'h0c8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h424b;
              case (mant_lo4)
                4'h0: out_r = 16'h424a;
                4'h1: out_r = 16'h424a;
                4'h2: out_r = 16'h424a;
                4'h3: out_r = 16'h424a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h424b;
            end
            3'h2: begin
              out_r = 16'h424b;
              case (mant_lo4)
                4'h9: out_r = 16'h424c;
                4'ha: out_r = 16'h424c;
                4'hb: out_r = 16'h424c;
                4'hc: out_r = 16'h424c;
                4'hd: out_r = 16'h424c;
                4'he: out_r = 16'h424c;
                4'hf: out_r = 16'h424c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h424c;
            end
            3'h4: begin
              out_r = 16'h424c;
            end
            3'h5: begin
              out_r = 16'h424c;
              case (mant_lo4)
                4'h9: out_r = 16'h424d;
                4'ha: out_r = 16'h424d;
                4'hb: out_r = 16'h424d;
                4'hc: out_r = 16'h424d;
                4'hd: out_r = 16'h424d;
                4'he: out_r = 16'h424d;
                4'hf: out_r = 16'h424d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h424d;
            end
            3'h7: begin
              out_r = 16'h424d;
            end
            default: begin end
          endcase
        end
        9'h0c9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h424d;
              case (mant_lo4)
                4'hb: out_r = 16'h424e;
                4'hc: out_r = 16'h424e;
                4'hd: out_r = 16'h424e;
                4'he: out_r = 16'h424e;
                4'hf: out_r = 16'h424e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h424e;
            end
            3'h2: begin
              out_r = 16'h424e;
            end
            3'h3: begin
              out_r = 16'h424f;
              case (mant_lo4)
                4'h0: out_r = 16'h424e;
                4'h1: out_r = 16'h424e;
                4'h2: out_r = 16'h424e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h424f;
            end
            3'h5: begin
              out_r = 16'h424f;
            end
            3'h6: begin
              out_r = 16'h4250;
              case (mant_lo4)
                4'h0: out_r = 16'h424f;
                4'h1: out_r = 16'h424f;
                4'h2: out_r = 16'h424f;
                4'h3: out_r = 16'h424f;
                4'h4: out_r = 16'h424f;
                4'h5: out_r = 16'h424f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4250;
            end
            default: begin end
          endcase
        end
        9'h0ca: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4250;
            end
            3'h1: begin
              out_r = 16'h4251;
              case (mant_lo4)
                4'h0: out_r = 16'h4250;
                4'h1: out_r = 16'h4250;
                4'h2: out_r = 16'h4250;
                4'h3: out_r = 16'h4250;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4251;
            end
            3'h3: begin
              out_r = 16'h4251;
              case (mant_lo4)
                4'hd: out_r = 16'h4252;
                4'he: out_r = 16'h4252;
                4'hf: out_r = 16'h4252;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4252;
            end
            3'h5: begin
              out_r = 16'h4252;
            end
            3'h6: begin
              out_r = 16'h4252;
            end
            3'h7: begin
              out_r = 16'h4253;
              case (mant_lo4)
                4'h0: out_r = 16'h4252;
                4'h1: out_r = 16'h4252;
                4'h2: out_r = 16'h4252;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0cb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4253;
            end
            3'h1: begin
              out_r = 16'h4253;
              case (mant_lo4)
                4'hc: out_r = 16'h4254;
                4'hd: out_r = 16'h4254;
                4'he: out_r = 16'h4254;
                4'hf: out_r = 16'h4254;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4254;
            end
            3'h3: begin
              out_r = 16'h4254;
            end
            3'h4: begin
              out_r = 16'h4254;
              case (mant_lo4)
                4'h8: out_r = 16'h4255;
                4'h9: out_r = 16'h4255;
                4'ha: out_r = 16'h4255;
                4'hb: out_r = 16'h4255;
                4'hc: out_r = 16'h4255;
                4'hd: out_r = 16'h4255;
                4'he: out_r = 16'h4255;
                4'hf: out_r = 16'h4255;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4255;
            end
            3'h6: begin
              out_r = 16'h4255;
            end
            3'h7: begin
              out_r = 16'h4255;
            end
            default: begin end
          endcase
        end
        9'h0cc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4256;
              case (mant_lo4)
                4'h0: out_r = 16'h4255;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4256;
            end
            3'h2: begin
              out_r = 16'h4257;
              case (mant_lo4)
                4'h0: out_r = 16'h4256;
                4'h1: out_r = 16'h4256;
                4'h2: out_r = 16'h4256;
                4'h3: out_r = 16'h4256;
                4'h4: out_r = 16'h4256;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4257;
            end
            3'h4: begin
              out_r = 16'h4257;
            end
            3'h5: begin
              out_r = 16'h4258;
              case (mant_lo4)
                4'h0: out_r = 16'h4257;
                4'h1: out_r = 16'h4257;
                4'h2: out_r = 16'h4257;
                4'h3: out_r = 16'h4257;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4258;
            end
            3'h7: begin
              out_r = 16'h4258;
            end
            default: begin end
          endcase
        end
        9'h0cd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4258;
              case (mant_lo4)
                4'h8: out_r = 16'h4259;
                4'h9: out_r = 16'h4259;
                4'ha: out_r = 16'h4259;
                4'hb: out_r = 16'h4259;
                4'hc: out_r = 16'h4259;
                4'hd: out_r = 16'h4259;
                4'he: out_r = 16'h4259;
                4'hf: out_r = 16'h4259;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4259;
            end
            3'h2: begin
              out_r = 16'h4259;
              case (mant_lo4)
                4'hf: out_r = 16'h425a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h425a;
            end
            3'h4: begin
              out_r = 16'h425a;
            end
            3'h5: begin
              out_r = 16'h425a;
            end
            3'h6: begin
              out_r = 16'h425b;
            end
            3'h7: begin
              out_r = 16'h425b;
            end
            default: begin end
          endcase
        end
        9'h0ce: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h425b;
            end
            3'h1: begin
              out_r = 16'h425c;
            end
            3'h2: begin
              out_r = 16'h425c;
            end
            3'h3: begin
              out_r = 16'h425c;
              case (mant_lo4)
                4'h9: out_r = 16'h425d;
                4'ha: out_r = 16'h425d;
                4'hb: out_r = 16'h425d;
                4'hc: out_r = 16'h425d;
                4'hd: out_r = 16'h425d;
                4'he: out_r = 16'h425d;
                4'hf: out_r = 16'h425d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h425d;
            end
            3'h5: begin
              out_r = 16'h425d;
            end
            3'h6: begin
              out_r = 16'h425d;
              case (mant_lo4)
                4'he: out_r = 16'h425e;
                4'hf: out_r = 16'h425e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h425e;
            end
            default: begin end
          endcase
        end
        9'h0cf: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h425e;
            end
            3'h1: begin
              out_r = 16'h425e;
              case (mant_lo4)
                4'h9: out_r = 16'h425f;
                4'ha: out_r = 16'h425f;
                4'hb: out_r = 16'h425f;
                4'hc: out_r = 16'h425f;
                4'hd: out_r = 16'h425f;
                4'he: out_r = 16'h425f;
                4'hf: out_r = 16'h425f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h425f;
            end
            3'h3: begin
              out_r = 16'h425f;
            end
            3'h4: begin
              out_r = 16'h4260;
              case (mant_lo4)
                4'h0: out_r = 16'h425f;
                4'h1: out_r = 16'h425f;
                4'h2: out_r = 16'h425f;
                4'h3: out_r = 16'h425f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4260;
            end
            3'h6: begin
              out_r = 16'h4260;
            end
            3'h7: begin
              out_r = 16'h4260;
              case (mant_lo4)
                4'hb: out_r = 16'h4261;
                4'hc: out_r = 16'h4261;
                4'hd: out_r = 16'h4261;
                4'he: out_r = 16'h4261;
                4'hf: out_r = 16'h4261;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0d0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4261;
            end
            3'h1: begin
              out_r = 16'h4261;
            end
            3'h2: begin
              out_r = 16'h4262;
              case (mant_lo4)
                4'h0: out_r = 16'h4261;
                4'h1: out_r = 16'h4261;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4262;
            end
            3'h4: begin
              out_r = 16'h4262;
              case (mant_lo4)
                4'hf: out_r = 16'h4263;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4263;
            end
            3'h6: begin
              out_r = 16'h4263;
            end
            3'h7: begin
              out_r = 16'h4263;
            end
            default: begin end
          endcase
        end
        9'h0d1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4264;
              case (mant_lo4)
                4'h0: out_r = 16'h4263;
                4'h1: out_r = 16'h4263;
                4'h2: out_r = 16'h4263;
                4'h3: out_r = 16'h4263;
                4'h4: out_r = 16'h4263;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4264;
            end
            3'h2: begin
              out_r = 16'h4264;
              case (mant_lo4)
                4'hb: out_r = 16'h4265;
                4'hc: out_r = 16'h4265;
                4'hd: out_r = 16'h4265;
                4'he: out_r = 16'h4265;
                4'hf: out_r = 16'h4265;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4265;
            end
            3'h4: begin
              out_r = 16'h4265;
            end
            3'h5: begin
              out_r = 16'h4265;
              case (mant_lo4)
                4'hb: out_r = 16'h4266;
                4'hc: out_r = 16'h4266;
                4'hd: out_r = 16'h4266;
                4'he: out_r = 16'h4266;
                4'hf: out_r = 16'h4266;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4266;
            end
            3'h7: begin
              out_r = 16'h4266;
            end
            default: begin end
          endcase
        end
        9'h0d2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4266;
              case (mant_lo4)
                4'hd: out_r = 16'h4267;
                4'he: out_r = 16'h4267;
                4'hf: out_r = 16'h4267;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4267;
            end
            3'h2: begin
              out_r = 16'h4267;
            end
            3'h3: begin
              out_r = 16'h4268;
              case (mant_lo4)
                4'h0: out_r = 16'h4267;
                4'h1: out_r = 16'h4267;
                4'h2: out_r = 16'h4267;
                4'h3: out_r = 16'h4267;
                4'h4: out_r = 16'h4267;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4268;
            end
            3'h5: begin
              out_r = 16'h4268;
            end
            3'h6: begin
              out_r = 16'h4268;
              case (mant_lo4)
                4'h8: out_r = 16'h4269;
                4'h9: out_r = 16'h4269;
                4'ha: out_r = 16'h4269;
                4'hb: out_r = 16'h4269;
                4'hc: out_r = 16'h4269;
                4'hd: out_r = 16'h4269;
                4'he: out_r = 16'h4269;
                4'hf: out_r = 16'h4269;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4269;
            end
            default: begin end
          endcase
        end
        9'h0d3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4269;
            end
            3'h1: begin
              out_r = 16'h426a;
              case (mant_lo4)
                4'h0: out_r = 16'h4269;
                4'h1: out_r = 16'h4269;
                4'h2: out_r = 16'h4269;
                4'h3: out_r = 16'h4269;
                4'h4: out_r = 16'h4269;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h426a;
            end
            3'h3: begin
              out_r = 16'h426a;
            end
            3'h4: begin
              out_r = 16'h426b;
            end
            3'h5: begin
              out_r = 16'h426b;
            end
            3'h6: begin
              out_r = 16'h426b;
            end
            3'h7: begin
              out_r = 16'h426c;
              case (mant_lo4)
                4'h0: out_r = 16'h426b;
                4'h1: out_r = 16'h426b;
                4'h2: out_r = 16'h426b;
                4'h3: out_r = 16'h426b;
                4'h4: out_r = 16'h426b;
                4'h5: out_r = 16'h426b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0d4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h426c;
            end
            3'h1: begin
              out_r = 16'h426c;
              case (mant_lo4)
                4'he: out_r = 16'h426d;
                4'hf: out_r = 16'h426d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h426d;
            end
            3'h3: begin
              out_r = 16'h426d;
            end
            3'h4: begin
              out_r = 16'h426d;
              case (mant_lo4)
                4'hb: out_r = 16'h426e;
                4'hc: out_r = 16'h426e;
                4'hd: out_r = 16'h426e;
                4'he: out_r = 16'h426e;
                4'hf: out_r = 16'h426e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h426e;
            end
            3'h6: begin
              out_r = 16'h426e;
            end
            3'h7: begin
              out_r = 16'h426e;
            end
            default: begin end
          endcase
        end
        9'h0d5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h426f;
              case (mant_lo4)
                4'h0: out_r = 16'h426e;
                4'h1: out_r = 16'h426e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h426f;
            end
            3'h2: begin
              out_r = 16'h4270;
              case (mant_lo4)
                4'h0: out_r = 16'h426f;
                4'h1: out_r = 16'h426f;
                4'h2: out_r = 16'h426f;
                4'h3: out_r = 16'h426f;
                4'h4: out_r = 16'h426f;
                4'h5: out_r = 16'h426f;
                4'h6: out_r = 16'h426f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4270;
            end
            3'h4: begin
              out_r = 16'h4270;
            end
            3'h5: begin
              out_r = 16'h4271;
              case (mant_lo4)
                4'h0: out_r = 16'h4270;
                4'h1: out_r = 16'h4270;
                4'h2: out_r = 16'h4270;
                4'h3: out_r = 16'h4270;
                4'h4: out_r = 16'h4270;
                4'h5: out_r = 16'h4270;
                4'h6: out_r = 16'h4270;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4271;
            end
            3'h7: begin
              out_r = 16'h4271;
            end
            default: begin end
          endcase
        end
        9'h0d6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4271;
              case (mant_lo4)
                4'ha: out_r = 16'h4272;
                4'hb: out_r = 16'h4272;
                4'hc: out_r = 16'h4272;
                4'hd: out_r = 16'h4272;
                4'he: out_r = 16'h4272;
                4'hf: out_r = 16'h4272;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4272;
            end
            3'h2: begin
              out_r = 16'h4272;
            end
            3'h3: begin
              out_r = 16'h4273;
              case (mant_lo4)
                4'h0: out_r = 16'h4272;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4273;
            end
            3'h5: begin
              out_r = 16'h4273;
            end
            3'h6: begin
              out_r = 16'h4274;
              case (mant_lo4)
                4'h0: out_r = 16'h4273;
                4'h1: out_r = 16'h4273;
                4'h2: out_r = 16'h4273;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4274;
            end
            default: begin end
          endcase
        end
        9'h0d7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4274;
            end
            3'h1: begin
              out_r = 16'h4275;
              case (mant_lo4)
                4'h0: out_r = 16'h4274;
                4'h1: out_r = 16'h4274;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4275;
            end
            3'h3: begin
              out_r = 16'h4275;
              case (mant_lo4)
                4'hb: out_r = 16'h4276;
                4'hc: out_r = 16'h4276;
                4'hd: out_r = 16'h4276;
                4'he: out_r = 16'h4276;
                4'hf: out_r = 16'h4276;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4276;
            end
            3'h5: begin
              out_r = 16'h4276;
            end
            3'h6: begin
              out_r = 16'h4276;
            end
            3'h7: begin
              out_r = 16'h4277;
            end
            default: begin end
          endcase
        end
        9'h0d8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4277;
            end
            3'h1: begin
              out_r = 16'h4277;
              case (mant_lo4)
                4'ha: out_r = 16'h4278;
                4'hb: out_r = 16'h4278;
                4'hc: out_r = 16'h4278;
                4'hd: out_r = 16'h4278;
                4'he: out_r = 16'h4278;
                4'hf: out_r = 16'h4278;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4278;
            end
            3'h3: begin
              out_r = 16'h4278;
            end
            3'h4: begin
              out_r = 16'h4279;
              case (mant_lo4)
                4'h0: out_r = 16'h4278;
                4'h1: out_r = 16'h4278;
                4'h2: out_r = 16'h4278;
                4'h3: out_r = 16'h4278;
                4'h4: out_r = 16'h4278;
                4'h5: out_r = 16'h4278;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4279;
            end
            3'h6: begin
              out_r = 16'h4279;
            end
            3'h7: begin
              out_r = 16'h4279;
              case (mant_lo4)
                4'he: out_r = 16'h427a;
                4'hf: out_r = 16'h427a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0d9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h427a;
            end
            3'h1: begin
              out_r = 16'h427a;
            end
            3'h2: begin
              out_r = 16'h427b;
              case (mant_lo4)
                4'h0: out_r = 16'h427a;
                4'h1: out_r = 16'h427a;
                4'h2: out_r = 16'h427a;
                4'h3: out_r = 16'h427a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h427b;
            end
            3'h4: begin
              out_r = 16'h427b;
            end
            3'h5: begin
              out_r = 16'h427c;
              case (mant_lo4)
                4'h0: out_r = 16'h427b;
                4'h1: out_r = 16'h427b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h427c;
            end
            3'h7: begin
              out_r = 16'h427c;
            end
            default: begin end
          endcase
        end
        9'h0da: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h427d;
              case (mant_lo4)
                4'h0: out_r = 16'h427c;
                4'h1: out_r = 16'h427c;
                4'h2: out_r = 16'h427c;
                4'h3: out_r = 16'h427c;
                4'h4: out_r = 16'h427c;
                4'h5: out_r = 16'h427c;
                4'h6: out_r = 16'h427c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h427d;
            end
            3'h2: begin
              out_r = 16'h427d;
              case (mant_lo4)
                4'hd: out_r = 16'h427e;
                4'he: out_r = 16'h427e;
                4'hf: out_r = 16'h427e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h427e;
            end
            3'h4: begin
              out_r = 16'h427e;
            end
            3'h5: begin
              out_r = 16'h427e;
              case (mant_lo4)
                4'he: out_r = 16'h427f;
                4'hf: out_r = 16'h427f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h427f;
            end
            3'h7: begin
              out_r = 16'h427f;
            end
            default: begin end
          endcase
        end
        9'h0db: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h427f;
              case (mant_lo4)
                4'hf: out_r = 16'h4280;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4280;
            end
            3'h2: begin
              out_r = 16'h4280;
            end
            3'h3: begin
              out_r = 16'h4280;
            end
            3'h4: begin
              out_r = 16'h4280;
              case (mant_lo4)
                4'hf: out_r = 16'h4281;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4281;
            end
            3'h6: begin
              out_r = 16'h4281;
            end
            3'h7: begin
              out_r = 16'h4281;
            end
            default: begin end
          endcase
        end
        9'h0dc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4281;
            end
            3'h1: begin
              out_r = 16'h4281;
            end
            3'h2: begin
              out_r = 16'h4281;
              case (mant_lo4)
                4'hb: out_r = 16'h4282;
                4'hc: out_r = 16'h4282;
                4'hd: out_r = 16'h4282;
                4'he: out_r = 16'h4282;
                4'hf: out_r = 16'h4282;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4282;
            end
            3'h4: begin
              out_r = 16'h4282;
            end
            3'h5: begin
              out_r = 16'h4282;
            end
            3'h6: begin
              out_r = 16'h4282;
            end
            3'h7: begin
              out_r = 16'h4282;
            end
            default: begin end
          endcase
        end
        9'h0dd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4282;
              case (mant_lo4)
                4'hd: out_r = 16'h4283;
                4'he: out_r = 16'h4283;
                4'hf: out_r = 16'h4283;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4283;
            end
            3'h2: begin
              out_r = 16'h4283;
            end
            3'h3: begin
              out_r = 16'h4283;
            end
            3'h4: begin
              out_r = 16'h4283;
            end
            3'h5: begin
              out_r = 16'h4283;
            end
            3'h6: begin
              out_r = 16'h4283;
              case (mant_lo4)
                4'h8: out_r = 16'h4284;
                4'h9: out_r = 16'h4284;
                4'ha: out_r = 16'h4284;
                4'hb: out_r = 16'h4284;
                4'hc: out_r = 16'h4284;
                4'hd: out_r = 16'h4284;
                4'he: out_r = 16'h4284;
                4'hf: out_r = 16'h4284;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4284;
            end
            default: begin end
          endcase
        end
        9'h0de: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4284;
            end
            3'h1: begin
              out_r = 16'h4284;
            end
            3'h2: begin
              out_r = 16'h4284;
            end
            3'h3: begin
              out_r = 16'h4284;
            end
            3'h4: begin
              out_r = 16'h4285;
            end
            3'h5: begin
              out_r = 16'h4285;
            end
            3'h6: begin
              out_r = 16'h4285;
            end
            3'h7: begin
              out_r = 16'h4285;
            end
            default: begin end
          endcase
        end
        9'h0df: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4285;
            end
            3'h1: begin
              out_r = 16'h4285;
              case (mant_lo4)
                4'he: out_r = 16'h4286;
                4'hf: out_r = 16'h4286;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4286;
            end
            3'h3: begin
              out_r = 16'h4286;
            end
            3'h4: begin
              out_r = 16'h4286;
            end
            3'h5: begin
              out_r = 16'h4286;
            end
            3'h6: begin
              out_r = 16'h4286;
            end
            3'h7: begin
              out_r = 16'h4286;
            end
            default: begin end
          endcase
        end
        9'h0e0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4287;
              case (mant_lo4)
                4'h0: out_r = 16'h4286;
                4'h1: out_r = 16'h4286;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4287;
            end
            3'h2: begin
              out_r = 16'h4287;
            end
            3'h3: begin
              out_r = 16'h4287;
            end
            3'h4: begin
              out_r = 16'h4287;
            end
            3'h5: begin
              out_r = 16'h4288;
              case (mant_lo4)
                4'h0: out_r = 16'h4287;
                4'h1: out_r = 16'h4287;
                4'h2: out_r = 16'h4287;
                4'h3: out_r = 16'h4287;
                4'h4: out_r = 16'h4287;
                4'h5: out_r = 16'h4287;
                4'h6: out_r = 16'h4287;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4288;
            end
            3'h7: begin
              out_r = 16'h4288;
            end
            default: begin end
          endcase
        end
        9'h0e1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4288;
            end
            3'h1: begin
              out_r = 16'h4288;
            end
            3'h2: begin
              out_r = 16'h4288;
            end
            3'h3: begin
              out_r = 16'h4289;
              case (mant_lo4)
                4'h0: out_r = 16'h4288;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4289;
            end
            3'h5: begin
              out_r = 16'h4289;
            end
            3'h6: begin
              out_r = 16'h4289;
            end
            3'h7: begin
              out_r = 16'h4289;
            end
            default: begin end
          endcase
        end
        9'h0e2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4289;
            end
            3'h1: begin
              out_r = 16'h428a;
              case (mant_lo4)
                4'h0: out_r = 16'h4289;
                4'h1: out_r = 16'h4289;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h428a;
            end
            3'h3: begin
              out_r = 16'h428a;
            end
            3'h4: begin
              out_r = 16'h428a;
            end
            3'h5: begin
              out_r = 16'h428a;
            end
            3'h6: begin
              out_r = 16'h428a;
            end
            3'h7: begin
              out_r = 16'h428b;
            end
            default: begin end
          endcase
        end
        9'h0e3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h428b;
            end
            3'h1: begin
              out_r = 16'h428b;
            end
            3'h2: begin
              out_r = 16'h428b;
            end
            3'h3: begin
              out_r = 16'h428b;
            end
            3'h4: begin
              out_r = 16'h428c;
              case (mant_lo4)
                4'h0: out_r = 16'h428b;
                4'h1: out_r = 16'h428b;
                4'h2: out_r = 16'h428b;
                4'h3: out_r = 16'h428b;
                4'h4: out_r = 16'h428b;
                4'h5: out_r = 16'h428b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h428c;
            end
            3'h6: begin
              out_r = 16'h428c;
            end
            3'h7: begin
              out_r = 16'h428c;
            end
            default: begin end
          endcase
        end
        9'h0e4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h428c;
            end
            3'h1: begin
              out_r = 16'h428c;
            end
            3'h2: begin
              out_r = 16'h428d;
              case (mant_lo4)
                4'h0: out_r = 16'h428c;
                4'h1: out_r = 16'h428c;
                4'h2: out_r = 16'h428c;
                4'h3: out_r = 16'h428c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h428d;
            end
            3'h4: begin
              out_r = 16'h428d;
            end
            3'h5: begin
              out_r = 16'h428d;
            end
            3'h6: begin
              out_r = 16'h428d;
            end
            3'h7: begin
              out_r = 16'h428d;
            end
            default: begin end
          endcase
        end
        9'h0e5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h428e;
              case (mant_lo4)
                4'h0: out_r = 16'h428d;
                4'h1: out_r = 16'h428d;
                4'h2: out_r = 16'h428d;
                4'h3: out_r = 16'h428d;
                4'h4: out_r = 16'h428d;
                4'h5: out_r = 16'h428d;
                4'h6: out_r = 16'h428d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h428e;
            end
            3'h2: begin
              out_r = 16'h428e;
            end
            3'h3: begin
              out_r = 16'h428e;
            end
            3'h4: begin
              out_r = 16'h428e;
            end
            3'h5: begin
              out_r = 16'h428e;
              case (mant_lo4)
                4'he: out_r = 16'h428f;
                4'hf: out_r = 16'h428f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h428f;
            end
            3'h7: begin
              out_r = 16'h428f;
            end
            default: begin end
          endcase
        end
        9'h0e6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h428f;
            end
            3'h1: begin
              out_r = 16'h428f;
            end
            3'h2: begin
              out_r = 16'h428f;
            end
            3'h3: begin
              out_r = 16'h4290;
              case (mant_lo4)
                4'h0: out_r = 16'h428f;
                4'h1: out_r = 16'h428f;
                4'h2: out_r = 16'h428f;
                4'h3: out_r = 16'h428f;
                4'h4: out_r = 16'h428f;
                4'h5: out_r = 16'h428f;
                4'h6: out_r = 16'h428f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4290;
            end
            3'h5: begin
              out_r = 16'h4290;
            end
            3'h6: begin
              out_r = 16'h4290;
            end
            3'h7: begin
              out_r = 16'h4290;
            end
            default: begin end
          endcase
        end
        9'h0e7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4290;
            end
            3'h1: begin
              out_r = 16'h4291;
              case (mant_lo4)
                4'h0: out_r = 16'h4290;
                4'h1: out_r = 16'h4290;
                4'h2: out_r = 16'h4290;
                4'h3: out_r = 16'h4290;
                4'h4: out_r = 16'h4290;
                4'h5: out_r = 16'h4290;
                4'h6: out_r = 16'h4290;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4291;
            end
            3'h3: begin
              out_r = 16'h4291;
            end
            3'h4: begin
              out_r = 16'h4291;
            end
            3'h5: begin
              out_r = 16'h4291;
            end
            3'h6: begin
              out_r = 16'h4291;
            end
            3'h7: begin
              out_r = 16'h4291;
              case (mant_lo4)
                4'h9: out_r = 16'h4292;
                4'ha: out_r = 16'h4292;
                4'hb: out_r = 16'h4292;
                4'hc: out_r = 16'h4292;
                4'hd: out_r = 16'h4292;
                4'he: out_r = 16'h4292;
                4'hf: out_r = 16'h4292;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0e8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4292;
            end
            3'h1: begin
              out_r = 16'h4292;
            end
            3'h2: begin
              out_r = 16'h4292;
            end
            3'h3: begin
              out_r = 16'h4292;
            end
            3'h4: begin
              out_r = 16'h4292;
              case (mant_lo4)
                4'hd: out_r = 16'h4293;
                4'he: out_r = 16'h4293;
                4'hf: out_r = 16'h4293;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4293;
            end
            3'h6: begin
              out_r = 16'h4293;
            end
            3'h7: begin
              out_r = 16'h4293;
            end
            default: begin end
          endcase
        end
        9'h0e9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4293;
            end
            3'h1: begin
              out_r = 16'h4293;
            end
            3'h2: begin
              out_r = 16'h4293;
              case (mant_lo4)
                4'h9: out_r = 16'h4294;
                4'ha: out_r = 16'h4294;
                4'hb: out_r = 16'h4294;
                4'hc: out_r = 16'h4294;
                4'hd: out_r = 16'h4294;
                4'he: out_r = 16'h4294;
                4'hf: out_r = 16'h4294;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4294;
            end
            3'h4: begin
              out_r = 16'h4294;
            end
            3'h5: begin
              out_r = 16'h4294;
            end
            3'h6: begin
              out_r = 16'h4294;
            end
            3'h7: begin
              out_r = 16'h4294;
            end
            default: begin end
          endcase
        end
        9'h0ea: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4294;
              case (mant_lo4)
                4'hc: out_r = 16'h4295;
                4'hd: out_r = 16'h4295;
                4'he: out_r = 16'h4295;
                4'hf: out_r = 16'h4295;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4295;
            end
            3'h2: begin
              out_r = 16'h4295;
            end
            3'h3: begin
              out_r = 16'h4295;
            end
            3'h4: begin
              out_r = 16'h4295;
            end
            3'h5: begin
              out_r = 16'h4295;
            end
            3'h6: begin
              out_r = 16'h4296;
              case (mant_lo4)
                4'h0: out_r = 16'h4295;
                4'h1: out_r = 16'h4295;
                4'h2: out_r = 16'h4295;
                4'h3: out_r = 16'h4295;
                4'h4: out_r = 16'h4295;
                4'h5: out_r = 16'h4295;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4296;
            end
            default: begin end
          endcase
        end
        9'h0eb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4296;
            end
            3'h1: begin
              out_r = 16'h4296;
            end
            3'h2: begin
              out_r = 16'h4296;
            end
            3'h3: begin
              out_r = 16'h4296;
              case (mant_lo4)
                4'he: out_r = 16'h4297;
                4'hf: out_r = 16'h4297;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4297;
            end
            3'h5: begin
              out_r = 16'h4297;
            end
            3'h6: begin
              out_r = 16'h4297;
            end
            3'h7: begin
              out_r = 16'h4297;
            end
            default: begin end
          endcase
        end
        9'h0ec: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4297;
            end
            3'h1: begin
              out_r = 16'h4297;
              case (mant_lo4)
                4'hc: out_r = 16'h4298;
                4'hd: out_r = 16'h4298;
                4'he: out_r = 16'h4298;
                4'hf: out_r = 16'h4298;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4298;
            end
            3'h3: begin
              out_r = 16'h4298;
            end
            3'h4: begin
              out_r = 16'h4298;
            end
            3'h5: begin
              out_r = 16'h4298;
            end
            3'h6: begin
              out_r = 16'h4298;
            end
            3'h7: begin
              out_r = 16'h4298;
            end
            default: begin end
          endcase
        end
        9'h0ed: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4299;
              case (mant_lo4)
                4'h0: out_r = 16'h4298;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4299;
            end
            3'h2: begin
              out_r = 16'h4299;
            end
            3'h3: begin
              out_r = 16'h4299;
            end
            3'h4: begin
              out_r = 16'h4299;
            end
            3'h5: begin
              out_r = 16'h429a;
              case (mant_lo4)
                4'h0: out_r = 16'h4299;
                4'h1: out_r = 16'h4299;
                4'h2: out_r = 16'h4299;
                4'h3: out_r = 16'h4299;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h429a;
            end
            3'h7: begin
              out_r = 16'h429a;
            end
            default: begin end
          endcase
        end
        9'h0ee: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h429a;
            end
            3'h1: begin
              out_r = 16'h429a;
            end
            3'h2: begin
              out_r = 16'h429a;
              case (mant_lo4)
                4'hf: out_r = 16'h429b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h429b;
            end
            3'h4: begin
              out_r = 16'h429b;
            end
            3'h5: begin
              out_r = 16'h429b;
            end
            3'h6: begin
              out_r = 16'h429b;
            end
            3'h7: begin
              out_r = 16'h429b;
            end
            default: begin end
          endcase
        end
        9'h0ef: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h429b;
            end
            3'h1: begin
              out_r = 16'h429c;
            end
            3'h2: begin
              out_r = 16'h429c;
            end
            3'h3: begin
              out_r = 16'h429c;
            end
            3'h4: begin
              out_r = 16'h429c;
            end
            3'h5: begin
              out_r = 16'h429c;
            end
            3'h6: begin
              out_r = 16'h429c;
              case (mant_lo4)
                4'he: out_r = 16'h429d;
                4'hf: out_r = 16'h429d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h429d;
            end
            default: begin end
          endcase
        end
        9'h0f0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h429d;
            end
            3'h1: begin
              out_r = 16'h429d;
            end
            3'h2: begin
              out_r = 16'h429d;
            end
            3'h3: begin
              out_r = 16'h429d;
            end
            3'h4: begin
              out_r = 16'h429e;
              case (mant_lo4)
                4'h0: out_r = 16'h429d;
                4'h1: out_r = 16'h429d;
                4'h2: out_r = 16'h429d;
                4'h3: out_r = 16'h429d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h429e;
            end
            3'h6: begin
              out_r = 16'h429e;
            end
            3'h7: begin
              out_r = 16'h429e;
            end
            default: begin end
          endcase
        end
        9'h0f1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h429e;
            end
            3'h1: begin
              out_r = 16'h429e;
            end
            3'h2: begin
              out_r = 16'h429f;
              case (mant_lo4)
                4'h0: out_r = 16'h429e;
                4'h1: out_r = 16'h429e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h429f;
            end
            3'h4: begin
              out_r = 16'h429f;
            end
            3'h5: begin
              out_r = 16'h429f;
            end
            3'h6: begin
              out_r = 16'h429f;
            end
            3'h7: begin
              out_r = 16'h429f;
            end
            default: begin end
          endcase
        end
        9'h0f2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a0;
              case (mant_lo4)
                4'h0: out_r = 16'h429f;
                4'h1: out_r = 16'h429f;
                4'h2: out_r = 16'h429f;
                4'h3: out_r = 16'h429f;
                4'h4: out_r = 16'h429f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h42a0;
            end
            3'h2: begin
              out_r = 16'h42a0;
            end
            3'h3: begin
              out_r = 16'h42a0;
            end
            3'h4: begin
              out_r = 16'h42a0;
            end
            3'h5: begin
              out_r = 16'h42a0;
              case (mant_lo4)
                4'hc: out_r = 16'h42a1;
                4'hd: out_r = 16'h42a1;
                4'he: out_r = 16'h42a1;
                4'hf: out_r = 16'h42a1;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h42a1;
            end
            3'h7: begin
              out_r = 16'h42a1;
            end
            default: begin end
          endcase
        end
        9'h0f3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a1;
            end
            3'h1: begin
              out_r = 16'h42a1;
            end
            3'h2: begin
              out_r = 16'h42a1;
            end
            3'h3: begin
              out_r = 16'h42a2;
              case (mant_lo4)
                4'h0: out_r = 16'h42a1;
                4'h1: out_r = 16'h42a1;
                4'h2: out_r = 16'h42a1;
                4'h3: out_r = 16'h42a1;
                4'h4: out_r = 16'h42a1;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h42a2;
            end
            3'h5: begin
              out_r = 16'h42a2;
            end
            3'h6: begin
              out_r = 16'h42a2;
            end
            3'h7: begin
              out_r = 16'h42a2;
            end
            default: begin end
          endcase
        end
        9'h0f4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a2;
            end
            3'h1: begin
              out_r = 16'h42a3;
              case (mant_lo4)
                4'h0: out_r = 16'h42a2;
                4'h1: out_r = 16'h42a2;
                4'h2: out_r = 16'h42a2;
                4'h3: out_r = 16'h42a2;
                4'h4: out_r = 16'h42a2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h42a3;
            end
            3'h3: begin
              out_r = 16'h42a3;
            end
            3'h4: begin
              out_r = 16'h42a3;
            end
            3'h5: begin
              out_r = 16'h42a3;
            end
            3'h6: begin
              out_r = 16'h42a3;
            end
            3'h7: begin
              out_r = 16'h42a4;
              case (mant_lo4)
                4'h0: out_r = 16'h42a3;
                4'h1: out_r = 16'h42a3;
                4'h2: out_r = 16'h42a3;
                4'h3: out_r = 16'h42a3;
                4'h4: out_r = 16'h42a3;
                4'h5: out_r = 16'h42a3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0f5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a4;
            end
            3'h1: begin
              out_r = 16'h42a4;
            end
            3'h2: begin
              out_r = 16'h42a4;
            end
            3'h3: begin
              out_r = 16'h42a4;
            end
            3'h4: begin
              out_r = 16'h42a4;
              case (mant_lo4)
                4'hb: out_r = 16'h42a5;
                4'hc: out_r = 16'h42a5;
                4'hd: out_r = 16'h42a5;
                4'he: out_r = 16'h42a5;
                4'hf: out_r = 16'h42a5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h42a5;
            end
            3'h6: begin
              out_r = 16'h42a5;
            end
            3'h7: begin
              out_r = 16'h42a5;
            end
            default: begin end
          endcase
        end
        9'h0f6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a5;
            end
            3'h1: begin
              out_r = 16'h42a5;
            end
            3'h2: begin
              out_r = 16'h42a6;
              case (mant_lo4)
                4'h0: out_r = 16'h42a5;
                4'h1: out_r = 16'h42a5;
                4'h2: out_r = 16'h42a5;
                4'h3: out_r = 16'h42a5;
                4'h4: out_r = 16'h42a5;
                4'h5: out_r = 16'h42a5;
                4'h6: out_r = 16'h42a5;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h42a6;
            end
            3'h4: begin
              out_r = 16'h42a6;
            end
            3'h5: begin
              out_r = 16'h42a6;
            end
            3'h6: begin
              out_r = 16'h42a6;
            end
            3'h7: begin
              out_r = 16'h42a6;
            end
            default: begin end
          endcase
        end
        9'h0f7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a6;
              case (mant_lo4)
                4'ha: out_r = 16'h42a7;
                4'hb: out_r = 16'h42a7;
                4'hc: out_r = 16'h42a7;
                4'hd: out_r = 16'h42a7;
                4'he: out_r = 16'h42a7;
                4'hf: out_r = 16'h42a7;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h42a7;
            end
            3'h2: begin
              out_r = 16'h42a7;
            end
            3'h3: begin
              out_r = 16'h42a7;
            end
            3'h4: begin
              out_r = 16'h42a7;
            end
            3'h5: begin
              out_r = 16'h42a7;
            end
            3'h6: begin
              out_r = 16'h42a8;
              case (mant_lo4)
                4'h0: out_r = 16'h42a7;
                4'h1: out_r = 16'h42a7;
                4'h2: out_r = 16'h42a7;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h42a8;
            end
            default: begin end
          endcase
        end
        9'h0f8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a8;
            end
            3'h1: begin
              out_r = 16'h42a8;
            end
            3'h2: begin
              out_r = 16'h42a8;
            end
            3'h3: begin
              out_r = 16'h42a8;
              case (mant_lo4)
                4'hc: out_r = 16'h42a9;
                4'hd: out_r = 16'h42a9;
                4'he: out_r = 16'h42a9;
                4'hf: out_r = 16'h42a9;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h42a9;
            end
            3'h5: begin
              out_r = 16'h42a9;
            end
            3'h6: begin
              out_r = 16'h42a9;
            end
            3'h7: begin
              out_r = 16'h42a9;
            end
            default: begin end
          endcase
        end
        9'h0f9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42a9;
            end
            3'h1: begin
              out_r = 16'h42a9;
              case (mant_lo4)
                4'hb: out_r = 16'h42aa;
                4'hc: out_r = 16'h42aa;
                4'hd: out_r = 16'h42aa;
                4'he: out_r = 16'h42aa;
                4'hf: out_r = 16'h42aa;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h42aa;
            end
            3'h3: begin
              out_r = 16'h42aa;
            end
            3'h4: begin
              out_r = 16'h42aa;
            end
            3'h5: begin
              out_r = 16'h42aa;
            end
            3'h6: begin
              out_r = 16'h42aa;
            end
            3'h7: begin
              out_r = 16'h42aa;
              case (mant_lo4)
                4'hf: out_r = 16'h42ab;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0fa: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42ab;
            end
            3'h1: begin
              out_r = 16'h42ab;
            end
            3'h2: begin
              out_r = 16'h42ab;
            end
            3'h3: begin
              out_r = 16'h42ab;
            end
            3'h4: begin
              out_r = 16'h42ab;
            end
            3'h5: begin
              out_r = 16'h42ac;
              case (mant_lo4)
                4'h0: out_r = 16'h42ab;
                4'h1: out_r = 16'h42ab;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h42ac;
            end
            3'h7: begin
              out_r = 16'h42ac;
            end
            default: begin end
          endcase
        end
        9'h0fb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42ac;
            end
            3'h1: begin
              out_r = 16'h42ac;
            end
            3'h2: begin
              out_r = 16'h42ac;
              case (mant_lo4)
                4'hd: out_r = 16'h42ad;
                4'he: out_r = 16'h42ad;
                4'hf: out_r = 16'h42ad;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h42ad;
            end
            3'h4: begin
              out_r = 16'h42ad;
            end
            3'h5: begin
              out_r = 16'h42ad;
            end
            3'h6: begin
              out_r = 16'h42ad;
            end
            3'h7: begin
              out_r = 16'h42ad;
            end
            default: begin end
          endcase
        end
        9'h0fc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42ad;
              case (mant_lo4)
                4'hf: out_r = 16'h42ae;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h42ae;
            end
            3'h2: begin
              out_r = 16'h42ae;
            end
            3'h3: begin
              out_r = 16'h42ae;
            end
            3'h4: begin
              out_r = 16'h42ae;
            end
            3'h5: begin
              out_r = 16'h42ae;
            end
            3'h6: begin
              out_r = 16'h42ae;
              case (mant_lo4)
                4'hb: out_r = 16'h42af;
                4'hc: out_r = 16'h42af;
                4'hd: out_r = 16'h42af;
                4'he: out_r = 16'h42af;
                4'hf: out_r = 16'h42af;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h42af;
            end
            default: begin end
          endcase
        end
        9'h0fd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42af;
            end
            3'h1: begin
              out_r = 16'h42af;
            end
            3'h2: begin
              out_r = 16'h42af;
            end
            3'h3: begin
              out_r = 16'h42af;
            end
            3'h4: begin
              out_r = 16'h42b0;
              case (mant_lo4)
                4'h0: out_r = 16'h42af;
                4'h1: out_r = 16'h42af;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h42b0;
            end
            3'h6: begin
              out_r = 16'h42b0;
            end
            3'h7: begin
              out_r = 16'h42b0;
            end
            default: begin end
          endcase
        end
        9'h0fe: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h42b0;
            end
            3'h1: begin
              out_r = 16'h42b0;
            end
            3'h2: begin
              out_r = 16'h42b1;
            end
            3'h3: begin
              out_r = 16'h42b1;
            end
            3'h4: begin
              out_r = 16'h42b1;
            end
            3'h5: begin
              out_r = 16'h42b1;
            end
            3'h6: begin
              out_r = 16'h42b1;
            end
            3'h7: begin
              out_r = 16'h42b1;
            end
            default: begin end
          endcase
        end
        9'h0ff: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h7fc0;
              case (mant_lo4)
                4'h0: out_r = 16'h7f80;
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
  reg bit_14;
  always @* begin
    bit_14 = 1'b1;
    casez (sign_exp)
      9'b001111101: bit_14 = 1'b0;
      9'b00111111?: bit_14 = 1'b0;
      9'b010000000: bit_14 = 1'b0;
        9'h07c: begin
          case (mant_hi3)
            3'h0: begin
              bit_14 = 1'b1;
              case (mant_lo4)
                4'hc: bit_14 = 1'b0;
                4'hd: bit_14 = 1'b0;
                4'he: bit_14 = 1'b0;
                4'hf: bit_14 = 1'b0;
                default: begin end
              endcase
            end
            3'h1: begin
              bit_14 = 1'b0;
            end
            3'h2: begin
              bit_14 = 1'b0;
            end
            3'h3: begin
              bit_14 = 1'b0;
            end
            3'h4: begin
              bit_14 = 1'b0;
            end
            3'h5: begin
              bit_14 = 1'b0;
            end
            3'h6: begin
              bit_14 = 1'b0;
            end
            3'h7: begin
              bit_14 = 1'b0;
            end
            default: begin end
          endcase
        end
        9'h081: begin
          case (mant_hi3)
            3'h0: begin
              bit_14 = 1'b0;
            end
            3'h1: begin
              bit_14 = 1'b0;
            end
            3'h2: begin
              bit_14 = 1'b0;
            end
            3'h3: begin
              bit_14 = 1'b0;
            end
            3'h4: begin
              bit_14 = 1'b0;
            end
            3'h5: begin
              bit_14 = 1'b0;
            end
            3'h6: begin
              bit_14 = 1'b0;
              case (mant_lo4)
                4'hc: bit_14 = 1'b1;
                4'hd: bit_14 = 1'b1;
                4'he: bit_14 = 1'b1;
                4'hf: bit_14 = 1'b1;
                default: begin end
              endcase
            end
            3'h7: begin
              bit_14 = 1'b1;
            end
            default: begin end
          endcase
        end
      default: begin end
    endcase
  end
  assign out = {out_r[15], bit_14, out_r[13], out_r[12], out_r[11], out_r[10], out_r[9], out_r[8], out_r[7], out_r[6], out_r[5], out_r[4], out_r[3], out_r[2], out_r[1], out_r[0]};
endmodule
