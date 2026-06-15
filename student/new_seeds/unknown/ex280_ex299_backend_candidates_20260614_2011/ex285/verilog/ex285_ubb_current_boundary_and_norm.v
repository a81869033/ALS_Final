// Generated shard-local frontend candidate.
// candidate_id: ex285_uc_boundary_alt_0_2_9_11
// method_signature: frontend_hybrid:base=decision_tree_current;donor=route_decode_helper_boundary;donor_bits=0,2,9,11;synth=abc_g_aig
module ex285_uc_boundary_alt_0_2_9_11_base_ex285_unknown_12x12_decision_tree_greedy(in, out);
  input [11:0] in;
  output [11:0] out;
  reg [11:0] out_r;
  always @* begin
    out_r = 12'h000;
    if (in[0]) begin
      if (in[8]) begin
        if (in[9]) begin
          if (in[1]) begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfff;
                          end else begin
                            out_r = 12'hfbf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfbf;
                          end else begin
                            out_r = 12'hf3f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfef;
                          end else begin
                            out_r = 12'hfaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfaf;
                          end else begin
                            out_r = 12'hf8f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfef;
                          end else begin
                            out_r = 12'hfaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfaf;
                          end else begin
                            out_r = 12'hf8f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf3f;
                          end else begin
                            out_r = 12'hf2f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf2f;
                          end else begin
                            out_r = 12'hf0f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbf;
                          end else begin
                            out_r = 12'hfbb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfbb;
                          end else begin
                            out_r = 12'hf3b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbe;
                          end else begin
                            out_r = 12'hfba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfba;
                          end else begin
                            out_r = 12'hcbb;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbe;
                          end else begin
                            out_r = 12'hfba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfba;
                          end else begin
                            out_r = 12'hcbb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf3b;
                          end else begin
                            out_r = 12'hf3a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf3a;
                          end else begin
                            out_r = 12'hc3b;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hffb;
                          end else begin
                            out_r = 12'hfbb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfbb;
                          end else begin
                            out_r = 12'hf3b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfeb;
                          end else begin
                            out_r = 12'hfab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfab;
                          end else begin
                            out_r = 12'hf8b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfeb;
                          end else begin
                            out_r = 12'hfab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfab;
                          end else begin
                            out_r = 12'hf8b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf3b;
                          end else begin
                            out_r = 12'hf2b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf2b;
                          end else begin
                            out_r = 12'hf0b;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbb;
                          end else begin
                            out_r = 12'hbbb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbbb;
                          end else begin
                            out_r = 12'hb3b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'habb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habb;
                          end else begin
                            out_r = 12'hbb8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'habb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habb;
                          end else begin
                            out_r = 12'hbb8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb3b;
                          end else begin
                            out_r = 12'ha3b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha3b;
                          end else begin
                            out_r = 12'hb38;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbff;
                          end else begin
                            out_r = 12'hbfb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbfb;
                          end else begin
                            out_r = 12'h3fb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbfe;
                          end else begin
                            out_r = 12'hbfa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbfa;
                          end else begin
                            out_r = 12'h8fb;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbfe;
                          end else begin
                            out_r = 12'hbfa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbfa;
                          end else begin
                            out_r = 12'h8fb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fb;
                          end else begin
                            out_r = 12'h3fa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3fa;
                          end else begin
                            out_r = 12'h0fb;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff3;
                          end else begin
                            out_r = 12'h3fb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3fb;
                          end else begin
                            out_r = 12'h3f3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef3;
                          end else begin
                            out_r = 12'h2fb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2fb;
                          end else begin
                            out_r = 12'h3f8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef3;
                          end else begin
                            out_r = 12'h2fb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2fb;
                          end else begin
                            out_r = 12'h3f8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3f3;
                          end else begin
                            out_r = 12'h2f3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2f3;
                          end else begin
                            out_r = 12'h3f0;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbfb;
                          end else begin
                            out_r = 12'hbbb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbbb;
                          end else begin
                            out_r = 12'h3bb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbeb;
                          end else begin
                            out_r = 12'hbab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbab;
                          end else begin
                            out_r = 12'hb8b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbeb;
                          end else begin
                            out_r = 12'hbab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbab;
                          end else begin
                            out_r = 12'hb8b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3bb;
                          end else begin
                            out_r = 12'h3ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3ab;
                          end else begin
                            out_r = 12'h38b;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fb;
                          end else begin
                            out_r = 12'h3bb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3bb;
                          end else begin
                            out_r = 12'h3b3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3eb;
                          end else begin
                            out_r = 12'h3ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3ab;
                          end else begin
                            out_r = 12'h38b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3eb;
                          end else begin
                            out_r = 12'h3ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3ab;
                          end else begin
                            out_r = 12'h38b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3b3;
                          end else begin
                            out_r = 12'h3a3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a3;
                          end else begin
                            out_r = 12'h383;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbff;
                          end else begin
                            out_r = 12'hbbf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbbf;
                          end else begin
                            out_r = 12'hfb3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbef;
                          end else begin
                            out_r = 12'hbaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaf;
                          end else begin
                            out_r = 12'hb8f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbef;
                          end else begin
                            out_r = 12'hbaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaf;
                          end else begin
                            out_r = 12'hb8f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfb3;
                          end else begin
                            out_r = 12'hfa3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfa3;
                          end else begin
                            out_r = 12'hf83;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff3;
                          end else begin
                            out_r = 12'hfb3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfb3;
                          end else begin
                            out_r = 12'hf33;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef3;
                          end else begin
                            out_r = 12'heb3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heb3;
                          end else begin
                            out_r = 12'hfb0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef3;
                          end else begin
                            out_r = 12'heb3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heb3;
                          end else begin
                            out_r = 12'hfb0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf33;
                          end else begin
                            out_r = 12'he33;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he33;
                          end else begin
                            out_r = 12'hf30;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbfb;
                          end else begin
                            out_r = 12'hbbb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbbb;
                          end else begin
                            out_r = 12'h3bb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbeb;
                          end else begin
                            out_r = 12'hbab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbab;
                          end else begin
                            out_r = 12'hb8b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbeb;
                          end else begin
                            out_r = 12'hbab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbab;
                          end else begin
                            out_r = 12'hb8b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3bb;
                          end else begin
                            out_r = 12'h3ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3ab;
                          end else begin
                            out_r = 12'h38b;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fb;
                          end else begin
                            out_r = 12'h3bb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3bb;
                          end else begin
                            out_r = 12'h33b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fa;
                          end else begin
                            out_r = 12'h3ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3ba;
                          end else begin
                            out_r = 12'h0bb;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fa;
                          end else begin
                            out_r = 12'h3ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3ba;
                          end else begin
                            out_r = 12'h0bb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h33b;
                          end else begin
                            out_r = 12'h33a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h33a;
                          end else begin
                            out_r = 12'h03b;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbb;
                          end else begin
                            out_r = 12'hbbb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbbb;
                          end else begin
                            out_r = 12'hb3b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'habb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habb;
                          end else begin
                            out_r = 12'hbb8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'habb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habb;
                          end else begin
                            out_r = 12'hbb8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb3b;
                          end else begin
                            out_r = 12'ha3b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha3b;
                          end else begin
                            out_r = 12'hb38;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3bf;
                          end else begin
                            out_r = 12'hbb3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbb3;
                          end else begin
                            out_r = 12'hb33;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3be;
                          end else begin
                            out_r = 12'hbb2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbb2;
                          end else begin
                            out_r = 12'h8b3;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3be;
                          end else begin
                            out_r = 12'hbb2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbb2;
                          end else begin
                            out_r = 12'h8b3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb33;
                          end else begin
                            out_r = 12'hb32;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb32;
                          end else begin
                            out_r = 12'h833;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf3b;
                          end else begin
                            out_r = 12'hb3b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb3b;
                          end else begin
                            out_r = 12'hb33;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf2b;
                          end else begin
                            out_r = 12'hb2b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb2b;
                          end else begin
                            out_r = 12'hb0b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf2b;
                          end else begin
                            out_r = 12'hb2b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb2b;
                          end else begin
                            out_r = 12'hb0b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb33;
                          end else begin
                            out_r = 12'hb23;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb23;
                          end else begin
                            out_r = 12'hb03;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h33f;
                          end else begin
                            out_r = 12'hb33;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb33;
                          end else begin
                            out_r = 12'h333;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h32f;
                          end else begin
                            out_r = 12'hb23;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb23;
                          end else begin
                            out_r = 12'hb03;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h32f;
                          end else begin
                            out_r = 12'hb23;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb23;
                          end else begin
                            out_r = 12'hb03;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h333;
                          end else begin
                            out_r = 12'h323;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h323;
                          end else begin
                            out_r = 12'h303;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hffb;
                          end else begin
                            out_r = 12'hfeb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfeb;
                          end else begin
                            out_r = 12'hfcb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbb;
                          end else begin
                            out_r = 12'hfab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfab;
                          end else begin
                            out_r = 12'h3af;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbb;
                          end else begin
                            out_r = 12'hfab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfab;
                          end else begin
                            out_r = 12'h3af;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfcb;
                          end else begin
                            out_r = 12'hf8b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf8b;
                          end else begin
                            out_r = 12'h38f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfaf;
                          end else begin
                            out_r = 12'hfae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfae;
                          end else begin
                            out_r = 12'hf8e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfab;
                          end else begin
                            out_r = 12'hfaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hf2a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfab;
                          end else begin
                            out_r = 12'hfaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hf2a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf8e;
                          end else begin
                            out_r = 12'hf8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf8a;
                          end else begin
                            out_r = 12'hf0a;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbfe;
                          end else begin
                            out_r = 12'hbee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbee;
                          end else begin
                            out_r = 12'hbce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbbe;
                          end else begin
                            out_r = 12'hbae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbae;
                          end else begin
                            out_r = 12'hfa2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbbe;
                          end else begin
                            out_r = 12'hbae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbae;
                          end else begin
                            out_r = 12'hfa2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbce;
                          end else begin
                            out_r = 12'hb8e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb8e;
                          end else begin
                            out_r = 12'hf82;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfae;
                          end else begin
                            out_r = 12'heae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'he8e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbae;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbae;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he8e;
                          end else begin
                            out_r = 12'ha8e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8e;
                          end else begin
                            out_r = 12'ha0e;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebf;
                          end else begin
                            out_r = 12'hebe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hebe;
                          end else begin
                            out_r = 12'hcbe;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'heba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'he3a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'heba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'he3a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcbe;
                          end else begin
                            out_r = 12'hcba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcba;
                          end else begin
                            out_r = 12'hc3a;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefa;
                          end else begin
                            out_r = 12'heea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'hcea;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'h2ae;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'h2ae;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcea;
                          end else begin
                            out_r = 12'hcaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcaa;
                          end else begin
                            out_r = 12'h0ae;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfbc;
                          end else begin
                            out_r = 12'hcbe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcbe;
                          end else begin
                            out_r = 12'hcbc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbbc;
                          end else begin
                            out_r = 12'h8be;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h83e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbbc;
                          end else begin
                            out_r = 12'h8be;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h83e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcbc;
                          end else begin
                            out_r = 12'h8bc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8bc;
                          end else begin
                            out_r = 12'h83c;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fe;
                          end else begin
                            out_r = 12'h8ee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ee;
                          end else begin
                            out_r = 12'h8ec;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h8ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'hca2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h8ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'hca2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ec;
                          end else begin
                            out_r = 12'h8ac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ac;
                          end else begin
                            out_r = 12'hca0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haff;
                          end else begin
                            out_r = 12'haef;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haef;
                          end else begin
                            out_r = 12'hbec;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'habf;
                          end else begin
                            out_r = 12'haaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaf;
                          end else begin
                            out_r = 12'hea3;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'habf;
                          end else begin
                            out_r = 12'haaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaf;
                          end else begin
                            out_r = 12'hea3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbec;
                          end else begin
                            out_r = 12'hbac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbac;
                          end else begin
                            out_r = 12'hfa0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfe3;
                          end else begin
                            out_r = 12'hee3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hee3;
                          end else begin
                            out_r = 12'hec3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfa3;
                          end else begin
                            out_r = 12'hea3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea3;
                          end else begin
                            out_r = 12'he23;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfa3;
                          end else begin
                            out_r = 12'hea3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea3;
                          end else begin
                            out_r = 12'he23;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hec3;
                          end else begin
                            out_r = 12'he83;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he83;
                          end else begin
                            out_r = 12'he03;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefa;
                          end else begin
                            out_r = 12'heea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'hcea;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'h2ae;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'h2ae;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcea;
                          end else begin
                            out_r = 12'hcaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcaa;
                          end else begin
                            out_r = 12'h0ae;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ef;
                          end else begin
                            out_r = 12'h2ee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ee;
                          end else begin
                            out_r = 12'h2ce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2af;
                          end else begin
                            out_r = 12'h2ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ae;
                          end else begin
                            out_r = 12'h22e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2af;
                          end else begin
                            out_r = 12'h2ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ae;
                          end else begin
                            out_r = 12'h22e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ce;
                          end else begin
                            out_r = 12'h28e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h28e;
                          end else begin
                            out_r = 12'h20e;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfae;
                          end else begin
                            out_r = 12'heae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'he8e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbae;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbae;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he8e;
                          end else begin
                            out_r = 12'ha8e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8e;
                          end else begin
                            out_r = 12'ha0e;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he3e;
                          end else begin
                            out_r = 12'he2e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2e;
                          end else begin
                            out_r = 12'he2c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha3e;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2e;
                          end else begin
                            out_r = 12'he22;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha3e;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2e;
                          end else begin
                            out_r = 12'he22;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he2c;
                          end else begin
                            out_r = 12'ha2c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2c;
                          end else begin
                            out_r = 12'he20;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcaf;
                          end else begin
                            out_r = 12'heac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heac;
                          end else begin
                            out_r = 12'he8c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcab;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea8;
                          end else begin
                            out_r = 12'he28;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcab;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea8;
                          end else begin
                            out_r = 12'he28;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he8c;
                          end else begin
                            out_r = 12'he88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he88;
                          end else begin
                            out_r = 12'he08;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he3c;
                          end else begin
                            out_r = 12'he2c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2c;
                          end else begin
                            out_r = 12'hc2c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he38;
                          end else begin
                            out_r = 12'he28;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he28;
                          end else begin
                            out_r = 12'h22c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he38;
                          end else begin
                            out_r = 12'he28;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he28;
                          end else begin
                            out_r = 12'h22c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc2c;
                          end else begin
                            out_r = 12'hc28;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc28;
                          end else begin
                            out_r = 12'h02c;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbff;
                          end else begin
                            out_r = 12'hbef;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbef;
                          end else begin
                            out_r = 12'hbcf;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbbf;
                          end else begin
                            out_r = 12'hbaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaf;
                          end else begin
                            out_r = 12'hb2f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbbf;
                          end else begin
                            out_r = 12'hbaf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaf;
                          end else begin
                            out_r = 12'hb2f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbcf;
                          end else begin
                            out_r = 12'hb8f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb8f;
                          end else begin
                            out_r = 12'hb0f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbef;
                          end else begin
                            out_r = 12'hbee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbee;
                          end else begin
                            out_r = 12'hbce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbeb;
                          end else begin
                            out_r = 12'hbea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbea;
                          end else begin
                            out_r = 12'h3ea;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbeb;
                          end else begin
                            out_r = 12'hbea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbea;
                          end else begin
                            out_r = 12'h3ea;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbce;
                          end else begin
                            out_r = 12'hbca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbca;
                          end else begin
                            out_r = 12'h3ca;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hffa;
                          end else begin
                            out_r = 12'hfea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfea;
                          end else begin
                            out_r = 12'hfca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfba;
                          end else begin
                            out_r = 12'hfaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hf2a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfba;
                          end else begin
                            out_r = 12'hfaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hf2a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfca;
                          end else begin
                            out_r = 12'hf8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf8a;
                          end else begin
                            out_r = 12'hf0a;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfea;
                          end else begin
                            out_r = 12'heea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'heca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbea;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'hae2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbea;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'hae2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heca;
                          end else begin
                            out_r = 12'haca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'hac2;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haff;
                          end else begin
                            out_r = 12'hafe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hafe;
                          end else begin
                            out_r = 12'h8fe;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafb;
                          end else begin
                            out_r = 12'hafa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hafa;
                          end else begin
                            out_r = 12'h2fa;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafb;
                          end else begin
                            out_r = 12'hafa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hafa;
                          end else begin
                            out_r = 12'h2fa;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fe;
                          end else begin
                            out_r = 12'h8fa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h0fa;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafe;
                          end else begin
                            out_r = 12'haee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'h8ee;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'habe;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'habe;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ee;
                          end else begin
                            out_r = 12'h8ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'h82e;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff2;
                          end else begin
                            out_r = 12'hef2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hef2;
                          end else begin
                            out_r = 12'hef0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fa;
                          end else begin
                            out_r = 12'h2fa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2fa;
                          end else begin
                            out_r = 12'h2f2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fa;
                          end else begin
                            out_r = 12'h2fa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2fa;
                          end else begin
                            out_r = 12'h2f2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef0;
                          end else begin
                            out_r = 12'h2f8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2f8;
                          end else begin
                            out_r = 12'h2f0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef2;
                          end else begin
                            out_r = 12'hee2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hee2;
                          end else begin
                            out_r = 12'hee0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heb2;
                          end else begin
                            out_r = 12'hea2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea2;
                          end else begin
                            out_r = 12'he22;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heb2;
                          end else begin
                            out_r = 12'hea2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea2;
                          end else begin
                            out_r = 12'he22;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hee0;
                          end else begin
                            out_r = 12'hea0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea0;
                          end else begin
                            out_r = 12'he20;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefb;
                          end else begin
                            out_r = 12'heeb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heeb;
                          end else begin
                            out_r = 12'hfe8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'heab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heab;
                          end else begin
                            out_r = 12'he2b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebb;
                          end else begin
                            out_r = 12'heab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heab;
                          end else begin
                            out_r = 12'he2b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfe8;
                          end else begin
                            out_r = 12'hfa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfa8;
                          end else begin
                            out_r = 12'hf28;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff8;
                          end else begin
                            out_r = 12'hfe8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfe8;
                          end else begin
                            out_r = 12'hfc8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbf8;
                          end else begin
                            out_r = 12'hbe8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbe8;
                          end else begin
                            out_r = 12'hbe0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbf8;
                          end else begin
                            out_r = 12'hbe8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbe8;
                          end else begin
                            out_r = 12'hbe0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfc8;
                          end else begin
                            out_r = 12'hbc8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbc8;
                          end else begin
                            out_r = 12'hbc0;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafe;
                          end else begin
                            out_r = 12'haee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'h8ee;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'habe;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'habe;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'ha2e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ee;
                          end else begin
                            out_r = 12'h8ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'h82e;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fe;
                          end else begin
                            out_r = 12'h8ee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ee;
                          end else begin
                            out_r = 12'h8ce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h0ea;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h0ea;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ce;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ca;
                          end else begin
                            out_r = 12'h0ca;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfea;
                          end else begin
                            out_r = 12'heea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'heca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbea;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'hae2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbea;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'hae2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heca;
                          end else begin
                            out_r = 12'haca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'hac2;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ef;
                          end else begin
                            out_r = 12'h2ee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ee;
                          end else begin
                            out_r = 12'h2ce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hae3;
                          end else begin
                            out_r = 12'hae2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hae2;
                          end else begin
                            out_r = 12'h2e2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hae3;
                          end else begin
                            out_r = 12'hae2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hae2;
                          end else begin
                            out_r = 12'h2e2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ce;
                          end else begin
                            out_r = 12'hac2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hac2;
                          end else begin
                            out_r = 12'h2c2;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfca;
                          end else begin
                            out_r = 12'heca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heca;
                          end else begin
                            out_r = 12'hec8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf8a;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he8a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf8a;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he8a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hec8;
                          end else begin
                            out_r = 12'he88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he88;
                          end else begin
                            out_r = 12'he08;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2cf;
                          end else begin
                            out_r = 12'h2ce;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ce;
                          end else begin
                            out_r = 12'h0ce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h28f;
                          end else begin
                            out_r = 12'h28e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h28e;
                          end else begin
                            out_r = 12'h20e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h28f;
                          end else begin
                            out_r = 12'h28e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h28e;
                          end else begin
                            out_r = 12'h20e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ce;
                          end else begin
                            out_r = 12'h08e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h08e;
                          end else begin
                            out_r = 12'h00e;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefe;
                          end else begin
                            out_r = 12'hebe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hebe;
                          end else begin
                            out_r = 12'he3e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heee;
                          end else begin
                            out_r = 12'heae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'hcae;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heee;
                          end else begin
                            out_r = 12'heae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'hcae;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he3e;
                          end else begin
                            out_r = 12'he2e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2e;
                          end else begin
                            out_r = 12'hc2e;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaf;
                          end else begin
                            out_r = 12'heab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heab;
                          end else begin
                            out_r = 12'he2b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he2b;
                          end else begin
                            out_r = 12'he2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefa;
                          end else begin
                            out_r = 12'heba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'he3a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he3a;
                          end else begin
                            out_r = 12'he2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2a;
                          end else begin
                            out_r = 12'he28;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hbaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaa;
                          end else begin
                            out_r = 12'hb2a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb2a;
                          end else begin
                            out_r = 12'ha2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2a;
                          end else begin
                            out_r = 12'ha0a;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haef;
                          end else begin
                            out_r = 12'haeb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haeb;
                          end else begin
                            out_r = 12'h2eb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haca;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2eb;
                          end else begin
                            out_r = 12'h2ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ea;
                          end else begin
                            out_r = 12'h2ca;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafa;
                          end else begin
                            out_r = 12'haba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haba;
                          end else begin
                            out_r = 12'h2ba;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ba;
                          end else begin
                            out_r = 12'h2aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2aa;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfe8;
                          end else begin
                            out_r = 12'hbe8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbe8;
                          end else begin
                            out_r = 12'hbe0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcea;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcea;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbe0;
                          end else begin
                            out_r = 12'h8e2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8e2;
                          end else begin
                            out_r = 12'h8c2;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h8ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ba;
                          end else begin
                            out_r = 12'h8b2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h8a8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h8a8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8b2;
                          end else begin
                            out_r = 12'h8a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8a2;
                          end else begin
                            out_r = 12'h8a0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafe;
                          end else begin
                            out_r = 12'habe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habe;
                          end else begin
                            out_r = 12'heb2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'haac;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'haac;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heb2;
                          end else begin
                            out_r = 12'hea2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea2;
                          end else begin
                            out_r = 12'hea0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebc;
                          end else begin
                            out_r = 12'habc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habc;
                          end else begin
                            out_r = 12'ha3c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heac;
                          end else begin
                            out_r = 12'haac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'ha8c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heac;
                          end else begin
                            out_r = 12'haac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'ha8c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha3c;
                          end else begin
                            out_r = 12'ha2c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2c;
                          end else begin
                            out_r = 12'ha0c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafa;
                          end else begin
                            out_r = 12'haba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haba;
                          end else begin
                            out_r = 12'h2ba;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ba;
                          end else begin
                            out_r = 12'h2aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2aa;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h8ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ba;
                          end else begin
                            out_r = 12'h83a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h83a;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h82a;
                          end else begin
                            out_r = 12'h80a;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hbaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaa;
                          end else begin
                            out_r = 12'hb2a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb2a;
                          end else begin
                            out_r = 12'ha2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2a;
                          end else begin
                            out_r = 12'ha0a;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbca;
                          end else begin
                            out_r = 12'hb8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb8a;
                          end else begin
                            out_r = 12'hb82;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb82;
                          end else begin
                            out_r = 12'ha82;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha82;
                          end else begin
                            out_r = 12'ha80;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8af;
                          end else begin
                            out_r = 12'h8ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ab;
                          end else begin
                            out_r = 12'h82b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h82b;
                          end else begin
                            out_r = 12'ha28;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha28;
                          end else begin
                            out_r = 12'ha08;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8cb;
                          end else begin
                            out_r = 12'h88b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88b;
                          end else begin
                            out_r = 12'h08b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hac8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha88;
                          end else begin
                            out_r = 12'h888;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hac8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha88;
                          end else begin
                            out_r = 12'h888;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h08b;
                          end else begin
                            out_r = 12'h288;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h288;
                          end else begin
                            out_r = 12'h088;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdff;
                          end else begin
                            out_r = 12'hd7f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd7f;
                          end else begin
                            out_r = 12'hd3f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hddf;
                          end else begin
                            out_r = 12'hd5f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd5f;
                          end else begin
                            out_r = 12'hd4f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hddf;
                          end else begin
                            out_r = 12'hd5f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd5f;
                          end else begin
                            out_r = 12'hd4f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd3f;
                          end else begin
                            out_r = 12'hd1f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd1f;
                          end else begin
                            out_r = 12'hd0f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd7f;
                          end else begin
                            out_r = 12'hd77;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd77;
                          end else begin
                            out_r = 12'hd37;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd7d;
                          end else begin
                            out_r = 12'hd75;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd75;
                          end else begin
                            out_r = 12'hc75;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd7d;
                          end else begin
                            out_r = 12'hd75;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd75;
                          end else begin
                            out_r = 12'hc75;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd37;
                          end else begin
                            out_r = 12'hd35;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd35;
                          end else begin
                            out_r = 12'hc35;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff5;
                          end else begin
                            out_r = 12'hf75;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf75;
                          end else begin
                            out_r = 12'hf35;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfd5;
                          end else begin
                            out_r = 12'hf55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hf45;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfd5;
                          end else begin
                            out_r = 12'hf55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hf45;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf35;
                          end else begin
                            out_r = 12'hf15;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf15;
                          end else begin
                            out_r = 12'hf05;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf75;
                          end else begin
                            out_r = 12'h775;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h735;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd75;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h574;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd75;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h574;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h735;
                          end else begin
                            out_r = 12'h535;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h534;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5ff;
                          end else begin
                            out_r = 12'h5f7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5f7;
                          end else begin
                            out_r = 12'h1f7;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5fd;
                          end else begin
                            out_r = 12'h5f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5f5;
                          end else begin
                            out_r = 12'h4f5;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5fd;
                          end else begin
                            out_r = 12'h5f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5f5;
                          end else begin
                            out_r = 12'h4f5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f7;
                          end else begin
                            out_r = 12'h1f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h0f5;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f7;
                          end else begin
                            out_r = 12'h577;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h177;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d7;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d7;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h177;
                          end else begin
                            out_r = 12'h157;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h147;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff4;
                          end else begin
                            out_r = 12'h7f4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7f4;
                          end else begin
                            out_r = 12'h7f0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcf5;
                          end else begin
                            out_r = 12'h4f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4f5;
                          end else begin
                            out_r = 12'h4f4;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcf5;
                          end else begin
                            out_r = 12'h4f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4f5;
                          end else begin
                            out_r = 12'h4f4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f0;
                          end else begin
                            out_r = 12'h4f1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4f1;
                          end else begin
                            out_r = 12'h4f0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f4;
                          end else begin
                            out_r = 12'h774;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h774;
                          end else begin
                            out_r = 12'h770;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h754;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h754;
                          end else begin
                            out_r = 12'h744;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h754;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h754;
                          end else begin
                            out_r = 12'h744;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h770;
                          end else begin
                            out_r = 12'h750;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h750;
                          end else begin
                            out_r = 12'h740;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7fd;
                          end else begin
                            out_r = 12'h77d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h77d;
                          end else begin
                            out_r = 12'hf71;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7dd;
                          end else begin
                            out_r = 12'h75d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h75d;
                          end else begin
                            out_r = 12'h74d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7dd;
                          end else begin
                            out_r = 12'h75d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h75d;
                          end else begin
                            out_r = 12'h74d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf71;
                          end else begin
                            out_r = 12'hf51;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf51;
                          end else begin
                            out_r = 12'hf41;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff1;
                          end else begin
                            out_r = 12'hf71;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf71;
                          end else begin
                            out_r = 12'hf31;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdf1;
                          end else begin
                            out_r = 12'hd71;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd71;
                          end else begin
                            out_r = 12'hd70;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdf1;
                          end else begin
                            out_r = 12'hd71;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd71;
                          end else begin
                            out_r = 12'hd70;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf31;
                          end else begin
                            out_r = 12'hd31;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd31;
                          end else begin
                            out_r = 12'hd30;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f7;
                          end else begin
                            out_r = 12'h577;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h177;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d7;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d7;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h177;
                          end else begin
                            out_r = 12'h157;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h147;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f7;
                          end else begin
                            out_r = 12'h177;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h177;
                          end else begin
                            out_r = 12'h137;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h075;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h075;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h137;
                          end else begin
                            out_r = 12'h135;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h135;
                          end else begin
                            out_r = 12'h035;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf75;
                          end else begin
                            out_r = 12'h775;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h735;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd75;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h574;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd75;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h574;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h735;
                          end else begin
                            out_r = 12'h535;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h534;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h47f;
                          end else begin
                            out_r = 12'h477;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h477;
                          end else begin
                            out_r = 12'h437;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h574;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h574;
                          end else begin
                            out_r = 12'h474;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h574;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h574;
                          end else begin
                            out_r = 12'h474;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h437;
                          end else begin
                            out_r = 12'h534;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h534;
                          end else begin
                            out_r = 12'h434;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf35;
                          end else begin
                            out_r = 12'h735;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h735;
                          end else begin
                            out_r = 12'h731;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf15;
                          end else begin
                            out_r = 12'h715;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h715;
                          end else begin
                            out_r = 12'h705;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf15;
                          end else begin
                            out_r = 12'h715;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h715;
                          end else begin
                            out_r = 12'h705;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h731;
                          end else begin
                            out_r = 12'h711;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h711;
                          end else begin
                            out_r = 12'h701;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h43f;
                          end else begin
                            out_r = 12'h437;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h437;
                          end else begin
                            out_r = 12'h037;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h41f;
                          end else begin
                            out_r = 12'h417;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h417;
                          end else begin
                            out_r = 12'h407;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h41f;
                          end else begin
                            out_r = 12'h417;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h417;
                          end else begin
                            out_r = 12'h407;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h037;
                          end else begin
                            out_r = 12'h017;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h017;
                          end else begin
                            out_r = 12'h007;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f7;
                          end else begin
                            out_r = 12'h7d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d7;
                          end else begin
                            out_r = 12'h7c7;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h777;
                          end else begin
                            out_r = 12'h757;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h357;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h777;
                          end else begin
                            out_r = 12'h757;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h357;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c7;
                          end else begin
                            out_r = 12'h747;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h747;
                          end else begin
                            out_r = 12'h347;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h75f;
                          end else begin
                            out_r = 12'h75d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h75d;
                          end else begin
                            out_r = 12'h74d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h715;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h715;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h74d;
                          end else begin
                            out_r = 12'h745;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h745;
                          end else begin
                            out_r = 12'h705;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f5;
                          end else begin
                            out_r = 12'h7d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h7c5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h751;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h751;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c5;
                          end else begin
                            out_r = 12'h745;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h745;
                          end else begin
                            out_r = 12'h741;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hd55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd55;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h545;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h545;
                          end else begin
                            out_r = 12'h505;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57f;
                          end else begin
                            out_r = 12'h57d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h57d;
                          end else begin
                            out_r = 12'h47d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h535;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h535;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h47d;
                          end else begin
                            out_r = 12'h475;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h475;
                          end else begin
                            out_r = 12'h435;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f5;
                          end else begin
                            out_r = 12'h5d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d5;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h455;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h455;
                          end else begin
                            out_r = 12'h055;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf71;
                          end else begin
                            out_r = 12'hd71;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd71;
                          end else begin
                            out_r = 12'hd70;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h375;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h135;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h375;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h135;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd70;
                          end else begin
                            out_r = 12'h174;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h174;
                          end else begin
                            out_r = 12'h134;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h1d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d5;
                          end else begin
                            out_r = 12'h1d4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h151;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h151;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d4;
                          end else begin
                            out_r = 12'h154;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h154;
                          end else begin
                            out_r = 12'h150;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f7;
                          end else begin
                            out_r = 12'h5d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d7;
                          end else begin
                            out_r = 12'h7d4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h553;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h553;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h754;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h754;
                          end else begin
                            out_r = 12'h750;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d3;
                          end else begin
                            out_r = 12'h5d3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d3;
                          end else begin
                            out_r = 12'h5c3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h753;
                          end else begin
                            out_r = 12'h553;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h513;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h753;
                          end else begin
                            out_r = 12'h553;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h513;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5c3;
                          end else begin
                            out_r = 12'h543;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h543;
                          end else begin
                            out_r = 12'h503;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f5;
                          end else begin
                            out_r = 12'h5d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d5;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h455;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h455;
                          end else begin
                            out_r = 12'h055;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h1d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d5;
                          end else begin
                            out_r = 12'h1c5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h115;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h115;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1c5;
                          end else begin
                            out_r = 12'h145;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h145;
                          end else begin
                            out_r = 12'h105;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hd55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd55;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h545;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h545;
                          end else begin
                            out_r = 12'h505;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd35;
                          end else begin
                            out_r = 12'hd15;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd15;
                          end else begin
                            out_r = 12'hd14;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd14;
                          end else begin
                            out_r = 12'h514;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h514;
                          end else begin
                            out_r = 12'h510;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h15f;
                          end else begin
                            out_r = 12'h15d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h15d;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h14d;
                          end else begin
                            out_r = 12'h541;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h541;
                          end else begin
                            out_r = 12'h501;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h13d;
                          end else begin
                            out_r = 12'h11d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h11d;
                          end else begin
                            out_r = 12'h01d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h531;
                          end else begin
                            out_r = 12'h511;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h511;
                          end else begin
                            out_r = 12'h111;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h531;
                          end else begin
                            out_r = 12'h511;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h511;
                          end else begin
                            out_r = 12'h111;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h01d;
                          end else begin
                            out_r = 12'h411;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h411;
                          end else begin
                            out_r = 12'h011;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcff;
                          end else begin
                            out_r = 12'hcdf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcdf;
                          end else begin
                            out_r = 12'hccf;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc7f;
                          end else begin
                            out_r = 12'hc5f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5f;
                          end else begin
                            out_r = 12'hc1f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc7f;
                          end else begin
                            out_r = 12'hc5f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5f;
                          end else begin
                            out_r = 12'hc1f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hccf;
                          end else begin
                            out_r = 12'hc4f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc4f;
                          end else begin
                            out_r = 12'hc0f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcdf;
                          end else begin
                            out_r = 12'hddc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hddc;
                          end else begin
                            out_r = 12'hdcc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcd7;
                          end else begin
                            out_r = 12'hdd4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hdd4;
                          end else begin
                            out_r = 12'h1dc;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcd7;
                          end else begin
                            out_r = 12'hdd4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hdd4;
                          end else begin
                            out_r = 12'h1dc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdcc;
                          end else begin
                            out_r = 12'hdc4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hdc4;
                          end else begin
                            out_r = 12'h1cc;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff4;
                          end else begin
                            out_r = 12'hfd4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfd4;
                          end else begin
                            out_r = 12'hfc4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf74;
                          end else begin
                            out_r = 12'hf54;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf54;
                          end else begin
                            out_r = 12'hf14;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf74;
                          end else begin
                            out_r = 12'hf54;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf54;
                          end else begin
                            out_r = 12'hf14;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfc4;
                          end else begin
                            out_r = 12'hf44;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf44;
                          end else begin
                            out_r = 12'hf04;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfd4;
                          end else begin
                            out_r = 12'hcd5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcd5;
                          end else begin
                            out_r = 12'hcc5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h4d1;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h4d1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcc5;
                          end else begin
                            out_r = 12'h4c5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4c5;
                          end else begin
                            out_r = 12'h4c1;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4ff;
                          end else begin
                            out_r = 12'h5fc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5fc;
                          end else begin
                            out_r = 12'h4fc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4f7;
                          end else begin
                            out_r = 12'h5f4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5f4;
                          end else begin
                            out_r = 12'h1f4;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4f7;
                          end else begin
                            out_r = 12'h5f4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5f4;
                          end else begin
                            out_r = 12'h1f4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4fc;
                          end else begin
                            out_r = 12'h4f4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4f4;
                          end else begin
                            out_r = 12'h0f4;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5fc;
                          end else begin
                            out_r = 12'h5dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5dc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'h45c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h45c;
                          end else begin
                            out_r = 12'h41c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff0;
                          end else begin
                            out_r = 12'hcf1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcf1;
                          end else begin
                            out_r = 12'hcf0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3f4;
                          end else begin
                            out_r = 12'h0f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0f5;
                          end else begin
                            out_r = 12'h0f1;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3f4;
                          end else begin
                            out_r = 12'h0f5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0f5;
                          end else begin
                            out_r = 12'h0f1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcf0;
                          end else begin
                            out_r = 12'h0f4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0f4;
                          end else begin
                            out_r = 12'h0f0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcf1;
                          end else begin
                            out_r = 12'hcd1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcd1;
                          end else begin
                            out_r = 12'hcd0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc71;
                          end else begin
                            out_r = 12'hc51;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc51;
                          end else begin
                            out_r = 12'hc11;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc71;
                          end else begin
                            out_r = 12'hc51;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc51;
                          end else begin
                            out_r = 12'hc11;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcd0;
                          end else begin
                            out_r = 12'hc50;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc50;
                          end else begin
                            out_r = 12'hc10;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcfd;
                          end else begin
                            out_r = 12'hcdd;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcdd;
                          end else begin
                            out_r = 12'hcdc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc7d;
                          end else begin
                            out_r = 12'hc5d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5d;
                          end else begin
                            out_r = 12'hc1d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc7d;
                          end else begin
                            out_r = 12'hc5d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5d;
                          end else begin
                            out_r = 12'hc1d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcdc;
                          end else begin
                            out_r = 12'hc5c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5c;
                          end else begin
                            out_r = 12'hc1c;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5fc;
                          end else begin
                            out_r = 12'h5dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5dc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'h45c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h45c;
                          end else begin
                            out_r = 12'h41c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcfc;
                          end else begin
                            out_r = 12'hcdc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcdc;
                          end else begin
                            out_r = 12'hccc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4fc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'hcd0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4fc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'hcd0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hccc;
                          end else begin
                            out_r = 12'h4cc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4cc;
                          end else begin
                            out_r = 12'hcc0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4fc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'h4cc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4f4;
                          end else begin
                            out_r = 12'h4d4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4d4;
                          end else begin
                            out_r = 12'h0d4;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4f4;
                          end else begin
                            out_r = 12'h4d4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4d4;
                          end else begin
                            out_r = 12'h0d4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4cc;
                          end else begin
                            out_r = 12'h4c4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4c4;
                          end else begin
                            out_r = 12'h0c4;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfd4;
                          end else begin
                            out_r = 12'hcd5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcd5;
                          end else begin
                            out_r = 12'hcc5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h4d1;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h4d1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcc5;
                          end else begin
                            out_r = 12'h4c5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4c5;
                          end else begin
                            out_r = 12'h4c1;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfc4;
                          end else begin
                            out_r = 12'hcc5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcc5;
                          end else begin
                            out_r = 12'hcc4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf44;
                          end else begin
                            out_r = 12'hc45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc45;
                          end else begin
                            out_r = 12'hc05;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf44;
                          end else begin
                            out_r = 12'hc45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc45;
                          end else begin
                            out_r = 12'hc05;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcc4;
                          end else begin
                            out_r = 12'hc44;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc44;
                          end else begin
                            out_r = 12'hc04;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0df;
                          end else begin
                            out_r = 12'h1dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1dc;
                          end else begin
                            out_r = 12'h1cc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4d3;
                          end else begin
                            out_r = 12'h5d0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d0;
                          end else begin
                            out_r = 12'h1d0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4d3;
                          end else begin
                            out_r = 12'h5d0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d0;
                          end else begin
                            out_r = 12'h1d0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1cc;
                          end else begin
                            out_r = 12'h5c0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5c0;
                          end else begin
                            out_r = 12'h1c0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0cf;
                          end else begin
                            out_r = 12'h1cc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1cc;
                          end else begin
                            out_r = 12'h0cc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h04f;
                          end else begin
                            out_r = 12'h14c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h14c;
                          end else begin
                            out_r = 12'h10c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h04f;
                          end else begin
                            out_r = 12'h14c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h14c;
                          end else begin
                            out_r = 12'h10c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0cc;
                          end else begin
                            out_r = 12'h04c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h04c;
                          end else begin
                            out_r = 12'h00c;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3fd;
                          end else begin
                            out_r = 12'h37d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h37d;
                          end else begin
                            out_r = 12'h33d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3dd;
                          end else begin
                            out_r = 12'h35d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h35d;
                          end else begin
                            out_r = 12'h05f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3dd;
                          end else begin
                            out_r = 12'h35d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h35d;
                          end else begin
                            out_r = 12'h05f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h33d;
                          end else begin
                            out_r = 12'h31d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h31d;
                          end else begin
                            out_r = 12'h01f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h35f;
                          end else begin
                            out_r = 12'h753;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h753;
                          end else begin
                            out_r = 12'h713;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h35d;
                          end else begin
                            out_r = 12'h751;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h751;
                          end else begin
                            out_r = 12'h741;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h35d;
                          end else begin
                            out_r = 12'h751;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h751;
                          end else begin
                            out_r = 12'h741;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h713;
                          end else begin
                            out_r = 12'h711;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h711;
                          end else begin
                            out_r = 12'h701;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdf1;
                          end else begin
                            out_r = 12'hd71;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd71;
                          end else begin
                            out_r = 12'hd31;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd1;
                          end else begin
                            out_r = 12'hd51;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd51;
                          end else begin
                            out_r = 12'hd50;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd1;
                          end else begin
                            out_r = 12'hd51;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd51;
                          end else begin
                            out_r = 12'hd50;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd31;
                          end else begin
                            out_r = 12'hd11;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd11;
                          end else begin
                            out_r = 12'hd10;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf51;
                          end else begin
                            out_r = 12'h355;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h355;
                          end else begin
                            out_r = 12'h315;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd51;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h145;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd51;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h145;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h315;
                          end else begin
                            out_r = 12'h115;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h115;
                          end else begin
                            out_r = 12'h105;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1df;
                          end else begin
                            out_r = 12'h5d3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d3;
                          end else begin
                            out_r = 12'h1d3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1dd;
                          end else begin
                            out_r = 12'h5d1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h5c1;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1dd;
                          end else begin
                            out_r = 12'h5d1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h5c1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d3;
                          end else begin
                            out_r = 12'h1d1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d1;
                          end else begin
                            out_r = 12'h1c1;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f1;
                          end else begin
                            out_r = 12'h571;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h571;
                          end else begin
                            out_r = 12'h171;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h451;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h451;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h171;
                          end else begin
                            out_r = 12'h151;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h151;
                          end else begin
                            out_r = 12'h051;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfd0;
                          end else begin
                            out_r = 12'h3d4;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3d4;
                          end else begin
                            out_r = 12'h3d0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcd1;
                          end else begin
                            out_r = 12'h0d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0d5;
                          end else begin
                            out_r = 12'h0c5;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcd1;
                          end else begin
                            out_r = 12'h0d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0d5;
                          end else begin
                            out_r = 12'h0c5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3d0;
                          end else begin
                            out_r = 12'h0d1;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0d1;
                          end else begin
                            out_r = 12'h0c1;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0f5;
                          end else begin
                            out_r = 12'h075;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h075;
                          end else begin
                            out_r = 12'h071;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0d5;
                          end else begin
                            out_r = 12'h055;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h055;
                          end else begin
                            out_r = 12'h054;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0d5;
                          end else begin
                            out_r = 12'h055;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h055;
                          end else begin
                            out_r = 12'h054;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h071;
                          end else begin
                            out_r = 12'h051;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h051;
                          end else begin
                            out_r = 12'h050;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f7;
                          end else begin
                            out_r = 12'h177;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h177;
                          end else begin
                            out_r = 12'h173;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h157;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h354;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h157;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h354;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h173;
                          end else begin
                            out_r = 12'h153;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h153;
                          end else begin
                            out_r = 12'h350;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf70;
                          end else begin
                            out_r = 12'h374;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h374;
                          end else begin
                            out_r = 12'h334;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf50;
                          end else begin
                            out_r = 12'h354;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h354;
                          end else begin
                            out_r = 12'h344;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf50;
                          end else begin
                            out_r = 12'h354;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h354;
                          end else begin
                            out_r = 12'h344;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h334;
                          end else begin
                            out_r = 12'h314;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h314;
                          end else begin
                            out_r = 12'h304;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f1;
                          end else begin
                            out_r = 12'h571;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h571;
                          end else begin
                            out_r = 12'h171;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h451;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h451;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h171;
                          end else begin
                            out_r = 12'h151;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h151;
                          end else begin
                            out_r = 12'h051;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h07d;
                          end else begin
                            out_r = 12'h471;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h471;
                          end else begin
                            out_r = 12'h431;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h05d;
                          end else begin
                            out_r = 12'h451;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h451;
                          end else begin
                            out_r = 12'h441;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h05d;
                          end else begin
                            out_r = 12'h451;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h451;
                          end else begin
                            out_r = 12'h441;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h431;
                          end else begin
                            out_r = 12'h411;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h411;
                          end else begin
                            out_r = 12'h401;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf51;
                          end else begin
                            out_r = 12'h355;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h355;
                          end else begin
                            out_r = 12'h315;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd51;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h145;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd51;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h145;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h315;
                          end else begin
                            out_r = 12'h115;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h115;
                          end else begin
                            out_r = 12'h105;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3c5;
                          end else begin
                            out_r = 12'h345;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h345;
                          end else begin
                            out_r = 12'h341;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1c5;
                          end else begin
                            out_r = 12'h145;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h145;
                          end else begin
                            out_r = 12'h144;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1c5;
                          end else begin
                            out_r = 12'h145;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h145;
                          end else begin
                            out_r = 12'h144;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h341;
                          end else begin
                            out_r = 12'h141;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h141;
                          end else begin
                            out_r = 12'h140;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h05f;
                          end else begin
                            out_r = 12'h453;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h453;
                          end else begin
                            out_r = 12'h413;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h15c;
                          end else begin
                            out_r = 12'h550;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h550;
                          end else begin
                            out_r = 12'h540;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h15c;
                          end else begin
                            out_r = 12'h550;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h550;
                          end else begin
                            out_r = 12'h540;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h413;
                          end else begin
                            out_r = 12'h510;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h510;
                          end else begin
                            out_r = 12'h500;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4c3;
                          end else begin
                            out_r = 12'h443;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h443;
                          end else begin
                            out_r = 12'h043;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5c0;
                          end else begin
                            out_r = 12'h540;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h540;
                          end else begin
                            out_r = 12'h440;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5c0;
                          end else begin
                            out_r = 12'h540;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h540;
                          end else begin
                            out_r = 12'h440;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h043;
                          end else begin
                            out_r = 12'h140;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h140;
                          end else begin
                            out_r = 12'h040;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hffd;
                          end else begin
                            out_r = 12'hf7d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf7d;
                          end else begin
                            out_r = 12'hf3d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfdd;
                          end else begin
                            out_r = 12'hf5d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf5d;
                          end else begin
                            out_r = 12'hc5f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfdd;
                          end else begin
                            out_r = 12'hf5d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf5d;
                          end else begin
                            out_r = 12'hc5f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf3d;
                          end else begin
                            out_r = 12'hf1d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf1d;
                          end else begin
                            out_r = 12'hc1f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf5f;
                          end else begin
                            out_r = 12'hf57;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf57;
                          end else begin
                            out_r = 12'hf17;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf5d;
                          end else begin
                            out_r = 12'hf55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hf45;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf5d;
                          end else begin
                            out_r = 12'hf55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hf45;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf17;
                          end else begin
                            out_r = 12'hf15;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf15;
                          end else begin
                            out_r = 12'hf05;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdf7;
                          end else begin
                            out_r = 12'hd77;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd77;
                          end else begin
                            out_r = 12'hd37;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd7;
                          end else begin
                            out_r = 12'hd57;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd57;
                          end else begin
                            out_r = 12'hf54;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd7;
                          end else begin
                            out_r = 12'hd57;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd57;
                          end else begin
                            out_r = 12'hf54;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd37;
                          end else begin
                            out_r = 12'hd17;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd17;
                          end else begin
                            out_r = 12'hf14;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf57;
                          end else begin
                            out_r = 12'h757;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h717;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd57;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd57;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h717;
                          end else begin
                            out_r = 12'h517;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h517;
                          end else begin
                            out_r = 12'h507;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7df;
                          end else begin
                            out_r = 12'h7d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d7;
                          end else begin
                            out_r = 12'h3d7;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7dd;
                          end else begin
                            out_r = 12'h7d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h7c5;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7dd;
                          end else begin
                            out_r = 12'h7d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h7c5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3d7;
                          end else begin
                            out_r = 12'h3d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3d5;
                          end else begin
                            out_r = 12'h3c5;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f5;
                          end else begin
                            out_r = 12'h775;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h375;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h457;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h457;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h375;
                          end else begin
                            out_r = 12'h355;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h355;
                          end else begin
                            out_r = 12'h057;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfd3;
                          end else begin
                            out_r = 12'h3d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3d7;
                          end else begin
                            out_r = 12'h3d3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd3;
                          end else begin
                            out_r = 12'h1d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h1c7;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd3;
                          end else begin
                            out_r = 12'h1d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h1c7;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3d3;
                          end else begin
                            out_r = 12'h1d3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d3;
                          end else begin
                            out_r = 12'h1c3;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f7;
                          end else begin
                            out_r = 12'h177;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h177;
                          end else begin
                            out_r = 12'h173;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h157;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h354;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h157;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h354;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h173;
                          end else begin
                            out_r = 12'h153;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h153;
                          end else begin
                            out_r = 12'h350;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5ff;
                          end else begin
                            out_r = 12'h57f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h57f;
                          end else begin
                            out_r = 12'hd73;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5df;
                          end else begin
                            out_r = 12'h55f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55f;
                          end else begin
                            out_r = 12'h75c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5df;
                          end else begin
                            out_r = 12'h55f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55f;
                          end else begin
                            out_r = 12'h75c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd73;
                          end else begin
                            out_r = 12'hd53;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd53;
                          end else begin
                            out_r = 12'hf50;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf7c;
                          end else begin
                            out_r = 12'h77c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h77c;
                          end else begin
                            out_r = 12'h73c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf5c;
                          end else begin
                            out_r = 12'h75c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h75c;
                          end else begin
                            out_r = 12'h74c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf5c;
                          end else begin
                            out_r = 12'h75c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h75c;
                          end else begin
                            out_r = 12'h74c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h73c;
                          end else begin
                            out_r = 12'h71c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h71c;
                          end else begin
                            out_r = 12'h70c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f5;
                          end else begin
                            out_r = 12'h775;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h375;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h457;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h457;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h375;
                          end else begin
                            out_r = 12'h355;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h355;
                          end else begin
                            out_r = 12'h057;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h47f;
                          end else begin
                            out_r = 12'h477;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h477;
                          end else begin
                            out_r = 12'h437;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h45f;
                          end else begin
                            out_r = 12'h457;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h457;
                          end else begin
                            out_r = 12'h447;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h45f;
                          end else begin
                            out_r = 12'h457;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h457;
                          end else begin
                            out_r = 12'h447;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h437;
                          end else begin
                            out_r = 12'h417;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h417;
                          end else begin
                            out_r = 12'h407;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf57;
                          end else begin
                            out_r = 12'h757;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h717;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd57;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd57;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h547;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h717;
                          end else begin
                            out_r = 12'h517;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h517;
                          end else begin
                            out_r = 12'h507;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c7;
                          end else begin
                            out_r = 12'h747;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h747;
                          end else begin
                            out_r = 12'h743;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5c7;
                          end else begin
                            out_r = 12'h547;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h547;
                          end else begin
                            out_r = 12'h744;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5c7;
                          end else begin
                            out_r = 12'h547;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h547;
                          end else begin
                            out_r = 12'h744;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h743;
                          end else begin
                            out_r = 12'h543;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h543;
                          end else begin
                            out_r = 12'h740;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h35f;
                          end else begin
                            out_r = 12'h753;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h753;
                          end else begin
                            out_r = 12'h713;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h35d;
                          end else begin
                            out_r = 12'h751;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h751;
                          end else begin
                            out_r = 12'h741;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h35d;
                          end else begin
                            out_r = 12'h751;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h751;
                          end else begin
                            out_r = 12'h741;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h713;
                          end else begin
                            out_r = 12'h711;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h711;
                          end else begin
                            out_r = 12'h701;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c3;
                          end else begin
                            out_r = 12'h743;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h743;
                          end else begin
                            out_r = 12'h343;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c1;
                          end else begin
                            out_r = 12'h741;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h741;
                          end else begin
                            out_r = 12'h443;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c1;
                          end else begin
                            out_r = 12'h741;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h741;
                          end else begin
                            out_r = 12'h443;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h343;
                          end else begin
                            out_r = 12'h341;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h341;
                          end else begin
                            out_r = 12'h043;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfcf;
                          end else begin
                            out_r = 12'hfcd;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfcd;
                          end else begin
                            out_r = 12'hccf;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf4f;
                          end else begin
                            out_r = 12'hf4d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf4d;
                          end else begin
                            out_r = 12'hf0d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf4f;
                          end else begin
                            out_r = 12'hf4d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf4d;
                          end else begin
                            out_r = 12'hf0d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hccf;
                          end else begin
                            out_r = 12'hc4f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc4f;
                          end else begin
                            out_r = 12'hc0f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfcd;
                          end else begin
                            out_r = 12'hdcd;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hdcd;
                          end else begin
                            out_r = 12'hdcc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf4d;
                          end else begin
                            out_r = 12'hd4d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd4d;
                          end else begin
                            out_r = 12'hd0d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf4d;
                          end else begin
                            out_r = 12'hd4d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd4d;
                          end else begin
                            out_r = 12'hd0d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdcc;
                          end else begin
                            out_r = 12'hd4c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd4c;
                          end else begin
                            out_r = 12'hd0c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc7f;
                          end else begin
                            out_r = 12'hc5f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5f;
                          end else begin
                            out_r = 12'hc4f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc77;
                          end else begin
                            out_r = 12'hc57;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc57;
                          end else begin
                            out_r = 12'hc17;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc77;
                          end else begin
                            out_r = 12'hc57;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc57;
                          end else begin
                            out_r = 12'hc17;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc4f;
                          end else begin
                            out_r = 12'hc47;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc47;
                          end else begin
                            out_r = 12'hc07;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd7c;
                          end else begin
                            out_r = 12'hd5c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd5c;
                          end else begin
                            out_r = 12'hd4c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd4c;
                          end else begin
                            out_r = 12'h54c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h54c;
                          end else begin
                            out_r = 12'h50c;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcfd;
                          end else begin
                            out_r = 12'hcdd;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcdd;
                          end else begin
                            out_r = 12'hccd;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcf5;
                          end else begin
                            out_r = 12'hcd5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcd5;
                          end else begin
                            out_r = 12'h0dd;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcf5;
                          end else begin
                            out_r = 12'hcd5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcd5;
                          end else begin
                            out_r = 12'h0dd;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hccd;
                          end else begin
                            out_r = 12'hcc5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcc5;
                          end else begin
                            out_r = 12'h0cd;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdc7;
                          end else begin
                            out_r = 12'hdc5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hdc5;
                          end else begin
                            out_r = 12'hcc5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd47;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd47;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcc5;
                          end else begin
                            out_r = 12'hc45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc45;
                          end else begin
                            out_r = 12'h04d;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcfc;
                          end else begin
                            out_r = 12'hcdc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcdc;
                          end else begin
                            out_r = 12'hccc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4fc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'hcd0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4fc;
                          end else begin
                            out_r = 12'h4dc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4dc;
                          end else begin
                            out_r = 12'hcd0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hccc;
                          end else begin
                            out_r = 12'h4cc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4cc;
                          end else begin
                            out_r = 12'hcc0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7cc;
                          end else begin
                            out_r = 12'h4cd;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h4cd;
                          end else begin
                            out_r = 12'h4cc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h74c;
                          end else begin
                            out_r = 12'h44d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h44d;
                          end else begin
                            out_r = 12'hc41;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h74c;
                          end else begin
                            out_r = 12'h44d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h44d;
                          end else begin
                            out_r = 12'hc41;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4cc;
                          end else begin
                            out_r = 12'h44c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h44c;
                          end else begin
                            out_r = 12'hc40;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7cf;
                          end else begin
                            out_r = 12'h5cf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5cf;
                          end else begin
                            out_r = 12'h7cc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h74f;
                          end else begin
                            out_r = 12'h54f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h54f;
                          end else begin
                            out_r = 12'hd43;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h74f;
                          end else begin
                            out_r = 12'h54f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h54f;
                          end else begin
                            out_r = 12'hd43;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7cc;
                          end else begin
                            out_r = 12'h74c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h74c;
                          end else begin
                            out_r = 12'hf40;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hff0;
                          end else begin
                            out_r = 12'hfd0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hfd0;
                          end else begin
                            out_r = 12'hfc0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf70;
                          end else begin
                            out_r = 12'hf50;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf50;
                          end else begin
                            out_r = 12'hf10;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf70;
                          end else begin
                            out_r = 12'hf50;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf50;
                          end else begin
                            out_r = 12'hf10;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfc0;
                          end else begin
                            out_r = 12'hf40;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hf40;
                          end else begin
                            out_r = 12'hf00;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdc7;
                          end else begin
                            out_r = 12'hdc5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hdc5;
                          end else begin
                            out_r = 12'hcc5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd47;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd47;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcc5;
                          end else begin
                            out_r = 12'hc45;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc45;
                          end else begin
                            out_r = 12'h04d;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0fd;
                          end else begin
                            out_r = 12'h0dd;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0dd;
                          end else begin
                            out_r = 12'h0cd;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h07d;
                          end else begin
                            out_r = 12'h05d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h05d;
                          end else begin
                            out_r = 12'h01d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h07d;
                          end else begin
                            out_r = 12'h05d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h05d;
                          end else begin
                            out_r = 12'h01d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0cd;
                          end else begin
                            out_r = 12'h04d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h04d;
                          end else begin
                            out_r = 12'h00d;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd7c;
                          end else begin
                            out_r = 12'hd5c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd5c;
                          end else begin
                            out_r = 12'hd4c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57c;
                          end else begin
                            out_r = 12'h55c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h55c;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd4c;
                          end else begin
                            out_r = 12'h54c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h54c;
                          end else begin
                            out_r = 12'h50c;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf0d;
                          end else begin
                            out_r = 12'hd0d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd0d;
                          end else begin
                            out_r = 12'hd0c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h70d;
                          end else begin
                            out_r = 12'h50d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h50d;
                          end else begin
                            out_r = 12'hd01;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h70d;
                          end else begin
                            out_r = 12'h50d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h50d;
                          end else begin
                            out_r = 12'hd01;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd0c;
                          end else begin
                            out_r = 12'h50c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h50c;
                          end else begin
                            out_r = 12'hd00;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc7c;
                          end else begin
                            out_r = 12'hc5c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc5c;
                          end else begin
                            out_r = 12'hc4c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc74;
                          end else begin
                            out_r = 12'hc54;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc54;
                          end else begin
                            out_r = 12'hc14;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc74;
                          end else begin
                            out_r = 12'hc54;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc54;
                          end else begin
                            out_r = 12'hc14;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc4c;
                          end else begin
                            out_r = 12'hc44;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc44;
                          end else begin
                            out_r = 12'hc04;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc0f;
                          end else begin
                            out_r = 12'hd0c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd0c;
                          end else begin
                            out_r = 12'hc0c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc07;
                          end else begin
                            out_r = 12'hd04;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd04;
                          end else begin
                            out_r = 12'h10c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc07;
                          end else begin
                            out_r = 12'hd04;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd04;
                          end else begin
                            out_r = 12'h10c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc0c;
                          end else begin
                            out_r = 12'hc04;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc04;
                          end else begin
                            out_r = 12'h00c;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f7;
                          end else begin
                            out_r = 12'h7d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d7;
                          end else begin
                            out_r = 12'h7c7;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h777;
                          end else begin
                            out_r = 12'h757;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h357;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h777;
                          end else begin
                            out_r = 12'h757;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h357;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c7;
                          end else begin
                            out_r = 12'h747;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h747;
                          end else begin
                            out_r = 12'h347;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h75f;
                          end else begin
                            out_r = 12'h75d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h75d;
                          end else begin
                            out_r = 12'h74d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h715;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h757;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h715;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h74d;
                          end else begin
                            out_r = 12'h745;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h745;
                          end else begin
                            out_r = 12'h705;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f5;
                          end else begin
                            out_r = 12'h7d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h7d5;
                          end else begin
                            out_r = 12'h7c5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h751;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h775;
                          end else begin
                            out_r = 12'h755;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h751;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7c5;
                          end else begin
                            out_r = 12'h745;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h745;
                          end else begin
                            out_r = 12'h741;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hd55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd55;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h545;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h545;
                          end else begin
                            out_r = 12'h505;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h57f;
                          end else begin
                            out_r = 12'h57d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h57d;
                          end else begin
                            out_r = 12'h47d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h535;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h575;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h535;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h47d;
                          end else begin
                            out_r = 12'h475;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h475;
                          end else begin
                            out_r = 12'h435;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f5;
                          end else begin
                            out_r = 12'h5d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d5;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h455;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h455;
                          end else begin
                            out_r = 12'h055;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf71;
                          end else begin
                            out_r = 12'hd71;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd71;
                          end else begin
                            out_r = 12'hd70;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h375;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h135;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h375;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h135;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd70;
                          end else begin
                            out_r = 12'h174;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h174;
                          end else begin
                            out_r = 12'h134;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h1d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d5;
                          end else begin
                            out_r = 12'h1d4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h151;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h151;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d4;
                          end else begin
                            out_r = 12'h154;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h154;
                          end else begin
                            out_r = 12'h150;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f7;
                          end else begin
                            out_r = 12'h5d7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d7;
                          end else begin
                            out_r = 12'h7d4;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h553;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h577;
                          end else begin
                            out_r = 12'h557;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h557;
                          end else begin
                            out_r = 12'h553;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d4;
                          end else begin
                            out_r = 12'h754;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h754;
                          end else begin
                            out_r = 12'h750;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d3;
                          end else begin
                            out_r = 12'h5d3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d3;
                          end else begin
                            out_r = 12'h5c3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h753;
                          end else begin
                            out_r = 12'h553;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h513;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h753;
                          end else begin
                            out_r = 12'h553;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h513;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5c3;
                          end else begin
                            out_r = 12'h543;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h543;
                          end else begin
                            out_r = 12'h503;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5f5;
                          end else begin
                            out_r = 12'h5d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h5d5;
                          end else begin
                            out_r = 12'h4d5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h575;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h155;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4d5;
                          end else begin
                            out_r = 12'h455;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h455;
                          end else begin
                            out_r = 12'h055;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d7;
                          end else begin
                            out_r = 12'h1d5;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h1d5;
                          end else begin
                            out_r = 12'h1c5;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h115;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h157;
                          end else begin
                            out_r = 12'h155;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h155;
                          end else begin
                            out_r = 12'h115;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1c5;
                          end else begin
                            out_r = 12'h145;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h145;
                          end else begin
                            out_r = 12'h105;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf55;
                          end else begin
                            out_r = 12'hd55;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd55;
                          end else begin
                            out_r = 12'hd45;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h755;
                          end else begin
                            out_r = 12'h555;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h555;
                          end else begin
                            out_r = 12'h515;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd45;
                          end else begin
                            out_r = 12'h545;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h545;
                          end else begin
                            out_r = 12'h505;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd35;
                          end else begin
                            out_r = 12'hd15;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd15;
                          end else begin
                            out_r = 12'hd14;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd14;
                          end else begin
                            out_r = 12'h514;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h514;
                          end else begin
                            out_r = 12'h510;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h15f;
                          end else begin
                            out_r = 12'h15d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h15d;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h553;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h511;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h14d;
                          end else begin
                            out_r = 12'h541;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h541;
                          end else begin
                            out_r = 12'h501;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h13d;
                          end else begin
                            out_r = 12'h11d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h11d;
                          end else begin
                            out_r = 12'h01d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h531;
                          end else begin
                            out_r = 12'h511;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h511;
                          end else begin
                            out_r = 12'h111;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h531;
                          end else begin
                            out_r = 12'h511;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h511;
                          end else begin
                            out_r = 12'h111;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h01d;
                          end else begin
                            out_r = 12'h411;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h411;
                          end else begin
                            out_r = 12'h011;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd3f;
                          end else begin
                            out_r = 12'hd37;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd37;
                          end else begin
                            out_r = 12'h13f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd1f;
                          end else begin
                            out_r = 12'hd17;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd17;
                          end else begin
                            out_r = 12'hd07;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd1f;
                          end else begin
                            out_r = 12'hd17;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd17;
                          end else begin
                            out_r = 12'hd07;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h13f;
                          end else begin
                            out_r = 12'h11f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h11f;
                          end else begin
                            out_r = 12'h10f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1df;
                          end else begin
                            out_r = 12'h15f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h15f;
                          end else begin
                            out_r = 12'h11f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1dd;
                          end else begin
                            out_r = 12'h15d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h15d;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1dd;
                          end else begin
                            out_r = 12'h15d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h15d;
                          end else begin
                            out_r = 12'h14d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h11f;
                          end else begin
                            out_r = 12'h11d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h11d;
                          end else begin
                            out_r = 12'h10d;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf35;
                          end else begin
                            out_r = 12'h735;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h735;
                          end else begin
                            out_r = 12'h731;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf15;
                          end else begin
                            out_r = 12'h715;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h715;
                          end else begin
                            out_r = 12'h705;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf15;
                          end else begin
                            out_r = 12'h715;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h715;
                          end else begin
                            out_r = 12'h705;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h731;
                          end else begin
                            out_r = 12'h711;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h711;
                          end else begin
                            out_r = 12'h701;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d1;
                          end else begin
                            out_r = 12'h751;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h751;
                          end else begin
                            out_r = 12'h711;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h541;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h541;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h711;
                          end else begin
                            out_r = 12'h511;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h511;
                          end else begin
                            out_r = 12'h501;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f7;
                          end else begin
                            out_r = 12'h177;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h177;
                          end else begin
                            out_r = 12'h137;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h075;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1f5;
                          end else begin
                            out_r = 12'h175;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h175;
                          end else begin
                            out_r = 12'h075;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h137;
                          end else begin
                            out_r = 12'h135;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h135;
                          end else begin
                            out_r = 12'h035;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h53d;
                          end else begin
                            out_r = 12'h535;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h135;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h51d;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h415;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h51d;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h415;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h135;
                          end else begin
                            out_r = 12'h115;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h115;
                          end else begin
                            out_r = 12'h015;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7f0;
                          end else begin
                            out_r = 12'h770;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h770;
                          end else begin
                            out_r = 12'h730;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4f1;
                          end else begin
                            out_r = 12'h471;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h471;
                          end else begin
                            out_r = 12'h470;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h4f1;
                          end else begin
                            out_r = 12'h471;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h471;
                          end else begin
                            out_r = 12'h470;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h730;
                          end else begin
                            out_r = 12'h431;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h431;
                          end else begin
                            out_r = 12'h430;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc35;
                          end else begin
                            out_r = 12'h435;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h435;
                          end else begin
                            out_r = 12'h431;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc15;
                          end else begin
                            out_r = 12'h415;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h415;
                          end else begin
                            out_r = 12'h414;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc15;
                          end else begin
                            out_r = 12'h415;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h415;
                          end else begin
                            out_r = 12'h414;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h431;
                          end else begin
                            out_r = 12'h411;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h411;
                          end else begin
                            out_r = 12'h410;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd3d;
                          end else begin
                            out_r = 12'h53d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h53d;
                          end else begin
                            out_r = 12'hd31;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd1d;
                          end else begin
                            out_r = 12'h51d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h51d;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd1d;
                          end else begin
                            out_r = 12'h51d;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h51d;
                          end else begin
                            out_r = 12'h51c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd31;
                          end else begin
                            out_r = 12'hd11;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd11;
                          end else begin
                            out_r = 12'hd10;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h53d;
                          end else begin
                            out_r = 12'h535;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h535;
                          end else begin
                            out_r = 12'h135;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h51d;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h415;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h51d;
                          end else begin
                            out_r = 12'h515;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h515;
                          end else begin
                            out_r = 12'h415;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h135;
                          end else begin
                            out_r = 12'h115;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h115;
                          end else begin
                            out_r = 12'h015;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdf0;
                          end else begin
                            out_r = 12'hd70;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd70;
                          end else begin
                            out_r = 12'hd30;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd0;
                          end else begin
                            out_r = 12'hd50;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd50;
                          end else begin
                            out_r = 12'hd40;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hdd0;
                          end else begin
                            out_r = 12'hd50;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd50;
                          end else begin
                            out_r = 12'hd40;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd30;
                          end else begin
                            out_r = 12'hd10;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hd10;
                          end else begin
                            out_r = 12'hd00;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0f5;
                          end else begin
                            out_r = 12'h075;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h075;
                          end else begin
                            out_r = 12'h035;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0d5;
                          end else begin
                            out_r = 12'h055;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h055;
                          end else begin
                            out_r = 12'h045;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0d5;
                          end else begin
                            out_r = 12'h055;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h055;
                          end else begin
                            out_r = 12'h045;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h035;
                          end else begin
                            out_r = 12'h015;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h015;
                          end else begin
                            out_r = 12'h005;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h7d1;
                          end else begin
                            out_r = 12'h751;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h751;
                          end else begin
                            out_r = 12'h711;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h541;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h5d1;
                          end else begin
                            out_r = 12'h551;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h551;
                          end else begin
                            out_r = 12'h541;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h711;
                          end else begin
                            out_r = 12'h511;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h511;
                          end else begin
                            out_r = 12'h501;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf05;
                          end else begin
                            out_r = 12'h705;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h705;
                          end else begin
                            out_r = 12'h701;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd05;
                          end else begin
                            out_r = 12'h505;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h505;
                          end else begin
                            out_r = 12'h504;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hd05;
                          end else begin
                            out_r = 12'h505;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h505;
                          end else begin
                            out_r = 12'h504;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h701;
                          end else begin
                            out_r = 12'h501;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h501;
                          end else begin
                            out_r = 12'h500;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0d7;
                          end else begin
                            out_r = 12'h057;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h057;
                          end else begin
                            out_r = 12'h017;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d4;
                          end else begin
                            out_r = 12'h154;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h154;
                          end else begin
                            out_r = 12'h144;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h1d4;
                          end else begin
                            out_r = 12'h154;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h154;
                          end else begin
                            out_r = 12'h144;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h017;
                          end else begin
                            out_r = 12'h114;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h114;
                          end else begin
                            out_r = 12'h104;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h40f;
                          end else begin
                            out_r = 12'h407;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h407;
                          end else begin
                            out_r = 12'h007;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h50c;
                          end else begin
                            out_r = 12'h504;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h504;
                          end else begin
                            out_r = 12'h404;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h50c;
                          end else begin
                            out_r = 12'h504;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h504;
                          end else begin
                            out_r = 12'h404;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h007;
                          end else begin
                            out_r = 12'h104;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h104;
                          end else begin
                            out_r = 12'h004;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefe;
                          end else begin
                            out_r = 12'hebe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hebe;
                          end else begin
                            out_r = 12'he3e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heee;
                          end else begin
                            out_r = 12'heae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'hcae;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heee;
                          end else begin
                            out_r = 12'heae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'hcae;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he3e;
                          end else begin
                            out_r = 12'he2e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2e;
                          end else begin
                            out_r = 12'hc2e;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaf;
                          end else begin
                            out_r = 12'heab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heab;
                          end else begin
                            out_r = 12'he2b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heae;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he2b;
                          end else begin
                            out_r = 12'he2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hefa;
                          end else begin
                            out_r = 12'heba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heba;
                          end else begin
                            out_r = 12'he3a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heea;
                          end else begin
                            out_r = 12'heaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he3a;
                          end else begin
                            out_r = 12'he2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he2a;
                          end else begin
                            out_r = 12'he28;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hbaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaa;
                          end else begin
                            out_r = 12'hb2a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb2a;
                          end else begin
                            out_r = 12'ha2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2a;
                          end else begin
                            out_r = 12'ha0a;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haef;
                          end else begin
                            out_r = 12'haeb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haeb;
                          end else begin
                            out_r = 12'h2eb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haca;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2eb;
                          end else begin
                            out_r = 12'h2ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ea;
                          end else begin
                            out_r = 12'h2ca;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafa;
                          end else begin
                            out_r = 12'haba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haba;
                          end else begin
                            out_r = 12'h2ba;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ba;
                          end else begin
                            out_r = 12'h2aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2aa;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfe8;
                          end else begin
                            out_r = 12'hbe8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbe8;
                          end else begin
                            out_r = 12'hbe0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcea;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcea;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbe0;
                          end else begin
                            out_r = 12'h8e2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8e2;
                          end else begin
                            out_r = 12'h8c2;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h8ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ba;
                          end else begin
                            out_r = 12'h8b2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h8a8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h8a8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8b2;
                          end else begin
                            out_r = 12'h8a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8a2;
                          end else begin
                            out_r = 12'h8a0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafe;
                          end else begin
                            out_r = 12'habe;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habe;
                          end else begin
                            out_r = 12'heb2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'haac;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haee;
                          end else begin
                            out_r = 12'haae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haae;
                          end else begin
                            out_r = 12'haac;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heb2;
                          end else begin
                            out_r = 12'hea2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea2;
                          end else begin
                            out_r = 12'hea0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hebc;
                          end else begin
                            out_r = 12'habc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habc;
                          end else begin
                            out_r = 12'ha3c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heac;
                          end else begin
                            out_r = 12'haac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'ha8c;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heac;
                          end else begin
                            out_r = 12'haac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'ha8c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha3c;
                          end else begin
                            out_r = 12'ha2c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2c;
                          end else begin
                            out_r = 12'ha0c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hafa;
                          end else begin
                            out_r = 12'haba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haba;
                          end else begin
                            out_r = 12'h2ba;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haea;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2ba;
                          end else begin
                            out_r = 12'h2aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2aa;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h8ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ba;
                          end else begin
                            out_r = 12'h83a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h83a;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h82a;
                          end else begin
                            out_r = 12'h80a;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfaa;
                          end else begin
                            out_r = 12'hbaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbaa;
                          end else begin
                            out_r = 12'hb2a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heaa;
                          end else begin
                            out_r = 12'haaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haaa;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb2a;
                          end else begin
                            out_r = 12'ha2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha2a;
                          end else begin
                            out_r = 12'ha0a;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbca;
                          end else begin
                            out_r = 12'hb8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb8a;
                          end else begin
                            out_r = 12'hb82;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb82;
                          end else begin
                            out_r = 12'ha82;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha82;
                          end else begin
                            out_r = 12'ha80;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8af;
                          end else begin
                            out_r = 12'h8ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ab;
                          end else begin
                            out_r = 12'h82b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haac;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h82b;
                          end else begin
                            out_r = 12'ha28;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha28;
                          end else begin
                            out_r = 12'ha08;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8cb;
                          end else begin
                            out_r = 12'h88b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88b;
                          end else begin
                            out_r = 12'h08b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hac8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha88;
                          end else begin
                            out_r = 12'h888;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hac8;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha88;
                          end else begin
                            out_r = 12'h888;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h08b;
                          end else begin
                            out_r = 12'h288;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h288;
                          end else begin
                            out_r = 12'h088;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[3]) begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbcf;
                          end else begin
                            out_r = 12'hbce;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbce;
                          end else begin
                            out_r = 12'h8cf;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb8f;
                          end else begin
                            out_r = 12'hb8e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb8e;
                          end else begin
                            out_r = 12'hb0e;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb8f;
                          end else begin
                            out_r = 12'hb8e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb8e;
                          end else begin
                            out_r = 12'hb0e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8cf;
                          end else begin
                            out_r = 12'h88f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88f;
                          end else begin
                            out_r = 12'h80f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bf;
                          end else begin
                            out_r = 12'h8af;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8af;
                          end else begin
                            out_r = 12'h88f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bb;
                          end else begin
                            out_r = 12'h8ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ab;
                          end else begin
                            out_r = 12'h82b;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bb;
                          end else begin
                            out_r = 12'h8ab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ab;
                          end else begin
                            out_r = 12'h82b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h88f;
                          end else begin
                            out_r = 12'h88b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88b;
                          end else begin
                            out_r = 12'h80b;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfca;
                          end else begin
                            out_r = 12'heca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heca;
                          end else begin
                            out_r = 12'hec8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf8a;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he8a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf8a;
                          end else begin
                            out_r = 12'he8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he8a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hec8;
                          end else begin
                            out_r = 12'he88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he88;
                          end else begin
                            out_r = 12'he08;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heb8;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea8;
                          end else begin
                            out_r = 12'he88;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha28;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha28;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he88;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha88;
                          end else begin
                            out_r = 12'ha08;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fe;
                          end else begin
                            out_r = 12'h8ee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ee;
                          end else begin
                            out_r = 12'h8ce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h0ea;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fa;
                          end else begin
                            out_r = 12'h8ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ea;
                          end else begin
                            out_r = 12'h0ea;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ce;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ca;
                          end else begin
                            out_r = 12'h0ca;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hacb;
                          end else begin
                            out_r = 12'haca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha8b;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'h28a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha8b;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'h28a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ca;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88a;
                          end else begin
                            out_r = 12'h08a;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hef0;
                          end else begin
                            out_r = 12'hee0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hee0;
                          end else begin
                            out_r = 12'hec0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2f8;
                          end else begin
                            out_r = 12'h2e8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2e8;
                          end else begin
                            out_r = 12'h2e0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2f8;
                          end else begin
                            out_r = 12'h2e8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2e8;
                          end else begin
                            out_r = 12'h2e0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hec0;
                          end else begin
                            out_r = 12'h2c8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2c8;
                          end else begin
                            out_r = 12'h2c0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3ca;
                          end else begin
                            out_r = 12'h2ca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ca;
                          end else begin
                            out_r = 12'h2c8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h38a;
                          end else begin
                            out_r = 12'h28a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h28a;
                          end else begin
                            out_r = 12'h282;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h38a;
                          end else begin
                            out_r = 12'h28a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h28a;
                          end else begin
                            out_r = 12'h282;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2c8;
                          end else begin
                            out_r = 12'h288;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h288;
                          end else begin
                            out_r = 12'h280;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[2]) begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbcb;
                          end else begin
                            out_r = 12'hacb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hacb;
                          end else begin
                            out_r = 12'hbc8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb8b;
                          end else begin
                            out_r = 12'ha8b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8b;
                          end else begin
                            out_r = 12'ha83;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb8b;
                          end else begin
                            out_r = 12'ha8b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8b;
                          end else begin
                            out_r = 12'ha83;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbc8;
                          end else begin
                            out_r = 12'hb88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb88;
                          end else begin
                            out_r = 12'hb80;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hacb;
                          end else begin
                            out_r = 12'haca;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haca;
                          end else begin
                            out_r = 12'h8ca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha8b;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'h28a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha8b;
                          end else begin
                            out_r = 12'ha8a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha8a;
                          end else begin
                            out_r = 12'h28a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ca;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88a;
                          end else begin
                            out_r = 12'h08a;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbf0;
                          end else begin
                            out_r = 12'hbe0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbe0;
                          end else begin
                            out_r = 12'hbc0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbb0;
                          end else begin
                            out_r = 12'hba0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hba0;
                          end else begin
                            out_r = 12'hb20;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbb0;
                          end else begin
                            out_r = 12'hba0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hba0;
                          end else begin
                            out_r = 12'hb20;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbc0;
                          end else begin
                            out_r = 12'hb80;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb80;
                          end else begin
                            out_r = 12'hb00;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0fa;
                          end else begin
                            out_r = 12'h0ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0ea;
                          end else begin
                            out_r = 12'h0ca;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ba;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0aa;
                          end else begin
                            out_r = 12'h02a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ba;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0aa;
                          end else begin
                            out_r = 12'h02a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ca;
                          end else begin
                            out_r = 12'h08a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h08a;
                          end else begin
                            out_r = 12'h00a;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'heb8;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea8;
                          end else begin
                            out_r = 12'he88;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha28;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'ha28;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he88;
                          end else begin
                            out_r = 12'ha88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha88;
                          end else begin
                            out_r = 12'ha08;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf0a;
                          end else begin
                            out_r = 12'he0a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he0a;
                          end else begin
                            out_r = 12'he08;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb0a;
                          end else begin
                            out_r = 12'ha0a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha0a;
                          end else begin
                            out_r = 12'ha02;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hb0a;
                          end else begin
                            out_r = 12'ha0a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha0a;
                          end else begin
                            out_r = 12'ha02;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he08;
                          end else begin
                            out_r = 12'ha08;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha08;
                          end else begin
                            out_r = 12'ha00;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0be;
                          end else begin
                            out_r = 12'h0ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0ae;
                          end else begin
                            out_r = 12'h08e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8b2;
                          end else begin
                            out_r = 12'h8a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8a2;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8b2;
                          end else begin
                            out_r = 12'h8a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8a2;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h08e;
                          end else begin
                            out_r = 12'h882;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h882;
                          end else begin
                            out_r = 12'h802;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h20f;
                          end else begin
                            out_r = 12'h20e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h20e;
                          end else begin
                            out_r = 12'h00e;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha03;
                          end else begin
                            out_r = 12'ha02;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha02;
                          end else begin
                            out_r = 12'h202;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha03;
                          end else begin
                            out_r = 12'ha02;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha02;
                          end else begin
                            out_r = 12'h202;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h00e;
                          end else begin
                            out_r = 12'h802;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h802;
                          end else begin
                            out_r = 12'h002;
                          end
                        end
                      end
                    end
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
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcfb;
                          end else begin
                            out_r = 12'hceb;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hceb;
                          end else begin
                            out_r = 12'hccb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcbb;
                          end else begin
                            out_r = 12'hcab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcab;
                          end else begin
                            out_r = 12'h0af;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcbb;
                          end else begin
                            out_r = 12'hcab;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcab;
                          end else begin
                            out_r = 12'h0af;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hccb;
                          end else begin
                            out_r = 12'hc8b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc8b;
                          end else begin
                            out_r = 12'h08f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcaf;
                          end else begin
                            out_r = 12'heac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'heac;
                          end else begin
                            out_r = 12'he8c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcab;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea8;
                          end else begin
                            out_r = 12'he28;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcab;
                          end else begin
                            out_r = 12'hea8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hea8;
                          end else begin
                            out_r = 12'he28;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he8c;
                          end else begin
                            out_r = 12'he88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'he88;
                          end else begin
                            out_r = 12'he08;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbf8;
                          end else begin
                            out_r = 12'hbe8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hbe8;
                          end else begin
                            out_r = 12'hbc8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbb8;
                          end else begin
                            out_r = 12'hba8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hba8;
                          end else begin
                            out_r = 12'hba0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbb8;
                          end else begin
                            out_r = 12'hba8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hba8;
                          end else begin
                            out_r = 12'hba0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hbc8;
                          end else begin
                            out_r = 12'hb88;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb88;
                          end else begin
                            out_r = 12'hb80;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfa8;
                          end else begin
                            out_r = 12'hcaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcaa;
                          end else begin
                            out_r = 12'hc8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hba8;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hba8;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc8a;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88a;
                          end else begin
                            out_r = 12'h80a;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bf;
                          end else begin
                            out_r = 12'habc;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'habc;
                          end else begin
                            out_r = 12'h8bc;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bb;
                          end else begin
                            out_r = 12'hab8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'ha38;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bb;
                          end else begin
                            out_r = 12'hab8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'ha38;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8bc;
                          end else begin
                            out_r = 12'h8b8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8b8;
                          end else begin
                            out_r = 12'h838;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haf8;
                          end else begin
                            out_r = 12'hae8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hae8;
                          end else begin
                            out_r = 12'h8e8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'h2a8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'h2a8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8e8;
                          end else begin
                            out_r = 12'h8a8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8a8;
                          end else begin
                            out_r = 12'h0a8;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfb0;
                          end else begin
                            out_r = 12'hcb2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcb2;
                          end else begin
                            out_r = 12'hcb0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3b8;
                          end else begin
                            out_r = 12'h0ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0ba;
                          end else begin
                            out_r = 12'h03a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3b8;
                          end else begin
                            out_r = 12'h0ba;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0ba;
                          end else begin
                            out_r = 12'h03a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcb0;
                          end else begin
                            out_r = 12'h0b8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0b8;
                          end else begin
                            out_r = 12'h038;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0fa;
                          end else begin
                            out_r = 12'h0ea;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0ea;
                          end else begin
                            out_r = 12'h0e8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ba;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0aa;
                          end else begin
                            out_r = 12'h0a2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ba;
                          end else begin
                            out_r = 12'h0aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0aa;
                          end else begin
                            out_r = 12'h0a2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0e8;
                          end else begin
                            out_r = 12'h0a8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0a8;
                          end else begin
                            out_r = 12'h0a0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8fe;
                          end else begin
                            out_r = 12'h8ee;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ee;
                          end else begin
                            out_r = 12'h8ec;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h8ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'hca2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8be;
                          end else begin
                            out_r = 12'h8ae;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ae;
                          end else begin
                            out_r = 12'hca2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8ec;
                          end else begin
                            out_r = 12'h8ac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8ac;
                          end else begin
                            out_r = 12'hca0;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfe0;
                          end else begin
                            out_r = 12'hce2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hce2;
                          end else begin
                            out_r = 12'hcc2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfa0;
                          end else begin
                            out_r = 12'hca2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hca2;
                          end else begin
                            out_r = 12'hc22;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfa0;
                          end else begin
                            out_r = 12'hca2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hca2;
                          end else begin
                            out_r = 12'hc22;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hcc2;
                          end else begin
                            out_r = 12'hc82;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc82;
                          end else begin
                            out_r = 12'hc02;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'haf8;
                          end else begin
                            out_r = 12'hae8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hae8;
                          end else begin
                            out_r = 12'h8e8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'h2a8;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hab8;
                          end else begin
                            out_r = 12'haa8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa8;
                          end else begin
                            out_r = 12'h2a8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8e8;
                          end else begin
                            out_r = 12'h8a8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8a8;
                          end else begin
                            out_r = 12'h0a8;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0eb;
                          end else begin
                            out_r = 12'h2e8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2e8;
                          end else begin
                            out_r = 12'h2c8;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ab;
                          end else begin
                            out_r = 12'h2a8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a8;
                          end else begin
                            out_r = 12'h228;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0ab;
                          end else begin
                            out_r = 12'h2a8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a8;
                          end else begin
                            out_r = 12'h228;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2c8;
                          end else begin
                            out_r = 12'h288;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h288;
                          end else begin
                            out_r = 12'h208;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hfa8;
                          end else begin
                            out_r = 12'hcaa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hcaa;
                          end else begin
                            out_r = 12'hc8a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hba8;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hba8;
                          end else begin
                            out_r = 12'h8aa;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h8aa;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc8a;
                          end else begin
                            out_r = 12'h88a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h88a;
                          end else begin
                            out_r = 12'h80a;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc3a;
                          end else begin
                            out_r = 12'hc2a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hc2a;
                          end else begin
                            out_r = 12'hc28;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h83a;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h82a;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h83a;
                          end else begin
                            out_r = 12'h82a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h82a;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc28;
                          end else begin
                            out_r = 12'h828;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h828;
                          end else begin
                            out_r = 12'h820;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0af;
                          end else begin
                            out_r = 12'h2ac;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2ac;
                          end else begin
                            out_r = 12'h28c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8a3;
                          end else begin
                            out_r = 12'haa0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa0;
                          end else begin
                            out_r = 12'ha20;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h8a3;
                          end else begin
                            out_r = 12'haa0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'haa0;
                          end else begin
                            out_r = 12'ha20;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h28c;
                          end else begin
                            out_r = 12'ha80;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha80;
                          end else begin
                            out_r = 12'ha00;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h23c;
                          end else begin
                            out_r = 12'h22c;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h22c;
                          end else begin
                            out_r = 12'h02c;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha30;
                          end else begin
                            out_r = 12'ha20;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha20;
                          end else begin
                            out_r = 12'h220;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'ha30;
                          end else begin
                            out_r = 12'ha20;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha20;
                          end else begin
                            out_r = 12'h220;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h02c;
                          end else begin
                            out_r = 12'h820;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h820;
                          end else begin
                            out_r = 12'h020;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            if (in[11]) begin
              if (in[10]) begin
                if (in[3]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h33f;
                          end else begin
                            out_r = 12'hb33;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb33;
                          end else begin
                            out_r = 12'h333;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h32f;
                          end else begin
                            out_r = 12'hb23;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb23;
                          end else begin
                            out_r = 12'hb03;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h32f;
                          end else begin
                            out_r = 12'hb23;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'hb23;
                          end else begin
                            out_r = 12'hb03;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h333;
                          end else begin
                            out_r = 12'h323;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h323;
                          end else begin
                            out_r = 12'h303;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e3;
                          end else begin
                            out_r = 12'h3a3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a3;
                          end else begin
                            out_r = 12'h323;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e2;
                          end else begin
                            out_r = 12'h3a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a2;
                          end else begin
                            out_r = 12'h382;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e2;
                          end else begin
                            out_r = 12'h3a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a2;
                          end else begin
                            out_r = 12'h382;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h323;
                          end else begin
                            out_r = 12'h322;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h322;
                          end else begin
                            out_r = 12'h302;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he33;
                          end else begin
                            out_r = 12'h23b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h23b;
                          end else begin
                            out_r = 12'h233;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he23;
                          end else begin
                            out_r = 12'h22b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h22b;
                          end else begin
                            out_r = 12'h328;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he23;
                          end else begin
                            out_r = 12'h22b;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h22b;
                          end else begin
                            out_r = 12'h328;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h233;
                          end else begin
                            out_r = 12'h223;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h223;
                          end else begin
                            out_r = 12'h320;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3f0;
                          end else begin
                            out_r = 12'h3b0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3b0;
                          end else begin
                            out_r = 12'h330;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e0;
                          end else begin
                            out_r = 12'h3a0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a0;
                          end else begin
                            out_r = 12'h380;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e0;
                          end else begin
                            out_r = 12'h3a0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a0;
                          end else begin
                            out_r = 12'h380;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h330;
                          end else begin
                            out_r = 12'h320;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h320;
                          end else begin
                            out_r = 12'h300;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[3]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2f3;
                          end else begin
                            out_r = 12'h2b3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2b3;
                          end else begin
                            out_r = 12'h233;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2f2;
                          end else begin
                            out_r = 12'h2b2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2b2;
                          end else begin
                            out_r = 12'h0b2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2f2;
                          end else begin
                            out_r = 12'h2b2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2b2;
                          end else begin
                            out_r = 12'h0b2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h233;
                          end else begin
                            out_r = 12'h232;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h232;
                          end else begin
                            out_r = 12'h032;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h23e;
                          end else begin
                            out_r = 12'ha32;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha32;
                          end else begin
                            out_r = 12'h232;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h22e;
                          end else begin
                            out_r = 12'ha22;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha22;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h22e;
                          end else begin
                            out_r = 12'ha22;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha22;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h232;
                          end else begin
                            out_r = 12'h222;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h222;
                          end else begin
                            out_r = 12'h022;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e2;
                          end else begin
                            out_r = 12'h3a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a2;
                          end else begin
                            out_r = 12'h322;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2e2;
                          end else begin
                            out_r = 12'h2a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a2;
                          end else begin
                            out_r = 12'h282;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2e2;
                          end else begin
                            out_r = 12'h2a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a2;
                          end else begin
                            out_r = 12'h282;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h322;
                          end else begin
                            out_r = 12'h222;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h222;
                          end else begin
                            out_r = 12'h202;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf02;
                          end else begin
                            out_r = 12'h30a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h30a;
                          end else begin
                            out_r = 12'h302;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he02;
                          end else begin
                            out_r = 12'h20a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h20a;
                          end else begin
                            out_r = 12'h208;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'he02;
                          end else begin
                            out_r = 12'h20a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h20a;
                          end else begin
                            out_r = 12'h208;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h302;
                          end else begin
                            out_r = 12'h202;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h202;
                          end else begin
                            out_r = 12'h200;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[10]) begin
                if (in[3]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf32;
                          end else begin
                            out_r = 12'h33a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h33a;
                          end else begin
                            out_r = 12'h332;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf22;
                          end else begin
                            out_r = 12'h32a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h32a;
                          end else begin
                            out_r = 12'h30a;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hf22;
                          end else begin
                            out_r = 12'h32a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h32a;
                          end else begin
                            out_r = 12'h30a;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h332;
                          end else begin
                            out_r = 12'h322;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h322;
                          end else begin
                            out_r = 12'h302;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3e2;
                          end else begin
                            out_r = 12'h3a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3a2;
                          end else begin
                            out_r = 12'h322;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2e2;
                          end else begin
                            out_r = 12'h2a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a2;
                          end else begin
                            out_r = 12'h282;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2e2;
                          end else begin
                            out_r = 12'h2a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a2;
                          end else begin
                            out_r = 12'h282;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h322;
                          end else begin
                            out_r = 12'h222;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h222;
                          end else begin
                            out_r = 12'h202;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h23e;
                          end else begin
                            out_r = 12'ha32;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha32;
                          end else begin
                            out_r = 12'h232;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h22e;
                          end else begin
                            out_r = 12'ha22;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha22;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h22e;
                          end else begin
                            out_r = 12'ha22;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha22;
                          end else begin
                            out_r = 12'h822;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h232;
                          end else begin
                            out_r = 12'h222;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h222;
                          end else begin
                            out_r = 12'h022;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0f2;
                          end else begin
                            out_r = 12'h0b2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0b2;
                          end else begin
                            out_r = 12'h032;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0e2;
                          end else begin
                            out_r = 12'h0a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0a2;
                          end else begin
                            out_r = 12'h082;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0e2;
                          end else begin
                            out_r = 12'h0a2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0a2;
                          end else begin
                            out_r = 12'h082;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h032;
                          end else begin
                            out_r = 12'h022;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h022;
                          end else begin
                            out_r = 12'h002;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[3]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h3f0;
                          end else begin
                            out_r = 12'h3b0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h3b0;
                          end else begin
                            out_r = 12'h330;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0f2;
                          end else begin
                            out_r = 12'h0b2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0b2;
                          end else begin
                            out_r = 12'h0b0;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0f2;
                          end else begin
                            out_r = 12'h0b2;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0b2;
                          end else begin
                            out_r = 12'h0b0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h330;
                          end else begin
                            out_r = 12'h032;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h032;
                          end else begin
                            out_r = 12'h030;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc32;
                          end else begin
                            out_r = 12'h03a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h03a;
                          end else begin
                            out_r = 12'h032;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc22;
                          end else begin
                            out_r = 12'h02a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h02a;
                          end else begin
                            out_r = 12'h028;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'hc22;
                          end else begin
                            out_r = 12'h02a;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h02a;
                          end else begin
                            out_r = 12'h028;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h032;
                          end else begin
                            out_r = 12'h022;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h022;
                          end else begin
                            out_r = 12'h020;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h0e3;
                          end else begin
                            out_r = 12'h0a3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h0a3;
                          end else begin
                            out_r = 12'h023;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2e0;
                          end else begin
                            out_r = 12'h2a0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a0;
                          end else begin
                            out_r = 12'h280;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h2e0;
                          end else begin
                            out_r = 12'h2a0;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h2a0;
                          end else begin
                            out_r = 12'h280;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h023;
                          end else begin
                            out_r = 12'h220;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h220;
                          end else begin
                            out_r = 12'h200;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h00f;
                          end else begin
                            out_r = 12'h803;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h803;
                          end else begin
                            out_r = 12'h003;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h20c;
                          end else begin
                            out_r = 12'ha00;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha00;
                          end else begin
                            out_r = 12'h800;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h20c;
                          end else begin
                            out_r = 12'ha00;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'ha00;
                          end else begin
                            out_r = 12'h800;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 12'h003;
                          end else begin
                            out_r = 12'h200;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 12'h200;
                          end else begin
                            out_r = 12'h000;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  assign out = out_r;
endmodule

`include "/home/b10507053/ALS_Final_Project/student/work/reverse_unknown_20260603_1812/ex285/verilog/ex285_unknown_12x12_decision_tree_greedy.v"

module ex285_uc_boundary_alt_0_2_9_11_boundary_ex285_r77_route_decode_highfanout(in, route_key);
  input [11:0] in;
  output [5:0] route_key;
  assign route_key[0] = in[4] | in[5];
  assign route_key[1] = in[4] & in[5];
  assign route_key[2] = in[6] | in[7];
  assign route_key[3] = in[6] & in[7];
  assign route_key[4] = ^in[3:0];
  assign route_key[5] = ^in[11:8];
endmodule

module ex285_uc_boundary_alt_0_2_9_11_boundary_ex285_r77_tree_residual_helper(in, route_key, out);
  input [11:0] in;
  input [5:0] route_key;
  output [11:0] out;
  wire guard_zero = ^(route_key & ~route_key);
  wire [11:0] residual_in = in ^ {12{guard_zero}};
  ex285_unknown_12x12_decision_tree_greedy u_tree(.in(residual_in), .out(out));
endmodule

module ex285_uc_boundary_alt_0_2_9_11_boundary_ex285_r77_tree_route_decode_helper_boundary(in, out);
  input [11:0] in;
  output [11:0] out;
  (* keep *) wire [5:0] route_key;
  ex285_uc_boundary_alt_0_2_9_11_boundary_ex285_r77_route_decode_highfanout u_key(.in(in), .route_key(route_key));
  ex285_uc_boundary_alt_0_2_9_11_boundary_ex285_r77_tree_residual_helper u_residual(.in(in), .route_key(route_key), .out(out));
endmodule

module ex285_uc_boundary_alt_0_2_9_11(in, out);
  input [11:0] in;
  output [11:0] out;
  wire [11:0] base_out;
  ex285_uc_boundary_alt_0_2_9_11_base_ex285_unknown_12x12_decision_tree_greedy u_base(.in(in), .out(base_out));
  wire [11:0] boundary_out;
  ex285_uc_boundary_alt_0_2_9_11_boundary_ex285_r77_tree_route_decode_helper_boundary u_boundary(.in(in), .out(boundary_out));
  assign out[0] = boundary_out[0];
  assign out[1] = base_out[1];
  assign out[2] = boundary_out[2];
  assign out[3] = base_out[3];
  assign out[4] = base_out[4];
  assign out[5] = base_out[5];
  assign out[6] = base_out[6];
  assign out[7] = base_out[7];
  assign out[8] = base_out[8];
  assign out[9] = boundary_out[9];
  assign out[10] = base_out[10];
  assign out[11] = boundary_out[11];
endmodule

module ex285_ubb_current_boundary_and_norm(in, out);
  input [11:0] in;
  output [11:0] out;
  ex285_uc_boundary_alt_0_2_9_11 u_src(.in(in), .out(out));
endmodule
