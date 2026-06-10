module ex205_bf16_log10_hilo3_word_mode(in, out);
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
              out_r = 16'hc218;
            end
            3'h1: begin
              out_r = 16'hc217;
              case (mant_lo4)
                4'h0: out_r = 16'hc218;
                4'h1: out_r = 16'hc218;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc217;
            end
            3'h3: begin
              out_r = 16'hc217;
            end
            3'h4: begin
              out_r = 16'hc217;
            end
            3'h5: begin
              out_r = 16'hc217;
            end
            3'h6: begin
              out_r = 16'hc217;
            end
            3'h7: begin
              out_r = 16'hc217;
            end
            default: begin end
          endcase
        end
        9'h002: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc216;
              case (mant_lo4)
                4'h0: out_r = 16'hc217;
                4'h1: out_r = 16'hc217;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc216;
            end
            3'h2: begin
              out_r = 16'hc216;
            end
            3'h3: begin
              out_r = 16'hc216;
            end
            3'h4: begin
              out_r = 16'hc216;
            end
            3'h5: begin
              out_r = 16'hc216;
            end
            3'h6: begin
              out_r = 16'hc215;
              case (mant_lo4)
                4'h0: out_r = 16'hc216;
                4'h1: out_r = 16'hc216;
                4'h2: out_r = 16'hc216;
                4'h3: out_r = 16'hc216;
                4'h4: out_r = 16'hc216;
                4'h5: out_r = 16'hc216;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc215;
            end
            default: begin end
          endcase
        end
        9'h003: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc215;
            end
            3'h1: begin
              out_r = 16'hc215;
            end
            3'h2: begin
              out_r = 16'hc215;
            end
            3'h3: begin
              out_r = 16'hc215;
            end
            3'h4: begin
              out_r = 16'hc215;
              case (mant_lo4)
                4'hd: out_r = 16'hc214;
                4'he: out_r = 16'hc214;
                4'hf: out_r = 16'hc214;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc214;
            end
            3'h6: begin
              out_r = 16'hc214;
            end
            3'h7: begin
              out_r = 16'hc214;
            end
            default: begin end
          endcase
        end
        9'h004: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc214;
            end
            3'h1: begin
              out_r = 16'hc214;
            end
            3'h2: begin
              out_r = 16'hc214;
            end
            3'h3: begin
              out_r = 16'hc213;
              case (mant_lo4)
                4'h0: out_r = 16'hc214;
                4'h1: out_r = 16'hc214;
                4'h2: out_r = 16'hc214;
                4'h3: out_r = 16'hc214;
                4'h4: out_r = 16'hc214;
                4'h5: out_r = 16'hc214;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc213;
            end
            3'h5: begin
              out_r = 16'hc213;
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
        9'h005: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc213;
            end
            3'h1: begin
              out_r = 16'hc213;
            end
            3'h2: begin
              out_r = 16'hc212;
              case (mant_lo4)
                4'h0: out_r = 16'hc213;
                4'h1: out_r = 16'hc213;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc212;
            end
            3'h4: begin
              out_r = 16'hc212;
            end
            3'h5: begin
              out_r = 16'hc212;
            end
            3'h6: begin
              out_r = 16'hc212;
            end
            3'h7: begin
              out_r = 16'hc212;
            end
            default: begin end
          endcase
        end
        9'h006: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc212;
            end
            3'h1: begin
              out_r = 16'hc211;
            end
            3'h2: begin
              out_r = 16'hc211;
            end
            3'h3: begin
              out_r = 16'hc211;
            end
            3'h4: begin
              out_r = 16'hc211;
            end
            3'h5: begin
              out_r = 16'hc211;
            end
            3'h6: begin
              out_r = 16'hc211;
            end
            3'h7: begin
              out_r = 16'hc211;
            end
            default: begin end
          endcase
        end
        9'h007: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc210;
            end
            3'h1: begin
              out_r = 16'hc210;
            end
            3'h2: begin
              out_r = 16'hc210;
            end
            3'h3: begin
              out_r = 16'hc210;
            end
            3'h4: begin
              out_r = 16'hc210;
            end
            3'h5: begin
              out_r = 16'hc210;
            end
            3'h6: begin
              out_r = 16'hc20f;
              case (mant_lo4)
                4'h0: out_r = 16'hc210;
                4'h1: out_r = 16'hc210;
                4'h2: out_r = 16'hc210;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc20f;
            end
            default: begin end
          endcase
        end
        9'h008: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20f;
            end
            3'h1: begin
              out_r = 16'hc20f;
            end
            3'h2: begin
              out_r = 16'hc20f;
            end
            3'h3: begin
              out_r = 16'hc20f;
            end
            3'h4: begin
              out_r = 16'hc20f;
              case (mant_lo4)
                4'ha: out_r = 16'hc20e;
                4'hb: out_r = 16'hc20e;
                4'hc: out_r = 16'hc20e;
                4'hd: out_r = 16'hc20e;
                4'he: out_r = 16'hc20e;
                4'hf: out_r = 16'hc20e;
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
            end
            default: begin end
          endcase
        end
        9'h009: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20e;
            end
            3'h1: begin
              out_r = 16'hc20e;
            end
            3'h2: begin
              out_r = 16'hc20e;
            end
            3'h3: begin
              out_r = 16'hc20d;
              case (mant_lo4)
                4'h0: out_r = 16'hc20e;
                4'h1: out_r = 16'hc20e;
                4'h2: out_r = 16'hc20e;
                4'h3: out_r = 16'hc20e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc20d;
            end
            3'h5: begin
              out_r = 16'hc20d;
            end
            3'h6: begin
              out_r = 16'hc20d;
            end
            3'h7: begin
              out_r = 16'hc20d;
            end
            default: begin end
          endcase
        end
        9'h00a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20d;
            end
            3'h1: begin
              out_r = 16'hc20d;
            end
            3'h2: begin
              out_r = 16'hc20c;
            end
            3'h3: begin
              out_r = 16'hc20c;
            end
            3'h4: begin
              out_r = 16'hc20c;
            end
            3'h5: begin
              out_r = 16'hc20c;
            end
            3'h6: begin
              out_r = 16'hc20c;
            end
            3'h7: begin
              out_r = 16'hc20c;
            end
            default: begin end
          endcase
        end
        9'h00b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20c;
              case (mant_lo4)
                4'he: out_r = 16'hc20b;
                4'hf: out_r = 16'hc20b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc20b;
            end
            3'h2: begin
              out_r = 16'hc20b;
            end
            3'h3: begin
              out_r = 16'hc20b;
            end
            3'h4: begin
              out_r = 16'hc20b;
            end
            3'h5: begin
              out_r = 16'hc20b;
            end
            3'h6: begin
              out_r = 16'hc20b;
            end
            3'h7: begin
              out_r = 16'hc20b;
              case (mant_lo4)
                4'hd: out_r = 16'hc20a;
                4'he: out_r = 16'hc20a;
                4'hf: out_r = 16'hc20a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h00c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc20a;
            end
            3'h1: begin
              out_r = 16'hc20a;
            end
            3'h2: begin
              out_r = 16'hc20a;
            end
            3'h3: begin
              out_r = 16'hc20a;
            end
            3'h4: begin
              out_r = 16'hc20a;
            end
            3'h5: begin
              out_r = 16'hc20a;
            end
            3'h6: begin
              out_r = 16'hc209;
              case (mant_lo4)
                4'h0: out_r = 16'hc20a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc209;
            end
            default: begin end
          endcase
        end
        9'h00d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc209;
            end
            3'h1: begin
              out_r = 16'hc209;
            end
            3'h2: begin
              out_r = 16'hc209;
            end
            3'h3: begin
              out_r = 16'hc209;
            end
            3'h4: begin
              out_r = 16'hc209;
              case (mant_lo4)
                4'h8: out_r = 16'hc208;
                4'h9: out_r = 16'hc208;
                4'ha: out_r = 16'hc208;
                4'hb: out_r = 16'hc208;
                4'hc: out_r = 16'hc208;
                4'hd: out_r = 16'hc208;
                4'he: out_r = 16'hc208;
                4'hf: out_r = 16'hc208;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc208;
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
        9'h00e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc208;
            end
            3'h1: begin
              out_r = 16'hc208;
            end
            3'h2: begin
              out_r = 16'hc208;
            end
            3'h3: begin
              out_r = 16'hc207;
              case (mant_lo4)
                4'h0: out_r = 16'hc208;
                4'h1: out_r = 16'hc208;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc207;
            end
            3'h5: begin
              out_r = 16'hc207;
            end
            3'h6: begin
              out_r = 16'hc207;
            end
            3'h7: begin
              out_r = 16'hc207;
            end
            default: begin end
          endcase
        end
        9'h00f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc207;
            end
            3'h1: begin
              out_r = 16'hc207;
              case (mant_lo4)
                4'he: out_r = 16'hc206;
                4'hf: out_r = 16'hc206;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc206;
            end
            3'h3: begin
              out_r = 16'hc206;
            end
            3'h4: begin
              out_r = 16'hc206;
            end
            3'h5: begin
              out_r = 16'hc206;
            end
            3'h6: begin
              out_r = 16'hc206;
            end
            3'h7: begin
              out_r = 16'hc206;
            end
            default: begin end
          endcase
        end
        9'h010: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc206;
              case (mant_lo4)
                4'hd: out_r = 16'hc205;
                4'he: out_r = 16'hc205;
                4'hf: out_r = 16'hc205;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc205;
            end
            3'h2: begin
              out_r = 16'hc205;
            end
            3'h3: begin
              out_r = 16'hc205;
            end
            3'h4: begin
              out_r = 16'hc205;
            end
            3'h5: begin
              out_r = 16'hc205;
            end
            3'h6: begin
              out_r = 16'hc205;
            end
            3'h7: begin
              out_r = 16'hc205;
              case (mant_lo4)
                4'ha: out_r = 16'hc204;
                4'hb: out_r = 16'hc204;
                4'hc: out_r = 16'hc204;
                4'hd: out_r = 16'hc204;
                4'he: out_r = 16'hc204;
                4'hf: out_r = 16'hc204;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h011: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc204;
            end
            3'h1: begin
              out_r = 16'hc204;
            end
            3'h2: begin
              out_r = 16'hc204;
            end
            3'h3: begin
              out_r = 16'hc204;
            end
            3'h4: begin
              out_r = 16'hc204;
            end
            3'h5: begin
              out_r = 16'hc204;
              case (mant_lo4)
                4'he: out_r = 16'hc203;
                4'hf: out_r = 16'hc203;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc203;
            end
            3'h7: begin
              out_r = 16'hc203;
            end
            default: begin end
          endcase
        end
        9'h012: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc203;
            end
            3'h1: begin
              out_r = 16'hc203;
            end
            3'h2: begin
              out_r = 16'hc203;
            end
            3'h3: begin
              out_r = 16'hc203;
            end
            3'h4: begin
              out_r = 16'hc202;
              case (mant_lo4)
                4'h0: out_r = 16'hc203;
                4'h1: out_r = 16'hc203;
                4'h2: out_r = 16'hc203;
                4'h3: out_r = 16'hc203;
                4'h4: out_r = 16'hc203;
                4'h5: out_r = 16'hc203;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc202;
            end
            3'h6: begin
              out_r = 16'hc202;
            end
            3'h7: begin
              out_r = 16'hc202;
            end
            default: begin end
          endcase
        end
        9'h013: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc202;
            end
            3'h1: begin
              out_r = 16'hc202;
            end
            3'h2: begin
              out_r = 16'hc202;
            end
            3'h3: begin
              out_r = 16'hc201;
            end
            3'h4: begin
              out_r = 16'hc201;
            end
            3'h5: begin
              out_r = 16'hc201;
            end
            3'h6: begin
              out_r = 16'hc201;
            end
            3'h7: begin
              out_r = 16'hc201;
            end
            default: begin end
          endcase
        end
        9'h014: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc201;
            end
            3'h1: begin
              out_r = 16'hc201;
              case (mant_lo4)
                4'hc: out_r = 16'hc200;
                4'hd: out_r = 16'hc200;
                4'he: out_r = 16'hc200;
                4'hf: out_r = 16'hc200;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc200;
            end
            3'h3: begin
              out_r = 16'hc200;
            end
            3'h4: begin
              out_r = 16'hc200;
            end
            3'h5: begin
              out_r = 16'hc200;
            end
            3'h6: begin
              out_r = 16'hc200;
            end
            3'h7: begin
              out_r = 16'hc1ff;
            end
            default: begin end
          endcase
        end
        9'h015: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ff;
            end
            3'h1: begin
              out_r = 16'hc1ff;
            end
            3'h2: begin
              out_r = 16'hc1fe;
            end
            3'h3: begin
              out_r = 16'hc1fe;
            end
            3'h4: begin
              out_r = 16'hc1fe;
            end
            3'h5: begin
              out_r = 16'hc1fd;
              case (mant_lo4)
                4'h0: out_r = 16'hc1fe;
                4'h1: out_r = 16'hc1fe;
                4'h2: out_r = 16'hc1fe;
                4'h3: out_r = 16'hc1fe;
                4'h4: out_r = 16'hc1fe;
                4'h5: out_r = 16'hc1fe;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1fd;
            end
            3'h7: begin
              out_r = 16'hc1fd;
            end
            default: begin end
          endcase
        end
        9'h016: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1fd;
              case (mant_lo4)
                4'hf: out_r = 16'hc1fc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1fc;
            end
            3'h2: begin
              out_r = 16'hc1fc;
            end
            3'h3: begin
              out_r = 16'hc1fc;
              case (mant_lo4)
                4'he: out_r = 16'hc1fb;
                4'hf: out_r = 16'hc1fb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1fb;
            end
            3'h5: begin
              out_r = 16'hc1fb;
            end
            3'h6: begin
              out_r = 16'hc1fb;
            end
            3'h7: begin
              out_r = 16'hc1fb;
              case (mant_lo4)
                4'hd: out_r = 16'hc1fa;
                4'he: out_r = 16'hc1fa;
                4'hf: out_r = 16'hc1fa;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h017: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1fa;
            end
            3'h1: begin
              out_r = 16'hc1fa;
            end
            3'h2: begin
              out_r = 16'hc1fa;
              case (mant_lo4)
                4'h9: out_r = 16'hc1f9;
                4'ha: out_r = 16'hc1f9;
                4'hb: out_r = 16'hc1f9;
                4'hc: out_r = 16'hc1f9;
                4'hd: out_r = 16'hc1f9;
                4'he: out_r = 16'hc1f9;
                4'hf: out_r = 16'hc1f9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1f9;
            end
            3'h4: begin
              out_r = 16'hc1f9;
            end
            3'h5: begin
              out_r = 16'hc1f9;
            end
            3'h6: begin
              out_r = 16'hc1f8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1f8;
            end
            default: begin end
          endcase
        end
        9'h018: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1f8;
            end
            3'h1: begin
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
            3'h2: begin
              out_r = 16'hc1f7;
            end
            3'h3: begin
              out_r = 16'hc1f7;
            end
            3'h4: begin
              out_r = 16'hc1f7;
              case (mant_lo4)
                4'h8: out_r = 16'hc1f6;
                4'h9: out_r = 16'hc1f6;
                4'ha: out_r = 16'hc1f6;
                4'hb: out_r = 16'hc1f6;
                4'hc: out_r = 16'hc1f6;
                4'hd: out_r = 16'hc1f6;
                4'he: out_r = 16'hc1f6;
                4'hf: out_r = 16'hc1f6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1f6;
            end
            3'h6: begin
              out_r = 16'hc1f6;
            end
            3'h7: begin
              out_r = 16'hc1f6;
            end
            default: begin end
          endcase
        end
        9'h019: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1f5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f6;
                4'h1: out_r = 16'hc1f6;
                4'h2: out_r = 16'hc1f6;
                4'h3: out_r = 16'hc1f6;
                4'h4: out_r = 16'hc1f6;
                4'h5: out_r = 16'hc1f6;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1f5;
            end
            3'h2: begin
              out_r = 16'hc1f5;
            end
            3'h3: begin
              out_r = 16'hc1f4;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f5;
                4'h1: out_r = 16'hc1f5;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1f4;
            end
            3'h5: begin
              out_r = 16'hc1f4;
            end
            3'h6: begin
              out_r = 16'hc1f4;
              case (mant_lo4)
                4'he: out_r = 16'hc1f3;
                4'hf: out_r = 16'hc1f3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1f3;
            end
            default: begin end
          endcase
        end
        9'h01a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1f3;
            end
            3'h1: begin
              out_r = 16'hc1f3;
              case (mant_lo4)
                4'hf: out_r = 16'hc1f2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1f2;
            end
            3'h3: begin
              out_r = 16'hc1f2;
            end
            3'h4: begin
              out_r = 16'hc1f2;
            end
            3'h5: begin
              out_r = 16'hc1f1;
              case (mant_lo4)
                4'h0: out_r = 16'hc1f2;
                4'h1: out_r = 16'hc1f2;
                4'h2: out_r = 16'hc1f2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1f1;
            end
            3'h7: begin
              out_r = 16'hc1f1;
            end
            default: begin end
          endcase
        end
        9'h01b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1f1;
              case (mant_lo4)
                4'hd: out_r = 16'hc1f0;
                4'he: out_r = 16'hc1f0;
                4'hf: out_r = 16'hc1f0;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1f0;
            end
            3'h2: begin
              out_r = 16'hc1f0;
            end
            3'h3: begin
              out_r = 16'hc1f0;
              case (mant_lo4)
                4'hc: out_r = 16'hc1ef;
                4'hd: out_r = 16'hc1ef;
                4'he: out_r = 16'hc1ef;
                4'hf: out_r = 16'hc1ef;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1ef;
            end
            3'h5: begin
              out_r = 16'hc1ef;
            end
            3'h6: begin
              out_r = 16'hc1ef;
            end
            3'h7: begin
              out_r = 16'hc1ef;
              case (mant_lo4)
                4'ha: out_r = 16'hc1ee;
                4'hb: out_r = 16'hc1ee;
                4'hc: out_r = 16'hc1ee;
                4'hd: out_r = 16'hc1ee;
                4'he: out_r = 16'hc1ee;
                4'hf: out_r = 16'hc1ee;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h01c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ee;
            end
            3'h1: begin
              out_r = 16'hc1ee;
            end
            3'h2: begin
              out_r = 16'hc1ed;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ee;
                4'h1: out_r = 16'hc1ee;
                4'h2: out_r = 16'hc1ee;
                4'h3: out_r = 16'hc1ee;
                4'h4: out_r = 16'hc1ee;
                4'h5: out_r = 16'hc1ee;
                4'h6: out_r = 16'hc1ee;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1ed;
            end
            3'h4: begin
              out_r = 16'hc1ed;
            end
            3'h5: begin
              out_r = 16'hc1ed;
              case (mant_lo4)
                4'hf: out_r = 16'hc1ec;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1ec;
            end
            3'h7: begin
              out_r = 16'hc1ec;
            end
            default: begin end
          endcase
        end
        9'h01d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ec;
            end
            3'h1: begin
              out_r = 16'hc1eb;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ec;
                4'h1: out_r = 16'hc1ec;
                4'h2: out_r = 16'hc1ec;
                4'h3: out_r = 16'hc1ec;
                4'h4: out_r = 16'hc1ec;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1eb;
            end
            3'h3: begin
              out_r = 16'hc1eb;
            end
            3'h4: begin
              out_r = 16'hc1ea;
              case (mant_lo4)
                4'h0: out_r = 16'hc1eb;
                4'h1: out_r = 16'hc1eb;
                4'h2: out_r = 16'hc1eb;
                4'h3: out_r = 16'hc1eb;
                4'h4: out_r = 16'hc1eb;
                4'h5: out_r = 16'hc1eb;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1ea;
            end
            3'h6: begin
              out_r = 16'hc1ea;
            end
            3'h7: begin
              out_r = 16'hc1ea;
            end
            default: begin end
          endcase
        end
        9'h01e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e9;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ea;
                4'h1: out_r = 16'hc1ea;
                4'h2: out_r = 16'hc1ea;
                4'h3: out_r = 16'hc1ea;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1e9;
            end
            3'h2: begin
              out_r = 16'hc1e9;
            end
            3'h3: begin
              out_r = 16'hc1e8;
            end
            3'h4: begin
              out_r = 16'hc1e8;
            end
            3'h5: begin
              out_r = 16'hc1e8;
            end
            3'h6: begin
              out_r = 16'hc1e8;
              case (mant_lo4)
                4'hb: out_r = 16'hc1e7;
                4'hc: out_r = 16'hc1e7;
                4'hd: out_r = 16'hc1e7;
                4'he: out_r = 16'hc1e7;
                4'hf: out_r = 16'hc1e7;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1e7;
            end
            default: begin end
          endcase
        end
        9'h01f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e7;
            end
            3'h1: begin
              out_r = 16'hc1e7;
              case (mant_lo4)
                4'hd: out_r = 16'hc1e6;
                4'he: out_r = 16'hc1e6;
                4'hf: out_r = 16'hc1e6;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1e6;
            end
            3'h3: begin
              out_r = 16'hc1e6;
            end
            3'h4: begin
              out_r = 16'hc1e6;
            end
            3'h5: begin
              out_r = 16'hc1e5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e6;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1e5;
            end
            3'h7: begin
              out_r = 16'hc1e5;
            end
            default: begin end
          endcase
        end
        9'h020: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e5;
              case (mant_lo4)
                4'hb: out_r = 16'hc1e4;
                4'hc: out_r = 16'hc1e4;
                4'hd: out_r = 16'hc1e4;
                4'he: out_r = 16'hc1e4;
                4'hf: out_r = 16'hc1e4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1e4;
            end
            3'h2: begin
              out_r = 16'hc1e4;
            end
            3'h3: begin
              out_r = 16'hc1e4;
              case (mant_lo4)
                4'ha: out_r = 16'hc1e3;
                4'hb: out_r = 16'hc1e3;
                4'hc: out_r = 16'hc1e3;
                4'hd: out_r = 16'hc1e3;
                4'he: out_r = 16'hc1e3;
                4'hf: out_r = 16'hc1e3;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1e3;
            end
            3'h5: begin
              out_r = 16'hc1e3;
            end
            3'h6: begin
              out_r = 16'hc1e3;
            end
            3'h7: begin
              out_r = 16'hc1e2;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e3;
                4'h1: out_r = 16'hc1e3;
                4'h2: out_r = 16'hc1e3;
                4'h3: out_r = 16'hc1e3;
                4'h4: out_r = 16'hc1e3;
                4'h5: out_r = 16'hc1e3;
                4'h6: out_r = 16'hc1e3;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h021: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e2;
            end
            3'h1: begin
              out_r = 16'hc1e2;
            end
            3'h2: begin
              out_r = 16'hc1e1;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e2;
                4'h1: out_r = 16'hc1e2;
                4'h2: out_r = 16'hc1e2;
                4'h3: out_r = 16'hc1e2;
                4'h4: out_r = 16'hc1e2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1e1;
            end
            3'h4: begin
              out_r = 16'hc1e1;
            end
            3'h5: begin
              out_r = 16'hc1e1;
              case (mant_lo4)
                4'hc: out_r = 16'hc1e0;
                4'hd: out_r = 16'hc1e0;
                4'he: out_r = 16'hc1e0;
                4'hf: out_r = 16'hc1e0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1e0;
            end
            3'h7: begin
              out_r = 16'hc1e0;
            end
            default: begin end
          endcase
        end
        9'h022: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1e0;
            end
            3'h1: begin
              out_r = 16'hc1df;
              case (mant_lo4)
                4'h0: out_r = 16'hc1e0;
                4'h1: out_r = 16'hc1e0;
                4'h2: out_r = 16'hc1e0;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1df;
            end
            3'h3: begin
              out_r = 16'hc1df;
            end
            3'h4: begin
              out_r = 16'hc1de;
              case (mant_lo4)
                4'h0: out_r = 16'hc1df;
                4'h1: out_r = 16'hc1df;
                4'h2: out_r = 16'hc1df;
                4'h3: out_r = 16'hc1df;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1de;
            end
            3'h6: begin
              out_r = 16'hc1de;
            end
            3'h7: begin
              out_r = 16'hc1de;
            end
            default: begin end
          endcase
        end
        9'h023: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1dd;
              case (mant_lo4)
                4'h0: out_r = 16'hc1de;
                4'h1: out_r = 16'hc1de;
                4'h2: out_r = 16'hc1de;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1dd;
            end
            3'h2: begin
              out_r = 16'hc1dd;
              case (mant_lo4)
                4'he: out_r = 16'hc1dc;
                4'hf: out_r = 16'hc1dc;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1dc;
            end
            3'h4: begin
              out_r = 16'hc1dc;
            end
            3'h5: begin
              out_r = 16'hc1dc;
            end
            3'h6: begin
              out_r = 16'hc1dc;
              case (mant_lo4)
                4'h8: out_r = 16'hc1db;
                4'h9: out_r = 16'hc1db;
                4'ha: out_r = 16'hc1db;
                4'hb: out_r = 16'hc1db;
                4'hc: out_r = 16'hc1db;
                4'hd: out_r = 16'hc1db;
                4'he: out_r = 16'hc1db;
                4'hf: out_r = 16'hc1db;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1db;
            end
            default: begin end
          endcase
        end
        9'h024: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1db;
            end
            3'h1: begin
              out_r = 16'hc1db;
              case (mant_lo4)
                4'hb: out_r = 16'hc1da;
                4'hc: out_r = 16'hc1da;
                4'hd: out_r = 16'hc1da;
                4'he: out_r = 16'hc1da;
                4'hf: out_r = 16'hc1da;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1da;
            end
            3'h3: begin
              out_r = 16'hc1da;
            end
            3'h4: begin
              out_r = 16'hc1da;
              case (mant_lo4)
                4'he: out_r = 16'hc1d9;
                4'hf: out_r = 16'hc1d9;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1d9;
            end
            3'h6: begin
              out_r = 16'hc1d9;
            end
            3'h7: begin
              out_r = 16'hc1d9;
            end
            default: begin end
          endcase
        end
        9'h025: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1d9;
              case (mant_lo4)
                4'ha: out_r = 16'hc1d8;
                4'hb: out_r = 16'hc1d8;
                4'hc: out_r = 16'hc1d8;
                4'hd: out_r = 16'hc1d8;
                4'he: out_r = 16'hc1d8;
                4'hf: out_r = 16'hc1d8;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1d8;
            end
            3'h2: begin
              out_r = 16'hc1d8;
            end
            3'h3: begin
              out_r = 16'hc1d7;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d8;
                4'h1: out_r = 16'hc1d8;
                4'h2: out_r = 16'hc1d8;
                4'h3: out_r = 16'hc1d8;
                4'h4: out_r = 16'hc1d8;
                4'h5: out_r = 16'hc1d8;
                4'h6: out_r = 16'hc1d8;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1d7;
            end
            3'h5: begin
              out_r = 16'hc1d7;
            end
            3'h6: begin
              out_r = 16'hc1d7;
            end
            3'h7: begin
              out_r = 16'hc1d6;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d7;
                4'h1: out_r = 16'hc1d7;
                4'h2: out_r = 16'hc1d7;
                4'h3: out_r = 16'hc1d7;
                4'h4: out_r = 16'hc1d7;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h026: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1d6;
            end
            3'h1: begin
              out_r = 16'hc1d6;
            end
            3'h2: begin
              out_r = 16'hc1d5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d6;
                4'h1: out_r = 16'hc1d6;
                4'h2: out_r = 16'hc1d6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1d5;
            end
            3'h4: begin
              out_r = 16'hc1d5;
            end
            3'h5: begin
              out_r = 16'hc1d5;
              case (mant_lo4)
                4'h9: out_r = 16'hc1d4;
                4'ha: out_r = 16'hc1d4;
                4'hb: out_r = 16'hc1d4;
                4'hc: out_r = 16'hc1d4;
                4'hd: out_r = 16'hc1d4;
                4'he: out_r = 16'hc1d4;
                4'hf: out_r = 16'hc1d4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1d4;
            end
            3'h7: begin
              out_r = 16'hc1d4;
            end
            default: begin end
          endcase
        end
        9'h027: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1d4;
            end
            3'h1: begin
              out_r = 16'hc1d3;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1d3;
            end
            3'h3: begin
              out_r = 16'hc1d3;
            end
            3'h4: begin
              out_r = 16'hc1d2;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d3;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1d2;
            end
            3'h6: begin
              out_r = 16'hc1d2;
            end
            3'h7: begin
              out_r = 16'hc1d2;
            end
            default: begin end
          endcase
        end
        9'h028: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1d1;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1d1;
            end
            3'h2: begin
              out_r = 16'hc1d1;
              case (mant_lo4)
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
              out_r = 16'hc1d0;
            end
            3'h5: begin
              out_r = 16'hc1d0;
            end
            3'h6: begin
              out_r = 16'hc1cf;
              case (mant_lo4)
                4'h0: out_r = 16'hc1d0;
                4'h1: out_r = 16'hc1d0;
                4'h2: out_r = 16'hc1d0;
                4'h3: out_r = 16'hc1d0;
                4'h4: out_r = 16'hc1d0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1cf;
            end
            default: begin end
          endcase
        end
        9'h029: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1cf;
            end
            3'h1: begin
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
            3'h2: begin
              out_r = 16'hc1ce;
            end
            3'h3: begin
              out_r = 16'hc1ce;
            end
            3'h4: begin
              out_r = 16'hc1ce;
              case (mant_lo4)
                4'hc: out_r = 16'hc1cd;
                4'hd: out_r = 16'hc1cd;
                4'he: out_r = 16'hc1cd;
                4'hf: out_r = 16'hc1cd;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1cd;
            end
            3'h6: begin
              out_r = 16'hc1cd;
            end
            3'h7: begin
              out_r = 16'hc1cd;
            end
            default: begin end
          endcase
        end
        9'h02a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1cd;
              case (mant_lo4)
                4'h8: out_r = 16'hc1cc;
                4'h9: out_r = 16'hc1cc;
                4'ha: out_r = 16'hc1cc;
                4'hb: out_r = 16'hc1cc;
                4'hc: out_r = 16'hc1cc;
                4'hd: out_r = 16'hc1cc;
                4'he: out_r = 16'hc1cc;
                4'hf: out_r = 16'hc1cc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1cc;
            end
            3'h2: begin
              out_r = 16'hc1cc;
            end
            3'h3: begin
              out_r = 16'hc1cb;
              case (mant_lo4)
                4'h0: out_r = 16'hc1cc;
                4'h1: out_r = 16'hc1cc;
                4'h2: out_r = 16'hc1cc;
                4'h3: out_r = 16'hc1cc;
                4'h4: out_r = 16'hc1cc;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1cb;
            end
            3'h5: begin
              out_r = 16'hc1cb;
            end
            3'h6: begin
              out_r = 16'hc1cb;
            end
            3'h7: begin
              out_r = 16'hc1ca;
              case (mant_lo4)
                4'h0: out_r = 16'hc1cb;
                4'h1: out_r = 16'hc1cb;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h02b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ca;
            end
            3'h1: begin
              out_r = 16'hc1ca;
            end
            3'h2: begin
              out_r = 16'hc1c9;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ca;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1c9;
            end
            3'h4: begin
              out_r = 16'hc1c9;
            end
            3'h5: begin
              out_r = 16'hc1c8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c9;
                4'h1: out_r = 16'hc1c9;
                4'h2: out_r = 16'hc1c9;
                4'h3: out_r = 16'hc1c9;
                4'h4: out_r = 16'hc1c9;
                4'h5: out_r = 16'hc1c9;
                4'h6: out_r = 16'hc1c9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1c8;
            end
            3'h7: begin
              out_r = 16'hc1c8;
            end
            default: begin end
          endcase
        end
        9'h02c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1c8;
              case (mant_lo4)
                4'hf: out_r = 16'hc1c7;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1c7;
            end
            3'h2: begin
              out_r = 16'hc1c7;
            end
            3'h3: begin
              out_r = 16'hc1c7;
              case (mant_lo4)
                4'hf: out_r = 16'hc1c6;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1c6;
            end
            3'h5: begin
              out_r = 16'hc1c6;
            end
            3'h6: begin
              out_r = 16'hc1c6;
            end
            3'h7: begin
              out_r = 16'hc1c6;
              case (mant_lo4)
                4'hf: out_r = 16'hc1c5;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h02d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1c5;
            end
            3'h1: begin
              out_r = 16'hc1c5;
            end
            3'h2: begin
              out_r = 16'hc1c5;
              case (mant_lo4)
                4'ha: out_r = 16'hc1c4;
                4'hb: out_r = 16'hc1c4;
                4'hc: out_r = 16'hc1c4;
                4'hd: out_r = 16'hc1c4;
                4'he: out_r = 16'hc1c4;
                4'hf: out_r = 16'hc1c4;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1c4;
            end
            3'h4: begin
              out_r = 16'hc1c4;
            end
            3'h5: begin
              out_r = 16'hc1c4;
            end
            3'h6: begin
              out_r = 16'hc1c3;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c4;
                4'h1: out_r = 16'hc1c4;
                4'h2: out_r = 16'hc1c4;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1c3;
            end
            default: begin end
          endcase
        end
        9'h02e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1c3;
            end
            3'h1: begin
              out_r = 16'hc1c2;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c3;
                4'h1: out_r = 16'hc1c3;
                4'h2: out_r = 16'hc1c3;
                4'h3: out_r = 16'hc1c3;
                4'h4: out_r = 16'hc1c3;
                4'h5: out_r = 16'hc1c3;
                4'h6: out_r = 16'hc1c3;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1c2;
            end
            3'h3: begin
              out_r = 16'hc1c2;
            end
            3'h4: begin
              out_r = 16'hc1c2;
              case (mant_lo4)
                4'h9: out_r = 16'hc1c1;
                4'ha: out_r = 16'hc1c1;
                4'hb: out_r = 16'hc1c1;
                4'hc: out_r = 16'hc1c1;
                4'hd: out_r = 16'hc1c1;
                4'he: out_r = 16'hc1c1;
                4'hf: out_r = 16'hc1c1;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1c1;
            end
            3'h6: begin
              out_r = 16'hc1c1;
            end
            3'h7: begin
              out_r = 16'hc1c1;
            end
            default: begin end
          endcase
        end
        9'h02f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1c0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c1;
                4'h1: out_r = 16'hc1c1;
                4'h2: out_r = 16'hc1c1;
                4'h3: out_r = 16'hc1c1;
                4'h4: out_r = 16'hc1c1;
                4'h5: out_r = 16'hc1c1;
                4'h6: out_r = 16'hc1c1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1c0;
            end
            3'h2: begin
              out_r = 16'hc1c0;
            end
            3'h3: begin
              out_r = 16'hc1bf;
              case (mant_lo4)
                4'h0: out_r = 16'hc1c0;
                4'h1: out_r = 16'hc1c0;
                4'h2: out_r = 16'hc1c0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1bf;
            end
            3'h5: begin
              out_r = 16'hc1bf;
            end
            3'h6: begin
              out_r = 16'hc1bf;
              case (mant_lo4)
                4'hf: out_r = 16'hc1be;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1be;
            end
            default: begin end
          endcase
        end
        9'h030: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1be;
            end
            3'h1: begin
              out_r = 16'hc1be;
              case (mant_lo4)
                4'hf: out_r = 16'hc1bd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1bd;
            end
            3'h3: begin
              out_r = 16'hc1bd;
            end
            3'h4: begin
              out_r = 16'hc1bd;
            end
            3'h5: begin
              out_r = 16'hc1bc;
              case (mant_lo4)
                4'h0: out_r = 16'hc1bd;
                4'h1: out_r = 16'hc1bd;
                4'h2: out_r = 16'hc1bd;
                4'h3: out_r = 16'hc1bd;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1bc;
            end
            3'h7: begin
              out_r = 16'hc1bc;
            end
            default: begin end
          endcase
        end
        9'h031: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1bc;
              case (mant_lo4)
                4'he: out_r = 16'hc1bb;
                4'hf: out_r = 16'hc1bb;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1bb;
            end
            3'h2: begin
              out_r = 16'hc1bb;
            end
            3'h3: begin
              out_r = 16'hc1bb;
              case (mant_lo4)
                4'hd: out_r = 16'hc1ba;
                4'he: out_r = 16'hc1ba;
                4'hf: out_r = 16'hc1ba;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1ba;
            end
            3'h5: begin
              out_r = 16'hc1ba;
            end
            3'h6: begin
              out_r = 16'hc1ba;
            end
            3'h7: begin
              out_r = 16'hc1ba;
              case (mant_lo4)
                4'hc: out_r = 16'hc1b9;
                4'hd: out_r = 16'hc1b9;
                4'he: out_r = 16'hc1b9;
                4'hf: out_r = 16'hc1b9;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h032: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b9;
            end
            3'h1: begin
              out_r = 16'hc1b9;
            end
            3'h2: begin
              out_r = 16'hc1b9;
              case (mant_lo4)
                4'h8: out_r = 16'hc1b8;
                4'h9: out_r = 16'hc1b8;
                4'ha: out_r = 16'hc1b8;
                4'hb: out_r = 16'hc1b8;
                4'hc: out_r = 16'hc1b8;
                4'hd: out_r = 16'hc1b8;
                4'he: out_r = 16'hc1b8;
                4'hf: out_r = 16'hc1b8;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1b8;
            end
            3'h4: begin
              out_r = 16'hc1b8;
            end
            3'h5: begin
              out_r = 16'hc1b8;
            end
            3'h6: begin
              out_r = 16'hc1b7;
            end
            3'h7: begin
              out_r = 16'hc1b7;
            end
            default: begin end
          endcase
        end
        9'h033: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b7;
            end
            3'h1: begin
              out_r = 16'hc1b6;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b7;
                4'h1: out_r = 16'hc1b7;
                4'h2: out_r = 16'hc1b7;
                4'h3: out_r = 16'hc1b7;
                4'h4: out_r = 16'hc1b7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1b6;
            end
            3'h3: begin
              out_r = 16'hc1b6;
            end
            3'h4: begin
              out_r = 16'hc1b5;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b6;
                4'h1: out_r = 16'hc1b6;
                4'h2: out_r = 16'hc1b6;
                4'h3: out_r = 16'hc1b6;
                4'h4: out_r = 16'hc1b6;
                4'h5: out_r = 16'hc1b6;
                4'h6: out_r = 16'hc1b6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1b5;
            end
            3'h6: begin
              out_r = 16'hc1b5;
            end
            3'h7: begin
              out_r = 16'hc1b5;
            end
            default: begin end
          endcase
        end
        9'h034: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b4;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b5;
                4'h1: out_r = 16'hc1b5;
                4'h2: out_r = 16'hc1b5;
                4'h3: out_r = 16'hc1b5;
                4'h4: out_r = 16'hc1b5;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1b4;
            end
            3'h2: begin
              out_r = 16'hc1b4;
            end
            3'h3: begin
              out_r = 16'hc1b3;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b4;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1b3;
            end
            3'h5: begin
              out_r = 16'hc1b3;
            end
            3'h6: begin
              out_r = 16'hc1b3;
              case (mant_lo4)
                4'hc: out_r = 16'hc1b2;
                4'hd: out_r = 16'hc1b2;
                4'he: out_r = 16'hc1b2;
                4'hf: out_r = 16'hc1b2;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1b2;
            end
            default: begin end
          endcase
        end
        9'h035: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b2;
            end
            3'h1: begin
              out_r = 16'hc1b2;
              case (mant_lo4)
                4'he: out_r = 16'hc1b1;
                4'hf: out_r = 16'hc1b1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1b1;
            end
            3'h3: begin
              out_r = 16'hc1b1;
            end
            3'h4: begin
              out_r = 16'hc1b1;
            end
            3'h5: begin
              out_r = 16'hc1b0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1b1;
                4'h1: out_r = 16'hc1b1;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1b0;
            end
            3'h7: begin
              out_r = 16'hc1b0;
            end
            default: begin end
          endcase
        end
        9'h036: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1b0;
              case (mant_lo4)
                4'hc: out_r = 16'hc1af;
                4'hd: out_r = 16'hc1af;
                4'he: out_r = 16'hc1af;
                4'hf: out_r = 16'hc1af;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1af;
            end
            3'h2: begin
              out_r = 16'hc1af;
            end
            3'h3: begin
              out_r = 16'hc1af;
              case (mant_lo4)
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
              out_r = 16'hc1ae;
            end
            3'h6: begin
              out_r = 16'hc1ae;
            end
            3'h7: begin
              out_r = 16'hc1ae;
              case (mant_lo4)
                4'h9: out_r = 16'hc1ad;
                4'ha: out_r = 16'hc1ad;
                4'hb: out_r = 16'hc1ad;
                4'hc: out_r = 16'hc1ad;
                4'hd: out_r = 16'hc1ad;
                4'he: out_r = 16'hc1ad;
                4'hf: out_r = 16'hc1ad;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h037: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ad;
            end
            3'h1: begin
              out_r = 16'hc1ad;
            end
            3'h2: begin
              out_r = 16'hc1ac;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ad;
                4'h1: out_r = 16'hc1ad;
                4'h2: out_r = 16'hc1ad;
                4'h3: out_r = 16'hc1ad;
                4'h4: out_r = 16'hc1ad;
                4'h5: out_r = 16'hc1ad;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1ac;
            end
            3'h4: begin
              out_r = 16'hc1ac;
            end
            3'h5: begin
              out_r = 16'hc1ac;
              case (mant_lo4)
                4'hd: out_r = 16'hc1ab;
                4'he: out_r = 16'hc1ab;
                4'hf: out_r = 16'hc1ab;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc1ab;
            end
            3'h7: begin
              out_r = 16'hc1ab;
            end
            default: begin end
          endcase
        end
        9'h038: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1ab;
            end
            3'h1: begin
              out_r = 16'hc1aa;
              case (mant_lo4)
                4'h0: out_r = 16'hc1ab;
                4'h1: out_r = 16'hc1ab;
                4'h2: out_r = 16'hc1ab;
                4'h3: out_r = 16'hc1ab;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1aa;
            end
            3'h3: begin
              out_r = 16'hc1aa;
            end
            3'h4: begin
              out_r = 16'hc1a9;
              case (mant_lo4)
                4'h0: out_r = 16'hc1aa;
                4'h1: out_r = 16'hc1aa;
                4'h2: out_r = 16'hc1aa;
                4'h3: out_r = 16'hc1aa;
                4'h4: out_r = 16'hc1aa;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1a9;
            end
            3'h6: begin
              out_r = 16'hc1a9;
            end
            3'h7: begin
              out_r = 16'hc1a9;
            end
            default: begin end
          endcase
        end
        9'h039: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1a8;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a9;
                4'h1: out_r = 16'hc1a9;
                4'h2: out_r = 16'hc1a9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1a8;
            end
            3'h2: begin
              out_r = 16'hc1a8;
              case (mant_lo4)
                4'hf: out_r = 16'hc1a7;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1a7;
            end
            3'h4: begin
              out_r = 16'hc1a7;
            end
            3'h5: begin
              out_r = 16'hc1a7;
            end
            3'h6: begin
              out_r = 16'hc1a7;
              case (mant_lo4)
                4'h9: out_r = 16'hc1a6;
                4'ha: out_r = 16'hc1a6;
                4'hb: out_r = 16'hc1a6;
                4'hc: out_r = 16'hc1a6;
                4'hd: out_r = 16'hc1a6;
                4'he: out_r = 16'hc1a6;
                4'hf: out_r = 16'hc1a6;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc1a6;
            end
            default: begin end
          endcase
        end
        9'h03a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1a6;
            end
            3'h1: begin
              out_r = 16'hc1a6;
              case (mant_lo4)
                4'hc: out_r = 16'hc1a5;
                4'hd: out_r = 16'hc1a5;
                4'he: out_r = 16'hc1a5;
                4'hf: out_r = 16'hc1a5;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc1a5;
            end
            3'h3: begin
              out_r = 16'hc1a5;
            end
            3'h4: begin
              out_r = 16'hc1a5;
              case (mant_lo4)
                4'hf: out_r = 16'hc1a4;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc1a4;
            end
            3'h6: begin
              out_r = 16'hc1a4;
            end
            3'h7: begin
              out_r = 16'hc1a4;
            end
            default: begin end
          endcase
        end
        9'h03b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1a4;
              case (mant_lo4)
                4'ha: out_r = 16'hc1a3;
                4'hb: out_r = 16'hc1a3;
                4'hc: out_r = 16'hc1a3;
                4'hd: out_r = 16'hc1a3;
                4'he: out_r = 16'hc1a3;
                4'hf: out_r = 16'hc1a3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc1a3;
            end
            3'h2: begin
              out_r = 16'hc1a3;
            end
            3'h3: begin
              out_r = 16'hc1a3;
              case (mant_lo4)
                4'h8: out_r = 16'hc1a2;
                4'h9: out_r = 16'hc1a2;
                4'ha: out_r = 16'hc1a2;
                4'hb: out_r = 16'hc1a2;
                4'hc: out_r = 16'hc1a2;
                4'hd: out_r = 16'hc1a2;
                4'he: out_r = 16'hc1a2;
                4'hf: out_r = 16'hc1a2;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc1a2;
            end
            3'h5: begin
              out_r = 16'hc1a2;
            end
            3'h6: begin
              out_r = 16'hc1a2;
            end
            3'h7: begin
              out_r = 16'hc1a1;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a2;
                4'h1: out_r = 16'hc1a2;
                4'h2: out_r = 16'hc1a2;
                4'h3: out_r = 16'hc1a2;
                4'h4: out_r = 16'hc1a2;
                4'h5: out_r = 16'hc1a2;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h03c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc1a1;
            end
            3'h1: begin
              out_r = 16'hc1a1;
            end
            3'h2: begin
              out_r = 16'hc1a0;
              case (mant_lo4)
                4'h0: out_r = 16'hc1a1;
                4'h1: out_r = 16'hc1a1;
                4'h2: out_r = 16'hc1a1;
                4'h3: out_r = 16'hc1a1;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc1a0;
            end
            3'h4: begin
              out_r = 16'hc1a0;
            end
            3'h5: begin
              out_r = 16'hc1a0;
              case (mant_lo4)
                4'hb: out_r = 16'hc19f;
                4'hc: out_r = 16'hc19f;
                4'hd: out_r = 16'hc19f;
                4'he: out_r = 16'hc19f;
                4'hf: out_r = 16'hc19f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc19f;
            end
            3'h7: begin
              out_r = 16'hc19f;
            end
            default: begin end
          endcase
        end
        9'h03d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc19f;
            end
            3'h1: begin
              out_r = 16'hc19e;
              case (mant_lo4)
                4'h0: out_r = 16'hc19f;
                4'h1: out_r = 16'hc19f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc19e;
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
            end
            3'h6: begin
              out_r = 16'hc19d;
            end
            3'h7: begin
              out_r = 16'hc19d;
            end
            default: begin end
          endcase
        end
        9'h03e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc19c;
              case (mant_lo4)
                4'h0: out_r = 16'hc19d;
                4'h1: out_r = 16'hc19d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc19c;
            end
            3'h2: begin
              out_r = 16'hc19c;
              case (mant_lo4)
                4'hd: out_r = 16'hc19b;
                4'he: out_r = 16'hc19b;
                4'hf: out_r = 16'hc19b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc19b;
            end
            3'h4: begin
              out_r = 16'hc19b;
            end
            3'h5: begin
              out_r = 16'hc19b;
            end
            3'h6: begin
              out_r = 16'hc19a;
              case (mant_lo4)
                4'h0: out_r = 16'hc19b;
                4'h1: out_r = 16'hc19b;
                4'h2: out_r = 16'hc19b;
                4'h3: out_r = 16'hc19b;
                4'h4: out_r = 16'hc19b;
                4'h5: out_r = 16'hc19b;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc19a;
            end
            default: begin end
          endcase
        end
        9'h03f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc19a;
            end
            3'h1: begin
              out_r = 16'hc19a;
              case (mant_lo4)
                4'ha: out_r = 16'hc199;
                4'hb: out_r = 16'hc199;
                4'hc: out_r = 16'hc199;
                4'hd: out_r = 16'hc199;
                4'he: out_r = 16'hc199;
                4'hf: out_r = 16'hc199;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc199;
            end
            3'h3: begin
              out_r = 16'hc199;
            end
            3'h4: begin
              out_r = 16'hc199;
              case (mant_lo4)
                4'hd: out_r = 16'hc198;
                4'he: out_r = 16'hc198;
                4'hf: out_r = 16'hc198;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc198;
            end
            3'h6: begin
              out_r = 16'hc198;
            end
            3'h7: begin
              out_r = 16'hc198;
            end
            default: begin end
          endcase
        end
        9'h040: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc198;
              case (mant_lo4)
                4'h9: out_r = 16'hc197;
                4'ha: out_r = 16'hc197;
                4'hb: out_r = 16'hc197;
                4'hc: out_r = 16'hc197;
                4'hd: out_r = 16'hc197;
                4'he: out_r = 16'hc197;
                4'hf: out_r = 16'hc197;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc197;
            end
            3'h2: begin
              out_r = 16'hc197;
            end
            3'h3: begin
              out_r = 16'hc196;
              case (mant_lo4)
                4'h0: out_r = 16'hc197;
                4'h1: out_r = 16'hc197;
                4'h2: out_r = 16'hc197;
                4'h3: out_r = 16'hc197;
                4'h4: out_r = 16'hc197;
                4'h5: out_r = 16'hc197;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc196;
            end
            3'h5: begin
              out_r = 16'hc196;
            end
            3'h6: begin
              out_r = 16'hc196;
            end
            3'h7: begin
              out_r = 16'hc195;
              case (mant_lo4)
                4'h0: out_r = 16'hc196;
                4'h1: out_r = 16'hc196;
                4'h2: out_r = 16'hc196;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h041: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc195;
            end
            3'h1: begin
              out_r = 16'hc195;
            end
            3'h2: begin
              out_r = 16'hc194;
              case (mant_lo4)
                4'h0: out_r = 16'hc195;
                4'h1: out_r = 16'hc195;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc194;
            end
            3'h4: begin
              out_r = 16'hc194;
            end
            3'h5: begin
              out_r = 16'hc194;
              case (mant_lo4)
                4'h8: out_r = 16'hc193;
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
            3'h6: begin
              out_r = 16'hc193;
            end
            3'h7: begin
              out_r = 16'hc193;
            end
            default: begin end
          endcase
        end
        9'h042: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc193;
            end
            3'h1: begin
              out_r = 16'hc192;
            end
            3'h2: begin
              out_r = 16'hc192;
            end
            3'h3: begin
              out_r = 16'hc192;
            end
            3'h4: begin
              out_r = 16'hc191;
            end
            3'h5: begin
              out_r = 16'hc191;
            end
            3'h6: begin
              out_r = 16'hc191;
            end
            3'h7: begin
              out_r = 16'hc191;
            end
            default: begin end
          endcase
        end
        9'h043: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc190;
            end
            3'h1: begin
              out_r = 16'hc190;
            end
            3'h2: begin
              out_r = 16'hc190;
              case (mant_lo4)
                4'hb: out_r = 16'hc18f;
                4'hc: out_r = 16'hc18f;
                4'hd: out_r = 16'hc18f;
                4'he: out_r = 16'hc18f;
                4'hf: out_r = 16'hc18f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc18f;
            end
            3'h4: begin
              out_r = 16'hc18f;
            end
            3'h5: begin
              out_r = 16'hc18f;
            end
            3'h6: begin
              out_r = 16'hc18e;
              case (mant_lo4)
                4'h0: out_r = 16'hc18f;
                4'h1: out_r = 16'hc18f;
                4'h2: out_r = 16'hc18f;
                4'h3: out_r = 16'hc18f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc18e;
            end
            default: begin end
          endcase
        end
        9'h044: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc18e;
            end
            3'h1: begin
              out_r = 16'hc18e;
              case (mant_lo4)
                4'h8: out_r = 16'hc18d;
                4'h9: out_r = 16'hc18d;
                4'ha: out_r = 16'hc18d;
                4'hb: out_r = 16'hc18d;
                4'hc: out_r = 16'hc18d;
                4'hd: out_r = 16'hc18d;
                4'he: out_r = 16'hc18d;
                4'hf: out_r = 16'hc18d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc18d;
            end
            3'h3: begin
              out_r = 16'hc18d;
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
              out_r = 16'hc18c;
            end
            3'h7: begin
              out_r = 16'hc18c;
            end
            default: begin end
          endcase
        end
        9'h045: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc18b;
              case (mant_lo4)
                4'h0: out_r = 16'hc18c;
                4'h1: out_r = 16'hc18c;
                4'h2: out_r = 16'hc18c;
                4'h3: out_r = 16'hc18c;
                4'h4: out_r = 16'hc18c;
                4'h5: out_r = 16'hc18c;
                4'h6: out_r = 16'hc18c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc18b;
            end
            3'h2: begin
              out_r = 16'hc18b;
            end
            3'h3: begin
              out_r = 16'hc18a;
              case (mant_lo4)
                4'h0: out_r = 16'hc18b;
                4'h1: out_r = 16'hc18b;
                4'h2: out_r = 16'hc18b;
                4'h3: out_r = 16'hc18b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc18a;
            end
            3'h5: begin
              out_r = 16'hc18a;
            end
            3'h6: begin
              out_r = 16'hc18a;
            end
            3'h7: begin
              out_r = 16'hc189;
            end
            default: begin end
          endcase
        end
        9'h046: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc189;
            end
            3'h1: begin
              out_r = 16'hc189;
            end
            3'h2: begin
              out_r = 16'hc188;
            end
            3'h3: begin
              out_r = 16'hc188;
            end
            3'h4: begin
              out_r = 16'hc188;
            end
            3'h5: begin
              out_r = 16'hc187;
              case (mant_lo4)
                4'h0: out_r = 16'hc188;
                4'h1: out_r = 16'hc188;
                4'h2: out_r = 16'hc188;
                4'h3: out_r = 16'hc188;
                4'h4: out_r = 16'hc188;
                4'h5: out_r = 16'hc188;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc187;
            end
            3'h7: begin
              out_r = 16'hc187;
            end
            default: begin end
          endcase
        end
        9'h047: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc187;
              case (mant_lo4)
                4'hf: out_r = 16'hc186;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc186;
            end
            3'h2: begin
              out_r = 16'hc186;
            end
            3'h3: begin
              out_r = 16'hc186;
              case (mant_lo4)
                4'he: out_r = 16'hc185;
                4'hf: out_r = 16'hc185;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc185;
            end
            3'h5: begin
              out_r = 16'hc185;
            end
            3'h6: begin
              out_r = 16'hc185;
            end
            3'h7: begin
              out_r = 16'hc185;
              case (mant_lo4)
                4'hd: out_r = 16'hc184;
                4'he: out_r = 16'hc184;
                4'hf: out_r = 16'hc184;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h048: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc184;
            end
            3'h1: begin
              out_r = 16'hc184;
            end
            3'h2: begin
              out_r = 16'hc184;
              case (mant_lo4)
                4'h9: out_r = 16'hc183;
                4'ha: out_r = 16'hc183;
                4'hb: out_r = 16'hc183;
                4'hc: out_r = 16'hc183;
                4'hd: out_r = 16'hc183;
                4'he: out_r = 16'hc183;
                4'hf: out_r = 16'hc183;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc183;
            end
            3'h4: begin
              out_r = 16'hc183;
            end
            3'h5: begin
              out_r = 16'hc183;
            end
            3'h6: begin
              out_r = 16'hc182;
              case (mant_lo4)
                4'h0: out_r = 16'hc183;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc182;
            end
            default: begin end
          endcase
        end
        9'h049: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc182;
            end
            3'h1: begin
              out_r = 16'hc181;
              case (mant_lo4)
                4'h0: out_r = 16'hc182;
                4'h1: out_r = 16'hc182;
                4'h2: out_r = 16'hc182;
                4'h3: out_r = 16'hc182;
                4'h4: out_r = 16'hc182;
                4'h5: out_r = 16'hc182;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc181;
            end
            3'h3: begin
              out_r = 16'hc181;
            end
            3'h4: begin
              out_r = 16'hc181;
              case (mant_lo4)
                4'h8: out_r = 16'hc180;
                4'h9: out_r = 16'hc180;
                4'ha: out_r = 16'hc180;
                4'hb: out_r = 16'hc180;
                4'hc: out_r = 16'hc180;
                4'hd: out_r = 16'hc180;
                4'he: out_r = 16'hc180;
                4'hf: out_r = 16'hc180;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc180;
            end
            3'h6: begin
              out_r = 16'hc180;
            end
            3'h7: begin
              out_r = 16'hc180;
              case (mant_lo4)
                4'h8: out_r = 16'hc17f;
                4'h9: out_r = 16'hc17f;
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
        9'h04a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc17f;
            end
            3'h1: begin
              out_r = 16'hc17e;
            end
            3'h2: begin
              out_r = 16'hc17d;
              case (mant_lo4)
                4'h0: out_r = 16'hc17e;
                4'h1: out_r = 16'hc17e;
                4'h2: out_r = 16'hc17e;
                4'h3: out_r = 16'hc17e;
                4'h4: out_r = 16'hc17e;
                4'h5: out_r = 16'hc17e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc17d;
              case (mant_lo4)
                4'hf: out_r = 16'hc17c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc17c;
            end
            3'h5: begin
              out_r = 16'hc17c;
              case (mant_lo4)
                4'hd: out_r = 16'hc17b;
                4'he: out_r = 16'hc17b;
                4'hf: out_r = 16'hc17b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc17b;
            end
            3'h7: begin
              out_r = 16'hc17b;
              case (mant_lo4)
                4'hf: out_r = 16'hc17a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h04b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc17a;
            end
            3'h1: begin
              out_r = 16'hc179;
              case (mant_lo4)
                4'h0: out_r = 16'hc17a;
                4'h1: out_r = 16'hc17a;
                4'h2: out_r = 16'hc17a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc179;
              case (mant_lo4)
                4'ha: out_r = 16'hc178;
                4'hb: out_r = 16'hc178;
                4'hc: out_r = 16'hc178;
                4'hd: out_r = 16'hc178;
                4'he: out_r = 16'hc178;
                4'hf: out_r = 16'hc178;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc178;
            end
            3'h4: begin
              out_r = 16'hc177;
              case (mant_lo4)
                4'h0: out_r = 16'hc178;
                4'h1: out_r = 16'hc178;
                4'h2: out_r = 16'hc178;
                4'h3: out_r = 16'hc178;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc177;
            end
            3'h6: begin
              out_r = 16'hc176;
              case (mant_lo4)
                4'h0: out_r = 16'hc177;
                4'h1: out_r = 16'hc177;
                4'h2: out_r = 16'hc177;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc176;
            end
            default: begin end
          endcase
        end
        9'h04c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc175;
              case (mant_lo4)
                4'h0: out_r = 16'hc176;
                4'h1: out_r = 16'hc176;
                4'h2: out_r = 16'hc176;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc174;
              case (mant_lo4)
                4'h0: out_r = 16'hc175;
                4'h1: out_r = 16'hc175;
                4'h2: out_r = 16'hc175;
                4'h3: out_r = 16'hc175;
                4'h4: out_r = 16'hc175;
                4'h5: out_r = 16'hc175;
                4'h6: out_r = 16'hc175;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc174;
              case (mant_lo4)
                4'hf: out_r = 16'hc173;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc173;
            end
            3'h4: begin
              out_r = 16'hc173;
              case (mant_lo4)
                4'ha: out_r = 16'hc172;
                4'hb: out_r = 16'hc172;
                4'hc: out_r = 16'hc172;
                4'hd: out_r = 16'hc172;
                4'he: out_r = 16'hc172;
                4'hf: out_r = 16'hc172;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc172;
            end
            3'h6: begin
              out_r = 16'hc172;
              case (mant_lo4)
                4'h9: out_r = 16'hc171;
                4'ha: out_r = 16'hc171;
                4'hb: out_r = 16'hc171;
                4'hc: out_r = 16'hc171;
                4'hd: out_r = 16'hc171;
                4'he: out_r = 16'hc171;
                4'hf: out_r = 16'hc171;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc171;
            end
            default: begin end
          endcase
        end
        9'h04d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc170;
              case (mant_lo4)
                4'h0: out_r = 16'hc171;
                4'h1: out_r = 16'hc171;
                4'h2: out_r = 16'hc171;
                4'h3: out_r = 16'hc171;
                4'h4: out_r = 16'hc171;
                4'h5: out_r = 16'hc171;
                4'h6: out_r = 16'hc171;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc170;
              case (mant_lo4)
                4'hb: out_r = 16'hc16f;
                4'hc: out_r = 16'hc16f;
                4'hd: out_r = 16'hc16f;
                4'he: out_r = 16'hc16f;
                4'hf: out_r = 16'hc16f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc16f;
            end
            3'h3: begin
              out_r = 16'hc16e;
              case (mant_lo4)
                4'h0: out_r = 16'hc16f;
                4'h1: out_r = 16'hc16f;
                4'h2: out_r = 16'hc16f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc16e;
              case (mant_lo4)
                4'hf: out_r = 16'hc16d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc16d;
            end
            3'h6: begin
              out_r = 16'hc16d;
              case (mant_lo4)
                4'hf: out_r = 16'hc16c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc16c;
            end
            default: begin end
          endcase
        end
        9'h04e: begin
          case (mant_hi3)
            3'h0: begin
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
            3'h1: begin
              out_r = 16'hc16b;
            end
            3'h2: begin
              out_r = 16'hc16a;
            end
            3'h3: begin
              out_r = 16'hc16a;
              case (mant_lo4)
                4'h8: out_r = 16'hc169;
                4'h9: out_r = 16'hc169;
                4'ha: out_r = 16'hc169;
                4'hb: out_r = 16'hc169;
                4'hc: out_r = 16'hc169;
                4'hd: out_r = 16'hc169;
                4'he: out_r = 16'hc169;
                4'hf: out_r = 16'hc169;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc169;
            end
            3'h5: begin
              out_r = 16'hc168;
              case (mant_lo4)
                4'h0: out_r = 16'hc169;
                4'h1: out_r = 16'hc169;
                4'h2: out_r = 16'hc169;
                4'h3: out_r = 16'hc169;
                4'h4: out_r = 16'hc169;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc168;
            end
            3'h7: begin
              out_r = 16'hc167;
              case (mant_lo4)
                4'h0: out_r = 16'hc168;
                4'h1: out_r = 16'hc168;
                4'h2: out_r = 16'hc168;
                4'h3: out_r = 16'hc168;
                4'h4: out_r = 16'hc168;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h04f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc167;
              case (mant_lo4)
                4'he: out_r = 16'hc166;
                4'hf: out_r = 16'hc166;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc166;
            end
            3'h2: begin
              out_r = 16'hc165;
              case (mant_lo4)
                4'h0: out_r = 16'hc166;
                4'h1: out_r = 16'hc166;
                4'h2: out_r = 16'hc166;
                4'h3: out_r = 16'hc166;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc165;
              case (mant_lo4)
                4'hd: out_r = 16'hc164;
                4'he: out_r = 16'hc164;
                4'hf: out_r = 16'hc164;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc164;
            end
            3'h5: begin
              out_r = 16'hc164;
              case (mant_lo4)
                4'ha: out_r = 16'hc163;
                4'hb: out_r = 16'hc163;
                4'hc: out_r = 16'hc163;
                4'hd: out_r = 16'hc163;
                4'he: out_r = 16'hc163;
                4'hf: out_r = 16'hc163;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc163;
            end
            3'h7: begin
              out_r = 16'hc163;
              case (mant_lo4)
                4'hc: out_r = 16'hc162;
                4'hd: out_r = 16'hc162;
                4'he: out_r = 16'hc162;
                4'hf: out_r = 16'hc162;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h050: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc162;
            end
            3'h1: begin
              out_r = 16'hc161;
              case (mant_lo4)
                4'h0: out_r = 16'hc162;
                4'h1: out_r = 16'hc162;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc161;
              case (mant_lo4)
                4'h8: out_r = 16'hc160;
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
            3'h3: begin
              out_r = 16'hc160;
            end
            3'h4: begin
              out_r = 16'hc15f;
              case (mant_lo4)
                4'h0: out_r = 16'hc160;
                4'h1: out_r = 16'hc160;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc15f;
            end
            3'h6: begin
              out_r = 16'hc15e;
            end
            3'h7: begin
              out_r = 16'hc15e;
            end
            default: begin end
          endcase
        end
        9'h051: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc15d;
              case (mant_lo4)
                4'h0: out_r = 16'hc15e;
                4'h1: out_r = 16'hc15e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc15c;
              case (mant_lo4)
                4'h0: out_r = 16'hc15d;
                4'h1: out_r = 16'hc15d;
                4'h2: out_r = 16'hc15d;
                4'h3: out_r = 16'hc15d;
                4'h4: out_r = 16'hc15d;
                4'h5: out_r = 16'hc15d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc15c;
              case (mant_lo4)
                4'hd: out_r = 16'hc15b;
                4'he: out_r = 16'hc15b;
                4'hf: out_r = 16'hc15b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc15b;
            end
            3'h4: begin
              out_r = 16'hc15a;
              case (mant_lo4)
                4'h0: out_r = 16'hc15b;
                4'h1: out_r = 16'hc15b;
                4'h2: out_r = 16'hc15b;
                4'h3: out_r = 16'hc15b;
                4'h4: out_r = 16'hc15b;
                4'h5: out_r = 16'hc15b;
                4'h6: out_r = 16'hc15b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc15a;
            end
            3'h6: begin
              out_r = 16'hc159;
              case (mant_lo4)
                4'h0: out_r = 16'hc15a;
                4'h1: out_r = 16'hc15a;
                4'h2: out_r = 16'hc15a;
                4'h3: out_r = 16'hc15a;
                4'h4: out_r = 16'hc15a;
                4'h5: out_r = 16'hc15a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc159;
            end
            default: begin end
          endcase
        end
        9'h052: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc158;
              case (mant_lo4)
                4'h0: out_r = 16'hc159;
                4'h1: out_r = 16'hc159;
                4'h2: out_r = 16'hc159;
                4'h3: out_r = 16'hc159;
                4'h4: out_r = 16'hc159;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc158;
              case (mant_lo4)
                4'ha: out_r = 16'hc157;
                4'hb: out_r = 16'hc157;
                4'hc: out_r = 16'hc157;
                4'hd: out_r = 16'hc157;
                4'he: out_r = 16'hc157;
                4'hf: out_r = 16'hc157;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc157;
            end
            3'h3: begin
              out_r = 16'hc156;
              case (mant_lo4)
                4'h0: out_r = 16'hc157;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc156;
              case (mant_lo4)
                4'hd: out_r = 16'hc155;
                4'he: out_r = 16'hc155;
                4'hf: out_r = 16'hc155;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc155;
            end
            3'h6: begin
              out_r = 16'hc155;
              case (mant_lo4)
                4'hc: out_r = 16'hc154;
                4'hd: out_r = 16'hc154;
                4'he: out_r = 16'hc154;
                4'hf: out_r = 16'hc154;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc154;
            end
            default: begin end
          endcase
        end
        9'h053: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc154;
              case (mant_lo4)
                4'h9: out_r = 16'hc153;
                4'ha: out_r = 16'hc153;
                4'hb: out_r = 16'hc153;
                4'hc: out_r = 16'hc153;
                4'hd: out_r = 16'hc153;
                4'he: out_r = 16'hc153;
                4'hf: out_r = 16'hc153;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc153;
              case (mant_lo4)
                4'he: out_r = 16'hc152;
                4'hf: out_r = 16'hc152;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc152;
            end
            3'h3: begin
              out_r = 16'hc151;
              case (mant_lo4)
                4'h0: out_r = 16'hc152;
                4'h1: out_r = 16'hc152;
                4'h2: out_r = 16'hc152;
                4'h3: out_r = 16'hc152;
                4'h4: out_r = 16'hc152;
                4'h5: out_r = 16'hc152;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc151;
            end
            3'h5: begin
              out_r = 16'hc150;
              case (mant_lo4)
                4'h0: out_r = 16'hc151;
                4'h1: out_r = 16'hc151;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc150;
            end
            3'h7: begin
              out_r = 16'hc14f;
              case (mant_lo4)
                4'h0: out_r = 16'hc150;
                4'h1: out_r = 16'hc150;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h054: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc14f;
              case (mant_lo4)
                4'hc: out_r = 16'hc14e;
                4'hd: out_r = 16'hc14e;
                4'he: out_r = 16'hc14e;
                4'hf: out_r = 16'hc14e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc14e;
            end
            3'h2: begin
              out_r = 16'hc14d;
              case (mant_lo4)
                4'h0: out_r = 16'hc14e;
                4'h1: out_r = 16'hc14e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc14d;
              case (mant_lo4)
                4'hb: out_r = 16'hc14c;
                4'hc: out_r = 16'hc14c;
                4'hd: out_r = 16'hc14c;
                4'he: out_r = 16'hc14c;
                4'hf: out_r = 16'hc14c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc14c;
            end
            3'h5: begin
              out_r = 16'hc14c;
              case (mant_lo4)
                4'h8: out_r = 16'hc14b;
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
            3'h6: begin
              out_r = 16'hc14b;
            end
            3'h7: begin
              out_r = 16'hc14b;
              case (mant_lo4)
                4'h9: out_r = 16'hc14a;
                4'ha: out_r = 16'hc14a;
                4'hb: out_r = 16'hc14a;
                4'hc: out_r = 16'hc14a;
                4'hd: out_r = 16'hc14a;
                4'he: out_r = 16'hc14a;
                4'hf: out_r = 16'hc14a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h055: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc14a;
            end
            3'h1: begin
              out_r = 16'hc149;
            end
            3'h2: begin
              out_r = 16'hc148;
              case (mant_lo4)
                4'h0: out_r = 16'hc149;
                4'h1: out_r = 16'hc149;
                4'h2: out_r = 16'hc149;
                4'h3: out_r = 16'hc149;
                4'h4: out_r = 16'hc149;
                4'h5: out_r = 16'hc149;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc148;
            end
            3'h4: begin
              out_r = 16'hc147;
            end
            3'h5: begin
              out_r = 16'hc147;
              case (mant_lo4)
                4'hd: out_r = 16'hc146;
                4'he: out_r = 16'hc146;
                4'hf: out_r = 16'hc146;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc146;
            end
            3'h7: begin
              out_r = 16'hc146;
            end
            default: begin end
          endcase
        end
        9'h056: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc145;
            end
            3'h1: begin
              out_r = 16'hc144;
              case (mant_lo4)
                4'h0: out_r = 16'hc145;
                4'h1: out_r = 16'hc145;
                4'h2: out_r = 16'hc145;
                4'h3: out_r = 16'hc145;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc144;
              case (mant_lo4)
                4'hb: out_r = 16'hc143;
                4'hc: out_r = 16'hc143;
                4'hd: out_r = 16'hc143;
                4'he: out_r = 16'hc143;
                4'hf: out_r = 16'hc143;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc143;
            end
            3'h4: begin
              out_r = 16'hc142;
              case (mant_lo4)
                4'h0: out_r = 16'hc143;
                4'h1: out_r = 16'hc143;
                4'h2: out_r = 16'hc143;
                4'h3: out_r = 16'hc143;
                4'h4: out_r = 16'hc143;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc142;
            end
            3'h6: begin
              out_r = 16'hc141;
              case (mant_lo4)
                4'h0: out_r = 16'hc142;
                4'h1: out_r = 16'hc142;
                4'h2: out_r = 16'hc142;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc141;
            end
            default: begin end
          endcase
        end
        9'h057: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc140;
              case (mant_lo4)
                4'h0: out_r = 16'hc141;
                4'h1: out_r = 16'hc141;
                4'h2: out_r = 16'hc141;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc140;
              case (mant_lo4)
                4'h8: out_r = 16'hc13f;
                4'h9: out_r = 16'hc13f;
                4'ha: out_r = 16'hc13f;
                4'hb: out_r = 16'hc13f;
                4'hc: out_r = 16'hc13f;
                4'hd: out_r = 16'hc13f;
                4'he: out_r = 16'hc13f;
                4'hf: out_r = 16'hc13f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc13f;
              case (mant_lo4)
                4'hf: out_r = 16'hc13e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc13e;
            end
            3'h4: begin
              out_r = 16'hc13e;
              case (mant_lo4)
                4'ha: out_r = 16'hc13d;
                4'hb: out_r = 16'hc13d;
                4'hc: out_r = 16'hc13d;
                4'hd: out_r = 16'hc13d;
                4'he: out_r = 16'hc13d;
                4'hf: out_r = 16'hc13d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc13d;
            end
            3'h6: begin
              out_r = 16'hc13d;
              case (mant_lo4)
                4'h9: out_r = 16'hc13c;
                4'ha: out_r = 16'hc13c;
                4'hb: out_r = 16'hc13c;
                4'hc: out_r = 16'hc13c;
                4'hd: out_r = 16'hc13c;
                4'he: out_r = 16'hc13c;
                4'hf: out_r = 16'hc13c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc13c;
            end
            default: begin end
          endcase
        end
        9'h058: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc13b;
              case (mant_lo4)
                4'h0: out_r = 16'hc13c;
                4'h1: out_r = 16'hc13c;
                4'h2: out_r = 16'hc13c;
                4'h3: out_r = 16'hc13c;
                4'h4: out_r = 16'hc13c;
                4'h5: out_r = 16'hc13c;
                4'h6: out_r = 16'hc13c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc13b;
              case (mant_lo4)
                4'hc: out_r = 16'hc13a;
                4'hd: out_r = 16'hc13a;
                4'he: out_r = 16'hc13a;
                4'hf: out_r = 16'hc13a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc13a;
            end
            3'h3: begin
              out_r = 16'hc139;
              case (mant_lo4)
                4'h0: out_r = 16'hc13a;
                4'h1: out_r = 16'hc13a;
                4'h2: out_r = 16'hc13a;
                4'h3: out_r = 16'hc13a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc139;
            end
            3'h5: begin
              out_r = 16'hc138;
            end
            3'h6: begin
              out_r = 16'hc138;
            end
            3'h7: begin
              out_r = 16'hc137;
            end
            default: begin end
          endcase
        end
        9'h059: begin
          case (mant_hi3)
            3'h0: begin
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
            3'h1: begin
              out_r = 16'hc136;
            end
            3'h2: begin
              out_r = 16'hc135;
            end
            3'h3: begin
              out_r = 16'hc135;
              case (mant_lo4)
                4'h9: out_r = 16'hc134;
                4'ha: out_r = 16'hc134;
                4'hb: out_r = 16'hc134;
                4'hc: out_r = 16'hc134;
                4'hd: out_r = 16'hc134;
                4'he: out_r = 16'hc134;
                4'hf: out_r = 16'hc134;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc134;
            end
            3'h5: begin
              out_r = 16'hc133;
              case (mant_lo4)
                4'h0: out_r = 16'hc134;
                4'h1: out_r = 16'hc134;
                4'h2: out_r = 16'hc134;
                4'h3: out_r = 16'hc134;
                4'h4: out_r = 16'hc134;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc133;
            end
            3'h7: begin
              out_r = 16'hc132;
              case (mant_lo4)
                4'h0: out_r = 16'hc133;
                4'h1: out_r = 16'hc133;
                4'h2: out_r = 16'hc133;
                4'h3: out_r = 16'hc133;
                4'h4: out_r = 16'hc133;
                4'h5: out_r = 16'hc133;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc132;
              case (mant_lo4)
                4'he: out_r = 16'hc131;
                4'hf: out_r = 16'hc131;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc131;
            end
            3'h2: begin
              out_r = 16'hc130;
              case (mant_lo4)
                4'h0: out_r = 16'hc131;
                4'h1: out_r = 16'hc131;
                4'h2: out_r = 16'hc131;
                4'h3: out_r = 16'hc131;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc130;
              case (mant_lo4)
                4'he: out_r = 16'hc12f;
                4'hf: out_r = 16'hc12f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc12f;
            end
            3'h5: begin
              out_r = 16'hc12f;
              case (mant_lo4)
                4'hb: out_r = 16'hc12e;
                4'hc: out_r = 16'hc12e;
                4'hd: out_r = 16'hc12e;
                4'he: out_r = 16'hc12e;
                4'hf: out_r = 16'hc12e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc12e;
            end
            3'h7: begin
              out_r = 16'hc12e;
              case (mant_lo4)
                4'hd: out_r = 16'hc12d;
                4'he: out_r = 16'hc12d;
                4'hf: out_r = 16'hc12d;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc12d;
            end
            3'h1: begin
              out_r = 16'hc12c;
              case (mant_lo4)
                4'h0: out_r = 16'hc12d;
                4'h1: out_r = 16'hc12d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc12c;
              case (mant_lo4)
                4'h9: out_r = 16'hc12b;
                4'ha: out_r = 16'hc12b;
                4'hb: out_r = 16'hc12b;
                4'hc: out_r = 16'hc12b;
                4'hd: out_r = 16'hc12b;
                4'he: out_r = 16'hc12b;
                4'hf: out_r = 16'hc12b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc12b;
            end
            3'h4: begin
              out_r = 16'hc12a;
              case (mant_lo4)
                4'h0: out_r = 16'hc12b;
                4'h1: out_r = 16'hc12b;
                4'h2: out_r = 16'hc12b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc12a;
            end
            3'h6: begin
              out_r = 16'hc129;
              case (mant_lo4)
                4'h0: out_r = 16'hc12a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc129;
            end
            default: begin end
          endcase
        end
        9'h05c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc128;
              case (mant_lo4)
                4'h0: out_r = 16'hc129;
                4'h1: out_r = 16'hc129;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc127;
              case (mant_lo4)
                4'h0: out_r = 16'hc128;
                4'h1: out_r = 16'hc128;
                4'h2: out_r = 16'hc128;
                4'h3: out_r = 16'hc128;
                4'h4: out_r = 16'hc128;
                4'h5: out_r = 16'hc128;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc127;
              case (mant_lo4)
                4'hd: out_r = 16'hc126;
                4'he: out_r = 16'hc126;
                4'hf: out_r = 16'hc126;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc126;
            end
            3'h4: begin
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
            3'h5: begin
              out_r = 16'hc125;
            end
            3'h6: begin
              out_r = 16'hc124;
              case (mant_lo4)
                4'h0: out_r = 16'hc125;
                4'h1: out_r = 16'hc125;
                4'h2: out_r = 16'hc125;
                4'h3: out_r = 16'hc125;
                4'h4: out_r = 16'hc125;
                4'h5: out_r = 16'hc125;
                4'h6: out_r = 16'hc125;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc124;
            end
            default: begin end
          endcase
        end
        9'h05d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc123;
              case (mant_lo4)
                4'h0: out_r = 16'hc124;
                4'h1: out_r = 16'hc124;
                4'h2: out_r = 16'hc124;
                4'h3: out_r = 16'hc124;
                4'h4: out_r = 16'hc124;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc123;
              case (mant_lo4)
                4'ha: out_r = 16'hc122;
                4'hb: out_r = 16'hc122;
                4'hc: out_r = 16'hc122;
                4'hd: out_r = 16'hc122;
                4'he: out_r = 16'hc122;
                4'hf: out_r = 16'hc122;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc122;
            end
            3'h3: begin
              out_r = 16'hc121;
              case (mant_lo4)
                4'h0: out_r = 16'hc122;
                4'h1: out_r = 16'hc122;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc121;
              case (mant_lo4)
                4'hd: out_r = 16'hc120;
                4'he: out_r = 16'hc120;
                4'hf: out_r = 16'hc120;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc120;
            end
            3'h6: begin
              out_r = 16'hc120;
              case (mant_lo4)
                4'hd: out_r = 16'hc11f;
                4'he: out_r = 16'hc11f;
                4'hf: out_r = 16'hc11f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc11f;
            end
            default: begin end
          endcase
        end
        9'h05e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc11f;
              case (mant_lo4)
                4'h9: out_r = 16'hc11e;
                4'ha: out_r = 16'hc11e;
                4'hb: out_r = 16'hc11e;
                4'hc: out_r = 16'hc11e;
                4'hd: out_r = 16'hc11e;
                4'he: out_r = 16'hc11e;
                4'hf: out_r = 16'hc11e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc11e;
              case (mant_lo4)
                4'he: out_r = 16'hc11d;
                4'hf: out_r = 16'hc11d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc11d;
            end
            3'h3: begin
              out_r = 16'hc11c;
              case (mant_lo4)
                4'h0: out_r = 16'hc11d;
                4'h1: out_r = 16'hc11d;
                4'h2: out_r = 16'hc11d;
                4'h3: out_r = 16'hc11d;
                4'h4: out_r = 16'hc11d;
                4'h5: out_r = 16'hc11d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc11c;
            end
            3'h5: begin
              out_r = 16'hc11b;
              case (mant_lo4)
                4'h0: out_r = 16'hc11c;
                4'h1: out_r = 16'hc11c;
                4'h2: out_r = 16'hc11c;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc11b;
            end
            3'h7: begin
              out_r = 16'hc11a;
              case (mant_lo4)
                4'h0: out_r = 16'hc11b;
                4'h1: out_r = 16'hc11b;
                4'h2: out_r = 16'hc11b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h05f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc11a;
              case (mant_lo4)
                4'hd: out_r = 16'hc119;
                4'he: out_r = 16'hc119;
                4'hf: out_r = 16'hc119;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc119;
            end
            3'h2: begin
              out_r = 16'hc118;
              case (mant_lo4)
                4'h0: out_r = 16'hc119;
                4'h1: out_r = 16'hc119;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc118;
              case (mant_lo4)
                4'hb: out_r = 16'hc117;
                4'hc: out_r = 16'hc117;
                4'hd: out_r = 16'hc117;
                4'he: out_r = 16'hc117;
                4'hf: out_r = 16'hc117;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc117;
            end
            3'h5: begin
              out_r = 16'hc117;
              case (mant_lo4)
                4'h8: out_r = 16'hc116;
                4'h9: out_r = 16'hc116;
                4'ha: out_r = 16'hc116;
                4'hb: out_r = 16'hc116;
                4'hc: out_r = 16'hc116;
                4'hd: out_r = 16'hc116;
                4'he: out_r = 16'hc116;
                4'hf: out_r = 16'hc116;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc116;
            end
            3'h7: begin
              out_r = 16'hc116;
              case (mant_lo4)
                4'ha: out_r = 16'hc115;
                4'hb: out_r = 16'hc115;
                4'hc: out_r = 16'hc115;
                4'hd: out_r = 16'hc115;
                4'he: out_r = 16'hc115;
                4'hf: out_r = 16'hc115;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h060: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc115;
            end
            3'h1: begin
              out_r = 16'hc114;
            end
            3'h2: begin
              out_r = 16'hc113;
              case (mant_lo4)
                4'h0: out_r = 16'hc114;
                4'h1: out_r = 16'hc114;
                4'h2: out_r = 16'hc114;
                4'h3: out_r = 16'hc114;
                4'h4: out_r = 16'hc114;
                4'h5: out_r = 16'hc114;
                4'h6: out_r = 16'hc114;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc113;
            end
            3'h4: begin
              out_r = 16'hc112;
            end
            3'h5: begin
              out_r = 16'hc112;
              case (mant_lo4)
                4'he: out_r = 16'hc111;
                4'hf: out_r = 16'hc111;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc111;
            end
            3'h7: begin
              out_r = 16'hc111;
            end
            default: begin end
          endcase
        end
        9'h061: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc110;
            end
            3'h1: begin
              out_r = 16'hc10f;
              case (mant_lo4)
                4'h0: out_r = 16'hc110;
                4'h1: out_r = 16'hc110;
                4'h2: out_r = 16'hc110;
                4'h3: out_r = 16'hc110;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc10f;
              case (mant_lo4)
                4'hb: out_r = 16'hc10e;
                4'hc: out_r = 16'hc10e;
                4'hd: out_r = 16'hc10e;
                4'he: out_r = 16'hc10e;
                4'hf: out_r = 16'hc10e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc10e;
            end
            3'h4: begin
              out_r = 16'hc10d;
              case (mant_lo4)
                4'h0: out_r = 16'hc10e;
                4'h1: out_r = 16'hc10e;
                4'h2: out_r = 16'hc10e;
                4'h3: out_r = 16'hc10e;
                4'h4: out_r = 16'hc10e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc10d;
            end
            3'h6: begin
              out_r = 16'hc10c;
              case (mant_lo4)
                4'h0: out_r = 16'hc10d;
                4'h1: out_r = 16'hc10d;
                4'h2: out_r = 16'hc10d;
                4'h3: out_r = 16'hc10d;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc10c;
            end
            default: begin end
          endcase
        end
        9'h062: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc10b;
              case (mant_lo4)
                4'h0: out_r = 16'hc10c;
                4'h1: out_r = 16'hc10c;
                4'h2: out_r = 16'hc10c;
                4'h3: out_r = 16'hc10c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc10b;
              case (mant_lo4)
                4'h8: out_r = 16'hc10a;
                4'h9: out_r = 16'hc10a;
                4'ha: out_r = 16'hc10a;
                4'hb: out_r = 16'hc10a;
                4'hc: out_r = 16'hc10a;
                4'hd: out_r = 16'hc10a;
                4'he: out_r = 16'hc10a;
                4'hf: out_r = 16'hc10a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc10a;
            end
            3'h3: begin
              out_r = 16'hc109;
            end
            3'h4: begin
              out_r = 16'hc109;
              case (mant_lo4)
                4'hb: out_r = 16'hc108;
                4'hc: out_r = 16'hc108;
                4'hd: out_r = 16'hc108;
                4'he: out_r = 16'hc108;
                4'hf: out_r = 16'hc108;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc108;
            end
            3'h6: begin
              out_r = 16'hc108;
              case (mant_lo4)
                4'ha: out_r = 16'hc107;
                4'hb: out_r = 16'hc107;
                4'hc: out_r = 16'hc107;
                4'hd: out_r = 16'hc107;
                4'he: out_r = 16'hc107;
                4'hf: out_r = 16'hc107;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc107;
            end
            default: begin end
          endcase
        end
        9'h063: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc106;
              case (mant_lo4)
                4'h0: out_r = 16'hc107;
                4'h1: out_r = 16'hc107;
                4'h2: out_r = 16'hc107;
                4'h3: out_r = 16'hc107;
                4'h4: out_r = 16'hc107;
                4'h5: out_r = 16'hc107;
                4'h6: out_r = 16'hc107;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc106;
              case (mant_lo4)
                4'hc: out_r = 16'hc105;
                4'hd: out_r = 16'hc105;
                4'he: out_r = 16'hc105;
                4'hf: out_r = 16'hc105;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc105;
            end
            3'h3: begin
              out_r = 16'hc104;
              case (mant_lo4)
                4'h0: out_r = 16'hc105;
                4'h1: out_r = 16'hc105;
                4'h2: out_r = 16'hc105;
                4'h3: out_r = 16'hc105;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc104;
            end
            3'h5: begin
              out_r = 16'hc103;
            end
            3'h6: begin
              out_r = 16'hc103;
            end
            3'h7: begin
              out_r = 16'hc102;
            end
            default: begin end
          endcase
        end
        9'h064: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc102;
              case (mant_lo4)
                4'hb: out_r = 16'hc101;
                4'hc: out_r = 16'hc101;
                4'hd: out_r = 16'hc101;
                4'he: out_r = 16'hc101;
                4'hf: out_r = 16'hc101;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc101;
            end
            3'h2: begin
              out_r = 16'hc100;
            end
            3'h3: begin
              out_r = 16'hc0ff;
              case (mant_lo4)
                4'h0: out_r = 16'hc100;
                4'h1: out_r = 16'hc100;
                4'h2: out_r = 16'hc100;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0fe;
              case (mant_lo4)
                4'he: out_r = 16'hc0fd;
                4'hf: out_r = 16'hc0fd;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0fd;
              case (mant_lo4)
                4'he: out_r = 16'hc0fc;
                4'hf: out_r = 16'hc0fc;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0fc;
              case (mant_lo4)
                4'he: out_r = 16'hc0fb;
                4'hf: out_r = 16'hc0fb;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0fb;
            end
            default: begin end
          endcase
        end
        9'h065: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0fa;
              case (mant_lo4)
                4'ha: out_r = 16'hc0f9;
                4'hb: out_r = 16'hc0f9;
                4'hc: out_r = 16'hc0f9;
                4'hd: out_r = 16'hc0f9;
                4'he: out_r = 16'hc0f9;
                4'hf: out_r = 16'hc0f9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0f8;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f9;
                4'h1: out_r = 16'hc0f9;
                4'h2: out_r = 16'hc0f9;
                4'h3: out_r = 16'hc0f9;
                4'hf: out_r = 16'hc0f7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0f7;
              case (mant_lo4)
                4'hb: out_r = 16'hc0f6;
                4'hc: out_r = 16'hc0f6;
                4'hd: out_r = 16'hc0f6;
                4'he: out_r = 16'hc0f6;
                4'hf: out_r = 16'hc0f6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0f5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f6;
                4'h1: out_r = 16'hc0f6;
                4'h2: out_r = 16'hc0f6;
                4'h3: out_r = 16'hc0f6;
                4'h4: out_r = 16'hc0f6;
                4'h5: out_r = 16'hc0f6;
                4'h6: out_r = 16'hc0f6;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0f4;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f5;
                4'h1: out_r = 16'hc0f5;
                4'h2: out_r = 16'hc0f5;
                4'h3: out_r = 16'hc0f5;
                4'h4: out_r = 16'hc0f5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0f3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f4;
                4'h1: out_r = 16'hc0f4;
                4'h2: out_r = 16'hc0f4;
                4'h3: out_r = 16'hc0f4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0f2;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f3;
                4'h1: out_r = 16'hc0f3;
                4'h2: out_r = 16'hc0f3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0f1;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f2;
                4'h1: out_r = 16'hc0f2;
                4'h2: out_r = 16'hc0f2;
                4'h3: out_r = 16'hc0f2;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h066: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0f0;
              case (mant_lo4)
                4'h0: out_r = 16'hc0f1;
                4'h1: out_r = 16'hc0f1;
                4'h2: out_r = 16'hc0f1;
                4'h3: out_r = 16'hc0f1;
                4'hd: out_r = 16'hc0ef;
                4'he: out_r = 16'hc0ef;
                4'hf: out_r = 16'hc0ef;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0ef;
              case (mant_lo4)
                4'h8: out_r = 16'hc0ee;
                4'h9: out_r = 16'hc0ee;
                4'ha: out_r = 16'hc0ee;
                4'hb: out_r = 16'hc0ee;
                4'hc: out_r = 16'hc0ee;
                4'hd: out_r = 16'hc0ee;
                4'he: out_r = 16'hc0ee;
                4'hf: out_r = 16'hc0ee;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0ed;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ee;
                4'h1: out_r = 16'hc0ee;
                4'h2: out_r = 16'hc0ee;
                4'hf: out_r = 16'hc0ec;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0ec;
              case (mant_lo4)
                4'hc: out_r = 16'hc0eb;
                4'hd: out_r = 16'hc0eb;
                4'he: out_r = 16'hc0eb;
                4'hf: out_r = 16'hc0eb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0eb;
              case (mant_lo4)
                4'ha: out_r = 16'hc0ea;
                4'hb: out_r = 16'hc0ea;
                4'hc: out_r = 16'hc0ea;
                4'hd: out_r = 16'hc0ea;
                4'he: out_r = 16'hc0ea;
                4'hf: out_r = 16'hc0ea;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0ea;
              case (mant_lo4)
                4'h9: out_r = 16'hc0e9;
                4'ha: out_r = 16'hc0e9;
                4'hb: out_r = 16'hc0e9;
                4'hc: out_r = 16'hc0e9;
                4'hd: out_r = 16'hc0e9;
                4'he: out_r = 16'hc0e9;
                4'hf: out_r = 16'hc0e9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0e9;
              case (mant_lo4)
                4'h9: out_r = 16'hc0e8;
                4'ha: out_r = 16'hc0e8;
                4'hb: out_r = 16'hc0e8;
                4'hc: out_r = 16'hc0e8;
                4'hd: out_r = 16'hc0e8;
                4'he: out_r = 16'hc0e8;
                4'hf: out_r = 16'hc0e8;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0e8;
              case (mant_lo4)
                4'hb: out_r = 16'hc0e7;
                4'hc: out_r = 16'hc0e7;
                4'hd: out_r = 16'hc0e7;
                4'he: out_r = 16'hc0e7;
                4'hf: out_r = 16'hc0e7;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h067: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0e6;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e7;
                4'h1: out_r = 16'hc0e7;
                4'h2: out_r = 16'hc0e7;
                4'h3: out_r = 16'hc0e7;
                4'h4: out_r = 16'hc0e7;
                4'h5: out_r = 16'hc0e7;
                4'h6: out_r = 16'hc0e7;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0e5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e6;
                4'hc: out_r = 16'hc0e4;
                4'hd: out_r = 16'hc0e4;
                4'he: out_r = 16'hc0e4;
                4'hf: out_r = 16'hc0e4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0e3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e4;
                4'h1: out_r = 16'hc0e4;
                4'h2: out_r = 16'hc0e4;
                4'h3: out_r = 16'hc0e4;
                4'h4: out_r = 16'hc0e4;
                4'h5: out_r = 16'hc0e4;
                4'h6: out_r = 16'hc0e4;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0e2;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e3;
                4'h1: out_r = 16'hc0e3;
                4'h2: out_r = 16'hc0e3;
                4'h3: out_r = 16'hc0e3;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0e1;
              case (mant_lo4)
                4'h0: out_r = 16'hc0e2;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0e0;
              case (mant_lo4)
                4'hf: out_r = 16'hc0df;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0df;
            end
            3'h7: begin
              out_r = 16'hc0de;
            end
            default: begin end
          endcase
        end
        9'h068: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0dd;
              case (mant_lo4)
                4'h0: out_r = 16'hc0de;
                4'hb: out_r = 16'hc0dc;
                4'hc: out_r = 16'hc0dc;
                4'hd: out_r = 16'hc0dc;
                4'he: out_r = 16'hc0dc;
                4'hf: out_r = 16'hc0dc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0db;
              case (mant_lo4)
                4'h0: out_r = 16'hc0dc;
                4'h1: out_r = 16'hc0dc;
                4'h2: out_r = 16'hc0dc;
                4'h3: out_r = 16'hc0dc;
                4'h4: out_r = 16'hc0dc;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0da;
              case (mant_lo4)
                4'hc: out_r = 16'hc0d9;
                4'hd: out_r = 16'hc0d9;
                4'he: out_r = 16'hc0d9;
                4'hf: out_r = 16'hc0d9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0d9;
              case (mant_lo4)
                4'h9: out_r = 16'hc0d8;
                4'ha: out_r = 16'hc0d8;
                4'hb: out_r = 16'hc0d8;
                4'hc: out_r = 16'hc0d8;
                4'hd: out_r = 16'hc0d8;
                4'he: out_r = 16'hc0d8;
                4'hf: out_r = 16'hc0d8;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0d7;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d8;
                4'h1: out_r = 16'hc0d8;
                4'h2: out_r = 16'hc0d8;
                4'h3: out_r = 16'hc0d8;
                4'h4: out_r = 16'hc0d8;
                4'h5: out_r = 16'hc0d8;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0d6;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d7;
                4'h1: out_r = 16'hc0d7;
                4'h2: out_r = 16'hc0d7;
                4'h3: out_r = 16'hc0d7;
                4'h4: out_r = 16'hc0d7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0d5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d6;
                4'h1: out_r = 16'hc0d6;
                4'h2: out_r = 16'hc0d6;
                4'h3: out_r = 16'hc0d6;
                4'h4: out_r = 16'hc0d6;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0d4;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d5;
                4'h1: out_r = 16'hc0d5;
                4'h2: out_r = 16'hc0d5;
                4'h3: out_r = 16'hc0d5;
                4'h4: out_r = 16'hc0d5;
                4'h5: out_r = 16'hc0d5;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h069: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0d3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d4;
                4'h1: out_r = 16'hc0d4;
                4'h2: out_r = 16'hc0d4;
                4'h3: out_r = 16'hc0d4;
                4'he: out_r = 16'hc0d2;
                4'hf: out_r = 16'hc0d2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0d2;
              case (mant_lo4)
                4'h9: out_r = 16'hc0d1;
                4'ha: out_r = 16'hc0d1;
                4'hb: out_r = 16'hc0d1;
                4'hc: out_r = 16'hc0d1;
                4'hd: out_r = 16'hc0d1;
                4'he: out_r = 16'hc0d1;
                4'hf: out_r = 16'hc0d1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0d0;
              case (mant_lo4)
                4'h0: out_r = 16'hc0d1;
                4'h1: out_r = 16'hc0d1;
                4'h2: out_r = 16'hc0d1;
                4'h3: out_r = 16'hc0d1;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0cf;
              case (mant_lo4)
                4'he: out_r = 16'hc0ce;
                4'hf: out_r = 16'hc0ce;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0ce;
              case (mant_lo4)
                4'hc: out_r = 16'hc0cd;
                4'hd: out_r = 16'hc0cd;
                4'he: out_r = 16'hc0cd;
                4'hf: out_r = 16'hc0cd;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0cd;
              case (mant_lo4)
                4'hb: out_r = 16'hc0cc;
                4'hc: out_r = 16'hc0cc;
                4'hd: out_r = 16'hc0cc;
                4'he: out_r = 16'hc0cc;
                4'hf: out_r = 16'hc0cc;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0cc;
              case (mant_lo4)
                4'hb: out_r = 16'hc0cb;
                4'hc: out_r = 16'hc0cb;
                4'hd: out_r = 16'hc0cb;
                4'he: out_r = 16'hc0cb;
                4'hf: out_r = 16'hc0cb;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0cb;
              case (mant_lo4)
                4'hd: out_r = 16'hc0ca;
                4'he: out_r = 16'hc0ca;
                4'hf: out_r = 16'hc0ca;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0ca;
              case (mant_lo4)
                4'h8: out_r = 16'hc0c9;
                4'h9: out_r = 16'hc0c9;
                4'ha: out_r = 16'hc0c9;
                4'hb: out_r = 16'hc0c9;
                4'hc: out_r = 16'hc0c9;
                4'hd: out_r = 16'hc0c9;
                4'he: out_r = 16'hc0c9;
                4'hf: out_r = 16'hc0c9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0c8;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c9;
                4'h1: out_r = 16'hc0c9;
                4'hd: out_r = 16'hc0c7;
                4'he: out_r = 16'hc0c7;
                4'hf: out_r = 16'hc0c7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0c7;
              case (mant_lo4)
                4'h9: out_r = 16'hc0c6;
                4'ha: out_r = 16'hc0c6;
                4'hb: out_r = 16'hc0c6;
                4'hc: out_r = 16'hc0c6;
                4'hd: out_r = 16'hc0c6;
                4'he: out_r = 16'hc0c6;
                4'hf: out_r = 16'hc0c6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0c5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c6;
                4'h1: out_r = 16'hc0c6;
                4'h2: out_r = 16'hc0c6;
                4'h3: out_r = 16'hc0c6;
                4'h4: out_r = 16'hc0c6;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0c4;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c5;
                4'h1: out_r = 16'hc0c5;
                4'h2: out_r = 16'hc0c5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0c3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0c2;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0c1;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c2;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0c0;
              case (mant_lo4)
                4'h0: out_r = 16'hc0c1;
                4'h1: out_r = 16'hc0c1;
                4'hc: out_r = 16'hc0bf;
                4'hd: out_r = 16'hc0bf;
                4'he: out_r = 16'hc0bf;
                4'hf: out_r = 16'hc0bf;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0be;
              case (mant_lo4)
                4'h0: out_r = 16'hc0bf;
                4'h1: out_r = 16'hc0bf;
                4'h2: out_r = 16'hc0bf;
                4'h3: out_r = 16'hc0bf;
                4'h4: out_r = 16'hc0bf;
                4'h5: out_r = 16'hc0bf;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0bd;
              case (mant_lo4)
                4'h0: out_r = 16'hc0be;
                4'hd: out_r = 16'hc0bc;
                4'he: out_r = 16'hc0bc;
                4'hf: out_r = 16'hc0bc;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0bc;
              case (mant_lo4)
                4'ha: out_r = 16'hc0bb;
                4'hb: out_r = 16'hc0bb;
                4'hc: out_r = 16'hc0bb;
                4'hd: out_r = 16'hc0bb;
                4'he: out_r = 16'hc0bb;
                4'hf: out_r = 16'hc0bb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0bb;
              case (mant_lo4)
                4'h8: out_r = 16'hc0ba;
                4'h9: out_r = 16'hc0ba;
                4'ha: out_r = 16'hc0ba;
                4'hb: out_r = 16'hc0ba;
                4'hc: out_r = 16'hc0ba;
                4'hd: out_r = 16'hc0ba;
                4'he: out_r = 16'hc0ba;
                4'hf: out_r = 16'hc0ba;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0b9;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ba;
                4'h1: out_r = 16'hc0ba;
                4'h2: out_r = 16'hc0ba;
                4'h3: out_r = 16'hc0ba;
                4'h4: out_r = 16'hc0ba;
                4'h5: out_r = 16'hc0ba;
                4'h6: out_r = 16'hc0ba;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0b8;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b9;
                4'h1: out_r = 16'hc0b9;
                4'h2: out_r = 16'hc0b9;
                4'h3: out_r = 16'hc0b9;
                4'h4: out_r = 16'hc0b9;
                4'h5: out_r = 16'hc0b9;
                4'h6: out_r = 16'hc0b9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0b8;
              case (mant_lo4)
                4'h8: out_r = 16'hc0b7;
                4'h9: out_r = 16'hc0b7;
                4'ha: out_r = 16'hc0b7;
                4'hb: out_r = 16'hc0b7;
                4'hc: out_r = 16'hc0b7;
                4'hd: out_r = 16'hc0b7;
                4'he: out_r = 16'hc0b7;
                4'hf: out_r = 16'hc0b7;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0b6;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b7;
                4'h1: out_r = 16'hc0b7;
                4'h2: out_r = 16'hc0b7;
                4'h3: out_r = 16'hc0b7;
                4'h4: out_r = 16'hc0b7;
                4'hf: out_r = 16'hc0b5;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0b5;
              case (mant_lo4)
                4'ha: out_r = 16'hc0b4;
                4'hb: out_r = 16'hc0b4;
                4'hc: out_r = 16'hc0b4;
                4'hd: out_r = 16'hc0b4;
                4'he: out_r = 16'hc0b4;
                4'hf: out_r = 16'hc0b4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0b3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b4;
                4'h1: out_r = 16'hc0b4;
                4'h2: out_r = 16'hc0b4;
                4'h3: out_r = 16'hc0b4;
                4'h4: out_r = 16'hc0b4;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0b2;
              case (mant_lo4)
                4'h0: out_r = 16'hc0b3;
                4'h1: out_r = 16'hc0b3;
                4'hf: out_r = 16'hc0b1;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0b1;
              case (mant_lo4)
                4'hd: out_r = 16'hc0b0;
                4'he: out_r = 16'hc0b0;
                4'hf: out_r = 16'hc0b0;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0b0;
              case (mant_lo4)
                4'hc: out_r = 16'hc0af;
                4'hd: out_r = 16'hc0af;
                4'he: out_r = 16'hc0af;
                4'hf: out_r = 16'hc0af;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0af;
              case (mant_lo4)
                4'hd: out_r = 16'hc0ae;
                4'he: out_r = 16'hc0ae;
                4'hf: out_r = 16'hc0ae;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0ae;
              case (mant_lo4)
                4'hf: out_r = 16'hc0ad;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0ad;
              case (mant_lo4)
                4'h9: out_r = 16'hc0ac;
                4'ha: out_r = 16'hc0ac;
                4'hb: out_r = 16'hc0ac;
                4'hc: out_r = 16'hc0ac;
                4'hd: out_r = 16'hc0ac;
                4'he: out_r = 16'hc0ac;
                4'hf: out_r = 16'hc0ac;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0ab;
              case (mant_lo4)
                4'h0: out_r = 16'hc0ac;
                4'h1: out_r = 16'hc0ac;
                4'h2: out_r = 16'hc0ac;
                4'he: out_r = 16'hc0aa;
                4'hf: out_r = 16'hc0aa;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0aa;
              case (mant_lo4)
                4'ha: out_r = 16'hc0a9;
                4'hb: out_r = 16'hc0a9;
                4'hc: out_r = 16'hc0a9;
                4'hd: out_r = 16'hc0a9;
                4'he: out_r = 16'hc0a9;
                4'hf: out_r = 16'hc0a9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc0a8;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a9;
                4'h1: out_r = 16'hc0a9;
                4'h2: out_r = 16'hc0a9;
                4'h3: out_r = 16'hc0a9;
                4'h4: out_r = 16'hc0a9;
                4'h5: out_r = 16'hc0a9;
                4'h6: out_r = 16'hc0a9;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc0a7;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a8;
                4'h1: out_r = 16'hc0a8;
                4'h2: out_r = 16'hc0a8;
                4'h3: out_r = 16'hc0a8;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc0a6;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a7;
                4'h1: out_r = 16'hc0a7;
                4'h2: out_r = 16'hc0a7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc0a5;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a6;
                4'h1: out_r = 16'hc0a6;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc0a4;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a5;
                4'h1: out_r = 16'hc0a5;
                4'h2: out_r = 16'hc0a5;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc0a3;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a4;
                4'h1: out_r = 16'hc0a4;
                4'h2: out_r = 16'hc0a4;
                4'hd: out_r = 16'hc0a2;
                4'he: out_r = 16'hc0a2;
                4'hf: out_r = 16'hc0a2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc0a1;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a2;
                4'h1: out_r = 16'hc0a2;
                4'h2: out_r = 16'hc0a2;
                4'h3: out_r = 16'hc0a2;
                4'h4: out_r = 16'hc0a2;
                4'h5: out_r = 16'hc0a2;
                4'h6: out_r = 16'hc0a2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc0a0;
              case (mant_lo4)
                4'h0: out_r = 16'hc0a1;
                4'h1: out_r = 16'hc0a1;
                4'he: out_r = 16'hc09f;
                4'hf: out_r = 16'hc09f;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc09f;
              case (mant_lo4)
                4'hb: out_r = 16'hc09e;
                4'hc: out_r = 16'hc09e;
                4'hd: out_r = 16'hc09e;
                4'he: out_r = 16'hc09e;
                4'hf: out_r = 16'hc09e;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc09e;
              case (mant_lo4)
                4'h9: out_r = 16'hc09d;
                4'ha: out_r = 16'hc09d;
                4'hb: out_r = 16'hc09d;
                4'hc: out_r = 16'hc09d;
                4'hd: out_r = 16'hc09d;
                4'he: out_r = 16'hc09d;
                4'hf: out_r = 16'hc09d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc09d;
              case (mant_lo4)
                4'h8: out_r = 16'hc09c;
                4'h9: out_r = 16'hc09c;
                4'ha: out_r = 16'hc09c;
                4'hb: out_r = 16'hc09c;
                4'hc: out_r = 16'hc09c;
                4'hd: out_r = 16'hc09c;
                4'he: out_r = 16'hc09c;
                4'hf: out_r = 16'hc09c;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc09c;
              case (mant_lo4)
                4'h8: out_r = 16'hc09b;
                4'h9: out_r = 16'hc09b;
                4'ha: out_r = 16'hc09b;
                4'hb: out_r = 16'hc09b;
                4'hc: out_r = 16'hc09b;
                4'hd: out_r = 16'hc09b;
                4'he: out_r = 16'hc09b;
                4'hf: out_r = 16'hc09b;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc09b;
              case (mant_lo4)
                4'ha: out_r = 16'hc09a;
                4'hb: out_r = 16'hc09a;
                4'hc: out_r = 16'hc09a;
                4'hd: out_r = 16'hc09a;
                4'he: out_r = 16'hc09a;
                4'hf: out_r = 16'hc09a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h06f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc099;
              case (mant_lo4)
                4'h0: out_r = 16'hc09a;
                4'h1: out_r = 16'hc09a;
                4'h2: out_r = 16'hc09a;
                4'h3: out_r = 16'hc09a;
                4'h4: out_r = 16'hc09a;
                4'h5: out_r = 16'hc09a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc098;
              case (mant_lo4)
                4'hb: out_r = 16'hc097;
                4'hc: out_r = 16'hc097;
                4'hd: out_r = 16'hc097;
                4'he: out_r = 16'hc097;
                4'hf: out_r = 16'hc097;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc096;
              case (mant_lo4)
                4'h0: out_r = 16'hc097;
                4'h1: out_r = 16'hc097;
                4'h2: out_r = 16'hc097;
                4'h3: out_r = 16'hc097;
                4'h4: out_r = 16'hc097;
                4'h5: out_r = 16'hc097;
                4'h6: out_r = 16'hc097;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc095;
              case (mant_lo4)
                4'h0: out_r = 16'hc096;
                4'h1: out_r = 16'hc096;
                4'h2: out_r = 16'hc096;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc094;
              case (mant_lo4)
                4'hf: out_r = 16'hc093;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc093;
              case (mant_lo4)
                4'he: out_r = 16'hc092;
                4'hf: out_r = 16'hc092;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc092;
              case (mant_lo4)
                4'hf: out_r = 16'hc091;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc091;
            end
            default: begin end
          endcase
        end
        9'h070: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc090;
              case (mant_lo4)
                4'ha: out_r = 16'hc08f;
                4'hb: out_r = 16'hc08f;
                4'hc: out_r = 16'hc08f;
                4'hd: out_r = 16'hc08f;
                4'he: out_r = 16'hc08f;
                4'hf: out_r = 16'hc08f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc08e;
              case (mant_lo4)
                4'h0: out_r = 16'hc08f;
                4'h1: out_r = 16'hc08f;
                4'h2: out_r = 16'hc08f;
                4'h3: out_r = 16'hc08f;
                4'hf: out_r = 16'hc08d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc08d;
              case (mant_lo4)
                4'hb: out_r = 16'hc08c;
                4'hc: out_r = 16'hc08c;
                4'hd: out_r = 16'hc08c;
                4'he: out_r = 16'hc08c;
                4'hf: out_r = 16'hc08c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc08c;
              case (mant_lo4)
                4'h8: out_r = 16'hc08b;
                4'h9: out_r = 16'hc08b;
                4'ha: out_r = 16'hc08b;
                4'hb: out_r = 16'hc08b;
                4'hc: out_r = 16'hc08b;
                4'hd: out_r = 16'hc08b;
                4'he: out_r = 16'hc08b;
                4'hf: out_r = 16'hc08b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc08a;
              case (mant_lo4)
                4'h0: out_r = 16'hc08b;
                4'h1: out_r = 16'hc08b;
                4'h2: out_r = 16'hc08b;
                4'h3: out_r = 16'hc08b;
                4'h4: out_r = 16'hc08b;
                4'h5: out_r = 16'hc08b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc089;
              case (mant_lo4)
                4'h0: out_r = 16'hc08a;
                4'h1: out_r = 16'hc08a;
                4'h2: out_r = 16'hc08a;
                4'h3: out_r = 16'hc08a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc088;
              case (mant_lo4)
                4'h0: out_r = 16'hc089;
                4'h1: out_r = 16'hc089;
                4'h2: out_r = 16'hc089;
                4'h3: out_r = 16'hc089;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc087;
              case (mant_lo4)
                4'h0: out_r = 16'hc088;
                4'h1: out_r = 16'hc088;
                4'h2: out_r = 16'hc088;
                4'h3: out_r = 16'hc088;
                4'h4: out_r = 16'hc088;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h071: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc086;
              case (mant_lo4)
                4'h0: out_r = 16'hc087;
                4'h1: out_r = 16'hc087;
                4'h2: out_r = 16'hc087;
                4'h3: out_r = 16'hc087;
                4'he: out_r = 16'hc085;
                4'hf: out_r = 16'hc085;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc085;
              case (mant_lo4)
                4'h8: out_r = 16'hc084;
                4'h9: out_r = 16'hc084;
                4'ha: out_r = 16'hc084;
                4'hb: out_r = 16'hc084;
                4'hc: out_r = 16'hc084;
                4'hd: out_r = 16'hc084;
                4'he: out_r = 16'hc084;
                4'hf: out_r = 16'hc084;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc083;
              case (mant_lo4)
                4'h0: out_r = 16'hc084;
                4'h1: out_r = 16'hc084;
                4'h2: out_r = 16'hc084;
                4'h3: out_r = 16'hc084;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc082;
              case (mant_lo4)
                4'hd: out_r = 16'hc081;
                4'he: out_r = 16'hc081;
                4'hf: out_r = 16'hc081;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc081;
              case (mant_lo4)
                4'hb: out_r = 16'hc080;
                4'hc: out_r = 16'hc080;
                4'hd: out_r = 16'hc080;
                4'he: out_r = 16'hc080;
                4'hf: out_r = 16'hc080;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc07f;
              case (mant_lo4)
                4'h0: out_r = 16'hc080;
                4'h1: out_r = 16'hc080;
                4'h2: out_r = 16'hc080;
                4'h3: out_r = 16'hc080;
                4'h4: out_r = 16'hc080;
                4'h5: out_r = 16'hc080;
                4'he: out_r = 16'hc07e;
                4'hf: out_r = 16'hc07e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc07d;
              case (mant_lo4)
                4'h0: out_r = 16'hc07e;
                4'h1: out_r = 16'hc07e;
                4'h2: out_r = 16'hc07e;
                4'h3: out_r = 16'hc07e;
                4'h4: out_r = 16'hc07e;
                4'h5: out_r = 16'hc07e;
                4'he: out_r = 16'hc07c;
                4'hf: out_r = 16'hc07c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc07b;
              case (mant_lo4)
                4'h0: out_r = 16'hc07c;
                4'h1: out_r = 16'hc07c;
                4'h2: out_r = 16'hc07c;
                4'h3: out_r = 16'hc07c;
                4'h4: out_r = 16'hc07c;
                4'h5: out_r = 16'hc07c;
                4'h6: out_r = 16'hc07c;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h072: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc07a;
              case (mant_lo4)
                4'h5: out_r = 16'hc079;
                4'h6: out_r = 16'hc079;
                4'h7: out_r = 16'hc079;
                4'h8: out_r = 16'hc079;
                4'h9: out_r = 16'hc079;
                4'ha: out_r = 16'hc078;
                4'hb: out_r = 16'hc078;
                4'hc: out_r = 16'hc078;
                4'hd: out_r = 16'hc078;
                4'he: out_r = 16'hc078;
                4'hf: out_r = 16'hc077;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc075;
              case (mant_lo4)
                4'h0: out_r = 16'hc077;
                4'h1: out_r = 16'hc077;
                4'h2: out_r = 16'hc077;
                4'h3: out_r = 16'hc077;
                4'h4: out_r = 16'hc076;
                4'h5: out_r = 16'hc076;
                4'h6: out_r = 16'hc076;
                4'h7: out_r = 16'hc076;
                4'h8: out_r = 16'hc076;
                4'hf: out_r = 16'hc074;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc073;
              case (mant_lo4)
                4'h0: out_r = 16'hc074;
                4'h1: out_r = 16'hc074;
                4'h2: out_r = 16'hc074;
                4'h3: out_r = 16'hc074;
                4'h4: out_r = 16'hc074;
                4'hb: out_r = 16'hc072;
                4'hc: out_r = 16'hc072;
                4'hd: out_r = 16'hc072;
                4'he: out_r = 16'hc072;
                4'hf: out_r = 16'hc072;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc071;
              case (mant_lo4)
                4'h0: out_r = 16'hc072;
                4'h8: out_r = 16'hc070;
                4'h9: out_r = 16'hc070;
                4'ha: out_r = 16'hc070;
                4'hb: out_r = 16'hc070;
                4'hc: out_r = 16'hc070;
                4'hd: out_r = 16'hc070;
                4'he: out_r = 16'hc06f;
                4'hf: out_r = 16'hc06f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc06e;
              case (mant_lo4)
                4'h0: out_r = 16'hc06f;
                4'h1: out_r = 16'hc06f;
                4'h2: out_r = 16'hc06f;
                4'h3: out_r = 16'hc06f;
                4'h4: out_r = 16'hc06f;
                4'hd: out_r = 16'hc06d;
                4'he: out_r = 16'hc06d;
                4'hf: out_r = 16'hc06d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc06c;
              case (mant_lo4)
                4'h0: out_r = 16'hc06d;
                4'h1: out_r = 16'hc06d;
                4'h2: out_r = 16'hc06d;
                4'h3: out_r = 16'hc06d;
                4'hc: out_r = 16'hc06b;
                4'hd: out_r = 16'hc06b;
                4'he: out_r = 16'hc06b;
                4'hf: out_r = 16'hc06b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc06a;
              case (mant_lo4)
                4'h0: out_r = 16'hc06b;
                4'h1: out_r = 16'hc06b;
                4'h2: out_r = 16'hc06b;
                4'h3: out_r = 16'hc06b;
                4'hc: out_r = 16'hc069;
                4'hd: out_r = 16'hc069;
                4'he: out_r = 16'hc069;
                4'hf: out_r = 16'hc069;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc068;
              case (mant_lo4)
                4'h0: out_r = 16'hc069;
                4'h1: out_r = 16'hc069;
                4'h2: out_r = 16'hc069;
                4'h3: out_r = 16'hc069;
                4'h4: out_r = 16'hc069;
                4'he: out_r = 16'hc067;
                4'hf: out_r = 16'hc067;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h073: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc066;
              case (mant_lo4)
                4'h0: out_r = 16'hc067;
                4'h1: out_r = 16'hc067;
                4'h2: out_r = 16'hc067;
                4'h3: out_r = 16'hc067;
                4'h9: out_r = 16'hc065;
                4'ha: out_r = 16'hc065;
                4'hb: out_r = 16'hc065;
                4'hc: out_r = 16'hc065;
                4'hd: out_r = 16'hc065;
                4'he: out_r = 16'hc064;
                4'hf: out_r = 16'hc064;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc062;
              case (mant_lo4)
                4'h0: out_r = 16'hc064;
                4'h1: out_r = 16'hc064;
                4'h2: out_r = 16'hc064;
                4'h3: out_r = 16'hc063;
                4'h4: out_r = 16'hc063;
                4'h5: out_r = 16'hc063;
                4'h6: out_r = 16'hc063;
                4'h7: out_r = 16'hc063;
                4'he: out_r = 16'hc061;
                4'hf: out_r = 16'hc061;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc060;
              case (mant_lo4)
                4'h0: out_r = 16'hc061;
                4'h1: out_r = 16'hc061;
                4'h2: out_r = 16'hc061;
                4'h9: out_r = 16'hc05f;
                4'ha: out_r = 16'hc05f;
                4'hb: out_r = 16'hc05f;
                4'hc: out_r = 16'hc05f;
                4'hd: out_r = 16'hc05f;
                4'he: out_r = 16'hc05f;
                4'hf: out_r = 16'hc05e;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc05d;
              case (mant_lo4)
                4'h0: out_r = 16'hc05e;
                4'h1: out_r = 16'hc05e;
                4'h2: out_r = 16'hc05e;
                4'h3: out_r = 16'hc05e;
                4'h4: out_r = 16'hc05e;
                4'h5: out_r = 16'hc05e;
                4'hd: out_r = 16'hc05c;
                4'he: out_r = 16'hc05c;
                4'hf: out_r = 16'hc05c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc05b;
              case (mant_lo4)
                4'h0: out_r = 16'hc05c;
                4'h1: out_r = 16'hc05c;
                4'h2: out_r = 16'hc05c;
                4'hb: out_r = 16'hc05a;
                4'hc: out_r = 16'hc05a;
                4'hd: out_r = 16'hc05a;
                4'he: out_r = 16'hc05a;
                4'hf: out_r = 16'hc05a;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc059;
              case (mant_lo4)
                4'h0: out_r = 16'hc05a;
                4'h1: out_r = 16'hc05a;
                4'ha: out_r = 16'hc058;
                4'hb: out_r = 16'hc058;
                4'hc: out_r = 16'hc058;
                4'hd: out_r = 16'hc058;
                4'he: out_r = 16'hc058;
                4'hf: out_r = 16'hc058;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc057;
              case (mant_lo4)
                4'h0: out_r = 16'hc058;
                4'h1: out_r = 16'hc058;
                4'ha: out_r = 16'hc056;
                4'hb: out_r = 16'hc056;
                4'hc: out_r = 16'hc056;
                4'hd: out_r = 16'hc056;
                4'he: out_r = 16'hc056;
                4'hf: out_r = 16'hc056;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc055;
              case (mant_lo4)
                4'h0: out_r = 16'hc056;
                4'h1: out_r = 16'hc056;
                4'hb: out_r = 16'hc054;
                4'hc: out_r = 16'hc054;
                4'hd: out_r = 16'hc054;
                4'he: out_r = 16'hc054;
                4'hf: out_r = 16'hc054;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h074: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc053;
              case (mant_lo4)
                4'h0: out_r = 16'hc054;
                4'h1: out_r = 16'hc054;
                4'h7: out_r = 16'hc052;
                4'h8: out_r = 16'hc052;
                4'h9: out_r = 16'hc052;
                4'ha: out_r = 16'hc052;
                4'hb: out_r = 16'hc052;
                4'hc: out_r = 16'hc051;
                4'hd: out_r = 16'hc051;
                4'he: out_r = 16'hc051;
                4'hf: out_r = 16'hc051;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc050;
              case (mant_lo4)
                4'h0: out_r = 16'hc051;
                4'h7: out_r = 16'hc04f;
                4'h8: out_r = 16'hc04f;
                4'h9: out_r = 16'hc04f;
                4'ha: out_r = 16'hc04f;
                4'hb: out_r = 16'hc04f;
                4'hc: out_r = 16'hc04e;
                4'hd: out_r = 16'hc04e;
                4'he: out_r = 16'hc04e;
                4'hf: out_r = 16'hc04e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc04d;
              case (mant_lo4)
                4'h0: out_r = 16'hc04e;
                4'h1: out_r = 16'hc04e;
                4'h8: out_r = 16'hc04c;
                4'h9: out_r = 16'hc04c;
                4'ha: out_r = 16'hc04c;
                4'hb: out_r = 16'hc04c;
                4'hc: out_r = 16'hc04c;
                4'hd: out_r = 16'hc04c;
                4'he: out_r = 16'hc04b;
                4'hf: out_r = 16'hc04b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc04a;
              case (mant_lo4)
                4'h0: out_r = 16'hc04b;
                4'h1: out_r = 16'hc04b;
                4'h2: out_r = 16'hc04b;
                4'h3: out_r = 16'hc04b;
                4'hb: out_r = 16'hc049;
                4'hc: out_r = 16'hc049;
                4'hd: out_r = 16'hc049;
                4'he: out_r = 16'hc049;
                4'hf: out_r = 16'hc049;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc048;
              case (mant_lo4)
                4'h0: out_r = 16'hc049;
                4'h1: out_r = 16'hc049;
                4'h9: out_r = 16'hc047;
                4'ha: out_r = 16'hc047;
                4'hb: out_r = 16'hc047;
                4'hc: out_r = 16'hc047;
                4'hd: out_r = 16'hc047;
                4'he: out_r = 16'hc047;
                4'hf: out_r = 16'hc047;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc046;
              case (mant_lo4)
                4'h8: out_r = 16'hc045;
                4'h9: out_r = 16'hc045;
                4'ha: out_r = 16'hc045;
                4'hb: out_r = 16'hc045;
                4'hc: out_r = 16'hc045;
                4'hd: out_r = 16'hc045;
                4'he: out_r = 16'hc045;
                4'hf: out_r = 16'hc044;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc044;
              case (mant_lo4)
                4'h8: out_r = 16'hc043;
                4'h9: out_r = 16'hc043;
                4'ha: out_r = 16'hc043;
                4'hb: out_r = 16'hc043;
                4'hc: out_r = 16'hc043;
                4'hd: out_r = 16'hc043;
                4'he: out_r = 16'hc043;
                4'hf: out_r = 16'hc043;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc042;
              case (mant_lo4)
                4'h9: out_r = 16'hc041;
                4'ha: out_r = 16'hc041;
                4'hb: out_r = 16'hc041;
                4'hc: out_r = 16'hc041;
                4'hd: out_r = 16'hc041;
                4'he: out_r = 16'hc041;
                4'hf: out_r = 16'hc041;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h075: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc040;
              case (mant_lo4)
                4'h0: out_r = 16'hc041;
                4'h6: out_r = 16'hc03f;
                4'h7: out_r = 16'hc03f;
                4'h8: out_r = 16'hc03f;
                4'h9: out_r = 16'hc03f;
                4'ha: out_r = 16'hc03f;
                4'hb: out_r = 16'hc03e;
                4'hc: out_r = 16'hc03e;
                4'hd: out_r = 16'hc03e;
                4'he: out_r = 16'hc03e;
                4'hf: out_r = 16'hc03e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc03c;
              case (mant_lo4)
                4'h0: out_r = 16'hc03d;
                4'h1: out_r = 16'hc03d;
                4'h2: out_r = 16'hc03d;
                4'h3: out_r = 16'hc03d;
                4'h4: out_r = 16'hc03d;
                4'hb: out_r = 16'hc03b;
                4'hc: out_r = 16'hc03b;
                4'hd: out_r = 16'hc03b;
                4'he: out_r = 16'hc03b;
                4'hf: out_r = 16'hc03b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc03a;
              case (mant_lo4)
                4'h6: out_r = 16'hc039;
                4'h7: out_r = 16'hc039;
                4'h8: out_r = 16'hc039;
                4'h9: out_r = 16'hc039;
                4'ha: out_r = 16'hc039;
                4'hb: out_r = 16'hc039;
                4'hc: out_r = 16'hc038;
                4'hd: out_r = 16'hc038;
                4'he: out_r = 16'hc038;
                4'hf: out_r = 16'hc038;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc037;
              case (mant_lo4)
                4'h0: out_r = 16'hc038;
                4'h1: out_r = 16'hc038;
                4'h9: out_r = 16'hc036;
                4'ha: out_r = 16'hc036;
                4'hb: out_r = 16'hc036;
                4'hc: out_r = 16'hc036;
                4'hd: out_r = 16'hc036;
                4'he: out_r = 16'hc036;
                4'hf: out_r = 16'hc036;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc035;
              case (mant_lo4)
                4'h7: out_r = 16'hc034;
                4'h8: out_r = 16'hc034;
                4'h9: out_r = 16'hc034;
                4'ha: out_r = 16'hc034;
                4'hb: out_r = 16'hc034;
                4'hc: out_r = 16'hc034;
                4'hd: out_r = 16'hc034;
                4'he: out_r = 16'hc033;
                4'hf: out_r = 16'hc033;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc032;
              case (mant_lo4)
                4'h0: out_r = 16'hc033;
                4'h1: out_r = 16'hc033;
                4'h2: out_r = 16'hc033;
                4'h3: out_r = 16'hc033;
                4'h4: out_r = 16'hc033;
                4'h5: out_r = 16'hc033;
                4'hd: out_r = 16'hc031;
                4'he: out_r = 16'hc031;
                4'hf: out_r = 16'hc031;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc030;
              case (mant_lo4)
                4'h0: out_r = 16'hc031;
                4'h1: out_r = 16'hc031;
                4'h2: out_r = 16'hc031;
                4'h3: out_r = 16'hc031;
                4'h4: out_r = 16'hc031;
                4'he: out_r = 16'hc02f;
                4'hf: out_r = 16'hc02f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc02e;
              case (mant_lo4)
                4'h0: out_r = 16'hc02f;
                4'h1: out_r = 16'hc02f;
                4'h2: out_r = 16'hc02f;
                4'h3: out_r = 16'hc02f;
                4'h4: out_r = 16'hc02f;
                4'h5: out_r = 16'hc02f;
                4'h6: out_r = 16'hc02f;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h076: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc02d;
              case (mant_lo4)
                4'h5: out_r = 16'hc02c;
                4'h6: out_r = 16'hc02c;
                4'h7: out_r = 16'hc02c;
                4'h8: out_r = 16'hc02c;
                4'h9: out_r = 16'hc02c;
                4'ha: out_r = 16'hc02b;
                4'hb: out_r = 16'hc02b;
                4'hc: out_r = 16'hc02b;
                4'hd: out_r = 16'hc02b;
                4'he: out_r = 16'hc02b;
                4'hf: out_r = 16'hc02a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc028;
              case (mant_lo4)
                4'h0: out_r = 16'hc02a;
                4'h1: out_r = 16'hc02a;
                4'h2: out_r = 16'hc02a;
                4'h3: out_r = 16'hc02a;
                4'h4: out_r = 16'hc029;
                4'h5: out_r = 16'hc029;
                4'h6: out_r = 16'hc029;
                4'h7: out_r = 16'hc029;
                4'h8: out_r = 16'hc029;
                4'hf: out_r = 16'hc027;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc026;
              case (mant_lo4)
                4'h0: out_r = 16'hc027;
                4'h1: out_r = 16'hc027;
                4'h2: out_r = 16'hc027;
                4'h3: out_r = 16'hc027;
                4'h4: out_r = 16'hc027;
                4'hb: out_r = 16'hc025;
                4'hc: out_r = 16'hc025;
                4'hd: out_r = 16'hc025;
                4'he: out_r = 16'hc025;
                4'hf: out_r = 16'hc025;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc023;
              case (mant_lo4)
                4'h0: out_r = 16'hc025;
                4'h1: out_r = 16'hc024;
                4'h2: out_r = 16'hc024;
                4'h3: out_r = 16'hc024;
                4'h4: out_r = 16'hc024;
                4'h5: out_r = 16'hc024;
                4'h6: out_r = 16'hc024;
                4'he: out_r = 16'hc022;
                4'hf: out_r = 16'hc022;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc021;
              case (mant_lo4)
                4'h0: out_r = 16'hc022;
                4'h1: out_r = 16'hc022;
                4'h2: out_r = 16'hc022;
                4'h3: out_r = 16'hc022;
                4'h4: out_r = 16'hc022;
                4'hc: out_r = 16'hc020;
                4'hd: out_r = 16'hc020;
                4'he: out_r = 16'hc020;
                4'hf: out_r = 16'hc020;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc01f;
              case (mant_lo4)
                4'h0: out_r = 16'hc020;
                4'h1: out_r = 16'hc020;
                4'h2: out_r = 16'hc020;
                4'h3: out_r = 16'hc020;
                4'hb: out_r = 16'hc01e;
                4'hc: out_r = 16'hc01e;
                4'hd: out_r = 16'hc01e;
                4'he: out_r = 16'hc01e;
                4'hf: out_r = 16'hc01e;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc01d;
              case (mant_lo4)
                4'h0: out_r = 16'hc01e;
                4'h1: out_r = 16'hc01e;
                4'h2: out_r = 16'hc01e;
                4'hc: out_r = 16'hc01c;
                4'hd: out_r = 16'hc01c;
                4'he: out_r = 16'hc01c;
                4'hf: out_r = 16'hc01c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc01b;
              case (mant_lo4)
                4'h0: out_r = 16'hc01c;
                4'h1: out_r = 16'hc01c;
                4'h2: out_r = 16'hc01c;
                4'h3: out_r = 16'hc01c;
                4'hd: out_r = 16'hc01a;
                4'he: out_r = 16'hc01a;
                4'hf: out_r = 16'hc01a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h077: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc019;
              case (mant_lo4)
                4'h0: out_r = 16'hc01a;
                4'h1: out_r = 16'hc01a;
                4'h2: out_r = 16'hc01a;
                4'h8: out_r = 16'hc018;
                4'h9: out_r = 16'hc018;
                4'ha: out_r = 16'hc018;
                4'hb: out_r = 16'hc018;
                4'hc: out_r = 16'hc018;
                4'hd: out_r = 16'hc017;
                4'he: out_r = 16'hc017;
                4'hf: out_r = 16'hc017;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc016;
              case (mant_lo4)
                4'h0: out_r = 16'hc017;
                4'h1: out_r = 16'hc017;
                4'h8: out_r = 16'hc015;
                4'h9: out_r = 16'hc015;
                4'ha: out_r = 16'hc015;
                4'hb: out_r = 16'hc015;
                4'hc: out_r = 16'hc015;
                4'hd: out_r = 16'hc014;
                4'he: out_r = 16'hc014;
                4'hf: out_r = 16'hc014;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc013;
              case (mant_lo4)
                4'h0: out_r = 16'hc014;
                4'h1: out_r = 16'hc014;
                4'h2: out_r = 16'hc014;
                4'h9: out_r = 16'hc012;
                4'ha: out_r = 16'hc012;
                4'hb: out_r = 16'hc012;
                4'hc: out_r = 16'hc012;
                4'hd: out_r = 16'hc012;
                4'he: out_r = 16'hc012;
                4'hf: out_r = 16'hc011;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hc010;
              case (mant_lo4)
                4'h0: out_r = 16'hc011;
                4'h1: out_r = 16'hc011;
                4'h2: out_r = 16'hc011;
                4'h3: out_r = 16'hc011;
                4'h4: out_r = 16'hc011;
                4'hc: out_r = 16'hc00f;
                4'hd: out_r = 16'hc00f;
                4'he: out_r = 16'hc00f;
                4'hf: out_r = 16'hc00f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hc00e;
              case (mant_lo4)
                4'h0: out_r = 16'hc00f;
                4'h1: out_r = 16'hc00f;
                4'h2: out_r = 16'hc00f;
                4'ha: out_r = 16'hc00d;
                4'hb: out_r = 16'hc00d;
                4'hc: out_r = 16'hc00d;
                4'hd: out_r = 16'hc00d;
                4'he: out_r = 16'hc00d;
                4'hf: out_r = 16'hc00d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hc00c;
              case (mant_lo4)
                4'h0: out_r = 16'hc00d;
                4'h9: out_r = 16'hc00b;
                4'ha: out_r = 16'hc00b;
                4'hb: out_r = 16'hc00b;
                4'hc: out_r = 16'hc00b;
                4'hd: out_r = 16'hc00b;
                4'he: out_r = 16'hc00b;
                4'hf: out_r = 16'hc00b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hc00a;
              case (mant_lo4)
                4'h0: out_r = 16'hc00b;
                4'h9: out_r = 16'hc009;
                4'ha: out_r = 16'hc009;
                4'hb: out_r = 16'hc009;
                4'hc: out_r = 16'hc009;
                4'hd: out_r = 16'hc009;
                4'he: out_r = 16'hc009;
                4'hf: out_r = 16'hc009;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hc008;
              case (mant_lo4)
                4'h0: out_r = 16'hc009;
                4'h1: out_r = 16'hc009;
                4'hb: out_r = 16'hc007;
                4'hc: out_r = 16'hc007;
                4'hd: out_r = 16'hc007;
                4'he: out_r = 16'hc007;
                4'hf: out_r = 16'hc007;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h078: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hc006;
              case (mant_lo4)
                4'h0: out_r = 16'hc007;
                4'h1: out_r = 16'hc007;
                4'h7: out_r = 16'hc005;
                4'h8: out_r = 16'hc005;
                4'h9: out_r = 16'hc005;
                4'ha: out_r = 16'hc005;
                4'hb: out_r = 16'hc005;
                4'hc: out_r = 16'hc004;
                4'hd: out_r = 16'hc004;
                4'he: out_r = 16'hc004;
                4'hf: out_r = 16'hc004;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hc002;
              case (mant_lo4)
                4'h0: out_r = 16'hc004;
                4'h1: out_r = 16'hc003;
                4'h2: out_r = 16'hc003;
                4'h3: out_r = 16'hc003;
                4'h4: out_r = 16'hc003;
                4'h5: out_r = 16'hc003;
                4'hc: out_r = 16'hc001;
                4'hd: out_r = 16'hc001;
                4'he: out_r = 16'hc001;
                4'hf: out_r = 16'hc001;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hc000;
              case (mant_lo4)
                4'h0: out_r = 16'hc001;
                4'h6: out_r = 16'hbfff;
                4'h7: out_r = 16'hbfff;
                4'h8: out_r = 16'hbfff;
                4'h9: out_r = 16'hbffe;
                4'ha: out_r = 16'hbffe;
                4'hb: out_r = 16'hbffe;
                4'hc: out_r = 16'hbffd;
                4'hd: out_r = 16'hbffd;
                4'he: out_r = 16'hbffd;
                4'hf: out_r = 16'hbffc;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbffa;
              case (mant_lo4)
                4'h0: out_r = 16'hbffc;
                4'h1: out_r = 16'hbffc;
                4'h2: out_r = 16'hbffb;
                4'h3: out_r = 16'hbffb;
                4'h4: out_r = 16'hbffb;
                4'h9: out_r = 16'hbff9;
                4'ha: out_r = 16'hbff9;
                4'hb: out_r = 16'hbff9;
                4'hc: out_r = 16'hbff8;
                4'hd: out_r = 16'hbff8;
                4'he: out_r = 16'hbff8;
                4'hf: out_r = 16'hbff7;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbff5;
              case (mant_lo4)
                4'h0: out_r = 16'hbff7;
                4'h1: out_r = 16'hbff7;
                4'h2: out_r = 16'hbff7;
                4'h3: out_r = 16'hbff6;
                4'h4: out_r = 16'hbff6;
                4'h5: out_r = 16'hbff6;
                4'ha: out_r = 16'hbff4;
                4'hb: out_r = 16'hbff4;
                4'hc: out_r = 16'hbff4;
                4'hd: out_r = 16'hbff4;
                4'he: out_r = 16'hbff3;
                4'hf: out_r = 16'hbff3;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbff2;
              case (mant_lo4)
                4'h0: out_r = 16'hbff3;
                4'h5: out_r = 16'hbff1;
                4'h6: out_r = 16'hbff1;
                4'h7: out_r = 16'hbff1;
                4'h8: out_r = 16'hbff1;
                4'h9: out_r = 16'hbff0;
                4'ha: out_r = 16'hbff0;
                4'hb: out_r = 16'hbff0;
                4'hc: out_r = 16'hbff0;
                4'hd: out_r = 16'hbfef;
                4'he: out_r = 16'hbfef;
                4'hf: out_r = 16'hbfef;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbfee;
              case (mant_lo4)
                4'h0: out_r = 16'hbfef;
                4'h5: out_r = 16'hbfed;
                4'h6: out_r = 16'hbfed;
                4'h7: out_r = 16'hbfed;
                4'h8: out_r = 16'hbfed;
                4'h9: out_r = 16'hbfec;
                4'ha: out_r = 16'hbfec;
                4'hb: out_r = 16'hbfec;
                4'hc: out_r = 16'hbfec;
                4'hd: out_r = 16'hbfeb;
                4'he: out_r = 16'hbfeb;
                4'hf: out_r = 16'hbfeb;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbfe9;
              case (mant_lo4)
                4'h0: out_r = 16'hbfeb;
                4'h1: out_r = 16'hbfeb;
                4'h2: out_r = 16'hbfea;
                4'h3: out_r = 16'hbfea;
                4'h4: out_r = 16'hbfea;
                4'h5: out_r = 16'hbfea;
                4'hb: out_r = 16'hbfe8;
                4'hc: out_r = 16'hbfe8;
                4'hd: out_r = 16'hbfe8;
                4'he: out_r = 16'hbfe8;
                4'hf: out_r = 16'hbfe7;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h079: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbfe5;
              case (mant_lo4)
                4'h0: out_r = 16'hbfe7;
                4'h1: out_r = 16'hbfe7;
                4'h2: out_r = 16'hbfe6;
                4'h3: out_r = 16'hbfe6;
                4'h7: out_r = 16'hbfe4;
                4'h8: out_r = 16'hbfe4;
                4'h9: out_r = 16'hbfe3;
                4'ha: out_r = 16'hbfe3;
                4'hb: out_r = 16'hbfe3;
                4'hc: out_r = 16'hbfe2;
                4'hd: out_r = 16'hbfe2;
                4'he: out_r = 16'hbfe1;
                4'hf: out_r = 16'hbfe1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbfdf;
              case (mant_lo4)
                4'h0: out_r = 16'hbfe1;
                4'h1: out_r = 16'hbfe0;
                4'h2: out_r = 16'hbfe0;
                4'h6: out_r = 16'hbfde;
                4'h7: out_r = 16'hbfde;
                4'h8: out_r = 16'hbfde;
                4'h9: out_r = 16'hbfdd;
                4'ha: out_r = 16'hbfdd;
                4'hb: out_r = 16'hbfdd;
                4'hc: out_r = 16'hbfdc;
                4'hd: out_r = 16'hbfdc;
                4'he: out_r = 16'hbfdb;
                4'hf: out_r = 16'hbfdb;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbfda;
              case (mant_lo4)
                4'h0: out_r = 16'hbfdb;
                4'h4: out_r = 16'hbfd9;
                4'h5: out_r = 16'hbfd9;
                4'h6: out_r = 16'hbfd9;
                4'h7: out_r = 16'hbfd8;
                4'h8: out_r = 16'hbfd8;
                4'h9: out_r = 16'hbfd8;
                4'ha: out_r = 16'hbfd7;
                4'hb: out_r = 16'hbfd7;
                4'hc: out_r = 16'hbfd7;
                4'hd: out_r = 16'hbfd6;
                4'he: out_r = 16'hbfd6;
                4'hf: out_r = 16'hbfd6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbfd5;
              case (mant_lo4)
                4'h4: out_r = 16'hbfd4;
                4'h5: out_r = 16'hbfd4;
                4'h6: out_r = 16'hbfd4;
                4'h7: out_r = 16'hbfd3;
                4'h8: out_r = 16'hbfd3;
                4'h9: out_r = 16'hbfd3;
                4'ha: out_r = 16'hbfd2;
                4'hb: out_r = 16'hbfd2;
                4'hc: out_r = 16'hbfd2;
                4'hd: out_r = 16'hbfd2;
                4'he: out_r = 16'hbfd1;
                4'hf: out_r = 16'hbfd1;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbfd0;
              case (mant_lo4)
                4'h0: out_r = 16'hbfd1;
                4'h5: out_r = 16'hbfcf;
                4'h6: out_r = 16'hbfcf;
                4'h7: out_r = 16'hbfcf;
                4'h8: out_r = 16'hbfce;
                4'h9: out_r = 16'hbfce;
                4'ha: out_r = 16'hbfce;
                4'hb: out_r = 16'hbfce;
                4'hc: out_r = 16'hbfcd;
                4'hd: out_r = 16'hbfcd;
                4'he: out_r = 16'hbfcd;
                4'hf: out_r = 16'hbfcc;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbfcb;
              case (mant_lo4)
                4'h0: out_r = 16'hbfcc;
                4'h1: out_r = 16'hbfcc;
                4'h2: out_r = 16'hbfcc;
                4'h7: out_r = 16'hbfca;
                4'h8: out_r = 16'hbfca;
                4'h9: out_r = 16'hbfca;
                4'ha: out_r = 16'hbfca;
                4'hb: out_r = 16'hbfc9;
                4'hc: out_r = 16'hbfc9;
                4'hd: out_r = 16'hbfc9;
                4'he: out_r = 16'hbfc9;
                4'hf: out_r = 16'hbfc8;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbfc7;
              case (mant_lo4)
                4'h0: out_r = 16'hbfc8;
                4'h1: out_r = 16'hbfc8;
                4'h2: out_r = 16'hbfc8;
                4'h7: out_r = 16'hbfc6;
                4'h8: out_r = 16'hbfc6;
                4'h9: out_r = 16'hbfc6;
                4'ha: out_r = 16'hbfc6;
                4'hb: out_r = 16'hbfc5;
                4'hc: out_r = 16'hbfc5;
                4'hd: out_r = 16'hbfc5;
                4'he: out_r = 16'hbfc5;
                4'hf: out_r = 16'hbfc4;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbfc2;
              case (mant_lo4)
                4'h0: out_r = 16'hbfc4;
                4'h1: out_r = 16'hbfc4;
                4'h2: out_r = 16'hbfc4;
                4'h3: out_r = 16'hbfc4;
                4'h4: out_r = 16'hbfc3;
                4'h5: out_r = 16'hbfc3;
                4'h6: out_r = 16'hbfc3;
                4'h7: out_r = 16'hbfc3;
                4'hd: out_r = 16'hbfc1;
                4'he: out_r = 16'hbfc1;
                4'hf: out_r = 16'hbfc1;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbfbf;
              case (mant_lo4)
                4'h0: out_r = 16'hbfc1;
                4'h1: out_r = 16'hbfc0;
                4'h2: out_r = 16'hbfc0;
                4'h6: out_r = 16'hbfbe;
                4'h7: out_r = 16'hbfbe;
                4'h8: out_r = 16'hbfbd;
                4'h9: out_r = 16'hbfbd;
                4'ha: out_r = 16'hbfbc;
                4'hb: out_r = 16'hbfbc;
                4'hc: out_r = 16'hbfbc;
                4'hd: out_r = 16'hbfbb;
                4'he: out_r = 16'hbfbb;
                4'hf: out_r = 16'hbfba;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbfb9;
              case (mant_lo4)
                4'h0: out_r = 16'hbfba;
                4'h1: out_r = 16'hbfba;
                4'h5: out_r = 16'hbfb8;
                4'h6: out_r = 16'hbfb8;
                4'h7: out_r = 16'hbfb7;
                4'h8: out_r = 16'hbfb7;
                4'h9: out_r = 16'hbfb7;
                4'ha: out_r = 16'hbfb6;
                4'hb: out_r = 16'hbfb6;
                4'hc: out_r = 16'hbfb6;
                4'hd: out_r = 16'hbfb5;
                4'he: out_r = 16'hbfb5;
                4'hf: out_r = 16'hbfb5;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbfb4;
              case (mant_lo4)
                4'h3: out_r = 16'hbfb3;
                4'h4: out_r = 16'hbfb3;
                4'h5: out_r = 16'hbfb3;
                4'h6: out_r = 16'hbfb2;
                4'h7: out_r = 16'hbfb2;
                4'h8: out_r = 16'hbfb2;
                4'h9: out_r = 16'hbfb1;
                4'ha: out_r = 16'hbfb1;
                4'hb: out_r = 16'hbfb1;
                4'hc: out_r = 16'hbfb0;
                4'hd: out_r = 16'hbfb0;
                4'he: out_r = 16'hbfb0;
                4'hf: out_r = 16'hbfaf;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbfac;
              case (mant_lo4)
                4'h0: out_r = 16'hbfaf;
                4'h1: out_r = 16'hbfaf;
                4'h2: out_r = 16'hbfae;
                4'h3: out_r = 16'hbfae;
                4'h4: out_r = 16'hbfae;
                4'h5: out_r = 16'hbfad;
                4'h6: out_r = 16'hbfad;
                4'h7: out_r = 16'hbfad;
                4'hc: out_r = 16'hbfab;
                4'hd: out_r = 16'hbfab;
                4'he: out_r = 16'hbfab;
                4'hf: out_r = 16'hbfaa;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbfa8;
              case (mant_lo4)
                4'h0: out_r = 16'hbfaa;
                4'h1: out_r = 16'hbfaa;
                4'h2: out_r = 16'hbfaa;
                4'h3: out_r = 16'hbfa9;
                4'h4: out_r = 16'hbfa9;
                4'h5: out_r = 16'hbfa9;
                4'ha: out_r = 16'hbfa7;
                4'hb: out_r = 16'hbfa7;
                4'hc: out_r = 16'hbfa7;
                4'hd: out_r = 16'hbfa6;
                4'he: out_r = 16'hbfa6;
                4'hf: out_r = 16'hbfa6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbfa5;
              case (mant_lo4)
                4'h0: out_r = 16'hbfa6;
                4'h5: out_r = 16'hbfa4;
                4'h6: out_r = 16'hbfa4;
                4'h7: out_r = 16'hbfa4;
                4'h8: out_r = 16'hbfa4;
                4'h9: out_r = 16'hbfa3;
                4'ha: out_r = 16'hbfa3;
                4'hb: out_r = 16'hbfa3;
                4'hc: out_r = 16'hbfa3;
                4'hd: out_r = 16'hbfa2;
                4'he: out_r = 16'hbfa2;
                4'hf: out_r = 16'hbfa2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbfa1;
              case (mant_lo4)
                4'h0: out_r = 16'hbfa2;
                4'h5: out_r = 16'hbfa0;
                4'h6: out_r = 16'hbfa0;
                4'h7: out_r = 16'hbfa0;
                4'h8: out_r = 16'hbfa0;
                4'h9: out_r = 16'hbf9f;
                4'ha: out_r = 16'hbf9f;
                4'hb: out_r = 16'hbf9f;
                4'hc: out_r = 16'hbf9f;
                4'hd: out_r = 16'hbf9e;
                4'he: out_r = 16'hbf9e;
                4'hf: out_r = 16'hbf9e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbf9d;
              case (mant_lo4)
                4'h0: out_r = 16'hbf9e;
                4'h6: out_r = 16'hbf9c;
                4'h7: out_r = 16'hbf9c;
                4'h8: out_r = 16'hbf9c;
                4'h9: out_r = 16'hbf9c;
                4'ha: out_r = 16'hbf9b;
                4'hb: out_r = 16'hbf9b;
                4'hc: out_r = 16'hbf9b;
                4'hd: out_r = 16'hbf9b;
                4'he: out_r = 16'hbf9b;
                4'hf: out_r = 16'hbf9a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbf98;
              case (mant_lo4)
                4'h0: out_r = 16'hbf9a;
                4'h1: out_r = 16'hbf9a;
                4'h2: out_r = 16'hbf99;
                4'h3: out_r = 16'hbf99;
                4'h7: out_r = 16'hbf97;
                4'h8: out_r = 16'hbf97;
                4'h9: out_r = 16'hbf96;
                4'ha: out_r = 16'hbf96;
                4'hb: out_r = 16'hbf96;
                4'hc: out_r = 16'hbf95;
                4'hd: out_r = 16'hbf95;
                4'he: out_r = 16'hbf94;
                4'hf: out_r = 16'hbf94;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbf92;
              case (mant_lo4)
                4'h0: out_r = 16'hbf94;
                4'h1: out_r = 16'hbf93;
                4'h2: out_r = 16'hbf93;
                4'h6: out_r = 16'hbf91;
                4'h7: out_r = 16'hbf91;
                4'h8: out_r = 16'hbf91;
                4'h9: out_r = 16'hbf90;
                4'ha: out_r = 16'hbf90;
                4'hb: out_r = 16'hbf8f;
                4'hc: out_r = 16'hbf8f;
                4'hd: out_r = 16'hbf8f;
                4'he: out_r = 16'hbf8e;
                4'hf: out_r = 16'hbf8e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbf8d;
              case (mant_lo4)
                4'h0: out_r = 16'hbf8e;
                4'h4: out_r = 16'hbf8c;
                4'h5: out_r = 16'hbf8c;
                4'h6: out_r = 16'hbf8c;
                4'h7: out_r = 16'hbf8b;
                4'h8: out_r = 16'hbf8b;
                4'h9: out_r = 16'hbf8b;
                4'ha: out_r = 16'hbf8a;
                4'hb: out_r = 16'hbf8a;
                4'hc: out_r = 16'hbf8a;
                4'hd: out_r = 16'hbf89;
                4'he: out_r = 16'hbf89;
                4'hf: out_r = 16'hbf89;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbf87;
              case (mant_lo4)
                4'h0: out_r = 16'hbf88;
                4'h1: out_r = 16'hbf88;
                4'h2: out_r = 16'hbf88;
                4'h7: out_r = 16'hbf86;
                4'h8: out_r = 16'hbf86;
                4'h9: out_r = 16'hbf86;
                4'ha: out_r = 16'hbf85;
                4'hb: out_r = 16'hbf85;
                4'hc: out_r = 16'hbf85;
                4'hd: out_r = 16'hbf84;
                4'he: out_r = 16'hbf84;
                4'hf: out_r = 16'hbf84;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbf82;
              case (mant_lo4)
                4'h0: out_r = 16'hbf84;
                4'h1: out_r = 16'hbf83;
                4'h2: out_r = 16'hbf83;
                4'h3: out_r = 16'hbf83;
                4'h8: out_r = 16'hbf81;
                4'h9: out_r = 16'hbf81;
                4'ha: out_r = 16'hbf81;
                4'hb: out_r = 16'hbf80;
                4'hc: out_r = 16'hbf80;
                4'hd: out_r = 16'hbf80;
                4'he: out_r = 16'hbf7f;
                4'hf: out_r = 16'hbf7f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbf7e;
              case (mant_lo4)
                4'h2: out_r = 16'hbf7d;
                4'h3: out_r = 16'hbf7d;
                4'h4: out_r = 16'hbf7c;
                4'h5: out_r = 16'hbf7c;
                4'h6: out_r = 16'hbf7b;
                4'h7: out_r = 16'hbf7b;
                4'h8: out_r = 16'hbf7a;
                4'h9: out_r = 16'hbf7a;
                4'ha: out_r = 16'hbf79;
                4'hb: out_r = 16'hbf79;
                4'hc: out_r = 16'hbf78;
                4'hd: out_r = 16'hbf78;
                4'he: out_r = 16'hbf77;
                4'hf: out_r = 16'hbf77;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbf76;
              case (mant_lo4)
                4'h2: out_r = 16'hbf75;
                4'h3: out_r = 16'hbf75;
                4'h4: out_r = 16'hbf74;
                4'h5: out_r = 16'hbf74;
                4'h6: out_r = 16'hbf73;
                4'h7: out_r = 16'hbf73;
                4'h8: out_r = 16'hbf72;
                4'h9: out_r = 16'hbf72;
                4'ha: out_r = 16'hbf71;
                4'hb: out_r = 16'hbf71;
                4'hc: out_r = 16'hbf70;
                4'hd: out_r = 16'hbf70;
                4'he: out_r = 16'hbf6f;
                4'hf: out_r = 16'hbf6f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbf6d;
              case (mant_lo4)
                4'h0: out_r = 16'hbf6e;
                4'h1: out_r = 16'hbf6e;
                4'h5: out_r = 16'hbf6c;
                4'h6: out_r = 16'hbf6c;
                4'h7: out_r = 16'hbf6b;
                4'h8: out_r = 16'hbf6b;
                4'h9: out_r = 16'hbf6a;
                4'ha: out_r = 16'hbf6a;
                4'hb: out_r = 16'hbf69;
                4'hc: out_r = 16'hbf69;
                4'hd: out_r = 16'hbf69;
                4'he: out_r = 16'hbf68;
                4'hf: out_r = 16'hbf68;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbf65;
              case (mant_lo4)
                4'h0: out_r = 16'hbf67;
                4'h1: out_r = 16'hbf66;
                4'h4: out_r = 16'hbf64;
                4'h5: out_r = 16'hbf63;
                4'h6: out_r = 16'hbf62;
                4'h7: out_r = 16'hbf61;
                4'h8: out_r = 16'hbf60;
                4'h9: out_r = 16'hbf60;
                4'ha: out_r = 16'hbf5f;
                4'hb: out_r = 16'hbf5e;
                4'hc: out_r = 16'hbf5d;
                4'hd: out_r = 16'hbf5c;
                4'he: out_r = 16'hbf5c;
                4'hf: out_r = 16'hbf5b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbf59;
              case (mant_lo4)
                4'h0: out_r = 16'hbf5a;
                4'h3: out_r = 16'hbf58;
                4'h4: out_r = 16'hbf57;
                4'h5: out_r = 16'hbf56;
                4'h6: out_r = 16'hbf56;
                4'h7: out_r = 16'hbf55;
                4'h8: out_r = 16'hbf54;
                4'h9: out_r = 16'hbf53;
                4'ha: out_r = 16'hbf53;
                4'hb: out_r = 16'hbf52;
                4'hc: out_r = 16'hbf51;
                4'hd: out_r = 16'hbf50;
                4'he: out_r = 16'hbf50;
                4'hf: out_r = 16'hbf4f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbf4e;
              case (mant_lo4)
                4'h2: out_r = 16'hbf4d;
                4'h3: out_r = 16'hbf4c;
                4'h4: out_r = 16'hbf4c;
                4'h5: out_r = 16'hbf4b;
                4'h6: out_r = 16'hbf4a;
                4'h7: out_r = 16'hbf4a;
                4'h8: out_r = 16'hbf49;
                4'h9: out_r = 16'hbf48;
                4'ha: out_r = 16'hbf48;
                4'hb: out_r = 16'hbf47;
                4'hc: out_r = 16'hbf46;
                4'hd: out_r = 16'hbf46;
                4'he: out_r = 16'hbf45;
                4'hf: out_r = 16'hbf44;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbf43;
              case (mant_lo4)
                4'h0: out_r = 16'hbf44;
                4'h3: out_r = 16'hbf42;
                4'h4: out_r = 16'hbf41;
                4'h5: out_r = 16'hbf41;
                4'h6: out_r = 16'hbf40;
                4'h7: out_r = 16'hbf3f;
                4'h8: out_r = 16'hbf3f;
                4'h9: out_r = 16'hbf3e;
                4'ha: out_r = 16'hbf3e;
                4'hb: out_r = 16'hbf3d;
                4'hc: out_r = 16'hbf3c;
                4'hd: out_r = 16'hbf3c;
                4'he: out_r = 16'hbf3b;
                4'hf: out_r = 16'hbf3b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbf3a;
              case (mant_lo4)
                4'h2: out_r = 16'hbf39;
                4'h3: out_r = 16'hbf38;
                4'h4: out_r = 16'hbf38;
                4'h5: out_r = 16'hbf37;
                4'h6: out_r = 16'hbf37;
                4'h7: out_r = 16'hbf36;
                4'h8: out_r = 16'hbf36;
                4'h9: out_r = 16'hbf35;
                4'ha: out_r = 16'hbf34;
                4'hb: out_r = 16'hbf34;
                4'hc: out_r = 16'hbf33;
                4'hd: out_r = 16'hbf33;
                4'he: out_r = 16'hbf32;
                4'hf: out_r = 16'hbf32;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbf31;
              case (mant_lo4)
                4'h2: out_r = 16'hbf30;
                4'h3: out_r = 16'hbf30;
                4'h4: out_r = 16'hbf2f;
                4'h5: out_r = 16'hbf2f;
                4'h6: out_r = 16'hbf2e;
                4'h7: out_r = 16'hbf2e;
                4'h8: out_r = 16'hbf2d;
                4'h9: out_r = 16'hbf2d;
                4'ha: out_r = 16'hbf2c;
                4'hb: out_r = 16'hbf2b;
                4'hc: out_r = 16'hbf2b;
                4'hd: out_r = 16'hbf2a;
                4'he: out_r = 16'hbf2a;
                4'hf: out_r = 16'hbf29;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbf27;
              case (mant_lo4)
                4'h0: out_r = 16'hbf29;
                4'h1: out_r = 16'hbf28;
                4'h2: out_r = 16'hbf28;
                4'h6: out_r = 16'hbf26;
                4'h7: out_r = 16'hbf26;
                4'h8: out_r = 16'hbf25;
                4'h9: out_r = 16'hbf25;
                4'ha: out_r = 16'hbf24;
                4'hb: out_r = 16'hbf24;
                4'hc: out_r = 16'hbf23;
                4'hd: out_r = 16'hbf23;
                4'he: out_r = 16'hbf22;
                4'hf: out_r = 16'hbf22;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbf1f;
              case (mant_lo4)
                4'h0: out_r = 16'hbf21;
                4'h1: out_r = 16'hbf21;
                4'h2: out_r = 16'hbf20;
                4'h3: out_r = 16'hbf20;
                4'h7: out_r = 16'hbf1e;
                4'h8: out_r = 16'hbf1e;
                4'h9: out_r = 16'hbf1d;
                4'ha: out_r = 16'hbf1d;
                4'hb: out_r = 16'hbf1c;
                4'hc: out_r = 16'hbf1c;
                4'hd: out_r = 16'hbf1b;
                4'he: out_r = 16'hbf1b;
                4'hf: out_r = 16'hbf1b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbf18;
              case (mant_lo4)
                4'h0: out_r = 16'hbf1a;
                4'h1: out_r = 16'hbf19;
                4'h4: out_r = 16'hbf17;
                4'h5: out_r = 16'hbf16;
                4'h6: out_r = 16'hbf15;
                4'h7: out_r = 16'hbf14;
                4'h8: out_r = 16'hbf13;
                4'h9: out_r = 16'hbf13;
                4'ha: out_r = 16'hbf12;
                4'hb: out_r = 16'hbf11;
                4'hc: out_r = 16'hbf10;
                4'hd: out_r = 16'hbf0f;
                4'he: out_r = 16'hbf0f;
                4'hf: out_r = 16'hbf0e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbf0b;
              case (mant_lo4)
                4'h0: out_r = 16'hbf0d;
                4'h1: out_r = 16'hbf0c;
                4'h4: out_r = 16'hbf0a;
                4'h5: out_r = 16'hbf09;
                4'h6: out_r = 16'hbf08;
                4'h7: out_r = 16'hbf08;
                4'h8: out_r = 16'hbf07;
                4'h9: out_r = 16'hbf06;
                4'ha: out_r = 16'hbf06;
                4'hb: out_r = 16'hbf05;
                4'hc: out_r = 16'hbf04;
                4'hd: out_r = 16'hbf03;
                4'he: out_r = 16'hbf03;
                4'hf: out_r = 16'hbf02;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbf01;
              case (mant_lo4)
                4'h2: out_r = 16'hbf00;
                4'h3: out_r = 16'hbeff;
                4'h4: out_r = 16'hbefd;
                4'h5: out_r = 16'hbefc;
                4'h6: out_r = 16'hbefa;
                4'h7: out_r = 16'hbef9;
                4'h8: out_r = 16'hbef8;
                4'h9: out_r = 16'hbef6;
                4'ha: out_r = 16'hbef5;
                4'hb: out_r = 16'hbef4;
                4'hc: out_r = 16'hbef3;
                4'hd: out_r = 16'hbef1;
                4'he: out_r = 16'hbef0;
                4'hf: out_r = 16'hbeef;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbeed;
              case (mant_lo4)
                4'h1: out_r = 16'hbeec;
                4'h2: out_r = 16'hbeeb;
                4'h3: out_r = 16'hbeea;
                4'h4: out_r = 16'hbee8;
                4'h5: out_r = 16'hbee7;
                4'h6: out_r = 16'hbee6;
                4'h7: out_r = 16'hbee5;
                4'h8: out_r = 16'hbee4;
                4'h9: out_r = 16'hbee2;
                4'ha: out_r = 16'hbee1;
                4'hb: out_r = 16'hbee0;
                4'hc: out_r = 16'hbedf;
                4'hd: out_r = 16'hbede;
                4'he: out_r = 16'hbedc;
                4'hf: out_r = 16'hbedb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbeda;
              case (mant_lo4)
                4'h1: out_r = 16'hbed9;
                4'h2: out_r = 16'hbed8;
                4'h3: out_r = 16'hbed7;
                4'h4: out_r = 16'hbed6;
                4'h5: out_r = 16'hbed4;
                4'h6: out_r = 16'hbed3;
                4'h7: out_r = 16'hbed2;
                4'h8: out_r = 16'hbed1;
                4'h9: out_r = 16'hbed0;
                4'ha: out_r = 16'hbecf;
                4'hb: out_r = 16'hbece;
                4'hc: out_r = 16'hbecd;
                4'hd: out_r = 16'hbecc;
                4'he: out_r = 16'hbeca;
                4'hf: out_r = 16'hbec9;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbec8;
              case (mant_lo4)
                4'h1: out_r = 16'hbec7;
                4'h2: out_r = 16'hbec6;
                4'h3: out_r = 16'hbec5;
                4'h4: out_r = 16'hbec4;
                4'h5: out_r = 16'hbec3;
                4'h6: out_r = 16'hbec2;
                4'h7: out_r = 16'hbec1;
                4'h8: out_r = 16'hbec0;
                4'h9: out_r = 16'hbebf;
                4'ha: out_r = 16'hbebe;
                4'hb: out_r = 16'hbebd;
                4'hc: out_r = 16'hbebc;
                4'hd: out_r = 16'hbebb;
                4'he: out_r = 16'hbeba;
                4'hf: out_r = 16'hbeb9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbeb8;
              case (mant_lo4)
                4'h1: out_r = 16'hbeb7;
                4'h2: out_r = 16'hbeb6;
                4'h3: out_r = 16'hbeb5;
                4'h4: out_r = 16'hbeb4;
                4'h5: out_r = 16'hbeb3;
                4'h6: out_r = 16'hbeb2;
                4'h7: out_r = 16'hbeb1;
                4'h8: out_r = 16'hbeb0;
                4'h9: out_r = 16'hbeaf;
                4'ha: out_r = 16'hbeae;
                4'hb: out_r = 16'hbead;
                4'hc: out_r = 16'hbeac;
                4'hd: out_r = 16'hbeab;
                4'he: out_r = 16'hbeaa;
                4'hf: out_r = 16'hbea9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbea8;
              case (mant_lo4)
                4'h2: out_r = 16'hbea7;
                4'h3: out_r = 16'hbea6;
                4'h4: out_r = 16'hbea5;
                4'h5: out_r = 16'hbea4;
                4'h6: out_r = 16'hbea3;
                4'h7: out_r = 16'hbea2;
                4'h8: out_r = 16'hbea1;
                4'h9: out_r = 16'hbea0;
                4'ha: out_r = 16'hbe9f;
                4'hb: out_r = 16'hbe9f;
                4'hc: out_r = 16'hbe9e;
                4'hd: out_r = 16'hbe9d;
                4'he: out_r = 16'hbe9c;
                4'hf: out_r = 16'hbe9b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'hbe9a;
              case (mant_lo4)
                4'h1: out_r = 16'hbe98;
                4'h2: out_r = 16'hbe97;
                4'h3: out_r = 16'hbe95;
                4'h4: out_r = 16'hbe93;
                4'h5: out_r = 16'hbe92;
                4'h6: out_r = 16'hbe90;
                4'h7: out_r = 16'hbe8e;
                4'h8: out_r = 16'hbe8d;
                4'h9: out_r = 16'hbe8b;
                4'ha: out_r = 16'hbe89;
                4'hb: out_r = 16'hbe88;
                4'hc: out_r = 16'hbe86;
                4'hd: out_r = 16'hbe85;
                4'he: out_r = 16'hbe83;
                4'hf: out_r = 16'hbe81;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'hbe80;
              case (mant_lo4)
                4'h1: out_r = 16'hbe7d;
                4'h2: out_r = 16'hbe7a;
                4'h3: out_r = 16'hbe77;
                4'h4: out_r = 16'hbe74;
                4'h5: out_r = 16'hbe71;
                4'h6: out_r = 16'hbe6e;
                4'h7: out_r = 16'hbe6b;
                4'h8: out_r = 16'hbe68;
                4'h9: out_r = 16'hbe65;
                4'ha: out_r = 16'hbe62;
                4'hb: out_r = 16'hbe5f;
                4'hc: out_r = 16'hbe5c;
                4'hd: out_r = 16'hbe59;
                4'he: out_r = 16'hbe57;
                4'hf: out_r = 16'hbe54;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'hbe51;
              case (mant_lo4)
                4'h1: out_r = 16'hbe4e;
                4'h2: out_r = 16'hbe4b;
                4'h3: out_r = 16'hbe49;
                4'h4: out_r = 16'hbe46;
                4'h5: out_r = 16'hbe43;
                4'h6: out_r = 16'hbe41;
                4'h7: out_r = 16'hbe3e;
                4'h8: out_r = 16'hbe3b;
                4'h9: out_r = 16'hbe39;
                4'ha: out_r = 16'hbe36;
                4'hb: out_r = 16'hbe33;
                4'hc: out_r = 16'hbe31;
                4'hd: out_r = 16'hbe2e;
                4'he: out_r = 16'hbe2c;
                4'hf: out_r = 16'hbe29;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'hbe27;
              case (mant_lo4)
                4'h1: out_r = 16'hbe24;
                4'h2: out_r = 16'hbe22;
                4'h3: out_r = 16'hbe1f;
                4'h4: out_r = 16'hbe1d;
                4'h5: out_r = 16'hbe1a;
                4'h6: out_r = 16'hbe18;
                4'h7: out_r = 16'hbe15;
                4'h8: out_r = 16'hbe13;
                4'h9: out_r = 16'hbe10;
                4'ha: out_r = 16'hbe0e;
                4'hb: out_r = 16'hbe0c;
                4'hc: out_r = 16'hbe09;
                4'hd: out_r = 16'hbe07;
                4'he: out_r = 16'hbe05;
                4'hf: out_r = 16'hbe02;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'hbe00;
              case (mant_lo4)
                4'h1: out_r = 16'hbdfb;
                4'h2: out_r = 16'hbdf7;
                4'h3: out_r = 16'hbdf2;
                4'h4: out_r = 16'hbdee;
                4'h5: out_r = 16'hbde9;
                4'h6: out_r = 16'hbde5;
                4'h7: out_r = 16'hbde0;
                4'h8: out_r = 16'hbddc;
                4'h9: out_r = 16'hbdd7;
                4'ha: out_r = 16'hbdd3;
                4'hb: out_r = 16'hbdce;
                4'hc: out_r = 16'hbdca;
                4'hd: out_r = 16'hbdc6;
                4'he: out_r = 16'hbdc1;
                4'hf: out_r = 16'hbdbd;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'hbdb9;
              case (mant_lo4)
                4'h1: out_r = 16'hbdb4;
                4'h2: out_r = 16'hbdb0;
                4'h3: out_r = 16'hbdac;
                4'h4: out_r = 16'hbda8;
                4'h5: out_r = 16'hbda4;
                4'h6: out_r = 16'hbd9f;
                4'h7: out_r = 16'hbd9b;
                4'h8: out_r = 16'hbd97;
                4'h9: out_r = 16'hbd93;
                4'ha: out_r = 16'hbd8f;
                4'hb: out_r = 16'hbd8b;
                4'hc: out_r = 16'hbd87;
                4'hd: out_r = 16'hbd83;
                4'he: out_r = 16'hbd7d;
                4'hf: out_r = 16'hbd75;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'hbd6e;
              case (mant_lo4)
                4'h1: out_r = 16'hbd66;
                4'h2: out_r = 16'hbd5e;
                4'h3: out_r = 16'hbd56;
                4'h4: out_r = 16'hbd4e;
                4'h5: out_r = 16'hbd46;
                4'h6: out_r = 16'hbd3f;
                4'h7: out_r = 16'hbd37;
                4'h8: out_r = 16'hbd2f;
                4'h9: out_r = 16'hbd27;
                4'ha: out_r = 16'hbd20;
                4'hb: out_r = 16'hbd18;
                4'hc: out_r = 16'hbd11;
                4'hd: out_r = 16'hbd09;
                4'he: out_r = 16'hbd02;
                4'hf: out_r = 16'hbcf4;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'hbce6;
              case (mant_lo4)
                4'h1: out_r = 16'hbcd7;
                4'h2: out_r = 16'hbcc8;
                4'h3: out_r = 16'hbcb9;
                4'h4: out_r = 16'hbcab;
                4'h5: out_r = 16'hbc9c;
                4'h6: out_r = 16'hbc8e;
                4'h7: out_r = 16'hbc7f;
                4'h8: out_r = 16'hbc62;
                4'h9: out_r = 16'hbc45;
                4'ha: out_r = 16'hbc29;
                4'hb: out_r = 16'hbc0c;
                4'hc: out_r = 16'hbbe0;
                4'hd: out_r = 16'hbba8;
                4'he: out_r = 16'hbb5f;
                4'hf: out_r = 16'hbadf;
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
                4'h1: out_r = 16'h3b5d;
                4'h2: out_r = 16'h3bdd;
                4'h3: out_r = 16'h3c25;
                4'h4: out_r = 16'h3c5b;
                4'h5: out_r = 16'h3c88;
                4'h6: out_r = 16'h3ca3;
                4'h7: out_r = 16'h3cbd;
                4'h8: out_r = 16'h3cd8;
                4'h9: out_r = 16'h3cf2;
                4'ha: out_r = 16'h3d06;
                4'hb: out_r = 16'h3d13;
                4'hc: out_r = 16'h3d1f;
                4'hd: out_r = 16'h3d2c;
                4'he: out_r = 16'h3d39;
                4'hf: out_r = 16'h3d45;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3d52;
              case (mant_lo4)
                4'h1: out_r = 16'h3d5e;
                4'h2: out_r = 16'h3d6a;
                4'h3: out_r = 16'h3d76;
                4'h4: out_r = 16'h3d81;
                4'h5: out_r = 16'h3d87;
                4'h6: out_r = 16'h3d8d;
                4'h7: out_r = 16'h3d93;
                4'h8: out_r = 16'h3d99;
                4'h9: out_r = 16'h3d9f;
                4'ha: out_r = 16'h3da4;
                4'hb: out_r = 16'h3daa;
                4'hc: out_r = 16'h3db0;
                4'hd: out_r = 16'h3db6;
                4'he: out_r = 16'h3dbb;
                4'hf: out_r = 16'h3dc1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3dc6;
              case (mant_lo4)
                4'h1: out_r = 16'h3dcc;
                4'h2: out_r = 16'h3dd2;
                4'h3: out_r = 16'h3dd7;
                4'h4: out_r = 16'h3ddc;
                4'h5: out_r = 16'h3de2;
                4'h6: out_r = 16'h3de7;
                4'h7: out_r = 16'h3ded;
                4'h8: out_r = 16'h3df2;
                4'h9: out_r = 16'h3df7;
                4'ha: out_r = 16'h3dfc;
                4'hb: out_r = 16'h3e01;
                4'hc: out_r = 16'h3e03;
                4'hd: out_r = 16'h3e06;
                4'he: out_r = 16'h3e09;
                4'hf: out_r = 16'h3e0b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3e0e;
              case (mant_lo4)
                4'h1: out_r = 16'h3e10;
                4'h2: out_r = 16'h3e13;
                4'h3: out_r = 16'h3e15;
                4'h4: out_r = 16'h3e18;
                4'h5: out_r = 16'h3e1a;
                4'h6: out_r = 16'h3e1d;
                4'h7: out_r = 16'h3e1f;
                4'h8: out_r = 16'h3e21;
                4'h9: out_r = 16'h3e24;
                4'ha: out_r = 16'h3e26;
                4'hb: out_r = 16'h3e29;
                4'hc: out_r = 16'h3e2b;
                4'hd: out_r = 16'h3e2d;
                4'he: out_r = 16'h3e30;
                4'hf: out_r = 16'h3e32;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3e34;
              case (mant_lo4)
                4'h1: out_r = 16'h3e37;
                4'h2: out_r = 16'h3e39;
                4'h3: out_r = 16'h3e3b;
                4'h4: out_r = 16'h3e3d;
                4'h5: out_r = 16'h3e40;
                4'h6: out_r = 16'h3e42;
                4'h7: out_r = 16'h3e44;
                4'h8: out_r = 16'h3e46;
                4'h9: out_r = 16'h3e49;
                4'ha: out_r = 16'h3e4b;
                4'hb: out_r = 16'h3e4d;
                4'hc: out_r = 16'h3e4f;
                4'hd: out_r = 16'h3e51;
                4'he: out_r = 16'h3e54;
                4'hf: out_r = 16'h3e56;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3e58;
              case (mant_lo4)
                4'h1: out_r = 16'h3e5a;
                4'h2: out_r = 16'h3e5c;
                4'h3: out_r = 16'h3e5e;
                4'h4: out_r = 16'h3e60;
                4'h5: out_r = 16'h3e62;
                4'h6: out_r = 16'h3e65;
                4'h7: out_r = 16'h3e67;
                4'h8: out_r = 16'h3e69;
                4'h9: out_r = 16'h3e6b;
                4'ha: out_r = 16'h3e6d;
                4'hb: out_r = 16'h3e6f;
                4'hc: out_r = 16'h3e71;
                4'hd: out_r = 16'h3e73;
                4'he: out_r = 16'h3e75;
                4'hf: out_r = 16'h3e77;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3e79;
              case (mant_lo4)
                4'h1: out_r = 16'h3e7b;
                4'h2: out_r = 16'h3e7d;
                4'h3: out_r = 16'h3e7f;
                4'h4: out_r = 16'h3e80;
                4'h5: out_r = 16'h3e81;
                4'h6: out_r = 16'h3e82;
                4'h7: out_r = 16'h3e83;
                4'h8: out_r = 16'h3e84;
                4'h9: out_r = 16'h3e85;
                4'ha: out_r = 16'h3e86;
                4'hb: out_r = 16'h3e87;
                4'hc: out_r = 16'h3e88;
                4'hd: out_r = 16'h3e89;
                4'he: out_r = 16'h3e8a;
                4'hf: out_r = 16'h3e8b;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3e8f;
              case (mant_lo4)
                4'h0: out_r = 16'h3e8c;
                4'h1: out_r = 16'h3e8d;
                4'h2: out_r = 16'h3e8e;
                4'h5: out_r = 16'h3e90;
                4'h6: out_r = 16'h3e91;
                4'h7: out_r = 16'h3e92;
                4'h8: out_r = 16'h3e93;
                4'h9: out_r = 16'h3e94;
                4'ha: out_r = 16'h3e95;
                4'hb: out_r = 16'h3e96;
                4'hc: out_r = 16'h3e97;
                4'hd: out_r = 16'h3e98;
                4'he: out_r = 16'h3e98;
                4'hf: out_r = 16'h3e99;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h080: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3e9a;
              case (mant_lo4)
                4'h1: out_r = 16'h3e9c;
                4'h2: out_r = 16'h3e9e;
                4'h3: out_r = 16'h3e9f;
                4'h4: out_r = 16'h3ea1;
                4'h5: out_r = 16'h3ea3;
                4'h6: out_r = 16'h3ea4;
                4'h7: out_r = 16'h3ea6;
                4'h8: out_r = 16'h3ea8;
                4'h9: out_r = 16'h3ea9;
                4'ha: out_r = 16'h3eab;
                4'hb: out_r = 16'h3eac;
                4'hc: out_r = 16'h3eae;
                4'hd: out_r = 16'h3eb0;
                4'he: out_r = 16'h3eb1;
                4'hf: out_r = 16'h3eb3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3eb4;
              case (mant_lo4)
                4'h1: out_r = 16'h3eb6;
                4'h2: out_r = 16'h3eb7;
                4'h3: out_r = 16'h3eb9;
                4'h4: out_r = 16'h3eba;
                4'h5: out_r = 16'h3ebc;
                4'h6: out_r = 16'h3ebd;
                4'h7: out_r = 16'h3ebf;
                4'h8: out_r = 16'h3ec0;
                4'h9: out_r = 16'h3ec2;
                4'ha: out_r = 16'h3ec3;
                4'hb: out_r = 16'h3ec5;
                4'hc: out_r = 16'h3ec6;
                4'hd: out_r = 16'h3ec8;
                4'he: out_r = 16'h3ec9;
                4'hf: out_r = 16'h3eca;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3ecc;
              case (mant_lo4)
                4'h1: out_r = 16'h3ecd;
                4'h2: out_r = 16'h3ecf;
                4'h3: out_r = 16'h3ed0;
                4'h4: out_r = 16'h3ed1;
                4'h5: out_r = 16'h3ed3;
                4'h6: out_r = 16'h3ed4;
                4'h7: out_r = 16'h3ed5;
                4'h8: out_r = 16'h3ed7;
                4'h9: out_r = 16'h3ed8;
                4'ha: out_r = 16'h3ed9;
                4'hb: out_r = 16'h3edb;
                4'hc: out_r = 16'h3edc;
                4'hd: out_r = 16'h3edd;
                4'he: out_r = 16'h3ede;
                4'hf: out_r = 16'h3ee0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3ee1;
              case (mant_lo4)
                4'h1: out_r = 16'h3ee2;
                4'h2: out_r = 16'h3ee3;
                4'h3: out_r = 16'h3ee5;
                4'h4: out_r = 16'h3ee6;
                4'h5: out_r = 16'h3ee7;
                4'h6: out_r = 16'h3ee8;
                4'h7: out_r = 16'h3eea;
                4'h8: out_r = 16'h3eeb;
                4'h9: out_r = 16'h3eec;
                4'ha: out_r = 16'h3eed;
                4'hb: out_r = 16'h3eee;
                4'hc: out_r = 16'h3ef0;
                4'hd: out_r = 16'h3ef1;
                4'he: out_r = 16'h3ef2;
                4'hf: out_r = 16'h3ef3;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3f00;
              case (mant_lo4)
                4'h0: out_r = 16'h3ef4;
                4'h1: out_r = 16'h3ef5;
                4'h2: out_r = 16'h3ef7;
                4'h3: out_r = 16'h3ef8;
                4'h4: out_r = 16'h3ef9;
                4'h5: out_r = 16'h3efa;
                4'h6: out_r = 16'h3efb;
                4'h7: out_r = 16'h3efc;
                4'h8: out_r = 16'h3efd;
                4'h9: out_r = 16'h3efe;
                4'hc: out_r = 16'h3f01;
                4'hd: out_r = 16'h3f01;
                4'he: out_r = 16'h3f02;
                4'hf: out_r = 16'h3f03;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3f04;
              case (mant_lo4)
                4'h0: out_r = 16'h3f03;
                4'h3: out_r = 16'h3f05;
                4'h4: out_r = 16'h3f05;
                4'h5: out_r = 16'h3f06;
                4'h6: out_r = 16'h3f06;
                4'h7: out_r = 16'h3f07;
                4'h8: out_r = 16'h3f07;
                4'h9: out_r = 16'h3f08;
                4'ha: out_r = 16'h3f08;
                4'hb: out_r = 16'h3f09;
                4'hc: out_r = 16'h3f09;
                4'hd: out_r = 16'h3f0a;
                4'he: out_r = 16'h3f0a;
                4'hf: out_r = 16'h3f0b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3f12;
              case (mant_lo4)
                4'h0: out_r = 16'h3f0b;
                4'h1: out_r = 16'h3f0c;
                4'h2: out_r = 16'h3f0c;
                4'h3: out_r = 16'h3f0d;
                4'h4: out_r = 16'h3f0d;
                4'h5: out_r = 16'h3f0e;
                4'h6: out_r = 16'h3f0e;
                4'h7: out_r = 16'h3f0f;
                4'h8: out_r = 16'h3f0f;
                4'h9: out_r = 16'h3f10;
                4'ha: out_r = 16'h3f10;
                4'hb: out_r = 16'h3f11;
                4'hc: out_r = 16'h3f11;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3f17;
              case (mant_lo4)
                4'h0: out_r = 16'h3f13;
                4'h1: out_r = 16'h3f13;
                4'h2: out_r = 16'h3f14;
                4'h3: out_r = 16'h3f14;
                4'h4: out_r = 16'h3f15;
                4'h5: out_r = 16'h3f15;
                4'h6: out_r = 16'h3f16;
                4'h7: out_r = 16'h3f16;
                4'hb: out_r = 16'h3f18;
                4'hc: out_r = 16'h3f18;
                4'hd: out_r = 16'h3f19;
                4'he: out_r = 16'h3f19;
                4'hf: out_r = 16'h3f1a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h081: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3f1e;
              case (mant_lo4)
                4'h0: out_r = 16'h3f1a;
                4'h1: out_r = 16'h3f1b;
                4'h2: out_r = 16'h3f1c;
                4'h3: out_r = 16'h3f1d;
                4'h6: out_r = 16'h3f1f;
                4'h7: out_r = 16'h3f20;
                4'h8: out_r = 16'h3f21;
                4'h9: out_r = 16'h3f22;
                4'ha: out_r = 16'h3f22;
                4'hb: out_r = 16'h3f23;
                4'hc: out_r = 16'h3f24;
                4'hd: out_r = 16'h3f25;
                4'he: out_r = 16'h3f26;
                4'hf: out_r = 16'h3f26;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3f2a;
              case (mant_lo4)
                4'h0: out_r = 16'h3f27;
                4'h1: out_r = 16'h3f28;
                4'h2: out_r = 16'h3f29;
                4'h5: out_r = 16'h3f2b;
                4'h6: out_r = 16'h3f2c;
                4'h7: out_r = 16'h3f2c;
                4'h8: out_r = 16'h3f2d;
                4'h9: out_r = 16'h3f2e;
                4'ha: out_r = 16'h3f2f;
                4'hb: out_r = 16'h3f2f;
                4'hc: out_r = 16'h3f30;
                4'hd: out_r = 16'h3f31;
                4'he: out_r = 16'h3f32;
                4'hf: out_r = 16'h3f32;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3f34;
              case (mant_lo4)
                4'h0: out_r = 16'h3f33;
                4'h3: out_r = 16'h3f35;
                4'h4: out_r = 16'h3f36;
                4'h5: out_r = 16'h3f36;
                4'h6: out_r = 16'h3f37;
                4'h7: out_r = 16'h3f38;
                4'h8: out_r = 16'h3f38;
                4'h9: out_r = 16'h3f39;
                4'ha: out_r = 16'h3f3a;
                4'hb: out_r = 16'h3f3a;
                4'hc: out_r = 16'h3f3b;
                4'hd: out_r = 16'h3f3c;
                4'he: out_r = 16'h3f3c;
                4'hf: out_r = 16'h3f3d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3f3e;
              case (mant_lo4)
                4'h2: out_r = 16'h3f3f;
                4'h3: out_r = 16'h3f3f;
                4'h4: out_r = 16'h3f40;
                4'h5: out_r = 16'h3f41;
                4'h6: out_r = 16'h3f41;
                4'h7: out_r = 16'h3f42;
                4'h8: out_r = 16'h3f42;
                4'h9: out_r = 16'h3f43;
                4'ha: out_r = 16'h3f44;
                4'hb: out_r = 16'h3f44;
                4'hc: out_r = 16'h3f45;
                4'hd: out_r = 16'h3f45;
                4'he: out_r = 16'h3f46;
                4'hf: out_r = 16'h3f47;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3f48;
              case (mant_lo4)
                4'h0: out_r = 16'h3f47;
                4'h3: out_r = 16'h3f49;
                4'h4: out_r = 16'h3f49;
                4'h5: out_r = 16'h3f4a;
                4'h6: out_r = 16'h3f4b;
                4'h7: out_r = 16'h3f4b;
                4'h8: out_r = 16'h3f4c;
                4'h9: out_r = 16'h3f4c;
                4'ha: out_r = 16'h3f4d;
                4'hb: out_r = 16'h3f4d;
                4'hc: out_r = 16'h3f4e;
                4'hd: out_r = 16'h3f4e;
                4'he: out_r = 16'h3f4f;
                4'hf: out_r = 16'h3f50;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3f51;
              case (mant_lo4)
                4'h0: out_r = 16'h3f50;
                4'h3: out_r = 16'h3f52;
                4'h4: out_r = 16'h3f52;
                4'h5: out_r = 16'h3f53;
                4'h6: out_r = 16'h3f53;
                4'h7: out_r = 16'h3f54;
                4'h8: out_r = 16'h3f54;
                4'h9: out_r = 16'h3f55;
                4'ha: out_r = 16'h3f55;
                4'hb: out_r = 16'h3f56;
                4'hc: out_r = 16'h3f56;
                4'hd: out_r = 16'h3f57;
                4'he: out_r = 16'h3f57;
                4'hf: out_r = 16'h3f58;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3f59;
              case (mant_lo4)
                4'h0: out_r = 16'h3f58;
                4'h3: out_r = 16'h3f5a;
                4'h4: out_r = 16'h3f5a;
                4'h5: out_r = 16'h3f5b;
                4'h6: out_r = 16'h3f5b;
                4'h7: out_r = 16'h3f5c;
                4'h8: out_r = 16'h3f5c;
                4'h9: out_r = 16'h3f5d;
                4'ha: out_r = 16'h3f5d;
                4'hb: out_r = 16'h3f5e;
                4'hc: out_r = 16'h3f5e;
                4'hd: out_r = 16'h3f5f;
                4'he: out_r = 16'h3f5f;
                4'hf: out_r = 16'h3f60;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3f65;
              case (mant_lo4)
                4'h0: out_r = 16'h3f60;
                4'h1: out_r = 16'h3f60;
                4'h2: out_r = 16'h3f61;
                4'h3: out_r = 16'h3f61;
                4'h4: out_r = 16'h3f62;
                4'h5: out_r = 16'h3f62;
                4'h6: out_r = 16'h3f63;
                4'h7: out_r = 16'h3f63;
                4'h8: out_r = 16'h3f64;
                4'h9: out_r = 16'h3f64;
                4'hd: out_r = 16'h3f66;
                4'he: out_r = 16'h3f66;
                4'hf: out_r = 16'h3f67;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h082: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3f6b;
              case (mant_lo4)
                4'h0: out_r = 16'h3f67;
                4'h1: out_r = 16'h3f68;
                4'h2: out_r = 16'h3f69;
                4'h3: out_r = 16'h3f6a;
                4'h6: out_r = 16'h3f6c;
                4'h7: out_r = 16'h3f6d;
                4'h8: out_r = 16'h3f6e;
                4'h9: out_r = 16'h3f6f;
                4'ha: out_r = 16'h3f70;
                4'hb: out_r = 16'h3f70;
                4'hc: out_r = 16'h3f71;
                4'hd: out_r = 16'h3f72;
                4'he: out_r = 16'h3f73;
                4'hf: out_r = 16'h3f74;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3f77;
              case (mant_lo4)
                4'h0: out_r = 16'h3f74;
                4'h1: out_r = 16'h3f75;
                4'h2: out_r = 16'h3f76;
                4'h5: out_r = 16'h3f78;
                4'h6: out_r = 16'h3f79;
                4'h7: out_r = 16'h3f7a;
                4'h8: out_r = 16'h3f7a;
                4'h9: out_r = 16'h3f7b;
                4'ha: out_r = 16'h3f7c;
                4'hb: out_r = 16'h3f7c;
                4'hc: out_r = 16'h3f7d;
                4'hd: out_r = 16'h3f7e;
                4'he: out_r = 16'h3f7f;
                4'hf: out_r = 16'h3f7f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3f81;
              case (mant_lo4)
                4'h0: out_r = 16'h3f80;
                4'h1: out_r = 16'h3f80;
                4'h5: out_r = 16'h3f82;
                4'h6: out_r = 16'h3f82;
                4'h7: out_r = 16'h3f82;
                4'h8: out_r = 16'h3f83;
                4'h9: out_r = 16'h3f83;
                4'ha: out_r = 16'h3f83;
                4'hb: out_r = 16'h3f84;
                4'hc: out_r = 16'h3f84;
                4'hd: out_r = 16'h3f84;
                4'he: out_r = 16'h3f85;
                4'hf: out_r = 16'h3f85;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3f87;
              case (mant_lo4)
                4'h0: out_r = 16'h3f85;
                4'h1: out_r = 16'h3f86;
                4'h2: out_r = 16'h3f86;
                4'h3: out_r = 16'h3f86;
                4'h8: out_r = 16'h3f88;
                4'h9: out_r = 16'h3f88;
                4'ha: out_r = 16'h3f88;
                4'hb: out_r = 16'h3f89;
                4'hc: out_r = 16'h3f89;
                4'hd: out_r = 16'h3f89;
                4'he: out_r = 16'h3f8a;
                4'hf: out_r = 16'h3f8a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3f8c;
              case (mant_lo4)
                4'h0: out_r = 16'h3f8a;
                4'h1: out_r = 16'h3f8a;
                4'h2: out_r = 16'h3f8b;
                4'h3: out_r = 16'h3f8b;
                4'h4: out_r = 16'h3f8b;
                4'h9: out_r = 16'h3f8d;
                4'ha: out_r = 16'h3f8d;
                4'hb: out_r = 16'h3f8d;
                4'hc: out_r = 16'h3f8e;
                4'hd: out_r = 16'h3f8e;
                4'he: out_r = 16'h3f8e;
                4'hf: out_r = 16'h3f8e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3f8f;
              case (mant_lo4)
                4'h4: out_r = 16'h3f90;
                4'h5: out_r = 16'h3f90;
                4'h6: out_r = 16'h3f90;
                4'h7: out_r = 16'h3f90;
                4'h8: out_r = 16'h3f91;
                4'h9: out_r = 16'h3f91;
                4'ha: out_r = 16'h3f91;
                4'hb: out_r = 16'h3f91;
                4'hc: out_r = 16'h3f92;
                4'hd: out_r = 16'h3f92;
                4'he: out_r = 16'h3f92;
                4'hf: out_r = 16'h3f92;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3f93;
              case (mant_lo4)
                4'h4: out_r = 16'h3f94;
                4'h5: out_r = 16'h3f94;
                4'h6: out_r = 16'h3f94;
                4'h7: out_r = 16'h3f94;
                4'h8: out_r = 16'h3f95;
                4'h9: out_r = 16'h3f95;
                4'ha: out_r = 16'h3f95;
                4'hb: out_r = 16'h3f95;
                4'hc: out_r = 16'h3f96;
                4'hd: out_r = 16'h3f96;
                4'he: out_r = 16'h3f96;
                4'hf: out_r = 16'h3f96;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3f97;
              case (mant_lo4)
                4'h5: out_r = 16'h3f98;
                4'h6: out_r = 16'h3f98;
                4'h7: out_r = 16'h3f98;
                4'h8: out_r = 16'h3f98;
                4'h9: out_r = 16'h3f99;
                4'ha: out_r = 16'h3f99;
                4'hb: out_r = 16'h3f99;
                4'hc: out_r = 16'h3f99;
                4'hd: out_r = 16'h3f99;
                4'he: out_r = 16'h3f9a;
                4'hf: out_r = 16'h3f9a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h083: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3f9b;
              case (mant_lo4)
                4'h0: out_r = 16'h3f9a;
                4'h4: out_r = 16'h3f9c;
                4'h5: out_r = 16'h3f9c;
                4'h6: out_r = 16'h3f9d;
                4'h7: out_r = 16'h3f9d;
                4'h8: out_r = 16'h3f9d;
                4'h9: out_r = 16'h3f9e;
                4'ha: out_r = 16'h3f9e;
                4'hb: out_r = 16'h3f9f;
                4'hc: out_r = 16'h3f9f;
                4'hd: out_r = 16'h3fa0;
                4'he: out_r = 16'h3fa0;
                4'hf: out_r = 16'h3fa0;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3fa1;
              case (mant_lo4)
                4'h3: out_r = 16'h3fa2;
                4'h4: out_r = 16'h3fa2;
                4'h5: out_r = 16'h3fa3;
                4'h6: out_r = 16'h3fa3;
                4'h7: out_r = 16'h3fa3;
                4'h8: out_r = 16'h3fa4;
                4'h9: out_r = 16'h3fa4;
                4'ha: out_r = 16'h3fa4;
                4'hb: out_r = 16'h3fa5;
                4'hc: out_r = 16'h3fa5;
                4'hd: out_r = 16'h3fa5;
                4'he: out_r = 16'h3fa6;
                4'hf: out_r = 16'h3fa6;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3fa7;
              case (mant_lo4)
                4'h3: out_r = 16'h3fa8;
                4'h4: out_r = 16'h3fa8;
                4'h5: out_r = 16'h3fa8;
                4'h6: out_r = 16'h3fa9;
                4'h7: out_r = 16'h3fa9;
                4'h8: out_r = 16'h3fa9;
                4'h9: out_r = 16'h3faa;
                4'ha: out_r = 16'h3faa;
                4'hb: out_r = 16'h3faa;
                4'hc: out_r = 16'h3fab;
                4'hd: out_r = 16'h3fab;
                4'he: out_r = 16'h3fab;
                4'hf: out_r = 16'h3fac;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3faf;
              case (mant_lo4)
                4'h0: out_r = 16'h3fac;
                4'h1: out_r = 16'h3fac;
                4'h2: out_r = 16'h3fac;
                4'h3: out_r = 16'h3fad;
                4'h4: out_r = 16'h3fad;
                4'h5: out_r = 16'h3fad;
                4'h6: out_r = 16'h3fae;
                4'h7: out_r = 16'h3fae;
                4'h8: out_r = 16'h3fae;
                4'hd: out_r = 16'h3fb0;
                4'he: out_r = 16'h3fb0;
                4'hf: out_r = 16'h3fb0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3fb2;
              case (mant_lo4)
                4'h0: out_r = 16'h3fb1;
                4'h1: out_r = 16'h3fb1;
                4'h2: out_r = 16'h3fb1;
                4'h7: out_r = 16'h3fb3;
                4'h8: out_r = 16'h3fb3;
                4'h9: out_r = 16'h3fb3;
                4'ha: out_r = 16'h3fb3;
                4'hb: out_r = 16'h3fb4;
                4'hc: out_r = 16'h3fb4;
                4'hd: out_r = 16'h3fb4;
                4'he: out_r = 16'h3fb5;
                4'hf: out_r = 16'h3fb5;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3fb6;
              case (mant_lo4)
                4'h0: out_r = 16'h3fb5;
                4'h1: out_r = 16'h3fb5;
                4'h6: out_r = 16'h3fb7;
                4'h7: out_r = 16'h3fb7;
                4'h8: out_r = 16'h3fb7;
                4'h9: out_r = 16'h3fb7;
                4'ha: out_r = 16'h3fb8;
                4'hb: out_r = 16'h3fb8;
                4'hc: out_r = 16'h3fb8;
                4'hd: out_r = 16'h3fb8;
                4'he: out_r = 16'h3fb9;
                4'hf: out_r = 16'h3fb9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3fba;
              case (mant_lo4)
                4'h0: out_r = 16'h3fb9;
                4'h1: out_r = 16'h3fb9;
                4'h6: out_r = 16'h3fbb;
                4'h7: out_r = 16'h3fbb;
                4'h8: out_r = 16'h3fbb;
                4'h9: out_r = 16'h3fbb;
                4'ha: out_r = 16'h3fbc;
                4'hb: out_r = 16'h3fbc;
                4'hc: out_r = 16'h3fbc;
                4'hd: out_r = 16'h3fbc;
                4'he: out_r = 16'h3fbd;
                4'hf: out_r = 16'h3fbd;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3fbe;
              case (mant_lo4)
                4'h0: out_r = 16'h3fbd;
                4'h1: out_r = 16'h3fbd;
                4'h7: out_r = 16'h3fbf;
                4'h8: out_r = 16'h3fbf;
                4'h9: out_r = 16'h3fbf;
                4'ha: out_r = 16'h3fbf;
                4'hb: out_r = 16'h3fc0;
                4'hc: out_r = 16'h3fc0;
                4'hd: out_r = 16'h3fc0;
                4'he: out_r = 16'h3fc0;
                4'hf: out_r = 16'h3fc0;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h084: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3fc2;
              case (mant_lo4)
                4'h0: out_r = 16'h3fc1;
                4'h1: out_r = 16'h3fc1;
                4'h5: out_r = 16'h3fc3;
                4'h6: out_r = 16'h3fc3;
                4'h7: out_r = 16'h3fc4;
                4'h8: out_r = 16'h3fc4;
                4'h9: out_r = 16'h3fc4;
                4'ha: out_r = 16'h3fc5;
                4'hb: out_r = 16'h3fc5;
                4'hc: out_r = 16'h3fc6;
                4'hd: out_r = 16'h3fc6;
                4'he: out_r = 16'h3fc6;
                4'hf: out_r = 16'h3fc7;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3fc8;
              case (mant_lo4)
                4'h0: out_r = 16'h3fc7;
                4'h4: out_r = 16'h3fc9;
                4'h5: out_r = 16'h3fc9;
                4'h6: out_r = 16'h3fc9;
                4'h7: out_r = 16'h3fca;
                4'h8: out_r = 16'h3fca;
                4'h9: out_r = 16'h3fcb;
                4'ha: out_r = 16'h3fcb;
                4'hb: out_r = 16'h3fcb;
                4'hc: out_r = 16'h3fcc;
                4'hd: out_r = 16'h3fcc;
                4'he: out_r = 16'h3fcc;
                4'hf: out_r = 16'h3fcd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3fce;
              case (mant_lo4)
                4'h0: out_r = 16'h3fcd;
                4'h1: out_r = 16'h3fcd;
                4'h5: out_r = 16'h3fcf;
                4'h6: out_r = 16'h3fcf;
                4'h7: out_r = 16'h3fcf;
                4'h8: out_r = 16'h3fd0;
                4'h9: out_r = 16'h3fd0;
                4'ha: out_r = 16'h3fd0;
                4'hb: out_r = 16'h3fd1;
                4'hc: out_r = 16'h3fd1;
                4'hd: out_r = 16'h3fd1;
                4'he: out_r = 16'h3fd2;
                4'hf: out_r = 16'h3fd2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3fd5;
              case (mant_lo4)
                4'h0: out_r = 16'h3fd2;
                4'h1: out_r = 16'h3fd3;
                4'h2: out_r = 16'h3fd3;
                4'h3: out_r = 16'h3fd3;
                4'h4: out_r = 16'h3fd4;
                4'h5: out_r = 16'h3fd4;
                4'h6: out_r = 16'h3fd4;
                4'hb: out_r = 16'h3fd6;
                4'hc: out_r = 16'h3fd6;
                4'hd: out_r = 16'h3fd6;
                4'he: out_r = 16'h3fd7;
                4'hf: out_r = 16'h3fd7;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h3fd9;
              case (mant_lo4)
                4'h0: out_r = 16'h3fd7;
                4'h1: out_r = 16'h3fd7;
                4'h2: out_r = 16'h3fd8;
                4'h3: out_r = 16'h3fd8;
                4'h4: out_r = 16'h3fd8;
                4'h9: out_r = 16'h3fda;
                4'ha: out_r = 16'h3fda;
                4'hb: out_r = 16'h3fda;
                4'hc: out_r = 16'h3fdb;
                4'hd: out_r = 16'h3fdb;
                4'he: out_r = 16'h3fdb;
                4'hf: out_r = 16'h3fdb;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h3fdc;
              case (mant_lo4)
                4'h4: out_r = 16'h3fdd;
                4'h5: out_r = 16'h3fdd;
                4'h6: out_r = 16'h3fdd;
                4'h7: out_r = 16'h3fdd;
                4'h8: out_r = 16'h3fde;
                4'h9: out_r = 16'h3fde;
                4'ha: out_r = 16'h3fde;
                4'hb: out_r = 16'h3fdf;
                4'hc: out_r = 16'h3fdf;
                4'hd: out_r = 16'h3fdf;
                4'he: out_r = 16'h3fdf;
                4'hf: out_r = 16'h3fe0;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h3fe1;
              case (mant_lo4)
                4'h0: out_r = 16'h3fe0;
                4'h1: out_r = 16'h3fe0;
                4'h2: out_r = 16'h3fe0;
                4'h8: out_r = 16'h3fe2;
                4'h9: out_r = 16'h3fe2;
                4'ha: out_r = 16'h3fe2;
                4'hb: out_r = 16'h3fe2;
                4'hc: out_r = 16'h3fe3;
                4'hd: out_r = 16'h3fe3;
                4'he: out_r = 16'h3fe3;
                4'hf: out_r = 16'h3fe3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h3fe5;
              case (mant_lo4)
                4'h0: out_r = 16'h3fe4;
                4'h1: out_r = 16'h3fe4;
                4'h2: out_r = 16'h3fe4;
                4'h3: out_r = 16'h3fe4;
                4'h9: out_r = 16'h3fe6;
                4'ha: out_r = 16'h3fe6;
                4'hb: out_r = 16'h3fe6;
                4'hc: out_r = 16'h3fe6;
                4'hd: out_r = 16'h3fe7;
                4'he: out_r = 16'h3fe7;
                4'hf: out_r = 16'h3fe7;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h085: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h3fe8;
              case (mant_lo4)
                4'h0: out_r = 16'h3fe7;
                4'h4: out_r = 16'h3fe9;
                4'h5: out_r = 16'h3fe9;
                4'h6: out_r = 16'h3fea;
                4'h7: out_r = 16'h3fea;
                4'h8: out_r = 16'h3feb;
                4'h9: out_r = 16'h3feb;
                4'ha: out_r = 16'h3feb;
                4'hb: out_r = 16'h3fec;
                4'hc: out_r = 16'h3fec;
                4'hd: out_r = 16'h3fed;
                4'he: out_r = 16'h3fed;
                4'hf: out_r = 16'h3fed;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h3fef;
              case (mant_lo4)
                4'h0: out_r = 16'h3fee;
                4'h1: out_r = 16'h3fee;
                4'h5: out_r = 16'h3ff0;
                4'h6: out_r = 16'h3ff0;
                4'h7: out_r = 16'h3ff0;
                4'h8: out_r = 16'h3ff1;
                4'h9: out_r = 16'h3ff1;
                4'ha: out_r = 16'h3ff1;
                4'hb: out_r = 16'h3ff2;
                4'hc: out_r = 16'h3ff2;
                4'hd: out_r = 16'h3ff3;
                4'he: out_r = 16'h3ff3;
                4'hf: out_r = 16'h3ff3;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h3ff4;
              case (mant_lo4)
                4'h3: out_r = 16'h3ff5;
                4'h4: out_r = 16'h3ff5;
                4'h5: out_r = 16'h3ff5;
                4'h6: out_r = 16'h3ff6;
                4'h7: out_r = 16'h3ff6;
                4'h8: out_r = 16'h3ff6;
                4'h9: out_r = 16'h3ff7;
                4'ha: out_r = 16'h3ff7;
                4'hb: out_r = 16'h3ff7;
                4'hc: out_r = 16'h3ff8;
                4'hd: out_r = 16'h3ff8;
                4'he: out_r = 16'h3ff8;
                4'hf: out_r = 16'h3ff9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h3ffa;
              case (mant_lo4)
                4'h0: out_r = 16'h3ff9;
                4'h1: out_r = 16'h3ff9;
                4'h6: out_r = 16'h3ffb;
                4'h7: out_r = 16'h3ffb;
                4'h8: out_r = 16'h3ffb;
                4'h9: out_r = 16'h3ffc;
                4'ha: out_r = 16'h3ffc;
                4'hb: out_r = 16'h3ffc;
                4'hc: out_r = 16'h3ffd;
                4'hd: out_r = 16'h3ffd;
                4'he: out_r = 16'h3ffd;
                4'hf: out_r = 16'h3ffd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4000;
              case (mant_lo4)
                4'h0: out_r = 16'h3ffe;
                4'h1: out_r = 16'h3ffe;
                4'h2: out_r = 16'h3ffe;
                4'h3: out_r = 16'h3fff;
                4'h4: out_r = 16'h3fff;
                4'h5: out_r = 16'h3fff;
                4'h6: out_r = 16'h3fff;
                4'hc: out_r = 16'h4001;
                4'hd: out_r = 16'h4001;
                4'he: out_r = 16'h4001;
                4'hf: out_r = 16'h4001;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4002;
              case (mant_lo4)
                4'h0: out_r = 16'h4001;
                4'h1: out_r = 16'h4001;
                4'h2: out_r = 16'h4001;
                4'h3: out_r = 16'h4001;
                4'hb: out_r = 16'h4003;
                4'hc: out_r = 16'h4003;
                4'hd: out_r = 16'h4003;
                4'he: out_r = 16'h4003;
                4'hf: out_r = 16'h4003;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4004;
              case (mant_lo4)
                4'h0: out_r = 16'h4003;
                4'h1: out_r = 16'h4003;
                4'h2: out_r = 16'h4003;
                4'hc: out_r = 16'h4005;
                4'hd: out_r = 16'h4005;
                4'he: out_r = 16'h4005;
                4'hf: out_r = 16'h4005;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4006;
              case (mant_lo4)
                4'h0: out_r = 16'h4005;
                4'h1: out_r = 16'h4005;
                4'h2: out_r = 16'h4005;
                4'h3: out_r = 16'h4005;
                4'hd: out_r = 16'h4007;
                4'he: out_r = 16'h4007;
                4'hf: out_r = 16'h4007;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h086: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4008;
              case (mant_lo4)
                4'h0: out_r = 16'h4007;
                4'h1: out_r = 16'h4007;
                4'h2: out_r = 16'h4007;
                4'h8: out_r = 16'h4009;
                4'h9: out_r = 16'h4009;
                4'ha: out_r = 16'h4009;
                4'hb: out_r = 16'h4009;
                4'hc: out_r = 16'h4009;
                4'hd: out_r = 16'h400a;
                4'he: out_r = 16'h400a;
                4'hf: out_r = 16'h400a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h400b;
              case (mant_lo4)
                4'h0: out_r = 16'h400a;
                4'h1: out_r = 16'h400a;
                4'h8: out_r = 16'h400c;
                4'h9: out_r = 16'h400c;
                4'ha: out_r = 16'h400c;
                4'hb: out_r = 16'h400c;
                4'hc: out_r = 16'h400c;
                4'hd: out_r = 16'h400d;
                4'he: out_r = 16'h400d;
                4'hf: out_r = 16'h400d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h400e;
              case (mant_lo4)
                4'h0: out_r = 16'h400d;
                4'h1: out_r = 16'h400d;
                4'h2: out_r = 16'h400d;
                4'h9: out_r = 16'h400f;
                4'ha: out_r = 16'h400f;
                4'hb: out_r = 16'h400f;
                4'hc: out_r = 16'h400f;
                4'hd: out_r = 16'h400f;
                4'he: out_r = 16'h400f;
                4'hf: out_r = 16'h4010;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4010;
              case (mant_lo4)
                4'h6: out_r = 16'h4011;
                4'h7: out_r = 16'h4011;
                4'h8: out_r = 16'h4011;
                4'h9: out_r = 16'h4011;
                4'ha: out_r = 16'h4011;
                4'hb: out_r = 16'h4011;
                4'hc: out_r = 16'h4012;
                4'hd: out_r = 16'h4012;
                4'he: out_r = 16'h4012;
                4'hf: out_r = 16'h4012;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4013;
              case (mant_lo4)
                4'h0: out_r = 16'h4012;
                4'h1: out_r = 16'h4012;
                4'h2: out_r = 16'h4012;
                4'ha: out_r = 16'h4014;
                4'hb: out_r = 16'h4014;
                4'hc: out_r = 16'h4014;
                4'hd: out_r = 16'h4014;
                4'he: out_r = 16'h4014;
                4'hf: out_r = 16'h4014;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4015;
              case (mant_lo4)
                4'h0: out_r = 16'h4014;
                4'h1: out_r = 16'h4014;
                4'h9: out_r = 16'h4016;
                4'ha: out_r = 16'h4016;
                4'hb: out_r = 16'h4016;
                4'hc: out_r = 16'h4016;
                4'hd: out_r = 16'h4016;
                4'he: out_r = 16'h4016;
                4'hf: out_r = 16'h4016;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4017;
              case (mant_lo4)
                4'h0: out_r = 16'h4016;
                4'h9: out_r = 16'h4018;
                4'ha: out_r = 16'h4018;
                4'hb: out_r = 16'h4018;
                4'hc: out_r = 16'h4018;
                4'hd: out_r = 16'h4018;
                4'he: out_r = 16'h4018;
                4'hf: out_r = 16'h4018;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4019;
              case (mant_lo4)
                4'h0: out_r = 16'h4018;
                4'h1: out_r = 16'h4018;
                4'hb: out_r = 16'h401a;
                4'hc: out_r = 16'h401a;
                4'hd: out_r = 16'h401a;
                4'he: out_r = 16'h401a;
                4'hf: out_r = 16'h401a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h087: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h401b;
              case (mant_lo4)
                4'h0: out_r = 16'h401a;
                4'h1: out_r = 16'h401a;
                4'h7: out_r = 16'h401c;
                4'h8: out_r = 16'h401c;
                4'h9: out_r = 16'h401c;
                4'ha: out_r = 16'h401c;
                4'hb: out_r = 16'h401c;
                4'hc: out_r = 16'h401d;
                4'hd: out_r = 16'h401d;
                4'he: out_r = 16'h401d;
                4'hf: out_r = 16'h401d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h401f;
              case (mant_lo4)
                4'h0: out_r = 16'h401d;
                4'h1: out_r = 16'h401e;
                4'h2: out_r = 16'h401e;
                4'h3: out_r = 16'h401e;
                4'h4: out_r = 16'h401e;
                4'h5: out_r = 16'h401e;
                4'hc: out_r = 16'h4020;
                4'hd: out_r = 16'h4020;
                4'he: out_r = 16'h4020;
                4'hf: out_r = 16'h4020;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4021;
              case (mant_lo4)
                4'h0: out_r = 16'h4020;
                4'h7: out_r = 16'h4022;
                4'h8: out_r = 16'h4022;
                4'h9: out_r = 16'h4022;
                4'ha: out_r = 16'h4022;
                4'hb: out_r = 16'h4022;
                4'hc: out_r = 16'h4022;
                4'hd: out_r = 16'h4023;
                4'he: out_r = 16'h4023;
                4'hf: out_r = 16'h4023;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4024;
              case (mant_lo4)
                4'h0: out_r = 16'h4023;
                4'h1: out_r = 16'h4023;
                4'h2: out_r = 16'h4023;
                4'h3: out_r = 16'h4023;
                4'ha: out_r = 16'h4025;
                4'hb: out_r = 16'h4025;
                4'hc: out_r = 16'h4025;
                4'hd: out_r = 16'h4025;
                4'he: out_r = 16'h4025;
                4'hf: out_r = 16'h4025;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4027;
              case (mant_lo4)
                4'h0: out_r = 16'h4025;
                4'h1: out_r = 16'h4026;
                4'h2: out_r = 16'h4026;
                4'h3: out_r = 16'h4026;
                4'h4: out_r = 16'h4026;
                4'h5: out_r = 16'h4026;
                4'h6: out_r = 16'h4026;
                4'h7: out_r = 16'h4026;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4029;
              case (mant_lo4)
                4'h0: out_r = 16'h4028;
                4'h1: out_r = 16'h4028;
                4'h2: out_r = 16'h4028;
                4'h3: out_r = 16'h4028;
                4'h4: out_r = 16'h4028;
                4'h5: out_r = 16'h4028;
                4'h6: out_r = 16'h4028;
                4'hf: out_r = 16'h402a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h402b;
              case (mant_lo4)
                4'h0: out_r = 16'h402a;
                4'h1: out_r = 16'h402a;
                4'h2: out_r = 16'h402a;
                4'h3: out_r = 16'h402a;
                4'h4: out_r = 16'h402a;
                4'h5: out_r = 16'h402a;
                4'h6: out_r = 16'h402a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h402c;
              case (mant_lo4)
                4'h8: out_r = 16'h402d;
                4'h9: out_r = 16'h402d;
                4'ha: out_r = 16'h402d;
                4'hb: out_r = 16'h402d;
                4'hc: out_r = 16'h402d;
                4'hd: out_r = 16'h402d;
                4'he: out_r = 16'h402d;
                4'hf: out_r = 16'h402d;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h088: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h402e;
              case (mant_lo4)
                4'h0: out_r = 16'h402d;
                4'h6: out_r = 16'h402f;
                4'h7: out_r = 16'h402f;
                4'h8: out_r = 16'h402f;
                4'h9: out_r = 16'h402f;
                4'ha: out_r = 16'h402f;
                4'hb: out_r = 16'h4030;
                4'hc: out_r = 16'h4030;
                4'hd: out_r = 16'h4030;
                4'he: out_r = 16'h4030;
                4'hf: out_r = 16'h4030;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4033;
              case (mant_lo4)
                4'h0: out_r = 16'h4031;
                4'h1: out_r = 16'h4031;
                4'h2: out_r = 16'h4031;
                4'h3: out_r = 16'h4031;
                4'h4: out_r = 16'h4031;
                4'h5: out_r = 16'h4032;
                4'h6: out_r = 16'h4032;
                4'h7: out_r = 16'h4032;
                4'h8: out_r = 16'h4032;
                4'h9: out_r = 16'h4032;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4034;
              case (mant_lo4)
                4'h6: out_r = 16'h4035;
                4'h7: out_r = 16'h4035;
                4'h8: out_r = 16'h4035;
                4'h9: out_r = 16'h4035;
                4'ha: out_r = 16'h4035;
                4'hb: out_r = 16'h4035;
                4'hc: out_r = 16'h4036;
                4'hd: out_r = 16'h4036;
                4'he: out_r = 16'h4036;
                4'hf: out_r = 16'h4036;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4037;
              case (mant_lo4)
                4'h0: out_r = 16'h4036;
                4'h1: out_r = 16'h4036;
                4'h9: out_r = 16'h4038;
                4'ha: out_r = 16'h4038;
                4'hb: out_r = 16'h4038;
                4'hc: out_r = 16'h4038;
                4'hd: out_r = 16'h4038;
                4'he: out_r = 16'h4038;
                4'hf: out_r = 16'h4039;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h403a;
              case (mant_lo4)
                4'h0: out_r = 16'h4039;
                4'h1: out_r = 16'h4039;
                4'h2: out_r = 16'h4039;
                4'h3: out_r = 16'h4039;
                4'h4: out_r = 16'h4039;
                4'h5: out_r = 16'h4039;
                4'he: out_r = 16'h403b;
                4'hf: out_r = 16'h403b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h403c;
              case (mant_lo4)
                4'h0: out_r = 16'h403b;
                4'h1: out_r = 16'h403b;
                4'h2: out_r = 16'h403b;
                4'h3: out_r = 16'h403b;
                4'h4: out_r = 16'h403b;
                4'hd: out_r = 16'h403d;
                4'he: out_r = 16'h403d;
                4'hf: out_r = 16'h403d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h403e;
              case (mant_lo4)
                4'h0: out_r = 16'h403d;
                4'h1: out_r = 16'h403d;
                4'h2: out_r = 16'h403d;
                4'h3: out_r = 16'h403d;
                4'h4: out_r = 16'h403d;
                4'hd: out_r = 16'h403f;
                4'he: out_r = 16'h403f;
                4'hf: out_r = 16'h403f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4040;
              case (mant_lo4)
                4'h0: out_r = 16'h403f;
                4'h1: out_r = 16'h403f;
                4'h2: out_r = 16'h403f;
                4'h3: out_r = 16'h403f;
                4'h4: out_r = 16'h403f;
                4'h5: out_r = 16'h403f;
                4'hf: out_r = 16'h4041;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h089: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4042;
              case (mant_lo4)
                4'h0: out_r = 16'h4041;
                4'h1: out_r = 16'h4041;
                4'h2: out_r = 16'h4041;
                4'h3: out_r = 16'h4041;
                4'h9: out_r = 16'h4043;
                4'ha: out_r = 16'h4043;
                4'hb: out_r = 16'h4043;
                4'hc: out_r = 16'h4043;
                4'hd: out_r = 16'h4043;
                4'he: out_r = 16'h4044;
                4'hf: out_r = 16'h4044;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4045;
              case (mant_lo4)
                4'h0: out_r = 16'h4044;
                4'h1: out_r = 16'h4044;
                4'h2: out_r = 16'h4044;
                4'h9: out_r = 16'h4046;
                4'ha: out_r = 16'h4046;
                4'hb: out_r = 16'h4046;
                4'hc: out_r = 16'h4046;
                4'hd: out_r = 16'h4046;
                4'he: out_r = 16'h4047;
                4'hf: out_r = 16'h4047;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4048;
              case (mant_lo4)
                4'h0: out_r = 16'h4047;
                4'h1: out_r = 16'h4047;
                4'h2: out_r = 16'h4047;
                4'h3: out_r = 16'h4047;
                4'ha: out_r = 16'h4049;
                4'hb: out_r = 16'h4049;
                4'hc: out_r = 16'h4049;
                4'hd: out_r = 16'h4049;
                4'he: out_r = 16'h4049;
                4'hf: out_r = 16'h4049;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h404a;
              case (mant_lo4)
                4'h7: out_r = 16'h404b;
                4'h8: out_r = 16'h404b;
                4'h9: out_r = 16'h404b;
                4'ha: out_r = 16'h404b;
                4'hb: out_r = 16'h404b;
                4'hc: out_r = 16'h404b;
                4'hd: out_r = 16'h404b;
                4'he: out_r = 16'h404c;
                4'hf: out_r = 16'h404c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h404d;
              case (mant_lo4)
                4'h0: out_r = 16'h404c;
                4'h1: out_r = 16'h404c;
                4'h2: out_r = 16'h404c;
                4'h3: out_r = 16'h404c;
                4'hc: out_r = 16'h404e;
                4'hd: out_r = 16'h404e;
                4'he: out_r = 16'h404e;
                4'hf: out_r = 16'h404e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h404f;
              case (mant_lo4)
                4'h0: out_r = 16'h404e;
                4'h1: out_r = 16'h404e;
                4'h2: out_r = 16'h404e;
                4'hb: out_r = 16'h4050;
                4'hc: out_r = 16'h4050;
                4'hd: out_r = 16'h4050;
                4'he: out_r = 16'h4050;
                4'hf: out_r = 16'h4050;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4051;
              case (mant_lo4)
                4'h0: out_r = 16'h4050;
                4'h1: out_r = 16'h4050;
                4'h2: out_r = 16'h4050;
                4'hb: out_r = 16'h4052;
                4'hc: out_r = 16'h4052;
                4'hd: out_r = 16'h4052;
                4'he: out_r = 16'h4052;
                4'hf: out_r = 16'h4052;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4053;
              case (mant_lo4)
                4'h0: out_r = 16'h4052;
                4'h1: out_r = 16'h4052;
                4'h2: out_r = 16'h4052;
                4'h3: out_r = 16'h4052;
                4'hd: out_r = 16'h4054;
                4'he: out_r = 16'h4054;
                4'hf: out_r = 16'h4054;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4055;
              case (mant_lo4)
                4'h0: out_r = 16'h4054;
                4'h1: out_r = 16'h4054;
                4'h2: out_r = 16'h4054;
                4'h8: out_r = 16'h4056;
                4'h9: out_r = 16'h4056;
                4'ha: out_r = 16'h4056;
                4'hb: out_r = 16'h4056;
                4'hc: out_r = 16'h4056;
                4'hd: out_r = 16'h4057;
                4'he: out_r = 16'h4057;
                4'hf: out_r = 16'h4057;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4059;
              case (mant_lo4)
                4'h0: out_r = 16'h4057;
                4'h1: out_r = 16'h4057;
                4'h2: out_r = 16'h4058;
                4'h3: out_r = 16'h4058;
                4'h4: out_r = 16'h4058;
                4'h5: out_r = 16'h4058;
                4'h6: out_r = 16'h4058;
                4'hd: out_r = 16'h405a;
                4'he: out_r = 16'h405a;
                4'hf: out_r = 16'h405a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h405b;
              case (mant_lo4)
                4'h0: out_r = 16'h405a;
                4'h1: out_r = 16'h405a;
                4'h2: out_r = 16'h405a;
                4'h9: out_r = 16'h405c;
                4'ha: out_r = 16'h405c;
                4'hb: out_r = 16'h405c;
                4'hc: out_r = 16'h405c;
                4'hd: out_r = 16'h405c;
                4'he: out_r = 16'h405c;
                4'hf: out_r = 16'h405d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h405e;
              case (mant_lo4)
                4'h0: out_r = 16'h405d;
                4'h1: out_r = 16'h405d;
                4'h2: out_r = 16'h405d;
                4'h3: out_r = 16'h405d;
                4'h4: out_r = 16'h405d;
                4'hc: out_r = 16'h405f;
                4'hd: out_r = 16'h405f;
                4'he: out_r = 16'h405f;
                4'hf: out_r = 16'h405f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4060;
              case (mant_lo4)
                4'h0: out_r = 16'h405f;
                4'h1: out_r = 16'h405f;
                4'h2: out_r = 16'h405f;
                4'ha: out_r = 16'h4061;
                4'hb: out_r = 16'h4061;
                4'hc: out_r = 16'h4061;
                4'hd: out_r = 16'h4061;
                4'he: out_r = 16'h4061;
                4'hf: out_r = 16'h4061;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4062;
              case (mant_lo4)
                4'h0: out_r = 16'h4061;
                4'h9: out_r = 16'h4063;
                4'ha: out_r = 16'h4063;
                4'hb: out_r = 16'h4063;
                4'hc: out_r = 16'h4063;
                4'hd: out_r = 16'h4063;
                4'he: out_r = 16'h4063;
                4'hf: out_r = 16'h4063;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4064;
              case (mant_lo4)
                4'h0: out_r = 16'h4063;
                4'h9: out_r = 16'h4065;
                4'ha: out_r = 16'h4065;
                4'hb: out_r = 16'h4065;
                4'hc: out_r = 16'h4065;
                4'hd: out_r = 16'h4065;
                4'he: out_r = 16'h4065;
                4'hf: out_r = 16'h4065;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4066;
              case (mant_lo4)
                4'h0: out_r = 16'h4065;
                4'ha: out_r = 16'h4067;
                4'hb: out_r = 16'h4067;
                4'hc: out_r = 16'h4067;
                4'hd: out_r = 16'h4067;
                4'he: out_r = 16'h4067;
                4'hf: out_r = 16'h4067;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4068;
              case (mant_lo4)
                4'h0: out_r = 16'h4067;
                4'h1: out_r = 16'h4067;
                4'h7: out_r = 16'h4069;
                4'h8: out_r = 16'h4069;
                4'h9: out_r = 16'h4069;
                4'ha: out_r = 16'h4069;
                4'hb: out_r = 16'h4069;
                4'hc: out_r = 16'h406a;
                4'hd: out_r = 16'h406a;
                4'he: out_r = 16'h406a;
                4'hf: out_r = 16'h406a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h406b;
              case (mant_lo4)
                4'h0: out_r = 16'h406a;
                4'h6: out_r = 16'h406c;
                4'h7: out_r = 16'h406c;
                4'h8: out_r = 16'h406c;
                4'h9: out_r = 16'h406c;
                4'ha: out_r = 16'h406c;
                4'hb: out_r = 16'h406d;
                4'hc: out_r = 16'h406d;
                4'hd: out_r = 16'h406d;
                4'he: out_r = 16'h406d;
                4'hf: out_r = 16'h406d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h406e;
              case (mant_lo4)
                4'h0: out_r = 16'h406d;
                4'h7: out_r = 16'h406f;
                4'h8: out_r = 16'h406f;
                4'h9: out_r = 16'h406f;
                4'ha: out_r = 16'h406f;
                4'hb: out_r = 16'h406f;
                4'hc: out_r = 16'h406f;
                4'hd: out_r = 16'h4070;
                4'he: out_r = 16'h4070;
                4'hf: out_r = 16'h4070;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4071;
              case (mant_lo4)
                4'h0: out_r = 16'h4070;
                4'h1: out_r = 16'h4070;
                4'h2: out_r = 16'h4070;
                4'ha: out_r = 16'h4072;
                4'hb: out_r = 16'h4072;
                4'hc: out_r = 16'h4072;
                4'hd: out_r = 16'h4072;
                4'he: out_r = 16'h4072;
                4'hf: out_r = 16'h4072;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4073;
              case (mant_lo4)
                4'h0: out_r = 16'h4072;
                4'h8: out_r = 16'h4074;
                4'h9: out_r = 16'h4074;
                4'ha: out_r = 16'h4074;
                4'hb: out_r = 16'h4074;
                4'hc: out_r = 16'h4074;
                4'hd: out_r = 16'h4074;
                4'he: out_r = 16'h4074;
                4'hf: out_r = 16'h4075;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4076;
              case (mant_lo4)
                4'h0: out_r = 16'h4075;
                4'h1: out_r = 16'h4075;
                4'h2: out_r = 16'h4075;
                4'h3: out_r = 16'h4075;
                4'h4: out_r = 16'h4075;
                4'h5: out_r = 16'h4075;
                4'h6: out_r = 16'h4075;
                4'hf: out_r = 16'h4077;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4078;
              case (mant_lo4)
                4'h0: out_r = 16'h4077;
                4'h1: out_r = 16'h4077;
                4'h2: out_r = 16'h4077;
                4'h3: out_r = 16'h4077;
                4'h4: out_r = 16'h4077;
                4'h5: out_r = 16'h4077;
                4'h6: out_r = 16'h4077;
                4'hf: out_r = 16'h4079;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4079;
              case (mant_lo4)
                4'h8: out_r = 16'h407a;
                4'h9: out_r = 16'h407a;
                4'ha: out_r = 16'h407a;
                4'hb: out_r = 16'h407a;
                4'hc: out_r = 16'h407a;
                4'hd: out_r = 16'h407a;
                4'he: out_r = 16'h407a;
                4'hf: out_r = 16'h407a;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h407c;
              case (mant_lo4)
                4'h0: out_r = 16'h407a;
                4'h1: out_r = 16'h407b;
                4'h2: out_r = 16'h407b;
                4'h3: out_r = 16'h407b;
                4'h4: out_r = 16'h407b;
                4'ha: out_r = 16'h407d;
                4'hb: out_r = 16'h407d;
                4'hc: out_r = 16'h407d;
                4'hd: out_r = 16'h407d;
                4'he: out_r = 16'h407d;
                4'hf: out_r = 16'h407e;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4080;
              case (mant_lo4)
                4'h0: out_r = 16'h407e;
                4'h1: out_r = 16'h407e;
                4'h2: out_r = 16'h407e;
                4'h3: out_r = 16'h407e;
                4'h4: out_r = 16'h407e;
                4'h5: out_r = 16'h407f;
                4'h6: out_r = 16'h407f;
                4'h7: out_r = 16'h407f;
                4'h8: out_r = 16'h407f;
                4'h9: out_r = 16'h407f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4081;
              case (mant_lo4)
                4'h0: out_r = 16'h4080;
                4'h1: out_r = 16'h4080;
                4'hf: out_r = 16'h4082;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4082;
              case (mant_lo4)
                4'hc: out_r = 16'h4083;
                4'hd: out_r = 16'h4083;
                4'he: out_r = 16'h4083;
                4'hf: out_r = 16'h4083;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4083;
              case (mant_lo4)
                4'h9: out_r = 16'h4084;
                4'ha: out_r = 16'h4084;
                4'hb: out_r = 16'h4084;
                4'hc: out_r = 16'h4084;
                4'hd: out_r = 16'h4084;
                4'he: out_r = 16'h4084;
                4'hf: out_r = 16'h4084;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4084;
              case (mant_lo4)
                4'h8: out_r = 16'h4085;
                4'h9: out_r = 16'h4085;
                4'ha: out_r = 16'h4085;
                4'hb: out_r = 16'h4085;
                4'hc: out_r = 16'h4085;
                4'hd: out_r = 16'h4085;
                4'he: out_r = 16'h4085;
                4'hf: out_r = 16'h4085;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4085;
              case (mant_lo4)
                4'h9: out_r = 16'h4086;
                4'ha: out_r = 16'h4086;
                4'hb: out_r = 16'h4086;
                4'hc: out_r = 16'h4086;
                4'hd: out_r = 16'h4086;
                4'he: out_r = 16'h4086;
                4'hf: out_r = 16'h4086;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4086;
              case (mant_lo4)
                4'ha: out_r = 16'h4087;
                4'hb: out_r = 16'h4087;
                4'hc: out_r = 16'h4087;
                4'hd: out_r = 16'h4087;
                4'he: out_r = 16'h4087;
                4'hf: out_r = 16'h4087;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4088;
              case (mant_lo4)
                4'h0: out_r = 16'h4087;
                4'h1: out_r = 16'h4087;
                4'h2: out_r = 16'h4087;
                4'h3: out_r = 16'h4087;
                4'h4: out_r = 16'h4087;
                4'h5: out_r = 16'h4087;
                4'h6: out_r = 16'h4087;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4089;
              case (mant_lo4)
                4'h0: out_r = 16'h4088;
                4'hb: out_r = 16'h408a;
                4'hc: out_r = 16'h408a;
                4'hd: out_r = 16'h408a;
                4'he: out_r = 16'h408a;
                4'hf: out_r = 16'h408a;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h408b;
              case (mant_lo4)
                4'h0: out_r = 16'h408a;
                4'h1: out_r = 16'h408a;
                4'h2: out_r = 16'h408a;
                4'h3: out_r = 16'h408a;
                4'h4: out_r = 16'h408a;
                4'h5: out_r = 16'h408a;
                4'h6: out_r = 16'h408a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h408c;
              case (mant_lo4)
                4'h0: out_r = 16'h408b;
                4'h1: out_r = 16'h408b;
                4'h2: out_r = 16'h408b;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h408d;
              case (mant_lo4)
                4'h0: out_r = 16'h408c;
                4'hf: out_r = 16'h408e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h408e;
              case (mant_lo4)
                4'he: out_r = 16'h408f;
                4'hf: out_r = 16'h408f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h408f;
              case (mant_lo4)
                4'hf: out_r = 16'h4090;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4090;
            end
            default: begin end
          endcase
        end
        9'h08e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4091;
              case (mant_lo4)
                4'h0: out_r = 16'h4090;
                4'ha: out_r = 16'h4092;
                4'hb: out_r = 16'h4092;
                4'hc: out_r = 16'h4092;
                4'hd: out_r = 16'h4092;
                4'he: out_r = 16'h4092;
                4'hf: out_r = 16'h4092;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4093;
              case (mant_lo4)
                4'h0: out_r = 16'h4092;
                4'h1: out_r = 16'h4092;
                4'h2: out_r = 16'h4092;
                4'h3: out_r = 16'h4092;
                4'hf: out_r = 16'h4094;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4094;
              case (mant_lo4)
                4'hb: out_r = 16'h4095;
                4'hc: out_r = 16'h4095;
                4'hd: out_r = 16'h4095;
                4'he: out_r = 16'h4095;
                4'hf: out_r = 16'h4095;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4095;
              case (mant_lo4)
                4'h8: out_r = 16'h4096;
                4'h9: out_r = 16'h4096;
                4'ha: out_r = 16'h4096;
                4'hb: out_r = 16'h4096;
                4'hc: out_r = 16'h4096;
                4'hd: out_r = 16'h4096;
                4'he: out_r = 16'h4096;
                4'hf: out_r = 16'h4096;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4097;
              case (mant_lo4)
                4'h0: out_r = 16'h4096;
                4'h1: out_r = 16'h4096;
                4'h2: out_r = 16'h4096;
                4'h3: out_r = 16'h4096;
                4'h4: out_r = 16'h4096;
                4'h5: out_r = 16'h4096;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4098;
              case (mant_lo4)
                4'h0: out_r = 16'h4097;
                4'h1: out_r = 16'h4097;
                4'h2: out_r = 16'h4097;
                4'h3: out_r = 16'h4097;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4099;
              case (mant_lo4)
                4'h0: out_r = 16'h4098;
                4'h1: out_r = 16'h4098;
                4'h2: out_r = 16'h4098;
                4'h3: out_r = 16'h4098;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h409a;
              case (mant_lo4)
                4'h0: out_r = 16'h4099;
                4'h1: out_r = 16'h4099;
                4'h2: out_r = 16'h4099;
                4'h3: out_r = 16'h4099;
                4'h4: out_r = 16'h4099;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h08f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h409b;
              case (mant_lo4)
                4'h0: out_r = 16'h409a;
                4'h1: out_r = 16'h409a;
                4'h2: out_r = 16'h409a;
                4'h3: out_r = 16'h409a;
                4'he: out_r = 16'h409c;
                4'hf: out_r = 16'h409c;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h409c;
              case (mant_lo4)
                4'h8: out_r = 16'h409d;
                4'h9: out_r = 16'h409d;
                4'ha: out_r = 16'h409d;
                4'hb: out_r = 16'h409d;
                4'hc: out_r = 16'h409d;
                4'hd: out_r = 16'h409d;
                4'he: out_r = 16'h409d;
                4'hf: out_r = 16'h409d;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h409e;
              case (mant_lo4)
                4'h0: out_r = 16'h409d;
                4'h1: out_r = 16'h409d;
                4'h2: out_r = 16'h409d;
                4'h3: out_r = 16'h409d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h409f;
              case (mant_lo4)
                4'hd: out_r = 16'h40a0;
                4'he: out_r = 16'h40a0;
                4'hf: out_r = 16'h40a0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40a0;
              case (mant_lo4)
                4'hb: out_r = 16'h40a1;
                4'hc: out_r = 16'h40a1;
                4'hd: out_r = 16'h40a1;
                4'he: out_r = 16'h40a1;
                4'hf: out_r = 16'h40a1;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40a1;
              case (mant_lo4)
                4'ha: out_r = 16'h40a2;
                4'hb: out_r = 16'h40a2;
                4'hc: out_r = 16'h40a2;
                4'hd: out_r = 16'h40a2;
                4'he: out_r = 16'h40a2;
                4'hf: out_r = 16'h40a2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40a2;
              case (mant_lo4)
                4'ha: out_r = 16'h40a3;
                4'hb: out_r = 16'h40a3;
                4'hc: out_r = 16'h40a3;
                4'hd: out_r = 16'h40a3;
                4'he: out_r = 16'h40a3;
                4'hf: out_r = 16'h40a3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40a3;
              case (mant_lo4)
                4'hc: out_r = 16'h40a4;
                4'hd: out_r = 16'h40a4;
                4'he: out_r = 16'h40a4;
                4'hf: out_r = 16'h40a4;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h090: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40a5;
              case (mant_lo4)
                4'h0: out_r = 16'h40a4;
                4'h1: out_r = 16'h40a4;
                4'h2: out_r = 16'h40a4;
                4'h3: out_r = 16'h40a4;
                4'h4: out_r = 16'h40a4;
                4'h5: out_r = 16'h40a4;
                4'h6: out_r = 16'h40a4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40a6;
              case (mant_lo4)
                4'h0: out_r = 16'h40a5;
                4'h1: out_r = 16'h40a5;
                4'hc: out_r = 16'h40a7;
                4'hd: out_r = 16'h40a7;
                4'he: out_r = 16'h40a7;
                4'hf: out_r = 16'h40a7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40a7;
              case (mant_lo4)
                4'h8: out_r = 16'h40a8;
                4'h9: out_r = 16'h40a8;
                4'ha: out_r = 16'h40a8;
                4'hb: out_r = 16'h40a8;
                4'hc: out_r = 16'h40a8;
                4'hd: out_r = 16'h40a8;
                4'he: out_r = 16'h40a8;
                4'hf: out_r = 16'h40a8;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40a9;
              case (mant_lo4)
                4'h0: out_r = 16'h40a8;
                4'h1: out_r = 16'h40a8;
                4'h2: out_r = 16'h40a8;
                4'h3: out_r = 16'h40a8;
                4'h4: out_r = 16'h40a8;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40aa;
              case (mant_lo4)
                4'h0: out_r = 16'h40a9;
                4'h1: out_r = 16'h40a9;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40ab;
            end
            3'h6: begin
              out_r = 16'h40ac;
            end
            3'h7: begin
              out_r = 16'h40ad;
              case (mant_lo4)
                4'h0: out_r = 16'h40ac;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h091: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40ae;
              case (mant_lo4)
                4'h0: out_r = 16'h40ad;
                4'hb: out_r = 16'h40af;
                4'hc: out_r = 16'h40af;
                4'hd: out_r = 16'h40af;
                4'he: out_r = 16'h40af;
                4'hf: out_r = 16'h40af;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40b0;
              case (mant_lo4)
                4'h0: out_r = 16'h40af;
                4'h1: out_r = 16'h40af;
                4'h2: out_r = 16'h40af;
                4'h3: out_r = 16'h40af;
                4'h4: out_r = 16'h40af;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40b1;
              case (mant_lo4)
                4'h0: out_r = 16'h40b0;
                4'hd: out_r = 16'h40b2;
                4'he: out_r = 16'h40b2;
                4'hf: out_r = 16'h40b2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40b2;
              case (mant_lo4)
                4'h9: out_r = 16'h40b3;
                4'ha: out_r = 16'h40b3;
                4'hb: out_r = 16'h40b3;
                4'hc: out_r = 16'h40b3;
                4'hd: out_r = 16'h40b3;
                4'he: out_r = 16'h40b3;
                4'hf: out_r = 16'h40b3;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40b4;
              case (mant_lo4)
                4'h0: out_r = 16'h40b3;
                4'h1: out_r = 16'h40b3;
                4'h2: out_r = 16'h40b3;
                4'h3: out_r = 16'h40b3;
                4'h4: out_r = 16'h40b3;
                4'h5: out_r = 16'h40b3;
                4'h6: out_r = 16'h40b3;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40b5;
              case (mant_lo4)
                4'h0: out_r = 16'h40b4;
                4'h1: out_r = 16'h40b4;
                4'h2: out_r = 16'h40b4;
                4'h3: out_r = 16'h40b4;
                4'h4: out_r = 16'h40b4;
                4'h5: out_r = 16'h40b4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40b6;
              case (mant_lo4)
                4'h0: out_r = 16'h40b5;
                4'h1: out_r = 16'h40b5;
                4'h2: out_r = 16'h40b5;
                4'h3: out_r = 16'h40b5;
                4'h4: out_r = 16'h40b5;
                4'h5: out_r = 16'h40b5;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40b7;
              case (mant_lo4)
                4'h0: out_r = 16'h40b6;
                4'h1: out_r = 16'h40b6;
                4'h2: out_r = 16'h40b6;
                4'h3: out_r = 16'h40b6;
                4'h4: out_r = 16'h40b6;
                4'h5: out_r = 16'h40b6;
                4'h6: out_r = 16'h40b6;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h092: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40b8;
              case (mant_lo4)
                4'h0: out_r = 16'h40b7;
                4'h1: out_r = 16'h40b7;
                4'h2: out_r = 16'h40b7;
                4'h3: out_r = 16'h40b7;
                4'h4: out_r = 16'h40b7;
                4'hf: out_r = 16'h40b9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40b9;
              case (mant_lo4)
                4'h9: out_r = 16'h40ba;
                4'ha: out_r = 16'h40ba;
                4'hb: out_r = 16'h40ba;
                4'hc: out_r = 16'h40ba;
                4'hd: out_r = 16'h40ba;
                4'he: out_r = 16'h40ba;
                4'hf: out_r = 16'h40ba;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40bb;
              case (mant_lo4)
                4'h0: out_r = 16'h40ba;
                4'h1: out_r = 16'h40ba;
                4'h2: out_r = 16'h40ba;
                4'h3: out_r = 16'h40ba;
                4'h4: out_r = 16'h40ba;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40bc;
              case (mant_lo4)
                4'h0: out_r = 16'h40bb;
                4'he: out_r = 16'h40bd;
                4'hf: out_r = 16'h40bd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40bd;
              case (mant_lo4)
                4'hc: out_r = 16'h40be;
                4'hd: out_r = 16'h40be;
                4'he: out_r = 16'h40be;
                4'hf: out_r = 16'h40be;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40be;
              case (mant_lo4)
                4'hc: out_r = 16'h40bf;
                4'hd: out_r = 16'h40bf;
                4'he: out_r = 16'h40bf;
                4'hf: out_r = 16'h40bf;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40bf;
              case (mant_lo4)
                4'hc: out_r = 16'h40c0;
                4'hd: out_r = 16'h40c0;
                4'he: out_r = 16'h40c0;
                4'hf: out_r = 16'h40c0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40c0;
              case (mant_lo4)
                4'he: out_r = 16'h40c1;
                4'hf: out_r = 16'h40c1;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h093: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40c1;
              case (mant_lo4)
                4'h8: out_r = 16'h40c2;
                4'h9: out_r = 16'h40c2;
                4'ha: out_r = 16'h40c2;
                4'hb: out_r = 16'h40c2;
                4'hc: out_r = 16'h40c2;
                4'hd: out_r = 16'h40c2;
                4'he: out_r = 16'h40c2;
                4'hf: out_r = 16'h40c2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40c3;
              case (mant_lo4)
                4'h0: out_r = 16'h40c2;
                4'h1: out_r = 16'h40c2;
                4'h2: out_r = 16'h40c2;
                4'he: out_r = 16'h40c4;
                4'hf: out_r = 16'h40c4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40c4;
              case (mant_lo4)
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
            3'h3: begin
              out_r = 16'h40c6;
              case (mant_lo4)
                4'h0: out_r = 16'h40c5;
                4'h1: out_r = 16'h40c5;
                4'h2: out_r = 16'h40c5;
                4'h3: out_r = 16'h40c5;
                4'h4: out_r = 16'h40c5;
                4'h5: out_r = 16'h40c5;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40c7;
              case (mant_lo4)
                4'h0: out_r = 16'h40c6;
                4'h1: out_r = 16'h40c6;
                4'h2: out_r = 16'h40c6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40c8;
              case (mant_lo4)
                4'h0: out_r = 16'h40c7;
                4'h1: out_r = 16'h40c7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40c9;
              case (mant_lo4)
                4'h0: out_r = 16'h40c8;
                4'h1: out_r = 16'h40c8;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40ca;
              case (mant_lo4)
                4'h0: out_r = 16'h40c9;
                4'h1: out_r = 16'h40c9;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h094: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40cb;
              case (mant_lo4)
                4'h0: out_r = 16'h40ca;
                4'h1: out_r = 16'h40ca;
                4'hc: out_r = 16'h40cc;
                4'hd: out_r = 16'h40cc;
                4'he: out_r = 16'h40cc;
                4'hf: out_r = 16'h40cc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40cd;
              case (mant_lo4)
                4'h0: out_r = 16'h40cc;
                4'h1: out_r = 16'h40cc;
                4'h2: out_r = 16'h40cc;
                4'h3: out_r = 16'h40cc;
                4'h4: out_r = 16'h40cc;
                4'h5: out_r = 16'h40cc;
                4'h6: out_r = 16'h40cc;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40ce;
              case (mant_lo4)
                4'h0: out_r = 16'h40cd;
                4'h1: out_r = 16'h40cd;
                4'he: out_r = 16'h40cf;
                4'hf: out_r = 16'h40cf;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40cf;
              case (mant_lo4)
                4'hb: out_r = 16'h40d0;
                4'hc: out_r = 16'h40d0;
                4'hd: out_r = 16'h40d0;
                4'he: out_r = 16'h40d0;
                4'hf: out_r = 16'h40d0;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40d0;
              case (mant_lo4)
                4'h9: out_r = 16'h40d1;
                4'ha: out_r = 16'h40d1;
                4'hb: out_r = 16'h40d1;
                4'hc: out_r = 16'h40d1;
                4'hd: out_r = 16'h40d1;
                4'he: out_r = 16'h40d1;
                4'hf: out_r = 16'h40d1;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40d1;
              case (mant_lo4)
                4'h8: out_r = 16'h40d2;
                4'h9: out_r = 16'h40d2;
                4'ha: out_r = 16'h40d2;
                4'hb: out_r = 16'h40d2;
                4'hc: out_r = 16'h40d2;
                4'hd: out_r = 16'h40d2;
                4'he: out_r = 16'h40d2;
                4'hf: out_r = 16'h40d2;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40d2;
              case (mant_lo4)
                4'h8: out_r = 16'h40d3;
                4'h9: out_r = 16'h40d3;
                4'ha: out_r = 16'h40d3;
                4'hb: out_r = 16'h40d3;
                4'hc: out_r = 16'h40d3;
                4'hd: out_r = 16'h40d3;
                4'he: out_r = 16'h40d3;
                4'hf: out_r = 16'h40d3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40d3;
              case (mant_lo4)
                4'h9: out_r = 16'h40d4;
                4'ha: out_r = 16'h40d4;
                4'hb: out_r = 16'h40d4;
                4'hc: out_r = 16'h40d4;
                4'hd: out_r = 16'h40d4;
                4'he: out_r = 16'h40d4;
                4'hf: out_r = 16'h40d4;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h095: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40d5;
              case (mant_lo4)
                4'h0: out_r = 16'h40d4;
                4'h1: out_r = 16'h40d4;
                4'h2: out_r = 16'h40d4;
                4'h3: out_r = 16'h40d4;
                4'h4: out_r = 16'h40d4;
                4'h5: out_r = 16'h40d4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40d6;
              case (mant_lo4)
                4'hb: out_r = 16'h40d7;
                4'hc: out_r = 16'h40d7;
                4'hd: out_r = 16'h40d7;
                4'he: out_r = 16'h40d7;
                4'hf: out_r = 16'h40d7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40d8;
              case (mant_lo4)
                4'h0: out_r = 16'h40d7;
                4'h1: out_r = 16'h40d7;
                4'h2: out_r = 16'h40d7;
                4'h3: out_r = 16'h40d7;
                4'h4: out_r = 16'h40d7;
                4'h5: out_r = 16'h40d7;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40d9;
              case (mant_lo4)
                4'h0: out_r = 16'h40d8;
                4'h1: out_r = 16'h40d8;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40da;
              case (mant_lo4)
                4'he: out_r = 16'h40db;
                4'hf: out_r = 16'h40db;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40db;
              case (mant_lo4)
                4'hd: out_r = 16'h40dc;
                4'he: out_r = 16'h40dc;
                4'hf: out_r = 16'h40dc;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40dc;
              case (mant_lo4)
                4'he: out_r = 16'h40dd;
                4'hf: out_r = 16'h40dd;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40dd;
              case (mant_lo4)
                4'hf: out_r = 16'h40de;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h096: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40de;
              case (mant_lo4)
                4'h9: out_r = 16'h40df;
                4'ha: out_r = 16'h40df;
                4'hb: out_r = 16'h40df;
                4'hc: out_r = 16'h40df;
                4'hd: out_r = 16'h40df;
                4'he: out_r = 16'h40df;
                4'hf: out_r = 16'h40df;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40e0;
              case (mant_lo4)
                4'h0: out_r = 16'h40df;
                4'h1: out_r = 16'h40df;
                4'h2: out_r = 16'h40df;
                4'h3: out_r = 16'h40df;
                4'hf: out_r = 16'h40e1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40e1;
              case (mant_lo4)
                4'ha: out_r = 16'h40e2;
                4'hb: out_r = 16'h40e2;
                4'hc: out_r = 16'h40e2;
                4'hd: out_r = 16'h40e2;
                4'he: out_r = 16'h40e2;
                4'hf: out_r = 16'h40e2;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40e3;
              case (mant_lo4)
                4'h0: out_r = 16'h40e2;
                4'h1: out_r = 16'h40e2;
                4'h2: out_r = 16'h40e2;
                4'h3: out_r = 16'h40e2;
                4'h4: out_r = 16'h40e2;
                4'h5: out_r = 16'h40e2;
                4'h6: out_r = 16'h40e2;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40e4;
              case (mant_lo4)
                4'h0: out_r = 16'h40e3;
                4'h1: out_r = 16'h40e3;
                4'h2: out_r = 16'h40e3;
                4'h3: out_r = 16'h40e3;
                4'h4: out_r = 16'h40e3;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40e5;
              case (mant_lo4)
                4'h0: out_r = 16'h40e4;
                4'h1: out_r = 16'h40e4;
                4'h2: out_r = 16'h40e4;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40e6;
              case (mant_lo4)
                4'h0: out_r = 16'h40e5;
                4'h1: out_r = 16'h40e5;
                4'h2: out_r = 16'h40e5;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40e7;
              case (mant_lo4)
                4'h0: out_r = 16'h40e6;
                4'h1: out_r = 16'h40e6;
                4'h2: out_r = 16'h40e6;
                4'h3: out_r = 16'h40e6;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h097: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40e8;
              case (mant_lo4)
                4'h0: out_r = 16'h40e7;
                4'h1: out_r = 16'h40e7;
                4'h2: out_r = 16'h40e7;
                4'hd: out_r = 16'h40e9;
                4'he: out_r = 16'h40e9;
                4'hf: out_r = 16'h40e9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40e9;
              case (mant_lo4)
                4'h8: out_r = 16'h40ea;
                4'h9: out_r = 16'h40ea;
                4'ha: out_r = 16'h40ea;
                4'hb: out_r = 16'h40ea;
                4'hc: out_r = 16'h40ea;
                4'hd: out_r = 16'h40ea;
                4'he: out_r = 16'h40ea;
                4'hf: out_r = 16'h40ea;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40eb;
              case (mant_lo4)
                4'h0: out_r = 16'h40ea;
                4'h1: out_r = 16'h40ea;
                4'h2: out_r = 16'h40ea;
                4'hf: out_r = 16'h40ec;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40ec;
              case (mant_lo4)
                4'hc: out_r = 16'h40ed;
                4'hd: out_r = 16'h40ed;
                4'he: out_r = 16'h40ed;
                4'hf: out_r = 16'h40ed;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40ed;
              case (mant_lo4)
                4'ha: out_r = 16'h40ee;
                4'hb: out_r = 16'h40ee;
                4'hc: out_r = 16'h40ee;
                4'hd: out_r = 16'h40ee;
                4'he: out_r = 16'h40ee;
                4'hf: out_r = 16'h40ee;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40ee;
              case (mant_lo4)
                4'h9: out_r = 16'h40ef;
                4'ha: out_r = 16'h40ef;
                4'hb: out_r = 16'h40ef;
                4'hc: out_r = 16'h40ef;
                4'hd: out_r = 16'h40ef;
                4'he: out_r = 16'h40ef;
                4'hf: out_r = 16'h40ef;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40ef;
              case (mant_lo4)
                4'h9: out_r = 16'h40f0;
                4'ha: out_r = 16'h40f0;
                4'hb: out_r = 16'h40f0;
                4'hc: out_r = 16'h40f0;
                4'hd: out_r = 16'h40f0;
                4'he: out_r = 16'h40f0;
                4'hf: out_r = 16'h40f0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40f0;
              case (mant_lo4)
                4'hb: out_r = 16'h40f1;
                4'hc: out_r = 16'h40f1;
                4'hd: out_r = 16'h40f1;
                4'he: out_r = 16'h40f1;
                4'hf: out_r = 16'h40f1;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h098: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40f2;
              case (mant_lo4)
                4'h0: out_r = 16'h40f1;
                4'h1: out_r = 16'h40f1;
                4'h2: out_r = 16'h40f1;
                4'h3: out_r = 16'h40f1;
                4'h4: out_r = 16'h40f1;
                4'h5: out_r = 16'h40f1;
                4'h6: out_r = 16'h40f1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40f3;
              case (mant_lo4)
                4'h0: out_r = 16'h40f2;
                4'hc: out_r = 16'h40f4;
                4'hd: out_r = 16'h40f4;
                4'he: out_r = 16'h40f4;
                4'hf: out_r = 16'h40f4;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40f5;
              case (mant_lo4)
                4'h0: out_r = 16'h40f4;
                4'h1: out_r = 16'h40f4;
                4'h2: out_r = 16'h40f4;
                4'h3: out_r = 16'h40f4;
                4'h4: out_r = 16'h40f4;
                4'h5: out_r = 16'h40f4;
                4'h6: out_r = 16'h40f4;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40f6;
              case (mant_lo4)
                4'h0: out_r = 16'h40f5;
                4'h1: out_r = 16'h40f5;
                4'h2: out_r = 16'h40f5;
                4'h3: out_r = 16'h40f5;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h40f7;
              case (mant_lo4)
                4'h0: out_r = 16'h40f6;
                4'hf: out_r = 16'h40f8;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h40f8;
              case (mant_lo4)
                4'hf: out_r = 16'h40f9;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h40f9;
              case (mant_lo4)
                4'hf: out_r = 16'h40fa;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h40fa;
            end
            default: begin end
          endcase
        end
        9'h099: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h40fb;
              case (mant_lo4)
                4'h0: out_r = 16'h40fa;
                4'ha: out_r = 16'h40fc;
                4'hb: out_r = 16'h40fc;
                4'hc: out_r = 16'h40fc;
                4'hd: out_r = 16'h40fc;
                4'he: out_r = 16'h40fc;
                4'hf: out_r = 16'h40fc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h40fd;
              case (mant_lo4)
                4'h0: out_r = 16'h40fc;
                4'h1: out_r = 16'h40fc;
                4'h2: out_r = 16'h40fc;
                4'h3: out_r = 16'h40fc;
                4'h4: out_r = 16'h40fc;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h40fe;
              case (mant_lo4)
                4'hc: out_r = 16'h40ff;
                4'hd: out_r = 16'h40ff;
                4'he: out_r = 16'h40ff;
                4'hf: out_r = 16'h40ff;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h40ff;
              case (mant_lo4)
                4'h8: out_r = 16'h4100;
                4'h9: out_r = 16'h4100;
                4'ha: out_r = 16'h4100;
                4'hb: out_r = 16'h4100;
                4'hc: out_r = 16'h4100;
                4'hd: out_r = 16'h4100;
                4'he: out_r = 16'h4100;
                4'hf: out_r = 16'h4100;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4100;
              case (mant_lo4)
                4'hd: out_r = 16'h4101;
                4'he: out_r = 16'h4101;
                4'hf: out_r = 16'h4101;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4101;
            end
            3'h6: begin
              out_r = 16'h4101;
              case (mant_lo4)
                4'hd: out_r = 16'h4102;
                4'he: out_r = 16'h4102;
                4'hf: out_r = 16'h4102;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4102;
            end
            default: begin end
          endcase
        end
        9'h09a: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4102;
              case (mant_lo4)
                4'h9: out_r = 16'h4103;
                4'ha: out_r = 16'h4103;
                4'hb: out_r = 16'h4103;
                4'hc: out_r = 16'h4103;
                4'hd: out_r = 16'h4103;
                4'he: out_r = 16'h4103;
                4'hf: out_r = 16'h4103;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4103;
              case (mant_lo4)
                4'he: out_r = 16'h4104;
                4'hf: out_r = 16'h4104;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4104;
            end
            3'h3: begin
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
            3'h4: begin
              out_r = 16'h4105;
            end
            3'h5: begin
              out_r = 16'h4106;
              case (mant_lo4)
                4'h0: out_r = 16'h4105;
                4'h1: out_r = 16'h4105;
                4'h2: out_r = 16'h4105;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4106;
            end
            3'h7: begin
              out_r = 16'h4107;
              case (mant_lo4)
                4'h0: out_r = 16'h4106;
                4'h1: out_r = 16'h4106;
                4'h2: out_r = 16'h4106;
                4'h3: out_r = 16'h4106;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h09b: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4107;
              case (mant_lo4)
                4'hd: out_r = 16'h4108;
                4'he: out_r = 16'h4108;
                4'hf: out_r = 16'h4108;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4108;
            end
            3'h2: begin
              out_r = 16'h4109;
              case (mant_lo4)
                4'h0: out_r = 16'h4108;
                4'h1: out_r = 16'h4108;
                4'h2: out_r = 16'h4108;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4109;
              case (mant_lo4)
                4'hc: out_r = 16'h410a;
                4'hd: out_r = 16'h410a;
                4'he: out_r = 16'h410a;
                4'hf: out_r = 16'h410a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h410a;
            end
            3'h5: begin
              out_r = 16'h410a;
              case (mant_lo4)
                4'h9: out_r = 16'h410b;
                4'ha: out_r = 16'h410b;
                4'hb: out_r = 16'h410b;
                4'hc: out_r = 16'h410b;
                4'hd: out_r = 16'h410b;
                4'he: out_r = 16'h410b;
                4'hf: out_r = 16'h410b;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h410b;
            end
            3'h7: begin
              out_r = 16'h410b;
              case (mant_lo4)
                4'ha: out_r = 16'h410c;
                4'hb: out_r = 16'h410c;
                4'hc: out_r = 16'h410c;
                4'hd: out_r = 16'h410c;
                4'he: out_r = 16'h410c;
                4'hf: out_r = 16'h410c;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h09c: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h410c;
            end
            3'h1: begin
              out_r = 16'h410d;
              case (mant_lo4)
                4'h0: out_r = 16'h410c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h410e;
              case (mant_lo4)
                4'h0: out_r = 16'h410d;
                4'h1: out_r = 16'h410d;
                4'h2: out_r = 16'h410d;
                4'h3: out_r = 16'h410d;
                4'h4: out_r = 16'h410d;
                4'h5: out_r = 16'h410d;
                4'h6: out_r = 16'h410d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h410e;
            end
            3'h4: begin
              out_r = 16'h410f;
              case (mant_lo4)
                4'h0: out_r = 16'h410e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h410f;
              case (mant_lo4)
                4'he: out_r = 16'h4110;
                4'hf: out_r = 16'h4110;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4110;
            end
            3'h7: begin
              out_r = 16'h4110;
            end
            default: begin end
          endcase
        end
        9'h09d: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4111;
              case (mant_lo4)
                4'h0: out_r = 16'h4110;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4112;
              case (mant_lo4)
                4'h0: out_r = 16'h4111;
                4'h1: out_r = 16'h4111;
                4'h2: out_r = 16'h4111;
                4'h3: out_r = 16'h4111;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4112;
              case (mant_lo4)
                4'hb: out_r = 16'h4113;
                4'hc: out_r = 16'h4113;
                4'hd: out_r = 16'h4113;
                4'he: out_r = 16'h4113;
                4'hf: out_r = 16'h4113;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4113;
            end
            3'h4: begin
              out_r = 16'h4114;
              case (mant_lo4)
                4'h0: out_r = 16'h4113;
                4'h1: out_r = 16'h4113;
                4'h2: out_r = 16'h4113;
                4'h3: out_r = 16'h4113;
                4'h4: out_r = 16'h4113;
                4'h5: out_r = 16'h4113;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4114;
            end
            3'h6: begin
              out_r = 16'h4115;
              case (mant_lo4)
                4'h0: out_r = 16'h4114;
                4'h1: out_r = 16'h4114;
                4'h2: out_r = 16'h4114;
                4'h3: out_r = 16'h4114;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4115;
            end
            default: begin end
          endcase
        end
        9'h09e: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4116;
              case (mant_lo4)
                4'h0: out_r = 16'h4115;
                4'h1: out_r = 16'h4115;
                4'h2: out_r = 16'h4115;
                4'h3: out_r = 16'h4115;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4116;
              case (mant_lo4)
                4'h8: out_r = 16'h4117;
                4'h9: out_r = 16'h4117;
                4'ha: out_r = 16'h4117;
                4'hb: out_r = 16'h4117;
                4'hc: out_r = 16'h4117;
                4'hd: out_r = 16'h4117;
                4'he: out_r = 16'h4117;
                4'hf: out_r = 16'h4117;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4117;
            end
            3'h3: begin
              out_r = 16'h4118;
            end
            3'h4: begin
              out_r = 16'h4118;
              case (mant_lo4)
                4'hb: out_r = 16'h4119;
                4'hc: out_r = 16'h4119;
                4'hd: out_r = 16'h4119;
                4'he: out_r = 16'h4119;
                4'hf: out_r = 16'h4119;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4119;
            end
            3'h6: begin
              out_r = 16'h4119;
              case (mant_lo4)
                4'ha: out_r = 16'h411a;
                4'hb: out_r = 16'h411a;
                4'hc: out_r = 16'h411a;
                4'hd: out_r = 16'h411a;
                4'he: out_r = 16'h411a;
                4'hf: out_r = 16'h411a;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h411a;
            end
            default: begin end
          endcase
        end
        9'h09f: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h411a;
              case (mant_lo4)
                4'h8: out_r = 16'h411b;
                4'h9: out_r = 16'h411b;
                4'ha: out_r = 16'h411b;
                4'hb: out_r = 16'h411b;
                4'hc: out_r = 16'h411b;
                4'hd: out_r = 16'h411b;
                4'he: out_r = 16'h411b;
                4'hf: out_r = 16'h411b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h411b;
              case (mant_lo4)
                4'hc: out_r = 16'h411c;
                4'hd: out_r = 16'h411c;
                4'he: out_r = 16'h411c;
                4'hf: out_r = 16'h411c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h411c;
            end
            3'h3: begin
              out_r = 16'h411d;
              case (mant_lo4)
                4'h0: out_r = 16'h411c;
                4'h1: out_r = 16'h411c;
                4'h2: out_r = 16'h411c;
                4'h3: out_r = 16'h411c;
                4'h4: out_r = 16'h411c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h411d;
            end
            3'h5: begin
              out_r = 16'h411e;
            end
            3'h6: begin
              out_r = 16'h411e;
            end
            3'h7: begin
              out_r = 16'h411f;
              case (mant_lo4)
                4'h0: out_r = 16'h411e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h411f;
              case (mant_lo4)
                4'hb: out_r = 16'h4120;
                4'hc: out_r = 16'h4120;
                4'hd: out_r = 16'h4120;
                4'he: out_r = 16'h4120;
                4'hf: out_r = 16'h4120;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4120;
            end
            3'h2: begin
              out_r = 16'h4121;
              case (mant_lo4)
                4'h0: out_r = 16'h4120;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4121;
              case (mant_lo4)
                4'h9: out_r = 16'h4122;
                4'ha: out_r = 16'h4122;
                4'hb: out_r = 16'h4122;
                4'hc: out_r = 16'h4122;
                4'hd: out_r = 16'h4122;
                4'he: out_r = 16'h4122;
                4'hf: out_r = 16'h4122;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4122;
            end
            3'h5: begin
              out_r = 16'h4123;
              case (mant_lo4)
                4'h0: out_r = 16'h4122;
                4'h1: out_r = 16'h4122;
                4'h2: out_r = 16'h4122;
                4'h3: out_r = 16'h4122;
                4'h4: out_r = 16'h4122;
                4'h5: out_r = 16'h4122;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4123;
            end
            3'h7: begin
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
            default: begin end
          endcase
        end
        9'h0a1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4124;
              case (mant_lo4)
                4'hf: out_r = 16'h4125;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4125;
            end
            3'h2: begin
              out_r = 16'h4126;
              case (mant_lo4)
                4'h0: out_r = 16'h4125;
                4'h1: out_r = 16'h4125;
                4'h2: out_r = 16'h4125;
                4'h3: out_r = 16'h4125;
                4'h4: out_r = 16'h4125;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4126;
              case (mant_lo4)
                4'he: out_r = 16'h4127;
                4'hf: out_r = 16'h4127;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4127;
            end
            3'h5: begin
              out_r = 16'h4127;
              case (mant_lo4)
                4'hc: out_r = 16'h4128;
                4'hd: out_r = 16'h4128;
                4'he: out_r = 16'h4128;
                4'hf: out_r = 16'h4128;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4128;
            end
            3'h7: begin
              out_r = 16'h4128;
              case (mant_lo4)
                4'he: out_r = 16'h4129;
                4'hf: out_r = 16'h4129;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4129;
            end
            3'h1: begin
              out_r = 16'h412a;
              case (mant_lo4)
                4'h0: out_r = 16'h4129;
                4'h1: out_r = 16'h4129;
                4'h2: out_r = 16'h4129;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h412a;
              case (mant_lo4)
                4'h9: out_r = 16'h412b;
                4'ha: out_r = 16'h412b;
                4'hb: out_r = 16'h412b;
                4'hc: out_r = 16'h412b;
                4'hd: out_r = 16'h412b;
                4'he: out_r = 16'h412b;
                4'hf: out_r = 16'h412b;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h412b;
            end
            3'h4: begin
              out_r = 16'h412c;
              case (mant_lo4)
                4'h0: out_r = 16'h412b;
                4'h1: out_r = 16'h412b;
                4'h2: out_r = 16'h412b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h412c;
            end
            3'h6: begin
              out_r = 16'h412d;
              case (mant_lo4)
                4'h0: out_r = 16'h412c;
                4'h1: out_r = 16'h412c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h412d;
            end
            default: begin end
          endcase
        end
        9'h0a3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h412e;
              case (mant_lo4)
                4'h0: out_r = 16'h412d;
                4'h1: out_r = 16'h412d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h412f;
              case (mant_lo4)
                4'h0: out_r = 16'h412e;
                4'h1: out_r = 16'h412e;
                4'h2: out_r = 16'h412e;
                4'h3: out_r = 16'h412e;
                4'h4: out_r = 16'h412e;
                4'h5: out_r = 16'h412e;
                4'h6: out_r = 16'h412e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h412f;
              case (mant_lo4)
                4'he: out_r = 16'h4130;
                4'hf: out_r = 16'h4130;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4130;
            end
            3'h4: begin
              out_r = 16'h4130;
              case (mant_lo4)
                4'h9: out_r = 16'h4131;
                4'ha: out_r = 16'h4131;
                4'hb: out_r = 16'h4131;
                4'hc: out_r = 16'h4131;
                4'hd: out_r = 16'h4131;
                4'he: out_r = 16'h4131;
                4'hf: out_r = 16'h4131;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4131;
            end
            3'h6: begin
              out_r = 16'h4131;
              case (mant_lo4)
                4'h8: out_r = 16'h4132;
                4'h9: out_r = 16'h4132;
                4'ha: out_r = 16'h4132;
                4'hb: out_r = 16'h4132;
                4'hc: out_r = 16'h4132;
                4'hd: out_r = 16'h4132;
                4'he: out_r = 16'h4132;
                4'hf: out_r = 16'h4132;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4132;
            end
            default: begin end
          endcase
        end
        9'h0a4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4133;
              case (mant_lo4)
                4'h0: out_r = 16'h4132;
                4'h1: out_r = 16'h4132;
                4'h2: out_r = 16'h4132;
                4'h3: out_r = 16'h4132;
                4'h4: out_r = 16'h4132;
                4'h5: out_r = 16'h4132;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4133;
              case (mant_lo4)
                4'hb: out_r = 16'h4134;
                4'hc: out_r = 16'h4134;
                4'hd: out_r = 16'h4134;
                4'he: out_r = 16'h4134;
                4'hf: out_r = 16'h4134;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4134;
            end
            3'h3: begin
              out_r = 16'h4135;
              case (mant_lo4)
                4'h0: out_r = 16'h4134;
                4'h1: out_r = 16'h4134;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4135;
              case (mant_lo4)
                4'he: out_r = 16'h4136;
                4'hf: out_r = 16'h4136;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4136;
            end
            3'h6: begin
              out_r = 16'h4136;
              case (mant_lo4)
                4'he: out_r = 16'h4137;
                4'hf: out_r = 16'h4137;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4137;
            end
            default: begin end
          endcase
        end
        9'h0a5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4137;
              case (mant_lo4)
                4'ha: out_r = 16'h4138;
                4'hb: out_r = 16'h4138;
                4'hc: out_r = 16'h4138;
                4'hd: out_r = 16'h4138;
                4'he: out_r = 16'h4138;
                4'hf: out_r = 16'h4138;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4138;
              case (mant_lo4)
                4'hf: out_r = 16'h4139;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4139;
            end
            3'h3: begin
              out_r = 16'h413a;
              case (mant_lo4)
                4'h0: out_r = 16'h4139;
                4'h1: out_r = 16'h4139;
                4'h2: out_r = 16'h4139;
                4'h3: out_r = 16'h4139;
                4'h4: out_r = 16'h4139;
                4'h5: out_r = 16'h4139;
                4'h6: out_r = 16'h4139;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h413a;
            end
            3'h5: begin
              out_r = 16'h413b;
              case (mant_lo4)
                4'h0: out_r = 16'h413a;
                4'h1: out_r = 16'h413a;
                4'h2: out_r = 16'h413a;
                4'h3: out_r = 16'h413a;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h413b;
            end
            3'h7: begin
              out_r = 16'h413c;
              case (mant_lo4)
                4'h0: out_r = 16'h413b;
                4'h1: out_r = 16'h413b;
                4'h2: out_r = 16'h413b;
                4'h3: out_r = 16'h413b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h413c;
              case (mant_lo4)
                4'hd: out_r = 16'h413d;
                4'he: out_r = 16'h413d;
                4'hf: out_r = 16'h413d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h413d;
            end
            3'h2: begin
              out_r = 16'h413e;
              case (mant_lo4)
                4'h0: out_r = 16'h413d;
                4'h1: out_r = 16'h413d;
                4'h2: out_r = 16'h413d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h413e;
              case (mant_lo4)
                4'hc: out_r = 16'h413f;
                4'hd: out_r = 16'h413f;
                4'he: out_r = 16'h413f;
                4'hf: out_r = 16'h413f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h413f;
            end
            3'h5: begin
              out_r = 16'h413f;
              case (mant_lo4)
                4'h9: out_r = 16'h4140;
                4'ha: out_r = 16'h4140;
                4'hb: out_r = 16'h4140;
                4'hc: out_r = 16'h4140;
                4'hd: out_r = 16'h4140;
                4'he: out_r = 16'h4140;
                4'hf: out_r = 16'h4140;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4140;
            end
            3'h7: begin
              out_r = 16'h4140;
              case (mant_lo4)
                4'hb: out_r = 16'h4141;
                4'hc: out_r = 16'h4141;
                4'hd: out_r = 16'h4141;
                4'he: out_r = 16'h4141;
                4'hf: out_r = 16'h4141;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0a7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4141;
            end
            3'h1: begin
              out_r = 16'h4142;
              case (mant_lo4)
                4'h0: out_r = 16'h4141;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4143;
              case (mant_lo4)
                4'h0: out_r = 16'h4142;
                4'h1: out_r = 16'h4142;
                4'h2: out_r = 16'h4142;
                4'h3: out_r = 16'h4142;
                4'h4: out_r = 16'h4142;
                4'h5: out_r = 16'h4142;
                4'h6: out_r = 16'h4142;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4143;
            end
            3'h4: begin
              out_r = 16'h4144;
              case (mant_lo4)
                4'h0: out_r = 16'h4143;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4144;
              case (mant_lo4)
                4'hf: out_r = 16'h4145;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4145;
            end
            3'h7: begin
              out_r = 16'h4145;
            end
            default: begin end
          endcase
        end
        9'h0a8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4146;
              case (mant_lo4)
                4'h0: out_r = 16'h4145;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4147;
              case (mant_lo4)
                4'h0: out_r = 16'h4146;
                4'h1: out_r = 16'h4146;
                4'h2: out_r = 16'h4146;
                4'h3: out_r = 16'h4146;
                4'h4: out_r = 16'h4146;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4147;
              case (mant_lo4)
                4'hc: out_r = 16'h4148;
                4'hd: out_r = 16'h4148;
                4'he: out_r = 16'h4148;
                4'hf: out_r = 16'h4148;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4148;
            end
            3'h4: begin
              out_r = 16'h4149;
              case (mant_lo4)
                4'h0: out_r = 16'h4148;
                4'h1: out_r = 16'h4148;
                4'h2: out_r = 16'h4148;
                4'h3: out_r = 16'h4148;
                4'h4: out_r = 16'h4148;
                4'h5: out_r = 16'h4148;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4149;
            end
            3'h6: begin
              out_r = 16'h414a;
              case (mant_lo4)
                4'h0: out_r = 16'h4149;
                4'h1: out_r = 16'h4149;
                4'h2: out_r = 16'h4149;
                4'h3: out_r = 16'h4149;
                4'h4: out_r = 16'h4149;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h414a;
            end
            default: begin end
          endcase
        end
        9'h0a9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h414b;
              case (mant_lo4)
                4'h0: out_r = 16'h414a;
                4'h1: out_r = 16'h414a;
                4'h2: out_r = 16'h414a;
                4'h3: out_r = 16'h414a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h414b;
              case (mant_lo4)
                4'h9: out_r = 16'h414c;
                4'ha: out_r = 16'h414c;
                4'hb: out_r = 16'h414c;
                4'hc: out_r = 16'h414c;
                4'hd: out_r = 16'h414c;
                4'he: out_r = 16'h414c;
                4'hf: out_r = 16'h414c;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h414c;
            end
            3'h3: begin
              out_r = 16'h414d;
            end
            3'h4: begin
              out_r = 16'h414d;
              case (mant_lo4)
                4'hc: out_r = 16'h414e;
                4'hd: out_r = 16'h414e;
                4'he: out_r = 16'h414e;
                4'hf: out_r = 16'h414e;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h414e;
            end
            3'h6: begin
              out_r = 16'h414e;
              case (mant_lo4)
                4'hb: out_r = 16'h414f;
                4'hc: out_r = 16'h414f;
                4'hd: out_r = 16'h414f;
                4'he: out_r = 16'h414f;
                4'hf: out_r = 16'h414f;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h414f;
            end
            default: begin end
          endcase
        end
        9'h0aa: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h414f;
              case (mant_lo4)
                4'h8: out_r = 16'h4150;
                4'h9: out_r = 16'h4150;
                4'ha: out_r = 16'h4150;
                4'hb: out_r = 16'h4150;
                4'hc: out_r = 16'h4150;
                4'hd: out_r = 16'h4150;
                4'he: out_r = 16'h4150;
                4'hf: out_r = 16'h4150;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4150;
              case (mant_lo4)
                4'hd: out_r = 16'h4151;
                4'he: out_r = 16'h4151;
                4'hf: out_r = 16'h4151;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4151;
            end
            3'h3: begin
              out_r = 16'h4152;
              case (mant_lo4)
                4'h0: out_r = 16'h4151;
                4'h1: out_r = 16'h4151;
                4'h2: out_r = 16'h4151;
                4'h3: out_r = 16'h4151;
                4'h4: out_r = 16'h4151;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4152;
            end
            3'h5: begin
              out_r = 16'h4153;
              case (mant_lo4)
                4'h0: out_r = 16'h4152;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4153;
            end
            3'h7: begin
              out_r = 16'h4154;
              case (mant_lo4)
                4'h0: out_r = 16'h4153;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0ab: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4154;
              case (mant_lo4)
                4'hc: out_r = 16'h4155;
                4'hd: out_r = 16'h4155;
                4'he: out_r = 16'h4155;
                4'hf: out_r = 16'h4155;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4155;
            end
            3'h2: begin
              out_r = 16'h4156;
              case (mant_lo4)
                4'h0: out_r = 16'h4155;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4156;
              case (mant_lo4)
                4'ha: out_r = 16'h4157;
                4'hb: out_r = 16'h4157;
                4'hc: out_r = 16'h4157;
                4'hd: out_r = 16'h4157;
                4'he: out_r = 16'h4157;
                4'hf: out_r = 16'h4157;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4157;
            end
            3'h5: begin
              out_r = 16'h4158;
              case (mant_lo4)
                4'h0: out_r = 16'h4157;
                4'h1: out_r = 16'h4157;
                4'h2: out_r = 16'h4157;
                4'h3: out_r = 16'h4157;
                4'h4: out_r = 16'h4157;
                4'h5: out_r = 16'h4157;
                4'h6: out_r = 16'h4157;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4158;
            end
            3'h7: begin
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
            default: begin end
          endcase
        end
        9'h0ac: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4159;
              case (mant_lo4)
                4'hf: out_r = 16'h415a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h415a;
            end
            3'h2: begin
              out_r = 16'h415b;
              case (mant_lo4)
                4'h0: out_r = 16'h415a;
                4'h1: out_r = 16'h415a;
                4'h2: out_r = 16'h415a;
                4'h3: out_r = 16'h415a;
                4'h4: out_r = 16'h415a;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h415b;
              case (mant_lo4)
                4'hf: out_r = 16'h415c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h415c;
            end
            3'h5: begin
              out_r = 16'h415c;
              case (mant_lo4)
                4'hc: out_r = 16'h415d;
                4'hd: out_r = 16'h415d;
                4'he: out_r = 16'h415d;
                4'hf: out_r = 16'h415d;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h415d;
            end
            3'h7: begin
              out_r = 16'h415d;
              case (mant_lo4)
                4'he: out_r = 16'h415e;
                4'hf: out_r = 16'h415e;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0ad: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h415e;
            end
            3'h1: begin
              out_r = 16'h415f;
              case (mant_lo4)
                4'h0: out_r = 16'h415e;
                4'h1: out_r = 16'h415e;
                4'h2: out_r = 16'h415e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h415f;
              case (mant_lo4)
                4'ha: out_r = 16'h4160;
                4'hb: out_r = 16'h4160;
                4'hc: out_r = 16'h4160;
                4'hd: out_r = 16'h4160;
                4'he: out_r = 16'h4160;
                4'hf: out_r = 16'h4160;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4160;
            end
            3'h4: begin
              out_r = 16'h4161;
              case (mant_lo4)
                4'h0: out_r = 16'h4160;
                4'h1: out_r = 16'h4160;
                4'h2: out_r = 16'h4160;
                4'h3: out_r = 16'h4160;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4161;
            end
            3'h6: begin
              out_r = 16'h4162;
              case (mant_lo4)
                4'h0: out_r = 16'h4161;
                4'h1: out_r = 16'h4161;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4162;
            end
            default: begin end
          endcase
        end
        9'h0ae: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4163;
              case (mant_lo4)
                4'h0: out_r = 16'h4162;
                4'h1: out_r = 16'h4162;
                4'h2: out_r = 16'h4162;
                default: begin end
              endcase
            end
            3'h1: begin
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
            3'h2: begin
              out_r = 16'h4164;
              case (mant_lo4)
                4'he: out_r = 16'h4165;
                4'hf: out_r = 16'h4165;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4165;
            end
            3'h4: begin
              out_r = 16'h4165;
              case (mant_lo4)
                4'h9: out_r = 16'h4166;
                4'ha: out_r = 16'h4166;
                4'hb: out_r = 16'h4166;
                4'hc: out_r = 16'h4166;
                4'hd: out_r = 16'h4166;
                4'he: out_r = 16'h4166;
                4'hf: out_r = 16'h4166;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4166;
            end
            3'h6: begin
              out_r = 16'h4166;
              case (mant_lo4)
                4'h8: out_r = 16'h4167;
                4'h9: out_r = 16'h4167;
                4'ha: out_r = 16'h4167;
                4'hb: out_r = 16'h4167;
                4'hc: out_r = 16'h4167;
                4'hd: out_r = 16'h4167;
                4'he: out_r = 16'h4167;
                4'hf: out_r = 16'h4167;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4167;
            end
            default: begin end
          endcase
        end
        9'h0af: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4168;
              case (mant_lo4)
                4'h0: out_r = 16'h4167;
                4'h1: out_r = 16'h4167;
                4'h2: out_r = 16'h4167;
                4'h3: out_r = 16'h4167;
                4'h4: out_r = 16'h4167;
                4'h5: out_r = 16'h4167;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4168;
              case (mant_lo4)
                4'hb: out_r = 16'h4169;
                4'hc: out_r = 16'h4169;
                4'hd: out_r = 16'h4169;
                4'he: out_r = 16'h4169;
                4'hf: out_r = 16'h4169;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4169;
            end
            3'h3: begin
              out_r = 16'h416a;
              case (mant_lo4)
                4'h0: out_r = 16'h4169;
                4'h1: out_r = 16'h4169;
                4'h2: out_r = 16'h4169;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h416a;
              case (mant_lo4)
                4'hf: out_r = 16'h416b;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h416b;
            end
            3'h6: begin
              out_r = 16'h416b;
              case (mant_lo4)
                4'he: out_r = 16'h416c;
                4'hf: out_r = 16'h416c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h416c;
            end
            default: begin end
          endcase
        end
        9'h0b0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h416c;
              case (mant_lo4)
                4'ha: out_r = 16'h416d;
                4'hb: out_r = 16'h416d;
                4'hc: out_r = 16'h416d;
                4'hd: out_r = 16'h416d;
                4'he: out_r = 16'h416d;
                4'hf: out_r = 16'h416d;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h416d;
              case (mant_lo4)
                4'hf: out_r = 16'h416e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h416e;
            end
            3'h3: begin
              out_r = 16'h416e;
              case (mant_lo4)
                4'h8: out_r = 16'h416f;
                4'h9: out_r = 16'h416f;
                4'ha: out_r = 16'h416f;
                4'hb: out_r = 16'h416f;
                4'hc: out_r = 16'h416f;
                4'hd: out_r = 16'h416f;
                4'he: out_r = 16'h416f;
                4'hf: out_r = 16'h416f;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h416f;
            end
            3'h5: begin
              out_r = 16'h4170;
              case (mant_lo4)
                4'h0: out_r = 16'h416f;
                4'h1: out_r = 16'h416f;
                4'h2: out_r = 16'h416f;
                4'h3: out_r = 16'h416f;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4170;
            end
            3'h7: begin
              out_r = 16'h4171;
              case (mant_lo4)
                4'h0: out_r = 16'h4170;
                4'h1: out_r = 16'h4170;
                4'h2: out_r = 16'h4170;
                4'h3: out_r = 16'h4170;
                4'h4: out_r = 16'h4170;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0b1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4171;
              case (mant_lo4)
                4'he: out_r = 16'h4172;
                4'hf: out_r = 16'h4172;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4172;
            end
            3'h2: begin
              out_r = 16'h4173;
              case (mant_lo4)
                4'h0: out_r = 16'h4172;
                4'h1: out_r = 16'h4172;
                4'h2: out_r = 16'h4172;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4173;
              case (mant_lo4)
                4'hd: out_r = 16'h4174;
                4'he: out_r = 16'h4174;
                4'hf: out_r = 16'h4174;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4174;
            end
            3'h5: begin
              out_r = 16'h4174;
              case (mant_lo4)
                4'ha: out_r = 16'h4175;
                4'hb: out_r = 16'h4175;
                4'hc: out_r = 16'h4175;
                4'hd: out_r = 16'h4175;
                4'he: out_r = 16'h4175;
                4'hf: out_r = 16'h4175;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4175;
            end
            3'h7: begin
              out_r = 16'h4175;
              case (mant_lo4)
                4'hb: out_r = 16'h4176;
                4'hc: out_r = 16'h4176;
                4'hd: out_r = 16'h4176;
                4'he: out_r = 16'h4176;
                4'hf: out_r = 16'h4176;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0b2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4176;
            end
            3'h1: begin
              out_r = 16'h4177;
              case (mant_lo4)
                4'h0: out_r = 16'h4176;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4177;
              case (mant_lo4)
                4'h8: out_r = 16'h4178;
                4'h9: out_r = 16'h4178;
                4'ha: out_r = 16'h4178;
                4'hb: out_r = 16'h4178;
                4'hc: out_r = 16'h4178;
                4'hd: out_r = 16'h4178;
                4'he: out_r = 16'h4178;
                4'hf: out_r = 16'h4178;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4178;
            end
            3'h4: begin
              out_r = 16'h4179;
              case (mant_lo4)
                4'h0: out_r = 16'h4178;
                4'h1: out_r = 16'h4178;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4179;
            end
            3'h6: begin
              out_r = 16'h417a;
            end
            3'h7: begin
              out_r = 16'h417a;
            end
            default: begin end
          endcase
        end
        9'h0b3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h417b;
              case (mant_lo4)
                4'h0: out_r = 16'h417a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h417c;
              case (mant_lo4)
                4'h0: out_r = 16'h417b;
                4'h1: out_r = 16'h417b;
                4'h2: out_r = 16'h417b;
                4'h3: out_r = 16'h417b;
                4'h4: out_r = 16'h417b;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h417c;
              case (mant_lo4)
                4'hc: out_r = 16'h417d;
                4'hd: out_r = 16'h417d;
                4'he: out_r = 16'h417d;
                4'hf: out_r = 16'h417d;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h417d;
            end
            3'h4: begin
              out_r = 16'h417e;
              case (mant_lo4)
                4'h0: out_r = 16'h417d;
                4'h1: out_r = 16'h417d;
                4'h2: out_r = 16'h417d;
                4'h3: out_r = 16'h417d;
                4'h4: out_r = 16'h417d;
                4'h5: out_r = 16'h417d;
                4'h6: out_r = 16'h417d;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h417e;
            end
            3'h6: begin
              out_r = 16'h417f;
              case (mant_lo4)
                4'h0: out_r = 16'h417e;
                4'h1: out_r = 16'h417e;
                4'h2: out_r = 16'h417e;
                4'h3: out_r = 16'h417e;
                4'h4: out_r = 16'h417e;
                4'h5: out_r = 16'h417e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h417f;
            end
            default: begin end
          endcase
        end
        9'h0b4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4180;
              case (mant_lo4)
                4'h0: out_r = 16'h417f;
                4'h1: out_r = 16'h417f;
                4'h2: out_r = 16'h417f;
                4'h3: out_r = 16'h417f;
                4'h4: out_r = 16'h417f;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4180;
            end
            3'h2: begin
              out_r = 16'h4181;
              case (mant_lo4)
                4'h0: out_r = 16'h4180;
                4'h1: out_r = 16'h4180;
                4'h2: out_r = 16'h4180;
                4'h3: out_r = 16'h4180;
                4'h4: out_r = 16'h4180;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4181;
            end
            3'h4: begin
              out_r = 16'h4181;
            end
            3'h5: begin
              out_r = 16'h4181;
              case (mant_lo4)
                4'hb: out_r = 16'h4182;
                4'hc: out_r = 16'h4182;
                4'hd: out_r = 16'h4182;
                4'he: out_r = 16'h4182;
                4'hf: out_r = 16'h4182;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4182;
            end
            3'h7: begin
              out_r = 16'h4182;
            end
            default: begin end
          endcase
        end
        9'h0b5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4182;
            end
            3'h1: begin
              out_r = 16'h4183;
              case (mant_lo4)
                4'h0: out_r = 16'h4182;
                4'h1: out_r = 16'h4182;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4183;
            end
            3'h3: begin
              out_r = 16'h4183;
            end
            3'h4: begin
              out_r = 16'h4184;
              case (mant_lo4)
                4'h0: out_r = 16'h4183;
                4'h1: out_r = 16'h4183;
                4'h2: out_r = 16'h4183;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4184;
            end
            3'h6: begin
              out_r = 16'h4184;
            end
            3'h7: begin
              out_r = 16'h4184;
            end
            default: begin end
          endcase
        end
        9'h0b6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4185;
              case (mant_lo4)
                4'h0: out_r = 16'h4184;
                4'h1: out_r = 16'h4184;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4185;
            end
            3'h2: begin
              out_r = 16'h4185;
              case (mant_lo4)
                4'he: out_r = 16'h4186;
                4'hf: out_r = 16'h4186;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4186;
            end
            3'h4: begin
              out_r = 16'h4186;
            end
            3'h5: begin
              out_r = 16'h4186;
            end
            3'h6: begin
              out_r = 16'h4187;
              case (mant_lo4)
                4'h0: out_r = 16'h4186;
                4'h1: out_r = 16'h4186;
                4'h2: out_r = 16'h4186;
                4'h3: out_r = 16'h4186;
                4'h4: out_r = 16'h4186;
                4'h5: out_r = 16'h4186;
                4'h6: out_r = 16'h4186;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4187;
            end
            default: begin end
          endcase
        end
        9'h0b7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4187;
            end
            3'h1: begin
              out_r = 16'h4187;
              case (mant_lo4)
                4'ha: out_r = 16'h4188;
                4'hb: out_r = 16'h4188;
                4'hc: out_r = 16'h4188;
                4'hd: out_r = 16'h4188;
                4'he: out_r = 16'h4188;
                4'hf: out_r = 16'h4188;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4188;
            end
            3'h3: begin
              out_r = 16'h4188;
            end
            3'h4: begin
              out_r = 16'h4188;
              case (mant_lo4)
                4'he: out_r = 16'h4189;
                4'hf: out_r = 16'h4189;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4189;
            end
            3'h6: begin
              out_r = 16'h4189;
            end
            3'h7: begin
              out_r = 16'h4189;
            end
            default: begin end
          endcase
        end
        9'h0b8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4189;
              case (mant_lo4)
                4'h9: out_r = 16'h418a;
                4'ha: out_r = 16'h418a;
                4'hb: out_r = 16'h418a;
                4'hc: out_r = 16'h418a;
                4'hd: out_r = 16'h418a;
                4'he: out_r = 16'h418a;
                4'hf: out_r = 16'h418a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h418a;
            end
            3'h2: begin
              out_r = 16'h418a;
            end
            3'h3: begin
              out_r = 16'h418b;
              case (mant_lo4)
                4'h0: out_r = 16'h418a;
                4'h1: out_r = 16'h418a;
                4'h2: out_r = 16'h418a;
                4'h3: out_r = 16'h418a;
                4'h4: out_r = 16'h418a;
                4'h5: out_r = 16'h418a;
                4'h6: out_r = 16'h418a;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h418b;
            end
            3'h5: begin
              out_r = 16'h418b;
            end
            3'h6: begin
              out_r = 16'h418b;
            end
            3'h7: begin
              out_r = 16'h418c;
              case (mant_lo4)
                4'h0: out_r = 16'h418b;
                4'h1: out_r = 16'h418b;
                4'h2: out_r = 16'h418b;
                4'h3: out_r = 16'h418b;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0b9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h418c;
            end
            3'h1: begin
              out_r = 16'h418c;
            end
            3'h2: begin
              out_r = 16'h418d;
              case (mant_lo4)
                4'h0: out_r = 16'h418c;
                4'h1: out_r = 16'h418c;
                4'h2: out_r = 16'h418c;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h418d;
            end
            3'h4: begin
              out_r = 16'h418d;
            end
            3'h5: begin
              out_r = 16'h418d;
              case (mant_lo4)
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
            3'h6: begin
              out_r = 16'h418e;
            end
            3'h7: begin
              out_r = 16'h418e;
            end
            default: begin end
          endcase
        end
        9'h0ba: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h418e;
            end
            3'h1: begin
              out_r = 16'h418f;
              case (mant_lo4)
                4'h0: out_r = 16'h418e;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h418f;
            end
            3'h3: begin
              out_r = 16'h418f;
            end
            3'h4: begin
              out_r = 16'h4190;
              case (mant_lo4)
                4'h0: out_r = 16'h418f;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4190;
            end
            3'h6: begin
              out_r = 16'h4190;
            end
            3'h7: begin
              out_r = 16'h4190;
            end
            default: begin end
          endcase
        end
        9'h0bb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4191;
              case (mant_lo4)
                4'h0: out_r = 16'h4190;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4191;
            end
            3'h2: begin
              out_r = 16'h4191;
              case (mant_lo4)
                4'hb: out_r = 16'h4192;
                4'hc: out_r = 16'h4192;
                4'hd: out_r = 16'h4192;
                4'he: out_r = 16'h4192;
                4'hf: out_r = 16'h4192;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4192;
            end
            3'h4: begin
              out_r = 16'h4192;
            end
            3'h5: begin
              out_r = 16'h4192;
            end
            3'h6: begin
              out_r = 16'h4193;
              case (mant_lo4)
                4'h0: out_r = 16'h4192;
                4'h1: out_r = 16'h4192;
                4'h2: out_r = 16'h4192;
                4'h3: out_r = 16'h4192;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4193;
            end
            default: begin end
          endcase
        end
        9'h0bc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4193;
            end
            3'h1: begin
              out_r = 16'h4193;
              case (mant_lo4)
                4'h9: out_r = 16'h4194;
                4'ha: out_r = 16'h4194;
                4'hb: out_r = 16'h4194;
                4'hc: out_r = 16'h4194;
                4'hd: out_r = 16'h4194;
                4'he: out_r = 16'h4194;
                4'hf: out_r = 16'h4194;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4194;
            end
            3'h3: begin
              out_r = 16'h4194;
            end
            3'h4: begin
              out_r = 16'h4194;
              case (mant_lo4)
                4'hb: out_r = 16'h4195;
                4'hc: out_r = 16'h4195;
                4'hd: out_r = 16'h4195;
                4'he: out_r = 16'h4195;
                4'hf: out_r = 16'h4195;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4195;
            end
            3'h6: begin
              out_r = 16'h4195;
            end
            3'h7: begin
              out_r = 16'h4195;
            end
            default: begin end
          endcase
        end
        9'h0bd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4195;
              case (mant_lo4)
                4'h8: out_r = 16'h4196;
                4'h9: out_r = 16'h4196;
                4'ha: out_r = 16'h4196;
                4'hb: out_r = 16'h4196;
                4'hc: out_r = 16'h4196;
                4'hd: out_r = 16'h4196;
                4'he: out_r = 16'h4196;
                4'hf: out_r = 16'h4196;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4196;
            end
            3'h2: begin
              out_r = 16'h4196;
            end
            3'h3: begin
              out_r = 16'h4197;
              case (mant_lo4)
                4'h0: out_r = 16'h4196;
                4'h1: out_r = 16'h4196;
                4'h2: out_r = 16'h4196;
                4'h3: out_r = 16'h4196;
                4'h4: out_r = 16'h4196;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4197;
            end
            3'h5: begin
              out_r = 16'h4197;
            end
            3'h6: begin
              out_r = 16'h4197;
            end
            3'h7: begin
              out_r = 16'h4198;
              case (mant_lo4)
                4'h0: out_r = 16'h4197;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0be: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4198;
            end
            3'h1: begin
              out_r = 16'h4198;
            end
            3'h2: begin
              out_r = 16'h4199;
              case (mant_lo4)
                4'h0: out_r = 16'h4198;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4199;
            end
            3'h4: begin
              out_r = 16'h4199;
            end
            3'h5: begin
              out_r = 16'h419a;
              case (mant_lo4)
                4'h0: out_r = 16'h4199;
                4'h1: out_r = 16'h4199;
                4'h2: out_r = 16'h4199;
                4'h3: out_r = 16'h4199;
                4'h4: out_r = 16'h4199;
                4'h5: out_r = 16'h4199;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h419a;
            end
            3'h7: begin
              out_r = 16'h419a;
            end
            default: begin end
          endcase
        end
        9'h0bf: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h419a;
              case (mant_lo4)
                4'hf: out_r = 16'h419b;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h419b;
            end
            3'h2: begin
              out_r = 16'h419b;
            end
            3'h3: begin
              out_r = 16'h419b;
              case (mant_lo4)
                4'hf: out_r = 16'h419c;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h419c;
            end
            3'h5: begin
              out_r = 16'h419c;
            end
            3'h6: begin
              out_r = 16'h419c;
            end
            3'h7: begin
              out_r = 16'h419c;
              case (mant_lo4)
                4'he: out_r = 16'h419d;
                4'hf: out_r = 16'h419d;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0c0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h419d;
            end
            3'h1: begin
              out_r = 16'h419d;
            end
            3'h2: begin
              out_r = 16'h419d;
              case (mant_lo4)
                4'h9: out_r = 16'h419e;
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
              out_r = 16'h419e;
            end
            3'h5: begin
              out_r = 16'h419e;
            end
            3'h6: begin
              out_r = 16'h419f;
              case (mant_lo4)
                4'h0: out_r = 16'h419e;
                4'h1: out_r = 16'h419e;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h419f;
            end
            default: begin end
          endcase
        end
        9'h0c1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h419f;
            end
            3'h1: begin
              out_r = 16'h41a0;
              case (mant_lo4)
                4'h0: out_r = 16'h419f;
                4'h1: out_r = 16'h419f;
                4'h2: out_r = 16'h419f;
                4'h3: out_r = 16'h419f;
                4'h4: out_r = 16'h419f;
                4'h5: out_r = 16'h419f;
                4'h6: out_r = 16'h419f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41a0;
            end
            3'h3: begin
              out_r = 16'h41a0;
            end
            3'h4: begin
              out_r = 16'h41a0;
              case (mant_lo4)
                4'h9: out_r = 16'h41a1;
                4'ha: out_r = 16'h41a1;
                4'hb: out_r = 16'h41a1;
                4'hc: out_r = 16'h41a1;
                4'hd: out_r = 16'h41a1;
                4'he: out_r = 16'h41a1;
                4'hf: out_r = 16'h41a1;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41a1;
            end
            3'h6: begin
              out_r = 16'h41a1;
            end
            3'h7: begin
              out_r = 16'h41a1;
            end
            default: begin end
          endcase
        end
        9'h0c2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41a2;
              case (mant_lo4)
                4'h0: out_r = 16'h41a1;
                4'h1: out_r = 16'h41a1;
                4'h2: out_r = 16'h41a1;
                4'h3: out_r = 16'h41a1;
                4'h4: out_r = 16'h41a1;
                4'h5: out_r = 16'h41a1;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41a2;
            end
            3'h2: begin
              out_r = 16'h41a2;
            end
            3'h3: begin
              out_r = 16'h41a3;
              case (mant_lo4)
                4'h0: out_r = 16'h41a2;
                4'h1: out_r = 16'h41a2;
                4'h2: out_r = 16'h41a2;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41a3;
            end
            3'h5: begin
              out_r = 16'h41a3;
            end
            3'h6: begin
              out_r = 16'h41a3;
              case (mant_lo4)
                4'he: out_r = 16'h41a4;
                4'hf: out_r = 16'h41a4;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41a4;
            end
            default: begin end
          endcase
        end
        9'h0c3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41a4;
            end
            3'h1: begin
              out_r = 16'h41a4;
              case (mant_lo4)
                4'hf: out_r = 16'h41a5;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41a5;
            end
            3'h3: begin
              out_r = 16'h41a5;
            end
            3'h4: begin
              out_r = 16'h41a5;
            end
            3'h5: begin
              out_r = 16'h41a6;
              case (mant_lo4)
                4'h0: out_r = 16'h41a5;
                4'h1: out_r = 16'h41a5;
                4'h2: out_r = 16'h41a5;
                4'h3: out_r = 16'h41a5;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41a6;
            end
            3'h7: begin
              out_r = 16'h41a6;
            end
            default: begin end
          endcase
        end
        9'h0c4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41a6;
              case (mant_lo4)
                4'hd: out_r = 16'h41a7;
                4'he: out_r = 16'h41a7;
                4'hf: out_r = 16'h41a7;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41a7;
            end
            3'h2: begin
              out_r = 16'h41a7;
            end
            3'h3: begin
              out_r = 16'h41a7;
              case (mant_lo4)
                4'hc: out_r = 16'h41a8;
                4'hd: out_r = 16'h41a8;
                4'he: out_r = 16'h41a8;
                4'hf: out_r = 16'h41a8;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41a8;
            end
            3'h5: begin
              out_r = 16'h41a8;
            end
            3'h6: begin
              out_r = 16'h41a8;
            end
            3'h7: begin
              out_r = 16'h41a8;
              case (mant_lo4)
                4'hb: out_r = 16'h41a9;
                4'hc: out_r = 16'h41a9;
                4'hd: out_r = 16'h41a9;
                4'he: out_r = 16'h41a9;
                4'hf: out_r = 16'h41a9;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0c5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41a9;
            end
            3'h1: begin
              out_r = 16'h41a9;
            end
            3'h2: begin
              out_r = 16'h41aa;
              case (mant_lo4)
                4'h0: out_r = 16'h41a9;
                4'h1: out_r = 16'h41a9;
                4'h2: out_r = 16'h41a9;
                4'h3: out_r = 16'h41a9;
                4'h4: out_r = 16'h41a9;
                4'h5: out_r = 16'h41a9;
                4'h6: out_r = 16'h41a9;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41aa;
            end
            3'h4: begin
              out_r = 16'h41aa;
            end
            3'h5: begin
              out_r = 16'h41aa;
              case (mant_lo4)
                4'hf: out_r = 16'h41ab;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41ab;
            end
            3'h7: begin
              out_r = 16'h41ab;
            end
            default: begin end
          endcase
        end
        9'h0c6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ab;
            end
            3'h1: begin
              out_r = 16'h41ac;
              case (mant_lo4)
                4'h0: out_r = 16'h41ab;
                4'h1: out_r = 16'h41ab;
                4'h2: out_r = 16'h41ab;
                4'h3: out_r = 16'h41ab;
                4'h4: out_r = 16'h41ab;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41ac;
            end
            3'h3: begin
              out_r = 16'h41ac;
            end
            3'h4: begin
              out_r = 16'h41ad;
              case (mant_lo4)
                4'h0: out_r = 16'h41ac;
                4'h1: out_r = 16'h41ac;
                4'h2: out_r = 16'h41ac;
                4'h3: out_r = 16'h41ac;
                4'h4: out_r = 16'h41ac;
                4'h5: out_r = 16'h41ac;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41ad;
            end
            3'h6: begin
              out_r = 16'h41ad;
            end
            3'h7: begin
              out_r = 16'h41ad;
            end
            default: begin end
          endcase
        end
        9'h0c7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ae;
              case (mant_lo4)
                4'h0: out_r = 16'h41ad;
                4'h1: out_r = 16'h41ad;
                4'h2: out_r = 16'h41ad;
                4'h3: out_r = 16'h41ad;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41ae;
            end
            3'h2: begin
              out_r = 16'h41ae;
            end
            3'h3: begin
              out_r = 16'h41af;
              case (mant_lo4)
                4'h0: out_r = 16'h41ae;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41af;
            end
            3'h5: begin
              out_r = 16'h41af;
            end
            3'h6: begin
              out_r = 16'h41af;
              case (mant_lo4)
                4'hb: out_r = 16'h41b0;
                4'hc: out_r = 16'h41b0;
                4'hd: out_r = 16'h41b0;
                4'he: out_r = 16'h41b0;
                4'hf: out_r = 16'h41b0;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41b0;
            end
            default: begin end
          endcase
        end
        9'h0c8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41b0;
            end
            3'h1: begin
              out_r = 16'h41b0;
              case (mant_lo4)
                4'hd: out_r = 16'h41b1;
                4'he: out_r = 16'h41b1;
                4'hf: out_r = 16'h41b1;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41b1;
            end
            3'h3: begin
              out_r = 16'h41b1;
            end
            3'h4: begin
              out_r = 16'h41b1;
            end
            3'h5: begin
              out_r = 16'h41b2;
              case (mant_lo4)
                4'h0: out_r = 16'h41b1;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41b2;
            end
            3'h7: begin
              out_r = 16'h41b2;
            end
            default: begin end
          endcase
        end
        9'h0c9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41b2;
              case (mant_lo4)
                4'hc: out_r = 16'h41b3;
                4'hd: out_r = 16'h41b3;
                4'he: out_r = 16'h41b3;
                4'hf: out_r = 16'h41b3;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41b3;
            end
            3'h2: begin
              out_r = 16'h41b3;
            end
            3'h3: begin
              out_r = 16'h41b3;
              case (mant_lo4)
                4'ha: out_r = 16'h41b4;
                4'hb: out_r = 16'h41b4;
                4'hc: out_r = 16'h41b4;
                4'hd: out_r = 16'h41b4;
                4'he: out_r = 16'h41b4;
                4'hf: out_r = 16'h41b4;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41b4;
            end
            3'h5: begin
              out_r = 16'h41b4;
            end
            3'h6: begin
              out_r = 16'h41b4;
            end
            3'h7: begin
              out_r = 16'h41b4;
              case (mant_lo4)
                4'h8: out_r = 16'h41b5;
                4'h9: out_r = 16'h41b5;
                4'ha: out_r = 16'h41b5;
                4'hb: out_r = 16'h41b5;
                4'hc: out_r = 16'h41b5;
                4'hd: out_r = 16'h41b5;
                4'he: out_r = 16'h41b5;
                4'hf: out_r = 16'h41b5;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0ca: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41b5;
            end
            3'h1: begin
              out_r = 16'h41b5;
            end
            3'h2: begin
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
            3'h3: begin
              out_r = 16'h41b6;
            end
            3'h4: begin
              out_r = 16'h41b6;
            end
            3'h5: begin
              out_r = 16'h41b6;
              case (mant_lo4)
                4'hd: out_r = 16'h41b7;
                4'he: out_r = 16'h41b7;
                4'hf: out_r = 16'h41b7;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41b7;
            end
            3'h7: begin
              out_r = 16'h41b7;
            end
            default: begin end
          endcase
        end
        9'h0cb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41b7;
            end
            3'h1: begin
              out_r = 16'h41b8;
              case (mant_lo4)
                4'h0: out_r = 16'h41b7;
                4'h1: out_r = 16'h41b7;
                4'h2: out_r = 16'h41b7;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41b8;
            end
            3'h3: begin
              out_r = 16'h41b8;
            end
            3'h4: begin
              out_r = 16'h41b9;
              case (mant_lo4)
                4'h0: out_r = 16'h41b8;
                4'h1: out_r = 16'h41b8;
                4'h2: out_r = 16'h41b8;
                4'h3: out_r = 16'h41b8;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41b9;
            end
            3'h6: begin
              out_r = 16'h41b9;
            end
            3'h7: begin
              out_r = 16'h41b9;
            end
            default: begin end
          endcase
        end
        9'h0cc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ba;
              case (mant_lo4)
                4'h0: out_r = 16'h41b9;
                4'h1: out_r = 16'h41b9;
                4'h2: out_r = 16'h41b9;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41ba;
            end
            3'h2: begin
              out_r = 16'h41ba;
              case (mant_lo4)
                4'he: out_r = 16'h41bb;
                4'hf: out_r = 16'h41bb;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41bb;
            end
            3'h4: begin
              out_r = 16'h41bb;
            end
            3'h5: begin
              out_r = 16'h41bb;
            end
            3'h6: begin
              out_r = 16'h41bb;
              case (mant_lo4)
                4'h8: out_r = 16'h41bc;
                4'h9: out_r = 16'h41bc;
                4'ha: out_r = 16'h41bc;
                4'hb: out_r = 16'h41bc;
                4'hc: out_r = 16'h41bc;
                4'hd: out_r = 16'h41bc;
                4'he: out_r = 16'h41bc;
                4'hf: out_r = 16'h41bc;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41bc;
            end
            default: begin end
          endcase
        end
        9'h0cd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41bc;
            end
            3'h1: begin
              out_r = 16'h41bc;
              case (mant_lo4)
                4'hb: out_r = 16'h41bd;
                4'hc: out_r = 16'h41bd;
                4'hd: out_r = 16'h41bd;
                4'he: out_r = 16'h41bd;
                4'hf: out_r = 16'h41bd;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41bd;
            end
            3'h3: begin
              out_r = 16'h41bd;
            end
            3'h4: begin
              out_r = 16'h41bd;
              case (mant_lo4)
                4'hf: out_r = 16'h41be;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41be;
            end
            3'h6: begin
              out_r = 16'h41be;
            end
            3'h7: begin
              out_r = 16'h41be;
            end
            default: begin end
          endcase
        end
        9'h0ce: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41be;
              case (mant_lo4)
                4'ha: out_r = 16'h41bf;
                4'hb: out_r = 16'h41bf;
                4'hc: out_r = 16'h41bf;
                4'hd: out_r = 16'h41bf;
                4'he: out_r = 16'h41bf;
                4'hf: out_r = 16'h41bf;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41bf;
            end
            3'h2: begin
              out_r = 16'h41bf;
            end
            3'h3: begin
              out_r = 16'h41bf;
              case (mant_lo4)
                4'h8: out_r = 16'h41c0;
                4'h9: out_r = 16'h41c0;
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
              out_r = 16'h41c0;
            end
            3'h6: begin
              out_r = 16'h41c0;
            end
            3'h7: begin
              out_r = 16'h41c1;
              case (mant_lo4)
                4'h0: out_r = 16'h41c0;
                4'h1: out_r = 16'h41c0;
                4'h2: out_r = 16'h41c0;
                4'h3: out_r = 16'h41c0;
                4'h4: out_r = 16'h41c0;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0cf: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41c1;
            end
            3'h1: begin
              out_r = 16'h41c1;
            end
            3'h2: begin
              out_r = 16'h41c2;
              case (mant_lo4)
                4'h0: out_r = 16'h41c1;
                4'h1: out_r = 16'h41c1;
                4'h2: out_r = 16'h41c1;
                4'h3: out_r = 16'h41c1;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41c2;
            end
            3'h4: begin
              out_r = 16'h41c2;
            end
            3'h5: begin
              out_r = 16'h41c2;
              case (mant_lo4)
                4'ha: out_r = 16'h41c3;
                4'hb: out_r = 16'h41c3;
                4'hc: out_r = 16'h41c3;
                4'hd: out_r = 16'h41c3;
                4'he: out_r = 16'h41c3;
                4'hf: out_r = 16'h41c3;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41c3;
            end
            3'h7: begin
              out_r = 16'h41c3;
            end
            default: begin end
          endcase
        end
        9'h0d0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41c3;
            end
            3'h1: begin
              out_r = 16'h41c4;
              case (mant_lo4)
                4'h0: out_r = 16'h41c3;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41c4;
            end
            3'h3: begin
              out_r = 16'h41c4;
            end
            3'h4: begin
              out_r = 16'h41c5;
              case (mant_lo4)
                4'h0: out_r = 16'h41c4;
                4'h1: out_r = 16'h41c4;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41c5;
            end
            3'h6: begin
              out_r = 16'h41c5;
            end
            3'h7: begin
              out_r = 16'h41c5;
            end
            default: begin end
          endcase
        end
        9'h0d1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41c6;
              case (mant_lo4)
                4'h0: out_r = 16'h41c5;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41c6;
            end
            3'h2: begin
              out_r = 16'h41c6;
              case (mant_lo4)
                4'hc: out_r = 16'h41c7;
                4'hd: out_r = 16'h41c7;
                4'he: out_r = 16'h41c7;
                4'hf: out_r = 16'h41c7;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41c7;
            end
            3'h4: begin
              out_r = 16'h41c7;
            end
            3'h5: begin
              out_r = 16'h41c7;
            end
            3'h6: begin
              out_r = 16'h41c8;
              case (mant_lo4)
                4'h0: out_r = 16'h41c7;
                4'h1: out_r = 16'h41c7;
                4'h2: out_r = 16'h41c7;
                4'h3: out_r = 16'h41c7;
                4'h4: out_r = 16'h41c7;
                4'h5: out_r = 16'h41c7;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41c8;
            end
            default: begin end
          endcase
        end
        9'h0d2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41c8;
            end
            3'h1: begin
              out_r = 16'h41c8;
              case (mant_lo4)
                4'h9: out_r = 16'h41c9;
                4'ha: out_r = 16'h41c9;
                4'hb: out_r = 16'h41c9;
                4'hc: out_r = 16'h41c9;
                4'hd: out_r = 16'h41c9;
                4'he: out_r = 16'h41c9;
                4'hf: out_r = 16'h41c9;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41c9;
            end
            3'h3: begin
              out_r = 16'h41c9;
            end
            3'h4: begin
              out_r = 16'h41c9;
              case (mant_lo4)
                4'hc: out_r = 16'h41ca;
                4'hd: out_r = 16'h41ca;
                4'he: out_r = 16'h41ca;
                4'hf: out_r = 16'h41ca;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41ca;
            end
            3'h6: begin
              out_r = 16'h41ca;
            end
            3'h7: begin
              out_r = 16'h41ca;
            end
            default: begin end
          endcase
        end
        9'h0d3: begin
          case (mant_hi3)
            3'h0: begin
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
            3'h1: begin
              out_r = 16'h41cb;
            end
            3'h2: begin
              out_r = 16'h41cb;
            end
            3'h3: begin
              out_r = 16'h41cc;
              case (mant_lo4)
                4'h0: out_r = 16'h41cb;
                4'h1: out_r = 16'h41cb;
                4'h2: out_r = 16'h41cb;
                4'h3: out_r = 16'h41cb;
                4'h4: out_r = 16'h41cb;
                4'h5: out_r = 16'h41cb;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41cc;
            end
            3'h5: begin
              out_r = 16'h41cc;
            end
            3'h6: begin
              out_r = 16'h41cc;
            end
            3'h7: begin
              out_r = 16'h41cd;
              case (mant_lo4)
                4'h0: out_r = 16'h41cc;
                4'h1: out_r = 16'h41cc;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0d4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41cd;
            end
            3'h1: begin
              out_r = 16'h41cd;
            end
            3'h2: begin
              out_r = 16'h41ce;
              case (mant_lo4)
                4'h0: out_r = 16'h41cd;
                4'h1: out_r = 16'h41cd;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41ce;
            end
            3'h4: begin
              out_r = 16'h41ce;
            end
            3'h5: begin
              out_r = 16'h41cf;
              case (mant_lo4)
                4'h0: out_r = 16'h41ce;
                4'h1: out_r = 16'h41ce;
                4'h2: out_r = 16'h41ce;
                4'h3: out_r = 16'h41ce;
                4'h4: out_r = 16'h41ce;
                4'h5: out_r = 16'h41ce;
                4'h6: out_r = 16'h41ce;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41cf;
            end
            3'h7: begin
              out_r = 16'h41cf;
            end
            default: begin end
          endcase
        end
        9'h0d5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41cf;
            end
            3'h1: begin
              out_r = 16'h41d0;
            end
            3'h2: begin
              out_r = 16'h41d0;
            end
            3'h3: begin
              out_r = 16'h41d0;
            end
            3'h4: begin
              out_r = 16'h41d1;
            end
            3'h5: begin
              out_r = 16'h41d1;
            end
            3'h6: begin
              out_r = 16'h41d1;
            end
            3'h7: begin
              out_r = 16'h41d1;
              case (mant_lo4)
                4'hf: out_r = 16'h41d2;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0d6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41d2;
            end
            3'h1: begin
              out_r = 16'h41d2;
            end
            3'h2: begin
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
            3'h3: begin
              out_r = 16'h41d3;
            end
            3'h4: begin
              out_r = 16'h41d3;
            end
            3'h5: begin
              out_r = 16'h41d3;
            end
            3'h6: begin
              out_r = 16'h41d4;
              case (mant_lo4)
                4'h0: out_r = 16'h41d3;
                4'h1: out_r = 16'h41d3;
                4'h2: out_r = 16'h41d3;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41d4;
            end
            default: begin end
          endcase
        end
        9'h0d7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41d4;
            end
            3'h1: begin
              out_r = 16'h41d4;
              case (mant_lo4)
                4'h8: out_r = 16'h41d5;
                4'h9: out_r = 16'h41d5;
                4'ha: out_r = 16'h41d5;
                4'hb: out_r = 16'h41d5;
                4'hc: out_r = 16'h41d5;
                4'hd: out_r = 16'h41d5;
                4'he: out_r = 16'h41d5;
                4'hf: out_r = 16'h41d5;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41d5;
            end
            3'h3: begin
              out_r = 16'h41d5;
            end
            3'h4: begin
              out_r = 16'h41d5;
              case (mant_lo4)
                4'ha: out_r = 16'h41d6;
                4'hb: out_r = 16'h41d6;
                4'hc: out_r = 16'h41d6;
                4'hd: out_r = 16'h41d6;
                4'he: out_r = 16'h41d6;
                4'hf: out_r = 16'h41d6;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41d6;
            end
            3'h6: begin
              out_r = 16'h41d6;
            end
            3'h7: begin
              out_r = 16'h41d6;
            end
            default: begin end
          endcase
        end
        9'h0d8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41d7;
              case (mant_lo4)
                4'h0: out_r = 16'h41d6;
                4'h1: out_r = 16'h41d6;
                4'h2: out_r = 16'h41d6;
                4'h3: out_r = 16'h41d6;
                4'h4: out_r = 16'h41d6;
                4'h5: out_r = 16'h41d6;
                4'h6: out_r = 16'h41d6;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41d7;
            end
            3'h2: begin
              out_r = 16'h41d7;
            end
            3'h3: begin
              out_r = 16'h41d8;
              case (mant_lo4)
                4'h0: out_r = 16'h41d7;
                4'h1: out_r = 16'h41d7;
                4'h2: out_r = 16'h41d7;
                4'h3: out_r = 16'h41d7;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41d8;
            end
            3'h5: begin
              out_r = 16'h41d8;
            end
            3'h6: begin
              out_r = 16'h41d8;
              case (mant_lo4)
                4'hf: out_r = 16'h41d9;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41d9;
            end
            default: begin end
          endcase
        end
        9'h0d9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41d9;
            end
            3'h1: begin
              out_r = 16'h41d9;
            end
            3'h2: begin
              out_r = 16'h41da;
            end
            3'h3: begin
              out_r = 16'h41da;
            end
            3'h4: begin
              out_r = 16'h41da;
            end
            3'h5: begin
              out_r = 16'h41db;
              case (mant_lo4)
                4'h0: out_r = 16'h41da;
                4'h1: out_r = 16'h41da;
                4'h2: out_r = 16'h41da;
                4'h3: out_r = 16'h41da;
                4'h4: out_r = 16'h41da;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41db;
            end
            3'h7: begin
              out_r = 16'h41db;
            end
            default: begin end
          endcase
        end
        9'h0da: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41db;
              case (mant_lo4)
                4'he: out_r = 16'h41dc;
                4'hf: out_r = 16'h41dc;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41dc;
            end
            3'h2: begin
              out_r = 16'h41dc;
            end
            3'h3: begin
              out_r = 16'h41dc;
              case (mant_lo4)
                4'hd: out_r = 16'h41dd;
                4'he: out_r = 16'h41dd;
                4'hf: out_r = 16'h41dd;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41dd;
            end
            3'h5: begin
              out_r = 16'h41dd;
            end
            3'h6: begin
              out_r = 16'h41dd;
            end
            3'h7: begin
              out_r = 16'h41dd;
              case (mant_lo4)
                4'hc: out_r = 16'h41de;
                4'hd: out_r = 16'h41de;
                4'he: out_r = 16'h41de;
                4'hf: out_r = 16'h41de;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0db: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41de;
            end
            3'h1: begin
              out_r = 16'h41de;
            end
            3'h2: begin
              out_r = 16'h41de;
              case (mant_lo4)
                4'h8: out_r = 16'h41df;
                4'h9: out_r = 16'h41df;
                4'ha: out_r = 16'h41df;
                4'hb: out_r = 16'h41df;
                4'hc: out_r = 16'h41df;
                4'hd: out_r = 16'h41df;
                4'he: out_r = 16'h41df;
                4'hf: out_r = 16'h41df;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41df;
            end
            3'h4: begin
              out_r = 16'h41df;
            end
            3'h5: begin
              out_r = 16'h41df;
            end
            3'h6: begin
              out_r = 16'h41e0;
            end
            3'h7: begin
              out_r = 16'h41e0;
            end
            default: begin end
          endcase
        end
        9'h0dc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41e0;
            end
            3'h1: begin
              out_r = 16'h41e1;
              case (mant_lo4)
                4'h0: out_r = 16'h41e0;
                4'h1: out_r = 16'h41e0;
                4'h2: out_r = 16'h41e0;
                4'h3: out_r = 16'h41e0;
                4'h4: out_r = 16'h41e0;
                4'h5: out_r = 16'h41e0;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41e1;
            end
            3'h3: begin
              out_r = 16'h41e1;
            end
            3'h4: begin
              out_r = 16'h41e1;
              case (mant_lo4)
                4'h8: out_r = 16'h41e2;
                4'h9: out_r = 16'h41e2;
                4'ha: out_r = 16'h41e2;
                4'hb: out_r = 16'h41e2;
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
              out_r = 16'h41e2;
            end
            3'h7: begin
              out_r = 16'h41e2;
            end
            default: begin end
          endcase
        end
        9'h0dd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41e3;
              case (mant_lo4)
                4'h0: out_r = 16'h41e2;
                4'h1: out_r = 16'h41e2;
                4'h2: out_r = 16'h41e2;
                4'h3: out_r = 16'h41e2;
                4'h4: out_r = 16'h41e2;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41e3;
            end
            3'h2: begin
              out_r = 16'h41e3;
            end
            3'h3: begin
              out_r = 16'h41e4;
              case (mant_lo4)
                4'h0: out_r = 16'h41e3;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41e4;
            end
            3'h5: begin
              out_r = 16'h41e4;
            end
            3'h6: begin
              out_r = 16'h41e4;
              case (mant_lo4)
                4'hc: out_r = 16'h41e5;
                4'hd: out_r = 16'h41e5;
                4'he: out_r = 16'h41e5;
                4'hf: out_r = 16'h41e5;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41e5;
            end
            default: begin end
          endcase
        end
        9'h0de: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41e5;
            end
            3'h1: begin
              out_r = 16'h41e5;
              case (mant_lo4)
                4'he: out_r = 16'h41e6;
                4'hf: out_r = 16'h41e6;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41e6;
            end
            3'h3: begin
              out_r = 16'h41e6;
            end
            3'h4: begin
              out_r = 16'h41e6;
            end
            3'h5: begin
              out_r = 16'h41e7;
              case (mant_lo4)
                4'h0: out_r = 16'h41e6;
                4'h1: out_r = 16'h41e6;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41e7;
            end
            3'h7: begin
              out_r = 16'h41e7;
            end
            default: begin end
          endcase
        end
        9'h0df: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41e7;
              case (mant_lo4)
                4'hc: out_r = 16'h41e8;
                4'hd: out_r = 16'h41e8;
                4'he: out_r = 16'h41e8;
                4'hf: out_r = 16'h41e8;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41e8;
            end
            3'h2: begin
              out_r = 16'h41e8;
            end
            3'h3: begin
              out_r = 16'h41e8;
              case (mant_lo4)
                4'hb: out_r = 16'h41e9;
                4'hc: out_r = 16'h41e9;
                4'hd: out_r = 16'h41e9;
                4'he: out_r = 16'h41e9;
                4'hf: out_r = 16'h41e9;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h41e9;
            end
            3'h5: begin
              out_r = 16'h41e9;
            end
            3'h6: begin
              out_r = 16'h41e9;
            end
            3'h7: begin
              out_r = 16'h41e9;
              case (mant_lo4)
                4'h9: out_r = 16'h41ea;
                4'ha: out_r = 16'h41ea;
                4'hb: out_r = 16'h41ea;
                4'hc: out_r = 16'h41ea;
                4'hd: out_r = 16'h41ea;
                4'he: out_r = 16'h41ea;
                4'hf: out_r = 16'h41ea;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0e0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ea;
            end
            3'h1: begin
              out_r = 16'h41ea;
            end
            3'h2: begin
              out_r = 16'h41eb;
              case (mant_lo4)
                4'h0: out_r = 16'h41ea;
                4'h1: out_r = 16'h41ea;
                4'h2: out_r = 16'h41ea;
                4'h3: out_r = 16'h41ea;
                4'h4: out_r = 16'h41ea;
                4'h5: out_r = 16'h41ea;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41eb;
            end
            3'h4: begin
              out_r = 16'h41eb;
            end
            3'h5: begin
              out_r = 16'h41eb;
              case (mant_lo4)
                4'he: out_r = 16'h41ec;
                4'hf: out_r = 16'h41ec;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41ec;
            end
            3'h7: begin
              out_r = 16'h41ec;
            end
            default: begin end
          endcase
        end
        9'h0e1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ec;
            end
            3'h1: begin
              out_r = 16'h41ed;
              case (mant_lo4)
                4'h0: out_r = 16'h41ec;
                4'h1: out_r = 16'h41ec;
                4'h2: out_r = 16'h41ec;
                4'h3: out_r = 16'h41ec;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41ed;
            end
            3'h3: begin
              out_r = 16'h41ed;
            end
            3'h4: begin
              out_r = 16'h41ee;
              case (mant_lo4)
                4'h0: out_r = 16'h41ed;
                4'h1: out_r = 16'h41ed;
                4'h2: out_r = 16'h41ed;
                4'h3: out_r = 16'h41ed;
                4'h4: out_r = 16'h41ed;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41ee;
            end
            3'h6: begin
              out_r = 16'h41ee;
            end
            3'h7: begin
              out_r = 16'h41ee;
            end
            default: begin end
          endcase
        end
        9'h0e2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ef;
              case (mant_lo4)
                4'h0: out_r = 16'h41ee;
                4'h1: out_r = 16'h41ee;
                4'h2: out_r = 16'h41ee;
                4'h3: out_r = 16'h41ee;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41ef;
            end
            3'h2: begin
              out_r = 16'h41ef;
              case (mant_lo4)
                4'hf: out_r = 16'h41f0;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41f0;
            end
            3'h4: begin
              out_r = 16'h41f0;
            end
            3'h5: begin
              out_r = 16'h41f0;
            end
            3'h6: begin
              out_r = 16'h41f0;
              case (mant_lo4)
                4'ha: out_r = 16'h41f1;
                4'hb: out_r = 16'h41f1;
                4'hc: out_r = 16'h41f1;
                4'hd: out_r = 16'h41f1;
                4'he: out_r = 16'h41f1;
                4'hf: out_r = 16'h41f1;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41f1;
            end
            default: begin end
          endcase
        end
        9'h0e3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41f1;
            end
            3'h1: begin
              out_r = 16'h41f1;
              case (mant_lo4)
                4'hc: out_r = 16'h41f2;
                4'hd: out_r = 16'h41f2;
                4'he: out_r = 16'h41f2;
                4'hf: out_r = 16'h41f2;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41f2;
            end
            3'h3: begin
              out_r = 16'h41f2;
            end
            3'h4: begin
              out_r = 16'h41f2;
            end
            3'h5: begin
              out_r = 16'h41f3;
            end
            3'h6: begin
              out_r = 16'h41f3;
            end
            3'h7: begin
              out_r = 16'h41f3;
            end
            default: begin end
          endcase
        end
        9'h0e4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41f3;
              case (mant_lo4)
                4'hb: out_r = 16'h41f4;
                4'hc: out_r = 16'h41f4;
                4'hd: out_r = 16'h41f4;
                4'he: out_r = 16'h41f4;
                4'hf: out_r = 16'h41f4;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41f4;
            end
            3'h2: begin
              out_r = 16'h41f4;
            end
            3'h3: begin
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
            3'h4: begin
              out_r = 16'h41f5;
            end
            3'h5: begin
              out_r = 16'h41f5;
            end
            3'h6: begin
              out_r = 16'h41f5;
            end
            3'h7: begin
              out_r = 16'h41f6;
              case (mant_lo4)
                4'h0: out_r = 16'h41f5;
                4'h1: out_r = 16'h41f5;
                4'h2: out_r = 16'h41f5;
                4'h3: out_r = 16'h41f5;
                4'h4: out_r = 16'h41f5;
                4'h5: out_r = 16'h41f5;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0e5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41f6;
            end
            3'h1: begin
              out_r = 16'h41f6;
            end
            3'h2: begin
              out_r = 16'h41f7;
              case (mant_lo4)
                4'h0: out_r = 16'h41f6;
                4'h1: out_r = 16'h41f6;
                4'h2: out_r = 16'h41f6;
                4'h3: out_r = 16'h41f6;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41f7;
            end
            3'h4: begin
              out_r = 16'h41f7;
            end
            3'h5: begin
              out_r = 16'h41f7;
              case (mant_lo4)
                4'hb: out_r = 16'h41f8;
                4'hc: out_r = 16'h41f8;
                4'hd: out_r = 16'h41f8;
                4'he: out_r = 16'h41f8;
                4'hf: out_r = 16'h41f8;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h41f8;
            end
            3'h7: begin
              out_r = 16'h41f8;
            end
            default: begin end
          endcase
        end
        9'h0e6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41f8;
            end
            3'h1: begin
              out_r = 16'h41f9;
              case (mant_lo4)
                4'h0: out_r = 16'h41f8;
                4'h1: out_r = 16'h41f8;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41f9;
            end
            3'h3: begin
              out_r = 16'h41f9;
            end
            3'h4: begin
              out_r = 16'h41fa;
              case (mant_lo4)
                4'h0: out_r = 16'h41f9;
                4'h1: out_r = 16'h41f9;
                4'h2: out_r = 16'h41f9;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41fa;
            end
            3'h6: begin
              out_r = 16'h41fa;
            end
            3'h7: begin
              out_r = 16'h41fa;
            end
            default: begin end
          endcase
        end
        9'h0e7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41fb;
              case (mant_lo4)
                4'h0: out_r = 16'h41fa;
                4'h1: out_r = 16'h41fa;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h41fb;
            end
            3'h2: begin
              out_r = 16'h41fb;
              case (mant_lo4)
                4'hd: out_r = 16'h41fc;
                4'he: out_r = 16'h41fc;
                4'hf: out_r = 16'h41fc;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h41fc;
            end
            3'h4: begin
              out_r = 16'h41fc;
            end
            3'h5: begin
              out_r = 16'h41fc;
            end
            3'h6: begin
              out_r = 16'h41fd;
              case (mant_lo4)
                4'h0: out_r = 16'h41fc;
                4'h1: out_r = 16'h41fc;
                4'h2: out_r = 16'h41fc;
                4'h3: out_r = 16'h41fc;
                4'h4: out_r = 16'h41fc;
                4'h5: out_r = 16'h41fc;
                4'h6: out_r = 16'h41fc;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h41fd;
            end
            default: begin end
          endcase
        end
        9'h0e8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41fd;
            end
            3'h1: begin
              out_r = 16'h41fd;
              case (mant_lo4)
                4'ha: out_r = 16'h41fe;
                4'hb: out_r = 16'h41fe;
                4'hc: out_r = 16'h41fe;
                4'hd: out_r = 16'h41fe;
                4'he: out_r = 16'h41fe;
                4'hf: out_r = 16'h41fe;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h41fe;
            end
            3'h3: begin
              out_r = 16'h41fe;
            end
            3'h4: begin
              out_r = 16'h41fe;
              case (mant_lo4)
                4'hd: out_r = 16'h41ff;
                4'he: out_r = 16'h41ff;
                4'hf: out_r = 16'h41ff;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h41ff;
            end
            3'h6: begin
              out_r = 16'h41ff;
            end
            3'h7: begin
              out_r = 16'h41ff;
            end
            default: begin end
          endcase
        end
        9'h0e9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h41ff;
              case (mant_lo4)
                4'h9: out_r = 16'h4200;
                4'ha: out_r = 16'h4200;
                4'hb: out_r = 16'h4200;
                4'hc: out_r = 16'h4200;
                4'hd: out_r = 16'h4200;
                4'he: out_r = 16'h4200;
                4'hf: out_r = 16'h4200;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4200;
            end
            3'h2: begin
              out_r = 16'h4200;
            end
            3'h3: begin
              out_r = 16'h4200;
            end
            3'h4: begin
              out_r = 16'h4200;
            end
            3'h5: begin
              out_r = 16'h4201;
              case (mant_lo4)
                4'h0: out_r = 16'h4200;
                4'h1: out_r = 16'h4200;
                4'h2: out_r = 16'h4200;
                default: begin end
              endcase
            end
            3'h6: begin
              out_r = 16'h4201;
            end
            3'h7: begin
              out_r = 16'h4201;
            end
            default: begin end
          endcase
        end
        9'h0ea: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4201;
            end
            3'h1: begin
              out_r = 16'h4201;
            end
            3'h2: begin
              out_r = 16'h4201;
            end
            3'h3: begin
              out_r = 16'h4201;
              case (mant_lo4)
                4'hc: out_r = 16'h4202;
                4'hd: out_r = 16'h4202;
                4'he: out_r = 16'h4202;
                4'hf: out_r = 16'h4202;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4202;
            end
            3'h5: begin
              out_r = 16'h4202;
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
        9'h0eb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4202;
            end
            3'h1: begin
              out_r = 16'h4202;
            end
            3'h2: begin
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
            3'h3: begin
              out_r = 16'h4203;
            end
            3'h4: begin
              out_r = 16'h4203;
            end
            3'h5: begin
              out_r = 16'h4203;
            end
            3'h6: begin
              out_r = 16'h4203;
            end
            3'h7: begin
              out_r = 16'h4203;
            end
            default: begin end
          endcase
        end
        9'h0ec: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4203;
            end
            3'h1: begin
              out_r = 16'h4204;
              case (mant_lo4)
                4'h0: out_r = 16'h4203;
                4'h1: out_r = 16'h4203;
                4'h2: out_r = 16'h4203;
                4'h3: out_r = 16'h4203;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4204;
            end
            3'h3: begin
              out_r = 16'h4204;
            end
            3'h4: begin
              out_r = 16'h4204;
            end
            3'h5: begin
              out_r = 16'h4204;
            end
            3'h6: begin
              out_r = 16'h4204;
            end
            3'h7: begin
              out_r = 16'h4204;
            end
            default: begin end
          endcase
        end
        9'h0ed: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4205;
              case (mant_lo4)
                4'h0: out_r = 16'h4204;
                4'h1: out_r = 16'h4204;
                4'h2: out_r = 16'h4204;
                4'h3: out_r = 16'h4204;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4205;
            end
            3'h2: begin
              out_r = 16'h4205;
            end
            3'h3: begin
              out_r = 16'h4205;
            end
            3'h4: begin
              out_r = 16'h4205;
            end
            3'h5: begin
              out_r = 16'h4205;
            end
            3'h6: begin
              out_r = 16'h4205;
              case (mant_lo4)
                4'ha: out_r = 16'h4206;
                4'hb: out_r = 16'h4206;
                4'hc: out_r = 16'h4206;
                4'hd: out_r = 16'h4206;
                4'he: out_r = 16'h4206;
                4'hf: out_r = 16'h4206;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4206;
            end
            default: begin end
          endcase
        end
        9'h0ee: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4206;
            end
            3'h1: begin
              out_r = 16'h4206;
            end
            3'h2: begin
              out_r = 16'h4206;
            end
            3'h3: begin
              out_r = 16'h4206;
            end
            3'h4: begin
              out_r = 16'h4206;
            end
            3'h5: begin
              out_r = 16'h4207;
            end
            3'h6: begin
              out_r = 16'h4207;
            end
            3'h7: begin
              out_r = 16'h4207;
            end
            default: begin end
          endcase
        end
        9'h0ef: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4207;
            end
            3'h1: begin
              out_r = 16'h4207;
            end
            3'h2: begin
              out_r = 16'h4207;
            end
            3'h3: begin
              out_r = 16'h4207;
              case (mant_lo4)
                4'h9: out_r = 16'h4208;
                4'ha: out_r = 16'h4208;
                4'hb: out_r = 16'h4208;
                4'hc: out_r = 16'h4208;
                4'hd: out_r = 16'h4208;
                4'he: out_r = 16'h4208;
                4'hf: out_r = 16'h4208;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4208;
            end
            3'h5: begin
              out_r = 16'h4208;
            end
            3'h6: begin
              out_r = 16'h4208;
            end
            3'h7: begin
              out_r = 16'h4208;
            end
            default: begin end
          endcase
        end
        9'h0f0: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4208;
            end
            3'h1: begin
              out_r = 16'h4208;
            end
            3'h2: begin
              out_r = 16'h4209;
              case (mant_lo4)
                4'h0: out_r = 16'h4208;
                4'h1: out_r = 16'h4208;
                4'h2: out_r = 16'h4208;
                4'h3: out_r = 16'h4208;
                4'h4: out_r = 16'h4208;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4209;
            end
            3'h4: begin
              out_r = 16'h4209;
            end
            3'h5: begin
              out_r = 16'h4209;
            end
            3'h6: begin
              out_r = 16'h4209;
            end
            3'h7: begin
              out_r = 16'h4209;
            end
            default: begin end
          endcase
        end
        9'h0f1: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4209;
            end
            3'h1: begin
              out_r = 16'h420a;
              case (mant_lo4)
                4'h0: out_r = 16'h4209;
                4'h1: out_r = 16'h4209;
                4'h2: out_r = 16'h4209;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h420a;
            end
            3'h3: begin
              out_r = 16'h420a;
            end
            3'h4: begin
              out_r = 16'h420a;
            end
            3'h5: begin
              out_r = 16'h420a;
            end
            3'h6: begin
              out_r = 16'h420a;
            end
            3'h7: begin
              out_r = 16'h420a;
            end
            default: begin end
          endcase
        end
        9'h0f2: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420b;
              case (mant_lo4)
                4'h0: out_r = 16'h420a;
                4'h1: out_r = 16'h420a;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h420b;
            end
            3'h2: begin
              out_r = 16'h420b;
            end
            3'h3: begin
              out_r = 16'h420b;
            end
            3'h4: begin
              out_r = 16'h420b;
            end
            3'h5: begin
              out_r = 16'h420b;
            end
            3'h6: begin
              out_r = 16'h420b;
              case (mant_lo4)
                4'h8: out_r = 16'h420c;
                4'h9: out_r = 16'h420c;
                4'ha: out_r = 16'h420c;
                4'hb: out_r = 16'h420c;
                4'hc: out_r = 16'h420c;
                4'hd: out_r = 16'h420c;
                4'he: out_r = 16'h420c;
                4'hf: out_r = 16'h420c;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h420c;
            end
            default: begin end
          endcase
        end
        9'h0f3: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420c;
            end
            3'h1: begin
              out_r = 16'h420c;
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
        9'h0f4: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420d;
            end
            3'h1: begin
              out_r = 16'h420d;
            end
            3'h2: begin
              out_r = 16'h420d;
            end
            3'h3: begin
              out_r = 16'h420e;
              case (mant_lo4)
                4'h0: out_r = 16'h420d;
                4'h1: out_r = 16'h420d;
                4'h2: out_r = 16'h420d;
                4'h3: out_r = 16'h420d;
                4'h4: out_r = 16'h420d;
                4'h5: out_r = 16'h420d;
                4'h6: out_r = 16'h420d;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h420e;
            end
            3'h5: begin
              out_r = 16'h420e;
            end
            3'h6: begin
              out_r = 16'h420e;
            end
            3'h7: begin
              out_r = 16'h420e;
            end
            default: begin end
          endcase
        end
        9'h0f5: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420e;
            end
            3'h1: begin
              out_r = 16'h420e;
            end
            3'h2: begin
              out_r = 16'h420f;
              case (mant_lo4)
                4'h0: out_r = 16'h420e;
                4'h1: out_r = 16'h420e;
                4'h2: out_r = 16'h420e;
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
            end
            3'h6: begin
              out_r = 16'h420f;
            end
            3'h7: begin
              out_r = 16'h420f;
            end
            default: begin end
          endcase
        end
        9'h0f6: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h420f;
            end
            3'h1: begin
              out_r = 16'h4210;
              case (mant_lo4)
                4'h0: out_r = 16'h420f;
                default: begin end
              endcase
            end
            3'h2: begin
              out_r = 16'h4210;
            end
            3'h3: begin
              out_r = 16'h4210;
            end
            3'h4: begin
              out_r = 16'h4210;
            end
            3'h5: begin
              out_r = 16'h4210;
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
        9'h0f7: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4211;
              case (mant_lo4)
                4'h0: out_r = 16'h4210;
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
              out_r = 16'h4211;
            end
            3'h4: begin
              out_r = 16'h4211;
            end
            3'h5: begin
              out_r = 16'h4211;
            end
            3'h6: begin
              out_r = 16'h4212;
              case (mant_lo4)
                4'h0: out_r = 16'h4211;
                4'h1: out_r = 16'h4211;
                4'h2: out_r = 16'h4211;
                4'h3: out_r = 16'h4211;
                4'h4: out_r = 16'h4211;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4212;
            end
            default: begin end
          endcase
        end
        9'h0f8: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4212;
            end
            3'h1: begin
              out_r = 16'h4212;
            end
            3'h2: begin
              out_r = 16'h4212;
            end
            3'h3: begin
              out_r = 16'h4212;
            end
            3'h4: begin
              out_r = 16'h4212;
              case (mant_lo4)
                4'hc: out_r = 16'h4213;
                4'hd: out_r = 16'h4213;
                4'he: out_r = 16'h4213;
                4'hf: out_r = 16'h4213;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4213;
            end
            3'h6: begin
              out_r = 16'h4213;
            end
            3'h7: begin
              out_r = 16'h4213;
            end
            default: begin end
          endcase
        end
        9'h0f9: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4213;
            end
            3'h1: begin
              out_r = 16'h4213;
            end
            3'h2: begin
              out_r = 16'h4213;
            end
            3'h3: begin
              out_r = 16'h4214;
              case (mant_lo4)
                4'h0: out_r = 16'h4213;
                4'h1: out_r = 16'h4213;
                4'h2: out_r = 16'h4213;
                4'h3: out_r = 16'h4213;
                4'h4: out_r = 16'h4213;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h4214;
            end
            3'h5: begin
              out_r = 16'h4214;
            end
            3'h6: begin
              out_r = 16'h4214;
            end
            3'h7: begin
              out_r = 16'h4214;
            end
            default: begin end
          endcase
        end
        9'h0fa: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4214;
            end
            3'h1: begin
              out_r = 16'h4214;
            end
            3'h2: begin
              out_r = 16'h4215;
              case (mant_lo4)
                4'h0: out_r = 16'h4214;
                default: begin end
              endcase
            end
            3'h3: begin
              out_r = 16'h4215;
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
              out_r = 16'h4215;
            end
            default: begin end
          endcase
        end
        9'h0fb: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4215;
              case (mant_lo4)
                4'hf: out_r = 16'h4216;
                default: begin end
              endcase
            end
            3'h1: begin
              out_r = 16'h4216;
            end
            3'h2: begin
              out_r = 16'h4216;
            end
            3'h3: begin
              out_r = 16'h4216;
            end
            3'h4: begin
              out_r = 16'h4216;
            end
            3'h5: begin
              out_r = 16'h4216;
            end
            3'h6: begin
              out_r = 16'h4216;
            end
            3'h7: begin
              out_r = 16'h4216;
              case (mant_lo4)
                4'he: out_r = 16'h4217;
                4'hf: out_r = 16'h4217;
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h0fc: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4217;
            end
            3'h1: begin
              out_r = 16'h4217;
            end
            3'h2: begin
              out_r = 16'h4217;
            end
            3'h3: begin
              out_r = 16'h4217;
            end
            3'h4: begin
              out_r = 16'h4217;
            end
            3'h5: begin
              out_r = 16'h4217;
            end
            3'h6: begin
              out_r = 16'h4218;
              case (mant_lo4)
                4'h0: out_r = 16'h4217;
                4'h1: out_r = 16'h4217;
                default: begin end
              endcase
            end
            3'h7: begin
              out_r = 16'h4218;
            end
            default: begin end
          endcase
        end
        9'h0fd: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4218;
            end
            3'h1: begin
              out_r = 16'h4218;
            end
            3'h2: begin
              out_r = 16'h4218;
            end
            3'h3: begin
              out_r = 16'h4218;
            end
            3'h4: begin
              out_r = 16'h4218;
              case (mant_lo4)
                4'h9: out_r = 16'h4219;
                4'ha: out_r = 16'h4219;
                4'hb: out_r = 16'h4219;
                4'hc: out_r = 16'h4219;
                4'hd: out_r = 16'h4219;
                4'he: out_r = 16'h4219;
                4'hf: out_r = 16'h4219;
                default: begin end
              endcase
            end
            3'h5: begin
              out_r = 16'h4219;
            end
            3'h6: begin
              out_r = 16'h4219;
            end
            3'h7: begin
              out_r = 16'h4219;
            end
            default: begin end
          endcase
        end
        9'h0fe: begin
          case (mant_hi3)
            3'h0: begin
              out_r = 16'h4219;
            end
            3'h1: begin
              out_r = 16'h4219;
            end
            3'h2: begin
              out_r = 16'h4219;
            end
            3'h3: begin
              out_r = 16'h421a;
              case (mant_lo4)
                4'h0: out_r = 16'h4219;
                4'h1: out_r = 16'h4219;
                4'h2: out_r = 16'h4219;
                default: begin end
              endcase
            end
            3'h4: begin
              out_r = 16'h421a;
            end
            3'h5: begin
              out_r = 16'h421a;
            end
            3'h6: begin
              out_r = 16'h421a;
            end
            3'h7: begin
              out_r = 16'h421a;
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
  assign out = out_r;
endmodule
