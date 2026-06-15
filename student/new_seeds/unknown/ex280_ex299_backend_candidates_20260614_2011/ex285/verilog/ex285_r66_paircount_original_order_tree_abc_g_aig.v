module ex285_r66_paircount_original_order_tree(in, out);
  input [11:0] in;
  output reg [11:0] out;
  wire [1:0] p45 = {1'b0, in[4]} + {1'b0, in[5]};
  wire [1:0] p67 = {1'b0, in[6]} + {1'b0, in[7]};
  always @* begin
    out = 12'h000;
    if (in[0]) begin
      if (in[8]) begin
        if (in[9]) begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf0f;
                          end
                          2'd1: begin
                            out = 12'hf2f;
                          end
                          2'd2: begin
                            out = 12'hf3f;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf8f;
                          end
                          2'd1: begin
                            out = 12'hfaf;
                          end
                          2'd2: begin
                            out = 12'hfef;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf3f;
                          end
                          2'd1: begin
                            out = 12'hfbf;
                          end
                          2'd2: begin
                            out = 12'hfff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc3b;
                          end
                          2'd1: begin
                            out = 12'hf3a;
                          end
                          2'd2: begin
                            out = 12'hf3b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcbb;
                          end
                          2'd1: begin
                            out = 12'hfba;
                          end
                          2'd2: begin
                            out = 12'hfbe;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf3b;
                          end
                          2'd1: begin
                            out = 12'hfbb;
                          end
                          2'd2: begin
                            out = 12'hfbf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf0b;
                          end
                          2'd1: begin
                            out = 12'hf2b;
                          end
                          2'd2: begin
                            out = 12'hf3b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf8b;
                          end
                          2'd1: begin
                            out = 12'hfab;
                          end
                          2'd2: begin
                            out = 12'hfeb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf3b;
                          end
                          2'd1: begin
                            out = 12'hfbb;
                          end
                          2'd2: begin
                            out = 12'hffb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb38;
                          end
                          2'd1: begin
                            out = 12'ha3b;
                          end
                          2'd2: begin
                            out = 12'hb3b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbb8;
                          end
                          2'd1: begin
                            out = 12'habb;
                          end
                          2'd2: begin
                            out = 12'hebb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb3b;
                          end
                          2'd1: begin
                            out = 12'hbbb;
                          end
                          2'd2: begin
                            out = 12'hfbb;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0fb;
                          end
                          2'd1: begin
                            out = 12'h3fa;
                          end
                          2'd2: begin
                            out = 12'h3fb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8fb;
                          end
                          2'd1: begin
                            out = 12'hbfa;
                          end
                          2'd2: begin
                            out = 12'hbfe;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3fb;
                          end
                          2'd1: begin
                            out = 12'hbfb;
                          end
                          2'd2: begin
                            out = 12'hbff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h38b;
                          end
                          2'd1: begin
                            out = 12'h3ab;
                          end
                          2'd2: begin
                            out = 12'h3bb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb8b;
                          end
                          2'd1: begin
                            out = 12'hbab;
                          end
                          2'd2: begin
                            out = 12'hbeb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3bb;
                          end
                          2'd1: begin
                            out = 12'hbbb;
                          end
                          2'd2: begin
                            out = 12'hbfb;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3f0;
                          end
                          2'd1: begin
                            out = 12'h2f3;
                          end
                          2'd2: begin
                            out = 12'h3f3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3f8;
                          end
                          2'd1: begin
                            out = 12'h2fb;
                          end
                          2'd2: begin
                            out = 12'hef3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3f3;
                          end
                          2'd1: begin
                            out = 12'h3fb;
                          end
                          2'd2: begin
                            out = 12'hff3;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h383;
                          end
                          2'd1: begin
                            out = 12'h3a3;
                          end
                          2'd2: begin
                            out = 12'h3b3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h38b;
                          end
                          2'd1: begin
                            out = 12'h3ab;
                          end
                          2'd2: begin
                            out = 12'h3eb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3b3;
                          end
                          2'd1: begin
                            out = 12'h3bb;
                          end
                          2'd2: begin
                            out = 12'h3fb;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf83;
                          end
                          2'd1: begin
                            out = 12'hfa3;
                          end
                          2'd2: begin
                            out = 12'hfb3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb8f;
                          end
                          2'd1: begin
                            out = 12'hbaf;
                          end
                          2'd2: begin
                            out = 12'hbef;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfb3;
                          end
                          2'd1: begin
                            out = 12'hbbf;
                          end
                          2'd2: begin
                            out = 12'hbff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf30;
                          end
                          2'd1: begin
                            out = 12'he33;
                          end
                          2'd2: begin
                            out = 12'hf33;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfb0;
                          end
                          2'd1: begin
                            out = 12'heb3;
                          end
                          2'd2: begin
                            out = 12'hef3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf33;
                          end
                          2'd1: begin
                            out = 12'hfb3;
                          end
                          2'd2: begin
                            out = 12'hff3;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h38b;
                          end
                          2'd1: begin
                            out = 12'h3ab;
                          end
                          2'd2: begin
                            out = 12'h3bb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb8b;
                          end
                          2'd1: begin
                            out = 12'hbab;
                          end
                          2'd2: begin
                            out = 12'hbeb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3bb;
                          end
                          2'd1: begin
                            out = 12'hbbb;
                          end
                          2'd2: begin
                            out = 12'hbfb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h03b;
                          end
                          2'd1: begin
                            out = 12'h33a;
                          end
                          2'd2: begin
                            out = 12'h33b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0bb;
                          end
                          2'd1: begin
                            out = 12'h3ba;
                          end
                          2'd2: begin
                            out = 12'h3fa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h33b;
                          end
                          2'd1: begin
                            out = 12'h3bb;
                          end
                          2'd2: begin
                            out = 12'h3fb;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb38;
                          end
                          2'd1: begin
                            out = 12'ha3b;
                          end
                          2'd2: begin
                            out = 12'hb3b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbb8;
                          end
                          2'd1: begin
                            out = 12'habb;
                          end
                          2'd2: begin
                            out = 12'hebb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb3b;
                          end
                          2'd1: begin
                            out = 12'hbbb;
                          end
                          2'd2: begin
                            out = 12'hfbb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb03;
                          end
                          2'd1: begin
                            out = 12'hb23;
                          end
                          2'd2: begin
                            out = 12'hb33;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb0b;
                          end
                          2'd1: begin
                            out = 12'hb2b;
                          end
                          2'd2: begin
                            out = 12'hf2b;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb33;
                          end
                          2'd1: begin
                            out = 12'hb3b;
                          end
                          2'd2: begin
                            out = 12'hf3b;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h833;
                          end
                          2'd1: begin
                            out = 12'hb32;
                          end
                          2'd2: begin
                            out = 12'hb33;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8b3;
                          end
                          2'd1: begin
                            out = 12'hbb2;
                          end
                          2'd2: begin
                            out = 12'h3be;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb33;
                          end
                          2'd1: begin
                            out = 12'hbb3;
                          end
                          2'd2: begin
                            out = 12'h3bf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h303;
                          end
                          2'd1: begin
                            out = 12'h323;
                          end
                          2'd2: begin
                            out = 12'h333;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb03;
                          end
                          2'd1: begin
                            out = 12'hb23;
                          end
                          2'd2: begin
                            out = 12'h32f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h333;
                          end
                          2'd1: begin
                            out = 12'hb33;
                          end
                          2'd2: begin
                            out = 12'h33f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h38f;
                          end
                          2'd1: begin
                            out = 12'hf8b;
                          end
                          2'd2: begin
                            out = 12'hfcb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3af;
                          end
                          2'd1: begin
                            out = 12'hfab;
                          end
                          2'd2: begin
                            out = 12'hfbb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfcb;
                          end
                          2'd1: begin
                            out = 12'hfeb;
                          end
                          2'd2: begin
                            out = 12'hffb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf0a;
                          end
                          2'd1: begin
                            out = 12'hf8a;
                          end
                          2'd2: begin
                            out = 12'hf8e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf2a;
                          end
                          2'd1: begin
                            out = 12'hfaa;
                          end
                          2'd2: begin
                            out = 12'hfab;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf8e;
                          end
                          2'd1: begin
                            out = 12'hfae;
                          end
                          2'd2: begin
                            out = 12'hfaf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf82;
                          end
                          2'd1: begin
                            out = 12'hb8e;
                          end
                          2'd2: begin
                            out = 12'hbce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfa2;
                          end
                          2'd1: begin
                            out = 12'hbae;
                          end
                          2'd2: begin
                            out = 12'hbbe;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbce;
                          end
                          2'd1: begin
                            out = 12'hbee;
                          end
                          2'd2: begin
                            out = 12'hbfe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0e;
                          end
                          2'd1: begin
                            out = 12'ha8e;
                          end
                          2'd2: begin
                            out = 12'he8e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha2e;
                          end
                          2'd1: begin
                            out = 12'haae;
                          end
                          2'd2: begin
                            out = 12'hbae;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he8e;
                          end
                          2'd1: begin
                            out = 12'heae;
                          end
                          2'd2: begin
                            out = 12'hfae;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc3a;
                          end
                          2'd1: begin
                            out = 12'hcba;
                          end
                          2'd2: begin
                            out = 12'hcbe;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he3a;
                          end
                          2'd1: begin
                            out = 12'heba;
                          end
                          2'd2: begin
                            out = 12'hebb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcbe;
                          end
                          2'd1: begin
                            out = 12'hebe;
                          end
                          2'd2: begin
                            out = 12'hebf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ae;
                          end
                          2'd1: begin
                            out = 12'hcaa;
                          end
                          2'd2: begin
                            out = 12'hcea;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ae;
                          end
                          2'd1: begin
                            out = 12'heaa;
                          end
                          2'd2: begin
                            out = 12'heba;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcea;
                          end
                          2'd1: begin
                            out = 12'heea;
                          end
                          2'd2: begin
                            out = 12'hefa;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h83c;
                          end
                          2'd1: begin
                            out = 12'h8bc;
                          end
                          2'd2: begin
                            out = 12'hcbc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h83e;
                          end
                          2'd1: begin
                            out = 12'h8be;
                          end
                          2'd2: begin
                            out = 12'hbbc;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcbc;
                          end
                          2'd1: begin
                            out = 12'hcbe;
                          end
                          2'd2: begin
                            out = 12'hfbc;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hca0;
                          end
                          2'd1: begin
                            out = 12'h8ac;
                          end
                          2'd2: begin
                            out = 12'h8ec;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hca2;
                          end
                          2'd1: begin
                            out = 12'h8ae;
                          end
                          2'd2: begin
                            out = 12'h8be;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ec;
                          end
                          2'd1: begin
                            out = 12'h8ee;
                          end
                          2'd2: begin
                            out = 12'h8fe;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfa0;
                          end
                          2'd1: begin
                            out = 12'hbac;
                          end
                          2'd2: begin
                            out = 12'hbec;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hea3;
                          end
                          2'd1: begin
                            out = 12'haaf;
                          end
                          2'd2: begin
                            out = 12'habf;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbec;
                          end
                          2'd1: begin
                            out = 12'haef;
                          end
                          2'd2: begin
                            out = 12'haff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he03;
                          end
                          2'd1: begin
                            out = 12'he83;
                          end
                          2'd2: begin
                            out = 12'hec3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he23;
                          end
                          2'd1: begin
                            out = 12'hea3;
                          end
                          2'd2: begin
                            out = 12'hfa3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hec3;
                          end
                          2'd1: begin
                            out = 12'hee3;
                          end
                          2'd2: begin
                            out = 12'hfe3;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ae;
                          end
                          2'd1: begin
                            out = 12'hcaa;
                          end
                          2'd2: begin
                            out = 12'hcea;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ae;
                          end
                          2'd1: begin
                            out = 12'heaa;
                          end
                          2'd2: begin
                            out = 12'heba;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcea;
                          end
                          2'd1: begin
                            out = 12'heea;
                          end
                          2'd2: begin
                            out = 12'hefa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h20e;
                          end
                          2'd1: begin
                            out = 12'h28e;
                          end
                          2'd2: begin
                            out = 12'h2ce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h22e;
                          end
                          2'd1: begin
                            out = 12'h2ae;
                          end
                          2'd2: begin
                            out = 12'h2af;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ce;
                          end
                          2'd1: begin
                            out = 12'h2ee;
                          end
                          2'd2: begin
                            out = 12'h2ef;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0e;
                          end
                          2'd1: begin
                            out = 12'ha8e;
                          end
                          2'd2: begin
                            out = 12'he8e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha2e;
                          end
                          2'd1: begin
                            out = 12'haae;
                          end
                          2'd2: begin
                            out = 12'hbae;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he8e;
                          end
                          2'd1: begin
                            out = 12'heae;
                          end
                          2'd2: begin
                            out = 12'hfae;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he20;
                          end
                          2'd1: begin
                            out = 12'ha2c;
                          end
                          2'd2: begin
                            out = 12'he2c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he22;
                          end
                          2'd1: begin
                            out = 12'ha2e;
                          end
                          2'd2: begin
                            out = 12'ha3e;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he2c;
                          end
                          2'd1: begin
                            out = 12'he2e;
                          end
                          2'd2: begin
                            out = 12'he3e;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he08;
                          end
                          2'd1: begin
                            out = 12'he88;
                          end
                          2'd2: begin
                            out = 12'he8c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he28;
                          end
                          2'd1: begin
                            out = 12'hea8;
                          end
                          2'd2: begin
                            out = 12'hcab;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he8c;
                          end
                          2'd1: begin
                            out = 12'heac;
                          end
                          2'd2: begin
                            out = 12'hcaf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h02c;
                          end
                          2'd1: begin
                            out = 12'hc28;
                          end
                          2'd2: begin
                            out = 12'hc2c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h22c;
                          end
                          2'd1: begin
                            out = 12'he28;
                          end
                          2'd2: begin
                            out = 12'he38;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc2c;
                          end
                          2'd1: begin
                            out = 12'he2c;
                          end
                          2'd2: begin
                            out = 12'he3c;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end else begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb0f;
                          end
                          2'd1: begin
                            out = 12'hb8f;
                          end
                          2'd2: begin
                            out = 12'hbcf;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb2f;
                          end
                          2'd1: begin
                            out = 12'hbaf;
                          end
                          2'd2: begin
                            out = 12'hbbf;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbcf;
                          end
                          2'd1: begin
                            out = 12'hbef;
                          end
                          2'd2: begin
                            out = 12'hbff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3ca;
                          end
                          2'd1: begin
                            out = 12'hbca;
                          end
                          2'd2: begin
                            out = 12'hbce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3ea;
                          end
                          2'd1: begin
                            out = 12'hbea;
                          end
                          2'd2: begin
                            out = 12'hbeb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbce;
                          end
                          2'd1: begin
                            out = 12'hbee;
                          end
                          2'd2: begin
                            out = 12'hbef;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf0a;
                          end
                          2'd1: begin
                            out = 12'hf8a;
                          end
                          2'd2: begin
                            out = 12'hfca;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf2a;
                          end
                          2'd1: begin
                            out = 12'hfaa;
                          end
                          2'd2: begin
                            out = 12'hfba;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfca;
                          end
                          2'd1: begin
                            out = 12'hfea;
                          end
                          2'd2: begin
                            out = 12'hffa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hac2;
                          end
                          2'd1: begin
                            out = 12'haca;
                          end
                          2'd2: begin
                            out = 12'heca;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hae2;
                          end
                          2'd1: begin
                            out = 12'haea;
                          end
                          2'd2: begin
                            out = 12'hbea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'heca;
                          end
                          2'd1: begin
                            out = 12'heea;
                          end
                          2'd2: begin
                            out = 12'hfea;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0fa;
                          end
                          2'd1: begin
                            out = 12'h8fa;
                          end
                          2'd2: begin
                            out = 12'h8fe;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2fa;
                          end
                          2'd1: begin
                            out = 12'hafa;
                          end
                          2'd2: begin
                            out = 12'hafb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8fe;
                          end
                          2'd1: begin
                            out = 12'hafe;
                          end
                          2'd2: begin
                            out = 12'haff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82e;
                          end
                          2'd1: begin
                            out = 12'h8ae;
                          end
                          2'd2: begin
                            out = 12'h8ee;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha2e;
                          end
                          2'd1: begin
                            out = 12'haae;
                          end
                          2'd2: begin
                            out = 12'habe;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ee;
                          end
                          2'd1: begin
                            out = 12'haee;
                          end
                          2'd2: begin
                            out = 12'hafe;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2f0;
                          end
                          2'd1: begin
                            out = 12'h2f8;
                          end
                          2'd2: begin
                            out = 12'hef0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2f2;
                          end
                          2'd1: begin
                            out = 12'h2fa;
                          end
                          2'd2: begin
                            out = 12'h3fa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hef0;
                          end
                          2'd1: begin
                            out = 12'hef2;
                          end
                          2'd2: begin
                            out = 12'hff2;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he20;
                          end
                          2'd1: begin
                            out = 12'hea0;
                          end
                          2'd2: begin
                            out = 12'hee0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he22;
                          end
                          2'd1: begin
                            out = 12'hea2;
                          end
                          2'd2: begin
                            out = 12'heb2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hee0;
                          end
                          2'd1: begin
                            out = 12'hee2;
                          end
                          2'd2: begin
                            out = 12'hef2;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf28;
                          end
                          2'd1: begin
                            out = 12'hfa8;
                          end
                          2'd2: begin
                            out = 12'hfe8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he2b;
                          end
                          2'd1: begin
                            out = 12'heab;
                          end
                          2'd2: begin
                            out = 12'hebb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfe8;
                          end
                          2'd1: begin
                            out = 12'heeb;
                          end
                          2'd2: begin
                            out = 12'hefb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbc0;
                          end
                          2'd1: begin
                            out = 12'hbc8;
                          end
                          2'd2: begin
                            out = 12'hfc8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbe0;
                          end
                          2'd1: begin
                            out = 12'hbe8;
                          end
                          2'd2: begin
                            out = 12'hbf8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfc8;
                          end
                          2'd1: begin
                            out = 12'hfe8;
                          end
                          2'd2: begin
                            out = 12'hff8;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82e;
                          end
                          2'd1: begin
                            out = 12'h8ae;
                          end
                          2'd2: begin
                            out = 12'h8ee;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha2e;
                          end
                          2'd1: begin
                            out = 12'haae;
                          end
                          2'd2: begin
                            out = 12'habe;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ee;
                          end
                          2'd1: begin
                            out = 12'haee;
                          end
                          2'd2: begin
                            out = 12'hafe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ca;
                          end
                          2'd1: begin
                            out = 12'h8ca;
                          end
                          2'd2: begin
                            out = 12'h8ce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ea;
                          end
                          2'd1: begin
                            out = 12'h8ea;
                          end
                          2'd2: begin
                            out = 12'h8fa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ce;
                          end
                          2'd1: begin
                            out = 12'h8ee;
                          end
                          2'd2: begin
                            out = 12'h8fe;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hac2;
                          end
                          2'd1: begin
                            out = 12'haca;
                          end
                          2'd2: begin
                            out = 12'heca;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hae2;
                          end
                          2'd1: begin
                            out = 12'haea;
                          end
                          2'd2: begin
                            out = 12'hbea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'heca;
                          end
                          2'd1: begin
                            out = 12'heea;
                          end
                          2'd2: begin
                            out = 12'hfea;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he08;
                          end
                          2'd1: begin
                            out = 12'he88;
                          end
                          2'd2: begin
                            out = 12'hec8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he0a;
                          end
                          2'd1: begin
                            out = 12'he8a;
                          end
                          2'd2: begin
                            out = 12'hf8a;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hec8;
                          end
                          2'd1: begin
                            out = 12'heca;
                          end
                          2'd2: begin
                            out = 12'hfca;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2c2;
                          end
                          2'd1: begin
                            out = 12'hac2;
                          end
                          2'd2: begin
                            out = 12'h2ce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2e2;
                          end
                          2'd1: begin
                            out = 12'hae2;
                          end
                          2'd2: begin
                            out = 12'hae3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ce;
                          end
                          2'd1: begin
                            out = 12'h2ee;
                          end
                          2'd2: begin
                            out = 12'h2ef;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h00e;
                          end
                          2'd1: begin
                            out = 12'h08e;
                          end
                          2'd2: begin
                            out = 12'h0ce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h20e;
                          end
                          2'd1: begin
                            out = 12'h28e;
                          end
                          2'd2: begin
                            out = 12'h28f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ce;
                          end
                          2'd1: begin
                            out = 12'h2ce;
                          end
                          2'd2: begin
                            out = 12'h2cf;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc2e;
                          end
                          2'd1: begin
                            out = 12'he2e;
                          end
                          2'd2: begin
                            out = 12'he3e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcae;
                          end
                          2'd1: begin
                            out = 12'heae;
                          end
                          2'd2: begin
                            out = 12'heee;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he3e;
                          end
                          2'd1: begin
                            out = 12'hebe;
                          end
                          2'd2: begin
                            out = 12'hefe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he0a;
                          end
                          2'd1: begin
                            out = 12'he2a;
                          end
                          2'd2: begin
                            out = 12'he2b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he8a;
                          end
                          2'd1: begin
                            out = 12'heaa;
                          end
                          2'd2: begin
                            out = 12'heae;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he2b;
                          end
                          2'd1: begin
                            out = 12'heab;
                          end
                          2'd2: begin
                            out = 12'heaf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he28;
                          end
                          2'd1: begin
                            out = 12'he2a;
                          end
                          2'd2: begin
                            out = 12'he3a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hea8;
                          end
                          2'd1: begin
                            out = 12'heaa;
                          end
                          2'd2: begin
                            out = 12'heea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he3a;
                          end
                          2'd1: begin
                            out = 12'heba;
                          end
                          2'd2: begin
                            out = 12'hefa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0a;
                          end
                          2'd1: begin
                            out = 12'ha2a;
                          end
                          2'd2: begin
                            out = 12'hb2a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha8a;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'heaa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb2a;
                          end
                          2'd1: begin
                            out = 12'hbaa;
                          end
                          2'd2: begin
                            out = 12'hfaa;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ca;
                          end
                          2'd1: begin
                            out = 12'h2ea;
                          end
                          2'd2: begin
                            out = 12'h2eb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'haca;
                          end
                          2'd1: begin
                            out = 12'haea;
                          end
                          2'd2: begin
                            out = 12'haee;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2eb;
                          end
                          2'd1: begin
                            out = 12'haeb;
                          end
                          2'd2: begin
                            out = 12'haef;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0aa;
                          end
                          2'd1: begin
                            out = 12'h2aa;
                          end
                          2'd2: begin
                            out = 12'h2ba;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8aa;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'haea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ba;
                          end
                          2'd1: begin
                            out = 12'haba;
                          end
                          2'd2: begin
                            out = 12'hafa;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8c2;
                          end
                          2'd1: begin
                            out = 12'h8e2;
                          end
                          2'd2: begin
                            out = 12'hbe0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ca;
                          end
                          2'd1: begin
                            out = 12'h8ea;
                          end
                          2'd2: begin
                            out = 12'hcea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbe0;
                          end
                          2'd1: begin
                            out = 12'hbe8;
                          end
                          2'd2: begin
                            out = 12'hfe8;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8a0;
                          end
                          2'd1: begin
                            out = 12'h8a2;
                          end
                          2'd2: begin
                            out = 12'h8b2;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8a8;
                          end
                          2'd1: begin
                            out = 12'h8aa;
                          end
                          2'd2: begin
                            out = 12'h8ea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8b2;
                          end
                          2'd1: begin
                            out = 12'h8ba;
                          end
                          2'd2: begin
                            out = 12'h8fa;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hea0;
                          end
                          2'd1: begin
                            out = 12'hea2;
                          end
                          2'd2: begin
                            out = 12'heb2;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'haac;
                          end
                          2'd1: begin
                            out = 12'haae;
                          end
                          2'd2: begin
                            out = 12'haee;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'heb2;
                          end
                          2'd1: begin
                            out = 12'habe;
                          end
                          2'd2: begin
                            out = 12'hafe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0c;
                          end
                          2'd1: begin
                            out = 12'ha2c;
                          end
                          2'd2: begin
                            out = 12'ha3c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha8c;
                          end
                          2'd1: begin
                            out = 12'haac;
                          end
                          2'd2: begin
                            out = 12'heac;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha3c;
                          end
                          2'd1: begin
                            out = 12'habc;
                          end
                          2'd2: begin
                            out = 12'hebc;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0aa;
                          end
                          2'd1: begin
                            out = 12'h2aa;
                          end
                          2'd2: begin
                            out = 12'h2ba;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8aa;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'haea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ba;
                          end
                          2'd1: begin
                            out = 12'haba;
                          end
                          2'd2: begin
                            out = 12'hafa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h80a;
                          end
                          2'd1: begin
                            out = 12'h82a;
                          end
                          2'd2: begin
                            out = 12'h83a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h88a;
                          end
                          2'd1: begin
                            out = 12'h8aa;
                          end
                          2'd2: begin
                            out = 12'h8ae;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h83a;
                          end
                          2'd1: begin
                            out = 12'h8ba;
                          end
                          2'd2: begin
                            out = 12'h8be;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0a;
                          end
                          2'd1: begin
                            out = 12'ha2a;
                          end
                          2'd2: begin
                            out = 12'hb2a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha8a;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'heaa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb2a;
                          end
                          2'd1: begin
                            out = 12'hbaa;
                          end
                          2'd2: begin
                            out = 12'hfaa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha80;
                          end
                          2'd1: begin
                            out = 12'ha82;
                          end
                          2'd2: begin
                            out = 12'hb82;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha88;
                          end
                          2'd1: begin
                            out = 12'ha8a;
                          end
                          2'd2: begin
                            out = 12'haca;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb82;
                          end
                          2'd1: begin
                            out = 12'hb8a;
                          end
                          2'd2: begin
                            out = 12'hbca;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha08;
                          end
                          2'd1: begin
                            out = 12'ha28;
                          end
                          2'd2: begin
                            out = 12'h82b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha88;
                          end
                          2'd1: begin
                            out = 12'haa8;
                          end
                          2'd2: begin
                            out = 12'haac;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82b;
                          end
                          2'd1: begin
                            out = 12'h8ab;
                          end
                          2'd2: begin
                            out = 12'h8af;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h088;
                          end
                          2'd1: begin
                            out = 12'h288;
                          end
                          2'd2: begin
                            out = 12'h08b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h888;
                          end
                          2'd1: begin
                            out = 12'ha88;
                          end
                          2'd2: begin
                            out = 12'hac8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h08b;
                          end
                          2'd1: begin
                            out = 12'h88b;
                          end
                          2'd2: begin
                            out = 12'h8cb;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end
      end else begin
        if (in[9]) begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd0f;
                          end
                          2'd1: begin
                            out = 12'hd1f;
                          end
                          2'd2: begin
                            out = 12'hd3f;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd4f;
                          end
                          2'd1: begin
                            out = 12'hd5f;
                          end
                          2'd2: begin
                            out = 12'hddf;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd3f;
                          end
                          2'd1: begin
                            out = 12'hd7f;
                          end
                          2'd2: begin
                            out = 12'hdff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc35;
                          end
                          2'd1: begin
                            out = 12'hd35;
                          end
                          2'd2: begin
                            out = 12'hd37;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc75;
                          end
                          2'd1: begin
                            out = 12'hd75;
                          end
                          2'd2: begin
                            out = 12'hd7d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd37;
                          end
                          2'd1: begin
                            out = 12'hd77;
                          end
                          2'd2: begin
                            out = 12'hd7f;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf05;
                          end
                          2'd1: begin
                            out = 12'hf15;
                          end
                          2'd2: begin
                            out = 12'hf35;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf45;
                          end
                          2'd1: begin
                            out = 12'hf55;
                          end
                          2'd2: begin
                            out = 12'hfd5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf35;
                          end
                          2'd1: begin
                            out = 12'hf75;
                          end
                          2'd2: begin
                            out = 12'hff5;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h534;
                          end
                          2'd1: begin
                            out = 12'h535;
                          end
                          2'd2: begin
                            out = 12'h735;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h574;
                          end
                          2'd1: begin
                            out = 12'h575;
                          end
                          2'd2: begin
                            out = 12'hd75;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h735;
                          end
                          2'd1: begin
                            out = 12'h775;
                          end
                          2'd2: begin
                            out = 12'hf75;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0f5;
                          end
                          2'd1: begin
                            out = 12'h1f5;
                          end
                          2'd2: begin
                            out = 12'h1f7;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4f5;
                          end
                          2'd1: begin
                            out = 12'h5f5;
                          end
                          2'd2: begin
                            out = 12'h5fd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1f7;
                          end
                          2'd1: begin
                            out = 12'h5f7;
                          end
                          2'd2: begin
                            out = 12'h5ff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h147;
                          end
                          2'd1: begin
                            out = 12'h157;
                          end
                          2'd2: begin
                            out = 12'h177;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h547;
                          end
                          2'd1: begin
                            out = 12'h557;
                          end
                          2'd2: begin
                            out = 12'h5d7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h177;
                          end
                          2'd1: begin
                            out = 12'h577;
                          end
                          2'd2: begin
                            out = 12'h5f7;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4f0;
                          end
                          2'd1: begin
                            out = 12'h4f1;
                          end
                          2'd2: begin
                            out = 12'h7f0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4f4;
                          end
                          2'd1: begin
                            out = 12'h4f5;
                          end
                          2'd2: begin
                            out = 12'hcf5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7f0;
                          end
                          2'd1: begin
                            out = 12'h7f4;
                          end
                          2'd2: begin
                            out = 12'hff4;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h740;
                          end
                          2'd1: begin
                            out = 12'h750;
                          end
                          2'd2: begin
                            out = 12'h770;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h744;
                          end
                          2'd1: begin
                            out = 12'h754;
                          end
                          2'd2: begin
                            out = 12'h7d4;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h770;
                          end
                          2'd1: begin
                            out = 12'h774;
                          end
                          2'd2: begin
                            out = 12'h7f4;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf41;
                          end
                          2'd1: begin
                            out = 12'hf51;
                          end
                          2'd2: begin
                            out = 12'hf71;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h74d;
                          end
                          2'd1: begin
                            out = 12'h75d;
                          end
                          2'd2: begin
                            out = 12'h7dd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf71;
                          end
                          2'd1: begin
                            out = 12'h77d;
                          end
                          2'd2: begin
                            out = 12'h7fd;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd30;
                          end
                          2'd1: begin
                            out = 12'hd31;
                          end
                          2'd2: begin
                            out = 12'hf31;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd70;
                          end
                          2'd1: begin
                            out = 12'hd71;
                          end
                          2'd2: begin
                            out = 12'hdf1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf31;
                          end
                          2'd1: begin
                            out = 12'hf71;
                          end
                          2'd2: begin
                            out = 12'hff1;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h147;
                          end
                          2'd1: begin
                            out = 12'h157;
                          end
                          2'd2: begin
                            out = 12'h177;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h547;
                          end
                          2'd1: begin
                            out = 12'h557;
                          end
                          2'd2: begin
                            out = 12'h5d7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h177;
                          end
                          2'd1: begin
                            out = 12'h577;
                          end
                          2'd2: begin
                            out = 12'h5f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h035;
                          end
                          2'd1: begin
                            out = 12'h135;
                          end
                          2'd2: begin
                            out = 12'h137;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h075;
                          end
                          2'd1: begin
                            out = 12'h175;
                          end
                          2'd2: begin
                            out = 12'h1f5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h137;
                          end
                          2'd1: begin
                            out = 12'h177;
                          end
                          2'd2: begin
                            out = 12'h1f7;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h534;
                          end
                          2'd1: begin
                            out = 12'h535;
                          end
                          2'd2: begin
                            out = 12'h735;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h574;
                          end
                          2'd1: begin
                            out = 12'h575;
                          end
                          2'd2: begin
                            out = 12'hd75;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h735;
                          end
                          2'd1: begin
                            out = 12'h775;
                          end
                          2'd2: begin
                            out = 12'hf75;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h701;
                          end
                          2'd1: begin
                            out = 12'h711;
                          end
                          2'd2: begin
                            out = 12'h731;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h705;
                          end
                          2'd1: begin
                            out = 12'h715;
                          end
                          2'd2: begin
                            out = 12'hf15;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h731;
                          end
                          2'd1: begin
                            out = 12'h735;
                          end
                          2'd2: begin
                            out = 12'hf35;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h434;
                          end
                          2'd1: begin
                            out = 12'h534;
                          end
                          2'd2: begin
                            out = 12'h437;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h474;
                          end
                          2'd1: begin
                            out = 12'h574;
                          end
                          2'd2: begin
                            out = 12'h57c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h437;
                          end
                          2'd1: begin
                            out = 12'h477;
                          end
                          2'd2: begin
                            out = 12'h47f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h007;
                          end
                          2'd1: begin
                            out = 12'h017;
                          end
                          2'd2: begin
                            out = 12'h037;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h407;
                          end
                          2'd1: begin
                            out = 12'h417;
                          end
                          2'd2: begin
                            out = 12'h41f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h037;
                          end
                          2'd1: begin
                            out = 12'h437;
                          end
                          2'd2: begin
                            out = 12'h43f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h347;
                          end
                          2'd1: begin
                            out = 12'h747;
                          end
                          2'd2: begin
                            out = 12'h7c7;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h357;
                          end
                          2'd1: begin
                            out = 12'h757;
                          end
                          2'd2: begin
                            out = 12'h777;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7c7;
                          end
                          2'd1: begin
                            out = 12'h7d7;
                          end
                          2'd2: begin
                            out = 12'h7f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h705;
                          end
                          2'd1: begin
                            out = 12'h745;
                          end
                          2'd2: begin
                            out = 12'h74d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h715;
                          end
                          2'd1: begin
                            out = 12'h755;
                          end
                          2'd2: begin
                            out = 12'h757;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h74d;
                          end
                          2'd1: begin
                            out = 12'h75d;
                          end
                          2'd2: begin
                            out = 12'h75f;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h741;
                          end
                          2'd1: begin
                            out = 12'h745;
                          end
                          2'd2: begin
                            out = 12'h7c5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h751;
                          end
                          2'd1: begin
                            out = 12'h755;
                          end
                          2'd2: begin
                            out = 12'h775;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7c5;
                          end
                          2'd1: begin
                            out = 12'h7d5;
                          end
                          2'd2: begin
                            out = 12'h7f5;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h505;
                          end
                          2'd1: begin
                            out = 12'h545;
                          end
                          2'd2: begin
                            out = 12'hd45;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h515;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h755;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd45;
                          end
                          2'd1: begin
                            out = 12'hd55;
                          end
                          2'd2: begin
                            out = 12'hf55;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h435;
                          end
                          2'd1: begin
                            out = 12'h475;
                          end
                          2'd2: begin
                            out = 12'h47d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h535;
                          end
                          2'd1: begin
                            out = 12'h575;
                          end
                          2'd2: begin
                            out = 12'h577;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h47d;
                          end
                          2'd1: begin
                            out = 12'h57d;
                          end
                          2'd2: begin
                            out = 12'h57f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h055;
                          end
                          2'd1: begin
                            out = 12'h455;
                          end
                          2'd2: begin
                            out = 12'h4d5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h155;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h575;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4d5;
                          end
                          2'd1: begin
                            out = 12'h5d5;
                          end
                          2'd2: begin
                            out = 12'h5f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h134;
                          end
                          2'd1: begin
                            out = 12'h174;
                          end
                          2'd2: begin
                            out = 12'hd70;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h135;
                          end
                          2'd1: begin
                            out = 12'h175;
                          end
                          2'd2: begin
                            out = 12'h375;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd70;
                          end
                          2'd1: begin
                            out = 12'hd71;
                          end
                          2'd2: begin
                            out = 12'hf71;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h150;
                          end
                          2'd1: begin
                            out = 12'h154;
                          end
                          2'd2: begin
                            out = 12'h1d4;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h151;
                          end
                          2'd1: begin
                            out = 12'h155;
                          end
                          2'd2: begin
                            out = 12'h175;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1d4;
                          end
                          2'd1: begin
                            out = 12'h1d5;
                          end
                          2'd2: begin
                            out = 12'h1f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h750;
                          end
                          2'd1: begin
                            out = 12'h754;
                          end
                          2'd2: begin
                            out = 12'h7d4;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h553;
                          end
                          2'd1: begin
                            out = 12'h557;
                          end
                          2'd2: begin
                            out = 12'h577;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7d4;
                          end
                          2'd1: begin
                            out = 12'h5d7;
                          end
                          2'd2: begin
                            out = 12'h5f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h503;
                          end
                          2'd1: begin
                            out = 12'h543;
                          end
                          2'd2: begin
                            out = 12'h5c3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h513;
                          end
                          2'd1: begin
                            out = 12'h553;
                          end
                          2'd2: begin
                            out = 12'h753;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h5c3;
                          end
                          2'd1: begin
                            out = 12'h5d3;
                          end
                          2'd2: begin
                            out = 12'h7d3;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h055;
                          end
                          2'd1: begin
                            out = 12'h455;
                          end
                          2'd2: begin
                            out = 12'h4d5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h155;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h575;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4d5;
                          end
                          2'd1: begin
                            out = 12'h5d5;
                          end
                          2'd2: begin
                            out = 12'h5f5;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h105;
                          end
                          2'd1: begin
                            out = 12'h145;
                          end
                          2'd2: begin
                            out = 12'h1c5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h115;
                          end
                          2'd1: begin
                            out = 12'h155;
                          end
                          2'd2: begin
                            out = 12'h157;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1c5;
                          end
                          2'd1: begin
                            out = 12'h1d5;
                          end
                          2'd2: begin
                            out = 12'h1d7;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h505;
                          end
                          2'd1: begin
                            out = 12'h545;
                          end
                          2'd2: begin
                            out = 12'hd45;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h515;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h755;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd45;
                          end
                          2'd1: begin
                            out = 12'hd55;
                          end
                          2'd2: begin
                            out = 12'hf55;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h510;
                          end
                          2'd1: begin
                            out = 12'h514;
                          end
                          2'd2: begin
                            out = 12'hd14;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h511;
                          end
                          2'd1: begin
                            out = 12'h515;
                          end
                          2'd2: begin
                            out = 12'h535;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd14;
                          end
                          2'd1: begin
                            out = 12'hd15;
                          end
                          2'd2: begin
                            out = 12'hd35;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h501;
                          end
                          2'd1: begin
                            out = 12'h541;
                          end
                          2'd2: begin
                            out = 12'h14d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h511;
                          end
                          2'd1: begin
                            out = 12'h551;
                          end
                          2'd2: begin
                            out = 12'h553;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h14d;
                          end
                          2'd1: begin
                            out = 12'h15d;
                          end
                          2'd2: begin
                            out = 12'h15f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h011;
                          end
                          2'd1: begin
                            out = 12'h411;
                          end
                          2'd2: begin
                            out = 12'h01d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h111;
                          end
                          2'd1: begin
                            out = 12'h511;
                          end
                          2'd2: begin
                            out = 12'h531;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h01d;
                          end
                          2'd1: begin
                            out = 12'h11d;
                          end
                          2'd2: begin
                            out = 12'h13d;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end else begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc0f;
                          end
                          2'd1: begin
                            out = 12'hc4f;
                          end
                          2'd2: begin
                            out = 12'hccf;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc1f;
                          end
                          2'd1: begin
                            out = 12'hc5f;
                          end
                          2'd2: begin
                            out = 12'hc7f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hccf;
                          end
                          2'd1: begin
                            out = 12'hcdf;
                          end
                          2'd2: begin
                            out = 12'hcff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1cc;
                          end
                          2'd1: begin
                            out = 12'hdc4;
                          end
                          2'd2: begin
                            out = 12'hdcc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1dc;
                          end
                          2'd1: begin
                            out = 12'hdd4;
                          end
                          2'd2: begin
                            out = 12'hcd7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hdcc;
                          end
                          2'd1: begin
                            out = 12'hddc;
                          end
                          2'd2: begin
                            out = 12'hcdf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf04;
                          end
                          2'd1: begin
                            out = 12'hf44;
                          end
                          2'd2: begin
                            out = 12'hfc4;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf14;
                          end
                          2'd1: begin
                            out = 12'hf54;
                          end
                          2'd2: begin
                            out = 12'hf74;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfc4;
                          end
                          2'd1: begin
                            out = 12'hfd4;
                          end
                          2'd2: begin
                            out = 12'hff4;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4c1;
                          end
                          2'd1: begin
                            out = 12'h4c5;
                          end
                          2'd2: begin
                            out = 12'hcc5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4d1;
                          end
                          2'd1: begin
                            out = 12'h4d5;
                          end
                          2'd2: begin
                            out = 12'h7d4;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc5;
                          end
                          2'd1: begin
                            out = 12'hcd5;
                          end
                          2'd2: begin
                            out = 12'hfd4;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0f4;
                          end
                          2'd1: begin
                            out = 12'h4f4;
                          end
                          2'd2: begin
                            out = 12'h4fc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1f4;
                          end
                          2'd1: begin
                            out = 12'h5f4;
                          end
                          2'd2: begin
                            out = 12'h4f7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4fc;
                          end
                          2'd1: begin
                            out = 12'h5fc;
                          end
                          2'd2: begin
                            out = 12'h4ff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h41c;
                          end
                          2'd1: begin
                            out = 12'h45c;
                          end
                          2'd2: begin
                            out = 12'h4dc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h51c;
                          end
                          2'd1: begin
                            out = 12'h55c;
                          end
                          2'd2: begin
                            out = 12'h57c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4dc;
                          end
                          2'd1: begin
                            out = 12'h5dc;
                          end
                          2'd2: begin
                            out = 12'h5fc;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0f0;
                          end
                          2'd1: begin
                            out = 12'h0f4;
                          end
                          2'd2: begin
                            out = 12'hcf0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0f1;
                          end
                          2'd1: begin
                            out = 12'h0f5;
                          end
                          2'd2: begin
                            out = 12'h3f4;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcf0;
                          end
                          2'd1: begin
                            out = 12'hcf1;
                          end
                          2'd2: begin
                            out = 12'hff0;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc10;
                          end
                          2'd1: begin
                            out = 12'hc50;
                          end
                          2'd2: begin
                            out = 12'hcd0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc11;
                          end
                          2'd1: begin
                            out = 12'hc51;
                          end
                          2'd2: begin
                            out = 12'hc71;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcd0;
                          end
                          2'd1: begin
                            out = 12'hcd1;
                          end
                          2'd2: begin
                            out = 12'hcf1;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc1c;
                          end
                          2'd1: begin
                            out = 12'hc5c;
                          end
                          2'd2: begin
                            out = 12'hcdc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc1d;
                          end
                          2'd1: begin
                            out = 12'hc5d;
                          end
                          2'd2: begin
                            out = 12'hc7d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcdc;
                          end
                          2'd1: begin
                            out = 12'hcdd;
                          end
                          2'd2: begin
                            out = 12'hcfd;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc0;
                          end
                          2'd1: begin
                            out = 12'h4cc;
                          end
                          2'd2: begin
                            out = 12'hccc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcd0;
                          end
                          2'd1: begin
                            out = 12'h4dc;
                          end
                          2'd2: begin
                            out = 12'h4fc;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hccc;
                          end
                          2'd1: begin
                            out = 12'hcdc;
                          end
                          2'd2: begin
                            out = 12'hcfc;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h41c;
                          end
                          2'd1: begin
                            out = 12'h45c;
                          end
                          2'd2: begin
                            out = 12'h4dc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h51c;
                          end
                          2'd1: begin
                            out = 12'h55c;
                          end
                          2'd2: begin
                            out = 12'h57c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4dc;
                          end
                          2'd1: begin
                            out = 12'h5dc;
                          end
                          2'd2: begin
                            out = 12'h5fc;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0c4;
                          end
                          2'd1: begin
                            out = 12'h4c4;
                          end
                          2'd2: begin
                            out = 12'h4cc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0d4;
                          end
                          2'd1: begin
                            out = 12'h4d4;
                          end
                          2'd2: begin
                            out = 12'h4f4;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4cc;
                          end
                          2'd1: begin
                            out = 12'h4dc;
                          end
                          2'd2: begin
                            out = 12'h4fc;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4c1;
                          end
                          2'd1: begin
                            out = 12'h4c5;
                          end
                          2'd2: begin
                            out = 12'hcc5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4d1;
                          end
                          2'd1: begin
                            out = 12'h4d5;
                          end
                          2'd2: begin
                            out = 12'h7d4;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc5;
                          end
                          2'd1: begin
                            out = 12'hcd5;
                          end
                          2'd2: begin
                            out = 12'hfd4;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc04;
                          end
                          2'd1: begin
                            out = 12'hc44;
                          end
                          2'd2: begin
                            out = 12'hcc4;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc05;
                          end
                          2'd1: begin
                            out = 12'hc45;
                          end
                          2'd2: begin
                            out = 12'hf44;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc4;
                          end
                          2'd1: begin
                            out = 12'hcc5;
                          end
                          2'd2: begin
                            out = 12'hfc4;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1c0;
                          end
                          2'd1: begin
                            out = 12'h5c0;
                          end
                          2'd2: begin
                            out = 12'h1cc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1d0;
                          end
                          2'd1: begin
                            out = 12'h5d0;
                          end
                          2'd2: begin
                            out = 12'h4d3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1cc;
                          end
                          2'd1: begin
                            out = 12'h1dc;
                          end
                          2'd2: begin
                            out = 12'h0df;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h00c;
                          end
                          2'd1: begin
                            out = 12'h04c;
                          end
                          2'd2: begin
                            out = 12'h0cc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h10c;
                          end
                          2'd1: begin
                            out = 12'h14c;
                          end
                          2'd2: begin
                            out = 12'h04f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0cc;
                          end
                          2'd1: begin
                            out = 12'h1cc;
                          end
                          2'd2: begin
                            out = 12'h0cf;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h01f;
                          end
                          2'd1: begin
                            out = 12'h31d;
                          end
                          2'd2: begin
                            out = 12'h33d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h05f;
                          end
                          2'd1: begin
                            out = 12'h35d;
                          end
                          2'd2: begin
                            out = 12'h3dd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h33d;
                          end
                          2'd1: begin
                            out = 12'h37d;
                          end
                          2'd2: begin
                            out = 12'h3fd;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h701;
                          end
                          2'd1: begin
                            out = 12'h711;
                          end
                          2'd2: begin
                            out = 12'h713;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h741;
                          end
                          2'd1: begin
                            out = 12'h751;
                          end
                          2'd2: begin
                            out = 12'h35d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h713;
                          end
                          2'd1: begin
                            out = 12'h753;
                          end
                          2'd2: begin
                            out = 12'h35f;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd10;
                          end
                          2'd1: begin
                            out = 12'hd11;
                          end
                          2'd2: begin
                            out = 12'hd31;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd50;
                          end
                          2'd1: begin
                            out = 12'hd51;
                          end
                          2'd2: begin
                            out = 12'hdd1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd31;
                          end
                          2'd1: begin
                            out = 12'hd71;
                          end
                          2'd2: begin
                            out = 12'hdf1;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h105;
                          end
                          2'd1: begin
                            out = 12'h115;
                          end
                          2'd2: begin
                            out = 12'h315;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h145;
                          end
                          2'd1: begin
                            out = 12'h155;
                          end
                          2'd2: begin
                            out = 12'hd51;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h315;
                          end
                          2'd1: begin
                            out = 12'h355;
                          end
                          2'd2: begin
                            out = 12'hf51;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1c1;
                          end
                          2'd1: begin
                            out = 12'h1d1;
                          end
                          2'd2: begin
                            out = 12'h1d3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h5c1;
                          end
                          2'd1: begin
                            out = 12'h5d1;
                          end
                          2'd2: begin
                            out = 12'h1dd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1d3;
                          end
                          2'd1: begin
                            out = 12'h5d3;
                          end
                          2'd2: begin
                            out = 12'h1df;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h051;
                          end
                          2'd1: begin
                            out = 12'h151;
                          end
                          2'd2: begin
                            out = 12'h171;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h451;
                          end
                          2'd1: begin
                            out = 12'h551;
                          end
                          2'd2: begin
                            out = 12'h5d1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h171;
                          end
                          2'd1: begin
                            out = 12'h571;
                          end
                          2'd2: begin
                            out = 12'h5f1;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0c1;
                          end
                          2'd1: begin
                            out = 12'h0d1;
                          end
                          2'd2: begin
                            out = 12'h3d0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0c5;
                          end
                          2'd1: begin
                            out = 12'h0d5;
                          end
                          2'd2: begin
                            out = 12'hcd1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3d0;
                          end
                          2'd1: begin
                            out = 12'h3d4;
                          end
                          2'd2: begin
                            out = 12'hfd0;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h050;
                          end
                          2'd1: begin
                            out = 12'h051;
                          end
                          2'd2: begin
                            out = 12'h071;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h054;
                          end
                          2'd1: begin
                            out = 12'h055;
                          end
                          2'd2: begin
                            out = 12'h0d5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h071;
                          end
                          2'd1: begin
                            out = 12'h075;
                          end
                          2'd2: begin
                            out = 12'h0f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h350;
                          end
                          2'd1: begin
                            out = 12'h153;
                          end
                          2'd2: begin
                            out = 12'h173;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h354;
                          end
                          2'd1: begin
                            out = 12'h157;
                          end
                          2'd2: begin
                            out = 12'h1d7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h173;
                          end
                          2'd1: begin
                            out = 12'h177;
                          end
                          2'd2: begin
                            out = 12'h1f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h304;
                          end
                          2'd1: begin
                            out = 12'h314;
                          end
                          2'd2: begin
                            out = 12'h334;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h344;
                          end
                          2'd1: begin
                            out = 12'h354;
                          end
                          2'd2: begin
                            out = 12'hf50;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h334;
                          end
                          2'd1: begin
                            out = 12'h374;
                          end
                          2'd2: begin
                            out = 12'hf70;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h051;
                          end
                          2'd1: begin
                            out = 12'h151;
                          end
                          2'd2: begin
                            out = 12'h171;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h451;
                          end
                          2'd1: begin
                            out = 12'h551;
                          end
                          2'd2: begin
                            out = 12'h5d1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h171;
                          end
                          2'd1: begin
                            out = 12'h571;
                          end
                          2'd2: begin
                            out = 12'h5f1;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h401;
                          end
                          2'd1: begin
                            out = 12'h411;
                          end
                          2'd2: begin
                            out = 12'h431;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h441;
                          end
                          2'd1: begin
                            out = 12'h451;
                          end
                          2'd2: begin
                            out = 12'h05d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h431;
                          end
                          2'd1: begin
                            out = 12'h471;
                          end
                          2'd2: begin
                            out = 12'h07d;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h105;
                          end
                          2'd1: begin
                            out = 12'h115;
                          end
                          2'd2: begin
                            out = 12'h315;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h145;
                          end
                          2'd1: begin
                            out = 12'h155;
                          end
                          2'd2: begin
                            out = 12'hd51;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h315;
                          end
                          2'd1: begin
                            out = 12'h355;
                          end
                          2'd2: begin
                            out = 12'hf51;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h140;
                          end
                          2'd1: begin
                            out = 12'h141;
                          end
                          2'd2: begin
                            out = 12'h341;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h144;
                          end
                          2'd1: begin
                            out = 12'h145;
                          end
                          2'd2: begin
                            out = 12'h1c5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h341;
                          end
                          2'd1: begin
                            out = 12'h345;
                          end
                          2'd2: begin
                            out = 12'h3c5;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h500;
                          end
                          2'd1: begin
                            out = 12'h510;
                          end
                          2'd2: begin
                            out = 12'h413;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h540;
                          end
                          2'd1: begin
                            out = 12'h550;
                          end
                          2'd2: begin
                            out = 12'h15c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h413;
                          end
                          2'd1: begin
                            out = 12'h453;
                          end
                          2'd2: begin
                            out = 12'h05f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h040;
                          end
                          2'd1: begin
                            out = 12'h140;
                          end
                          2'd2: begin
                            out = 12'h043;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h440;
                          end
                          2'd1: begin
                            out = 12'h540;
                          end
                          2'd2: begin
                            out = 12'h5c0;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h043;
                          end
                          2'd1: begin
                            out = 12'h443;
                          end
                          2'd2: begin
                            out = 12'h4c3;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end
      end
    end else begin
      if (in[8]) begin
        if (in[9]) begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc1f;
                          end
                          2'd1: begin
                            out = 12'hf1d;
                          end
                          2'd2: begin
                            out = 12'hf3d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc5f;
                          end
                          2'd1: begin
                            out = 12'hf5d;
                          end
                          2'd2: begin
                            out = 12'hfdd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf3d;
                          end
                          2'd1: begin
                            out = 12'hf7d;
                          end
                          2'd2: begin
                            out = 12'hffd;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf05;
                          end
                          2'd1: begin
                            out = 12'hf15;
                          end
                          2'd2: begin
                            out = 12'hf17;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf45;
                          end
                          2'd1: begin
                            out = 12'hf55;
                          end
                          2'd2: begin
                            out = 12'hf5d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf17;
                          end
                          2'd1: begin
                            out = 12'hf57;
                          end
                          2'd2: begin
                            out = 12'hf5f;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf14;
                          end
                          2'd1: begin
                            out = 12'hd17;
                          end
                          2'd2: begin
                            out = 12'hd37;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf54;
                          end
                          2'd1: begin
                            out = 12'hd57;
                          end
                          2'd2: begin
                            out = 12'hdd7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd37;
                          end
                          2'd1: begin
                            out = 12'hd77;
                          end
                          2'd2: begin
                            out = 12'hdf7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h507;
                          end
                          2'd1: begin
                            out = 12'h517;
                          end
                          2'd2: begin
                            out = 12'h717;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h547;
                          end
                          2'd1: begin
                            out = 12'h557;
                          end
                          2'd2: begin
                            out = 12'hd57;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h717;
                          end
                          2'd1: begin
                            out = 12'h757;
                          end
                          2'd2: begin
                            out = 12'hf57;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3c5;
                          end
                          2'd1: begin
                            out = 12'h3d5;
                          end
                          2'd2: begin
                            out = 12'h3d7;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7c5;
                          end
                          2'd1: begin
                            out = 12'h7d5;
                          end
                          2'd2: begin
                            out = 12'h7dd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3d7;
                          end
                          2'd1: begin
                            out = 12'h7d7;
                          end
                          2'd2: begin
                            out = 12'h7df;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h057;
                          end
                          2'd1: begin
                            out = 12'h355;
                          end
                          2'd2: begin
                            out = 12'h375;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h457;
                          end
                          2'd1: begin
                            out = 12'h755;
                          end
                          2'd2: begin
                            out = 12'h7d5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h375;
                          end
                          2'd1: begin
                            out = 12'h775;
                          end
                          2'd2: begin
                            out = 12'h7f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1c3;
                          end
                          2'd1: begin
                            out = 12'h1d3;
                          end
                          2'd2: begin
                            out = 12'h3d3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1c7;
                          end
                          2'd1: begin
                            out = 12'h1d7;
                          end
                          2'd2: begin
                            out = 12'hdd3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h3d3;
                          end
                          2'd1: begin
                            out = 12'h3d7;
                          end
                          2'd2: begin
                            out = 12'hfd3;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h350;
                          end
                          2'd1: begin
                            out = 12'h153;
                          end
                          2'd2: begin
                            out = 12'h173;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h354;
                          end
                          2'd1: begin
                            out = 12'h157;
                          end
                          2'd2: begin
                            out = 12'h1d7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h173;
                          end
                          2'd1: begin
                            out = 12'h177;
                          end
                          2'd2: begin
                            out = 12'h1f7;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf50;
                          end
                          2'd1: begin
                            out = 12'hd53;
                          end
                          2'd2: begin
                            out = 12'hd73;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h75c;
                          end
                          2'd1: begin
                            out = 12'h55f;
                          end
                          2'd2: begin
                            out = 12'h5df;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd73;
                          end
                          2'd1: begin
                            out = 12'h57f;
                          end
                          2'd2: begin
                            out = 12'h5ff;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h70c;
                          end
                          2'd1: begin
                            out = 12'h71c;
                          end
                          2'd2: begin
                            out = 12'h73c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h74c;
                          end
                          2'd1: begin
                            out = 12'h75c;
                          end
                          2'd2: begin
                            out = 12'hf5c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h73c;
                          end
                          2'd1: begin
                            out = 12'h77c;
                          end
                          2'd2: begin
                            out = 12'hf7c;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h057;
                          end
                          2'd1: begin
                            out = 12'h355;
                          end
                          2'd2: begin
                            out = 12'h375;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h457;
                          end
                          2'd1: begin
                            out = 12'h755;
                          end
                          2'd2: begin
                            out = 12'h7d5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h375;
                          end
                          2'd1: begin
                            out = 12'h775;
                          end
                          2'd2: begin
                            out = 12'h7f5;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h407;
                          end
                          2'd1: begin
                            out = 12'h417;
                          end
                          2'd2: begin
                            out = 12'h437;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h447;
                          end
                          2'd1: begin
                            out = 12'h457;
                          end
                          2'd2: begin
                            out = 12'h45f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h437;
                          end
                          2'd1: begin
                            out = 12'h477;
                          end
                          2'd2: begin
                            out = 12'h47f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h507;
                          end
                          2'd1: begin
                            out = 12'h517;
                          end
                          2'd2: begin
                            out = 12'h717;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h547;
                          end
                          2'd1: begin
                            out = 12'h557;
                          end
                          2'd2: begin
                            out = 12'hd57;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h717;
                          end
                          2'd1: begin
                            out = 12'h757;
                          end
                          2'd2: begin
                            out = 12'hf57;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h740;
                          end
                          2'd1: begin
                            out = 12'h543;
                          end
                          2'd2: begin
                            out = 12'h743;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h744;
                          end
                          2'd1: begin
                            out = 12'h547;
                          end
                          2'd2: begin
                            out = 12'h5c7;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h743;
                          end
                          2'd1: begin
                            out = 12'h747;
                          end
                          2'd2: begin
                            out = 12'h7c7;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h701;
                          end
                          2'd1: begin
                            out = 12'h711;
                          end
                          2'd2: begin
                            out = 12'h713;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h741;
                          end
                          2'd1: begin
                            out = 12'h751;
                          end
                          2'd2: begin
                            out = 12'h35d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h713;
                          end
                          2'd1: begin
                            out = 12'h753;
                          end
                          2'd2: begin
                            out = 12'h35f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h043;
                          end
                          2'd1: begin
                            out = 12'h341;
                          end
                          2'd2: begin
                            out = 12'h343;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h443;
                          end
                          2'd1: begin
                            out = 12'h741;
                          end
                          2'd2: begin
                            out = 12'h7c1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h343;
                          end
                          2'd1: begin
                            out = 12'h743;
                          end
                          2'd2: begin
                            out = 12'h7c3;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc0f;
                          end
                          2'd1: begin
                            out = 12'hc4f;
                          end
                          2'd2: begin
                            out = 12'hccf;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf0d;
                          end
                          2'd1: begin
                            out = 12'hf4d;
                          end
                          2'd2: begin
                            out = 12'hf4f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hccf;
                          end
                          2'd1: begin
                            out = 12'hfcd;
                          end
                          2'd2: begin
                            out = 12'hfcf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc07;
                          end
                          2'd1: begin
                            out = 12'hc47;
                          end
                          2'd2: begin
                            out = 12'hc4f;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc17;
                          end
                          2'd1: begin
                            out = 12'hc57;
                          end
                          2'd2: begin
                            out = 12'hc77;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc4f;
                          end
                          2'd1: begin
                            out = 12'hc5f;
                          end
                          2'd2: begin
                            out = 12'hc7f;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd0c;
                          end
                          2'd1: begin
                            out = 12'hd4c;
                          end
                          2'd2: begin
                            out = 12'hdcc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd0d;
                          end
                          2'd1: begin
                            out = 12'hd4d;
                          end
                          2'd2: begin
                            out = 12'hf4d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hdcc;
                          end
                          2'd1: begin
                            out = 12'hdcd;
                          end
                          2'd2: begin
                            out = 12'hfcd;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h50c;
                          end
                          2'd1: begin
                            out = 12'h54c;
                          end
                          2'd2: begin
                            out = 12'hd4c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h51c;
                          end
                          2'd1: begin
                            out = 12'h55c;
                          end
                          2'd2: begin
                            out = 12'h57c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd4c;
                          end
                          2'd1: begin
                            out = 12'hd5c;
                          end
                          2'd2: begin
                            out = 12'hd7c;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0cd;
                          end
                          2'd1: begin
                            out = 12'hcc5;
                          end
                          2'd2: begin
                            out = 12'hccd;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0dd;
                          end
                          2'd1: begin
                            out = 12'hcd5;
                          end
                          2'd2: begin
                            out = 12'hcf5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hccd;
                          end
                          2'd1: begin
                            out = 12'hcdd;
                          end
                          2'd2: begin
                            out = 12'hcfd;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h04d;
                          end
                          2'd1: begin
                            out = 12'hc45;
                          end
                          2'd2: begin
                            out = 12'hcc5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h14d;
                          end
                          2'd1: begin
                            out = 12'hd45;
                          end
                          2'd2: begin
                            out = 12'hd47;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc5;
                          end
                          2'd1: begin
                            out = 12'hdc5;
                          end
                          2'd2: begin
                            out = 12'hdc7;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc0;
                          end
                          2'd1: begin
                            out = 12'h4cc;
                          end
                          2'd2: begin
                            out = 12'hccc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcd0;
                          end
                          2'd1: begin
                            out = 12'h4dc;
                          end
                          2'd2: begin
                            out = 12'h4fc;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hccc;
                          end
                          2'd1: begin
                            out = 12'hcdc;
                          end
                          2'd2: begin
                            out = 12'hcfc;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc40;
                          end
                          2'd1: begin
                            out = 12'h44c;
                          end
                          2'd2: begin
                            out = 12'h4cc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc41;
                          end
                          2'd1: begin
                            out = 12'h44d;
                          end
                          2'd2: begin
                            out = 12'h74c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4cc;
                          end
                          2'd1: begin
                            out = 12'h4cd;
                          end
                          2'd2: begin
                            out = 12'h7cc;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf40;
                          end
                          2'd1: begin
                            out = 12'h74c;
                          end
                          2'd2: begin
                            out = 12'h7cc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd43;
                          end
                          2'd1: begin
                            out = 12'h54f;
                          end
                          2'd2: begin
                            out = 12'h74f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7cc;
                          end
                          2'd1: begin
                            out = 12'h5cf;
                          end
                          2'd2: begin
                            out = 12'h7cf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf00;
                          end
                          2'd1: begin
                            out = 12'hf40;
                          end
                          2'd2: begin
                            out = 12'hfc0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hf10;
                          end
                          2'd1: begin
                            out = 12'hf50;
                          end
                          2'd2: begin
                            out = 12'hf70;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hfc0;
                          end
                          2'd1: begin
                            out = 12'hfd0;
                          end
                          2'd2: begin
                            out = 12'hff0;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h04d;
                          end
                          2'd1: begin
                            out = 12'hc45;
                          end
                          2'd2: begin
                            out = 12'hcc5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h14d;
                          end
                          2'd1: begin
                            out = 12'hd45;
                          end
                          2'd2: begin
                            out = 12'hd47;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc5;
                          end
                          2'd1: begin
                            out = 12'hdc5;
                          end
                          2'd2: begin
                            out = 12'hdc7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h00d;
                          end
                          2'd1: begin
                            out = 12'h04d;
                          end
                          2'd2: begin
                            out = 12'h0cd;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h01d;
                          end
                          2'd1: begin
                            out = 12'h05d;
                          end
                          2'd2: begin
                            out = 12'h07d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0cd;
                          end
                          2'd1: begin
                            out = 12'h0dd;
                          end
                          2'd2: begin
                            out = 12'h0fd;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h50c;
                          end
                          2'd1: begin
                            out = 12'h54c;
                          end
                          2'd2: begin
                            out = 12'hd4c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h51c;
                          end
                          2'd1: begin
                            out = 12'h55c;
                          end
                          2'd2: begin
                            out = 12'h57c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd4c;
                          end
                          2'd1: begin
                            out = 12'hd5c;
                          end
                          2'd2: begin
                            out = 12'hd7c;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd00;
                          end
                          2'd1: begin
                            out = 12'h50c;
                          end
                          2'd2: begin
                            out = 12'hd0c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd01;
                          end
                          2'd1: begin
                            out = 12'h50d;
                          end
                          2'd2: begin
                            out = 12'h70d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd0c;
                          end
                          2'd1: begin
                            out = 12'hd0d;
                          end
                          2'd2: begin
                            out = 12'hf0d;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc04;
                          end
                          2'd1: begin
                            out = 12'hc44;
                          end
                          2'd2: begin
                            out = 12'hc4c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc14;
                          end
                          2'd1: begin
                            out = 12'hc54;
                          end
                          2'd2: begin
                            out = 12'hc74;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc4c;
                          end
                          2'd1: begin
                            out = 12'hc5c;
                          end
                          2'd2: begin
                            out = 12'hc7c;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h00c;
                          end
                          2'd1: begin
                            out = 12'hc04;
                          end
                          2'd2: begin
                            out = 12'hc0c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h10c;
                          end
                          2'd1: begin
                            out = 12'hd04;
                          end
                          2'd2: begin
                            out = 12'hc07;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc0c;
                          end
                          2'd1: begin
                            out = 12'hd0c;
                          end
                          2'd2: begin
                            out = 12'hc0f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end else begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h347;
                          end
                          2'd1: begin
                            out = 12'h747;
                          end
                          2'd2: begin
                            out = 12'h7c7;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h357;
                          end
                          2'd1: begin
                            out = 12'h757;
                          end
                          2'd2: begin
                            out = 12'h777;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7c7;
                          end
                          2'd1: begin
                            out = 12'h7d7;
                          end
                          2'd2: begin
                            out = 12'h7f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h705;
                          end
                          2'd1: begin
                            out = 12'h745;
                          end
                          2'd2: begin
                            out = 12'h74d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h715;
                          end
                          2'd1: begin
                            out = 12'h755;
                          end
                          2'd2: begin
                            out = 12'h757;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h74d;
                          end
                          2'd1: begin
                            out = 12'h75d;
                          end
                          2'd2: begin
                            out = 12'h75f;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h741;
                          end
                          2'd1: begin
                            out = 12'h745;
                          end
                          2'd2: begin
                            out = 12'h7c5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h751;
                          end
                          2'd1: begin
                            out = 12'h755;
                          end
                          2'd2: begin
                            out = 12'h775;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7c5;
                          end
                          2'd1: begin
                            out = 12'h7d5;
                          end
                          2'd2: begin
                            out = 12'h7f5;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h505;
                          end
                          2'd1: begin
                            out = 12'h545;
                          end
                          2'd2: begin
                            out = 12'hd45;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h515;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h755;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd45;
                          end
                          2'd1: begin
                            out = 12'hd55;
                          end
                          2'd2: begin
                            out = 12'hf55;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h435;
                          end
                          2'd1: begin
                            out = 12'h475;
                          end
                          2'd2: begin
                            out = 12'h47d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h535;
                          end
                          2'd1: begin
                            out = 12'h575;
                          end
                          2'd2: begin
                            out = 12'h577;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h47d;
                          end
                          2'd1: begin
                            out = 12'h57d;
                          end
                          2'd2: begin
                            out = 12'h57f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h055;
                          end
                          2'd1: begin
                            out = 12'h455;
                          end
                          2'd2: begin
                            out = 12'h4d5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h155;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h575;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4d5;
                          end
                          2'd1: begin
                            out = 12'h5d5;
                          end
                          2'd2: begin
                            out = 12'h5f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h134;
                          end
                          2'd1: begin
                            out = 12'h174;
                          end
                          2'd2: begin
                            out = 12'hd70;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h135;
                          end
                          2'd1: begin
                            out = 12'h175;
                          end
                          2'd2: begin
                            out = 12'h375;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd70;
                          end
                          2'd1: begin
                            out = 12'hd71;
                          end
                          2'd2: begin
                            out = 12'hf71;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h150;
                          end
                          2'd1: begin
                            out = 12'h154;
                          end
                          2'd2: begin
                            out = 12'h1d4;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h151;
                          end
                          2'd1: begin
                            out = 12'h155;
                          end
                          2'd2: begin
                            out = 12'h175;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1d4;
                          end
                          2'd1: begin
                            out = 12'h1d5;
                          end
                          2'd2: begin
                            out = 12'h1f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h750;
                          end
                          2'd1: begin
                            out = 12'h754;
                          end
                          2'd2: begin
                            out = 12'h7d4;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h553;
                          end
                          2'd1: begin
                            out = 12'h557;
                          end
                          2'd2: begin
                            out = 12'h577;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h7d4;
                          end
                          2'd1: begin
                            out = 12'h5d7;
                          end
                          2'd2: begin
                            out = 12'h5f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h503;
                          end
                          2'd1: begin
                            out = 12'h543;
                          end
                          2'd2: begin
                            out = 12'h5c3;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h513;
                          end
                          2'd1: begin
                            out = 12'h553;
                          end
                          2'd2: begin
                            out = 12'h753;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h5c3;
                          end
                          2'd1: begin
                            out = 12'h5d3;
                          end
                          2'd2: begin
                            out = 12'h7d3;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h055;
                          end
                          2'd1: begin
                            out = 12'h455;
                          end
                          2'd2: begin
                            out = 12'h4d5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h155;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h575;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h4d5;
                          end
                          2'd1: begin
                            out = 12'h5d5;
                          end
                          2'd2: begin
                            out = 12'h5f5;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h105;
                          end
                          2'd1: begin
                            out = 12'h145;
                          end
                          2'd2: begin
                            out = 12'h1c5;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h115;
                          end
                          2'd1: begin
                            out = 12'h155;
                          end
                          2'd2: begin
                            out = 12'h157;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h1c5;
                          end
                          2'd1: begin
                            out = 12'h1d5;
                          end
                          2'd2: begin
                            out = 12'h1d7;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h505;
                          end
                          2'd1: begin
                            out = 12'h545;
                          end
                          2'd2: begin
                            out = 12'hd45;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h515;
                          end
                          2'd1: begin
                            out = 12'h555;
                          end
                          2'd2: begin
                            out = 12'h755;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd45;
                          end
                          2'd1: begin
                            out = 12'hd55;
                          end
                          2'd2: begin
                            out = 12'hf55;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h510;
                          end
                          2'd1: begin
                            out = 12'h514;
                          end
                          2'd2: begin
                            out = 12'hd14;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h511;
                          end
                          2'd1: begin
                            out = 12'h515;
                          end
                          2'd2: begin
                            out = 12'h535;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd14;
                          end
                          2'd1: begin
                            out = 12'hd15;
                          end
                          2'd2: begin
                            out = 12'hd35;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h501;
                          end
                          2'd1: begin
                            out = 12'h541;
                          end
                          2'd2: begin
                            out = 12'h14d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h511;
                          end
                          2'd1: begin
                            out = 12'h551;
                          end
                          2'd2: begin
                            out = 12'h553;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h14d;
                          end
                          2'd1: begin
                            out = 12'h15d;
                          end
                          2'd2: begin
                            out = 12'h15f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h011;
                          end
                          2'd1: begin
                            out = 12'h411;
                          end
                          2'd2: begin
                            out = 12'h01d;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h111;
                          end
                          2'd1: begin
                            out = 12'h511;
                          end
                          2'd2: begin
                            out = 12'h531;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h01d;
                          end
                          2'd1: begin
                            out = 12'h11d;
                          end
                          2'd2: begin
                            out = 12'h13d;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h10f;
                          end
                          2'd1: begin
                            out = 12'h11f;
                          end
                          2'd2: begin
                            out = 12'h13f;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd07;
                          end
                          2'd1: begin
                            out = 12'hd17;
                          end
                          2'd2: begin
                            out = 12'hd1f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h13f;
                          end
                          2'd1: begin
                            out = 12'hd37;
                          end
                          2'd2: begin
                            out = 12'hd3f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h10d;
                          end
                          2'd1: begin
                            out = 12'h11d;
                          end
                          2'd2: begin
                            out = 12'h11f;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h14d;
                          end
                          2'd1: begin
                            out = 12'h15d;
                          end
                          2'd2: begin
                            out = 12'h1dd;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h11f;
                          end
                          2'd1: begin
                            out = 12'h15f;
                          end
                          2'd2: begin
                            out = 12'h1df;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h701;
                          end
                          2'd1: begin
                            out = 12'h711;
                          end
                          2'd2: begin
                            out = 12'h731;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h705;
                          end
                          2'd1: begin
                            out = 12'h715;
                          end
                          2'd2: begin
                            out = 12'hf15;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h731;
                          end
                          2'd1: begin
                            out = 12'h735;
                          end
                          2'd2: begin
                            out = 12'hf35;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h501;
                          end
                          2'd1: begin
                            out = 12'h511;
                          end
                          2'd2: begin
                            out = 12'h711;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h541;
                          end
                          2'd1: begin
                            out = 12'h551;
                          end
                          2'd2: begin
                            out = 12'h5d1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h711;
                          end
                          2'd1: begin
                            out = 12'h751;
                          end
                          2'd2: begin
                            out = 12'h7d1;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h035;
                          end
                          2'd1: begin
                            out = 12'h135;
                          end
                          2'd2: begin
                            out = 12'h137;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h075;
                          end
                          2'd1: begin
                            out = 12'h175;
                          end
                          2'd2: begin
                            out = 12'h1f5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h137;
                          end
                          2'd1: begin
                            out = 12'h177;
                          end
                          2'd2: begin
                            out = 12'h1f7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h015;
                          end
                          2'd1: begin
                            out = 12'h115;
                          end
                          2'd2: begin
                            out = 12'h135;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h415;
                          end
                          2'd1: begin
                            out = 12'h515;
                          end
                          2'd2: begin
                            out = 12'h51d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h135;
                          end
                          2'd1: begin
                            out = 12'h535;
                          end
                          2'd2: begin
                            out = 12'h53d;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h430;
                          end
                          2'd1: begin
                            out = 12'h431;
                          end
                          2'd2: begin
                            out = 12'h730;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h470;
                          end
                          2'd1: begin
                            out = 12'h471;
                          end
                          2'd2: begin
                            out = 12'h4f1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h730;
                          end
                          2'd1: begin
                            out = 12'h770;
                          end
                          2'd2: begin
                            out = 12'h7f0;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h410;
                          end
                          2'd1: begin
                            out = 12'h411;
                          end
                          2'd2: begin
                            out = 12'h431;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h414;
                          end
                          2'd1: begin
                            out = 12'h415;
                          end
                          2'd2: begin
                            out = 12'hc15;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h431;
                          end
                          2'd1: begin
                            out = 12'h435;
                          end
                          2'd2: begin
                            out = 12'hc35;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd10;
                          end
                          2'd1: begin
                            out = 12'hd11;
                          end
                          2'd2: begin
                            out = 12'hd31;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h51c;
                          end
                          2'd1: begin
                            out = 12'h51d;
                          end
                          2'd2: begin
                            out = 12'hd1d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd31;
                          end
                          2'd1: begin
                            out = 12'h53d;
                          end
                          2'd2: begin
                            out = 12'hd3d;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd00;
                          end
                          2'd1: begin
                            out = 12'hd10;
                          end
                          2'd2: begin
                            out = 12'hd30;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd40;
                          end
                          2'd1: begin
                            out = 12'hd50;
                          end
                          2'd2: begin
                            out = 12'hdd0;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hd30;
                          end
                          2'd1: begin
                            out = 12'hd70;
                          end
                          2'd2: begin
                            out = 12'hdf0;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h015;
                          end
                          2'd1: begin
                            out = 12'h115;
                          end
                          2'd2: begin
                            out = 12'h135;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h415;
                          end
                          2'd1: begin
                            out = 12'h515;
                          end
                          2'd2: begin
                            out = 12'h51d;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h135;
                          end
                          2'd1: begin
                            out = 12'h535;
                          end
                          2'd2: begin
                            out = 12'h53d;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h005;
                          end
                          2'd1: begin
                            out = 12'h015;
                          end
                          2'd2: begin
                            out = 12'h035;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h045;
                          end
                          2'd1: begin
                            out = 12'h055;
                          end
                          2'd2: begin
                            out = 12'h0d5;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h035;
                          end
                          2'd1: begin
                            out = 12'h075;
                          end
                          2'd2: begin
                            out = 12'h0f5;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h501;
                          end
                          2'd1: begin
                            out = 12'h511;
                          end
                          2'd2: begin
                            out = 12'h711;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h541;
                          end
                          2'd1: begin
                            out = 12'h551;
                          end
                          2'd2: begin
                            out = 12'h5d1;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h711;
                          end
                          2'd1: begin
                            out = 12'h751;
                          end
                          2'd2: begin
                            out = 12'h7d1;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h500;
                          end
                          2'd1: begin
                            out = 12'h501;
                          end
                          2'd2: begin
                            out = 12'h701;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h504;
                          end
                          2'd1: begin
                            out = 12'h505;
                          end
                          2'd2: begin
                            out = 12'hd05;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h701;
                          end
                          2'd1: begin
                            out = 12'h705;
                          end
                          2'd2: begin
                            out = 12'hf05;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h104;
                          end
                          2'd1: begin
                            out = 12'h114;
                          end
                          2'd2: begin
                            out = 12'h017;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h144;
                          end
                          2'd1: begin
                            out = 12'h154;
                          end
                          2'd2: begin
                            out = 12'h1d4;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h017;
                          end
                          2'd1: begin
                            out = 12'h057;
                          end
                          2'd2: begin
                            out = 12'h0d7;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h004;
                          end
                          2'd1: begin
                            out = 12'h104;
                          end
                          2'd2: begin
                            out = 12'h007;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h404;
                          end
                          2'd1: begin
                            out = 12'h504;
                          end
                          2'd2: begin
                            out = 12'h50c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h007;
                          end
                          2'd1: begin
                            out = 12'h407;
                          end
                          2'd2: begin
                            out = 12'h40f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end
      end else begin
        if (in[9]) begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc2e;
                          end
                          2'd1: begin
                            out = 12'he2e;
                          end
                          2'd2: begin
                            out = 12'he3e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcae;
                          end
                          2'd1: begin
                            out = 12'heae;
                          end
                          2'd2: begin
                            out = 12'heee;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he3e;
                          end
                          2'd1: begin
                            out = 12'hebe;
                          end
                          2'd2: begin
                            out = 12'hefe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he0a;
                          end
                          2'd1: begin
                            out = 12'he2a;
                          end
                          2'd2: begin
                            out = 12'he2b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he8a;
                          end
                          2'd1: begin
                            out = 12'heaa;
                          end
                          2'd2: begin
                            out = 12'heae;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he2b;
                          end
                          2'd1: begin
                            out = 12'heab;
                          end
                          2'd2: begin
                            out = 12'heaf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he28;
                          end
                          2'd1: begin
                            out = 12'he2a;
                          end
                          2'd2: begin
                            out = 12'he3a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hea8;
                          end
                          2'd1: begin
                            out = 12'heaa;
                          end
                          2'd2: begin
                            out = 12'heea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he3a;
                          end
                          2'd1: begin
                            out = 12'heba;
                          end
                          2'd2: begin
                            out = 12'hefa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0a;
                          end
                          2'd1: begin
                            out = 12'ha2a;
                          end
                          2'd2: begin
                            out = 12'hb2a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha8a;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'heaa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb2a;
                          end
                          2'd1: begin
                            out = 12'hbaa;
                          end
                          2'd2: begin
                            out = 12'hfaa;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ca;
                          end
                          2'd1: begin
                            out = 12'h2ea;
                          end
                          2'd2: begin
                            out = 12'h2eb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'haca;
                          end
                          2'd1: begin
                            out = 12'haea;
                          end
                          2'd2: begin
                            out = 12'haee;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2eb;
                          end
                          2'd1: begin
                            out = 12'haeb;
                          end
                          2'd2: begin
                            out = 12'haef;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0aa;
                          end
                          2'd1: begin
                            out = 12'h2aa;
                          end
                          2'd2: begin
                            out = 12'h2ba;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8aa;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'haea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ba;
                          end
                          2'd1: begin
                            out = 12'haba;
                          end
                          2'd2: begin
                            out = 12'hafa;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8c2;
                          end
                          2'd1: begin
                            out = 12'h8e2;
                          end
                          2'd2: begin
                            out = 12'hbe0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ca;
                          end
                          2'd1: begin
                            out = 12'h8ea;
                          end
                          2'd2: begin
                            out = 12'hcea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbe0;
                          end
                          2'd1: begin
                            out = 12'hbe8;
                          end
                          2'd2: begin
                            out = 12'hfe8;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8a0;
                          end
                          2'd1: begin
                            out = 12'h8a2;
                          end
                          2'd2: begin
                            out = 12'h8b2;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8a8;
                          end
                          2'd1: begin
                            out = 12'h8aa;
                          end
                          2'd2: begin
                            out = 12'h8ea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8b2;
                          end
                          2'd1: begin
                            out = 12'h8ba;
                          end
                          2'd2: begin
                            out = 12'h8fa;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hea0;
                          end
                          2'd1: begin
                            out = 12'hea2;
                          end
                          2'd2: begin
                            out = 12'heb2;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'haac;
                          end
                          2'd1: begin
                            out = 12'haae;
                          end
                          2'd2: begin
                            out = 12'haee;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'heb2;
                          end
                          2'd1: begin
                            out = 12'habe;
                          end
                          2'd2: begin
                            out = 12'hafe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0c;
                          end
                          2'd1: begin
                            out = 12'ha2c;
                          end
                          2'd2: begin
                            out = 12'ha3c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha8c;
                          end
                          2'd1: begin
                            out = 12'haac;
                          end
                          2'd2: begin
                            out = 12'heac;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha3c;
                          end
                          2'd1: begin
                            out = 12'habc;
                          end
                          2'd2: begin
                            out = 12'hebc;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0aa;
                          end
                          2'd1: begin
                            out = 12'h2aa;
                          end
                          2'd2: begin
                            out = 12'h2ba;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8aa;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'haea;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2ba;
                          end
                          2'd1: begin
                            out = 12'haba;
                          end
                          2'd2: begin
                            out = 12'hafa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h80a;
                          end
                          2'd1: begin
                            out = 12'h82a;
                          end
                          2'd2: begin
                            out = 12'h83a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h88a;
                          end
                          2'd1: begin
                            out = 12'h8aa;
                          end
                          2'd2: begin
                            out = 12'h8ae;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h83a;
                          end
                          2'd1: begin
                            out = 12'h8ba;
                          end
                          2'd2: begin
                            out = 12'h8be;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha0a;
                          end
                          2'd1: begin
                            out = 12'ha2a;
                          end
                          2'd2: begin
                            out = 12'hb2a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha8a;
                          end
                          2'd1: begin
                            out = 12'haaa;
                          end
                          2'd2: begin
                            out = 12'heaa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb2a;
                          end
                          2'd1: begin
                            out = 12'hbaa;
                          end
                          2'd2: begin
                            out = 12'hfaa;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha80;
                          end
                          2'd1: begin
                            out = 12'ha82;
                          end
                          2'd2: begin
                            out = 12'hb82;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha88;
                          end
                          2'd1: begin
                            out = 12'ha8a;
                          end
                          2'd2: begin
                            out = 12'haca;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb82;
                          end
                          2'd1: begin
                            out = 12'hb8a;
                          end
                          2'd2: begin
                            out = 12'hbca;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha08;
                          end
                          2'd1: begin
                            out = 12'ha28;
                          end
                          2'd2: begin
                            out = 12'h82b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha88;
                          end
                          2'd1: begin
                            out = 12'haa8;
                          end
                          2'd2: begin
                            out = 12'haac;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82b;
                          end
                          2'd1: begin
                            out = 12'h8ab;
                          end
                          2'd2: begin
                            out = 12'h8af;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h088;
                          end
                          2'd1: begin
                            out = 12'h288;
                          end
                          2'd2: begin
                            out = 12'h08b;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h888;
                          end
                          2'd1: begin
                            out = 12'ha88;
                          end
                          2'd2: begin
                            out = 12'hac8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h08b;
                          end
                          2'd1: begin
                            out = 12'h88b;
                          end
                          2'd2: begin
                            out = 12'h8cb;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h80f;
                          end
                          2'd1: begin
                            out = 12'h88f;
                          end
                          2'd2: begin
                            out = 12'h8cf;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb0e;
                          end
                          2'd1: begin
                            out = 12'hb8e;
                          end
                          2'd2: begin
                            out = 12'hb8f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8cf;
                          end
                          2'd1: begin
                            out = 12'hbce;
                          end
                          2'd2: begin
                            out = 12'hbcf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h80b;
                          end
                          2'd1: begin
                            out = 12'h88b;
                          end
                          2'd2: begin
                            out = 12'h88f;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82b;
                          end
                          2'd1: begin
                            out = 12'h8ab;
                          end
                          2'd2: begin
                            out = 12'h8bb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h88f;
                          end
                          2'd1: begin
                            out = 12'h8af;
                          end
                          2'd2: begin
                            out = 12'h8bf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he08;
                          end
                          2'd1: begin
                            out = 12'he88;
                          end
                          2'd2: begin
                            out = 12'hec8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he0a;
                          end
                          2'd1: begin
                            out = 12'he8a;
                          end
                          2'd2: begin
                            out = 12'hf8a;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hec8;
                          end
                          2'd1: begin
                            out = 12'heca;
                          end
                          2'd2: begin
                            out = 12'hfca;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha08;
                          end
                          2'd1: begin
                            out = 12'ha88;
                          end
                          2'd2: begin
                            out = 12'he88;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha28;
                          end
                          2'd1: begin
                            out = 12'haa8;
                          end
                          2'd2: begin
                            out = 12'hab8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he88;
                          end
                          2'd1: begin
                            out = 12'hea8;
                          end
                          2'd2: begin
                            out = 12'heb8;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ca;
                          end
                          2'd1: begin
                            out = 12'h8ca;
                          end
                          2'd2: begin
                            out = 12'h8ce;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ea;
                          end
                          2'd1: begin
                            out = 12'h8ea;
                          end
                          2'd2: begin
                            out = 12'h8fa;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ce;
                          end
                          2'd1: begin
                            out = 12'h8ee;
                          end
                          2'd2: begin
                            out = 12'h8fe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h08a;
                          end
                          2'd1: begin
                            out = 12'h88a;
                          end
                          2'd2: begin
                            out = 12'h8ca;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h28a;
                          end
                          2'd1: begin
                            out = 12'ha8a;
                          end
                          2'd2: begin
                            out = 12'ha8b;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ca;
                          end
                          2'd1: begin
                            out = 12'haca;
                          end
                          2'd2: begin
                            out = 12'hacb;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2c0;
                          end
                          2'd1: begin
                            out = 12'h2c8;
                          end
                          2'd2: begin
                            out = 12'hec0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2e0;
                          end
                          2'd1: begin
                            out = 12'h2e8;
                          end
                          2'd2: begin
                            out = 12'h2f8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hec0;
                          end
                          2'd1: begin
                            out = 12'hee0;
                          end
                          2'd2: begin
                            out = 12'hef0;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h280;
                          end
                          2'd1: begin
                            out = 12'h288;
                          end
                          2'd2: begin
                            out = 12'h2c8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h282;
                          end
                          2'd1: begin
                            out = 12'h28a;
                          end
                          2'd2: begin
                            out = 12'h38a;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2c8;
                          end
                          2'd1: begin
                            out = 12'h2ca;
                          end
                          2'd2: begin
                            out = 12'h3ca;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb80;
                          end
                          2'd1: begin
                            out = 12'hb88;
                          end
                          2'd2: begin
                            out = 12'hbc8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha83;
                          end
                          2'd1: begin
                            out = 12'ha8b;
                          end
                          2'd2: begin
                            out = 12'hb8b;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbc8;
                          end
                          2'd1: begin
                            out = 12'hacb;
                          end
                          2'd2: begin
                            out = 12'hbcb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb00;
                          end
                          2'd1: begin
                            out = 12'hb80;
                          end
                          2'd2: begin
                            out = 12'hbc0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb20;
                          end
                          2'd1: begin
                            out = 12'hba0;
                          end
                          2'd2: begin
                            out = 12'hbb0;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbc0;
                          end
                          2'd1: begin
                            out = 12'hbe0;
                          end
                          2'd2: begin
                            out = 12'hbf0;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h08a;
                          end
                          2'd1: begin
                            out = 12'h88a;
                          end
                          2'd2: begin
                            out = 12'h8ca;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h28a;
                          end
                          2'd1: begin
                            out = 12'ha8a;
                          end
                          2'd2: begin
                            out = 12'ha8b;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ca;
                          end
                          2'd1: begin
                            out = 12'haca;
                          end
                          2'd2: begin
                            out = 12'hacb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h00a;
                          end
                          2'd1: begin
                            out = 12'h08a;
                          end
                          2'd2: begin
                            out = 12'h0ca;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h02a;
                          end
                          2'd1: begin
                            out = 12'h0aa;
                          end
                          2'd2: begin
                            out = 12'h0ba;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0ca;
                          end
                          2'd1: begin
                            out = 12'h0ea;
                          end
                          2'd2: begin
                            out = 12'h0fa;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha08;
                          end
                          2'd1: begin
                            out = 12'ha88;
                          end
                          2'd2: begin
                            out = 12'he88;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha28;
                          end
                          2'd1: begin
                            out = 12'haa8;
                          end
                          2'd2: begin
                            out = 12'hab8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he88;
                          end
                          2'd1: begin
                            out = 12'hea8;
                          end
                          2'd2: begin
                            out = 12'heb8;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha00;
                          end
                          2'd1: begin
                            out = 12'ha08;
                          end
                          2'd2: begin
                            out = 12'he08;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha02;
                          end
                          2'd1: begin
                            out = 12'ha0a;
                          end
                          2'd2: begin
                            out = 12'hb0a;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he08;
                          end
                          2'd1: begin
                            out = 12'he0a;
                          end
                          2'd2: begin
                            out = 12'hf0a;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h802;
                          end
                          2'd1: begin
                            out = 12'h882;
                          end
                          2'd2: begin
                            out = 12'h08e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h822;
                          end
                          2'd1: begin
                            out = 12'h8a2;
                          end
                          2'd2: begin
                            out = 12'h8b2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h08e;
                          end
                          2'd1: begin
                            out = 12'h0ae;
                          end
                          2'd2: begin
                            out = 12'h0be;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h002;
                          end
                          2'd1: begin
                            out = 12'h802;
                          end
                          2'd2: begin
                            out = 12'h00e;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h202;
                          end
                          2'd1: begin
                            out = 12'ha02;
                          end
                          2'd2: begin
                            out = 12'ha03;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h00e;
                          end
                          2'd1: begin
                            out = 12'h20e;
                          end
                          2'd2: begin
                            out = 12'h20f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end else begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h08f;
                          end
                          2'd1: begin
                            out = 12'hc8b;
                          end
                          2'd2: begin
                            out = 12'hccb;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0af;
                          end
                          2'd1: begin
                            out = 12'hcab;
                          end
                          2'd2: begin
                            out = 12'hcbb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hccb;
                          end
                          2'd1: begin
                            out = 12'hceb;
                          end
                          2'd2: begin
                            out = 12'hcfb;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he08;
                          end
                          2'd1: begin
                            out = 12'he88;
                          end
                          2'd2: begin
                            out = 12'he8c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he28;
                          end
                          2'd1: begin
                            out = 12'hea8;
                          end
                          2'd2: begin
                            out = 12'hcab;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'he8c;
                          end
                          2'd1: begin
                            out = 12'heac;
                          end
                          2'd2: begin
                            out = 12'hcaf;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb80;
                          end
                          2'd1: begin
                            out = 12'hb88;
                          end
                          2'd2: begin
                            out = 12'hbc8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hba0;
                          end
                          2'd1: begin
                            out = 12'hba8;
                          end
                          2'd2: begin
                            out = 12'hbb8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hbc8;
                          end
                          2'd1: begin
                            out = 12'hbe8;
                          end
                          2'd2: begin
                            out = 12'hbf8;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h80a;
                          end
                          2'd1: begin
                            out = 12'h88a;
                          end
                          2'd2: begin
                            out = 12'hc8a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82a;
                          end
                          2'd1: begin
                            out = 12'h8aa;
                          end
                          2'd2: begin
                            out = 12'hba8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc8a;
                          end
                          2'd1: begin
                            out = 12'hcaa;
                          end
                          2'd2: begin
                            out = 12'hfa8;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h838;
                          end
                          2'd1: begin
                            out = 12'h8b8;
                          end
                          2'd2: begin
                            out = 12'h8bc;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha38;
                          end
                          2'd1: begin
                            out = 12'hab8;
                          end
                          2'd2: begin
                            out = 12'h8bb;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8bc;
                          end
                          2'd1: begin
                            out = 12'habc;
                          end
                          2'd2: begin
                            out = 12'h8bf;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0a8;
                          end
                          2'd1: begin
                            out = 12'h8a8;
                          end
                          2'd2: begin
                            out = 12'h8e8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2a8;
                          end
                          2'd1: begin
                            out = 12'haa8;
                          end
                          2'd2: begin
                            out = 12'hab8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8e8;
                          end
                          2'd1: begin
                            out = 12'hae8;
                          end
                          2'd2: begin
                            out = 12'haf8;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h038;
                          end
                          2'd1: begin
                            out = 12'h0b8;
                          end
                          2'd2: begin
                            out = 12'hcb0;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h03a;
                          end
                          2'd1: begin
                            out = 12'h0ba;
                          end
                          2'd2: begin
                            out = 12'h3b8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcb0;
                          end
                          2'd1: begin
                            out = 12'hcb2;
                          end
                          2'd2: begin
                            out = 12'hfb0;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0a0;
                          end
                          2'd1: begin
                            out = 12'h0a8;
                          end
                          2'd2: begin
                            out = 12'h0e8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0a2;
                          end
                          2'd1: begin
                            out = 12'h0aa;
                          end
                          2'd2: begin
                            out = 12'h0ba;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0e8;
                          end
                          2'd1: begin
                            out = 12'h0ea;
                          end
                          2'd2: begin
                            out = 12'h0fa;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hca0;
                          end
                          2'd1: begin
                            out = 12'h8ac;
                          end
                          2'd2: begin
                            out = 12'h8ec;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hca2;
                          end
                          2'd1: begin
                            out = 12'h8ae;
                          end
                          2'd2: begin
                            out = 12'h8be;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8ec;
                          end
                          2'd1: begin
                            out = 12'h8ee;
                          end
                          2'd2: begin
                            out = 12'h8fe;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc02;
                          end
                          2'd1: begin
                            out = 12'hc82;
                          end
                          2'd2: begin
                            out = 12'hcc2;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc22;
                          end
                          2'd1: begin
                            out = 12'hca2;
                          end
                          2'd2: begin
                            out = 12'hfa0;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hcc2;
                          end
                          2'd1: begin
                            out = 12'hce2;
                          end
                          2'd2: begin
                            out = 12'hfe0;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0a8;
                          end
                          2'd1: begin
                            out = 12'h8a8;
                          end
                          2'd2: begin
                            out = 12'h8e8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2a8;
                          end
                          2'd1: begin
                            out = 12'haa8;
                          end
                          2'd2: begin
                            out = 12'hab8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h8e8;
                          end
                          2'd1: begin
                            out = 12'hae8;
                          end
                          2'd2: begin
                            out = 12'haf8;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h208;
                          end
                          2'd1: begin
                            out = 12'h288;
                          end
                          2'd2: begin
                            out = 12'h2c8;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h228;
                          end
                          2'd1: begin
                            out = 12'h2a8;
                          end
                          2'd2: begin
                            out = 12'h0ab;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h2c8;
                          end
                          2'd1: begin
                            out = 12'h2e8;
                          end
                          2'd2: begin
                            out = 12'h0eb;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h80a;
                          end
                          2'd1: begin
                            out = 12'h88a;
                          end
                          2'd2: begin
                            out = 12'hc8a;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h82a;
                          end
                          2'd1: begin
                            out = 12'h8aa;
                          end
                          2'd2: begin
                            out = 12'hba8;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc8a;
                          end
                          2'd1: begin
                            out = 12'hcaa;
                          end
                          2'd2: begin
                            out = 12'hfa8;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h820;
                          end
                          2'd1: begin
                            out = 12'h828;
                          end
                          2'd2: begin
                            out = 12'hc28;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h822;
                          end
                          2'd1: begin
                            out = 12'h82a;
                          end
                          2'd2: begin
                            out = 12'h83a;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hc28;
                          end
                          2'd1: begin
                            out = 12'hc2a;
                          end
                          2'd2: begin
                            out = 12'hc3a;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha00;
                          end
                          2'd1: begin
                            out = 12'ha80;
                          end
                          2'd2: begin
                            out = 12'h28c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'ha20;
                          end
                          2'd1: begin
                            out = 12'haa0;
                          end
                          2'd2: begin
                            out = 12'h8a3;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h28c;
                          end
                          2'd1: begin
                            out = 12'h2ac;
                          end
                          2'd2: begin
                            out = 12'h0af;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h020;
                          end
                          2'd1: begin
                            out = 12'h820;
                          end
                          2'd2: begin
                            out = 12'h02c;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h220;
                          end
                          2'd1: begin
                            out = 12'ha20;
                          end
                          2'd2: begin
                            out = 12'ha30;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h02c;
                          end
                          2'd1: begin
                            out = 12'h22c;
                          end
                          2'd2: begin
                            out = 12'h23c;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h303;
                          end
                          2'd1: begin
                            out = 12'h323;
                          end
                          2'd2: begin
                            out = 12'h333;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'hb03;
                          end
                          2'd1: begin
                            out = 12'hb23;
                          end
                          2'd2: begin
                            out = 12'h32f;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h333;
                          end
                          2'd1: begin
                            out = 12'hb33;
                          end
                          2'd2: begin
                            out = 12'h33f;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h302;
                          end
                          2'd1: begin
                            out = 12'h322;
                          end
                          2'd2: begin
                            out = 12'h323;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h382;
                          end
                          2'd1: begin
                            out = 12'h3a2;
                          end
                          2'd2: begin
                            out = 12'h3e2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h323;
                          end
                          2'd1: begin
                            out = 12'h3a3;
                          end
                          2'd2: begin
                            out = 12'h3e3;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h302;
                          end
                          2'd1: begin
                            out = 12'h322;
                          end
                          2'd2: begin
                            out = 12'h332;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h30a;
                          end
                          2'd1: begin
                            out = 12'h32a;
                          end
                          2'd2: begin
                            out = 12'hf22;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h332;
                          end
                          2'd1: begin
                            out = 12'h33a;
                          end
                          2'd2: begin
                            out = 12'hf32;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h202;
                          end
                          2'd1: begin
                            out = 12'h222;
                          end
                          2'd2: begin
                            out = 12'h322;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h282;
                          end
                          2'd1: begin
                            out = 12'h2a2;
                          end
                          2'd2: begin
                            out = 12'h2e2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h322;
                          end
                          2'd1: begin
                            out = 12'h3a2;
                          end
                          2'd2: begin
                            out = 12'h3e2;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h032;
                          end
                          2'd1: begin
                            out = 12'h232;
                          end
                          2'd2: begin
                            out = 12'h233;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0b2;
                          end
                          2'd1: begin
                            out = 12'h2b2;
                          end
                          2'd2: begin
                            out = 12'h2f2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h233;
                          end
                          2'd1: begin
                            out = 12'h2b3;
                          end
                          2'd2: begin
                            out = 12'h2f3;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h022;
                          end
                          2'd1: begin
                            out = 12'h222;
                          end
                          2'd2: begin
                            out = 12'h232;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h822;
                          end
                          2'd1: begin
                            out = 12'ha22;
                          end
                          2'd2: begin
                            out = 12'h22e;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h232;
                          end
                          2'd1: begin
                            out = 12'ha32;
                          end
                          2'd2: begin
                            out = 12'h23e;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h030;
                          end
                          2'd1: begin
                            out = 12'h032;
                          end
                          2'd2: begin
                            out = 12'h330;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h0b0;
                          end
                          2'd1: begin
                            out = 12'h0b2;
                          end
                          2'd2: begin
                            out = 12'h0f2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h330;
                          end
                          2'd1: begin
                            out = 12'h3b0;
                          end
                          2'd2: begin
                            out = 12'h3f0;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h020;
                          end
                          2'd1: begin
                            out = 12'h022;
                          end
                          2'd2: begin
                            out = 12'h032;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h028;
                          end
                          2'd1: begin
                            out = 12'h02a;
                          end
                          2'd2: begin
                            out = 12'hc22;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h032;
                          end
                          2'd1: begin
                            out = 12'h03a;
                          end
                          2'd2: begin
                            out = 12'hc32;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h320;
                          end
                          2'd1: begin
                            out = 12'h223;
                          end
                          2'd2: begin
                            out = 12'h233;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h328;
                          end
                          2'd1: begin
                            out = 12'h22b;
                          end
                          2'd2: begin
                            out = 12'he23;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h233;
                          end
                          2'd1: begin
                            out = 12'h23b;
                          end
                          2'd2: begin
                            out = 12'he33;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h300;
                          end
                          2'd1: begin
                            out = 12'h320;
                          end
                          2'd2: begin
                            out = 12'h330;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h380;
                          end
                          2'd1: begin
                            out = 12'h3a0;
                          end
                          2'd2: begin
                            out = 12'h3e0;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h330;
                          end
                          2'd1: begin
                            out = 12'h3b0;
                          end
                          2'd2: begin
                            out = 12'h3f0;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h022;
                          end
                          2'd1: begin
                            out = 12'h222;
                          end
                          2'd2: begin
                            out = 12'h232;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h822;
                          end
                          2'd1: begin
                            out = 12'ha22;
                          end
                          2'd2: begin
                            out = 12'h22e;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h232;
                          end
                          2'd1: begin
                            out = 12'ha32;
                          end
                          2'd2: begin
                            out = 12'h23e;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h002;
                          end
                          2'd1: begin
                            out = 12'h022;
                          end
                          2'd2: begin
                            out = 12'h032;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h082;
                          end
                          2'd1: begin
                            out = 12'h0a2;
                          end
                          2'd2: begin
                            out = 12'h0e2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h032;
                          end
                          2'd1: begin
                            out = 12'h0b2;
                          end
                          2'd2: begin
                            out = 12'h0f2;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h202;
                          end
                          2'd1: begin
                            out = 12'h222;
                          end
                          2'd2: begin
                            out = 12'h322;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h282;
                          end
                          2'd1: begin
                            out = 12'h2a2;
                          end
                          2'd2: begin
                            out = 12'h2e2;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h322;
                          end
                          2'd1: begin
                            out = 12'h3a2;
                          end
                          2'd2: begin
                            out = 12'h3e2;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h200;
                          end
                          2'd1: begin
                            out = 12'h202;
                          end
                          2'd2: begin
                            out = 12'h302;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h208;
                          end
                          2'd1: begin
                            out = 12'h20a;
                          end
                          2'd2: begin
                            out = 12'he02;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h302;
                          end
                          2'd1: begin
                            out = 12'h30a;
                          end
                          2'd2: begin
                            out = 12'hf02;
                          end
                        endcase
                      end
                    endcase
                  end
                end else begin
                  if (in[2]) begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h200;
                          end
                          2'd1: begin
                            out = 12'h220;
                          end
                          2'd2: begin
                            out = 12'h023;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h280;
                          end
                          2'd1: begin
                            out = 12'h2a0;
                          end
                          2'd2: begin
                            out = 12'h2e0;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h023;
                          end
                          2'd1: begin
                            out = 12'h0a3;
                          end
                          2'd2: begin
                            out = 12'h0e3;
                          end
                        endcase
                      end
                    endcase
                  end else begin
                    case (p45)
                      2'd0: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h000;
                          end
                          2'd1: begin
                            out = 12'h200;
                          end
                          2'd2: begin
                            out = 12'h003;
                          end
                        endcase
                      end
                      2'd1: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h800;
                          end
                          2'd1: begin
                            out = 12'ha00;
                          end
                          2'd2: begin
                            out = 12'h20c;
                          end
                        endcase
                      end
                      2'd2: begin
                        case (p67)
                          2'd0: begin
                            out = 12'h003;
                          end
                          2'd1: begin
                            out = 12'h803;
                          end
                          2'd2: begin
                            out = 12'h00f;
                          end
                        endcase
                      end
                    endcase
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
